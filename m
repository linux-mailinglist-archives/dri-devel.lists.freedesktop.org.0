Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374CBAD2510
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6448D10E411;
	Mon,  9 Jun 2025 17:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e65QfGjf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA35610E41D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 17:37:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599Io6D019421
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 17:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0mD1/0CoskR/YlijKuKFXQSB2LX4lWU/ihQ9C+M2R1A=; b=e65QfGjfmnEbu4p3
 UihaUlZiORk3Gozu9dLSaMSP9mF34+aiX4WazCx72GGLHI/OpvsWfbzMTiyI8CJ7
 mLLawg5hHG4k6Y9ElBnt/LhzrUX3PFK6kg0ClvFNa2HHuhvKvyZdKST+ve7kkN5C
 t5fxlPVuJXdK3KSDbmG2Agn7iX++l5ruXwifbVXyKLSFpyHuvOhjHdqTUSuYTTRb
 0Vd5vWEbDBJHOr9XFJxjsL1END05UxhmjxlBVCA+w5wE6Wb5C6RRhAni4d15POmL
 wnqBFAOEkKtRCz23tHkxlX7dA320UncHJ7y//sisuXdb/j/lF4azs/8Ky3nkMHkv
 VhFB8A==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv6q9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 17:37:48 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-2e95bf2f61dso2943467fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 10:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749490666; x=1750095466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0mD1/0CoskR/YlijKuKFXQSB2LX4lWU/ihQ9C+M2R1A=;
 b=q8QJbbJOIEZauzaO282bAqKdtQGklpDtBaI7CYzkDnASNLshLu7pzXV69/+nLuew25
 Qg3Cph9NTqR1dd2sepfIMViOkfIwb4nHiFsY5cm8thn61G7MehHrf2pscyaqAg+lnhBO
 5JgT0X4lV0py9OKnVSnvfCx+RutSYzS6xKI19T5X3I7ww3/4ihHo1i4R7NKRoMAHlJyr
 ohmzPwWpCQoGH1hHAp3z+P+OHa/njAW1aV8ffYOb+tJB5fZb2lU2JcdQbzU1c5eqiDDS
 Jd2DkpoxTuU4WWYR7XDFuCuv4G1Qv9ONdUQqFWL+GYgxjnMiS5MiDdmgQ1RX9kc/r8g1
 TC+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcL6e8FET6dGy35wVPOYVT2tnDjHYkmnb1xKyNbD4slJJhgV5JzIPP4EMbVY/9YzTrsEeWrSLeKqU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXtk1+XNRFWDcs6KRUUkp+VZtrpKnr7efW7y1oyNgPdxovplQw
 bibCh1SQiuSP0B1xED52TNij4Ywe8JLWtbAmfQinCnBSRUEhNoWIacIWYQoC+wdTPicOF7o0PSR
 x1+CMwOcAjjgzhwn1PdLs13vXD+iQiy+EVIqCxKHMq/IMf5TYnN9aBQZebkAfI54btccVqS+rDT
 Xf1nI=
X-Gm-Gg: ASbGncugUlpfPrjKZ5sLQqvo0EUdihZSnOOAWfrXBUDW6DYP7TxRhQzSeUlKhRJJRFB
 puvtZQI1L8t3daOlVfmzZuCuUxUo1ivLDWzwGusZsIKynVW+BTRKucnaVtMccFZA8i9whwO6TX1
 ZUiyahLwCU5GlaJs5WNlufHg45JHfl3Z8Nn2bP+s+a/V8j6EBIS/cMzMKgwxrFEhVBEZltf9l9P
 ijObe7bxJCwYV/bXOO2kCg4BADAaVUKxSDJQqfNkbR9vx1wzijGBG91fGZah5iio04WGRGvtg+8
 J2HQXSbKZ7JmqNFD+XKkkOL/okReeCodAnyakTG2UjU++Xw858RvkhDXqIR5A0vIDj886IpPOz2
 oOeIY9nEiVPnmhw==
X-Received: by 2002:a05:6871:e61e:b0:2d9:7a9e:99ef with SMTP id
 586e51a60fabf-2ea768af10bmr294873fac.1.1749490666211; 
 Mon, 09 Jun 2025 10:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDybc/cT1a1uzm8usYYLOngzIkeYWJ3oezh6aMZj11iyv41ICeZDa+085dK1+g2POh2T0oFw==
X-Received: by 2002:a05:6214:1c8b:b0:6fa:9ca0:c67e with SMTP id
 6a1803df08f44-6fb238dc2e9mr7311616d6.5.1749490654418; 
 Mon, 09 Jun 2025 10:37:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1b347afsm11373071fa.34.2025.06.09.10.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 10:37:32 -0700 (PDT)
Message-ID: <951f781a-d823-4240-a1c8-b9ea85ba64e0@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 20:37:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/adreno: Check for recognized GPU before bind
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
 <20250609170438.20793-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250609170438.20793-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f-wYEue40YL8I0UD3K5su5NYXQhxWvmX
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68471bec cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=4MAclHcQAAAA:8 a=ciEtJq1xeetoClZ_GcsA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-GUID: f-wYEue40YL8I0UD3K5su5NYXQhxWvmX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEzMyBTYWx0ZWRfXyJWlEB3ARQop
 W6IdBbgH8VxA6d8zAffqccNIOup9yTHWU3VkxYdxiHwZSAUiSDCAjA/7I4fjh5kvnZr1m8ity38
 FOsJU70uPeX3BKfUU8mmflq5noLgJHA5E+84JeoLEdZXPBegWCi2wl9hDTF6xh+uJtkm3EBkDtF
 e/7a27cPNuWexZVKq2ZvnBWcKnl2k0WhTUqkykQwPo+mUfI5jjaiy3O4g8hOqQyF0GojRlIVez5
 RA/CMJjex05kD6F7vzM2nGO5B/NnbbpSGgzmlNlKE9r9julTEn56hTbHT6nCNHIhoipLwKX+vlg
 sR953I9QHOHSBsdQL1txCzgTPB+P05HSGWCCtrl5nFiv6reag11wm2hiA3AB8oRs/Qo9t5v2iH+
 617p2wQFfXeUyRFmvAH4g6OrEo7gEHscdpeqA3FfmSna380+aT93L7YCx9VbgmchybqPWFFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090133
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

On 09/06/2025 20:04, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
>   drivers/gpu/drm/msm/msm_drv.c              |  2 +-
>   drivers/gpu/drm/msm/msm_gpu.h              |  1 +
>   3 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 504174dbe6d6..002aaf365322 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -178,6 +178,26 @@ static int find_chipid(struct device_node *node, uint32_t *chipid)
>   	return 0;
>   }
>   
> +bool adreno_has_gpu(struct device_node *node)
> +{
> +	const struct adreno_info *info;
> +	uint32_t chip_id;
> +	int ret;
> +
> +	ret = find_chipid(node, &chip_id);
> +	if (ret)
> +		return false;
> +
> +	info = adreno_info(chip_id);
> +	if (!info) {
> +		pr_warn("%s: Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",

Please use %pOFf instead of %s (and node instead of node->full_name).

Other than that, LGTM.

> +			node->full_name, ADRENO_CHIPID_ARGS(chip_id));
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static int adreno_bind(struct device *dev, struct device *master, void *data)
>   {
>   	static struct adreno_platform_config config = {};
> @@ -188,18 +208,17 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>   	int ret;
>   
>   	ret = find_chipid(dev->of_node, &config.chip_id);
> -	if (ret)
> +	/* We shouldn't have gotten this far if we can't parse the chip_id */
> +	if (WARN_ON(ret))
>   		return ret;
>   
>   	dev->platform_data = &config;
>   	priv->gpu_pdev = to_platform_device(dev);
>   
>   	info = adreno_info(config.chip_id);
> -	if (!info) {
> -		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
> -			ADRENO_CHIPID_ARGS(config.chip_id));
> +	/* We shouldn't have gotten this far if we don't recognize the GPU: */
> +	if (!WARN_ON(info))
>   		return -ENXIO;
> -	}
>   
>   	config.info = info;
>   
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 87ee9839ca4a..40eb04bab35e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -956,7 +956,7 @@ static int add_gpu_components(struct device *dev,
>   	if (!np)
>   		return 0;
>   
> -	if (of_device_is_available(np))
> +	if (of_device_is_available(np) && adreno_has_gpu(np))
>   		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
>   
>   	of_node_put(np);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 5508885d865f..56bd1a646b83 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -729,6 +729,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
>   void msm_gpu_cleanup(struct msm_gpu *gpu);
>   
>   struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
> +bool adreno_has_gpu(struct device_node *node);
>   void __init adreno_register(void);
>   void __exit adreno_unregister(void);
>   


-- 
With best wishes
Dmitry
