Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFE8AAEDE0
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 23:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5970110E28F;
	Wed,  7 May 2025 21:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAAqfIMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD16210E1C7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 21:24:46 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547BE75X019006
 for <dri-devel@lists.freedesktop.org>; Wed, 7 May 2025 21:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Yr3o+GPqvA0++Om8f862Y7z+
 HVP6SVMxvLd+HrwRncU=; b=MAAqfIMxuHYJYdUYpVdHhZJCUZLtl55kOtK1QEhk
 mFb7plCZbr/aiP15YAaRJ6VohldJ5PCA0vbc8LL0z1q/COgSe4q+erJdB3Th3i34
 jmhUdCmNc6udYtr9XphCY2pFDTxG7T6dskBDH2va0LB+KW0n0rsnUXX2HGdiMe3q
 GAi1RDCd3K3to0EShdPUFm5gQO7SZEvECXh7Wcy6+7RqXlR/Vz1HJjARnUuiZ6cE
 MiDcmIte5qK1KQhkEcj8ZP2J511sa2UsutB3Q0uCZNEKZcyDoZazRLq+9hmoE7Cr
 QpV2X07IhMUTS5hcJ6+ytSDne0RmpKZmARphcPn97N+QrQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg70d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 21:24:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c791987cf6so56350685a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 14:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746653085; x=1747257885;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yr3o+GPqvA0++Om8f862Y7z+HVP6SVMxvLd+HrwRncU=;
 b=rbsnub9KGyxba4BMzofkOLaM1w7CfjvQQqrY1iHHLcE/Vf7Al+VE73zACTqNqcJnp/
 PGXyZQlpaqvTCpWftQ/dkfRT1ssr0Ff6RXNxPeoa532gaFadXeBXURSGktam6Ku8E8W1
 qYLaOqq1Akq0/JhGkPQW8U2GSx7ZoGqnOhOsnmxdARVXa2J/nYbdVjg249D3AsJmGfGy
 9XgyyhcAj5MXU3jhYIB00Lmr/vb5u8WU+y8QnclZNxsqZW9sI2o3wpj6yUCSaIz/wFYU
 zDRWPog2ACKLSFX4uEJ4HUqgJeuJctY8nR0OGwdd7wrKzVHkAaIHUlFX3+BlyCGpr2tG
 ghNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9XKj74oSc/xCTRdcJclHn8tSa+TaWRwRbqmUZnTnd/sRluDBkB6USbtEQPn41ikDyofccXJDVcOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5SRbrkmliIstX2vj6pb7e/O3l3oc+8/MBLbpJRBGOih5xKSB2
 qqOgm3BmyQIqr6PYFbQm43FAtAnRGWu6wSS3F1MR1EVZ5pnsT5KUfNEOkoh9alx231cYdRJBdTD
 NpQl/aQoEUhfj0vN6HliN0F1YcsMWgnfbd4pmJlT3M3AqhBPFP+l+1qe+yQV8OJn4lAA=
X-Gm-Gg: ASbGncsHooUDZJ/qwg/L5D3e0fGVDv9bLiCse5fg98Ua9WKM33GuE5N8R4I2ThZ/z55
 7UPiQ4EyUtEoZ93oMQVK7qZMaPabpY+Wn1kM2NFVxowYHZyDihDLi7UlLXYlKqkFYkS3jMFOsB3
 j4GXZqFx1D5Za+bE/20/TZyKJxUineKtNd+nRxAuiUFR+R46IOHqFutEd5+VjRBt0hADLPYkYNF
 QcP8lSto2mIW5/nzzaNRzBisiz6sUXe7eIotkHcwNswsYd9Vo7YOSYWvTiY+G7k/4pNRruSCX5I
 l0cSQ68qXOKww061Nc3PGeGkekz1I+nSNxu0xeZu03kfIArP3MDwAIdlpPB7AoS4D/gGwpbPJG8
 =
X-Received: by 2002:a05:620a:408a:b0:7c5:dccb:fceb with SMTP id
 af79cd13be357-7ccf9ea54b5mr141179485a.56.1746653084969; 
 Wed, 07 May 2025 14:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV+4FNkfuTlk4HKwK7ViJWDaszxk32pmkR7zSWKKmrIlnWNomLRPlCCNIKifiYiqB/AQHVsA==
X-Received: by 2002:a05:620a:408a:b0:7c5:dccb:fceb with SMTP id
 af79cd13be357-7ccf9ea54b5mr141174785a.56.1746653084505; 
 Wed, 07 May 2025 14:24:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202ad90896sm23728941fa.101.2025.05.07.14.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 14:24:43 -0700 (PDT)
Date: Thu, 8 May 2025 00:24:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: mdss: use devres version of interface to
 populate children devices
Message-ID: <xmpb6zrbnx2jcfjthkafj6viptkugowo7qdfxlg7vdfh3mqlua@2tcbsd4f3dtv>
References: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
X-Proofpoint-ORIG-GUID: ZBK-B6sIFpq-v8sVP6po3Lcg-7gCAPs1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE5NyBTYWx0ZWRfX+SfHm6ir2ON1
 sFtRuV+qyirVu8V6a9Z3cMW0vG1x+wBzVEgMPpdrLfIhxul2Z1VmIdQ3VEYJ5xb+qU23vTyU9F6
 lTg5U6KurSbouhFOmt56mXadQ/TTGMHn6EwnPW3/ZBS1l+PY3QxDxgxY3Ry6gvSawJ9/5iKnqrc
 l9iw/iVsKn9KeMgKxVoSixYwEgqo1jKgDMDxjki5fbssZZYXO9xwyz6USIY+1siyWvc99vjmB4Z
 X16v4jxuTsJ1519scjnLl6tkvFIEIMhPLmUVTvyFAHLlf21iU2+6QlfhbQ4Z2kiGsnFbej3pOcP
 bC4iO0rn0kT8ym0vwnWNXh7t4ATqHf+uFFD6NCKgQzSUrOCKt6smHZ4kZeLUUnBmnDllAFMJ6rw
 HPqAEvybNETTt+EwIU5DxXRHuGimtjVKVnE15bxfWdpTxcf0cqDPKHWu3EQjcvpNdpfp+Xbj
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681bcf9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=-t1pgZ-jyF7rHdee9YQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZBK-B6sIFpq-v8sVP6po3Lcg-7gCAPs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_07,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070197
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

On Wed, May 07, 2025 at 10:35:38PM +0300, Vladimir Zapolskiy wrote:
> Trivial change, there is a managed device resource version of
> of_platform_populate(), and its usage simplifies the code a bit.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index dcb49fd30402..116e8f93f8c8 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -550,7 +550,7 @@ static int mdss_probe(struct platform_device *pdev)
>  	 * Populate the children devices, find the MDP5/DPU node, and then add
>  	 * the interfaces to our components list.
>  	 */
> -	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	ret = devm_of_platform_populate(dev);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
>  		msm_mdss_destroy(mdss);
> @@ -564,8 +564,6 @@ static void mdss_remove(struct platform_device *pdev)
>  {
>  	struct msm_mdss *mdss = platform_get_drvdata(pdev);
>  
> -	of_platform_depopulate(&pdev->dev);
> -
>  	msm_mdss_destroy(mdss);

Unfortunately this means that the child devices will still exist after
destroying the MDSS (IRQ domain, etc). So, it seems it can not land as
is.

>  }
>  
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
