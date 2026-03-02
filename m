Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKyfA6yEpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:38:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E081D8C05
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42BD10E4C2;
	Mon,  2 Mar 2026 12:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mndi4cHO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeiFD8ND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F3010E4C2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:37:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229Eq843630813
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xj+RXedbXE9FhFvC6sdIgsQRafMTshNF24rbEDu3JPo=; b=Mndi4cHOsnQp2QMx
 sS5oQUtXOOLsfU0Zi4cS2sjaSMtXS16OgvGYsrAFyo2Wg4g1SouwiaB03EgST6zN
 8+9R0OF+GucZx5YGAjj7mG+mM5ZEaw5VYGvdjl+tNJYjHapZ+Dqa+L1ImJZHYo8c
 7Ab//dwpLglBG2oALJzeJUNVjutvLPy9SY9nGavJ2TU6y1hmb+K8OAD32VkiX1q6
 4QjBuJPyXbjVkWfNDTM++iiMy3KQnDu6I0l8K9pYlI3B6i2l+pYxamozCy84kbd3
 P9CGJrmWy73vxvlywqaitqr3EKVRyzgwyL8+lnAS8+mg1Y/DNT4hXVhDe6LKXCTg
 gsiEfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhrner-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:37:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c7177d4ab4so473419085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455078; x=1773059878;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xj+RXedbXE9FhFvC6sdIgsQRafMTshNF24rbEDu3JPo=;
 b=NeiFD8NDQIDclL6sxjsgijZj8FTl2Qtxd6eM0U5IQO1DnajVTJjhXpVFOSd7u836L2
 //VgjiWf5AsA0q2jbXwMU16qXgl2Ax199PflFslhWEAtzpy/Tcg/rvQhvS9KjUbo+9AS
 4CUN9qUkpXXt/ogjD9td11xrta3IrtPrk/5izJzIu3VMRt1/PaxoFBQIahAmNRJdyyzd
 n3qG+Q9k5z8JUK0PIp6/Bk0nDT83pdROktOCjC1BgR7c0lp44JwhX66bdYCVzQWvEFif
 XL1iDSgfF9DcMD4dq+9T4rreSU8ej2gafj8MDgRDV8LCx+BM3x3V2Y9PVnpKggr+Ce2Q
 U9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455078; x=1773059878;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xj+RXedbXE9FhFvC6sdIgsQRafMTshNF24rbEDu3JPo=;
 b=QeyDW5VSJR1rsX708eZcHsZREzzaZmAVEc7lsmseFLbQ19gXwS3NogrK9U+nVjPKYl
 3WdASr9hyD6eGTVPNY2Yq55QcV7o2BuCOpubsrxzn4YVIKOuB+pgMiTUMlnfRQAW3EOt
 7F5PYiIvuY0l575G/C4st0mFOABlvDmeSnOaZWMsVxnq8/46eDx4Yl+GgoFHHtxAa5Zp
 RRc9f+mgCIeA7/fGdf0TqlBtaCO+Kvq69B3+OIN0LZrE8iIyEd4Q+nfgVihe0dwRXg8Z
 Ed2c7//nWntLzK/BrDKANbJDopT0H56aVvX8d0PKJCXGFxW1Uem9cIAgJtlYMa/YiIat
 SgLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3lCo0yKFGls0fj6bJiDecyXrK0a0FKTcfltzk1dwX9C77rhcp97tIwamvuoeCGO3IlrHi7fVoIro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNyqyyjpVDs9AloACj1SSx5vmp9yIOaUaeQUaDr650QxuQjMeK
 IHO+tcrCdMkT8SZ5dr1A5HsrPwcrOSe1llIJaPI1b5FVpNrySvbb5ooQfijj80baRpUqbQu9EsD
 TIOXRNFEncKLR3q6D3beVyOrcifHJuUso+BMQdvfYtLz76BplIDyGtuHVcTlQBmXRIvHEcxM=
X-Gm-Gg: ATEYQzz2YKoIFb64ieUFj8bxp19OAZR+Nr5h5JRO0PiIa2/efjQHul3UGkqldaK9Joi
 jgM1CYiVVTS7TVp+1BNUnj5yUasVJhBz4hFjY+5XLaM7k8VQyh0713EEJa1RaRhBgEdwZHPuYbn
 zmjXGVZ3GHYG04rHh3rB9e9g0rkD9ZhJxj6RYpwbpPBxjLNNuO++jGREvjOHBCReDHPM9cwmC3z
 p/i9mIJBvRPl2eaqsEgilSJGjdaVyaFyN+uTI5TLbn1nfOB9nmMNySfX7c4suH252FBiaIHR4J7
 OJ4lx0m8srYX2Hn0ZX/V8UhtXowkOLsLgUS3/kP687ewNOALAxbvyWllJFchjgd9W9wQuFlguWG
 pRiGXPX+asUi2nvHSAjgT3vVXFJmreEHm1h9Mg3z8Jvw7+TmNSOkcWb8EGtkoyziBpLNSNB0esh
 BHUfo=
X-Received: by 2002:a05:620a:2901:b0:8c5:2ce6:dd4 with SMTP id
 af79cd13be357-8cbc8e44e19mr1245822985a.2.1772455078147; 
 Mon, 02 Mar 2026 04:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:2901:b0:8c5:2ce6:dd4 with SMTP id
 af79cd13be357-8cbc8e44e19mr1245820085a.2.1772455077605; 
 Mon, 02 Mar 2026 04:37:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fabd36219sm3161313a12.3.2026.03.02.04.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:37:57 -0800 (PST)
Message-ID: <f04855c4-50e7-4366-a85f-d676b9f0ca07@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm/dpu: drop VBIF_NRT handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-1-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-1-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hMRlowL75q1PGx8WbgeH_jyqMs3gjeGx
X-Proofpoint-GUID: hMRlowL75q1PGx8WbgeH_jyqMs3gjeGx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX2z/PE/3qEZUY
 2WgCMP8mX4NOaO8v1XLOwzcvx3M0OMnL6+Fg3f2Qn9Vmm3tIFElVYmVFFUP7vpwoBQ02SBlLiPE
 zsRB8Ldq8DaB92atGtYsmaO+cY3XQsiMJfvUXyMtrkv2K7VU9IQuNhEYEW0873FLuf1+x3I1my8
 q3Qy0TWtKO22J4tO56KcxXFvTKL3qZtf82w/j4MLDKXCH8wQesVe8/D/Gz8olC+v4SVf2aifVTb
 Rh+0bSIqc1ROL8sePq98TB68zquvfLJjUc5oGk1aaAcsyr3u6D6wfZe0UG1P8dV3UKveYek9gUY
 FIbnAQ+ZiDQ7TD3z2Zl6t0QWmdhpZsef6NjK2chQ59w1Cz49RhJY/OKKL9PRpNX/fB4kTp6cyNg
 39mg0EHix9W4t/KzuG047vAjx3x0G9n2r+Ql79FJAo5r/eUPh6AcCqnhNZXlWnCMMLpDeKk0fQW
 /5xJUagtRq+ucNv5V6g==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a584a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5umUYrs0ihikrlwyJ8oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: B1E081D8C05
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> The second VBIF instance, VBIF_NRT, is only used for the separate inline
> rotator block. It is unsupported by the DPU driver and will require a
> separate driver (or separate instance of the DPU device).
> 
> The only possible user of VBIF_NRT is writeback on MSM8996, however
> writeback on that platform is currently unsupported and it's not worth
> keeping extra complexity for the sake of that single legacy platform.
> 
> None of the hardware catalogs entries actually declare VBIF_NRT, so it
> is left in its default state.
> 
> Stop pretending that DPU driver cares about VBIF_NRT and drop it.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
