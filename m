Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F248AD1203
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 14:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415410E028;
	Sun,  8 Jun 2025 12:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxhBEZ1k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E519710E04C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 12:41:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5589RDRT027781
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 12:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UojFT/XZ6ePN7/uDU9jLUIiF
 JtM7ROueqeCYkJKglhE=; b=pxhBEZ1kyw2vUQ2HuXlRVZ5Ktwt+ai+priEODoIp
 XpXxFtuwj5fwERvvmvlwK7oMfWoi2R0mGV7ZoRAuAfL3q2RSrVkUbMCOdMbsXNP8
 GJod2FEd7VTu1NfD5VtIoM8YCuTfs36OArv8kn71bJsITrb+4jIAph5WyKVHKCQ7
 3MkNQlA/X2BpWpOuhEkcKQThcJJpg+vEjHW+28yL/nil22+O8Qen7s2zNGqtChH5
 FJ9eWhe3XcGXQ4E1exuX+ZUHdOsAXTgKd4HzKwIAPWg/GbN7nmXPl8JVD1+lF3Rk
 d1Cv1nz/PhLBisIo5FqOK214Dh0+xNhzjAdwncrkj5xJ9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474crkty4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 12:41:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so505844485a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 05:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749386512; x=1749991312;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UojFT/XZ6ePN7/uDU9jLUIiFJtM7ROueqeCYkJKglhE=;
 b=Ale1zGdZHDo514ytlJa3epNtMJmiJASIIGHgJEsWr0socPIlUaimqchT2V5vu8TNNj
 h0tkjsb/lUdnLv5tSkSx4cYLeNY2ao+vfq7gT7oxNMr5cND1e59pYfMC+Tek/qMZuz2M
 CpEBC1ktl0ifs3LyZPu1A5MAhteZWYe6vxrWuPm+p7Q/SKxvbHf6Pfnqd1s2Rj60KRxN
 KoOb5x45toW++Ogt8VbFqs6tbuHXYfWXrQvRvR+vnxNcFZ4wN13ai2jeJaGgf4Lc5hUq
 /T2K/0tinCrWMYwFahXZe6BPQINh6kupYPBxQdzwX1SjWCrv7Ne/ckRquz2GjdHHvyIW
 DwWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa0pn6ENJdX4prflrEWbCE5LOP6w+3gfJ/GS1Za1hPCSbNxwUkDVXtv/JQAPOr9CNBTWPlBh1nNXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzErxA735rgEC6OPCqW/U0MwXupOaxqU9q2IYOJwpPN9W4GLLrX
 emA6AtsMVwwMPHC5hc75NbzPjx8smT75RWQnr2nkbnxVwx1WVimf4/R5W9B/C3V8nl4mG7cluju
 cZrWLd/ru68S8tz1Dhf80Gx2R35dvn56n6q2M4UNu5n/M4/MT81CXH37rykukJNOCB0E3UgU=
X-Gm-Gg: ASbGncurSv3T7FjTFG0UUXI2MhhwMpGM+4nYtDn2OdlpZmEleh1aGthHafQD+Q92sop
 AzGYyZfGgQGe8FwJ6dnOr6WsyVDenfIRUxbRqcZCS2Xir7SkES5KO1yZ2FW42uswqwbDn9PHBlP
 tc9Mo/yXmlwi+P+8V4CeAb/paGLNpOLWv+ECJ91tag9VhlS+CJMxNIXWIxVD8eHHSM/RBzNL5FI
 xXhDXoRUlYjau81lQoUa2XsGIGSsjzLf1rIQTwOwVvSTFKODeaXRQ1JxuGZ5nmm/i4TzsgH9hqW
 V1y1syj8Qlh0pY6km+FogS0nzIig7j4DKWrGtMWHLQgMV70aUzerhDP1Kq83UlIpMs/Ksss6N00
 Pd1spsE6dXQ==
X-Received: by 2002:a05:620a:2412:b0:7c7:9a85:d395 with SMTP id
 af79cd13be357-7d2298e8cf1mr1579437885a.44.1749386512072; 
 Sun, 08 Jun 2025 05:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMYJMwPY3R512JnCgj+i/35562ih+F9VmoYd/f7IRCFB56s2bhVP12Z8GD9lWPFgq/5GMC6A==
X-Received: by 2002:a05:620a:2412:b0:7c7:9a85:d395 with SMTP id
 af79cd13be357-7d2298e8cf1mr1579433485a.44.1749386511651; 
 Sun, 08 Jun 2025 05:41:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536773105bsm752884e87.195.2025.06.08.05.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 05:41:49 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:41:47 +0300
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
Subject: Re: [PATCH drm-dp 07/10] drm/hisilicon/hibmc: add dp encoder modeset
Message-ID: <tnd4pt3htbouufhcjm6lvtnmc54hmlxjqdztetwam6mgf257ko@xc5ftua25ojc>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-8-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-8-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=dsLbC0g4 c=1 sm=1 tr=0 ts=68458510 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=68so5tFH4fhIJVB1-RUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vBabyjoO-N72FkQCtUJ4uQ9Nts4prVRh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA5OSBTYWx0ZWRfXzf2v/DV2HXq8
 WKTzspx+2X4YAapqta8v0LM6j9yvG2X+AG0tO4dwkJbI15GTIq9iKU7BexykIiJxUXriiL/gO7U
 N5A9fnZ7Xm5aAPcHNXI1xRMhvI87+Y2QlsGUFa66t7HTCYWz+NLTlkMOOVHydloGGwex7Zc4gGv
 O+wRe22j6o/8WUppL0aLguUYw3Dr9hv79vg8NYRdtS+vY5JKkuw1s7Qh6OI7Lh5e/raF7Y3grjC
 1KE3JIB0Mtj90gOdaYmnS7Cr8SR4jmswg12vONlZUMPReln23x3gs93ttgDoD2UlN54ka54j62G
 9rsrn5vhXeZhJd8ydDA27wTlsMubt1gUCyVKGPP+dL/Vh+I39F8QtamP/v1ScfNbR0V7YKYbwy0
 qAtOaWOukopYyPK3e391lg8wLAdup3aVO3Hz8NZ0iu0niEwc/BsGHEnpalWNTK2iUoMsHA9Q
X-Proofpoint-ORIG-GUID: vBabyjoO-N72FkQCtUJ4uQ9Nts4prVRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080099
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

On Fri, May 30, 2025 at 05:54:29PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add GPU display control enable in dp_mode_set(), which is already
> in vdac's mode_set, however, if vdac is not connected, GPU
> cannot work.
> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")

Typically, incorrect tag.

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index e4b13f21ccb3..d9ae7567ebb7 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_edid.h>
>  
>  #include "hibmc_drm_drv.h"
> +#include "hibmc_drm_regs.h"
>  #include "dp/dp_hw.h"
>  
>  #define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> @@ -169,9 +170,26 @@ static void hibmc_dp_encoder_disable(struct drm_encoder *drm_encoder,
>  	hibmc_dp_display_en(dp, false);
>  }
>  
> +static void hibmc_dp_encoder_mode_set(struct drm_encoder *encoder,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	struct drm_device *dev = encoder->dev;
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> +	u32 reg;
> +
> +	reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
> +	reg |= HIBMC_DISPLAY_CONTROL_FPVDDEN(1);
> +	reg |= HIBMC_DISPLAY_CONTROL_PANELDATE(1);
> +	reg |= HIBMC_DISPLAY_CONTROL_FPEN(1);
> +	reg |= HIBMC_DISPLAY_CONTROL_VBIASEN(1);
> +	writel(reg, priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);

This is a c&p of the corresponding VDAC code. Please move it to a common
function instead.

BTW: what does it mean that the GPU cannot work? Do you mean that the
display hardware doesn't work or that the GL calls do not work?

> +}
> +
>  static const struct drm_encoder_helper_funcs hibmc_dp_encoder_helper_funcs = {
>  	.atomic_enable = hibmc_dp_encoder_enable,
>  	.atomic_disable = hibmc_dp_encoder_disable,
> +	.atomic_mode_set = hibmc_dp_encoder_mode_set,
>  };
>  
>  irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
