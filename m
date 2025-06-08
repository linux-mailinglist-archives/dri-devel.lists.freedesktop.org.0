Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0EDAD11E9
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 13:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFEA10E08C;
	Sun,  8 Jun 2025 11:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCG56KV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9B710E08C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 11:20:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5588r2L2008840
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 11:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8oFvEUt9pCAclF9FHLBMxhOp
 lB/Y/ojl5ByGhYhgCKE=; b=FCG56KV91Q1dQdnsY38w/y9uIfxbh3FdDu2yDNgG
 tFCuFpRtHrQDBY+WvBU69AAkWd/Xs5eFjzfsKeAS9X+EwYzwSaKdfioB5zP+ekhu
 0QL2RLcaa5ga8CwFf7PkQnlnflR5NxvpCJERJ1axGP32SMWNSyE3H7+VYwx/N/qh
 7+WYi5BSwkCMh2k9DBPF/BdqPfuDYCANqbqRzz5WePP2tyTTqI1KKCIUhPTCC+E3
 aPokZRvrxTIdwEmhS2pLTdtVIcxnIL/tgIz2XCLbMisJnF5Lzj51FOLU+gOwleag
 h/YVd94837aU7rqePYFTpVHZESJN93aJhD72YDMHTxTFAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474asrjxeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 11:20:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7ceb5b5140eso702564785a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 04:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749381654; x=1749986454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oFvEUt9pCAclF9FHLBMxhOplB/Y/ojl5ByGhYhgCKE=;
 b=pJWgC0EHrM2hDFHNbXN86SrMod+P28434WRoouZiT017DuWKZAeCGUqzzcOPy/5Q6l
 55XCJyudhr5kgLwQ/Vv+gcWpztSZOKUBADgozv3oofEXTXfgE6aEaTtnZdzG8ypmGPMF
 1P+WAZTR+DNJsnXT9fWPahnG6iZmYnoLZkSPUoDZn3HTg6a33oaWLIB/oNnkpXirnhor
 O5JPASZvxTqJi2pSU1acGb4O760uH9fMdNtZXUHwcrt0SAvFcaCHRVlIfKgzroYEjSbA
 SyqXcIxyDmBeMKqB6FpipFRddN56mPbo6uLTbbyVgqdI0TvWWQoh9IF1rxKCH1/xif3h
 kusQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDzXb+V0LQd2h0RpEXZhEtrndon4OWjnH6hSbEcAODNS6usHEgJscakVqt5JfzfMrAQMSLmzfOoow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycE9YGCQpm/LtIARs+x/rLsju4TDmYzaj7Q4NUb5IW+Bk6lnBW
 C2YtXLJ63qAfYwUzXPSdYpbsH9ZBcYu0OrH1zCLyJ7B3qpvBJ1skDznD2GS0kkku+5hwBmMaJUm
 XpAhE5p3gBd4mOVtRmK3EW1rOOI4/Xgc20qOHvjhZigWzYjX4E8cjo64+XO2mW0Sni2Kj3Og=
X-Gm-Gg: ASbGnct+HX2oxeFXPf2VnCPCuvFVAp4XD+FI1sdpvajd6ukUakGIAuVKnEjSZoJ1piN
 bmDK+LrV5cqwhjddNWdUjkJaKPg94FvjqDfezXauzIt8PFdWUcVBOt5wdijIWmQvsFwPEZ2WlOg
 bAkz29t15ICvmekWyzeT78kHQKRBRGWxDT6myZ6MKvCSRnwmkpLf9dekVfXk2MChXOtmeXe1YhO
 mv//9oLRMSscqugA27W+vj6qnO9WezFi0dufUvbJGnDxzFa57K6K4e0rOhjLVksLQjVpWQGbXwz
 Mvt5mnpRr9ghon56ekcWQnX24dc9k0auzm3Wu5TaJi/25vuAWoVlU2xmuJtEKPuUmgZJdRzSif4
 =
X-Received: by 2002:a05:620a:8f11:b0:7d3:8b7a:39c2 with SMTP id
 af79cd13be357-7d38b7a3bbamr530977085a.36.1749381654290; 
 Sun, 08 Jun 2025 04:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHosEFrECBCREkY0h79WlBPsbkCxSPoZo0G2OPcBYJqREo8FcqRYEdh3lwUe7fpNH+k7RQRtw==
X-Received: by 2002:a05:620a:8f11:b0:7d3:8b7a:39c2 with SMTP id
 af79cd13be357-7d38b7a3bbamr530973385a.36.1749381653877; 
 Sun, 08 Jun 2025 04:20:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55367722445sm739022e87.130.2025.06.08.04.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 04:20:52 -0700 (PDT)
Date: Sun, 8 Jun 2025 14:20:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 01/10] drm/hisilicon/hibmc: fix the i2c device
 resource leak when vdac init failed
Message-ID: <agw2afrxbbzhyvzmnitnubw7kcppp2u54j5gfe2zllph62xx5j@u4r4xgqcq2q2>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-2-shiyongbang@huawei.com>
X-Proofpoint-ORIG-GUID: ugOU5kRUUmemBfxRxPXNDWHnSHoNVGfe
X-Proofpoint-GUID: ugOU5kRUUmemBfxRxPXNDWHnSHoNVGfe
X-Authority-Analysis: v=2.4 cv=AMUSjw+a c=1 sm=1 tr=0 ts=68457217 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=cIPARiM9ZozVWMCBJCwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA4OCBTYWx0ZWRfX9Qvf4t6qeQHA
 gCVXOFHleXQYs057rAH1x9dURq/CaM50XlD5Ixa5ytfpFWY4UDoDolgWoabNN9GrLdIQOJj9EkM
 2gevg/dFqeOA1KYNl0POtvmiLm/J3xQoWhfkZDY0oA2IVCDhz7r9SeOJAHV04Xlg28HRUSKk6l1
 KE+JJr9wYWVVvaLdFhKfLV5ALEpqmrP3s5pqG8ZboknuDwBoVa2FIv6uTqytLJ25rqPr2Pp0cYS
 xkKVCt61nuzNbpUSOEF0rRpDtl601O0j9PZqGeuov3UDQOkWsrnqlqiT8MzKctKK+9sXQOV+Htm
 nI9XG0C9ZwAD+66jQoX3H6ZqLq7+PPfX/QXBQH6Dg7AaUjf8cN0tKX+UL0oXDB9AWP9+RDnWTwd
 xYykfdQiuFVj5tU2zcqs1ahdwZR6e4/F3K2hYfyWSpfC6yZnHenw+qAXTgYj0tLrzsaV6h38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080088
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

On Fri, May 30, 2025 at 05:54:23PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Currently the driver missed to clean the i2c adapter when vdac init failed.
> It may cause resource leak.
> 
> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")

No, the tag is incorrect. Offending code was added in a different commit.

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  | 1 +
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c  | 5 +++++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 9 +++++++--
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index 274feabe7df0..ca8502e2760c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -69,6 +69,7 @@ int hibmc_de_init(struct hibmc_drm_private *priv);
>  int hibmc_vdac_init(struct hibmc_drm_private *priv);
>  
>  int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *connector);
> +void hibmc_ddc_del(struct hibmc_vdac *vdac);
>  
>  int hibmc_dp_init(struct hibmc_drm_private *priv);
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
> index 99b3b77b5445..44860011855e 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
> @@ -95,3 +95,8 @@ int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *vdac)
>  
>  	return i2c_bit_add_bus(&vdac->adapter);
>  }
> +
> +void hibmc_ddc_del(struct hibmc_vdac *vdac)
> +{
> +	i2c_del_adapter(&vdac->adapter);
> +}

Then hibmc_connector_destroy() also needs to use this helper.

> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index e8a527ede854..36401b46034c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -110,7 +110,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>  	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_DAC, NULL);
>  	if (ret) {
>  		drm_err(dev, "failed to init encoder: %d\n", ret);
> -		return ret;
> +		goto err;
>  	}
>  
>  	drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
> @@ -121,7 +121,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>  					  &vdac->adapter);
>  	if (ret) {
>  		drm_err(dev, "failed to init connector: %d\n", ret);
> -		return ret;
> +		goto err;
>  	}
>  
>  	drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
> @@ -131,4 +131,9 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>  	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>  
>  	return 0;
> +
> +err:
> +	hibmc_ddc_del(vdac);
> +
> +	return ret;
>  }
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
