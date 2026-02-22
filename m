Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DzALN5nm2nszAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 21:32:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635E5170521
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 21:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6991910E0FC;
	Sun, 22 Feb 2026 20:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wv4u07dy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6+poqsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B6010E02D
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 20:32:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61MJPMjE2643478
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 20:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vixSB/xeTFdgfFUWBT+u0QL5
 zCV4kpNBkYe9LQ4nqNU=; b=Wv4u07dy2Ft1iw9haiqH4Loacfv3m9xl6lEex1LH
 8ogODMOHAhaVffWskCpTuJLT0OFymC/IaPIOdiQbq78joB46xUbgcREP+z0Goc8+
 Pl7VdGJOx6EQwePPV+xs3HiiAtIpNxlN9gLwxtbRJHiNgPtKgLL+3WEJSgo0fjwD
 iiXNszTvQ3wbhx/Q46pvT1C3Fo718qdkqTYASBq+VXH0cB8VDMFYZPMQNjMgETFY
 bdAzhIwL3mXiSUT7B4zkyv8GoOHJ6fEfC5VLYE3a6RXm0rNU2r4ReRdQt9akuPZQ
 0R8GJ3TCArqUaB4ALVeolqfJRpWYT0cefHgtCSo/zqqvVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vj2p5v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 20:32:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50336ebabe0so734313771cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 12:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771792344; x=1772397144;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vixSB/xeTFdgfFUWBT+u0QL5zCV4kpNBkYe9LQ4nqNU=;
 b=O6+poqsD4BLdRs77fv1OSCez2Mh8DalTZqMIJiT9M4J5ddO/RxMCC5Atx4iEOZP8og
 ceuqZEkep6Lu/gp1tRVUAEkdsMitUgLibslnRuUbBaL/txbVV3I21K0XotYdp3G8Cjd0
 Q8DhGQf/lxT7pRXXdW/GuwV3Y5P/KUMadaBrC7uEyKHjq9hBW0fMlnFnENjsiHIL/U+v
 HuNbadF3/m4O/n9DpCk1scT4Gw+J+nrhrsHLDTjYIwpLDQ2ADkbszZ2KClS/JBEZqTsU
 uzGjEiIQFhPH8WFeN6N9xAsfSg62w5kF3gtgitQuhSqOwPdy5qRN9+Tln3dq1HFttEvy
 60YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771792344; x=1772397144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vixSB/xeTFdgfFUWBT+u0QL5zCV4kpNBkYe9LQ4nqNU=;
 b=KIJ0UR9sO7UBbe+H0c0a9h1HSLll50R4uehzllo44RLEWay//q2pd13CbPxXaq106T
 5nQkDPk/CsvTRXM0vmYW2BdVGO/FNUH2+knQgfVzMb82zTREfXAEh2jaQXVp8qEL9mA4
 qjghWhzKS5TfMvo1lB7JhZISBaRIyqXn5GmJ8jwGbp+O/hVsakpXf4jwagmTQAZxAnjp
 B+8VrhyOJ08x1YweV9y5S6PMU7Sebf4C4xN30fn1crbqXTxGnLBbq1XN7ekhN/QdIX7y
 zDn+FIbADIEXpVGImgz/ZYT3QbUHVijXhqsvXm27YEZLuagig6WaLjDmH6lHsuhGq7Ho
 hqxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1efYh4hnRWTbcDtmMnNXkB1HKYaRqMvXGlShpEW6j3r/CD/b/oY8yHjvOj2IEiF0nVi139r+T3qs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWS5V80zs7rzy9/CKfCgUbEgZ3cs8IMo9yu16HVOiuGlm4IhbT
 3vFjFqN4n2N/YHsUv3up1YuSWbVSQA8DiW+gn94Zwz3fFAJst6c6x5KaJiUyhygEbnzGWa8v+9x
 aWLcnNwVcZPIhh4iKHS711fJSWtbxLk99r14LNgJqs+C54pWN/Hr4ZM/UiNdjET+TCGDHPAg=
X-Gm-Gg: AZuq6aK3TJ/cUV7MhQ+w8uDZP1UrzId0WvwIpR7tm3HMkFidCmFThxHKn9hywXaSjrz
 kjiRBsqzD/2rXENG3TvfJzKtTjOrmHlQNYvEJoGFduWnV6JazBN9u9Yu9/nvmestckg5Nul/WcW
 +yfY6aBbkhdTknLMKWP7KpTbutvgWjIfSF1wbM9uW61gTpYiVR4Okfh3HONz4Bx0h3XlDDt/aRo
 p5W8k+So6Zky11h31ASdLtXtgvCeif2NpBVh6Kh0GfF2yESgyU/W8nsaN2h6Oy+UQ9IWAkGJVBK
 A7JWAjmBtJCIW4J0ggGFhyGaloQ9WPPpNrWtn9K2sTwpIWMvDxFYkJFaGd2GKJO+KMQaNyOQlUc
 ONoFZvYPhayWvzsKZtdM9lomLL9RKN//wPVjQOfRwNuzFqV6B0QNVCnp7Lr/+dSobSm17fM5KXf
 3TRstpUJ/E+GPMQ1HgW2Q8WcgvQ5MOqupz4II=
X-Received: by 2002:a05:620a:1a8e:b0:8c7:109d:e9b3 with SMTP id
 af79cd13be357-8cb8c66aa2cmr760472485a.37.1771792343704; 
 Sun, 22 Feb 2026 12:32:23 -0800 (PST)
X-Received: by 2002:a05:620a:1a8e:b0:8c7:109d:e9b3 with SMTP id
 af79cd13be357-8cb8c66aa2cmr760470485a.37.1771792343240; 
 Sun, 22 Feb 2026 12:32:23 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c60bsm1154322e87.84.2026.02.22.12.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 12:32:22 -0800 (PST)
Date: Sun, 22 Feb 2026 22:32:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
Message-ID: <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDE5NyBTYWx0ZWRfX6Uwr8rIyML8/
 ykvDFY3OvNFdMFxSS+FGoJ8wBHFTFop0PI7SxRNCoI1CLJKo7njncyFbvLyicE2mEi3I+ZXxoo3
 xKA4x0NAILqN5anAzLwoos411HxmKVuMj5cG7xhsyuPI+EqFaTrwDzjfrzO0+i2UDeE+gooWVR9
 iXUpj6Ee/ssA2wL9oroTLPzPv3IeZk8N/hYIxLYGUexLsBVHhVsc1Z+eyoRPqtp3IY4CbndaGb0
 kh5gaw8EWR69lxHxeFradqOXF8kOPm2Kp3aFnndiLrMkWZMnNZ+fXGrCf1KnvDWsNym+cA2iEnZ
 +MEpqiQ/sQyDT1iKjTwWbQv2wXCgV76trUoJUQMhWddse+IAl+tgKdg121Vi4FiXpGu5pcr/Slf
 cO3piRvVaLsqeHBsZavuHFg9CTyD7u0hvoAljh1mVpsTde1KS4yZiGzycLSO4pxnk0BV91uiiVw
 mhE0JE8Or20eD1GmPTg==
X-Authority-Analysis: v=2.4 cv=T5KBjvKQ c=1 sm=1 tr=0 ts=699b67d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VCWYR0DOrcW2_Bky3Y0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Ezgzpfs1sKwGseByIccnzoijm6mU5LWA
X-Proofpoint-ORIG-GUID: Ezgzpfs1sKwGseByIccnzoijm6mU5LWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_05,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220197
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mahadevan.p@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 635E5170521
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> On targets with multiple display subsystems, such as SA8775P, the GPU
> binds to the first display subsystem that probes. This implicit binding
> prevents subsequent display subsystems from probing successfully,
> breaking multi-display support.
> 
> Enable separate_gpu_kms by default to decouple GPU and display subsystem
> probing. This allows each display subsystem to initialize independently,
> ensuring that all display subsystems are probed.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
> Depends on:
> 	https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> 	https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/

What exactly depends on this patchset?

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index ed2a61c66ac9..65119fb3dfa2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -54,7 +54,7 @@ static bool modeset = true;
>  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
>  module_param(modeset, bool, 0600);
>  
> -static bool separate_gpu_kms;
> +static bool separate_gpu_kms = true;
>  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
>  module_param(separate_gpu_kms, bool, 0400);

The patch LGTM, but I'd prefer to get confirmation from Rob.

BTW: have you tested it with X11? Are you still getting accelerated GPU?

-- 
With best wishes
Dmitry
