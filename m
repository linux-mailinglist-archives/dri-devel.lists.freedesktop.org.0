Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E053D26D499
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67676E072;
	Thu, 17 Sep 2020 07:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A450D6E072
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:24:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x23so901036wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KI/hxcLrGd8h4evhRQjVgB/gQiznnrjk5302Zir3i9s=;
 b=fThCpk5DmQ0EvkZfFF6ksJMr5lo9BE+ekcTQAnnAnDf0cos0c6+affHAVOpj3Hb+pM
 Zr3p/+GPi9GuA8nCbFXHVNMqAXfa/QJznEKiTLb13DgLtk4IIHlwnvHeBl3g22xrRHla
 dTNbfopcZTxoquD6Jvhs28ZfBjrix9c7w1ed6FR/vQdfAOvJV0YA6LjxJG1J5KReXHPo
 y37EjqLmvLJLqX0DQ7SFaCxs6FAYF6krVHCVTOTpHZk7CGI8khdMP9eooBYVgyX7uf6v
 CGU4EtqEXWYMhpEQmILJRsbdJlJdm8jHrgW7OUIlaR7E1StCx1ipZoM6XVx020p7dT3d
 90Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KI/hxcLrGd8h4evhRQjVgB/gQiznnrjk5302Zir3i9s=;
 b=C5Zmu1y06RFdrmaVu9NADr8n1v+Qnoyj5RGBuDKkPxObE5OmvIeFYtDpiqUwi7vtxd
 6jInpjrx2roSGR8Tk6LLkE/KP8XurKmthMDX2NN3qCQ1gCMed24FOjxa56BWFILVj+PM
 pz38SXNZYFn/8LCGI6baV4MAHn2d6k8k+17mu6Loko17qZhU5eLi84cORwyqooVPJ5Lj
 z4zoHOxETPtVFzr06aNoC4mrbAvJ9w1nQZcEzjmY/RgVjM/MfuEG+6fdhptF1fdbjL+B
 GPB7hlvdoSWnAn2xoNFw9T/qIqW2G3d9oKhQihCDkf5wSPSX0aX7YM/q5FyiEmiuQYji
 /8gQ==
X-Gm-Message-State: AOAM532eAZ7xog5mG6ZSsTxNgaoTQfJhlU/HgFG8DofT6aOjRWR6iUGB
 gMQEWIpADRAr/AjINaGlLaXwT8uwhdm6VNAa
X-Google-Smtp-Source: ABdhPJwDcMWiUBJXEOkofHg9rYoJMuhM/K31kJcjkFBTDa83gNR22hCKKyWRgkDYJPaFbOW5AAZwdg==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr8295330wmk.157.1600326874661; 
 Thu, 17 Sep 2020 00:14:34 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s12sm9203148wmd.20.2020.09.17.00.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 00:14:33 -0700 (PDT)
Subject: Re: [PATCH 6/6] drm/meson: add support for MIPI-DSI transceiver
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-7-narmstrong@baylibre.com>
 <20200907084351.GV2352366@phenom.ffwll.local>
 <20200907084423.GW2352366@phenom.ffwll.local>
 <cd760a71-217f-40cf-3470-b131a6853cc1@baylibre.com>
 <20200907180315.GY2352366@phenom.ffwll.local>
 <fd8070dc-8e93-2f66-1c11-d008374d6881@baylibre.com>
 <20200908084642.GG2352366@phenom.ffwll.local>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <3de1ceee-edcd-067e-be26-a9399d539301@baylibre.com>
Date: Thu, 17 Sep 2020 09:14:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908084642.GG2352366@phenom.ffwll.local>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2020 10:46, Daniel Vetter wrote:
> On Tue, Sep 08, 2020 at 10:06:03AM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> On 07/09/2020 20:03, Daniel Vetter wrote:
>>> On Mon, Sep 07, 2020 at 11:03:29AM +0200, Neil Armstrong wrote:
>>>> On 07/09/2020 10:44, Daniel Vetter wrote:
>>>>> On Mon, Sep 07, 2020 at 10:43:51AM +0200, Daniel Vetter wrote:
>>>>>> On Mon, Sep 07, 2020 at 10:18:25AM +0200, Neil Armstrong wrote:
>>>>>>> The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
>>>>>>> glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
>>>>>>> Amlogic SoCs.
>>>>>>>
>>>>>>> This adds support for the Glue managing the transceiver, mimicing the init flow provided
>>>>>>> by Amlogic to setup the ENCl encoder, the glue, the transceiver, the digital D-PHY and the
>>>>>>> Analog PHY in the proper way.
>>>>>>>
>>>>>>> The DW-MIPI-DSI transceiver + D-PHY are directly clocked by the VCLK2 clock, which pixel clock
>>>>>>> is derived and feeds the ENCL encoder and the VIU pixel reader.
>>>>>>>
>>>>>>> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
>>>>>>> DW-MIPI-DSI transceiver.
>>>>>>>
>>>>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>>>
>>>>>> More dw-hdmi drivers which aren't bridges but components, and the thing is
>>>>>> still midlayer-y as heck :-/
>>>>>
>>>>> *dw-dsi, but really they both work the same way and should both be fixed
>>>>> ...
>>>>
>>>> They are bridges but since they have platform-dependent code due to theirs's generic IP
>>>> nature, they need to be intanciated by components to sync with the platform code.
>>>
>>> Yeah that's how it currently works, but there's not much reason why it
>>> needs to work like that. That platform glue code can also be put behind
>>> the drm_bridge abstraction, and we could use the normal dt based bridge
>>> lookup like for everything else.
>>>
>>> Afaiui the only reason dw-* bridge drivers work like that is because for
>>> historical reasons we only had component.c at first, and none of the more
>>> fancy dynamic bridge lookup. So would be really good to switch this all
>>> over to a proper&clean bridge abstraction, and not leak everything around.
>>
>> Does it mean we should avoit using components, right ?
> 
> Yup, at least when there's an established specific mechanism to handle
> cross-driver interactions/EPROBE_DEFER.
> 
> So if you want a drm_panel or drm_bridge or a clock or i2c or anything
> else standardized like that, no component.c please. That's just for the
> driver-specific glue when you have entirely IP-specific way of building up
> a driver from components, which will never be reused outside of that
> overall driver.
> 
> Hence why dw-* using components is rather uncool.
>  
>>> I've typed up what I think should be the way forward a few times already,
>>> but thus far not even the todo.rst entry materialized:
>>>
>>> https://lore.kernel.org/dri-devel/20200430135841.GE10381@phenom.ffwll.local/
>>>
>>> If everyone is always about "not in my patch series" it'll never happen.
>>
>> Today, the dw-mipi-dsi and dw-mipi-hdmi has mandatory callbacks to implement
>> vendor specific features, like :
>> - hdmi/dsi phy handling when mixed into the glue/custom/synopsys but with platform specific values
>> - platform specific mode validation
>> - hpd setup => could use laurent's work here with no_connector, but how do we handle rxsense ???
>> - dsi timings/lane mbps ? these are platform phy specific
>>
>> For amlogic, I can split the "component" code handling venc/vclk into a primary bridge and add a
>> secondary driver only handling the glue around dw-mipi-dsi/dw-mipi-hdmi, would that be a good start ?
> 
> I think what we should do here:
> 
> - type up todo.rst with the overall structure we want to aim for, i.e.
>   where is the code, who sets up what, how are the bridges bound into the
>   overall driver.

OK, sure, this can be a good start, but first I would like all the other bridge
maintainers & reviewers to agree on the the wanted structure.

> 
> - demidlayer dw-* enough so that the callbacks are gone, and it becomes
>   more a toolbox/library for building a dw-* driver. Maybe we're there
>   already.

This is not really wanted, otherwise we would duplicate a large amount of code
over all the platform glues, is this really wanted ?

Today, they already are a toolbox, with different levels of callback neded
depending on how deep the integration is.

> 
> - All new drivers then need to use the toolbox and have everything behind
>   a drm_bridge driver in drm/bridge/, with just default binding exposed to
>   drivers, no EXPORT_SYMBOL at all. Also no exported symbols used, this
>   should all be directly linked into the dw-*.ko imo and treated as
>   internals.

In theory this is cool, in practice, this is impossible for meson_dw_hdmi,
the first reason is how the registers are accessed for GX family, we need to
define custom regmap read/write functions.

For dw-mipi-dsi, it may be feasible, but again I don't see why vendor glue code
should live in drm/bridge/ ?

The last point, this will impact multiple platforms support in a single patchset,
I do not have enough time available to make such changes and check for non-regression.

> 
> - We might need to split the header files to make that clean enough.
> 
> - Once all existing dw-* users are converted, we ditch the EXPORT_SYMBOL
>   stuff completely (since I expect we'll just have one overall dw-dsi.ko
>   module with all bridge driver variants).

?

why ? why load & add multiple vendor adaptation in a single module ?

this sounds like a bad idea, sorry.

In the meantime, I'd really like to have this upstream, should this really wait for
multiple months for tractations and rework ?
I can rework a little to only have the dw-mipi-dsi glue and the encoder stuff in an
another file, is this fine for a first step ?

Neil

> 
> Cheers, Daniel
> 
> 
> 
>>
>> Neil
>>
>>>
>>> Cheers, Daniel
>>>
>>>
>>>>
>>>> Neil
>>>>
>>>>>
>>>>>>
>>>>>> Can we try to fix this? There's a ton of this going on, and the more we
>>>>>> add the old fashioned way the harder this gets to fix up for real.
>>>>>> -Daniel
>>>>>>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/meson/Kconfig             |   7 +
>>>>>>>  drivers/gpu/drm/meson/Makefile            |   1 +
>>>>>>>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 562 ++++++++++++++++++++++
>>>>>>>  3 files changed, 570 insertions(+)
>>>>>>>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
>>>>>>> index 9f9281dd49f8..385f6f23839b 100644
>>>>>>> --- a/drivers/gpu/drm/meson/Kconfig
>>>>>>> +++ b/drivers/gpu/drm/meson/Kconfig
>>>>>>> @@ -16,3 +16,10 @@ config DRM_MESON_DW_HDMI
>>>>>>>  	default y if DRM_MESON
>>>>>>>  	select DRM_DW_HDMI
>>>>>>>  	imply DRM_DW_HDMI_I2S_AUDIO
>>>>>>> +
>>>>>>> +config DRM_MESON_DW_MIPI_DSI
>>>>>>> +	tristate "MIPI DSI Synopsys Controller support for Amlogic Meson Display"
>>>>>>> +	depends on DRM_MESON
>>>>>>> +	default y if DRM_MESON
>>>>>>> +	select DRM_DW_MIPI_DSI
>>>>>>> +	select GENERIC_PHY_MIPI_DPHY
>>>>>>> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
>>>>>>> index 28a519cdf66b..2cc870e91182 100644
>>>>>>> --- a/drivers/gpu/drm/meson/Makefile
>>>>>>> +++ b/drivers/gpu/drm/meson/Makefile
>>>>>>> @@ -5,3 +5,4 @@ meson-drm-y += meson_rdma.o meson_osd_afbcd.o
>>>>>>>  
>>>>>>>  obj-$(CONFIG_DRM_MESON) += meson-drm.o
>>>>>>>  obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
>>>>>>> +obj-$(CONFIG_DRM_MESON_DW_MIPI_DSI) += meson_dw_mipi_dsi.o
>>>>>>> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..bbe1294fce7c
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>>>>>>> @@ -0,0 +1,562 @@
>>>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>>>> +/*
>>>>>>> + * Copyright (C) 2016 BayLibre, SAS
>>>>>>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>>>>>>> + * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
>>>>>>> + */
>>>>>>> +
>>>>>>> +#include <linux/clk.h>
>>>>>>> +#include <linux/component.h>
>>>>>>> +#include <linux/kernel.h>
>>>>>>> +#include <linux/module.h>
>>>>>>> +#include <linux/of_device.h>
>>>>>>> +#include <linux/of_graph.h>
>>>>>>> +#include <linux/reset.h>
>>>>>>> +#include <linux/phy/phy.h>
>>>>>>> +
>>>>>>> +#include <video/mipi_display.h>
>>>>>>> +
>>>>>>> +#include <drm/bridge/dw_mipi_dsi.h>
>>>>>>> +#include <drm/drm_mipi_dsi.h>
>>>>>>> +
>>>>>>> +#include <drm/drm_atomic_helper.h>
>>>>>>> +#include <drm/drm_device.h>
>>>>>>> +#include <drm/drm_probe_helper.h>
>>>>>>> +#include <drm/drm_print.h>
>>>>>>> +
>>>>>>> +#include "meson_drv.h"
>>>>>>> +#include "meson_dw_mipi_dsi.h"
>>>>>>> +#include "meson_registers.h"
>>>>>>> +#include "meson_venc.h"
>>>>>>> +
>>>>>>> +#define DRIVER_NAME "meson-dw-mipi-dsi"
>>>>>>> +#define DRIVER_DESC "Amlogic Meson MIPI-DSI DRM driver"
>>>>>>> +
>>>>>>> +/*  MIPI DSI/VENC Color Format Definitions */
>>>>>>> +#define MIPI_DSI_VENC_COLOR_30B   0x0
>>>>>>> +#define MIPI_DSI_VENC_COLOR_24B   0x1
>>>>>>> +#define MIPI_DSI_VENC_COLOR_18B   0x2
>>>>>>> +#define MIPI_DSI_VENC_COLOR_16B   0x3
>>>>>>> +
>>>>>>> +#define COLOR_16BIT_CFG_1         0x0
>>>>>>> +#define COLOR_16BIT_CFG_2         0x1
>>>>>>> +#define COLOR_16BIT_CFG_3         0x2
>>>>>>> +#define COLOR_18BIT_CFG_1         0x3
>>>>>>> +#define COLOR_18BIT_CFG_2         0x4
>>>>>>> +#define COLOR_24BIT               0x5
>>>>>>> +#define COLOR_20BIT_LOOSE         0x6
>>>>>>> +#define COLOR_24_BIT_YCBCR        0x7
>>>>>>> +#define COLOR_16BIT_YCBCR         0x8
>>>>>>> +#define COLOR_30BIT               0x9
>>>>>>> +#define COLOR_36BIT               0xa
>>>>>>> +#define COLOR_12BIT               0xb
>>>>>>> +#define COLOR_RGB_111             0xc
>>>>>>> +#define COLOR_RGB_332             0xd
>>>>>>> +#define COLOR_RGB_444             0xe
>>>>>>> +
>>>>>>> +/*  MIPI DSI Relative REGISTERs Definitions */
>>>>>>> +/* For MIPI_DSI_TOP_CNTL */
>>>>>>> +#define BIT_DPI_COLOR_MODE        20
>>>>>>> +#define BIT_IN_COLOR_MODE         16
>>>>>>> +#define BIT_CHROMA_SUBSAMPLE      14
>>>>>>> +#define BIT_COMP2_SEL             12
>>>>>>> +#define BIT_COMP1_SEL             10
>>>>>>> +#define BIT_COMP0_SEL              8
>>>>>>> +#define BIT_DE_POL                 6
>>>>>>> +#define BIT_HSYNC_POL              5
>>>>>>> +#define BIT_VSYNC_POL              4
>>>>>>> +#define BIT_DPICOLORM              3
>>>>>>> +#define BIT_DPISHUTDN              2
>>>>>>> +#define BIT_EDPITE_INTR_PULSE      1
>>>>>>> +#define BIT_ERR_INTR_PULSE         0
>>>>>>> +
>>>>>>> +/* HHI Registers */
>>>>>>> +#define HHI_VIID_CLK_DIV	0x128 /* 0x4a offset in data sheet */
>>>>>>> +#define VCLK2_DIV_MASK		0xff
>>>>>>> +#define VCLK2_DIV_EN		BIT(16)
>>>>>>> +#define VCLK2_DIV_RESET		BIT(17)
>>>>>>> +#define CTS_ENCL_SEL_MASK	(0xf << 12)
>>>>>>> +#define CTS_ENCL_SEL_SHIFT	12
>>>>>>> +#define HHI_VIID_CLK_CNTL	0x12c /* 0x4b offset in data sheet */
>>>>>>> +#define VCLK2_EN		BIT(19)
>>>>>>> +#define VCLK2_SEL_MASK		(0x7 << 16)
>>>>>>> +#define VCLK2_SEL_SHIFT		16
>>>>>>> +#define VCLK2_SOFT_RESET	BIT(15)
>>>>>>> +#define VCLK2_DIV1_EN		BIT(0)
>>>>>>> +#define HHI_VID_CLK_CNTL2	0x194 /* 0x65 offset in data sheet */
>>>>>>> +#define CTS_ENCL_EN		BIT(3)
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * DOC: MIPI DSI
>>>>>>> + *
>>>>>>> + */
>>>>>>> +
>>>>>>> +struct meson_dw_mipi_dsi {
>>>>>>> +	struct drm_encoder encoder;
>>>>>>> +	struct meson_drm *priv;
>>>>>>> +	struct device *dev;
>>>>>>> +	void __iomem *base;
>>>>>>> +	struct phy *phy;
>>>>>>> +	union phy_configure_opts phy_opts;
>>>>>>> +	struct dw_mipi_dsi *dmd;
>>>>>>> +	struct dw_mipi_dsi_plat_data pdata;
>>>>>>> +	struct mipi_dsi_device *dsi_device;
>>>>>>> +	unsigned long mode_flags;
>>>>>>> +	struct clk *px_clk;
>>>>>>> +};
>>>>>>> +#define encoder_to_meson_dw_mipi_dsi(x) \
>>>>>>> +	container_of(x, struct meson_dw_mipi_dsi, encoder)
>>>>>>> +
>>>>>>> +static void dw_mipi_dsi_set_vclk(struct meson_dw_mipi_dsi *mipi_dsi,
>>>>>>> +				 struct drm_display_mode *mode)
>>>>>>> +{
>>>>>>> +	struct meson_drm *priv = mipi_dsi->priv;
>>>>>>> +	unsigned int vclk2_div;
>>>>>>> +	unsigned int pll_rate;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	pll_rate = mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate;
>>>>>>> +	vclk2_div = pll_rate / (mode->clock * 1000);
>>>>>>> +
>>>>>>> +	ret = clk_set_rate(mipi_dsi->px_clk, pll_rate);
>>>>>>> +	if (ret) {
>>>>>>> +		pr_err("Failed to set DSI PLL rate %lu\n",
>>>>>>> +		       mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate);
>>>>>>> +
>>>>>>> +		return;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	/* Disable VCLK2 */
>>>>>>> +	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, 0);
>>>>>>> +
>>>>>>> +	/* Setup the VCLK2 divider value */
>>>>>>> +	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
>>>>>>> +				VCLK2_DIV_MASK, (vclk2_div - 1));
>>>>>>> +
>>>>>>> +	/* select gp0 for vclk2 */
>>>>>>> +	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
>>>>>>> +				VCLK2_SEL_MASK, (0 << VCLK2_SEL_SHIFT));
>>>>>>> +
>>>>>>> +	/* enable vclk2 gate */
>>>>>>> +	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, VCLK2_EN);
>>>>>>> +
>>>>>>> +	/* select vclk2_div1 for encl */
>>>>>>> +	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
>>>>>>> +				CTS_ENCL_SEL_MASK, (8 << CTS_ENCL_SEL_SHIFT));
>>>>>>> +
>>>>>>> +	/* release vclk2_div_reset and enable vclk2_div */
>>>>>>> +	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
>>>>>>> +				VCLK2_DIV_EN | VCLK2_DIV_RESET, VCLK2_DIV_EN);
>>>>>>> +
>>>>>>> +	/* enable vclk2_div1 gate */
>>>>>>> +	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
>>>>>>> +				VCLK2_DIV1_EN, VCLK2_DIV1_EN);
>>>>>>> +
>>>>>>> +	/* reset vclk2 */
>>>>>>> +	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
>>>>>>> +				VCLK2_SOFT_RESET, VCLK2_SOFT_RESET);
>>>>>>> +	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
>>>>>>> +				VCLK2_SOFT_RESET, 0);
>>>>>>> +
>>>>>>> +	/* enable encl_clk */
>>>>>>> +	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
>>>>>>> +				CTS_ENCL_EN, CTS_ENCL_EN);
>>>>>>> +
>>>>>>> +	usleep_range(10000, 11000);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int dw_mipi_dsi_phy_init(void *priv_data)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
>>>>>>> +	struct meson_drm *priv = mipi_dsi->priv;
>>>>>>> +
>>>>>>> +
>>>>>>> +	phy_power_on(mipi_dsi->phy);
>>>>>>> +
>>>>>>> +	writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void dw_mipi_dsi_phy_power_off(void *priv_data)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
>>>>>>> +
>>>>>>> +	phy_power_off(mipi_dsi->phy);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int
>>>>>>> +dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>>>>>>> +			  unsigned long mode_flags, u32 lanes, u32 format,
>>>>>>> +			  unsigned int *lane_mbps)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
>>>>>>> +
>>>>>>> +	*lane_mbps = mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate / 1000000;
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int
>>>>>>> +dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
>>>>>>> +			   struct dw_mipi_dsi_dphy_timing *timing)
>>>>>>> +{
>>>>>>> +	/* TOFIX handle other cases */
>>>>>>> +
>>>>>>> +	timing->clk_lp2hs = 37;
>>>>>>> +	timing->clk_hs2lp = 135;
>>>>>>> +	timing->data_lp2hs = 50;
>>>>>>> +	timing->data_hs2lp = 3;
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int
>>>>>>> +dw_mipi_dsi_get_esc_clk_rate(void *priv_data, unsigned int *esc_clk_rate)
>>>>>>> +{
>>>>>>> +	*esc_clk_rate = 4; /* Mhz */
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static const struct dw_mipi_dsi_phy_ops meson_dw_mipi_dsi_phy_ops = {
>>>>>>> +	.init = dw_mipi_dsi_phy_init,
>>>>>>> +	.power_off = dw_mipi_dsi_phy_power_off,
>>>>>>> +	.get_lane_mbps = dw_mipi_dsi_get_lane_mbps,
>>>>>>> +	.get_timing = dw_mipi_dsi_phy_get_timing,
>>>>>>> +	.get_esc_clk_rate = dw_mipi_dsi_get_esc_clk_rate,
>>>>>>> +};
>>>>>>> +
>>>>>>> +/* Encoder */
>>>>>>> +
>>>>>>> +static void meson_mipi_dsi_encoder_destroy(struct drm_encoder *encoder)
>>>>>>> +{
>>>>>>> +	drm_encoder_cleanup(encoder);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static const struct drm_encoder_funcs meson_mipi_dsi_encoder_funcs = {
>>>>>>> +	.destroy        = meson_mipi_dsi_encoder_destroy,
>>>>>>> +};
>>>>>>> +
>>>>>>> +static int meson_mipi_dsi_encoder_atomic_check(struct drm_encoder *encoder,
>>>>>>> +					struct drm_crtc_state *crtc_state,
>>>>>>> +					struct drm_connector_state *conn_state)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi =
>>>>>>> +			encoder_to_meson_dw_mipi_dsi(encoder);
>>>>>>> +
>>>>>>> +	switch (mipi_dsi->dsi_device->format) {
>>>>>>> +	case MIPI_DSI_FMT_RGB888:
>>>>>>> +		break;
>>>>>>> +	case MIPI_DSI_FMT_RGB666:
>>>>>>> +		break;
>>>>>>> +	case MIPI_DSI_FMT_RGB666_PACKED:
>>>>>>> +	case MIPI_DSI_FMT_RGB565:
>>>>>>> +	default:
>>>>>>> +		DRM_DEV_ERROR(mipi_dsi->dev,
>>>>>>> +				"invalid pixel format %d\n",
>>>>>>> +				mipi_dsi->dsi_device->format);
>>>>>>> +		return -EINVAL;
>>>>>>> +	};
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void meson_mipi_dsi_encoder_disable(struct drm_encoder *encoder)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi =
>>>>>>> +			encoder_to_meson_dw_mipi_dsi(encoder);
>>>>>>> +	struct meson_drm *priv = mipi_dsi->priv;
>>>>>>> +
>>>>>>> +	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void meson_mipi_dsi_encoder_enable(struct drm_encoder *encoder)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi =
>>>>>>> +			encoder_to_meson_dw_mipi_dsi(encoder);
>>>>>>> +	struct meson_drm *priv = mipi_dsi->priv;
>>>>>>> +
>>>>>>> +	writel_bits_relaxed(BIT(3), BIT(3),
>>>>>>> +			priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
>>>>>>> +	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void meson_dw_mipi_dsi_init(struct meson_dw_mipi_dsi *mipi_dsi)
>>>>>>> +{
>>>>>>> +	writel_relaxed((1 << 4) | (1 << 5) | (0 << 6),
>>>>>>> +			mipi_dsi->base + MIPI_DSI_TOP_CNTL);
>>>>>>> +
>>>>>>> +	writel_bits_relaxed(0xf, 0xf,
>>>>>>> +			    mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);
>>>>>>> +	writel_bits_relaxed(0xf, 0,
>>>>>>> +			    mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);
>>>>>>> +
>>>>>>> +	writel_bits_relaxed(0x3, 0x3,
>>>>>>> +			    mipi_dsi->base + MIPI_DSI_TOP_CLK_CNTL);
>>>>>>> +
>>>>>>> +	writel_relaxed(0, mipi_dsi->base + MIPI_DSI_TOP_MEM_PD);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void meson_mipi_dsi_encoder_mode_set(struct drm_encoder *encoder,
>>>>>>> +				   struct drm_display_mode *mode,
>>>>>>> +				   struct drm_display_mode *adjusted_mode)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi = encoder_to_meson_dw_mipi_dsi(encoder);
>>>>>>> +	unsigned int dpi_data_format, venc_data_width;
>>>>>>> +	struct meson_drm *priv = mipi_dsi->priv;
>>>>>>> +	int bpp;
>>>>>>> +	u32 reg;
>>>>>>> +
>>>>>>> +	mipi_dsi->mode_flags = mode->flags;
>>>>>>> +
>>>>>>> +	bpp = mipi_dsi_pixel_format_to_bpp(mipi_dsi->dsi_device->format);
>>>>>>> +
>>>>>>> +	phy_mipi_dphy_get_default_config(mode->clock * 1000,
>>>>>>> +					 bpp, mipi_dsi->dsi_device->lanes,
>>>>>>> +					 &mipi_dsi->phy_opts.mipi_dphy);
>>>>>>> +
>>>>>>> +	phy_configure(mipi_dsi->phy, &mipi_dsi->phy_opts);
>>>>>>> +
>>>>>>> +	switch (mipi_dsi->dsi_device->format) {
>>>>>>> +	case MIPI_DSI_FMT_RGB888:
>>>>>>> +		dpi_data_format = COLOR_24BIT;
>>>>>>> +		venc_data_width = MIPI_DSI_VENC_COLOR_24B;
>>>>>>> +		break;
>>>>>>> +	case MIPI_DSI_FMT_RGB666:
>>>>>>> +		dpi_data_format = COLOR_18BIT_CFG_2;
>>>>>>> +		venc_data_width = MIPI_DSI_VENC_COLOR_18B;
>>>>>>> +		break;
>>>>>>> +	case MIPI_DSI_FMT_RGB666_PACKED:
>>>>>>> +	case MIPI_DSI_FMT_RGB565:
>>>>>>> +		/* invalid */
>>>>>>> +		break;
>>>>>>> +	};
>>>>>>> +
>>>>>>> +	dw_mipi_dsi_set_vclk(mipi_dsi, mode);
>>>>>>> +	meson_venc_mipi_dsi_mode_set(priv, mode);
>>>>>>> +
>>>>>>> +	meson_encl_load_gamma(priv);
>>>>>>> +
>>>>>>> +	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
>>>>>>> +
>>>>>>> +	meson_dw_mipi_dsi_init(mipi_dsi);
>>>>>>> +
>>>>>>> +	/* Configure Set color format for DPI register */
>>>>>>> +	reg = readl_relaxed(mipi_dsi->base + MIPI_DSI_TOP_CNTL) &
>>>>>>> +		~(0xf<<BIT_DPI_COLOR_MODE) &
>>>>>>> +		~(0x7<<BIT_IN_COLOR_MODE) &
>>>>>>> +		~(0x3<<BIT_CHROMA_SUBSAMPLE);
>>>>>>> +
>>>>>>> +	writel_relaxed(reg |
>>>>>>> +		(dpi_data_format  << BIT_DPI_COLOR_MODE)  |
>>>>>>> +		(venc_data_width  << BIT_IN_COLOR_MODE) |
>>>>>>> +		0 << BIT_COMP0_SEL |
>>>>>>> +		1 << BIT_COMP1_SEL |
>>>>>>> +		2 << BIT_COMP2_SEL |
>>>>>>> +		(mipi_dsi->mode_flags & DRM_MODE_FLAG_NHSYNC ? 0 : BIT(BIT_HSYNC_POL)) |
>>>>>>> +		(mipi_dsi->mode_flags & DRM_MODE_FLAG_NVSYNC ? 0 : BIT(BIT_VSYNC_POL)),
>>>>>>> +		mipi_dsi->base + MIPI_DSI_TOP_CNTL);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static const struct drm_encoder_helper_funcs
>>>>>>> +				meson_mipi_dsi_encoder_helper_funcs = {
>>>>>>> +	.atomic_check	= meson_mipi_dsi_encoder_atomic_check,
>>>>>>> +	.disable	= meson_mipi_dsi_encoder_disable,
>>>>>>> +	.enable		= meson_mipi_dsi_encoder_enable,
>>>>>>> +	.mode_set	= meson_mipi_dsi_encoder_mode_set,
>>>>>>> +};
>>>>>>> +
>>>>>>> +static int meson_dw_mipi_dsi_bind(struct device *dev, struct device *master,
>>>>>>> +				void *data)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi = dev_get_drvdata(dev);
>>>>>>> +	struct drm_device *drm = data;
>>>>>>> +	struct meson_drm *priv = drm->dev_private;
>>>>>>> +	struct drm_encoder *encoder;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	/* Check before if we are supposed to have a sub-device... */
>>>>>>> +	if (!mipi_dsi->dsi_device)
>>>>>>> +		return -EPROBE_DEFER;
>>>>>>> +
>>>>>>> +	encoder = &mipi_dsi->encoder;
>>>>>>> +	mipi_dsi->priv = priv;
>>>>>>> +
>>>>>>> +	/* Encoder */
>>>>>>> +	ret = drm_encoder_init(drm, encoder, &meson_mipi_dsi_encoder_funcs,
>>>>>>> +			       DRM_MODE_ENCODER_DSI, "meson_mipi_dsi");
>>>>>>> +	if (ret) {
>>>>>>> +		dev_err(priv->dev, "Failed to init DSI encoder\n");
>>>>>>> +		return ret;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	drm_encoder_helper_add(encoder, &meson_mipi_dsi_encoder_helper_funcs);
>>>>>>> +
>>>>>>> +	encoder->possible_crtcs = BIT(0);
>>>>>>> +
>>>>>>> +	ret = dw_mipi_dsi_bind(mipi_dsi->dmd, encoder);
>>>>>>> +	if (ret) {
>>>>>>> +		DRM_DEV_ERROR(dev, "Failed to bind: %d\n", ret);
>>>>>>> +		return ret;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	phy_init(mipi_dsi->phy);
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void meson_dw_mipi_dsi_unbind(struct device *dev, struct device *master,
>>>>>>> +				   void *data)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi = dev_get_drvdata(dev);
>>>>>>> +
>>>>>>> +	dw_mipi_dsi_remove(mipi_dsi->dmd);
>>>>>>> +
>>>>>>> +	phy_exit(mipi_dsi->phy);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static const struct component_ops meson_dw_mipi_dsi_ops = {
>>>>>>> +	.bind	= meson_dw_mipi_dsi_bind,
>>>>>>> +	.unbind	= meson_dw_mipi_dsi_unbind,
>>>>>>> +};
>>>>>>> +
>>>>>>> +static int meson_dw_mipi_dsi_host_attach(void *priv_data,
>>>>>>> +					 struct mipi_dsi_device *device)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
>>>>>>> +
>>>>>>> +	mipi_dsi->dsi_device = device;
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int meson_dw_mipi_dsi_host_detach(void *priv_data,
>>>>>>> +					 struct mipi_dsi_device *device)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
>>>>>>> +
>>>>>>> +	if (device == mipi_dsi->dsi_device)
>>>>>>> +		mipi_dsi->dsi_device = NULL;
>>>>>>> +	else
>>>>>>> +		return -EINVAL;
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static const struct dw_mipi_dsi_host_ops meson_dw_mipi_dsi_host_ops = {
>>>>>>> +	.attach = meson_dw_mipi_dsi_host_attach,
>>>>>>> +	.detach = meson_dw_mipi_dsi_host_detach,
>>>>>>> +};
>>>>>>> +
>>>>>>> +static int meson_dw_mipi_dsi_probe(struct platform_device *pdev)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi;
>>>>>>> +	struct reset_control *top_rst;
>>>>>>> +	struct resource *res;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	mipi_dsi = devm_kzalloc(&pdev->dev, sizeof(*mipi_dsi), GFP_KERNEL);
>>>>>>> +	if (!mipi_dsi)
>>>>>>> +		return -ENOMEM;
>>>>>>> +
>>>>>>> +	mipi_dsi->dev = &pdev->dev;
>>>>>>> +
>>>>>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>>>> +	mipi_dsi->base = devm_ioremap_resource(&pdev->dev, res);
>>>>>>> +	if (IS_ERR(mipi_dsi->base))
>>>>>>> +		return PTR_ERR(mipi_dsi->base);
>>>>>>> +
>>>>>>> +	mipi_dsi->phy = devm_phy_get(&pdev->dev, "dphy");
>>>>>>> +	if (IS_ERR(mipi_dsi->phy)) {
>>>>>>> +		ret = PTR_ERR(mipi_dsi->phy);
>>>>>>> +		dev_err(&pdev->dev, "failed to get mipi dphy: %d\n", ret);
>>>>>>> +		return ret;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	mipi_dsi->px_clk = devm_clk_get(&pdev->dev, "px_clk");
>>>>>>> +	if (IS_ERR(mipi_dsi->px_clk)) {
>>>>>>> +		dev_err(&pdev->dev, "Unable to get PLL clk\n");
>>>>>>> +		return PTR_ERR(mipi_dsi->px_clk);
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	/*
>>>>>>> +	 * We use a TOP reset signal because the APB reset signal
>>>>>>> +	 * is handled by the TOP control registers.
>>>>>>> +	 */
>>>>>>> +	top_rst = devm_reset_control_get_exclusive(&pdev->dev, "top");
>>>>>>> +	if (IS_ERR(top_rst)) {
>>>>>>> +		ret = PTR_ERR(top_rst);
>>>>>>> +
>>>>>>> +		if (ret != -EPROBE_DEFER)
>>>>>>> +			dev_err(&pdev->dev, "Unable to get reset control: %d\n", ret);
>>>>>>> +
>>>>>>> +		return ret;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	ret = clk_prepare_enable(mipi_dsi->px_clk);
>>>>>>> +	if (ret) {
>>>>>>> +		dev_err(&pdev->dev, "Unable to prepare/enable PX clock\n");
>>>>>>> +		goto err_clkdisable;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	reset_control_assert(top_rst);
>>>>>>> +	usleep_range(10, 20);
>>>>>>> +	reset_control_deassert(top_rst);
>>>>>>> +
>>>>>>> +	/* MIPI DSI Controller */
>>>>>>> +
>>>>>>> +	mipi_dsi->pdata.base = mipi_dsi->base;
>>>>>>> +	mipi_dsi->pdata.max_data_lanes = 4;
>>>>>>> +	mipi_dsi->pdata.phy_ops = &meson_dw_mipi_dsi_phy_ops;
>>>>>>> +	mipi_dsi->pdata.host_ops = &meson_dw_mipi_dsi_host_ops;
>>>>>>> +	mipi_dsi->pdata.priv_data = mipi_dsi;
>>>>>>> +	platform_set_drvdata(pdev, mipi_dsi);
>>>>>>> +
>>>>>>> +	mipi_dsi->dmd = dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata);
>>>>>>> +	if (IS_ERR(mipi_dsi->dmd)) {
>>>>>>> +		ret = PTR_ERR(mipi_dsi->dmd);
>>>>>>> +		if (ret != -EPROBE_DEFER)
>>>>>>> +			dev_err(&pdev->dev,
>>>>>>> +				"Failed to probe dw_mipi_dsi: %d\n", ret);
>>>>>>> +		goto err_clkdisable;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	return component_add(mipi_dsi->dev, &meson_dw_mipi_dsi_ops);
>>>>>>> +
>>>>>>> +err_clkdisable:
>>>>>>> +	clk_disable_unprepare(mipi_dsi->px_clk);
>>>>>>> +
>>>>>>> +	return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int meson_dw_mipi_dsi_remove(struct platform_device *pdev)
>>>>>>> +{
>>>>>>> +	struct meson_dw_mipi_dsi *mipi_dsi = dev_get_drvdata(&pdev->dev);
>>>>>>> +
>>>>>>> +	component_del(mipi_dsi->dev, &meson_dw_mipi_dsi_ops);
>>>>>>> +
>>>>>>> +	clk_disable_unprepare(mipi_dsi->px_clk);
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static const struct of_device_id meson_dw_mipi_dsi_of_table[] = {
>>>>>>> +	{ .compatible = "amlogic,meson-axg-dw-mipi-dsi", },
>>>>>>> +	{ }
>>>>>>> +};
>>>>>>> +MODULE_DEVICE_TABLE(of, meson_dw_mipi_dsi_of_table);
>>>>>>> +
>>>>>>> +static struct platform_driver meson_dw_mipi_dsi_platform_driver = {
>>>>>>> +	.probe		= meson_dw_mipi_dsi_probe,
>>>>>>> +	.remove		= meson_dw_mipi_dsi_remove,
>>>>>>> +	.driver		= {
>>>>>>> +		.name		= DRIVER_NAME,
>>>>>>> +		.of_match_table	= meson_dw_mipi_dsi_of_table,
>>>>>>> +	},
>>>>>>> +};
>>>>>>> +module_platform_driver(meson_dw_mipi_dsi_platform_driver);
>>>>>>> +
>>>>>>> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
>>>>>>> +MODULE_DESCRIPTION(DRIVER_DESC);
>>>>>>> +MODULE_LICENSE("GPL");
>>>>>>> -- 
>>>>>>> 2.22.0
>>>>>>>
>>>>>>
>>>>>> -- 
>>>>>> Daniel Vetter
>>>>>> Software Engineer, Intel Corporation
>>>>>> http://blog.ffwll.ch
>>>>>
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
