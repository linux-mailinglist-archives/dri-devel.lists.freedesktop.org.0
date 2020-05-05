Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB691C4EFA
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 09:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CCE6E528;
	Tue,  5 May 2020 07:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5DC6E528
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 07:21:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e16so1391610wra.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2IuFag10vauiQhijLlxyi5CLCYDcLRq1jEIobE7/mpw=;
 b=o0v6mbv6TOkHz3Cf9nfMQj6Kn19S/GcsxF45JPp+0R345JXaJRcDxuW+2TLZdqvf9k
 3d9LJFF+HujtMPM58vMuIEgPIlcMiIp7AaulQKTVuEp+8eTHfLPhilGOkpXlLlX4ybgf
 EeO7NbMmaov/KfXZVe0NZ77Jd/YwLdRH79PbVrcc6Qz/1V7zuNxd6HaGzO/9nH7BngER
 iSiHcOVmuJXhsgwYgZEoqen2YLJW7HDqXp73X+UmAogkiXFMqW/xjlUJBzamUr08Vp5F
 Lvs+xogV/4dpE/22XmPL4UuwBeYlxETEvVJqDgI6Pd3nvYIsRMNJ7K8bFpW20M3fQvQL
 sF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2IuFag10vauiQhijLlxyi5CLCYDcLRq1jEIobE7/mpw=;
 b=CdaYdNzioHH+ah0Fqy9T+Z5EXQoB/LpwD651Ekf7swga28BfgMRUYpCWuKWRc/CDQX
 U211gunKlNOGsUNub+8nITmX3ypjGhkzMSrDKRvckDJIaZLHCflxx3KGKpw5dAbQc3VH
 QDc7Mst+p+E+EIC775agjXUg9T86NILE5I8Nnblrv/MXRHh+TWGRN/D3v+dsXE7cq6ZT
 fl8Q+mhNhUYZ1E1p0loqA7btItSUzP0C4hPRebqOO7YijFvxnlJ5M4yZNA1biCU3qTcb
 9lrptWjyv17fpM+DvOASJMGFMQ8soztNQ0jW5nLedaVwsLD11POCuThsIFCtD5USF3Pb
 D/qg==
X-Gm-Message-State: AGi0PubGGz3C0/So50AePNdQfHshSBgA5pIT2Y8OeYYsG+unli3O2HWg
 6o0zW8xjTOPXhpxFQ2gACb/65Q==
X-Google-Smtp-Source: APiQypJAnePU5xv8h4CQv4g4BAETpb9FaskATxEsv/DCxH3pVRtMwanQcGHY3PPTws5DvEkTpWeUow==
X-Received: by 2002:adf:afd9:: with SMTP id y25mr2000224wrd.421.1588663316535; 
 Tue, 05 May 2020 00:21:56 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:4460:3fd3:382:4a71?
 ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id d1sm1601491wrx.65.2020.05.05.00.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 00:21:55 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] drm/bridge: chrontel-ch7033: Add a new driver
To: Sam Ravnborg <sam@ravnborg.org>, Lubomir Rintel <lkundrak@v3.sk>
References: <20200424213539.93157-1-lkundrak@v3.sk>
 <20200424213539.93157-4-lkundrak@v3.sk> <20200504200649.GC8122@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <8f666f92-c47a-897b-1dd7-805d30913a94@baylibre.com>
Date: Tue, 5 May 2020 09:21:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200504200649.GC8122@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05/2020 22:06, Sam Ravnborg wrote:
> Hi Lubomir.
> 
> Drivers looks good. I look forward to the day we have moved
> connector stuff to the displaydriver - this will simplify this driver
> even more.
> 
> One Q in the following.
> 
> 	Sam
> 
> On Fri, Apr 24, 2020 at 11:35:39PM +0200, Lubomir Rintel wrote:
>> This is a driver for video encoder with VGA and DVI/HDMI outputs.
>>
>> There is no documentation for the chip -- the operation was guessed from
>> what was sniffed on a Dell Wyse 3020 ThinOS terminal, the register names
>> come from the ch7035 driver in Mediatek's GPL code dump.
>>
>> Only bare minimum is implemented -- no fancy stuff, such as scaling. That
>> would only worsen our misery. We don't load the firmware and we don't need
>> to even bother enabling the MCU.  There are probably no distributable
>> firmware images anyway.
>>
>> Tested with a handful of monitors ranging from 1024x768@75 to 1400x1050@60,
>> with VGA as well as DVI.
>>
>> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>
>> ---
>> Changes since v4:
>> - Removed the registration with the component framework and creation of
>>   drm_encoder.
>>
>> Changes since v3:
>> - Cosmetic changes; drop ch7033_encoder_destroy() and use
>>   drm_encoder_cleanup() for drm_encoder_funcs.destroy callback
>>   directly.
>>
>> Changes since v1:
>> - Sort the includes
>> - Drop a useless model id read
>> - Chain to the bridge-connector instead of dealing with the HPD/EDID
>>   readout machinery ourselves
>> - Utilize regmap to access the registers
>>
>>  drivers/gpu/drm/bridge/Kconfig           |  10 +
>>  drivers/gpu/drm/bridge/Makefile          |   1 +
>>  drivers/gpu/drm/bridge/chrontel-ch7033.c | 620 +++++++++++++++++++++++
>>  3 files changed, 631 insertions(+)
>>  create mode 100644 drivers/gpu/drm/bridge/chrontel-ch7033.c
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>> index aaed2347ace9..0ebc72d62a5b 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -27,6 +27,16 @@ config DRM_CDNS_DSI
>>  	  Support Cadence DPI to DSI bridge. This is an internal
>>  	  bridge and is meant to be directly embedded in a SoC.
>>  
>> +config DRM_CHRONTEL_CH7033
>> +	tristate "Chrontel CH7033 Video Encoder"
>> +	depends on OF
>> +	select DRM_KMS_HELPER
>> +	help
>> +	  Enable support for the Chrontel CH7033 VGA/DVI/HDMI Encoder, as
>> +	  found in the Dell Wyse 3020 thin client.
>> +
>> +	  If in doubt, say "N".
>> +
>>  config DRM_DISPLAY_CONNECTOR
>>  	tristate "Display connector support"
>>  	depends on OF
>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
>> index 6fb062b5b0f0..a844315feddb 100644
>> --- a/drivers/gpu/drm/bridge/Makefile
>> +++ b/drivers/gpu/drm/bridge/Makefile
>> @@ -1,5 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>> +obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
>>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
>>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
>> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
>> new file mode 100644
>> index 000000000000..f8675d82974b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
>> @@ -0,0 +1,620 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Chrontel CH7033 Video Encoder Driver
>> + *
>> + * Copyright (C) 2019,2020 Lubomir Rintel
>> + */
>> +
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_bridge.h>
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_probe_helper.h>
>> +
>> +/* Page 0, Register 0x07 */
>> +enum {
>> +	DRI_PD		= BIT(3),
>> +	IO_PD		= BIT(5),
>> +};
>> +
>> +/* Page 0, Register 0x08 */
>> +enum {
>> +	DRI_PDDRI	= GENMASK(7, 4),
>> +	PDDAC		= GENMASK(3, 1),
>> +	PANEN		= BIT(0),
>> +};
>> +
>> +/* Page 0, Register 0x09 */
>> +enum {
>> +	DPD		= BIT(7),
>> +	GCKOFF		= BIT(6),
>> +	TV_BP		= BIT(5),
>> +	SCLPD		= BIT(4),
>> +	SDPD		= BIT(3),
>> +	VGA_PD		= BIT(2),
>> +	HDBKPD		= BIT(1),
>> +	HDMI_PD		= BIT(0),
>> +};
>> +
>> +/* Page 0, Register 0x0a */
>> +enum {
>> +	MEMINIT		= BIT(7),
>> +	MEMIDLE		= BIT(6),
>> +	MEMPD		= BIT(5),
>> +	STOP		= BIT(4),
>> +	LVDS_PD		= BIT(3),
>> +	HD_DVIB		= BIT(2),
>> +	HDCP_PD		= BIT(1),
>> +	MCU_PD		= BIT(0),
>> +};
>> +
>> +/* Page 0, Register 0x18 */
>> +enum {
>> +	IDF		= GENMASK(7, 4),
>> +	INTEN		= BIT(3),
>> +	SWAP		= GENMASK(2, 0),
>> +};
>> +
>> +enum {
>> +	BYTE_SWAP_RGB	= 0,
>> +	BYTE_SWAP_RBG	= 1,
>> +	BYTE_SWAP_GRB	= 2,
>> +	BYTE_SWAP_GBR	= 3,
>> +	BYTE_SWAP_BRG	= 4,
>> +	BYTE_SWAP_BGR	= 5,
>> +};
>> +
>> +/* Page 0, Register 0x19 */
>> +enum {
>> +	HPO_I		= BIT(5),
>> +	VPO_I		= BIT(4),
>> +	DEPO_I		= BIT(3),
>> +	CRYS_EN		= BIT(2),
>> +	GCLKFREQ	= GENMASK(2, 0),
>> +};
>> +
>> +/* Page 0, Register 0x2e */
>> +enum {
>> +	HFLIP		= BIT(7),
>> +	VFLIP		= BIT(6),
>> +	DEPO_O		= BIT(5),
>> +	HPO_O		= BIT(4),
>> +	VPO_O		= BIT(3),
>> +	TE		= GENMASK(2, 0),
>> +};
>> +
>> +/* Page 0, Register 0x2b */
>> +enum {
>> +	SWAPS		= GENMASK(7, 4),
>> +	VFMT		= GENMASK(3, 0),
>> +};
>> +
>> +/* Page 0, Register 0x54 */
>> +enum {
>> +	COMP_BP		= BIT(7),
>> +	DAC_EN_T	= BIT(6),
>> +	HWO_HDMI_HI	= GENMASK(5, 3),
>> +	HOO_HDMI_HI	= GENMASK(2, 0),
>> +};
>> +
>> +/* Page 0, Register 0x57 */
>> +enum {
>> +	FLDSEN		= BIT(7),
>> +	VWO_HDMI_HI	= GENMASK(5, 3),
>> +	VOO_HDMI_HI	= GENMASK(2, 0),
>> +};
>> +
>> +/* Page 0, Register 0x7e */
>> +enum {
>> +	HDMI_LVDS_SEL	= BIT(7),
>> +	DE_GEN		= BIT(6),
>> +	PWM_INDEX_HI	= BIT(5),
>> +	USE_DE		= BIT(4),
>> +	R_INT		= GENMASK(3, 0),
>> +};
>> +
>> +/* Page 1, Register 0x07 */
>> +enum {
>> +	BPCKSEL		= BIT(7),
>> +	DRI_CMFB_EN	= BIT(6),
>> +	CEC_PUEN	= BIT(5),
>> +	CEC_T		= BIT(3),
>> +	CKINV		= BIT(2),
>> +	CK_TVINV	= BIT(1),
>> +	DRI_CKS2	= BIT(0),
>> +};
>> +
>> +/* Page 1, Register 0x08 */
>> +enum {
>> +	DACG		= BIT(6),
>> +	DACKTST		= BIT(5),
>> +	DEDGEB		= BIT(4),
>> +	SYO		= BIT(3),
>> +	DRI_IT_LVDS	= GENMASK(2, 1),
>> +	DISPON		= BIT(0),
>> +};
>> +
>> +/* Page 1, Register 0x0c */
>> +enum {
>> +	DRI_PLL_CP	= GENMASK(7, 6),
>> +	DRI_PLL_DIVSEL	= BIT(5),
>> +	DRI_PLL_N1_1	= BIT(4),
>> +	DRI_PLL_N1_0	= BIT(3),
>> +	DRI_PLL_N3_1	= BIT(2),
>> +	DRI_PLL_N3_0	= BIT(1),
>> +	DRI_PLL_CKTSTEN = BIT(0),
>> +};
>> +
>> +/* Page 1, Register 0x6b */
>> +enum {
>> +	VCO3CS		= GENMASK(7, 6),
>> +	ICPGBK2_0	= GENMASK(5, 3),
>> +	DRI_VCO357SC	= BIT(2),
>> +	PDPLL2		= BIT(1),
>> +	DRI_PD_SER	= BIT(0),
>> +};
>> +
>> +/* Page 1, Register 0x6c */
>> +enum {
>> +	PLL2N11		= GENMASK(7, 4),
>> +	PLL2N5_4	= BIT(3),
>> +	PLL2N5_TOP	= BIT(2),
>> +	DRI_PLL_PD	= BIT(1),
>> +	PD_I2CM		= BIT(0),
>> +};
>> +
>> +/* Page 3, Register 0x28 */
>> +enum {
>> +	DIFF_EN		= GENMASK(7, 6),
>> +	CORREC_EN	= GENMASK(5, 4),
>> +	VGACLK_BP	= BIT(3),
>> +	HM_LV_SEL	= BIT(2),
>> +	HD_VGA_SEL	= BIT(1),
>> +};
>> +
>> +/* Page 3, Register 0x2a */
>> +enum {
>> +	LVDSCLK_BP	= BIT(7),
>> +	HDTVCLK_BP	= BIT(6),
>> +	HDMICLK_BP	= BIT(5),
>> +	HDTV_BP		= BIT(4),
>> +	HDMI_BP		= BIT(3),
>> +	THRWL		= GENMASK(2, 0),
>> +};
>> +
>> +/* Page 4, Register 0x52 */
>> +enum {
>> +	PGM_ARSTB	= BIT(7),
>> +	MCU_ARSTB	= BIT(6),
>> +	MCU_RETB	= BIT(2),
>> +	RESETIB		= BIT(1),
>> +	RESETDB		= BIT(0),
>> +};
>> +
>> +struct ch7033_priv {
>> +	struct regmap *regmap;
>> +	struct drm_bridge *next_bridge;
>> +	struct drm_bridge bridge;
>> +	struct drm_connector connector;
>> +};
>> +
>> +#define conn_to_ch7033_priv(x) \
>> +	container_of(x, struct ch7033_priv, connector)
>> +#define bridge_to_ch7033_priv(x) \
>> +	container_of(x, struct ch7033_priv, bridge)
>> +
>> +
>> +static enum drm_connector_status ch7033_connector_detect(
>> +	struct drm_connector *connector, bool force)
>> +{
>> +	struct ch7033_priv *priv = conn_to_ch7033_priv(connector);
>> +
>> +	return drm_bridge_detect(priv->next_bridge);
>> +}
>> +
>> +static const struct drm_connector_funcs ch7033_connector_funcs = {
>> +	.reset = drm_atomic_helper_connector_reset,
>> +	.fill_modes = drm_helper_probe_single_connector_modes,
>> +	.detect = ch7033_connector_detect,
>> +	.destroy = drm_connector_cleanup,
>> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +static int ch7033_connector_get_modes(struct drm_connector *connector)
>> +{
>> +	struct ch7033_priv *priv = conn_to_ch7033_priv(connector);
>> +	struct edid *edid;
>> +	int ret;
>> +
>> +	edid = drm_bridge_get_edid(priv->next_bridge, connector);
> 
>> +	drm_connector_update_edid_property(connector, edid);
> I have seen that others do drm_connector_update_edid_property()
> in the get_modes operation - but I am yet to understand why that
> is correct in a get operation.
> Maybe you know?
> 

To attach the newly gathered edid to the connector ? I don't see another place
where it can be done.

Neil

> 
>> +	if (edid) {
>> +		ret = drm_add_edid_modes(connector, edid);
>> +		kfree(edid);
>> +	} else {
>> +		ret = drm_add_modes_noedid(connector, 1920, 1080);
>> +		drm_set_preferred_mode(connector, 1024, 768);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static struct drm_encoder *ch7033_connector_best_encoder(
>> +			struct drm_connector *connector)
>> +{
>> +	struct ch7033_priv *priv = conn_to_ch7033_priv(connector);
>> +
>> +	return priv->bridge.encoder;
>> +}
>> +
>> +static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
>> +	.get_modes = ch7033_connector_get_modes,
>> +	.best_encoder = ch7033_connector_best_encoder,
>> +};
>> +
>> +static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
>> +{
>> +	struct ch7033_priv *priv = arg;
>> +
>> +	if (priv->bridge.dev)
>> +		drm_helper_hpd_irq_event(priv->connector.dev);
>> +}
>> +
>> +static int ch7033_bridge_attach(struct drm_bridge *bridge,
>> +				enum drm_bridge_attach_flags flags)
>> +{
>> +	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
>> +	struct drm_connector *connector = &priv->connector;
>> +	int ret;
>> +
>> +	ret = drm_bridge_attach(bridge->encoder, priv->next_bridge, bridge,
>> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>> +		return 0;
>> +
>> +	if (priv->next_bridge->ops & DRM_BRIDGE_OP_DETECT) {
>> +		connector->polled = DRM_CONNECTOR_POLL_HPD;
>> +	} else {
>> +		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
>> +				    DRM_CONNECTOR_POLL_DISCONNECT;
>> +	}
>> +
>> +	if (priv->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
>> +		drm_bridge_hpd_enable(priv->next_bridge, ch7033_hpd_event,
>> +				      priv);
>> +	}
>> +
>> +	drm_connector_helper_add(connector,
>> +				 &ch7033_connector_helper_funcs);
>> +	ret = drm_connector_init_with_ddc(bridge->dev, &priv->connector,
>> +					  &ch7033_connector_funcs,
>> +					  priv->next_bridge->type,
>> +					  priv->next_bridge->ddc);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to initialize connector\n");
>> +		return ret;
>> +	}
>> +
>> +	return drm_connector_attach_encoder(&priv->connector, bridge->encoder);
>> +}
>> +
>> +static void ch7033_bridge_detach(struct drm_bridge *bridge)
>> +{
>> +	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
>> +
>> +	if (priv->next_bridge->ops & DRM_BRIDGE_OP_HPD)
>> +		drm_bridge_hpd_disable(priv->next_bridge);
>> +	drm_connector_cleanup(&priv->connector);
>> +}
>> +
>> +static enum drm_mode_status ch7033_bridge_mode_valid(struct drm_bridge *bridge,
>> +				     const struct drm_display_mode *mode)
>> +{
>> +	if (mode->clock > 165000)
>> +		return MODE_CLOCK_HIGH;
>> +	if (mode->hdisplay >= 1920)
>> +		return MODE_BAD_HVALUE;
>> +	if (mode->vdisplay >= 1080)
>> +		return MODE_BAD_VVALUE;
>> +	return MODE_OK;
>> +}
>> +
>> +static void ch7033_bridge_disable(struct drm_bridge *bridge)
>> +{
>> +	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
>> +
>> +	regmap_write(priv->regmap, 0x03, 0x04);
>> +	regmap_update_bits(priv->regmap, 0x52, RESETDB, 0x00);
>> +}
>> +
>> +static void ch7033_bridge_enable(struct drm_bridge *bridge)
>> +{
>> +	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
>> +
>> +	regmap_write(priv->regmap, 0x03, 0x04);
>> +	regmap_update_bits(priv->regmap, 0x52, RESETDB, RESETDB);
>> +}
>> +
>> +static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
>> +				   const struct drm_display_mode *mode,
>> +				   const struct drm_display_mode *adjusted_mode)
>> +{
>> +	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
>> +	int hbporch = mode->hsync_start - mode->hdisplay;
>> +	int hsynclen = mode->hsync_end - mode->hsync_start;
>> +	int vbporch = mode->vsync_start - mode->vdisplay;
>> +	int vsynclen = mode->vsync_end - mode->vsync_start;
>> +
>> +	/*
>> +	 * Page 4
>> +	 */
>> +	regmap_write(priv->regmap, 0x03, 0x04);
>> +
>> +	/* Turn everything off to set all the registers to their defaults. */
>> +	regmap_write(priv->regmap, 0x52, 0x00);
>> +	/* Bring I/O block up. */
>> +	regmap_write(priv->regmap, 0x52, RESETIB);
>> +
>> +	/*
>> +	 * Page 0
>> +	 */
>> +	regmap_write(priv->regmap, 0x03, 0x00);
>> +
>> +	/* Bring up parts we need from the power down. */
>> +	regmap_update_bits(priv->regmap, 0x07, DRI_PD | IO_PD, 0);
>> +	regmap_update_bits(priv->regmap, 0x08, DRI_PDDRI | PDDAC | PANEN, 0);
>> +	regmap_update_bits(priv->regmap, 0x09, DPD | GCKOFF |
>> +					       HDMI_PD | VGA_PD, 0);
>> +	regmap_update_bits(priv->regmap, 0x0a, HD_DVIB, 0);
>> +
>> +	/* Horizontal input timing. */
>> +	regmap_write(priv->regmap, 0x0b, (mode->htotal >> 8) << 3 |
>> +					 (mode->hdisplay >> 8));
>> +	regmap_write(priv->regmap, 0x0c, mode->hdisplay);
>> +	regmap_write(priv->regmap, 0x0d, mode->htotal);
>> +	regmap_write(priv->regmap, 0x0e, (hsynclen >> 8) << 3 |
>> +					 (hbporch >> 8));
>> +	regmap_write(priv->regmap, 0x0f, hbporch);
>> +	regmap_write(priv->regmap, 0x10, hsynclen);
>> +
>> +	/* Vertical input timing. */
>> +	regmap_write(priv->regmap, 0x11, (mode->vtotal >> 8) << 3 |
>> +					 (mode->vdisplay >> 8));
>> +	regmap_write(priv->regmap, 0x12, mode->vdisplay);
>> +	regmap_write(priv->regmap, 0x13, mode->vtotal);
>> +	regmap_write(priv->regmap, 0x14, ((vsynclen >> 8) << 3) |
>> +					 (vbporch >> 8));
>> +	regmap_write(priv->regmap, 0x15, vbporch);
>> +	regmap_write(priv->regmap, 0x16, vsynclen);
>> +
>> +	/* Input color swap. */
>> +	regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
>> +
>> +	/* Input clock and sync polarity. */
>> +	regmap_update_bits(priv->regmap, 0x19, 0x1, mode->clock >> 16);
>> +	regmap_update_bits(priv->regmap, 0x19, HPO_I | VPO_I | GCLKFREQ,
>> +			   (mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_I : 0 |
>> +			   (mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_I : 0 |
>> +			   mode->clock >> 16);
>> +	regmap_write(priv->regmap, 0x1a, mode->clock >> 8);
>> +	regmap_write(priv->regmap, 0x1b, mode->clock);
>> +
>> +	/* Horizontal output timing. */
>> +	regmap_write(priv->regmap, 0x1f, (mode->htotal >> 8) << 3 |
>> +					 (mode->hdisplay >> 8));
>> +	regmap_write(priv->regmap, 0x20, mode->hdisplay);
>> +	regmap_write(priv->regmap, 0x21, mode->htotal);
>> +
>> +	/* Vertical output timing. */
>> +	regmap_write(priv->regmap, 0x25, (mode->vtotal >> 8) << 3 |
>> +					 (mode->vdisplay >> 8));
>> +	regmap_write(priv->regmap, 0x26, mode->vdisplay);
>> +	regmap_write(priv->regmap, 0x27, mode->vtotal);
>> +
>> +	/* VGA channel bypass */
>> +	regmap_update_bits(priv->regmap, 0x2b, VFMT, 9);
>> +
>> +	/* Output sync polarity. */
>> +	regmap_update_bits(priv->regmap, 0x2e, HPO_O | VPO_O,
>> +			   (mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_O : 0 |
>> +			   (mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_O : 0);
>> +
>> +	/* HDMI horizontal output timing. */
>> +	regmap_update_bits(priv->regmap, 0x54, HWO_HDMI_HI | HOO_HDMI_HI,
>> +					       (hsynclen >> 8) << 3 |
>> +					       (hbporch >> 8));
>> +	regmap_write(priv->regmap, 0x55, hbporch);
>> +	regmap_write(priv->regmap, 0x56, hsynclen);
>> +
>> +	/* HDMI vertical output timing. */
>> +	regmap_update_bits(priv->regmap, 0x57, VWO_HDMI_HI | VOO_HDMI_HI,
>> +					       (vsynclen >> 8) << 3 |
>> +					       (vbporch >> 8));
>> +	regmap_write(priv->regmap, 0x58, vbporch);
>> +	regmap_write(priv->regmap, 0x59, vsynclen);
>> +
>> +	/* Pick HDMI, not LVDS. */
>> +	regmap_update_bits(priv->regmap, 0x7e, HDMI_LVDS_SEL, HDMI_LVDS_SEL);
>> +
>> +	/*
>> +	 * Page 1
>> +	 */
>> +	regmap_write(priv->regmap, 0x03, 0x01);
>> +
>> +	/* No idea what these do, but VGA is wobbly and blinky without them. */
>> +	regmap_update_bits(priv->regmap, 0x07, CKINV, CKINV);
>> +	regmap_update_bits(priv->regmap, 0x08, DISPON, DISPON);
>> +
>> +	/* DRI PLL */
>> +	regmap_update_bits(priv->regmap, 0x0c, DRI_PLL_DIVSEL, DRI_PLL_DIVSEL);
>> +	if (mode->clock <= 40000) {
>> +		regmap_update_bits(priv->regmap, 0x0c, DRI_PLL_N1_1 |
>> +						       DRI_PLL_N1_0 |
>> +						       DRI_PLL_N3_1 |
>> +						       DRI_PLL_N3_0,
>> +						       0);
>> +	} else if (mode->clock < 80000) {
>> +		regmap_update_bits(priv->regmap, 0x0c, DRI_PLL_N1_1 |
>> +						       DRI_PLL_N1_0 |
>> +						       DRI_PLL_N3_1 |
>> +						       DRI_PLL_N3_0,
>> +						       DRI_PLL_N3_0 |
>> +						       DRI_PLL_N1_0);
>> +	} else {
>> +		regmap_update_bits(priv->regmap, 0x0c, DRI_PLL_N1_1 |
>> +						       DRI_PLL_N1_0 |
>> +						       DRI_PLL_N3_1 |
>> +						       DRI_PLL_N3_0,
>> +						       DRI_PLL_N3_1 |
>> +						       DRI_PLL_N1_1);
>> +	}
>> +
>> +	/* This seems to be color calibration for VGA. */
>> +	regmap_write(priv->regmap, 0x64, 0x29); /* LSB Blue */
>> +	regmap_write(priv->regmap, 0x65, 0x29); /* LSB Green */
>> +	regmap_write(priv->regmap, 0x66, 0x29); /* LSB Red */
>> +	regmap_write(priv->regmap, 0x67, 0x00); /* MSB Blue */
>> +	regmap_write(priv->regmap, 0x68, 0x00); /* MSB Green */
>> +	regmap_write(priv->regmap, 0x69, 0x00); /* MSB Red */
>> +
>> +	regmap_update_bits(priv->regmap, 0x6b, DRI_PD_SER, 0x00);
>> +	regmap_update_bits(priv->regmap, 0x6c, DRI_PLL_PD, 0x00);
>> +
>> +	/*
>> +	 * Page 3
>> +	 */
>> +	regmap_write(priv->regmap, 0x03, 0x03);
>> +
>> +	/* More bypasses and apparently another HDMI/LVDS selector. */
>> +	regmap_update_bits(priv->regmap, 0x28, VGACLK_BP | HM_LV_SEL,
>> +					       VGACLK_BP | HM_LV_SEL);
>> +	regmap_update_bits(priv->regmap, 0x2a, HDMICLK_BP | HDMI_BP,
>> +					       HDMICLK_BP | HDMI_BP);
>> +
>> +	/*
>> +	 * Page 4
>> +	 */
>> +	regmap_write(priv->regmap, 0x03, 0x04);
>> +
>> +	/* Output clock. */
>> +	regmap_write(priv->regmap, 0x10, mode->clock >> 16);
>> +	regmap_write(priv->regmap, 0x11, mode->clock >> 8);
>> +	regmap_write(priv->regmap, 0x12, mode->clock);
>> +}
>> +
>> +static const struct drm_bridge_funcs ch7033_bridge_funcs = {
>> +	.attach = ch7033_bridge_attach,
>> +	.detach = ch7033_bridge_detach,
>> +	.mode_valid = ch7033_bridge_mode_valid,
>> +	.disable = ch7033_bridge_disable,
>> +	.enable = ch7033_bridge_enable,
>> +	.mode_set = ch7033_bridge_mode_set,
>> +};
>> +
>> +static const struct regmap_config ch7033_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.max_register = 0x7f,
>> +};
>> +
>> +static int ch7033_probe(struct i2c_client *client,
>> +			const struct i2c_device_id *id)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct ch7033_priv *priv;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(dev, priv);
>> +
>> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
>> +					  &priv->next_bridge);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->regmap = devm_regmap_init_i2c(client, &ch7033_regmap_config);
>> +	if (IS_ERR(priv->regmap)) {
>> +		dev_err(&client->dev, "regmap init failed\n");
>> +		return PTR_ERR(priv->regmap);
>> +	}
>> +
>> +	ret = regmap_read(priv->regmap, 0x00, &val);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "error reading the model id: %d\n", ret);
>> +		return ret;
>> +	}
>> +	if ((val & 0xf7) != 0x56) {
>> +		dev_err(&client->dev, "the device is not a ch7033\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	regmap_write(priv->regmap, 0x03, 0x04);
>> +	ret = regmap_read(priv->regmap, 0x51, &val);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "error reading the model id: %d\n", ret);
>> +		return ret;
>> +	}
>> +	if ((val & 0x0f) != 3) {
>> +		dev_err(&client->dev, "unknown revision %u\n", val);
>> +		return -ENODEV;
>> +	}
>> +
>> +	INIT_LIST_HEAD(&priv->bridge.list);
>> +	priv->bridge.funcs = &ch7033_bridge_funcs;
>> +	priv->bridge.of_node = dev->of_node;
>> +	drm_bridge_add(&priv->bridge);
>> +
>> +	dev_info(dev, "Chrontel CH7033 Video Encoder\n");
>> +	return 0;
>> +}
>> +
>> +static int ch7033_remove(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct ch7033_priv *priv = dev_get_drvdata(dev);
>> +
>> +	drm_bridge_remove(&priv->bridge);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id ch7033_dt_ids[] = {
>> +	{ .compatible = "chrontel,ch7033", },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, ch7033_dt_ids);
>> +
>> +static const struct i2c_device_id ch7033_ids[] = {
>> +	{ "ch7033", 0 },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, ch7033_ids);
>> +
>> +static struct i2c_driver ch7033_driver = {
>> +	.probe = ch7033_probe,
>> +	.remove = ch7033_remove,
>> +	.driver = {
>> +		.name = "ch7033",
>> +		.of_match_table = of_match_ptr(ch7033_dt_ids),
>> +	},
>> +	.id_table = ch7033_ids,
>> +};
>> +
>> +module_i2c_driver(ch7033_driver);
>> +
>> +MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
>> +MODULE_DESCRIPTION("Chrontel CH7033 Video Encoder Driver");
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> 2.26.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
