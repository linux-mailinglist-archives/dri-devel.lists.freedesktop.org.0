Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470FBA1C5A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 00:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338B210E2F0;
	Thu, 25 Sep 2025 22:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzBQq0Ov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D966E10E2E1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:20:08 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQJxp001159
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PAewdrLS4ShiQHSlOEbCDf49
 VxM97JQeD07eIU7Fxrw=; b=AzBQq0OvfMvcJzkkRh2l/d06d1LhSf0F//3sEwe0
 iuVPRkECYyx5NEfPdAZX5EKVCO7LjKiBcNJ++02ftUVxorL1cn+e53GVodiMkTWg
 XH3yj5XFF7WCjS7W8Rg+g4XrGwhPKd+05C/vkdiE2ELJ6e47AhNwqUrq40q22Go9
 9/GN2Ubz1H22dxlp2gsWbw1KhqFLGVHPnSYN8XrE11zuPVcPK7kSVNK4FyW6r6Uf
 Et8skCQ9gYNtwb4SI7dDN/lPSD/uPJef+9HLsZUxXXnJBp0pVuh1If2Q/zH03sdj
 WB8Yy6WlPCXWsVwDwjMlHJCORCZnV0MhPBHNFTDwfEseUA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0trjcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:20:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b31bea5896so18899491cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758838807; x=1759443607;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PAewdrLS4ShiQHSlOEbCDf49VxM97JQeD07eIU7Fxrw=;
 b=HJokXGGEew0YSWSSBbydkOYi04i6wPDkZ2MwQvQmCmOs9UxcnUvSjTC1mHMQ3B2DMj
 mhaipNmlWkO8+1kbLxZcMlxyTpz8QeAsEIPZvepcwdesV1VqzT2LRAZqJibnFfNsoBKV
 zAOjznfA58eifUa73J6nPNx16dNMfd9q3Y0tx7bX+HGdw1/v5qsXktpUd9EbXfNziQOB
 KS/V/YdXmV4kcvZJzSVQzMcve6GnshoSYozdsSzhEt5J9ZocIO9dUTZnn5O3SIKFyjY4
 5MrmM78goh4tQFdi/M4luKYLcvkqa21OJlVaJzb3w1gotTGca4LVdunOw9DWfnuxDHt9
 YgeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVdBYqgNvZpLo3NjbHikB9nP5dbyMHWpJ0RrCHlS8KQXh5zS5A+fmUDgYfQM6+m5SzZAfg5ngZcxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBXAfx9FAqCjRylVQz0eh/0QwHrD/Sclzw0YX3lMzot6D59mVc
 +9XYexYrC7fGwsGClJGBPaz2fhq2Yr9Xtr+27RwPOZ1uYD3ko686LwmlDel5gu0gXccIGqNIbLL
 onALH2uA0FOFGMK9Xcmw3CzpOEOMDstpepp1KnagY2LsSbea7/bMotCKlu4/3D4zKWO8NP4E=
X-Gm-Gg: ASbGnctAE8jXwxy6713Jy+FubMEr5t7DfdamezPbvoxeCOIC43YK7ngPssyLBEJYfeL
 ofxp4ZaYnTmSHbViM6WhyWPDgP8hvXxNcjjmQONGiumiLYF+IQToK4DemeoEU5EipQsjTEsn+Yv
 twIuz2Jjpj76fYBD6auh6KYyA9D24lj8SqUfpmp0CK/EPKsdIjLfS8rXQ5hD3olmByp5Xwjv/hz
 leuxMlZcKsXyCUzaQ+JpE232sMdx/oaHSsxzjHAKA1JTpeEDZJi9gRDc6QFpbMaexnfgvs36w51
 q+YVsbZPpt70AyBJg1vKcdsvEkGnvxJFeNwxACYp0jpQYCQBmyKMPIeVq0kMEYtqpQcJHEW2MNG
 J1VPJBC1YD894YpJXnnk3PttlNWDKesnW+tL9H2dDuAfSpkDEELfx
X-Received: by 2002:a05:622a:2ce:b0:4da:16c:6cec with SMTP id
 d75a77b69052e-4da4d126c4bmr84482001cf.81.1758838806742; 
 Thu, 25 Sep 2025 15:20:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4HtyK3D+lxw1G11l+Upt+M+LOMFPa8NJQomKtblJY2LR37nn1imEjt2mWvrplrm4vdWiChQ==
X-Received: by 2002:a05:622a:2ce:b0:4da:16c:6cec with SMTP id
 d75a77b69052e-4da4d126c4bmr84481301cf.81.1758838805879; 
 Thu, 25 Sep 2025 15:20:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316a31e48sm1139883e87.110.2025.09.25.15.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:20:03 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:20:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chu Guangqing <chuguangqing@inspur.com>
Cc: tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.cc, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 1/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000
 soc chipset
Message-ID: <h6w2ifsst7svptler3enbrq2ta2kgmscypgf5f7mprthgtrxuf@cj4ja7ubq2za>
References: <ouli257ffd7ocmwzywxq5zlapw7j4aqowy3oeu74x46dmpymah@b6r7py6bixsp>
 <20250925091715.12739-1-chuguangqing@inspur.com>
 <20250925091715.12739-2-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925091715.12739-2-chuguangqing@inspur.com>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d5c017 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=F_93P0QhAAAA:8 a=VwQbUJbxAAAA:8 a=o_bKC_3AcxkJhOCSXU8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=v2fne3mUlQEKA94IZ0Od:22
X-Proofpoint-GUID: 8_CRyN_zSNsdNBsl57Z9PEqoFybChXx1
X-Proofpoint-ORIG-GUID: 8_CRyN_zSNsdNBsl57Z9PEqoFybChXx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX2SVu4/rsPJ34
 SYBPfPOKKIV6xyE4HoWc+eonHIdnhC9Ebw0lk5RuSsT5EIafeEcXQBSdNXl10sbn1zRhrNBIKSb
 FC9XhASA5A9QcImvU1MdQS2QUbJrGaF0KR4hf0J2mGemViN0A1fbgnt2dswpszCww8vaJBm8vqJ
 4H0H1oZODrP7zXtCmuuV6XZMNwNE9I7xVMFeav4nxaS8iQJLL66enkmGV+y4/4RmqBzfhSlRa5N
 F7v8XK2nDue5woTLTQ3CiPtzJ5EKNMN1mcgQmZcHSeGO9FF71YGcvg4kZI3AZoezbIaWHj5Vl8W
 +YdRh9XW5Sn0UQ54IH5McN2t8fMDcZaqjXf9UMJSXV8He8g6vm7nYj2JeppC6meWXfn/ZnuhKEj
 kAKU2LPu0tyPBPXc56UzyJj7T9G9Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 05:17:15PM +0800, Chu Guangqing wrote:
> add support for Yhgc BMC soc chipset
> 
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> ---
>  MAINTAINERS                            |   5 +
>  drivers/gpu/drm/Kconfig                |   2 +
>  drivers/gpu/drm/Makefile               |   1 +
>  drivers/gpu/drm/yhgch/Kconfig          |  11 +
>  drivers/gpu/drm/yhgch/Makefile         |   4 +
>  drivers/gpu/drm/yhgch/yhgch_drm_de.c   | 415 +++++++++++++++++++++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_drv.c  | 310 ++++++++++++++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_drv.h  |  51 +++
>  drivers/gpu/drm/yhgch/yhgch_drm_i2c.c  | 114 +++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_regs.h | 208 +++++++++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_vdac.c | 121 +++++++
>  11 files changed, 1242 insertions(+)
>  create mode 100644 drivers/gpu/drm/yhgch/Kconfig
>  create mode 100644 drivers/gpu/drm/yhgch/Makefile
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_de.c
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.c
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.h
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_i2c.c
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_regs.h
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10614ca41ed0..c79d9361fa81 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27744,6 +27744,11 @@ S:	Maintained
>  F:	Documentation/input/devices/yealink.rst
>  F:	drivers/input/misc/yealink.*
>  
> +YHGC DRM DRIVER
> +M:	chuguangqing <chuguangqing@inspur.com>
> +S:	Maintained
> +F:	drivers/gpu/drm/yhgch
> +
>  Z8530 DRIVER FOR AX.25
>  M:	Joerg Reuter <jreuter@yaina.de>
>  L:	linux-hams@vger.kernel.org
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f7ea8e895c0c..8e0b1d12c81f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -396,6 +396,8 @@ source "drivers/gpu/drm/sprd/Kconfig"
>  
>  source "drivers/gpu/drm/imagination/Kconfig"
>  
> +source "drivers/gpu/drm/yhgch/Kconfig"
> +
>  config DRM_HYPERV
>  	tristate "DRM Support for Hyper-V synthetic video device"
>  	depends on DRM && PCI && HYPERV
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 4dafbdc8f86a..f344e0173b29 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -231,6 +231,7 @@ obj-y			+= solomon/
>  obj-$(CONFIG_DRM_SPRD) += sprd/
>  obj-$(CONFIG_DRM_LOONGSON) += loongson/
>  obj-$(CONFIG_DRM_POWERVR) += imagination/
> +obj-$(CONFIG_DRM_YHGCH)  += yhgch/
>  
>  # Ensure drm headers are self-contained and pass kernel-doc
>  hdrtest-files := \
> diff --git a/drivers/gpu/drm/yhgch/Kconfig b/drivers/gpu/drm/yhgch/Kconfig
> new file mode 100644
> index 000000000000..695d29409444
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/Kconfig
> @@ -0,0 +1,11 @@
> +config DRM_YHGCH
> +    tristate "DRM Support for Yhgch BMC"
> +    depends on DRM && PCI && MMU
> +    select DRM_CLIENT_SELECTION
> +    select DRM_KMS_HELPER
> +    select DRM_GEM_SHMEM_HELPER
> +    help
> +        Choose this option if you have a Yhgch soc chipset.
> +        If M is selected the module will be called yhgch-drm.
> +        IF Y is selected the module will be built into the kernel.
> +        IF N is selected the module will be excluded from the kernel.
> diff --git a/drivers/gpu/drm/yhgch/Makefile b/drivers/gpu/drm/yhgch/Makefile
> new file mode 100644
> index 000000000000..30de2fd27f18
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/Makefile
> @@ -0,0 +1,4 @@
> +yhgch-drm-y := yhgch_drm_drv.o yhgch_drm_de.o yhgch_drm_vdac.o yhgch_drm_i2c.o
> +
> +obj-$(CONFIG_DRM_YHGCH) += yhgch-drm.o
> +
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_de.c b/drivers/gpu/drm/yhgch/yhgch_drm_de.c
> new file mode 100644
> index 000000000000..c2c38c3e7637
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_de.c
> @@ -0,0 +1,415 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/delay.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_fourcc.h>
> +
> +#include <drm/drm_vblank.h>
> +
> +#include "yhgch_drm_drv.h"
> +#include "yhgch_drm_regs.h"
> +
> +struct yhgch_dislay_pll_config {
> +	u64 hdisplay;
> +	u64 vdisplay;
> +	u32 pll1_config_value;
> +	u32 pll2_config_value;
> +};
> +
> +static const struct yhgch_dislay_pll_config yhgch_pll_table[] = {
> +	{ 640, 480, CRT_PLL1_NS_25MHZ, CRT_PLL2_NS_25MHZ },
> +	{ 800, 600, CRT_PLL1_NS_40MHZ, CRT_PLL2_NS_40MHZ },
> +	{ 1024, 768, CRT_PLL1_NS_65MHZ, CRT_PLL2_NS_65MHZ },
> +	{ 1280, 1024, CRT_PLL1_NS_108MHZ, CRT_PLL2_NS_108MHZ },
> +	{ 1920, 1080, CRT_PLL1_NS_148MHZ, CRT_PLL2_NS_148MHZ },
> +};
> +
> +static int yhgch_plane_atomic_check(struct drm_plane *plane,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> +										 plane);
> +	struct drm_framebuffer *fb = new_plane_state->fb;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +	int ret;
> +
> +	if (!fb)
> +		return 0;
> +
> +	if (new_plane_state->crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
> +
> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, true);
> +	if (ret)
> +		return ret;
> +	if (!new_plane_state->visible)
> +		return 0;
> +
> +	return 0;

Hmm, can you simplify that to just:

return drm_atomic_helper_check_plane_state(); ?

> +}
> +

[...]

> +
> +static const struct drm_crtc_funcs yhgch_crtc_funcs = {
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.set_config = drm_atomic_helper_set_config,
> +	.destroy = drm_crtc_cleanup,
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +

Extra empty line

> +};
> +
> +static const struct drm_crtc_helper_funcs yhgch_crtc_helper_funcs = {
> +	.mode_set_nofb = yhgch_crtc_mode_set_nofb,
> +	.atomic_begin = yhgch_crtc_atomic_begin,
> +	.atomic_enable = yhgch_crtc_atomic_enable,
> +	.atomic_disable = yhgch_crtc_atomic_disable,
> +	.mode_valid = yhgch_crtc_mode_valid,
> +};
> +
> +int yhgch_de_init(struct yhgch_drm_private *priv)
> +{
> +	struct drm_device *dev = &priv->dev;
> +	struct drm_crtc *crtc = &priv->crtc;
> +	struct drm_plane *plane = &priv->primary_plane;
> +	int ret;
> +
> +	ret = drm_universal_plane_init(dev, plane, 1, &yhgch_plane_funcs,
> +				       channel_formats1,
> +				       ARRAY_SIZE(channel_formats1),
> +				       NULL,
> +				       DRM_PLANE_TYPE_PRIMARY,
> +				       NULL);
> +	if (ret) {
> +		drm_err(dev, "failed to init plane: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_plane_helper_add(plane, &yhgch_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(plane);
> +
> +	ret = drm_crtc_init_with_planes(dev, crtc, plane,
> +					NULL, &yhgch_crtc_funcs, NULL);
> +	if (ret) {
> +		drm_err(dev, "failed to init crtc: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_crtc_helper_add(crtc, &yhgch_crtc_helper_funcs);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_drv.c b/drivers/gpu/drm/yhgch/yhgch_drm_drv.c
> new file mode 100644
> index 000000000000..2d7588ab8e2c
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_drv.c
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/bitfield.h>
> +
> +#include <linux/aperture.h>
> +#include <drm/clients/drm_client_setup.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_ttm.h>
> +
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_fbdev_shmem.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_module.h>
> +#include <drm/drm_vblank.h>
> +
> +#include <drm/drm_probe_helper.h>
> +
> +#include "yhgch_drm_drv.h"
> +#include "yhgch_drm_regs.h"
> +
> +#define MEM_SIZE_RESERVE4KVM 0x200000
> +
> +DEFINE_DRM_GEM_FOPS(yhgch_fops);
> +
> +int yhgch_dumb_create(struct drm_file *file, struct drm_device *dev,
> +		      struct drm_mode_create_dumb *args)
> +{
> +	args->width = ALIGN(args->width, 8);
> +	return drm_gem_shmem_dumb_create(file, dev, args);
> +}
> +
> +static struct drm_driver yhgch_driver = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops = &yhgch_fops,
> +	.name = "yhgch",
> +	.desc = "yhgch drm driver",
> +	.major = 3,
> +	.minor = 1,
> +	.dumb_create = yhgch_dumb_create,
> +	DRM_FBDEV_SHMEM_DRIVER_OPS,
> +};
> +
> +static int __maybe_unused yhgch_pm_suspend(struct device *dev)
> +{
> +	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +
> +	return drm_mode_config_helper_suspend(drm_dev);
> +}
> +
> +static int __maybe_unused yhgch_pm_resume(struct device *dev)
> +{
> +	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +
> +	return drm_mode_config_helper_resume(drm_dev);
> +}
> +
> +static const struct dev_pm_ops yhgch_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(yhgch_pm_suspend,
> +				yhgch_pm_resume)
> +};
> +
> +static const struct drm_mode_config_funcs yhgch_mode_funcs = {
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +};
> +
> +static int yhgch_kms_init(struct yhgch_drm_private *priv)
> +{
> +	struct drm_device *dev = &priv->dev;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
> +
> +	dev->mode_config.min_width = 0;
> +	dev->mode_config.min_height = 0;
> +	dev->mode_config.max_width = 1920;
> +	dev->mode_config.max_height = 1200;
> +	dev->mode_config.preferred_depth = 24;
> +	dev->mode_config.prefer_shadow = 1;
> +	dev->mode_config.funcs = &yhgch_mode_funcs;
> +
> +	ret = yhgch_de_init(priv);
> +	if (ret) {
> +		drm_err(dev, "failed to init de: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = yhgch_vdac_init(priv);
> +	if (ret) {
> +		drm_err(dev, "failed to init vdac: %d\n", ret);
> +		return ret;
> +	}
> +	drm_kms_helper_poll_init(dev);
> +
> +	return 0;
> +}
> +
> +/*
> + * It can operate in one of three modes: 0, 1 or Sleep.
> + */
> +void yhgch_set_power_mode(struct yhgch_drm_private *priv, u32 power_mode)
> +{
> +	unsigned int control_value = 0;
> +	void __iomem *mmio = priv->mmio;
> +	u32 input = 1;
> +
> +	if (power_mode > YHGCH_PW_MODE_CTL_MODE_SLEEP)
> +		return;
> +
> +	if (power_mode == YHGCH_PW_MODE_CTL_MODE_SLEEP)
> +		input = 0;
> +
> +	control_value = readl(mmio + YHGCH_POWER_MODE_CTRL);
> +	control_value &= ~(YHGCH_PW_MODE_CTL_MODE_MASK |
> +			   YHGCH_PW_MODE_CTL_OSC_INPUT_MASK);
> +	control_value |= FIELD_PREP(YHGCH_PW_MODE_CTL_MODE_MASK, power_mode);
> +	control_value |= FIELD_PREP(YHGCH_PW_MODE_CTL_OSC_INPUT_MASK, input);
> +	writel(control_value, mmio + YHGCH_POWER_MODE_CTRL);
> +}
> +
> +void yhgch_set_current_gate(struct yhgch_drm_private *priv, unsigned int gate)
> +{
> +	u32 gate_reg;
> +	u32 mode;
> +	void __iomem *mmio = priv->mmio;
> +
> +	/* Get current power mode. */
> +	mode = (readl(mmio + YHGCH_POWER_MODE_CTRL) &
> +		YHGCH_PW_MODE_CTL_MODE_MASK) >> YHGCH_PW_MODE_CTL_MODE_SHIFT;
> +
> +	switch (mode) {
> +	case YHGCH_PW_MODE_CTL_MODE_MODE0:
> +		gate_reg = YHGCH_MODE0_GATE;
> +		break;
> +
> +	case YHGCH_PW_MODE_CTL_MODE_MODE1:
> +		gate_reg = YHGCH_MODE1_GATE;
> +		break;
> +
> +	default:
> +		gate_reg = YHGCH_MODE0_GATE;
> +		break;
> +	}
> +	writel(gate, mmio + gate_reg);
> +}
> +
> +static void yhgch_hw_config(struct yhgch_drm_private *priv)
> +{
> +	u32 reg;
> +
> +	/* On hardware reset, power mode 0 is default. */
> +	yhgch_set_power_mode(priv, YHGCH_PW_MODE_CTL_MODE_MODE0);
> +
> +	/* Enable display power gate & LOCALMEM power gate */
> +	reg = readl(priv->mmio + YHGCH_CURRENT_GATE);
> +	reg &= ~YHGCH_CURR_GATE_DISPLAY_MASK;
> +	reg &= ~YHGCH_CURR_GATE_LOCALMEM_MASK;
> +	reg |= YHGCH_CURR_GATE_DISPLAY(1);
> +	reg |= YHGCH_CURR_GATE_LOCALMEM(1);
> +
> +	yhgch_set_current_gate(priv, reg);
> +
> +	/*
> +	 * Reset the memory controller. If the memory controller
> +	 * is not reset in chip,the system might hang when sw accesses
> +	 * the memory.The memory should be resetted after
> +	 * changing the MXCLK.
> +	 */
> +	reg = readl(priv->mmio + YHGCH_MISC_CTRL);
> +	reg &= ~YHGCH_MSCCTL_LOCALMEM_RESET_MASK;
> +	reg |= YHGCH_MSCCTL_LOCALMEM_RESET(0);
> +	writel(reg, priv->mmio + YHGCH_MISC_CTRL);
> +
> +	reg &= ~YHGCH_MSCCTL_LOCALMEM_RESET_MASK;
> +	reg |= YHGCH_MSCCTL_LOCALMEM_RESET(1);
> +
> +	writel(reg, priv->mmio + YHGCH_MISC_CTRL);
> +}
> +
> +static int yhgch_hw_map(struct yhgch_drm_private *priv)
> +{
> +	struct drm_device *dev = &priv->dev;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +	resource_size_t ioaddr, iosize;
> +
> +	ioaddr = pci_resource_start(pdev, 1);
> +	iosize = pci_resource_len(pdev, 1);
> +	priv->mmio = devm_ioremap(dev->dev, ioaddr, iosize);
> +	if (!priv->mmio) {
> +		drm_err(dev, "Cannot map mmio region\n");
> +		return -ENOMEM;
> +	}
> +
> +	ioaddr = pci_resource_start(pdev, 0);
> +	iosize = pci_resource_len(pdev, 0);
> +	priv->vram_base = devm_ioremap_wc(dev->dev, ioaddr, iosize);
> +	if (!priv->vram_base) {
> +		drm_err(dev, "Cannot map vram region\n");
> +		return -ENOMEM;
> +	}
> +	return 0;
> +}
> +
> +static int yhgch_hw_init(struct yhgch_drm_private *priv)
> +{
> +	int ret;
> +
> +	ret = yhgch_hw_map(priv);
> +	if (ret)
> +		return ret;
> +	yhgch_hw_config(priv);
> +	return 0;
> +}
> +
> +static int yhgch_pci_probe(struct pci_dev *pdev,
> +			   const struct pci_device_id *ent)
> +{
> +	struct yhgch_drm_private *priv;
> +	struct drm_device *dev;
> +	int ret;
> +
> +	ret = aperture_remove_conflicting_pci_devices(pdev, yhgch_driver.name);
> +
> +	if (ret)
> +		return ret;
> +
> +	priv = devm_drm_dev_alloc(&pdev->dev, &yhgch_driver,
> +				  struct yhgch_drm_private, dev);
> +
> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
> +
> +	dev = &priv->dev;
> +	pci_set_drvdata(pdev, dev);
> +
> +	ret = pcim_enable_device(pdev);
> +	if (ret) {
> +		drm_err(dev, "failed to enable pci device: %d\n", ret);
> +		goto err_return;
> +	}
> +
> +	ret = yhgch_hw_init(priv);
> +	if (ret)
> +		goto err_return;
> +
> +	ret = yhgch_kms_init(priv);
> +	if (ret)
> +		goto err_return;
> +
> +	ret = pci_enable_msi(pdev);
> +	if (ret)
> +		drm_warn(dev, "enabling MSI failed: %d\n", ret);
> +	/* reset all the states of crtc/plane/encoder/connector */
> +	drm_mode_config_reset(dev);
> +
> +	ret = drm_dev_register(dev, 0);
> +	if (ret) {
> +		drm_err(dev, "failed to register drv for userspace access: %d\n",
> +			ret);
> +		goto err_return;
> +	}
> +	drm_client_setup(dev, NULL);
> +
> +	return 0;
> +
> +err_return:
> +	return ret;
> +}
> +
> +static void yhgch_pci_remove(struct pci_dev *pdev)
> +{
> +	struct drm_device *dev = pci_get_drvdata(pdev);
> +
> +	drm_dev_unregister(dev);
> +	drm_dev_put(dev);
> +}
> +
> +static void yhgch_pci_shutdown(struct pci_dev *pdev)
> +{
> +	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
> +}
> +
> +static struct pci_device_id yhgch_pci_table[] = {
> +	{ 0x1bd4, 0x0750, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
> +	{ 0, }
> +};
> +
> +static struct pci_driver yhgch_pci_driver = {
> +	.name = "yhgch-drm",
> +	.id_table = yhgch_pci_table,
> +	.probe = yhgch_pci_probe,
> +	.remove = yhgch_pci_remove,
> +	.shutdown = yhgch_pci_shutdown,
> +	.driver.pm = &yhgch_pm_ops,
> +};
> +
> +drm_module_pci_driver(yhgch_pci_driver);
> +
> +MODULE_DEVICE_TABLE(pci, yhgch_pci_table);
> +MODULE_AUTHOR("Chu Guangqing <chuguangqing@inspur.com>");
> +MODULE_DESCRIPTION("DRM Driver for YhgchBMC");
> +MODULE_LICENSE("GPL");
> +MODULE_VERSION("3.1");
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_drv.h b/drivers/gpu/drm/yhgch/yhgch_drm_drv.h
> new file mode 100644
> index 000000000000..1b8b1e5b0a43
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_drv.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef YHGCH_DRM_DRV_H
> +#define YHGCH_DRM_DRV_H
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c-algo-bit.h>
> +#include <linux/i2c.h>
> +#include <linux/version.h>
> +#include <linux/bitfield.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_encoder.h>
> +
> +struct yhgch_ddc {
> +	struct yhgch_drm_private *priv;
> +	struct i2c_adapter adapter;
> +	struct i2c_algo_bit_data bit_data;
> +};
> +
> +struct yhgch_drm_private {
> +	/* hw */
> +	void __iomem *mmio;
> +	void __iomem *vram_base;
> +
> +	/* drm */
> +	struct drm_device dev;
> +	struct drm_plane primary_plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +};
> +
> +static inline struct yhgch_drm_private *to_yhgch_drm_private(struct drm_device *dev)
> +{
> +	return container_of(dev, struct yhgch_drm_private, dev);
> +}
> +
> +void yhgch_set_power_mode(struct yhgch_drm_private *priv,
> +			  u32 power_mode);
> +void yhgch_set_current_gate(struct yhgch_drm_private *priv,
> +			    u32 gate);
> +
> +int yhgch_de_init(struct yhgch_drm_private *priv);
> +int yhgch_vdac_init(struct yhgch_drm_private *priv);
> +int yhgch_mm_init(struct yhgch_drm_private *yhgch);
> +struct i2c_adapter *yhgch_ddc_create(struct yhgch_drm_private *priv);
> +
> +int yhgch_dumb_create(struct drm_file *file, struct drm_device *dev,
> +		      struct drm_mode_create_dumb *args);
> +
> +#endif
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_i2c.c b/drivers/gpu/drm/yhgch/yhgch_drm_i2c.c
> new file mode 100644
> index 000000000000..7bbe9a0540d4
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_i2c.c
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/delay.h>
> +#include <linux/pci.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "yhgch_drm_drv.h"
> +
> +#define GPIO_DATA		0x0802A0
> +#define GPIO_DATA_DIRECTION	0x0802A4
> +
> +#define I2C_SCL_MASK		BIT(0)
> +#define I2C_SDA_MASK		BIT(1)
> +
> +static void yhgch_set_i2c_signal(void *data, u32 mask, int value)
> +{
> +	struct yhgch_ddc *ddc = data;
> +	struct yhgch_drm_private *priv = ddc->priv;
> +	u32 tmp_dir = readl(priv->mmio + GPIO_DATA_DIRECTION);
> +
> +	if (value) {
> +		tmp_dir &= ~mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	} else {
> +		u32 tmp_data = readl(priv->mmio + GPIO_DATA);
> +
> +		tmp_data &= ~mask;
> +		writel(tmp_data, priv->mmio + GPIO_DATA);
> +
> +		tmp_dir |= mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	}
> +}
> +
> +static int yhgch_get_i2c_signal(void *data, u32 mask)
> +{
> +	struct yhgch_ddc *ddc = data;
> +	struct yhgch_drm_private *priv = ddc->priv;
> +	u32 tmp_dir = readl(priv->mmio + GPIO_DATA_DIRECTION);
> +
> +	if ((tmp_dir & mask) != mask) {
> +		tmp_dir &= ~mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	}
> +
> +	return (readl(priv->mmio + GPIO_DATA) & mask) ? 1 : 0;
> +}
> +
> +static void yhgch_ddc_setsda(void *data, int state)
> +{
> +	yhgch_set_i2c_signal(data, I2C_SDA_MASK, state);
> +}
> +
> +static void yhgch_ddc_setscl(void *data, int state)
> +{
> +	yhgch_set_i2c_signal(data, I2C_SCL_MASK, state);
> +}
> +
> +static int yhgch_ddc_getsda(void *data)
> +{
> +	return yhgch_get_i2c_signal(data, I2C_SDA_MASK);
> +}
> +
> +static int yhgch_ddc_getscl(void *data)
> +{
> +	return yhgch_get_i2c_signal(data, I2C_SCL_MASK);
> +}
> +
> +static void yhgch_ddc_release(struct drm_device *dev, void *res)
> +{
> +	struct yhgch_ddc *ddc = res;
> +
> +	i2c_del_adapter(&ddc->adapter);
> +}
> +
> +struct i2c_adapter *yhgch_ddc_create(struct yhgch_drm_private *priv)
> +{
> +	int ret = 0;
> +	struct yhgch_ddc *ddc;
> +	struct drm_device *dev = &priv->dev;
> +
> +	ddc = drmm_kzalloc(dev, sizeof(struct yhgch_ddc), GFP_KERNEL);
> +	if (!ddc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ddc->adapter.owner = THIS_MODULE;
> +	ddc->priv = priv;
> +	snprintf(ddc->adapter.name, I2C_NAME_SIZE, "INS i2c bit bus");
> +	ddc->adapter.dev.parent = priv->dev.dev;
> +	i2c_set_adapdata(&ddc->adapter, ddc);
> +	ddc->adapter.algo_data = &ddc->bit_data;
> +
> +	ddc->bit_data.udelay = 20;
> +	ddc->bit_data.timeout = usecs_to_jiffies(2000);
> +	ddc->bit_data.data = ddc;
> +	ddc->bit_data.setsda = yhgch_ddc_setsda;
> +	ddc->bit_data.setscl = yhgch_ddc_setscl;
> +	ddc->bit_data.getsda = yhgch_ddc_getsda;
> +	ddc->bit_data.getscl = yhgch_ddc_getscl;
> +
> +	ret = i2c_bit_add_bus(&ddc->adapter);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = drmm_add_action_or_reset(&priv->dev, yhgch_ddc_release, ddc);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &ddc->adapter;
> +}
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_regs.h b/drivers/gpu/drm/yhgch/yhgch_drm_regs.h
> new file mode 100644
> index 000000000000..cecb6173a445
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_regs.h
> @@ -0,0 +1,208 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef YHGCH_DRM_HW_H
> +#define YHGCH_DRM_HW_H
> +
> +/* register definition */
> +#define YHGCH_MISC_CTRL				0x4
> +
> +#define YHGCH_MSCCTL_LOCALMEM_RESET(x)		((x) << 6)
> +#define YHGCH_MSCCTL_LOCALMEM_RESET_MASK	0x40
> +
> +#define YHGCH_CURRENT_GATE			0x000040
> +#define YHGCH_CURR_GATE_DISPLAY(x)		((x) << 2)
> +#define YHGCH_CURR_GATE_DISPLAY_MASK		0x4
> +
> +#define YHGCH_CURR_GATE_LOCALMEM(x)		((x) << 1)
> +#define YHGCH_CURR_GATE_LOCALMEM_MASK		0x2
> +
> +#define YHGCH_MODE0_GATE			0x000044
> +#define YHGCH_MODE1_GATE			0x000048
> +#define YHGCH_POWER_MODE_CTRL			0x00004C
> +
> +#define YHGCH_PW_MODE_CTL_OSC_INPUT(x)		((x) << 3)
> +#define YHGCH_PW_MODE_CTL_OSC_INPUT_MASK	0x8
> +
> +#define YHGCH_PW_MODE_CTL_MODE(x)		((x) << 0)
> +#define YHGCH_PW_MODE_CTL_MODE_MASK		0x03
> +#define YHGCH_PW_MODE_CTL_MODE_SHIFT		0
> +
> +#define YHGCH_PW_MODE_CTL_MODE_MODE0		0
> +#define YHGCH_PW_MODE_CTL_MODE_MODE1		1
> +#define YHGCH_PW_MODE_CTL_MODE_SLEEP		2
> +
> +//#define YHGCH_CRT_PLL_CTRL                   0x000060
> +
> +#define YHGCH_PLL_CTRL_BYPASS(x)		((x) << 18)
> +#define YHGCH_PLL_CTRL_BYPASS_MASK		0x40000
> +
> +#define YHGCH_PLL_CTRL_POWER(x)			((x) << 17)
> +#define YHGCH_PLL_CTRL_POWER_MASK		0x20000
> +
> +#define YHGCH_PLL_CTRL_INPUT(x)			((x) << 16)
> +#define YHGCH_PLL_CTRL_INPUT_MASK		0x10000
> +
> +#define YHGCH_PLL_CTRL_POD(x)			((x) << 14)
> +#define YHGCH_PLL_CTRL_POD_MASK			0xC000
> +
> +#define YHGCH_PLL_CTRL_OD(x)			((x) << 12)
> +#define YHGCH_PLL_CTRL_OD_MASK			0x3000
> +
> +#define YHGCH_PLL_CTRL_N(x)			((x) << 8)
> +#define YHGCH_PLL_CTRL_N_MASK			0xF00
> +
> +#define YHGCH_PLL_CTRL_M(x)			((x) << 0)
> +#define YHGCH_PLL_CTRL_M_MASK			0xFF
> +
> +#define YHGCH_CRT_DISP_CTL			0x80200
> +
> +#define YHGCH_CRT_DISP_CTL_DPMS(x)		((x) << 30)
> +#define YHGCH_CRT_DISP_CTL_DPMS_MASK		0xc0000000
> +
> +#define YHGCH_CRT_DPMS_ON			0
> +#define YHGCH_CRT_DPMS_OFF			3
> +
> +#define YHGCH_CRT_DISP_CTL_CRTSELECT(x)		((x) << 25)
> +#define YHGCH_CRT_DISP_CTL_CRTSELECT_MASK	0x2000000
> +
> +#define YHGCH_CRTSELECT_CRT			1
> +
> +#define YHGCH_CRT_DISP_CTL_CLOCK_PHASE(x)	((x) << 14)
> +#define YHGCH_CRT_DISP_CTL_CLOCK_PHASE_MASK	0x4000
> +
> +#define YHGCH_CRT_DISP_CTL_VSYNC_PHASE(x)	((x) << 13)
> +#define YHGCH_CRT_DISP_CTL_VSYNC_PHASE_MASK	0x2000
> +
> +#define YHGCH_CRT_DISP_CTL_HSYNC_PHASE(x)	((x) << 12)
> +#define YHGCH_CRT_DISP_CTL_HSYNC_PHASE_MASK	0x1000
> +
> +#define YHGCH_CRT_DISP_CTL_TIMING(x)		((x) << 8)
> +#define YHGCH_CRT_DISP_CTL_TIMING_MASK		0x100
> +
> +#define YHGCH_CRT_DISP_CTL_PLANE(x)		((x) << 2)
> +#define YHGCH_CRT_DISP_CTL_PLANE_MASK		4
> +
> +#define YHGCH_CRT_DISP_CTL_FORMAT(x)		((x) << 0)
> +#define YHGCH_CRT_DISP_CTL_FORMAT_MASK		0x03
> +
> +#define YHGCH_CRT_FB_ADDRESS			0x080204
> +
> +#define YHGCH_CRT_FB_WIDTH			0x080208
> +#define YHGCH_CRT_FB_WIDTH_WIDTH(x)		((x) << 16)
> +#define YHGCH_CRT_FB_WIDTH_WIDTH_MASK		0x3FFF0000
> +#define YHGCH_CRT_FB_WIDTH_OFFS(x)		((x) << 0)
> +#define YHGCH_CRT_FB_WIDTH_OFFS_MASK		0x3FFF
> +
> +#define YHGCH_CRT_HORZ_TOTAL			0x08020C
> +#define YHGCH_CRT_HORZ_TOTAL_TOTAL(x)		((x) << 16)
> +#define YHGCH_CRT_HORZ_TOTAL_TOTAL_MASK		0xFFF0000
> +
> +#define YHGCH_CRT_HORZ_TOTAL_DISP_END(x)	((x) << 0)
> +#define YHGCH_CRT_HORZ_TOTAL_DISP_END_MASK	0xFFF
> +
> +#define YHGCH_CRT_HORZ_SYNC			0x080210
> +#define YHGCH_CRT_HORZ_SYNC_WIDTH(x)		((x) << 16)
> +#define YHGCH_CRT_HORZ_SYNC_WIDTH_MASK		0xFF0000
> +
> +#define YHGCH_CRT_HORZ_SYNC_START(x)		((x) << 0)
> +#define YHGCH_CRT_HORZ_SYNC_START_MASK		0xFFF
> +
> +#define YHGCH_CRT_VERT_TOTAL			0x080214
> +#define YHGCH_CRT_VERT_TOTAL_TOTAL(x)		((x) << 16)
> +#define YHGCH_CRT_VERT_TOTAL_TOTAL_MASK		0x7FFF0000
> +
> +#define YHGCH_CRT_VERT_TOTAL_DISP_END(x)	((x) << 0)
> +#define YHGCH_CRT_VERT_TOTAL_DISP_END_MASK	0x7FF
> +
> +#define YHGCH_CRT_VERT_SYNC			0x080218
> +#define YHGCH_CRT_VERT_SYNC_HEIGHT(x)		((x) << 16)
> +#define YHGCH_CRT_VERT_SYNC_HEIGHT_MASK		0x3F0000
> +
> +#define YHGCH_CRT_VERT_SYNC_START(x)		((x) << 0)
> +#define YHGCH_CRT_VERT_SYNC_START_MASK		0x7FF
> +
> +/* Hardware Cursor */
> +#define YHGCH_HWC_ADDRESS                   0x080230
> +#define YHGCH_HWC_ADDRESS_ENABLE(x)         ((x) << 31)
> +#define YHGCH_HWC_ADDRESS_ENABLE_MASK       0x80000000
> +#define YHGCH_HWC_ADDRESS_ADDRESS(x)        ((x) << 0)
> +#define YHGCH_HWC_ADDRESS_ADDRESS_MASK      0xFFFFFFF
> +
> +#define YHGCH_HWC_LOCATION                  0x080234
> +#define YHGCH_HWC_LOCATION_TOP(x)           ((x) << 27)
> +#define YHGCH_HWC_LOCATION_TOP_MASK         0x8000000
> +#define YHGCH_HWC_LOCATION_Y(x)             ((x) << 16)
> +#define YHGCH_HWC_LOCATION_Y_MASK           0x7FF0000
> +#define YHGCH_HWC_LOCATION_LEFT(x)          ((x) << 11)
> +#define YHGCH_HWC_LOCATION_LEFT_MASK        0x800
> +#define YHGCH_HWC_LOCATION_X(x)             ((x) << 0)
> +#define YHGCH_HWC_LOCATION_X_MASK           0x7FF
> +
> +#define YHGCH_HWC_COLOR_12                  0x080238
> +#define YHGCH_HWC_COLOR_12_2_RGB(x)         ((x) << 16)
> +#define YHGCH_HWC_COLOR_12_2_RGB_MASK       0xFFFF0000
> +#define YHGCH_HWC_COLOR_12_1_RGB(x)         ((x) << 0)
> +#define YHGCH_HWC_COLOR_12_1_RGB_MASK       0xFFFF
> +
> +#define YHGCH_HWC_COLOR_3                   0x08023C
> +#define YHGCH_HWC_COLOR_3_RGB(x)            ((x) << 0)
> +#define YHGCH_HWC_COLOR_3_RGB_MASK          0xFFFF
> +
> +/* Auto Centering */
> +#define YHGCH_CRT_AUTO_CENTERING_TL		0x080280
> +#define YHGCH_CRT_AUTO_CENTERING_TL_TOP(x)	((x) << 16)
> +#define YHGCH_CRT_AUTO_CENTERING_TL_TOP_MASK	0x7FF0000
> +
> +#define YHGCH_CRT_AUTO_CENTERING_TL_LEFT(x)	((x) << 0)
> +#define YHGCH_CRT_AUTO_CENTERING_TL_LEFT_MASK	0x7FF
> +
> +#define YHGCH_CRT_AUTO_CENTERING_BR		0x080284
> +#define YHGCH_CRT_AUTO_CENTERING_BR_BOTTOM(x)	((x) << 16)
> +#define YHGCH_CRT_AUTO_CENTERING_BR_BOTTOM_MASK	0x7FF0000
> +
> +#define YHGCH_CRT_AUTO_CENTERING_BR_RIGHT(x)	((x) << 0)
> +#define YHGCH_CRT_AUTO_CENTERING_BR_RIGHT_MASK	0x7FF
> +
> +/* register to control panel output */
> +#define YHGCH_DISPLAY_CONTROL_HISILE		0x80288
> +#define YHGCH_DISPLAY_CONTROL_FPVDDEN(x)	((x) << 0)
> +#define YHGCH_DISPLAY_CONTROL_PANELDATE(x)	((x) << 1)
> +#define YHGCH_DISPLAY_CONTROL_FPEN(x)		((x) << 2)
> +#define YHGCH_DISPLAY_CONTROL_VBIASEN(x)	((x) << 3)
> +
> +#define YHGCH_RAW_INTERRUPT			0x80290
> +#define YHGCH_RAW_INTERRUPT_VBLANK(x)		((x) << 2)
> +#define YHGCH_RAW_INTERRUPT_VBLANK_MASK		0x4
> +
> +#define YHGCH_RAW_INTERRUPT_EN			0x80298
> +#define YHGCH_RAW_INTERRUPT_EN_VBLANK(x)	((x) << 2)
> +#define YHGCH_RAW_INTERRUPT_EN_VBLANK_MASK	0x4
> +
> +/* register and values for PLL control */
> +#define CRT_PLL1_NS				0x802a8
> +#define CRT_PLL1_NS_OUTER_BYPASS(x)		((x) << 30)
> +#define CRT_PLL1_NS_INTER_BYPASS(x)		((x) << 29)
> +#define CRT_PLL1_NS_POWERON(x)			((x) << 24)
> +
> +#define CRT_PLL1_NS_25MHZ			0x00006691	//640x480
> +#define CRT_PLL1_NS_40MHZ			0x00004580	//800x600
> +#define CRT_PLL1_NS_65MHZ			0x00002568	//1024x768
> +#define CRT_PLL1_NS_83MHZ			0x000027bb	//1280x800
> +#define CRT_PLL1_NS_106MHZ			0x000027ef	//1440x900
> +#define CRT_PLL1_NS_108MHZ			0x000027f2	//1280x1024
> +#define CRT_PLL1_NS_146MHZ			0x00001575	//1680x1050
> +#define CRT_PLL1_NS_148MHZ			0x0000145f	//1920x1080
> +#define CRT_PLL1_NS_193MHZ			0x000018f7	//1920x1200
> +
> +#define CRT_PLL2_NS				0x802ac
> +#define CRT_PLL2_NS_25MHZ			0x0
> +#define CRT_PLL2_NS_40MHZ			0x0
> +#define CRT_PLL2_NS_65MHZ			0x0
> +#define CRT_PLL2_NS_83MHZ			0x0
> +#define CRT_PLL2_NS_106MHZ			0x0
> +#define CRT_PLL2_NS_108MHZ			0x0
> +#define CRT_PLL2_NS_146MHZ			0x0
> +#define CRT_PLL2_NS_148MHZ			0x0
> +#define CRT_PLL2_NS_193MHZ			0x0
> +
> +#endif
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c b/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> new file mode 100644
> index 000000000000..5f4dd8700c8a
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/io.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "yhgch_drm_drv.h"
> +#include "yhgch_drm_regs.h"
> +
> +static int yhgch_connector_get_modes(struct drm_connector *connector)
> +{
> +	int count;
> +	const struct drm_edid *drm_edid;
> +
> +	if (!drm_probe_ddc(connector->ddc))
> +		drm_err(connector->dev, "smidebug: not find !!!\n");

not find what?

> +
> +	drm_edid = drm_edid_read(connector);
> +	if (drm_edid) {
> +		drm_edid_connector_update(connector, drm_edid);
> +		count =  drm_edid_connector_add_modes(connector);
> +		if (count)
> +			goto out;
> +	}
> +
> +	count = drm_add_modes_noedid(connector,
> +				     connector->dev->mode_config.max_width,
> +				     connector->dev->mode_config.max_height);

Let DRM core handle this for you. It already adds several default modes.

> +	drm_set_preferred_mode(connector, 1024, 768);
> +
> +out:
> +	drm_edid_free(drm_edid);
> +	return count;
> +}
> +
> +static int yhgch_connector_helper_detect_from_ddc(struct drm_connector *connector,
> +						  struct drm_modeset_acquire_ctx *ctx,
> +						  bool force)
> +{
> +	if (drm_connector_helper_detect_from_ddc(connector, ctx, force)
> +			!= connector_status_connected) {
> +		drm_err(connector->dev, "smidebug: ddc detect failed, force connect\n");

Don't be spammy for no reason. drm_dbg_kms().

> +	}
> +	return connector_status_connected;
> +}
> +
> +static const struct drm_connector_helper_funcs
> +	yhgch_connector_helper_funcs = {

move to the previous line.

> +	.get_modes = yhgch_connector_get_modes,
> +	.detect_ctx = yhgch_connector_helper_detect_from_ddc,
> +};
> +
> +static const struct drm_connector_funcs yhgch_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static void yhgch_encoder_enable(struct drm_encoder *encoder)
> +{
> +	u32 reg;
> +	struct drm_device *dev = encoder->dev;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> +
> +	reg = readl(priv->mmio + YHGCH_DISPLAY_CONTROL_HISILE);
> +	reg |= YHGCH_DISPLAY_CONTROL_FPVDDEN(1);
> +	reg |= YHGCH_DISPLAY_CONTROL_PANELDATE(1);
> +	reg |= YHGCH_DISPLAY_CONTROL_FPEN(1);
> +	reg |= YHGCH_DISPLAY_CONTROL_VBIASEN(1);
> +	writel(reg, priv->mmio + YHGCH_DISPLAY_CONTROL_HISILE);
> +}
> +
> +static const struct drm_encoder_helper_funcs yhgch_encoder_helper_funcs = {
> +	.enable = yhgch_encoder_enable,

Add disable() or comment why there is none.

> +};
> +
> +int yhgch_vdac_init(struct yhgch_drm_private *priv)
> +{
> +	struct drm_device *dev = &priv->dev;
> +	struct drm_encoder *encoder = &priv->encoder;
> +	struct drm_crtc *crtc = &priv->crtc;
> +	struct drm_connector *connector = &priv->connector;
> +	struct i2c_adapter *ddc;
> +	int ret;
> +
> +	ddc = yhgch_ddc_create(priv);
> +	if (IS_ERR(ddc)) {
> +		ret = PTR_ERR(ddc);
> +		drm_err(dev, "failed to create ddc: %d\n", ret);
> +		return ret;
> +	}
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_DAC, NULL);
> +	if (ret) {
> +		drm_err(dev, "failed to init encoder: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_encoder_helper_add(encoder, &yhgch_encoder_helper_funcs);
> +
> +	ret = drm_connector_init_with_ddc(dev, connector,
> +					  &yhgch_connector_funcs,
> +					  DRM_MODE_CONNECTOR_VGA,
> +					  ddc);
> +	if (ret) {
> +		drm_err(dev, "failed to init connector: %d\n", ret);
> +		return ret;
> +	}
> +	drm_connector_helper_add(connector, &yhgch_connector_helper_funcs);
> +
> +	drm_connector_attach_encoder(connector, encoder);
> +
> +	return 0;
> +}
> -- 
> 2.43.5
> 

-- 
With best wishes
Dmitry
