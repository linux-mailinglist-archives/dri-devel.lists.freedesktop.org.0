Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BIfeAFgYoWlDqQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 05:06:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F471B27E4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 05:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B822E10EA2F;
	Fri, 27 Feb 2026 04:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WU1fUeuE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KB4Y4c0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC6010E188
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:06:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R2KQhU2982835
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VdQjHF+RYM7rSSLaFwhLHU5/
 U+N3CFTxtk5vUawx9aU=; b=WU1fUeuEZi2nZWztsaD8Isc6submU+vTizHM0Nrh
 ZwEdt0mouZWw0y0gQN2m1K3JLpCqP6kh/QNnbmNW2ToliDbNFZZ2SIJ66atSoonx
 imB7dRoxB9OSI75LJSlhUjcRJqE5sDGLvzP5GU0EAlVxE2T+4TAxk8rIB6S0CYxR
 zE+hG3lu6Ft23SRuROKjVl0i+8wqgyuENgndQ830k9OGdGujdywClUGMkMimVTtS
 54T615IJV5C7wPW5hibVLHFRqpUCp7NmyiNTRhij1JZ2BtLDCcDvmhnPm0RjIIwB
 zuj7I1T/ZfwzGP2YbEjhoAgweMtKbq3stEAjlM0GIvN9YQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v3km8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:06:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c71156fe09so1118940385a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772165203; x=1772770003;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VdQjHF+RYM7rSSLaFwhLHU5/U+N3CFTxtk5vUawx9aU=;
 b=KB4Y4c0Z355MdTTYZLgMwUukTICC8CuxlgZzcfyhuv5nvgYUJX85gmSTYxUx4n1rYv
 Pc1EqtcaVp4VsD8PUBcFGo2t62q+xwD1C6eeiIZWYhAmUtEEDDeDfUuB3PXupuokji/N
 6gQddfPM7kB9/WtFQr81i6YFl0JLCPC/1YUVcfmK88kJSrzZLyK/KBz/CfsRF+E8tVgU
 MZ/qBEWnhvX3KONcrf5L9GR5ugqKeKHeKadLhnnuar5ddQl34NQk7VYTtR31R5sETlO4
 xenbppyRwERHf8Z82BJN6bBlMWNgwqIREn77eT9/NsPfLDF9qk5WyKikgTZ1gss9XIp9
 ctvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772165203; x=1772770003;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdQjHF+RYM7rSSLaFwhLHU5/U+N3CFTxtk5vUawx9aU=;
 b=gxRff+0lOR/ePN70UYVxhUNOlB2r0s3uE/A9MlH/HMthvmvDHlcv0iVWhokhGNA9eg
 DzSl3AyChf8IJ2hOAylNWuISJsN6oRODDukYHgzBVwx+qjO78Ushl4hWQacjaYj4U2DI
 hscdD88C1k2AiYOBPU70B145bLVc8phuioVgb4Iy3WqGRWykKPx38RL3kJr1QO0irjvr
 0edh4gbD4CfHk0deA/PmOk3LJK8B7MAd8Tyvo/fca0bcl+ykx5Y/28RDdD3LuuQoOskE
 yGW793uxbyQG4zzbmIxR5Si1wV6FV4/U1Nc++7ltWxPpzc4V5pd0aHnC77UKSj3CAYDP
 4P2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfeCzc9Ib07VDoSkBrEYeeMpAt+YWG31CDas38Q8ORTYnTAmhCEnb3Gvk1QTCoi2w7G+BUtsgWOxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHI9ZItEmCPQjIIkQ7jWp8flE9rJEhnMaSLZZA/lod6NFUxhq4
 MT/dJD/tB3Kr1c3TanWsLjcL+GYpU3EB6kjIwqzzNb8SV5uuj9khOILf0yoeK/qZIElnOLDnHhu
 2GyIweWMwxJtbpwF+gwoCmFxhtVj/DvJ2XI8udhfJJ1+Rl7pdWMa7JYJ2SDcszPRVHOQjWr4=
X-Gm-Gg: ATEYQzx9glzbKqUN2siAveaKABQa6opGNLVvyeGFklwCLL8WIA4MKondJqdPnPS5VKO
 HuW29HE3oCKCfHPjxh0R/DW98Q5OUgnVEQiqE6kc81Ra/usBPtk6hD0vg0D4lR1Ll3mAVhzRDDX
 N/eiGh3a8I3vB06Pw9OjXWSfnj/fwgNKxtmmWGLBxpDpzCbwAzqHdOJG0lJycnEUWVHTjytraBl
 RrUul2aVnQb1GNMbGD1DB+eNCDySB44kNlJZAJmg6AY1t1El6Mu8+Miy74uBfIVjxhJQQZBknDs
 iTFGRFebYN/3oYc5XRD5JltDoaT04CNn8LRkVJ75yS9ALAqGzd7jxXJ+eTAjzV/eOhb5/0uJfAP
 0xZTPMMbJKC3oqpk1Pkf/2CfAg4o/trEtTEDyP7iQzXrEerUFl+cEjxpL3yFC6LbP269boEaj2J
 4AThH5j4z3L2P1u3SvcVdod+QI/BN2FESuWi8=
X-Received: by 2002:a05:620a:d85:b0:8cb:43a3:8b6f with SMTP id
 af79cd13be357-8cbc8e1afe4mr166989985a.67.1772165202902; 
 Thu, 26 Feb 2026 20:06:42 -0800 (PST)
X-Received: by 2002:a05:620a:d85:b0:8cb:43a3:8b6f with SMTP id
 af79cd13be357-8cbc8e1afe4mr166987785a.67.1772165202451; 
 Thu, 26 Feb 2026 20:06:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f3016de6sm11487841fa.38.2026.02.26.20.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 20:06:41 -0800 (PST)
Date: Fri, 27 Feb 2026 06:06:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: Fix dma_free_attrs() buffer size
Message-ID: <n4pb4fvxp5toiy3ozrzozml75nkhgb3v4vmljpcx4oyp7kkgic@dhzvtsxhwode>
References: <20260226095714.12126-2-fourier.thomas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226095714.12126-2-fourier.thomas@gmail.com>
X-Proofpoint-ORIG-GUID: MreO8o1jk989ZaTPQuMhMYbZUA60ysRo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOCBTYWx0ZWRfXw3DlicB34cuJ
 300MxFo/YISQmRAYN83vof57QHECw6ITSVDVdW+OUulm+5L043mWTyY9P/tBWFzVDmP2FsqayQ6
 cpBogmLZVtcDVi+k26MaBYpdr+fLGBFjBOsMgSTnsKCrsLhTbTpmsWTqNErw7RrchVsE2MmwKdV
 EhNHs+jeIArUoQY4DcFGe7bBy/qf+kf5vPdt94QsJfyWEoCYPhiUkwHejyp86TbRn6Y9/m2Avy5
 Xhq6WvR4d2U0LysL6N0wSbiUDBqdU3N87UsFdf34Ix3IuDKsdjZU8V2e7RLfGZrSkNLiFUVUzRO
 EiXCmYHZNb1+5+99nNHhVUwWARN13RnFOgeCn1D19Lep0SqAq5nQV89JMM5gB/2yFx0YqHiuZCk
 MALhpGsUb9C1b8dXq82AqiC+pocURb77iWz1AjwFhjGZSvgZxDhGdmreRsSUls628b5AzemGtQL
 YqPR05mlUycolGcPkkA==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a11853 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yVL_GmymfDenR9L41UUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MreO8o1jk989ZaTPQuMhMYbZUA60ysRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270028
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fourier.thomas@gmail.com,m:stable@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:fourierthomas@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,marek.ca,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 57F471B27E4
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:57:11AM +0100, Thomas Fourier wrote:
> The gpummu->table buffer is alloc'd with size TABLE_SIZE + 32 in
> a2xx_gpummu_new() but freed with size TABLE_SIZE in
> a2xx_gpummu_destroy().
> 
> Change the free size to match the allocation.
> 
> Fixes: c2052a4e5c99 ("drm/msm: implement a2xx mmu")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
> v1->v2:
>   - Fix subject prefix
> 
>  drivers/gpu/drm/msm/adreno/a2xx_gpummu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
