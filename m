Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3DEBA78C4
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 23:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68A110E0E2;
	Sun, 28 Sep 2025 21:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocHIJPAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2681210E0E2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 21:43:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SKtXkA023071
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 21:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KdQy2Yp2ohV0GjnngARmowUI
 sH77BTTy/bT8/FnCmBY=; b=ocHIJPAwH4sSIo6of7+RZKauwulrhQJq5U1ZA6rd
 6ar0bAfnFW/YZoI1bblztIcsSZkzkbX8thZMQBWMBx3ASZVjyMNEsRInrYUcXYfU
 /xXNFiYWtvQethT6aUPZh98tUjdo9rP6EZ8zUW0yG5JrE2sUax3jdGsLaVJw//fx
 fsJNQ4b3pHnk5fMAnLGa/BiFDf+DKTvtBJHpd53dp9YZm3WwwFp6zgdAmjT5oxHG
 SQCJqIqHR3rtYJz6/VnYjMibXrBleoEK1Uefur43nPkBTQc12Uua9GXiaSI62hm2
 rCcEONRxHU/JxelA+wAFho/fHILkdqWia+ne0c/FhGdLjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdb3sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 21:43:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e0fcbf8eb0so11929461cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 14:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759095810; x=1759700610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdQy2Yp2ohV0GjnngARmowUIsH77BTTy/bT8/FnCmBY=;
 b=bBLunSfvO2KxbGE6zWE0edj46zz38QHExUWnewXrOojsNmuTT8Jb9o72pXyqvNDh6z
 IJK5exeBwHkB00A/OJ1oKN+vgHz5APIn+5cZukdF7TShoOpeP9cDkgVur29pC9otC/Mk
 RGNAMwhRQl7JuntwYZT7qcgRdRSnQoEFQ3mPWXWDKyWUbsnpJkGuWHJ2r7CQl5nVBDmY
 QQZRSQj7AUwJpQwoaCwtVEArsBQMotBTURGgIpLK7bZUSf7zGQC/lshhu24V4tDaOVLL
 DaPJgDWrONHG3zcCkvFpbEmbvbetzb16aCz498qlccOYyhYkgXrl9B4+8lCnNseCcbUP
 EN6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb4fqJt7Dc3r/3m7RIHvfpSBBmNg9V/vshjV2PwYeNsnIpwaVFxS/nGsY4EYT6wShnBvsqmRRxfB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPhv6QJHc05CD+YopX4aE2PrNrv7NcfWkDSjQI+Hylw6bHnNX2
 PMiWJOu3v3KqkqEWgdfB8Bg55hSlKIsxgQyb9nj1EcEtuyklGAsR+MMQkGh+o4O1PkkpLaGXbD+
 1yQ2UwAp29L42rPjpmLaHlpsOPY589NBYvpT05PJTcYLGB8NxMNAslETWx3HUpdgWqdjIaao=
X-Gm-Gg: ASbGncvYDW68ZlN3O/6NcdoWqLVsYHqj3XiRm9dUYIBDijeWxaJeGTFyN+ysg/d8suM
 iULINCXMxE9P2eG+VRMyYWvA1BVLAQ1ipCNnFaPeTfz86drA1UaskFtmc/dR4nq5TgtqOYJuOGQ
 sVIOldjXtbjdigg1Y6VQHxwGhoRIFMNnE/MeZpha7cw/CcuEpNFciC+CQ0EsmF3MAoURW4C57ah
 FavhrxbD+uhQ1ZIMHfQicJQ0nX0ZOZfzFx0yxdNcCQO7VYbOjKKN513kEjhLS1kQOU2INHS8cQU
 A2oQEsuEai9yB+0rVfGNjumwfq+CBAqW16BXk6mxQvbuJ6MbKNRi0V9vgtcpKLgcwk1n0fA7+KQ
 QpBsqOOpTVEzhXsd+OBajUJlN402FmMLpzsWds8OOFZp8TtHklVtt
X-Received: by 2002:a05:622a:88:b0:4ba:4bef:de20 with SMTP id
 d75a77b69052e-4da47dfda4bmr174584181cf.20.1759095809624; 
 Sun, 28 Sep 2025 14:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlNIu3Nwvr6WYthNyk6M/pHtdrre/IKofsS+I6V30X3WWAKKVckAvqxQQHNIkmvG0f+a7zlA==
X-Received: by 2002:a05:622a:88:b0:4ba:4bef:de20 with SMTP id
 d75a77b69052e-4da47dfda4bmr174583981cf.20.1759095809119; 
 Sun, 28 Sep 2025 14:43:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb7710249sm23971981fa.34.2025.09.28.14.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 14:43:26 -0700 (PDT)
Date: Mon, 29 Sep 2025 00:43:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chu Guangqing <chuguangqing@inspur.com>
Cc: tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 1/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000
 soc chipset
Message-ID: <bvwmxalakynyfrtuns2wxvggkaq6ivbub6rv4bnrcwp7k5l3ti@slpcwysdul36>
References: <20250928054123.32895-1-chuguangqing@inspur.com>
 <20250928054123.32895-2-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928054123.32895-2-chuguangqing@inspur.com>
X-Proofpoint-GUID: QscDukGtnkR7mug0JAPqV2FucPirFj16
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68d9ac03 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=F_93P0QhAAAA:8 a=VwQbUJbxAAAA:8 a=TNceIUboeKl1yXBjWzYA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=v2fne3mUlQEKA94IZ0Od:22
X-Proofpoint-ORIG-GUID: QscDukGtnkR7mug0JAPqV2FucPirFj16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX5oj1J/jtXX0M
 4MJRgdqVbcey91EAhjLxD4rK5kWmPPZ6+IZCspY5UXxbJVMya+lBEu41MFlh6RE+uJAYWrfyveo
 sGSwr8NL7Zr/m3f+R1ZVqa8zhOgx1CTxz4XP2xSPHPXh2AzcAvNrzkz+BDsAnbQOpy2Bv00eNKH
 zaZcj9MMY20MI2/zYYeroZIwgPg7DEHWemhu0EWXIr6yGPT8DGf2ij3j9uM/OZC8AldKLDlG5tO
 ndMQf+1psuqYn8obQXlzdcuQfa+nbnDCRWo/IiKlyOjcr2hd24kjNWoUQpGcDlcrO0+3dfYJ9gz
 sYhHCKucTDyXYHA9e/F/Ic0bt01/J1ToKtnotfzBDNIq09YUrwptRTtBORsVNYY31CZ3jxuUdJA
 TKF6cknPuKlS/u7zpa3YpLzbewMuzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_09,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
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

On Sun, Sep 28, 2025 at 01:41:23PM +0800, Chu Guangqing wrote:
> add support for Yhgc BMC soc chipset

Could you please provide some more details about the BMC? Quick googling
finds only a very links. What is the name of the vendor? Is there a
product page somewhere?

> 
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> ---
>  MAINTAINERS                            |   5 +
>  drivers/gpu/drm/Kconfig                |   2 +
>  drivers/gpu/drm/Makefile               |   1 +
>  drivers/gpu/drm/yhgch/Kconfig          |  11 +
>  drivers/gpu/drm/yhgch/Makefile         |   4 +
>  drivers/gpu/drm/yhgch/yhgch_drm_de.c   | 407 +++++++++++++++++++++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_drv.c  | 310 +++++++++++++++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_drv.h  |  51 ++++
>  drivers/gpu/drm/yhgch/yhgch_drm_i2c.c  | 114 +++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_regs.h | 208 +++++++++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_vdac.c | 134 ++++++++
>  11 files changed, 1247 insertions(+)
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
> index 520fb4e379a3..18fd2e2fcb81 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27781,6 +27781,11 @@ S:	Maintained
>  F:	Documentation/input/devices/yealink.rst
>  F:	drivers/input/misc/yealink.*
>  
> +YHGC DRM DRIVER
> +M:	chuguangqing <chuguangqing@inspur.com>

Please use full name here.

> +S:	Maintained
> +F:	drivers/gpu/drm/yhgch

How do you plan to maintain it? Do you plan to use drm-misc tree? (in
such a case it should be mentioned here). Do you expect others to commit
updates / fixes for you or do you have commit rights?

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
> index 000000000000..de6dbd5acca7
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_de.c
> @@ -0,0 +1,407 @@
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

This list is very limited by the modern standards. Is there a way to
calculate these values for other resultions from the driver side?

> +};
> +
> +static const u32 channel_formats1[] = {
> +	DRM_FORMAT_RGB565, DRM_FORMAT_RGB888,
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static struct drm_plane_funcs yhgch_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	.reset = drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,

This macro redefines several fields defined previously. You should have
gotten a warning.

> +};
> +
> +
> +static enum drm_mode_status
> +yhgch_crtc_mode_valid(struct drm_crtc *crtc,
> +		      const struct drm_display_mode *mode)
> +{
> +	size_t i = 0;
> +	int vrefresh = drm_mode_vrefresh(mode);
> +
> +	if (vrefresh < 59 || vrefresh > 61)
> +		return MODE_NOCLOCK;
> +
> +	for (i = 0; i < ARRAY_SIZE(yhgch_pll_table); i++) {
> +		if (yhgch_pll_table[i].hdisplay == mode->hdisplay &&
> +		    yhgch_pll_table[i].vdisplay == mode->vdisplay)
> +			return MODE_OK;
> +	}
> +
> +	return MODE_BAD;
> +}
> +
> +static void set_vclock_yhgch(struct drm_device *dev, u64 pll)
> +{
> +	u32 val;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> +
> +	val = readl(priv->mmio + CRT_PLL1_NS);
> +	val &= ~(CRT_PLL1_NS_OUTER_BYPASS(1));
> +	writel(val, priv->mmio + CRT_PLL1_NS);
> +
> +	val = CRT_PLL1_NS_INTER_BYPASS(1) | CRT_PLL1_NS_POWERON(1);
> +	writel(val, priv->mmio + CRT_PLL1_NS);
> +
> +	writel(pll, priv->mmio + CRT_PLL1_NS);
> +
> +	usleep_range(1000, 2000);
> +
> +	val = pll & ~(CRT_PLL1_NS_POWERON(1));
> +	writel(val, priv->mmio + CRT_PLL1_NS);
> +
> +	usleep_range(1000, 2000);
> +
> +	val &= ~(CRT_PLL1_NS_INTER_BYPASS(1));
> +	writel(val, priv->mmio + CRT_PLL1_NS);
> +
> +	usleep_range(1000, 2000);
> +
> +	val |= CRT_PLL1_NS_OUTER_BYPASS(1);
> +	writel(val, priv->mmio + CRT_PLL1_NS);
> +}
> +
> +static void get_pll_config(u64 x, u64 y, u32 *pll1, u32 *pll2)
> +{
> +	size_t i;
> +	size_t count = ARRAY_SIZE(yhgch_pll_table);
> +
> +	for (i = 0; i < count; i++) {
> +		if (yhgch_pll_table[i].hdisplay == x &&
> +		    yhgch_pll_table[i].vdisplay == y) {
> +			*pll1 = yhgch_pll_table[i].pll1_config_value;
> +			*pll2 = yhgch_pll_table[i].pll2_config_value;
> +			return;
> +		}
> +	}
> +
> +	/* if found none, we use default value */

Can this happen granted your mode_valid check?

> +	*pll1 = CRT_PLL1_NS_25MHZ;
> +	*pll2 = CRT_PLL2_NS_25MHZ;
> +}
> +

[...]

> +
> +static void yhgch_crtc_atomic_begin(struct drm_crtc *crtc,
> +				    struct drm_atomic_state *old_state)
> +{
> +	u32 reg;
> +	struct drm_device *dev = crtc->dev;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> +
> +	yhgch_set_power_mode(priv, YHGCH_PW_MODE_CTL_MODE_MODE0);
> +
> +	/* Enable display power gate & LOCALMEM power gate */
> +	reg = readl(priv->mmio + YHGCH_CURRENT_GATE);
> +	reg &= ~YHGCH_CURR_GATE_DISPLAY_MASK;
> +	reg &= ~YHGCH_CURR_GATE_LOCALMEM_MASK;
> +	reg |= YHGCH_CURR_GATE_DISPLAY(1);
> +	reg |= YHGCH_CURR_GATE_LOCALMEM(1);
> +	yhgch_set_current_gate(priv, reg);
> +
> +	/* We can add more initialization as needed. */

???

> +}
> +

[..]

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

Unused

> +

-- 
With best wishes
Dmitry
