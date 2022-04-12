Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5227D4FD47C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 12:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1249B10E47C;
	Tue, 12 Apr 2022 10:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922EF10E47C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 10:03:57 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id r8so18496718oib.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=/ZyCaP2T/2VrJe6ALq1EyhIHOZkvGaqGD4xWXLAeHqk=;
 b=o87hejcBHI3HtMx/kT2Zok9kZB5byZSfOS/ff8a6ScbRybRTQS+g+TBJsVtUUdl06p
 Ew1vCmSYTQ/GtDq/X6StyyvV7iAfgl9+dSU00ezQaWRVSWgXVkv5EVLj7xCsYmR0M+V5
 mRDgC3b1d/yVk7mZ+r4/7RFReTdSRY+Y8z8ll5M9aiZmMytTwEMWkpFgJq1a4kLZlwWb
 u5lcjUJ0o0tU/8Yuiowj/xyUSeuvbsK4hzgLcl8/doDyxx6lwZXy6y+3GkxclqOcD3Sx
 HRlwwBM0TXozoMMJeMIeLMM8DjDqlpKuTI3RgEX+mzX+ehWuwQT8pPMdneSq+Pt11IeQ
 cOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=/ZyCaP2T/2VrJe6ALq1EyhIHOZkvGaqGD4xWXLAeHqk=;
 b=Wl7OhDuAQ0Xup6w5zy3ddO6E3C79T70OwFopjJNxHP14b6i6/kayUr+vxPrJT1Od6i
 rMHZgl6tQV8FFyQyT5W1OrcvPmLOD1IwExq/7zDO5ao1bqQnqEkCNVQBt/bJkDy+906N
 WNpBB4ItqqChewfUaRO/MfTSRz1cbJkP/tTt6Hmogk0f3sNyDOiirq0YAl9SWF0bal5K
 EWO6JeAKxPkEQCq9HVbgAbC8cErehFhKuvFEbwqTbg2crHmjkxM5SZeDvRTijEKWfebQ
 gkHh+1tcabsWs0RHMnKdSAY/oz/S0327ChgEojhrs5gzsB+F30fTEQMqMXq44YCY0xSB
 KFfw==
X-Gm-Message-State: AOAM530XU8/r+v6n3wVpx9M53xnwHomKB0WCuQzgO89Eu8VZow4KNNQK
 ultkPohYtcssphfz8GAYj9u1pyA1bqfDoIAhZR9Gfw==
X-Google-Smtp-Source: ABdhPJzGtel/l6qOXLcwpuUNzqIFIk30V1Q17YLq2WEHb6wJYT3Z+MvHoJhoyB8OjMXYiNnfat5VzvYA6uFba+Mk8Ew=
X-Received: by 2002:a05:6808:159d:b0:2da:3946:ab3d with SMTP id
 t29-20020a056808159d00b002da3946ab3dmr1332889oiw.248.1649757836383; Tue, 12
 Apr 2022 03:03:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 03:03:55 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-19-granquet@baylibre.com>
 <2d0dd2f60e2b1e58ed4008212260e980edbd7cdc.camel@mediatek.com>
In-Reply-To: <2d0dd2f60e2b1e58ed4008212260e980edbd7cdc.camel@mediatek.com>
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 03:03:55 -0700
Message-ID: <CABnWg9tpKs9ksnFk1ai9QYKz4RKKnqLJfOKm9VN+LnNUon+uKg@mail.gmail.com>
Subject: Re: [PATCH v9 18/22] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, vkoul@kernel.org, airlied@linux.ie,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com, 
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de, 
 jitao.shi@mediatek.com, kishon@ti.com, krzk+dt@kernel.org, 
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mripard@kernel.org, 
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Mar 2022 07:41, Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>Hello Guillaume,
>
>Thanks for your patch.
>I add some comments below:
>
>On Mon, 2022-03-28 at 00:39 +0200, Guillaume Ranquet wrote:
>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>
>> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
>>
>> It supports the mt8195, the embedded DisplayPort units. It offers
>> DisplayPort 1.4 with up to 4 lanes.
>>
>> The driver shares its iomap range with the mtk-dp-phy driver using
>> the regmap/syscon facility.
>>
>> This driver is based on an initial version by
>> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> ---
>>  drivers/gpu/drm/mediatek/Kconfig       |    8 +
>>  drivers/gpu/drm/mediatek/Makefile      |    2 +
>>  drivers/gpu/drm/mediatek/mtk_dp.c      | 2221
>> ++++++++++++++++++++++++
>>  drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  568 ++++++
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
>>  6 files changed, 2801 insertions(+)
>>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>
>> diff --git a/drivers/gpu/drm/mediatek/Kconfig
>> b/drivers/gpu/drm/mediatek/Kconfig
>> index 2976d21e9a34..03ffa9b896c3 100644
>> --- a/drivers/gpu/drm/mediatek/Kconfig
>> +++ b/drivers/gpu/drm/mediatek/Kconfig
>> @@ -28,3 +28,11 @@ config DRM_MEDIATEK_HDMI
>>  	select PHY_MTK_HDMI
>>  	help
>>  	  DRM/KMS HDMI driver for Mediatek SoCs
>> +
>> +config MTK_DPTX_SUPPORT
>> +	tristate "DRM DPTX Support for Mediatek SoCs"
>> +	depends on DRM_MEDIATEK
>> +	select PHY_MTK_DP
>> +	select DRM_DP_HELPER
>> +	help
>> +	  DRM/KMS Display Port driver for Mediatek SoCs.
>> diff --git a/drivers/gpu/drm/mediatek/Makefile
>> b/drivers/gpu/drm/mediatek/Makefile
>> index 29098d7c8307..d86a6406055e 100644
>> --- a/drivers/gpu/drm/mediatek/Makefile
>> +++ b/drivers/gpu/drm/mediatek/Makefile
>> @@ -21,3 +21,5 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>>  			  mtk_hdmi_ddc.o
>>
>>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>> +
>> +obj-$(CONFIG_MTK_DPTX_SUPPORT) += mtk_dp.o
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
>> b/drivers/gpu/drm/mediatek/mtk_dp.c
>> new file mode 100644
>> index 000000000000..7cd8459cf719
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>> @@ -0,0 +1,2221 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2019 MediaTek Inc.
>> + * Copyright (c) 2021 BayLibre
>> + */
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_bridge.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/dp/drm_dp_helper.h>
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_panel.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <linux/arm-smccc.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/errno.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/nvmem-consumer.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <sound/hdmi-codec.h>
>> +#include <video/videomode.h>
>> +
>> +#include "mtk_dp_reg.h"
>> +
>> +#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
>> +#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
>> +
>> +//TODO: platform/device data or dts?
>> +#define MTK_DP_MAX_LANES 4
>> +#define MTK_DP_MAX_LINK_RATE MTK_DP_LINKRATE_HBR3
>> +
>> +#define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
>> +
>> +#define MTK_DP_TRAIN_RETRY_LIMIT 8
>> +#define MTK_DP_TRAIN_MAX_ITERATIONS 5
>> +
>> +#define MTK_DP_AUX_WRITE_READ_WAIT_TIME_US 20
>> +
>> +#define MTK_DP_DP_VERSION_11 0x11
>> +
>> +enum mtk_dp_state {
>> +	MTK_DP_STATE_INITIAL,
>> +	MTK_DP_STATE_IDLE,
>> +	MTK_DP_STATE_PREPARE,
>> +	MTK_DP_STATE_NORMAL,
>> +};
>> +
>>
>
>snif...
>
>> +
>> +static int mtk_dp_msa_bypass_disable(struct mtk_dp *mtk_dp)
>> +{
>> +	const u16 bits_to_set =
>> +		BIT(HTOTAL_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(VTOTAL_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(HSTART_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(VSTART_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(HWIDTH_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(VHEIGHT_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(HSP_SEL_DP_ENC0_P0_SHIFT) |
>> BIT(HSW_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(VSP_SEL_DP_ENC0_P0_SHIFT) |
>> BIT(VSW_SEL_DP_ENC0_P0_SHIFT);
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3030,
>> bits_to_set,
>> +			   bits_to_set);
>> +}
>> +
>> +#define MTK_UPD_BITS_OR_OUT(mtk_dp, offset, val, mask, ret, label) \
>> +	do {\
>> +		ret = mtk_dp_update_bits(mtk_dp, offset, val, mask); \
>> +		if (ret) \
>> +			goto label; \
>> +	} while (0)
>> +
>> +static int mtk_dp_set_msa(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3010, timings-
>> >htotal,
>> +			    HTOTAL_SW_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3018,
>> +			    timings->vm.hsync_len + timings-
>> >vm.hback_porch,
>> +			   HSTART_SW_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3028,
>> +			    timings->vm.hsync_len <<
>> HSW_SW_DP_ENC0_P0_SHIFT,
>> +			   HSW_SW_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3028, 0,
>> +			    HSP_SW_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3020, timings-
>> >vm.hactive,
>> +			    HWIDTH_SW_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3014, timings-
>> >vtotal,
>> +			    VTOTAL_SW_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_301C,
>> +			    timings->vm.vsync_len + timings-
>> >vm.vback_porch,
>> +			   VSTART_SW_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_302C,
>> +			    timings->vm.vsync_len <<
>> VSW_SW_DP_ENC0_P0_SHIFT,
>> +			   VSW_SW_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_302C, 0,
>> +			    VSP_SW_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3024, timings-
>> >vm.vactive,
>> +			    VHEIGHT_SW_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3064, timings-
>> >vm.hactive,
>> +			    HDE_NUM_LAST_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3154, timings-
>> >htotal,
>> +			    PGEN_HTOTAL_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3158,
>> +			    timings->vm.hfront_porch,
>> +			   PGEN_HSYNC_RISING_DP_ENC0_P0_MASK, ret,
>> out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_315C, timings-
>> >vm.hsync_len,
>> +			    PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK,
>> ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3160,
>> +			    timings->vm.hback_porch + timings-
>> >vm.hsync_len,
>> +			   PGEN_HFDE_START_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3164, timings-
>> >vm.hactive,
>> +			    PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK,
>> ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3168, timings-
>> >vtotal,
>> +			    PGEN_VTOTAL_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_316C,
>> +			    timings->vm.vfront_porch,
>> +			   PGEN_VSYNC_RISING_DP_ENC0_P0_MASK, ret,
>> out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3170, timings-
>> >vm.vsync_len,
>> +			    PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK,
>> ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3174,
>> +			    timings->vm.vback_porch + timings-
>> >vm.vsync_len,
>> +			   PGEN_VFDE_START_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3178, timings-
>> >vm.vactive,
>> +			    PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK,
>> ret, out);
>> +
>> +out:
>
>Just like Angelo's comments.
>I think we can remove this macro.
>IMO, I think we don't need to go to out.
>The failure is caused by update registers fail, and there are error
>message in mtk_dp_update_bits().
>I think we can or all ret value and check them in last of this funtion.
>

Yes, that macro was not a great idea.

>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
>> +				   enum mtk_dp_color_format
>> color_format)
>> +{
>> +	u32 val;
>> +	int ret;
>> +
>> +	mtk_dp->info.format = color_format;
>> +
>> +	/* Update MISC0 */
>> +	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
>> +				 color_format <<
>> DP_TEST_COLOR_FORMAT_SHIFT,
>> +			   DP_TEST_COLOR_FORMAT_MASK);
>
>maybe the same indention with "color_format <<
>DP_TEST_COLOR_FORMAT_SHIFT," here?
>
I'll fix the indentation here.
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	switch (color_format) {
>> +	case MTK_DP_COLOR_FORMAT_YUV_422:
>> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
>> +		break;
>> +	case MTK_DP_COLOR_FORMAT_YUV_420:
>> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420;
>> +		break;
>> +	case MTK_DP_COLOR_FORMAT_YONLY:
>> +	case MTK_DP_COLOR_FORMAT_RAW:
>> +	case MTK_DP_COLOR_FORMAT_RESERVED:
>> +	case MTK_DP_COLOR_FORMAT_UNKNOWN:
>> +		drm_warn(mtk_dp->drm_dev, "Unsupported color format:
>> %d\n",
>> +			 color_format);
>> +		fallthrough;
>> +	case MTK_DP_COLOR_FORMAT_RGB_444:
>> +	case MTK_DP_COLOR_FORMAT_YUV_444:
>> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
>> +		break;
>> +	}
>> +
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
>> +			   PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
>> +}
>> +
>> +static int mtk_dp_set_color_depth(struct mtk_dp *mtk_dp,
>> +				  enum mtk_dp_color_depth color_depth)
>> +{
>> +	int ret;
>> +	u32 val;
>> +
>> +	mtk_dp->info.depth = color_depth;
>> +
>> +	/* Update MISC0 */
>> +	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
>> +				 color_depth <<
>> DP_TEST_BIT_DEPTH_SHIFT,
>> +			   DP_TEST_BIT_DEPTH_MASK);
>
>ditto
>
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	switch (color_depth) {
>> +	case MTK_DP_COLOR_DEPTH_6BIT:
>> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT;
>> +		break;
>> +	case MTK_DP_COLOR_DEPTH_8BIT:
>> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT;
>> +		break;
>> +	case MTK_DP_COLOR_DEPTH_10BIT:
>> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_10BIT;
>> +		break;
>> +	case MTK_DP_COLOR_DEPTH_12BIT:
>> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT;
>> +		break;
>> +	case MTK_DP_COLOR_DEPTH_16BIT:
>> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT;
>> +		break;
>> +	case MTK_DP_COLOR_DEPTH_UNKNOWN:
>> +		drm_warn(mtk_dp->drm_dev, "Unsupported color depth
>> %d\n",
>> +			 color_depth);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
>> +			   VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK);
>> +}
>> +
>> +static int mtk_dp_mn_overwrite_disable(struct mtk_dp *mtk_dp)
>> +{
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
>> +			   VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK);
>> +}
>> +
>> +static int mtk_dp_set_sram_read_start(struct mtk_dp *mtk_dp, u32
>> val)
>> +{
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
>> +			   val <<
>> SRAM_START_READ_THRD_DP_ENC0_P0_SHIFT,
>> +			   SRAM_START_READ_THRD_DP_ENC0_P0_MASK);
>> +}
>> +
>> +static int mtk_dp_setup_encoder(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_303C,
>> +			    BIT(VIDEO_MN_GEN_EN_DP_ENC0_P0_SHIFT),
>> +			VIDEO_MN_GEN_EN_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3040,
>> +			    0x20 << SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT,
>> +			SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3364,
>> +			    0x20 <<
>> SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_SHIFT,
>> +			SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK,
>> ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3300,
>> +			    2 << VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_SHIFT,
>> +			VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3364,
>> +			    4 <<
>> FIFO_READ_START_POINT_DP_ENC1_P0_SHIFT,
>> +			FIFO_READ_START_POINT_DP_ENC1_P0_MASK, ret,
>> out);
>> +	ret = mtk_dp_write(mtk_dp, MTK_DP_ENC1_P0_3368,
>> +			   1 <<
>> VIDEO_SRAM_FIFO_CNT_RESET_SEL_DP_ENC1_P0_SHIFT |
>> +			1 << VIDEO_STABLE_CNT_THRD_DP_ENC1_P0_SHIFT |
>> +			BIT(SDP_DP13_EN_DP_ENC1_P0_SHIFT) |
>> +			1 << BS2BS_MODE_DP_ENC1_P0_SHIFT);
>
>ditto
>
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_pg_disable(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3038, 0,
>> +			    VIDEO_SOURCE_SEL_DP_ENC0_P0_MASK, ret,
>> out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_31B0,
>> +			    4 << PGEN_PATTERN_SEL_SHIFT,
>> PGEN_PATTERN_SEL_MASK, ret, out);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
>> +{
>> +	return !!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
>> +		  HPD_DB_DP_TRANS_P0_MASK);
>> +}
>> +
>> +static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
>> +{
>> +	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
>> +		     BIT(AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_SHIFT) |
>> +		     BIT(AUX_RX_DATA_RECV_IRQ_AUX_TX_P0_SHIFT) |
>> +		     BIT(AUX_RX_ADDR_RECV_IRQ_AUX_TX_P0_SHIFT) |
>> +		     BIT(AUX_RX_CMD_RECV_IRQ_AUX_TX_P0_SHIFT) |
>> +		     BIT(AUX_RX_MCCS_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT)
>> |
>> +		     BIT(AUX_RX_EDID_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT)
>> |
>> +		     BIT(AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT))
>> ;
>> +}
>> +
>> +static int mtk_dp_aux_set_cmd(struct mtk_dp *mtk_dp, u8 cmd, u32
>> addr)
>> +{
>> +	int ret;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3644, cmd,
>> +			    MCU_REQUEST_COMMAND_AUX_TX_P0_MASK, ret,
>> out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3648, addr,
>> +			    MCU_REQUEST_ADDRESS_LSB_AUX_TX_P0_MASK,
>> ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_364C, addr >> 16,
>> +			    MCU_REQUEST_ADDRESS_MSB_AUX_TX_P0_MASK,
>> ret, out);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_aux_cmd_complete(struct mtk_dp *mtk_dp)
>> +{
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3650,
>> +			   BIT(MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_SHIFT),
>> +			   MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_MASK |
>> +				   PHY_FIFO_RST_AUX_TX_P0_MASK |
>> +				   MCU_REQ_DATA_NUM_AUX_TX_P0_MASK);
>> +}
>> +
>> +static int mtk_dp_aux_request_ready(struct mtk_dp *mtk_dp)
>> +{
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3630,
>> +			   BIT(AUX_TX_REQUEST_READY_AUX_TX_P0_SHIFT),
>> +			   AUX_TX_REQUEST_READY_AUX_TX_P0_MASK);
>> +}
>> +
>> +static void mtk_dp_aux_fill_write_fifo(struct mtk_dp *mtk_dp, u8
>> *buf,
>> +				       size_t length)
>> +{
>> +	mtk_dp_bulk_16bit_write(mtk_dp, MTK_DP_AUX_P0_3708, buf,
>> length);
>> +}
>> +
>> +static int mtk_dp_aux_read_rx_fifo(struct mtk_dp *mtk_dp, u8 *buf,
>> +				   size_t length, int read_delay)
>> +{
>> +	int ret;
>> +	int read_pos;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3620, 0,
>> +			    AUX_RD_MODE_AUX_TX_P0_MASK, ret, out);
>> +
>> +	for (read_pos = 0; read_pos < length; read_pos++) {
>> +		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3620,
>> +				    BIT(AUX_RX_FIFO_R_PULSE_TX_P0_SHIFT
>> ),
>> +				   AUX_RX_FIFO_READ_PULSE_TX_P0_MASK,
>> ret, out);
>> +		usleep_range(read_delay, read_delay * 2);
>> +		buf[read_pos] =
>> +			(u8)(mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3620) &
>> +			     AUX_RX_FIFO_READ_DATA_AUX_TX_P0_MASK >>
>> +				     AUX_RX_FIFO_READ_DATA_AUX_TX_P0_SH
>> IFT);
>> +	}
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_aux_set_length(struct mtk_dp *mtk_dp, size_t
>> length)
>> +{
>> +	int ret;
>> +
>> +	if (length > 0) {
>> +		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3650,
>> +				    (length - 1)
>> +				    <<
>> MCU_REQ_DATA_NUM_AUX_TX_P0_SHIFT,
>> +				    MCU_REQ_DATA_NUM_AUX_TX_P0_MASK,
>> ret, out);
>> +		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_362C, 0,
>> +				    AUX_NO_LENGTH_AUX_TX_P0_MASK |
>> +				    AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
>> +				    AUX_RESERVED_RW_0_AUX_TX_P0_MASK,
>> ret, out);
>> +	} else {
>> +		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_362C,
>> +				    BIT(AUX_NO_LENGTH_AUX_TX_P0_SHIFT),
>> +				    AUX_NO_LENGTH_AUX_TX_P0_MASK |
>> +				    AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
>> +				    AUX_RESERVED_RW_0_AUX_TX_P0_MASK,
>> ret, out);
>> +	}
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp,
>> bool is_read)
>> +{
>> +	int wait_reply = MTK_DP_AUX_WAIT_REPLY_COUNT;
>> +
>> +	while (--wait_reply) {
>> +		u32 aux_irq_status;
>> +
>> +		if (is_read) {
>> +			u32 fifo_status = mtk_dp_read(mtk_dp,
>> MTK_DP_AUX_P0_3618);
>> +
>> +			if (fifo_status &
>> +			    (AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK |
>> +			     AUX_RX_FIFO_FULL_AUX_TX_P0_MASK)) {
>> +				return 0;
>> +			}
>> +		}
>> +
>> +		aux_irq_status = mtk_dp_read(mtk_dp,
>> MTK_DP_AUX_P0_3640);
>> +		if (aux_irq_status &
>> AUX_RX_RECV_COMPLETE_IRQ_TX_P0_MASK)
>> +			return 0;
>> +
>> +		if (aux_irq_status &
>> AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_MASK)
>> +			return -ETIMEDOUT;
>> +
>> +		usleep_range(100, 500);
>> +	}
>> +
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool
>> is_read, u8 cmd,
>> +				  u32 addr, u8 *buf, size_t length)
>> +{
>> +	int ret;
>> +	u32 reply_cmd;
>> +
>> +	if (is_read && (length > DP_AUX_MAX_PAYLOAD_BYTES ||
>> +			(cmd == DP_AUX_NATIVE_READ && !length)))
>> +		return -EINVAL;
>> +
>> +	if (!is_read) {
>> +		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3704,
>> +					 BIT(AUX_TX_FIFO_NEW_MODE_EN_AU
>> X_TX_P0_SHIFT),
>> +				   AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_MA
>> SK);
>
>BIT(AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_SHIFT) is very strange..
>(#define AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_SHIFT (BIT(1)))
>> +
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	mtk_dp_aux_cmd_complete(mtk_dp);
>> +	mtk_dp_aux_irq_clear(mtk_dp);
>> +	usleep_range(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US,
>> +		     MTK_DP_AUX_WRITE_READ_WAIT_TIME_US * 2);
>> +
>> +	mtk_dp_aux_set_cmd(mtk_dp, cmd, addr);
>> +	mtk_dp_aux_set_length(mtk_dp, length);
>> +
>> +	if (!is_read) {
>> +		if (length)
>> +			mtk_dp_aux_fill_write_fifo(mtk_dp, buf,
>> length);
>> +
>> +		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3704,
>> +					 AUX_TX_FIFO_WRITE_DATA_NEW_MOD
>> E_TOGGLE_AUX_TX_P0_MASK,
>> +				   AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGG
>> LE_AUX_TX_P0_MASK);
>> +
>> +		if (ret)
>> +			return ret;
>> +	}
>
>is this the same with previous if (!is_read) ?
>If yes, maybe we can
>extract them..
>
I plan to simplify this function as much as possible.
As previsouly stated, this can use drm_dp_dpcd_read/write()

>> +
>> +	mtk_dp_aux_request_ready(mtk_dp);
>> +
>> +	ret = mtk_dp_aux_wait_for_completion(mtk_dp, is_read);
>> +
>> +	reply_cmd = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
>> +		    AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
>> +
>> +	if (ret || reply_cmd) {
>> +		u32 phy_status = mtk_dp_read(mtk_dp,
>> MTK_DP_AUX_P0_3628) &
>> +				 AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
>> +		if (phy_status != AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
>> +			drm_err(mtk_dp->drm_dev,
>> +				"AUX Rx Aux hang, need SW reset\n");
>> +			return -EIO;
>> +		}
>> +
>> +		mtk_dp_aux_cmd_complete(mtk_dp);
>> +		mtk_dp_aux_irq_clear(mtk_dp);
>> +
>> +		usleep_range(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US,
>> +			     MTK_DP_AUX_WRITE_READ_WAIT_TIME_US * 2);
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	if (!length) {
>> +		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_362C, 0,
>> +					 AUX_NO_LENGTH_AUX_TX_P0_MASK |
>> +				   AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
>> +				   AUX_RESERVED_RW_0_AUX_TX_P0_MASK);
>> +
>> +		if (ret)
>> +			return ret;
>> +
>> +	} else if (is_read) {
>> +		int read_delay;
>> +
>> +		if (cmd == (DP_AUX_I2C_READ | DP_AUX_I2C_MOT) ||
>> +		    cmd == DP_AUX_I2C_READ)
>> +			read_delay = 500;
>> +		else
>> +			read_delay = 100;
>> +
>> +		mtk_dp_aux_read_rx_fifo(mtk_dp, buf, length,
>> read_delay);
>> +	}
>> +
>> +	mtk_dp_aux_cmd_complete(mtk_dp);
>> +	mtk_dp_aux_irq_clear(mtk_dp);
>> +	usleep_range(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US,
>> +		     MTK_DP_AUX_WRITE_READ_WAIT_TIME_US * 2);
>> +
>> +	return 0;
>> +}
>> +
>> +static bool mtk_dp_set_swing_pre_emphasis(struct mtk_dp *mtk_dp, int
>> lane_num,
>> +					  int swing_val, int
>> preemphasis)
>> +{
>> +	int ret;
>> +
>> +	u32 lane_shift = lane_num * DP_TX1_VOLT_SWING_SHIFT;
>> +
>> +	if (lane_num < 0 || lane_num > 3)
>> +		return false;
>> +
>> +	dev_dbg(mtk_dp->dev,
>> +		"link training swing_val= 0x%x, preemphasis = 0x%x\n",
>> +		swing_val, preemphasis);
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_SWING_EMP,
>> +			    swing_val << (DP_TX0_VOLT_SWING_SHIFT +
>> lane_shift),
>> +			   DP_TX0_VOLT_SWING_MASK << lane_shift, ret,
>> out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_SWING_EMP,
>> +			    preemphasis << (DP_TX0_PRE_EMPH_SHIFT +
>> lane_shift),
>> +			   DP_TX0_PRE_EMPH_MASK << lane_shift, ret,
>> out);
>> +
>> +out:
>> +	return !ret;
>
>why return !ret?
unsure... this return value is unused in the callee anyway...
I should have better error management in v10.

>
>> +}
>> +
>> +static int mtk_dp_reset_swing_pre_emphasis(struct mtk_dp *mtk_dp)
>> +{
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP, 0,
>> +			   DP_TX0_VOLT_SWING_MASK |
>> DP_TX1_VOLT_SWING_MASK |
>> +			   DP_TX2_VOLT_SWING_MASK |
>> +			   DP_TX3_VOLT_SWING_MASK |
>> +			   DP_TX0_PRE_EMPH_MASK | DP_TX1_PRE_EMPH_MASK
>> |
>> +			   DP_TX2_PRE_EMPH_MASK |
>> DP_TX3_PRE_EMPH_MASK);
>> +}
>> +
>> +static int mtk_dp_fec_enable(struct mtk_dp *mtk_dp, bool enable)
>> +{
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3540,
>> +			   enable ? BIT(FEC_EN_DP_TRANS_P0_SHIFT) : 0,
>> +			   FEC_EN_DP_TRANS_P0_MASK);
>> +}
>> +
>> +static int mtk_dp_hwirq_enable(struct mtk_dp *mtk_dp, bool enable)
>> +{
>> +	u32 val = 0;
>> +
>> +	if (!enable)
>> +		val = IRQ_MASK_DP_TRANS_P0_DISC_IRQ |
>> +		      IRQ_MASK_DP_TRANS_P0_CONN_IRQ |
>> +		      IRQ_MASK_DP_TRANS_P0_INT_IRQ;
>
>I think val = enable ? ... : 0

Yes, this can be simplified :)
>
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3418, val,
>> +			   IRQ_MASK_DP_TRANS_P0_MASK);
>> +}
>> +
>> +static int mtk_dp_initialize_settings(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_342C,
>> +			    XTAL_FREQ_DP_TRANS_P0_DEFAULT,
>> +			   XTAL_FREQ_DP_TRANS_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3540,
>> +			    BIT(FEC_CLOCK_EN_MODE_DP_TRANS_P0_SHIFT),
>> +			   FEC_CLOCK_EN_MODE_DP_TRANS_P0_MASK, ret,
>> out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_31EC,
>> +			    BIT(AUDIO_CH_SRC_SEL_DP_ENC0_P0_SHIFT),
>> +			   AUDIO_CH_SRC_SEL_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_304C, 0,
>> +			    SDP_VSYNC_RISING_MASK_DP_ENC0_P0_MASK, ret,
>> out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_IRQ_MASK,
>> IRQ_MASK_AUX_TOP_IRQ,
>> +			    IRQ_MASK_AUX_TOP_IRQ, ret, out);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp
>> *mtk_dp)
>> +{
>> +	// Debounce threshold
>> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
>> +			   8 << HPD_DEB_THD_DP_TRANS_P0_SHIFT,
>> +			   HPD_DEB_THD_DP_TRANS_P0_MASK);
>> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
>> +			   (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
>> +			    HPD_INT_THD_DP_TRANS_P0_UPPER_1100US)
>> +				   << HPD_INT_THD_DP_TRANS_P0_SHIFT,
>> +			   HPD_INT_THD_DP_TRANS_P0_MASK);
>> +
>> +	// Connect threshold 1.5ms + 5 x 0.1ms = 2ms
>> +	// Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms
>> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
>> +			   (5 << HPD_DISC_THD_DP_TRANS_P0_SHIFT) |
>> +				   (5 <<
>> HPD_CONN_THD_DP_TRANS_P0_SHIFT),
>> +			   HPD_DISC_THD_DP_TRANS_P0_MASK |
>> +				   HPD_CONN_THD_DP_TRANS_P0_MASK);
>> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
>> +			   HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT,
>> +			   HPD_INT_THD_ECO_DP_TRANS_P0_MASK);
>
>this function is not control if !ret,
>maybe we should let all functions of setting register follow the same
>rule?
>
v10 should have proper error handling throughout all the functions.

>> +}
>> +
>> +static int mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +
>> +	/* modify timeout threshold = 1595 [12 : 8] */
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_360C, 0x1595,
>> +			    AUX_TIMEOUT_THR_AUX_TX_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3658, 0,
>> +			    AUX_TX_OV_EN_AUX_TX_P0_MASK, ret, out);
>> +	/* 25 for 26M */
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3634,
>> +			    25 <<
>> AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_SHIFT,
>> +			   AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_MASK, ret,
>> out);
>> +	/* 13 for 26M */
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3614,
>> +			    13 << AUX_RX_UI_CNT_THR_AUX_TX_P0_SHIFT,
>> +			   AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_37C8,
>> +			    BIT(MTK_ATOP_EN_AUX_TX_P0_SHIFT),
>> +			   MTK_ATOP_EN_AUX_TX_P0_MASK, ret, out);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_initialize_digital_settings(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_304C, 0,
>> +			    VBID_VIDEO_MUTE_DP_ENC0_P0_MASK, ret, out);
>> +	mtk_dp_set_color_format(mtk_dp, MTK_DP_COLOR_FORMAT_RGB_444);
>> +	mtk_dp_set_color_depth(mtk_dp, MTK_DP_COLOR_DEPTH_8BIT);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3368,
>> +			    1 << BS2BS_MODE_DP_ENC1_P0_SHIFT,
>> +			   BS2BS_MODE_DP_ENC1_P0_MASK, ret, out);
>> +
>> +	/* dp tx encoder reset all sw */
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3004,
>> +			    BIT(DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_SH
>> IFT),
>> +			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK,
>> ret, out);
>> +	usleep_range(1000, 5000);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
>> +			    DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK,
>> ret, out);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_digital_sw_reset(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_340C,
>> +			    BIT(DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_
>> P0_SHIFT),
>> +			   DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MA
>> SK, ret, out);
>> +	usleep_range(1000, 5000);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_340C, 0,
>> +			    DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_M
>> ASK, ret, out);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_set_lanes(struct mtk_dp *mtk_dp, int lanes)
>> +{
>> +	int ret;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_35F0,
>> +			    lanes == 0 ? 0 : BIT(3), BIT(3) | BIT(2),
>> ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3000, lanes,
>> +			    LANE_NUM_DP_ENC0_P0_MASK, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_34A4,
>> +			    lanes << LANE_NUM_DP_TRANS_P0_SHIFT,
>> +			   LANE_NUM_DP_TRANS_P0_MASK, ret, out);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int link_rate_to_mb_per_s(struct mtk_dp *mtk_dp,
>> +				 enum mtk_dp_linkrate linkrate)
>> +{
>> +	switch (linkrate) {
>> +	default:
>> +		drm_err(mtk_dp->drm_dev,
>> +			"Implementation error, unknown linkrate %d\n",
>> +			linkrate);
>> +		fallthrough;
>
>I think we should return 0?
>
maybe not 0, -EINVAL seemed to be a good candidate?

>> +	case MTK_DP_LINKRATE_RBR:
>> +		return 1620;
>> +	case MTK_DP_LINKRATE_HBR:
>> +		return 2700;
>> +	case MTK_DP_LINKRATE_HBR2:
>> +		return 5400;
>> +	case MTK_DP_LINKRATE_HBR3:
>> +		return 8100;
>> +	}
>> +}
>> +
>> +static u32 check_cal_data_valid(u32 min, u32 max, u32 val, u32
>> default_val)
>> +{
>> +	if (val < min || val > max)
>> +		return default_val;
>
>maybe we should add some warning here.
Will do.
>
>> +
>> +	return val;
>> +}
>> +
>> +static int mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
>> +{
>> +	struct dp_cal_data *cal_data = &mtk_dp->cal_data;
>> +	struct device *dev = mtk_dp->dev;
>> +	struct nvmem_cell *cell;
>> +	u32 *buf;
>> +	size_t len;
>> +
>> +	cell = nvmem_cell_get(dev, "dp_calibration_data");
>> +	if (IS_ERR(cell)) {
>> +		dev_err(dev,
>> +			"Error: Failed to get nvmem cell
>> dp_calibration_data\n");
>> +		return PTR_ERR(cell);
>> +	}
>> +
>> +	buf = (u32 *)nvmem_cell_read(cell, &len);
>> +	nvmem_cell_put(cell);
>> +
>> +	if (IS_ERR(buf) || ((len / sizeof(u32)) != 4)) {
>> +		dev_err(dev,
>> +			"Error: Failed to read nvmem_cell_read fail len
>> %ld\n",
>> +			(len / sizeof(u32)));
>> +		return PTR_ERR(buf);
>> +	}
>> +
>> +	cal_data->glb_bias_trim =
>> +		check_cal_data_valid(1, 0x1e, (buf[3] >> 27) & 0x1f,
>> 0xf);
>> +	cal_data->clktx_impse =
>> +		check_cal_data_valid(1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
>> +	cal_data->ln_tx_impsel_pmos[0] =
>> +		check_cal_data_valid(1, 0xe, (buf[2] >> 28) & 0xf,
>> 0x8);
>> +	cal_data->ln_tx_impsel_nmos[0] =
>> +		check_cal_data_valid(1, 0xe, (buf[2] >> 24) & 0xf,
>> 0x8);
>> +	cal_data->ln_tx_impsel_pmos[1] =
>> +		check_cal_data_valid(1, 0xe, (buf[2] >> 20) & 0xf,
>> 0x8);
>> +	cal_data->ln_tx_impsel_nmos[1] =
>> +		check_cal_data_valid(1, 0xe, (buf[2] >> 16) & 0xf,
>> 0x8);
>> +	cal_data->ln_tx_impsel_pmos[2] =
>> +		check_cal_data_valid(1, 0xe, (buf[2] >> 12) & 0xf,
>> 0x8);
>> +	cal_data->ln_tx_impsel_nmos[2] =
>> +		check_cal_data_valid(1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
>> +	cal_data->ln_tx_impsel_pmos[3] =
>> +		check_cal_data_valid(1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
>> +	cal_data->ln_tx_impsel_nmos[3] =
>> +		check_cal_data_valid(1, 0xe, buf[2] & 0xf, 0x8);
>> +
>> +	kfree(buf);
>> +
>> +	return 0;
>> +}
>> +
>> +static int mtk_dp_set_cal_data(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +	struct dp_cal_data *cal_data = &mtk_dp->cal_data;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_GLB_DPAUX_TX,
>> +			    cal_data->clktx_impse << 20,
>> RG_CKM_PT0_CKTX_IMPSEL, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_GLB_BIAS_GEN_00,
>> +			    cal_data->glb_bias_trim << 16,
>> +			   RG_XTP_GLB_BIAS_INTR_CTRL, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_0,
>> +			    cal_data->ln_tx_impsel_pmos[0] << 12,
>> +			   RG_XTP_LN0_TX_IMPSEL_PMOS, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_0,
>> +			    cal_data->ln_tx_impsel_nmos[0] << 16,
>> +			   RG_XTP_LN0_TX_IMPSEL_NMOS, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_1,
>> +			    cal_data->ln_tx_impsel_pmos[1] << 12,
>> +			   RG_XTP_LN1_TX_IMPSEL_PMOS, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_1,
>> +			    cal_data->ln_tx_impsel_nmos[1] << 16,
>> +			   RG_XTP_LN1_TX_IMPSEL_NMOS, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_2,
>> +			    cal_data->ln_tx_impsel_pmos[2] << 12,
>> +			   RG_XTP_LN2_TX_IMPSEL_PMOS, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_2,
>> +			    cal_data->ln_tx_impsel_nmos[2] << 16,
>> +			   RG_XTP_LN2_TX_IMPSEL_NMOS, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_3,
>> +			    cal_data->ln_tx_impsel_pmos[3] << 12,
>> +			   RG_XTP_LN3_TX_IMPSEL_PMOS, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_3,
>> +			    cal_data->ln_tx_impsel_nmos[3] << 16,
>> +			   RG_XTP_LN3_TX_IMPSEL_NMOS, ret, out);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_phy_configure(struct mtk_dp *mtk_dp,
>> +				enum mtk_dp_linkrate link_rate, int
>> lane_count)
>> +{
>> +	int ret;
>> +	union phy_configure_opts phy_opts = {
>> +		.dp = {
>> +			.link_rate = link_rate_to_mb_per_s(mtk_dp,
>> link_rate),
>> +			.set_rate = 1,
>> +			.lanes = lane_count,
>> +			.set_lanes = 1,
>> +			.ssc = mtk_dp->train_info.sink_ssc,
>> +		}
>> +		};
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_PWR_STATE,
>> DP_PWR_STATE_BANDGAP,
>> +			    DP_PWR_STATE_MASK, ret, out);
>> +
>> +	ret = phy_configure(mtk_dp->phy, &phy_opts);
>> +
>> +	if (ret)
>> +		goto out;
>> +
>> +	mtk_dp_set_cal_data(mtk_dp);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_PWR_STATE,
>> +			    DP_PWR_STATE_BANDGAP_TPLL_LANE,
>> DP_PWR_STATE_MASK, ret, out);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_set_idle_pattern(struct mtk_dp *mtk_dp, bool
>> enable)
>> +{
>> +	const u32 val = POST_MISC_DATA_LANE0_OV_DP_TRANS_P0_MASK |
>> +			POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK |
>> +			POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK |
>> +			POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK;
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3580, enable
>> ? val : 0, val);
>> +}
>> +
>> +//TODO: check return value in callee
>> +static int mtk_dp_train_set_pattern(struct mtk_dp *mtk_dp, int
>> pattern)
>
>maybe we can use uint8 pattern.
>So that we don't need to check the value is < 0.

Yes... and the pattern value is entirely controled within this driver anyway.

>
>> +{
>> +	if (pattern < 0 || pattern > 4) {
>> +		drm_err(mtk_dp->drm_dev,
>> +			"Implementation error, no such pattern %d\n",
>> pattern);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (pattern == 1) /* TPS1 */
>> +		mtk_dp_set_idle_pattern(mtk_dp, false);
>> +
>> +	return mtk_dp_update_bits(mtk_dp,
>> +			   MTK_DP_TRANS_P0_3400,
>> +			   pattern ? BIT(pattern - 1) <<
>> PATTERN1_EN_DP_TRANS_P0_SHIFT : 0,
>> +			   PATTERN1_EN_DP_TRANS_P0_MASK |
>> PATTERN2_EN_DP_TRANS_P0_MASK |
>> +			   PATTERN3_EN_DP_TRANS_P0_MASK |
>> +			   PATTERN4_EN_DP_TRANS_P0_MASK);
>> +}
>> +
>> +static int mtk_dp_set_enhanced_frame_mode(struct mtk_dp *mtk_dp,
>> bool enable)
>> +{
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000,
>> +			   enable ?
>> BIT(ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT) : 0,
>> +			   ENHANCED_FRAME_EN_DP_ENC0_P0_MASK);
>> +}
>> +
>> +static int mtk_dp_training_set_scramble(struct mtk_dp *mtk_dp, bool
>> enable)
>> +{
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3404,
>> +			   enable ? DP_SCR_EN_DP_TRANS_P0_MASK : 0,
>> +			   DP_SCR_EN_DP_TRANS_P0_MASK);
>> +}
>> +
>> +static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
>> +{
>> +	u32 val = BIT(VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT);
>> +
>> +	if (enable)
>> +		val |= BIT(VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT);
>> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
>> +			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
>> +			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
>> +
>> +	mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
>> +}
>> +
>> +static int mtk_dp_power_enable(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE, 0,
>> +			    SW_RST_B_PHYD, ret, out);
>> +	usleep_range(10, 200);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
>> SW_RST_B_PHYD,
>> +			    SW_RST_B_PHYD, ret, out);
>> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_PWR_STATE,
>> +			    DP_PWR_STATE_BANDGAP_TPLL,
>> +			   DP_PWR_STATE_MASK, ret, out);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int mtk_dp_power_disable(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +
>> +	ret = mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
>> +
>> +	if (ret)
>> +		goto out;
>> +
>> +	usleep_range(10, 200);
>> +	ret = mtk_dp_write(mtk_dp, MTK_DP_0034,
>> +			   DA_CKM_CKTX0_EN_FORCE_EN |
>> DA_CKM_BIAS_LPF_EN_FORCE_VAL |
>> +		     DA_CKM_BIAS_EN_FORCE_VAL |
>> +		     DA_XTP_GLB_LDO_EN_FORCE_VAL |
>> +		     DA_XTP_GLB_AVD10_ON_FORCE_VAL);
>> +
>> +	if (ret)
>> +		goto out;
>> +
>> +	/* Disable RX */
>> +	ret = mtk_dp_write(mtk_dp, MTK_DP_1040, 0);
>> +
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
>> +			   0x550 | BIT(FUSE_SEL_SHIFT) |
>> BIT(MEM_ISO_EN_SHIFT));
>> +
>> +out:
>> +	return ret;
>
>If we don't do anything special here, I think we can return directly
>and no need "out" label.

Yes, I'll remove the un-needed labels whenever there's no unwraping to be done.
>
>> +}
>> +
>> +static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
>> +{
>> +	mtk_dp->train_info.link_rate = MTK_DP_LINKRATE_HBR2;
>> +	mtk_dp->train_info.lane_count = MTK_DP_MAX_LANES;
>> +	mtk_dp->train_info.irq_status = 0;
>> +	mtk_dp->train_info.cable_plugged_in = false;
>> +	mtk_dp->train_info.cable_state_change = false;
>> +	mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
>> +	mtk_dp->state = MTK_DP_STATE_INITIAL;
>> +
>> +	mtk_dp->info.format = MTK_DP_COLOR_FORMAT_RGB_444;
>> +	mtk_dp->info.depth = MTK_DP_COLOR_DEPTH_8BIT;
>> +	memset(&mtk_dp->info.timings, 0, sizeof(struct
>> mtk_dp_timings));
>
>maybe re-order this.

Will do.
>
>> +	mtk_dp->info.timings.frame_rate = 60;
>> +
>> +	mtk_dp->has_fec = false;
>> +}
>> +
>> +static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
>> +{
>> +	u32 sram_read_start = MTK_DP_TBC_BUF_READ_START_ADDR;
>> +
>> +	if (mtk_dp->train_info.lane_count > 0) {
>> +		sram_read_start = min_t(u32,
>> +					MTK_DP_TBC_BUF_READ_START_ADDR,
>> +					mtk_dp->info.timings.vm.hactive
>> /
>> +					(mtk_dp->train_info.lane_count
>> * 4 * 2 * 2));
>
>This is something magic number..
>I think we should add some comments here.
>
Will do.
>> +		mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
>> +	}
>> +
>> +	mtk_dp_setup_encoder(mtk_dp);
>> +}
>> +
>> +static void mtk_dp_calculate_pixrate(struct mtk_dp *mtk_dp)
>> +{
>> +	int target_frame_rate = 60;
>> +	int target_pixel_clk;
>> +
>> +	if (mtk_dp->info.timings.frame_rate > 0) {
>> +		target_frame_rate = mtk_dp->info.timings.frame_rate;
>> +		target_pixel_clk = (int)mtk_dp->info.timings.htotal *
>> +				   (int)mtk_dp->info.timings.vtotal *
>> +				   target_frame_rate;
>
>I think target_pixel_clk should be always >= 0?
>Can we use u32 for target_pixel_clk?

Yes, I don't see how any of the calculations could get us a negative pixel_clk.
>
>> +	} else if (mtk_dp->info.timings.pix_rate_khz > 0) {
>> +		target_pixel_clk = mtk_dp->info.timings.pix_rate_khz *
>> 1000;
>> +	} else {
>> +		target_pixel_clk = (int)mtk_dp->info.timings.htotal *
>> +				   (int)mtk_dp->info.timings.vtotal *
>> +				   target_frame_rate;
>> +	}
>> +
>> +	if (target_pixel_clk > 0)
>> +		mtk_dp->info.timings.pix_rate_khz = target_pixel_clk /
>> 1000;
>> +}
>> +
>> +static void mtk_dp_set_tx_out(struct mtk_dp *mtk_dp)
>> +{
>> +	mtk_dp_msa_bypass_disable(mtk_dp);
>> +	mtk_dp_calculate_pixrate(mtk_dp);
>> +	mtk_dp_pg_disable(mtk_dp);
>> +	mtk_dp_setup_tu(mtk_dp);
>> +}
>> +
>> +static void mtk_dp_train_update_swing_pre(struct mtk_dp *mtk_dp, int
>> lanes,
>> +					  u8 dpcd_adjust_req[2])
>> +{
>> +	int lane;
>> +
>> +	for (lane = 0; lane < lanes; ++lane) {
>> +		u8 val;
>> +		u8 swing;
>> +		u8 preemphasis;
>> +		int index = lane / 2;
>> +		int shift = lane % 2 ?
>> DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT : 0;
>> +
>> +		swing = (dpcd_adjust_req[index] >> shift) &
>> +			DP_ADJUST_VOLTAGE_SWING_LANE0_MASK;
>> +		preemphasis = ((dpcd_adjust_req[index] >> shift) &
>> +			       DP_ADJUST_PRE_EMPHASIS_LANE0_MASK) >>
>> +			      DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT;
>> +		val = swing << DP_TRAIN_VOLTAGE_SWING_SHIFT |
>> +		      preemphasis << DP_TRAIN_PRE_EMPHASIS_SHIFT;
>> +
>> +		if (swing == DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
>> +			val |= DP_TRAIN_MAX_SWING_REACHED;
>> +		if (preemphasis == 3)
>> +			val |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
>> +
>> +		mtk_dp_set_swing_pre_emphasis(mtk_dp, lane, swing,
>> preemphasis);
>> +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_TRAINING_LANE0_SET
>> + lane,
>> +				   val);
>> +	}
>> +
>> +	/* Wait for the signal to be stable enough */
>> +	usleep_range(2000, 5000);
>> +}
>> +
>> +static void mtk_dp_read_link_status(struct mtk_dp *mtk_dp,
>> +				    u8
>> link_status[DP_LINK_STATUS_SIZE])
>> +{
>> +	drm_dp_dpcd_read(&mtk_dp->aux, DP_LANE0_1_STATUS, link_status,
>> +			 DP_LINK_STATUS_SIZE);
>> +}
>> +
>> +static int mtk_dp_train_flow(struct mtk_dp *mtk_dp, int
>> target_link_rate,
>> +			     int target_lane_count)
>
>hmm..
>This function is too complicated.
>I think you can refer to this drivers in coreboot
>I have modified this before...
>
>
>https://review.coreboot.org/plugins/gitiles/coreboot/+/refs/heads/master/src/soc/mediatek/mt8195/dptx.c#770
>
Thx for the hints.

>> +{
>> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
>> +	u8 lane_adjust[2] = {};
>> +	bool pass_tps1 = false;
>> +	bool pass_tps2_3 = false;
>> +	int train_retries;
>> +	int status_control;
>> +	int iteration_count;
>> +	u8 prev_lane_adjust;
>> +	u8 val;
>> +
>> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LINK_BW_SET,
>> target_link_rate);
>> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
>> +			   target_lane_count |
>> DP_LANE_COUNT_ENHANCED_FRAME_EN);
>> +
>> +	if (mtk_dp->train_info.sink_ssc)
>> +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DOWNSPREAD_CTRL,
>> +				   DP_SPREAD_AMP_0_5);
>> +
>> +	train_retries = 0;
>> +	status_control = 0;
>> +	iteration_count = 1;
>> +	prev_lane_adjust = 0xFF;
>> +
>> +	mtk_dp_set_lanes(mtk_dp, target_lane_count / 2);
>> +	mtk_dp_phy_configure(mtk_dp, target_link_rate,
>> target_lane_count);
>> +
>> +	dev_dbg(mtk_dp->dev,
>> +		"Link train target_link_rate = 0x%x, target_lane_count
>> = 0x%x\n",
>> +		target_link_rate, target_lane_count);
>> +
>> +	do {
>> +		train_retries++;
>> +		if (!mtk_dp->train_info.cable_plugged_in ||
>> +		    ((mtk_dp->train_info.irq_status &
>> MTK_DP_HPD_DISCONNECT) !=
>> +		     0x0)) {
>> +			return -ENODEV;
>> +		}
>> +
>> +		if (mtk_dp->train_state < MTK_DP_TRAIN_STATE_TRAINING)
>> +			return -EAGAIN;
>> +
>> +		if (!pass_tps1) {
>> +			mtk_dp_training_set_scramble(mtk_dp, false);
>> +
>> +			if (status_control == 0) {
>> +				status_control = 1;
>> +				mtk_dp_train_set_pattern(mtk_dp, 1);
>> +				val = DP_LINK_SCRAMBLING_DISABLE |
>> +				      DP_TRAINING_PATTERN_1;
>> +				drm_dp_dpcd_writeb(&mtk_dp->aux,
>> +						   DP_TRAINING_PATTERN_
>> SET,
>> +						   DP_LINK_SCRAMBLING_D
>> ISABLE |
>> +						   DP_TRAINING_PATTERN_
>> 1);
>> +				drm_dp_dpcd_read(&mtk_dp->aux,
>> +						 DP_ADJUST_REQUEST_LANE
>> 0_1,
>> +						 lane_adjust,
>> +						 sizeof(lane_adjust));
>> +				iteration_count++;
>> +
>> +				mtk_dp_train_update_swing_pre(mtk_dp,
>> +							      target_la
>> ne_count, lane_adjust);
>> +			}
>> +
>> +			drm_dp_link_train_clock_recovery_delay(&mtk_dp-
>> >aux,
>> +							       mtk_dp-
>> >rx_cap);
>> +			mtk_dp_read_link_status(mtk_dp, link_status);
>> +
>> +			if (drm_dp_clock_recovery_ok(link_status,
>> +						     target_lane_count)
>> ) {
>> +				mtk_dp->train_info.cr_done = true;
>> +				pass_tps1 = true;
>> +				train_retries = 0;
>> +				iteration_count = 1;
>> +				dev_dbg(mtk_dp->dev, "Link train CR
>> pass\n");
>> +			} else if (prev_lane_adjust == link_status[4])
>> {
>> +				iteration_count++;
>> +				if (prev_lane_adjust &
>> +				    DP_ADJUST_VOLTAGE_SWING_LANE0_MASK)
>> +					break;
>> +			} else {
>> +				prev_lane_adjust = link_status[4];
>> +			}
>> +			dev_dbg(mtk_dp->dev, "Link train CQ fail\n");
>> +		} else if (pass_tps1 && !pass_tps2_3) {
>> +			if (status_control == 1) {
>> +				status_control = 2;
>> +				if (mtk_dp->train_info.tps4) {
>> +					mtk_dp_train_set_pattern(mtk_dp
>> , 4);
>> +					val = DP_TRAINING_PATTERN_4;
>> +				} else if (mtk_dp->train_info.tps3) {
>> +					mtk_dp_train_set_pattern(mtk_dp
>> , 3);
>> +					val =
>> DP_LINK_SCRAMBLING_DISABLE |
>> +					      DP_TRAINING_PATTERN_3;
>> +				} else {
>> +					mtk_dp_train_set_pattern(mtk_dp
>> , 2);
>> +					val =
>> DP_LINK_SCRAMBLING_DISABLE |
>> +					      DP_TRAINING_PATTERN_2;
>> +				}
>> +				drm_dp_dpcd_writeb(&mtk_dp->aux,
>> +						   DP_TRAINING_PATTERN_
>> SET,
>> +						   val);
>> +
>> +				drm_dp_dpcd_read(&mtk_dp->aux,
>> +						 DP_ADJUST_REQUEST_LANE
>> 0_1,
>> +						 lane_adjust,
>> +						 sizeof(lane_adjust));
>> +
>> +				iteration_count++;
>> +				mtk_dp_train_update_swing_pre(mtk_dp,
>> +							      target_la
>> ne_count, lane_adjust);
>> +			}
>> +
>> +			drm_dp_link_train_channel_eq_delay(&mtk_dp-
>> >aux,
>> +							   mtk_dp-
>> >rx_cap);
>> +
>> +			mtk_dp_read_link_status(mtk_dp, link_status);
>> +
>> +			if (!drm_dp_clock_recovery_ok(link_status,
>> +						      target_lane_count
>> )) {
>> +				mtk_dp->train_info.cr_done = false;
>> +				mtk_dp->train_info.eq_done = false;
>> +				dev_dbg(mtk_dp->dev, "Link train EQ
>> fail\n");
>> +				break;
>> +			}
>> +
>> +			if (drm_dp_channel_eq_ok(link_status,
>> +						 target_lane_count)) {
>> +				mtk_dp->train_info.eq_done = true;
>> +				pass_tps2_3 = true;
>> +				dev_dbg(mtk_dp->dev, "Link train EQ
>> pass\n");
>> +				break;
>> +			}
>> +
>> +			if (prev_lane_adjust == link_status[4])
>> +				iteration_count++;
>> +			else
>> +				prev_lane_adjust = link_status[4];
>> +		}
>> +
>> +		drm_dp_dpcd_read(&mtk_dp->aux,
>> DP_ADJUST_REQUEST_LANE0_1,
>> +				 lane_adjust, sizeof(lane_adjust));
>> +		mtk_dp_train_update_swing_pre(mtk_dp,
>> target_lane_count,
>> +					      lane_adjust);
>> +	} while (train_retries < MTK_DP_TRAIN_RETRY_LIMIT &&
>> +		 iteration_count < MTK_DP_TRAIN_MAX_ITERATIONS);
>> +
>> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_TRAINING_PATTERN_SET,
>> +			   DP_TRAINING_PATTERN_DISABLE);
>> +	mtk_dp_train_set_pattern(mtk_dp, 0);
>> +
>> +	if (!pass_tps2_3)
>> +		return -ETIMEDOUT;
>> +
>> +	mtk_dp->train_info.link_rate = target_link_rate;
>> +	mtk_dp->train_info.lane_count = target_lane_count;
>> +
>> +	mtk_dp_training_set_scramble(mtk_dp, true);
>> +
>> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
>> +			   target_lane_count |
>> +				   DP_LANE_COUNT_ENHANCED_FRAME_EN);
>> +	mtk_dp_set_enhanced_frame_mode(mtk_dp, true);
>> +
>> +	return 0;
>> +}
>>
>
>snip..
>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>> b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>> new file mode 100644
>> index 000000000000..c446eef18169
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>
>For mtk_dp_reg.h,
>1. I think it's no need to add parnethess for BIT().
>2. Use tab to alignment for readability.
>

Will do.

Thx for your review,
Guillaume.

>BRs,
>Rex
>
>> @@ -0,0 +1,568 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2019 MediaTek Inc.
>> + * Copyright (c) 2021 BayLibre
>> + */
>> +#ifndef _MTK_DP_REG_H_
>> +#define _MTK_DP_REG_H_
>> +
>> +#define MTK_DP_SIP_CONTROL_AARCH32 (BIT(0) | BIT(1) | BIT(5) |
>> BIT(8) | BIT(10) | BIT(25) | BIT(31))
>> +#define MTK_DP_SIP_ATF_VIDEO_UNMUTE (BIT(5))
>> +#define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE (BIT(0) | BIT(5))
>> +
>> +#define DP_PHY_GLB_BIAS_GEN_00 0
>> +#define RG_XTP_GLB_BIAS_INTR_CTRL GENMASK(20, 16)
>> +
>> +#define DP_PHY_GLB_DPAUX_TX (BIT(3))
>> +#define RG_CKM_PT0_CKTX_IMPSEL GENMASK(23, 20)
>> +
>> +#define DP_PHY_LANE_TX_0 (BIT(2) | BIT(8))
>> +#define RG_XTP_LN0_TX_IMPSEL_PMOS GENMASK(15, 12)
>> +#define RG_XTP_LN0_TX_IMPSEL_NMOS GENMASK(19, 16)
>> +
>> +#define DP_PHY_LANE_TX_1 (BIT(2) | BIT(9))
>> +#define RG_XTP_LN1_TX_IMPSEL_PMOS GENMASK(15, 12)
>> +#define RG_XTP_LN1_TX_IMPSEL_NMOS GENMASK(19, 16)
>> +
>> +#define DP_PHY_LANE_TX_2 (BIT(2) | BIT(8) | BIT(9))
>> +#define RG_XTP_LN2_TX_IMPSEL_PMOS GENMASK(15, 12)
>> +#define RG_XTP_LN2_TX_IMPSEL_NMOS GENMASK(19, 16)
>> +
>> +#define DP_PHY_LANE_TX_3 (BIT(2) | BIT(10))
>> +#define RG_XTP_LN3_TX_IMPSEL_PMOS GENMASK(15, 12)
>> +#define RG_XTP_LN3_TX_IMPSEL_NMOS GENMASK(19, 16)
>> +
>> +#define TOP_OFFSET (BIT(13))
>> +#define ENC0_OFFSET GENMASK(13, 12)
>> +#define ENC1_OFFSET (BIT(9) | BIT(12) | BIT(13))
>> +#define TRANS_OFFSET (BIT(10) | BIT(12) | BIT(13))
>> +#define AUX_OFFSET (BIT(9) | BIT(10) | BIT(12) | BIT(13))
>> +#define SEC_OFFSET (BIT(14))
>> +
>> +#define MTK_DP_HPD_DISCONNECT BIT(1)
>> +#define MTK_DP_HPD_CONNECT BIT(2)
>> +#define MTK_DP_HPD_INTERRUPT BIT(3)
>> +
>> +#define MTK_DP_0034 (BIT(2) | BIT(4) | BIT(5))
>> +#define DA_XTP_GLB_CKDET_EN_FORCE_VAL BIT(15)
>> +#define DA_XTP_GLB_CKDET_EN_FORCE_EN BIT(14)
>> +#define DA_CKM_INTCKTX_EN_FORCE_VAL BIT(13)
>> +#define DA_CKM_INTCKTX_EN_FORCE_EN BIT(12)
>> +#define DA_CKM_CKTX0_EN_FORCE_VAL BIT(11)
>> +#define DA_CKM_CKTX0_EN_FORCE_EN BIT(10)
>> +#define DA_CKM_XTAL_CK_FORCE_VAL BIT(9)
>> +#define DA_CKM_XTAL_CK_FORCE_EN BIT(8)
>> +#define DA_CKM_BIAS_LPF_EN_FORCE_VAL BIT(7)
>> +#define DA_CKM_BIAS_LPF_EN_FORCE_EN BIT(6)
>> +#define DA_CKM_BIAS_EN_FORCE_VAL BIT(5)
>> +#define DA_CKM_BIAS_EN_FORCE_EN BIT(4)
>> +#define DA_XTP_GLB_AVD10_ON_FORCE_VAL BIT(3)
>> +#define DA_XTP_GLB_AVD10_ON_FORCE BIT(2)
>> +#define DA_XTP_GLB_LDO_EN_FORCE_VAL BIT(1)
>> +#define DA_XTP_GLB_LDO_EN_FORCE_EN BIT(0)
>> +
>> +#define MTK_DP_1040 (BIT(6) | BIT(12))
>> +#define RG_DPAUX_RX_VALID_DEGLITCH_EN BIT(2)
>> +#define RG_XTP_GLB_CKDET_EN BIT(1)
>> +#define RG_DPAUX_RX_EN BIT(0)
>> +
>> +#define MTK_DP_ENC0_P0_3000 (ENC0_OFFSET + 0x00)
>> +#define LANE_NUM_DP_ENC0_P0_MASK GENMASK(1, 0)
>> +#define VIDEO_MUTE_SW_DP_ENC0_P0_MASK (BIT(2))
>> +#define VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT (BIT(1))
>> +#define VIDEO_MUTE_SEL_DP_ENC0_P0_MASK (BIT(3))
>> +#define VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT GENMASK(1, 0)
>> +#define ENHANCED_FRAME_EN_DP_ENC0_P0_MASK (BIT(4))
>> +#define ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT (BIT(2))
>> +
>> +#define MTK_DP_ENC0_P0_3004 (ENC0_OFFSET + 0x04)
>> +#define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK (BIT(8))
>> +#define VIDEO_M_CODE_SEL_DP_ENC0_P0_SHIFT (BIT(3))
>> +#define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK (BIT(9))
>> +#define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_SHIFT (BIT(0) | BIT(3))
>> +
>> +#define MTK_DP_ENC0_P0_3008 (ENC0_OFFSET + 0x08)
>> +#define VIDEO_M_CODE_SW_0_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_300C (ENC0_OFFSET + 0x0C)
>> +#define VIDEO_M_CODE_SW_1_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3010 (ENC0_OFFSET + 0x10)
>> +#define HTOTAL_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3014 (ENC0_OFFSET + 0x14)
>> +#define VTOTAL_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3018 (ENC0_OFFSET + 0x18)
>> +#define HSTART_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_301C (ENC0_OFFSET + 0x1C)
>> +#define VSTART_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3020 (ENC0_OFFSET + 0x20)
>> +#define HWIDTH_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3024 (ENC0_OFFSET + 0x24)
>> +#define VHEIGHT_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3028 (ENC0_OFFSET + 0x28)
>> +#define HSW_SW_DP_ENC0_P0_MASK GENMASK(14, 0)
>> +#define HSW_SW_DP_ENC0_P0_SHIFT 0
>> +#define HSP_SW_DP_ENC0_P0_MASK (BIT(15))
>> +
>> +#define MTK_DP_ENC0_P0_302C (ENC0_OFFSET + 0x2C)
>> +#define VSW_SW_DP_ENC0_P0_MASK GENMASK(14, 0)
>> +#define VSW_SW_DP_ENC0_P0_SHIFT 0
>> +#define VSP_SW_DP_ENC0_P0_MASK (BIT(15))
>> +
>> +#define MTK_DP_ENC0_P0_3030 (ENC0_OFFSET + 0x30)
>> +#define HTOTAL_SEL_DP_ENC0_P0_SHIFT 0
>> +#define VTOTAL_SEL_DP_ENC0_P0_SHIFT (BIT(0))
>> +#define HSTART_SEL_DP_ENC0_P0_SHIFT (BIT(1))
>> +#define VSTART_SEL_DP_ENC0_P0_SHIFT GENMASK(1, 0)
>> +#define HWIDTH_SEL_DP_ENC0_P0_SHIFT (BIT(2))
>> +#define VHEIGHT_SEL_DP_ENC0_P0_SHIFT (BIT(0) | BIT(2))
>> +#define HSP_SEL_DP_ENC0_P0_SHIFT GENMASK(2, 1)
>> +#define HSW_SEL_DP_ENC0_P0_SHIFT GENMASK(2, 0)
>> +#define VSP_SEL_DP_ENC0_P0_SHIFT (BIT(3))
>> +#define VSW_SEL_DP_ENC0_P0_SHIFT (BIT(0) | BIT(3))
>> +#define VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK (BIT(11))
>> +#define VBID_AUDIO_MUTE_SW_DP_ENC0_P0_SHIFT (BIT(0) | BIT(1) |
>> BIT(3))
>> +#define VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK (BIT(12))
>> +#define VBID_AUDIO_MUTE_SEL_DP_ENC0_P0_SHIFT GENMASK(3, 2)
>> +
>> +#define MTK_DP_ENC0_P0_3034 (ENC0_OFFSET + 0x34)
>> +
>> +#define MTK_DP_ENC0_P0_3038 (ENC0_OFFSET + 0x38)
>> +#define VIDEO_SOURCE_SEL_DP_ENC0_P0_MASK (BIT(11))
>> +#define VIDEO_SOURCE_SEL_DP_ENC0_P0_SHIFT (BIT(0) | BIT(1) | BIT(3))
>> +
>> +#define MTK_DP_ENC0_P0_303C (ENC0_OFFSET + 0x3C)
>> +#define SRAM_START_READ_THRD_DP_ENC0_P0_MASK GENMASK(5, 0)
>> +#define SRAM_START_READ_THRD_DP_ENC0_P0_SHIFT 0
>> +#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK GENMASK(10, 8)
>> +#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT (BIT(3))
>> +#define
>> VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT
>>   \
>> +	(0 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
>> +#define
>> VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT
>>   \
>> +	(1 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
>> +#define
>> VIDEO_COLOR_DEPTH_DP_ENC0_P0_10BIT
>>   \
>> +	(2 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
>> +#define
>> VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT
>>   \
>> +	(3 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
>> +#define
>> VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT
>>   \
>> +	(4 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
>> +#define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK GENMASK(14, 12)
>> +#define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT GENMASK(3, 2)
>> +#define
>> PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB
>>   \
>> +	(0 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
>> +#define
>> PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422
>>   \
>> +	(1 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
>> +#define
>> PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420
>>   \
>> +	(2 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
>> +#define VIDEO_MN_GEN_EN_DP_ENC0_P0_MASK (BIT(15))
>> +#define VIDEO_MN_GEN_EN_DP_ENC0_P0_SHIFT GENMASK(3, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3040 (ENC0_OFFSET + 0x40)
>> +#define SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK GENMASK(11, 0)
>> +#define SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT 0
>> +
>> +#define MTK_DP_ENC0_P0_3044 (ENC0_OFFSET + 0x44)
>> +#define VIDEO_N_CODE_0_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3048 (ENC0_OFFSET + 0x48)
>> +#define VIDEO_N_CODE_1_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +
>> +#define MTK_DP_ENC0_P0_304C (ENC0_OFFSET + 0x4C)
>> +#define VBID_VIDEO_MUTE_DP_ENC0_P0_MASK (BIT(2))
>> +#define SDP_VSYNC_RISING_MASK_DP_ENC0_P0_MASK (BIT(8))
>> +
>> +#define MTK_DP_ENC0_P0_3050 (ENC0_OFFSET + 0x50)
>> +#define VIDEO_N_CODE_MN_GEN_0_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3054 (ENC0_OFFSET + 0x54)
>> +#define VIDEO_N_CODE_MN_GEN_1_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3064 (ENC0_OFFSET + 0x64)
>> +#define HDE_NUM_LAST_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3088 (ENC0_OFFSET + 0x88)
>> +#define AU_EN_DP_ENC0_P0_MASK (BIT(6))
>> +#define AU_EN_DP_ENC0_P0_SHIFT GENMASK(2, 1)
>> +#define AUDIO_8CH_EN_DP_ENC0_P0_MASK (BIT(7))
>> +#define AUDIO_8CH_SEL_DP_ENC0_P0_MASK (BIT(8))
>> +#define AUDIO_2CH_EN_DP_ENC0_P0_MASK (BIT(14))
>> +#define AUDIO_2CH_SEL_DP_ENC0_P0_MASK (BIT(15))
>> +
>> +#define MTK_DP_ENC0_P0_308C (ENC0_OFFSET + 0x8C)
>> +#define CH_STATUS_0_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3090 (ENC0_OFFSET + 0x90)
>> +#define CH_STATUS_1_DP_ENC0_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3094 (ENC0_OFFSET + 0x94)
>> +#define CH_STATUS_2_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +
>> +#define MTK_DP_ENC0_P0_30A0 (ENC0_OFFSET + 0xA0)
>> +
>> +#define MTK_DP_ENC0_P0_30A4 (ENC0_OFFSET + 0xA4)
>> +#define AU_TS_CFG_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +
>> +#define MTK_DP_ENC0_P0_30A8 (ENC0_OFFSET + 0xA8)
>> +
>> +#define MTK_DP_ENC0_P0_30AC (ENC0_OFFSET + 0xAC)
>> +
>> +#define MTK_DP_ENC0_P0_30B0 (ENC0_OFFSET + 0xB0)
>> +
>> +#define MTK_DP_ENC0_P0_30B4 (ENC0_OFFSET + 0xB4)
>> +#define ISRC_CFG_DP_ENC0_P0_MASK GENMASK(15, 8)
>> +#define ISRC_CFG_DP_ENC0_P0_SHIFT (BIT(3))
>> +
>> +#define MTK_DP_ENC0_P0_30B8 (ENC0_OFFSET + 0xB8)
>> +
>> +#define MTK_DP_ENC0_P0_30BC (ENC0_OFFSET + 0xBC)
>> +#define ISRC_CONT_DP_ENC0_P0_MASK (BIT(0))
>> +#define ISRC_CONT_DP_ENC0_P0_SHIFT 0
>> +#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK GENMASK(10, 8)
>> +#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT (BIT(3))
>> +#define
>> AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2
>>   \
>> +	(1 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
>> +#define
>> AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4
>>   \
>> +	(2 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
>> +#define
>> AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8
>>   \
>> +	(3 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
>> +#define
>> AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2
>>   \
>> +	(5 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
>> +#define
>> AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4
>>   \
>> +	(6 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
>> +#define
>> AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8
>>   \
>> +	(7 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
>> +
>> +#define MTK_DP_ENC0_P0_30D8 (ENC0_OFFSET + 0xD8)
>> +
>> +#define MTK_DP_ENC0_P0_312C (ENC0_OFFSET + 0x12C)
>> +#define ASP_HB2_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +#define ASP_HB3_DP_ENC0_P0_MASK GENMASK(15, 8)
>> +#define ASP_HB3_DP_ENC0_P0_SHIFT (BIT(3))
>> +
>> +#define MTK_DP_ENC0_P0_3130 (ENC0_OFFSET + 0x130)
>> +
>> +#define MTK_DP_ENC0_P0_3138 (ENC0_OFFSET + 0x138)
>> +
>> +#define MTK_DP_ENC0_P0_3154 (ENC0_OFFSET + 0x154)
>> +#define PGEN_HTOTAL_DP_ENC0_P0_MASK GENMASK(13, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3158 (ENC0_OFFSET + 0x158)
>> +#define PGEN_HSYNC_RISING_DP_ENC0_P0_MASK GENMASK(13, 0)
>> +
>> +#define MTK_DP_ENC0_P0_315C (ENC0_OFFSET + 0x15C)
>> +#define PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK GENMASK(13, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3160 (ENC0_OFFSET + 0x160)
>> +#define PGEN_HFDE_START_DP_ENC0_P0_MASK GENMASK(13, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3164 (ENC0_OFFSET + 0x164)
>> +#define PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK GENMASK(13, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3168 (ENC0_OFFSET + 0x168)
>> +#define PGEN_VTOTAL_DP_ENC0_P0_MASK GENMASK(12, 0)
>> +
>> +#define MTK_DP_ENC0_P0_316C (ENC0_OFFSET + 0x16C)
>> +#define PGEN_VSYNC_RISING_DP_ENC0_P0_MASK GENMASK(12, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3170 (ENC0_OFFSET + 0x170)
>> +#define PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK GENMASK(12, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3174 (ENC0_OFFSET + 0x174)
>> +#define PGEN_VFDE_START_DP_ENC0_P0_MASK GENMASK(12, 0)
>> +
>> +#define MTK_DP_ENC0_P0_3178 (ENC0_OFFSET + 0x178)
>> +#define PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK GENMASK(12, 0)
>> +
>> +#define MTK_DP_ENC0_P0_31B0 (ENC0_OFFSET + 0x1B0)
>> +#define PGEN_PATTERN_SEL_SHIFT (BIT(2))
>> +#define PGEN_PATTERN_SEL_MASK GENMASK(6, 4)
>> +
>> +#define MTK_DP_ENC0_P0_31C8 (ENC0_OFFSET + 0x1C8)
>> +#define VSC_EXT_VESA_HB0_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +#define VSC_EXT_VESA_HB1_DP_ENC0_P0_MASK GENMASK(15, 8)
>> +#define VSC_EXT_VESA_HB1_DP_ENC0_P0_SHIFT (BIT(3))
>> +
>> +#define MTK_DP_ENC0_P0_31CC (ENC0_OFFSET + 0x1CC)
>> +#define VSC_EXT_VESA_HB2_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +#define VSC_EXT_VESA_HB2_DP_ENC0_P0_SHIFT 0
>> +#define VSC_EXT_VESA_HB3_DP_ENC0_P0_MASK GENMASK(15, 8)
>> +
>> +#define MTK_DP_ENC0_P0_31D0 (ENC0_OFFSET + 0x1D0)
>> +#define VSC_EXT_CEA_HB0_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +#define VSC_EXT_CEA_HB1_DP_ENC0_P0_MASK GENMASK(15, 8)
>> +#define VSC_EXT_CEA_HB1_DP_ENC0_P0_SHIFT (BIT(3))
>> +
>> +#define MTK_DP_ENC0_P0_31D4 (ENC0_OFFSET + 0x1D4)
>> +#define VSC_EXT_CEA_HB2_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +#define VSC_EXT_CEA_HB2_DP_ENC0_P0_SHIFT 0
>> +#define VSC_EXT_CEA_HB3_DP_ENC0_P0_MASK GENMASK(15, 8)
>> +
>> +#define MTK_DP_ENC0_P0_31D8 (ENC0_OFFSET + 0x1D8)
>> +#define VSC_EXT_VESA_NUM_DP_ENC0_P0_MASK GENMASK(5, 0)
>> +#define VSC_EXT_VESA_NUM_DP_ENC0_P0_SHIFT 0
>> +#define VSC_EXT_CEA_NUM_DP_ENC0_P0_MASK GENMASK(13, 8)
>> +#define VSC_EXT_CEA_NUM_DP_ENC0_P0_SHIFT (BIT(3))
>> +
>> +#define MTK_DP_ENC0_P0_31DC (ENC0_OFFSET + 0x1DC)
>> +#define HDR0_CFG_DP_ENC0_P0_MASK GENMASK(7, 0)
>> +#define HDR0_CFG_DP_ENC0_P0_SHIFT 0
>> +
>> +#define MTK_DP_ENC0_P0_31E8 (ENC0_OFFSET + 0x1E8)
>> +
>> +#define MTK_DP_ENC0_P0_31EC (ENC0_OFFSET + 0x1EC)
>> +#define AUDIO_CH_SRC_SEL_DP_ENC0_P0_MASK (BIT(4))
>> +#define AUDIO_CH_SRC_SEL_DP_ENC0_P0_SHIFT (BIT(2))
>> +#define ISRC1_HB3_DP_ENC0_P0_MASK GENMASK(15, 8)
>> +#define ISRC1_HB3_DP_ENC0_P0_SHIFT (BIT(3))
>> +
>> +#define MTK_DP_ENC1_P0_3200 (ENC1_OFFSET + 0x00)
>> +
>> +#define MTK_DP_ENC1_P0_3280 (ENC1_OFFSET + 0x80)
>> +#define SDP_PACKET_TYPE_DP_ENC1_P0_MASK GENMASK(4, 0)
>> +#define SDP_PACKET_W_DP_ENC1_P0 (BIT(5))
>> +#define SDP_PACKET_W_DP_ENC1_P0_MASK (BIT(5))
>> +#define SDP_PACKET_W_DP_ENC1_P0_SHIFT (BIT(0) | BIT(2))
>> +
>> +#define MTK_DP_ENC1_P0_328C (ENC1_OFFSET + 0x8C)
>> +
>> +#define MTK_DP_ENC1_P0_3290 (ENC1_OFFSET + 0x90)
>> +
>> +#define MTK_DP_ENC1_P0_32A0 (ENC1_OFFSET + 0xA0)
>> +
>> +#define MTK_DP_ENC1_P0_32A4 (ENC1_OFFSET + 0xA4)
>> +
>> +#define MTK_DP_ENC1_P0_3300 (ENC1_OFFSET + 0x100)
>> +#define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK GENMASK(9, 8)
>> +#define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_SHIFT (BIT(3))
>> +
>> +#define MTK_DP_ENC1_P0_3304 (ENC1_OFFSET + 0x104)
>> +#define AU_PRTY_REGEN_DP_ENC1_P0_MASK (BIT(8))
>> +#define AU_CH_STS_REGEN_DP_ENC1_P0_MASK (BIT(9))
>> +#define AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK (BIT(12))
>> +
>> +#define MTK_DP_ENC1_P0_3324 (ENC1_OFFSET + 0x124)
>> +#define AUDIO_SOURCE_MUX_DP_ENC1_P0_MASK GENMASK(9, 8)
>> +#define AUDIO_SOURCE_MUX_DP_ENC1_P0_SHIFT (BIT(3))
>> +#define
>> AUDIO_SOURCE_MUX_DP_ENC1_P0_DPRX
>>   \
>> +	(0 << AUDIO_SOURCE_MUX_DP_ENC1_P0_SHIFT)
>> +
>> +#define MTK_DP_ENC1_P0_3364 (ENC1_OFFSET + 0x164)
>> +#define SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK GENMASK(11, 0)
>> +#define SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_SHIFT 0
>> +#define FIFO_READ_START_POINT_DP_ENC1_P0_MASK GENMASK(15, 12)
>> +#define FIFO_READ_START_POINT_DP_ENC1_P0_SHIFT GENMASK(3, 2)
>> +
>> +#define MTK_DP_ENC1_P0_3368 (ENC1_OFFSET + 0x168)
>> +#define VIDEO_SRAM_FIFO_CNT_RESET_SEL_DP_ENC1_P0_SHIFT 0
>> +#define VIDEO_STABLE_CNT_THRD_DP_ENC1_P0_SHIFT (BIT(2))
>> +#define SDP_DP13_EN_DP_ENC1_P0_SHIFT (BIT(3))
>> +#define BS2BS_MODE_DP_ENC1_P0_MASK GENMASK(13, 12)
>> +#define BS2BS_MODE_DP_ENC1_P0_SHIFT GENMASK(3, 2)
>> +
>> +#define MTK_DP_ENC1_P0_33F4 (ENC1_OFFSET + 0x1F4)
>> +
>> +#define MTK_DP_TRANS_P0_3400 (TRANS_OFFSET + 0)
>> +#define PATTERN1_EN_DP_TRANS_P0_MASK (BIT(12))
>> +#define PATTERN1_EN_DP_TRANS_P0_SHIFT GENMASK(3, 2)
>> +#define PATTERN2_EN_DP_TRANS_P0_MASK (BIT(13))
>> +#define PATTERN3_EN_DP_TRANS_P0_MASK (BIT(14))
>> +#define PATTERN4_EN_DP_TRANS_P0_MASK (BIT(15))
>> +
>> +#define MTK_DP_TRANS_P0_3404 (TRANS_OFFSET + 0x4)
>> +#define DP_SCR_EN_DP_TRANS_P0_MASK (BIT(0))
>> +
>> +#define MTK_DP_TRANS_P0_340C (TRANS_OFFSET + 0xC)
>> +#define DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK (BIT(13))
>> +#define DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_SHIFT (BIT(0) |
>> BIT(2) | BIT(3))
>> +
>> +#define MTK_DP_TRANS_P0_3410 (TRANS_OFFSET + 0x10)
>> +#define HPD_DEB_THD_DP_TRANS_P0_MASK GENMASK(3, 0)
>> +#define HPD_DEB_THD_DP_TRANS_P0_SHIFT 0
>> +#define HPD_INT_THD_DP_TRANS_P0_MASK GENMASK(7, 4)
>> +#define HPD_INT_THD_DP_TRANS_P0_SHIFT (BIT(2))
>> +#define HPD_INT_THD_DP_TRANS_P0_LOWER_500US (2 <<
>> HPD_INT_THD_DP_TRANS_P0_SHIFT)
>> +#define
>> HPD_INT_THD_DP_TRANS_P0_UPPER_1100US
>>   \
>> +	(2 << (HPD_INT_THD_DP_TRANS_P0_SHIFT + 2))
>> +#define HPD_DISC_THD_DP_TRANS_P0_MASK GENMASK(11, 8)
>> +#define HPD_DISC_THD_DP_TRANS_P0_SHIFT (BIT(3))
>> +#define HPD_CONN_THD_DP_TRANS_P0_MASK GENMASK(15, 12)
>> +#define HPD_CONN_THD_DP_TRANS_P0_SHIFT GENMASK(3, 2)
>> +
>> +#define MTK_DP_TRANS_P0_3414 (TRANS_OFFSET + 0x14)
>> +#define HPD_DB_DP_TRANS_P0_MASK (BIT(2))
>> +
>> +#define MTK_DP_TRANS_P0_3418 (TRANS_OFFSET + 0x18)
>> +#define IRQ_CLR_DP_TRANS_P0_MASK GENMASK(3, 0)
>> +#define IRQ_MASK_DP_TRANS_P0_MASK GENMASK(7, 4)
>> +#define IRQ_MASK_DP_TRANS_P0_SHIFT (BIT(2))
>> +#define IRQ_MASK_DP_TRANS_P0_DISC_IRQ (BIT(1) <<
>> IRQ_MASK_DP_TRANS_P0_SHIFT)
>> +#define IRQ_MASK_DP_TRANS_P0_CONN_IRQ (BIT(2) <<
>> IRQ_MASK_DP_TRANS_P0_SHIFT)
>> +#define IRQ_MASK_DP_TRANS_P0_INT_IRQ (BIT(3) <<
>> IRQ_MASK_DP_TRANS_P0_SHIFT)
>> +#define IRQ_STATUS_DP_TRANS_P0_MASK GENMASK(15, 12)
>> +#define IRQ_STATUS_DP_TRANS_P0_SHIFT GENMASK(3, 2)
>> +
>> +#define MTK_DP_TRANS_P0_342C (TRANS_OFFSET + 0x2C)
>> +#define XTAL_FREQ_DP_TRANS_P0_DEFAULT (BIT(0) | BIT(3) | BIT(5) |
>> BIT(6))
>> +#define XTAL_FREQ_DP_TRANS_P0_MASK GENMASK(7, 0)
>> +
>> +#define MTK_DP_TRANS_P0_3430 (TRANS_OFFSET + 0x30)
>> +#define HPD_INT_THD_ECO_DP_TRANS_P0_MASK GENMASK(1, 0)
>> +#define HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT BIT(1)
>> +
>> +#define MTK_DP_TRANS_P0_34A4 (TRANS_OFFSET + 0xA4)
>> +#define LANE_NUM_DP_TRANS_P0_MASK GENMASK(3, 2)
>> +#define LANE_NUM_DP_TRANS_P0_SHIFT (BIT(1))
>> +
>> +#define MTK_DP_TRANS_P0_3540 (TRANS_OFFSET + 0x140)
>> +#define FEC_EN_DP_TRANS_P0_MASK (BIT(0))
>> +#define FEC_EN_DP_TRANS_P0_SHIFT 0
>> +#define FEC_CLOCK_EN_MODE_DP_TRANS_P0_MASK (BIT(3))
>> +#define FEC_CLOCK_EN_MODE_DP_TRANS_P0_SHIFT GENMASK(1, 0)
>> +
>> +#define MTK_DP_TRANS_P0_3580 (TRANS_OFFSET + 0x180)
>> +#define POST_MISC_DATA_LANE0_OV_DP_TRANS_P0_MASK (BIT(8))
>> +#define POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK (BIT(9))
>> +#define POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK (BIT(10))
>> +#define POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK (BIT(11))
>> +
>> +#define MTK_DP_TRANS_P0_35C4 (TRANS_OFFSET + 0x1C4)
>> +#define SW_IRQ_MASK_DP_TRANS_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_TRANS_P0_35C8 (TRANS_OFFSET + 0x1C8)
>> +#define SW_IRQ_CLR_DP_TRANS_P0_MASK GENMASK(15, 0)
>> +
>> +#define SW_IRQ_STATUS_DP_TRANS_P0_MASK GENMASK(15, 0)
>> +#define SW_IRQ_STATUS_DP_TRANS_P0_SHIFT 0
>> +
>> +#define MTK_DP_TRANS_P0_35D0 (TRANS_OFFSET + 0x1D0)
>> +#define SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_TRANS_P0_35F0 (TRANS_OFFSET + 0x1F0)
>> +
>> +#define MTK_DP_AUX_P0_360C (AUX_OFFSET + 0xC)
>> +#define AUX_TIMEOUT_THR_AUX_TX_P0_MASK GENMASK(12, 0)
>> +
>> +#define MTK_DP_AUX_P0_3614 (AUX_OFFSET + 0x14)
>> +#define AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK GENMASK(6, 0)
>> +#define AUX_RX_UI_CNT_THR_AUX_TX_P0_SHIFT 0
>> +
>> +#define MTK_DP_AUX_P0_3618 (AUX_OFFSET + 0x18)
>> +#define AUX_RX_FIFO_FULL_AUX_TX_P0_MASK (BIT(9))
>> +#define AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK GENMASK(3, 0)
>> +
>> +#define MTK_DP_AUX_P0_3620 (AUX_OFFSET + 0x20)
>> +#define AUX_RD_MODE_AUX_TX_P0_MASK (BIT(9))
>> +#define AUX_RX_FIFO_READ_PULSE_TX_P0_MASK (BIT(8))
>> +#define AUX_RX_FIFO_R_PULSE_TX_P0_SHIFT (BIT(3))
>> +#define AUX_RX_FIFO_READ_DATA_AUX_TX_P0_MASK GENMASK(7, 0)
>> +#define AUX_RX_FIFO_READ_DATA_AUX_TX_P0_SHIFT 0
>> +
>> +#define MTK_DP_AUX_P0_3624 (AUX_OFFSET + 0x24)
>> +#define AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK GENMASK(3, 0)
>> +
>> +#define MTK_DP_AUX_P0_3628 (AUX_OFFSET + 0x28)
>> +#define AUX_RX_PHY_STATE_AUX_TX_P0_MASK GENMASK(9, 0)
>> +#define AUX_RX_PHY_STATE_AUX_TX_P0_SHIFT 0
>> +#define
>> AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE
>>   \
>> +	(BIT(0) << AUX_RX_PHY_STATE_AUX_TX_P0_SHIFT)
>> +
>> +#define MTK_DP_AUX_P0_362C (AUX_OFFSET + 0x2C)
>> +#define AUX_NO_LENGTH_AUX_TX_P0_MASK (BIT(0))
>> +#define AUX_NO_LENGTH_AUX_TX_P0_SHIFT 0
>> +#define AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK (BIT(1))
>> +#define AUX_RESERVED_RW_0_AUX_TX_P0_MASK GENMASK(15, 2)
>> +
>> +#define MTK_DP_AUX_P0_3630 (AUX_OFFSET + 0x30)
>> +#define AUX_TX_REQUEST_READY_AUX_TX_P0_MASK (BIT(3))
>> +#define AUX_TX_REQUEST_READY_AUX_TX_P0_SHIFT GENMASK(1, 0)
>> +
>> +#define MTK_DP_AUX_P0_3634 (AUX_OFFSET + 0x34)
>> +#define AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_MASK GENMASK(15, 8)
>> +#define AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_SHIFT (BIT(3))
>> +
>> +#define MTK_DP_AUX_P0_3640 (AUX_OFFSET + 0x40)
>> +#define AUX_RX_RECV_COMPLETE_IRQ_TX_P0_MASK (BIT(6))
>> +#define AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT GENMASK(2, 1)
>> +#define AUX_RX_EDID_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT (BIT(0) |
>> BIT(2))
>> +#define AUX_RX_MCCS_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT (BIT(2))
>> +#define AUX_RX_CMD_RECV_IRQ_AUX_TX_P0_SHIFT GENMASK(1, 0)
>> +#define AUX_RX_ADDR_RECV_IRQ_AUX_TX_P0_SHIFT (BIT(1))
>> +#define AUX_RX_DATA_RECV_IRQ_AUX_TX_P0_SHIFT (BIT(0))
>> +#define AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_MASK (BIT(0))
>> +#define AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_SHIFT 0
>> +
>> +#define MTK_DP_AUX_P0_3644 (AUX_OFFSET + 0x44)
>> +#define MCU_REQUEST_COMMAND_AUX_TX_P0_MASK GENMASK(3, 0)
>> +
>> +#define MTK_DP_AUX_P0_3648 (AUX_OFFSET + 0x48)
>> +#define MCU_REQUEST_ADDRESS_LSB_AUX_TX_P0_MASK GENMASK(15, 0)
>> +
>> +#define MTK_DP_AUX_P0_364C (AUX_OFFSET + 0x4C)
>> +#define MCU_REQUEST_ADDRESS_MSB_AUX_TX_P0_MASK GENMASK(3, 0)
>> +
>> +#define MTK_DP_AUX_P0_3650 (AUX_OFFSET + 0x50)
>> +#define MCU_REQ_DATA_NUM_AUX_TX_P0_MASK GENMASK(15, 12)
>> +#define MCU_REQ_DATA_NUM_AUX_TX_P0_SHIFT GENMASK(3, 2)
>> +#define PHY_FIFO_RST_AUX_TX_P0_MASK (BIT(9))
>> +#define MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_MASK (BIT(8))
>> +#define MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_SHIFT (BIT(3))
>> +
>> +#define MTK_DP_AUX_P0_3658 (AUX_OFFSET + 0x58)
>> +#define AUX_TX_OV_EN_AUX_TX_P0_MASK (BIT(0))
>> +
>> +#define MTK_DP_AUX_P0_3690 (AUX_OFFSET + 0x90)
>> +#define RX_REPLY_COMPLETE_MODE_AUX_TX_P0_MASK (BIT(8))
>> +#define RX_REPLY_COMPLETE_MODE_AUX_TX_P0_SHIFT (BIT(3))
>> +
>> +#define MTK_DP_AUX_P0_3704 (AUX_OFFSET + 0x104)
>> +#define AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_MASK
>> (BIT(1))
>> +#define AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_MASK (BIT(2))
>> +#define AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_SHIFT (BIT(1))
>> +
>> +#define MTK_DP_AUX_P0_3708 (AUX_OFFSET + 0x108)
>> +
>> +#define MTK_DP_AUX_P0_37C8 (AUX_OFFSET + 0x1C8)
>> +#define MTK_ATOP_EN_AUX_TX_P0_MASK (BIT(0))
>> +#define MTK_ATOP_EN_AUX_TX_P0_SHIFT 0
>> +
>> +#define MTK_DP_TOP_PWR_STATE (TOP_OFFSET + 0x0)
>> +#define DP_PWR_STATE_MASK GENMASK(1, 0)
>> +#define DP_PWR_STATE_BANDGAP (BIT(0))
>> +#define DP_PWR_STATE_BANDGAP_TPLL (BIT(1))
>> +#define DP_PWR_STATE_BANDGAP_TPLL_LANE GENMASK(1, 0)
>> +
>> +#define MTK_DP_TOP_SWING_EMP (TOP_OFFSET + 0x4)
>> +#define DP_TX0_VOLT_SWING_MASK GENMASK(1, 0)
>> +#define DP_TX0_VOLT_SWING_SHIFT 0
>> +#define DP_TX0_PRE_EMPH_MASK GENMASK(3, 2)
>> +#define DP_TX0_PRE_EMPH_SHIFT (BIT(1))
>> +#define DP_TX1_VOLT_SWING_MASK GENMASK(9, 8)
>> +#define DP_TX1_VOLT_SWING_SHIFT (BIT(3))
>> +#define DP_TX1_PRE_EMPH_MASK GENMASK(11, 10)
>> +#define DP_TX2_VOLT_SWING_MASK GENMASK(17, 16)
>> +#define DP_TX2_PRE_EMPH_MASK GENMASK(19, 18)
>> +#define DP_TX3_VOLT_SWING_MASK GENMASK(25, 24)
>> +#define DP_TX3_PRE_EMPH_MASK GENMASK(27, 26)
>> +
>> +#define MTK_DP_TOP_RESET_AND_PROBE (TOP_OFFSET + 0x20)
>> +#define SW_RST_B_SHIFT 0
>> +#define SW_RST_B_PHYD (BIT(4) << SW_RST_B_SHIFT)
>> +
>> +#define MTK_DP_TOP_IRQ_STATUS (TOP_OFFSET + 0x28)
>> +#define RGS_IRQ_STATUS_SHIFT 0
>> +#define RGS_IRQ_STATUS_TRANSMITTER (BIT(1) << RGS_IRQ_STATUS_SHIFT)
>> +
>> +#define MTK_DP_TOP_IRQ_MASK (TOP_OFFSET + 0x2C)
>> +#define IRQ_MASK_AUX_TOP_IRQ BIT(2)
>> +
>> +#define MTK_DP_TOP_MEM_PD (TOP_OFFSET + 0x38)
>> +#define MEM_ISO_EN_SHIFT 0
>> +#define FUSE_SEL_SHIFT (BIT(1))
>> +
>> +#endif /*_MTK_DP_REG_H_*/
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index c8a233f609f0..eab64d4c241b 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -709,6 +709,7 @@ static struct platform_driver * const
>> mtk_drm_drivers[] = {
>>  	&mtk_disp_ovl_driver,
>>  	&mtk_disp_rdma_driver,
>>  	&mtk_dpi_driver,
>> +	&mtk_dp_driver,
>>  	&mtk_drm_platform_driver,
>>  	&mtk_dsi_driver,
>>  };
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> index 3e7d1e6fbe01..8926416f4419 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> @@ -53,6 +53,7 @@ extern struct platform_driver
>> mtk_disp_gamma_driver;
>>  extern struct platform_driver mtk_disp_ovl_driver;
>>  extern struct platform_driver mtk_disp_rdma_driver;
>>  extern struct platform_driver mtk_dpi_driver;
>> +extern struct platform_driver mtk_dp_driver;
>>  extern struct platform_driver mtk_dsi_driver;
>>
>>  #endif /* MTK_DRM_DRV_H */
>
