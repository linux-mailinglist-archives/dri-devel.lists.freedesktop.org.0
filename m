Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3CB4FD365
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B77010E572;
	Tue, 12 Apr 2022 09:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9711010E572
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:48:02 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id r8so18461241oib.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=RFo5F+ApZWnLYkexRefZq9HAsuEkH+9xwO0iIzMLfxs=;
 b=b0ApVZF5G4seGFzPNzxHvYEgSwj1oP2BFLMx5Ezxg1Hs8kjt63KfkWjzTWUgEybF9g
 TgWCtdBKRpiOOklTFkamAihN0rzYUtQa82xhQfpd9BU/0RImoHMR89cgH/ln/8rS+IMW
 Ky29Qgyal8+mqOF8FS9esw7O3ji83i1Zl7ehhI/J05YAtyDYgWRw/4X52dsbB64c8ZV7
 HQQJ+i9aWmwLTnQEdrfg7e+uyzLvUdcaqVsH2qNUXUW/Y9Hob3mKmHlgoZ5LnE44JjMJ
 Rotdsjd+cHrZsBPBwttJnYJ/HjbsHyXR1QCslUHRJ8a0KN/Jo66b0SXHqi+CD8fqLk1t
 W1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=RFo5F+ApZWnLYkexRefZq9HAsuEkH+9xwO0iIzMLfxs=;
 b=68vmbauQI4YW4WMlkv80Y/w2AWQZHnSXGXWE1oddh8dB+LEH/xotFI+hSQyXNSntwg
 FEKI1DMvaKH2ofc6/Uf6Sb9uw/TbHsXfGuF9YkLJ+UUw25oblp8heLj4A3VelAo5KZM/
 0msfRkOsA7wB/iI5PANB/KvJH0Pf3e4cp68jXwWY0U51vpSgpW6M5KXDyhfaAjeFzScQ
 F4c1nkzw4kot0EQ4HwYrCsq3cpqOMEszkYT0IL7p9G9L6u05PeQpfAF0nvxm4f3tXQ6l
 cJSVjxu2VCxQJXDZ63SA2pmrAMdxeng7MYItvVCtTBClKfNUSJ2aflGJOhGQYHqqcG4A
 sD7Q==
X-Gm-Message-State: AOAM530atMnHrgG1B5WWsnU7sZp513snI4Z+RE9MHHKyex8mpzIvedEM
 OgLaXdolSqW7J2SzPkwxlWzgRLChsrBonLNyovtLdQ==
X-Google-Smtp-Source: ABdhPJzHCqugNsMsLr6Wftp6HrIpgzAo3uWb177Kz7wPR0E7WlOKMoGmpLOBj60AnsALYpZhyRVjQsO2J4aLYiO+kRU=
X-Received: by 2002:a05:6808:159d:b0:2da:3946:ab3d with SMTP id
 t29-20020a056808159d00b002da3946ab3dmr1313040oiw.248.1649756881646; Tue, 12
 Apr 2022 02:48:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 02:48:01 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-19-granquet@baylibre.com>
 <71819a10a950896a4180a4714c316617153673c5.camel@mediatek.com>
In-Reply-To: <71819a10a950896a4180a4714c316617153673c5.camel@mediatek.com>
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 02:48:00 -0700
Message-ID: <CABnWg9t0bmpsLCa+xv256k_moQncX0r=OUkPTaRtww91qm=dcA@mail.gmail.com>
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

On Tue, 29 Mar 2022 05:34, Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
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
>>
>
>...snip...
>
>> +
>> +static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend,
>> mtk_dp_resume);
>> +
>> +static const struct of_device_id mtk_dp_of_match[] = {
>> +	{ .compatible = "mediatek,mt8195-edp-tx", },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
>> +
>> +struct platform_driver mtk_dp_driver = {
>> +	.probe = mtk_dp_probe,
>> +	.remove = mtk_dp_remove,
>> +	.driver = {
>> +		.name = "mediatek-drm-dp",
>> +		.of_match_table = mtk_dp_of_match,
>> +		.pm = &mtk_dp_pm_ops,
>> +	},
>> +};
>> +
>> +MODULE_AUTHOR("Jason-JH.Lin <jason-jh.lin@mediatek.com>");
>
>Hello Guillaume,
>
>I think the module author is not Jason-JH Lin.
>He is the owner of 8195 DRM.
>The owner should be Jitao Shi <jitao.shi@mediatek.com>
>
>BRs,
>Rex

Hi Rex,

We kept the original author from the vendor tree.
I'll update for v10.

Thx,
Guillaume.

>> +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
>> +MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>> b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>> new file mode 100644
>> index 000000000000..c446eef18169
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
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
