Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id S61qNAKVqWnYAQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:36:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A5C213983
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0420E10E2B6;
	Thu,  5 Mar 2026 14:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRAe/0Eq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8xeCI8I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5378410E2B6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:36:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625CN1QU720018
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 14:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=M9kOZ2oA46DkDMvPSWIl1WyV
 VW6X0vR4sjQ/X/1ot3U=; b=PRAe/0EqEiMjUGnh75oi1rvpcTT0bLSMo3s9Mvxc
 zmQo3yUTTpMYkV+Qnv3XTcQsEV3nq/TqKC2oJCwnbWvi996MpDVwUpc2p+VGUX8d
 bPZikNWVwBCyiT6dpp9QvGWuKlBTRq36joBp/7+CAlOZ7xU6y+n3ERgQ7S/zrHkJ
 574GukIy8tl90hWjHr47GEEw4USQGd4A3Trh9LIbmvgXWQc5hPK+fsZDo+hrqy27
 fOv+tmtvWyYT+qT5BC24UpTdG9vJXz2YqEMWvex2MVwkRPN2OEcr1vKnUDioRQdp
 cGnmlVXHFBmw6zL7YTTNr5cCx1sUb+fUgoju7D9Hb7MVHQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srgd6p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 14:36:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-89a08e6cd15so212767666d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 06:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721405; x=1773326205;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M9kOZ2oA46DkDMvPSWIl1WyVVW6X0vR4sjQ/X/1ot3U=;
 b=h8xeCI8IpV8w9TKIfzmpSHUSqeN9wK3z1bxrc+jbA23dBSWTG+S0YQ6jsYk+kloK5H
 EKn+AdIa1o9nZDr5/6OheYU0qq4B1zmVCah/lF7ZLMuQh5dzanl+JyfvJY9kqcnfFPuH
 RkRx/BOZlvTBGUVH013edfTjDihjwf5S+I67rz5qqj3uBUAwbY5vxThc7a8T1/9oJbXi
 XCTKh4Hx/GEkBAyqjoZ8e3ICZ2DftEqOY7wi9i6GxcSgVSIWFqBermo+0R7eMM4ocYif
 PET1CxctDiImjLL+wjnp9cCve61JyOTHfbPUG+mPtipaMybuoZZlNcBbl3V8CazGmIaM
 Ez0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721405; x=1773326205;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M9kOZ2oA46DkDMvPSWIl1WyVVW6X0vR4sjQ/X/1ot3U=;
 b=Yf/bNFELLDWRYMMY3KUjR0REKHSve48LxvSG8ac4Bv8QxIv+l21I1z2HzJoKxQYyop
 cdK8wvOywO1B4TzY6ad/GYfnBL6CU8DbnMMAn4Lahequtf0A10J8S9I8nS6vU3kWsyEy
 HeJFnQilvrLpbpj//hwdK5avtIXTXjuVPYQcghRhZxssD9ICd/IDColcuX99mTb2rQJ1
 fDn0mj2/cAwugN6MQskO4GnGE674lLOoRLojhPmDbLUOglmAVxJDKj2eDk0eoavBI3dV
 SYqxvioS+y5cJw8v183g6gzEk//zCk0G04kOswIl3RRSmyoLkKCsXyN+q0uvvsUYjGzM
 adhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkmp0xcTpVepSQ0Uun5ySytylr3frdgX/RerNIVL4sG1C2CZvfRlQP8X6EvkdHB8cEGQ/ng58CkIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5oMPrs3wCJLJdAt7MxKAwNzHj2Hq2IBjCRKBX6jnG4fFRt6WG
 4UYIzH0negOhWbIn3EKZ3I/KudmI3W9GJR5WfhUK5bbGohfGRIdT+nz3Xv8AiQyVajPnanBaurs
 JIgeg8ZIeFL3dxz3I5EGoGaROIkkrc8nEsjRXaK+DGx1SAvUUX8eyNojtioePL/MfX54I1fU=
X-Gm-Gg: ATEYQzxl8AIGCsQHi1dKmi5KHP4Z0vLbl3EPy1BnGyrtIEs/1wUIQdMMUpTZ6o5AhMY
 G8IudLiewfbn1K7/VlA1DKMCQd0aU12nn7jCn2wYZxUrRgJ84fFRYyFCF1khhWL2+RWuCmZ20GO
 +JGx/acuFmXtiwzgOFQ1pk9MLwOEzni2anjEuHnNBbTTCP4nPYRmX2Xna+ckKTPThraZqOuwyDu
 A63ouH8yqR3gnq1MORELkQ3QYA21u2XONuO0Wl5Vf/rPJfTtnwNji8ydMwcSd9mx81yUjyw508u
 ARESFhaI0aKQ4NPWFaWs46MNV17qVn6DsN1HN1aGHGKi4q9LwOpg8ZA5uHgKTRAp/siMXlVVg5D
 DxHOKdhJl+tVpyowZcme6xj2WzEkuiGsQ/pJetJoixho3F7XYW8gOccifNfIcbXjbBi26zTJEhk
 vjQgAYOeOGOSlVO/8OEgfF6C987a11h4eWmTM=
X-Received: by 2002:a05:620a:3949:b0:8cb:678b:4877 with SMTP id
 af79cd13be357-8cd5afb739dmr742168985a.57.1772721404769; 
 Thu, 05 Mar 2026 06:36:44 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:678b:4877 with SMTP id
 af79cd13be357-8cd5afb739dmr742163685a.57.1772721404214; 
 Thu, 05 Mar 2026 06:36:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2ffe02bsm41758591fa.27.2026.03.05.06.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:36:43 -0800 (PST)
Date: Thu, 5 Mar 2026 16:36:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm/msm/dpu: Correct the SA8775P
 intr_underrun/intr_underrun index
Message-ID: <ulrmxcsncz5j7hbi446q33ngk63pfuja4pjvbg6zcg7c6kmn5c@ltguvvq6nsda>
References: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
 <20260305-mdss_catalog-v5-2-06678ac39ac7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-mdss_catalog-v5-2-06678ac39ac7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a994fd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s80QRqCtEMuw_QvzVh8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: u0Y0C7j_WdZGE1m2oj6kDorB-bVyKNHz
X-Proofpoint-ORIG-GUID: u0Y0C7j_WdZGE1m2oj6kDorB-bVyKNHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX29/F3oOS/lbj
 vOlPtQG/W0sxCim9OMI456uOqrfKO+AqCD4s0RiBmpsvGhRdT0Omcj1SNOzUnoJ24YlVMVBPDU0
 hT2czAgJ5XOkp5g7UBJdkYLXi7Z6nKI/2/BKzzYHYsYoP1wBVhd+v03GLR5ib3AFx+DdcxXf/xG
 dw8cOGjgh1N7LemSuCk75r3zK1sEpdjmPKJ7qneEPQR5pKTHHNsg5PpwNvIpaZt/qHAznbbitZV
 3SCf9ib3XEQ4072YV6RLuUF1aQyJ6+5EmGNEYj8IJErK054waha2lnBkQwefZmk7vOHqBHSIvJ7
 2A1J/PLLYRaosZpzd21hKMn4RaRB41O67CiCdi6Geg7f3bnF7QidorMPoirEFszEb4y6c9NvRNp
 099LT7qdjcMJVZoO9dwNhAxd8OHLBSo8qj1v5FV0L46RF6q9EadIW2idW1P05Dfx8xmZNGiFxuD
 MXO+4HRvI+eveLES0Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
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
X-Rspamd-Queue-Id: 50A5C213983
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_mahap@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 06:17:07PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The intr_underrun and intr_vsync indices have been swapped, just simply
> corrects them.
> 
> Cc: stable@vger.kernel.org
> Fixes: b139c80d181c ("drm/msm/dpu: Add SA8775P support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
