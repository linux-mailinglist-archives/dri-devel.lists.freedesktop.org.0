Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC15B13EFF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 17:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A6810E0FA;
	Mon, 28 Jul 2025 15:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6gBhE+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D23510E0FA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:43:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMD8012160
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vravO/6khNRvhlPxzNQ/FnndOxyVsrk4qImwPP/3MTs=; b=F6gBhE+m6cQWFMBS
 FNPdejfcQVQlLWaI3KZQmslLdIpzC/Gp4sxo3nLGPPnL+RzpeMbm8WFmbyVaumOy
 oEx54W7hUEzCC9aH5hgyko40SF+WlBJieNNXiQ5zTT+HaDv7f6zLdSLqRDo8rJ16
 h+YF1v6YCp51kVWV9IcaQQFIBMxNOtIAoKxLkpzpF28T1yB3KdGq+LnrPGxOzx/Z
 V5nHCmMkZRXJRtpRlaIxdvl/1vuVKtOp937tqTOd/Ybocf78AxMJ1voGCnqu7BSu
 cWg2cFAO+4RfiJVCeL/ljOaJ2UZwiU16cXwUGg5fKWBT67b3Z9KwLJOlwu8CrYNL
 J/SdNw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk528n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:43:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fac45de153so71263906d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753717431; x=1754322231;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vravO/6khNRvhlPxzNQ/FnndOxyVsrk4qImwPP/3MTs=;
 b=vZsZ3zvBTzThhQdiqKMPx5F82ah42moDZTGYN8Hpmrl8IZnhg8AYLCSYQ0pgyLvdaP
 w14KX0uOWVlmIcJQrYRkWMnQXEjB4BxvwMtg+APd2FU3nLHYnIaqPguT3XXVkG/fyNiq
 tdYgogLX4WguV9T1MY7KdTJB1SxTmd5axVKcgqUpuO6fVFfBeJkm2E6mjUwkEWVYoQBP
 26plqRYPHTSPRKOrUlslObaRMEUIH/qj5NnkhPdfmGSkOA1o/FXPXyOO9T7HToyMHhBb
 iB8dl+/odwlaeL08y82dpWMFcMPN60MGZCVahNdCcMDWyHVH5l6f7xm8TuovQk7e7+SP
 v1uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/tFSRDg+6zBP42W87sl+qWUNdSe2i1+E4tP2uXahLuDQI7rBuMTuXC8HQEMz4HsZwA6xNQBYaBCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym1uk4FX414f9/ujiDA/v+/ogqZ/f777xG9fNWLLqhh8E1swHE
 WYIaKxlvBr79Cv/fXVVph8vi7up+3FuFkKJzCVM2L++gdGQKDAjHLimXnU0EmU2uQVgFK2mjzLG
 jfIYBGJ3CsNcGAXo3VvE0he4EF6Rj9y+9DvqNj872rh0ylZ8PvcgGumXZlJTXGQ1yBE9Cv6A=
X-Gm-Gg: ASbGncuLqywMz+DGnvA36lfSnAlUybfpwrx+NyK8dDQ6LKXSwxqa2aIgl/diDqfNRLO
 NgdJKZj+gWbKxyaZE+BmaigTfyi7sjU12A78ueKelgbUGM5UXd8uK7mIhUrMLZKmQXgoJP2yjsG
 8gJhe7frZOQxB75fsrSp6YWZ2hqvQLol2Qp+O2ISSSpbmL3ZvBh7I4BuAT46uUWhq3SVWztlKzG
 c/eOKfdd9esgWucnliQtqOd8q4EGstfFlCPuPOeMizObitIgIl3NIekOl1EhsbDsBH+T/lBz9eo
 qxbCKf/CEF21ldvhHPIjU3dlh3QqK0u7G+XbIJsAwFn4dBCmEoiYzd6A/cF98yb9Lj4xbkA4pod
 ghrMRpfajpJk70sRPV59cxxMIFT66dyQyMe4J0Bz6h6RRuCThLfkm
X-Received: by 2002:a05:6214:2526:b0:707:49d9:2580 with SMTP id
 6a1803df08f44-70749d928acmr45930256d6.32.1753717430502; 
 Mon, 28 Jul 2025 08:43:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9IABiVxzBbfc7hwa3mCRlg2TuSRU6F+DG1TSpnai1vC7ywlpehy/nsTnNAXNFPNLKo10uXQ==
X-Received: by 2002:a05:6214:2526:b0:707:49d9:2580 with SMTP id
 6a1803df08f44-70749d928acmr45929666d6.32.1753717429713; 
 Mon, 28 Jul 2025 08:43:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6316db8bsm1325177e87.5.2025.07.28.08.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 08:43:48 -0700 (PDT)
Date: Mon, 28 Jul 2025 18:43:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kevin Tang <kevin.tang@unisoc.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/12] drm: sprd: register a DSI bridge and move init
 code to pre_enable
Message-ID: <h555ivhoyfykmw44xch6y3bwlqtewgqks33j4rqw4zkcbdkxih@y4pori4lff6h>
References: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
 <20250719-ums9230-drm-v1-5-e4344a05eb3d@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250719-ums9230-drm-v1-5-e4344a05eb3d@abscue.de>
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=68879ab9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=fR7qSs6sQ28PYmOJ40wA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: RmBre9g-CorHFIA45h9uq7sUDamtHHBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDExNSBTYWx0ZWRfX/tlyjmkA/k9Z
 3/cWED0ZLsroGyxSvm29uIlpAw5J9eJ9EiGeArwHFlh/AoH2y4tl8PMVDvFRGjP9t8eoHrh/OCZ
 CZCya/itorru2zXaq7E7SQzPhk/1oWpEtROCeXwBM5nce2thLW4YoScA+3jgn1eDVfMAtrCGizq
 RmNsMzykGGbzG6RrjJglfxwCTfdQRrtPVBxhXZTqhR9z5d0YDz5cqFY3HmIxQKNG6TPmZNIl5ni
 yBui1BMyGhaANTiT1Nn0lWBupGRWpuDZcW1DbqYwO3fg5FOpN2vHdYftkCCxh4Sn6Zh+b4v5BFy
 cVZr7gLUUq/AkZgxP2ofZ/BjfHRyRmatMxKvSmg7TzeH3bLVjG80FMaXvWdUlHE26n3tQ600sz2
 z+xeDxWPo+r+g2/bvZbOjCXCsEE30wzmdY0EQWsplnnnWKdxRzfqpQDX5yfOnwCCVnaV4zKi
X-Proofpoint-ORIG-GUID: RmBre9g-CorHFIA45h9uq7sUDamtHHBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280115
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

On Sat, Jul 19, 2025 at 02:09:41PM +0200, Otto Pflüger wrote:
> If a panel needs to send DSI commands during initialization, it sets the
> prepare_prev_first flag, which allows the DSI host to initialize itself
> before the panel's prepare function is called. To support this, the DSI
> host must register a bridge and perform the necessary initialization
> steps in its pre_enable function.
> 
> Implement this for the Unisoc DSI driver by moving the initialization
> code from the encoder callbacks to a bridge and simplify the remaining
> encoder-related code which no longer needs any callbacks.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  drivers/gpu/drm/sprd/Kconfig    |   2 +
>  drivers/gpu/drm/sprd/sprd_dsi.c | 143 +++++++++++++++++++++++++---------------
>  drivers/gpu/drm/sprd/sprd_dsi.h |   4 ++
>  3 files changed, 97 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> index e22b780fe82248296a7153d02269faf8cd63294f..1afcdbf6f0ee3304f2297835241c9bb10d422154 100644
> --- a/drivers/gpu/drm/sprd/Kconfig
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -2,6 +2,8 @@ config DRM_SPRD
>  	tristate "DRM Support for Unisoc SoCs Platform"
>  	depends on ARCH_SPRD || COMPILE_TEST
>  	depends on DRM && OF
> +	select DRM_BRIDGE_CONNECTOR
> +	select DRM_DISPLAY_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_KMS_HELPER
>  	select DRM_MIPI_DSI
> diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
> index 23b0e1dc547a5023ee6ad7d5e1c49e2cec986bf0..43fff12d73f12619da57606a3c4785924e2c1507 100644
> --- a/drivers/gpu/drm/sprd/sprd_dsi.c
> +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> @@ -11,8 +11,10 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "sprd_drm.h"
>  #include "sprd_dpu.h"
> @@ -778,19 +780,53 @@ static void sprd_dphy_fini(struct dsi_context *ctx)
>  	dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_RESET_N, RF_PHY_RESET_N);
>  }
>  
> -static void sprd_dsi_encoder_mode_set(struct drm_encoder *encoder,
> -				      struct drm_display_mode *mode,
> -				 struct drm_display_mode *adj_mode)
> +static int sprd_dsi_encoder_init(struct sprd_dsi *dsi,
> +				 struct device *dev)
> +{
> +	struct drm_encoder *encoder = &dsi->encoder;
> +	u32 crtc_mask;
> +	int ret;
> +
> +	crtc_mask = drm_of_find_possible_crtcs(dsi->drm, dev->of_node);
> +	if (!crtc_mask) {
> +		drm_err(dsi->drm, "failed to find crtc mask\n");
> +		return -EINVAL;
> +	}
> +
> +	drm_dbg(dsi->drm, "find possible crtcs: 0x%08x\n", crtc_mask);
> +
> +	encoder->possible_crtcs = crtc_mask;
> +	ret = drm_simple_encoder_init(dsi->drm, encoder, DRM_MODE_ENCODER_DSI);

The drm_simple_* components are being deprecated. Please open-code
corresponding functionality.

> +	if (ret) {
> +		drm_err(dsi->drm, "failed to init dsi encoder\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
