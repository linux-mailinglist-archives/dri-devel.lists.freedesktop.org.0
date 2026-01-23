Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPEJOeW2c2ncyAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:59:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528BF79461
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B18410EB86;
	Fri, 23 Jan 2026 17:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHjwkHJi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8HL1lgQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA02E10EB86
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 17:58:58 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NBpZmo3656617
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 17:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ckrbQ0Dcn2KkakWCOeOQyrNO
 RUKM1Yp3djJ4f4UP3gQ=; b=AHjwkHJi0HJBT7HX77vgRFEcbp4HwcTzuDWwQrZ6
 jPFd9HgkEBq4giVK2odCov10T4lU4XXMLxfPH2+gNrdEBuoaV32nw7v7brzq0+We
 s6J2edGaHLdgPsRBwESVyH/y/ANfsmod+Ke6XQCg3NCWqwv0HgDMs7DovOXLNjvZ
 CYmB/irRKFCIUKJyuB7+NaSNEyquYhjYyuRj0SGvJ3YImBCY7G8r4+wcD8+RlLmn
 6ldGuQOisRJK/FebbZHXuS6NaMNUJAOCBBJamrAox5no4A+re7COv2s4JWxnWwEI
 fvDFTfSvmAN6YURDayqEh3sqFxIs7WR7pIHoUxF9RZabDA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv2hwahff-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 17:58:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-93f57cdeb11so2972765241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769191137; x=1769795937;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ckrbQ0Dcn2KkakWCOeOQyrNORUKM1Yp3djJ4f4UP3gQ=;
 b=N8HL1lgQxRH4sr2+lTtKwa7F2JUwBG/odq5SQtDY8EAYH9rux/XhUVSZT0LSOsIXNR
 tqiEDyyNMsNm61v1+xBCBlzdNs+eEmNm1ytm2/mM4rdkVlgjYHzCtJakyv83elzR+Ai1
 hKLPzjJJzBOEB9oSlaR0oPRyX1EE4iJlQzzxHUt0sA6SFp4OhwEpAlKHizZKshvRrROc
 Szf1N1iHz0B9q8wzu0XgQOii56ueI2EX3RiuqdE5RqrHlUzsvHTLSYkxv17/mO3WwpIv
 znzqr4g3tctT3DZ78GKOiqCm9sGOoKo8X2BZ8RPvwocxWUhU4JNTJ+7AGN/iRqcCVnYG
 zx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769191137; x=1769795937;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ckrbQ0Dcn2KkakWCOeOQyrNORUKM1Yp3djJ4f4UP3gQ=;
 b=s9j4AONlwflmuC564FFk4E5i8R7DBQ3ZPiIi+FfHtPjQ0jWd/W730H4XHbOsWScT9k
 54inNEtNumvOKglJk9XzsyyynO99pllkLJ7ha+7ZeSQqpZXe4TzivRqLwOwnh9utTru/
 219H/VvZldpwAxHLTuRDVfI0YrW+S4QzibfQgEjMaKsEsVvy/tXqWkupkuJ0psCrKn4n
 CbOgO65jqzJp3Y8PqSeyimQVAnrNCw3RD/nrz5gRxBvEX1kLDNUpjoDSO1lRkc8XyNlQ
 uk3qditp/d1OrWSs3FqP+wGGxsFm7JywVqe3rPS2BPX0IORpnqr/Uykw0TCtk3vlJGvI
 ++eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkjXLXn/HcnnRlrtcSE0bgSac4Nz1hY+02jnzkYcseg38TgVDthgrm7Hhki6t0+CrLwkqNknC0/Ms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsTisaOG1JAS62sk6XbZGYDaHOlHQu0lETpFHgvGfzlO/3ISsV
 yApf3BCXo+J8UyC5qOP9ZxKgcavsgiJCH4C2vtLfi1O28uvi84r9iS2HQoUPcIiOC7ROJO6Fhay
 5ZG8zggJFcjW/5LrZVtZLg7N7oOz86jcuKsPslSCgmAXN0TmVq8K3St6WSJ6j9LQr4PUq+qs=
X-Gm-Gg: AZuq6aJ71TI4eoJPRrApjbvK9R5jZV68lGi0A0tOr55ue/IZLs4NCd0qanFzx0ekK8a
 7X2IQxSISM4g9AB3IImSUjJGQUPCX7ZE2uRmjT8REEVzMb1anqxwa4s2JJ1tsSPPOSmaHmhZECR
 zMxPnUl2DzQepXcYWs9nkImpTy403AJ+N41QmW13HvxjIPLWuE5mPkbgu3AFjptBVcWYsDvMyfv
 qu6B3f5LwOPo9ofoekwoCSNadD5H4NFl1rcHplDNkByfnIqvSjSfISCDzbnk5QXuVQtmoei2gFI
 0jB2mEOcUu95v9NrKfaqGeKnGc5+iBuKow7jW2fQ89uo/wSThjNqiS6h/iE78xu/2RLzsgtUuqh
 G/O+4Egb7+pu3LbXkshELUg3T+ORdjm89QZUT8Aabil6B/T3vKTV13iNBGJk8kkgZHhwGEb2XAi
 gAQv7hiD00zaehOeMritSUZvQ=
X-Received: by 2002:a05:6102:3a06:b0:5db:20ea:2329 with SMTP id
 ada2fe7eead31-5f54bcc0411mr1142226137.35.1769191136973; 
 Fri, 23 Jan 2026 09:58:56 -0800 (PST)
X-Received: by 2002:a05:6102:3a06:b0:5db:20ea:2329 with SMTP id
 ada2fe7eead31-5f54bcc0411mr1142206137.35.1769191135070; 
 Fri, 23 Jan 2026 09:58:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48f0259sm801012e87.45.2026.01.23.09.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 09:58:54 -0800 (PST)
Date: Fri, 23 Jan 2026 19:58:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
Message-ID: <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
X-Proofpoint-GUID: dZMjL2308bU9r3vWfcOM0gd3qIjfbhUZ
X-Proofpoint-ORIG-GUID: dZMjL2308bU9r3vWfcOM0gd3qIjfbhUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzNiBTYWx0ZWRfXyjEVURl9TMfs
 VVicOfcLOkgZM/Tomh6UyuiUujO89fBTrt2cB7IvKVkJBPJqEJ6ccrE4eO5O2Ul3NpfhIHMDHjh
 22dSsQ845QqVvTSrpB2R9rOLpJkTGGbYlqLtEo0eDz2pjMqcFC9ocvjmC6IlHAz+PWVJzINxLbp
 jZtTyVOkQ3PHMXrBeaISnWMZk0jaqMrSEhy+pbKnCSSNOGrjxksnACuuE5tssIGzMSeXZXt/2vS
 3Qg84k0t6raetj0khRZKh35AxMo+9DI57plmWjT9j+mKZ72R8gr7e+OxDCW6MWsTTW0GsHMFRLP
 CX6TNCUmS+Toq4n7fM/cClqsIAPmOYwtBY5TN2pjWoaTFxRpc2ki0LImdqDtrXZyBJses4TZRI2
 3iDnx9Bko04hCq90zNZcSJswKAcXKeGsb6bKRFj+SJx3i0/ayPybe9YE/DTAHtrogCd2O5bAbl/
 f/KvXsz8IIzNg6PnG3g==
X-Authority-Analysis: v=2.4 cv=A4Rh/qWG c=1 sm=1 tr=0 ts=6973b6e1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=mHnloJP8uCFruMiY-FkA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230136
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
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.091];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 528BF79461
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> While there was a manual of_node_put() at the end of the
> common path, several early error returns would bypass this call,
> resulting in a reference leak.
> Fix this by using the __free(device_node) cleanup handler to
> release the reference when the variable goes out of scope.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2129d230a92b..0bc518d9fd65 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
> -	struct device_node *node;
>  	struct a6xx_gpu *a6xx_gpu;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->registers = NULL;
>  
>  	/* Check if there is a GMU phandle and set it up */
> -	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> +	struct device_node *node __free(device_node) =
> +		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);

Missing include for cleanup.h.

>  	/* FIXME: How do we gracefully handle this? */
>  	BUG_ON(!node);
>  
> @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
>  	else
>  		ret = a6xx_gmu_init(a6xx_gpu, node);
> -	of_node_put(node);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
>  		return ERR_PTR(ret);
> 
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20260123-a6xx_gpu-cbc095dbe423
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>
> 

-- 
With best wishes
Dmitry
