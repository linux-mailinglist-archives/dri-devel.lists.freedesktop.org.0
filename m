Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AD2182661
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 01:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD946E9A4;
	Thu, 12 Mar 2020 00:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36BE6E9A4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 00:53:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99BD65F;
 Thu, 12 Mar 2020 01:53:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583974416;
 bh=EUzpDw/68ve6EUxi9eIlyhhTUCwfO//kEYEIkQotIhk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LZviI5IvGw4YdsCzpchksc2ughVqHAGk6WMwXJqbruQdshGcDKF6SlFyHsdZEbkMp
 NmYZDFY0MdRQ7iombABb9ACMLzB5+rW2lszwxNkdp800LTeAqA53N0bRXYaB41X2Ym
 9y0ze1WXM/P0pf0maMhYhnR2VDFdFWZiucslsz9o=
Date: Thu, 12 Mar 2020 02:53:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 3/4] drm: bridge: add it66121 driver
Message-ID: <20200312005333.GH1639@pendragon.ideasonboard.com>
References: <20200311125135.30832-1-ple@baylibre.com>
 <20200311125135.30832-4-ple@baylibre.com>
 <20200311135535.GQ1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311135535.GQ1922688@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 mchehab+samsung@kernel.org, sam@ravnborg.org,
 heiko.stuebner@theobroma-systems.com, icenowy@aosc.io,
 devicetree@vger.kernel.org, stephan@gerhold.net, jonas@kwiboo.se,
 robh+dt@kernel.org, Jonathan.Cameron@huawei.com, jernej.skrabec@siol.net,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Phong LE <ple@baylibre.com>, broonie@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Wed, Mar 11, 2020 at 03:55:35PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 11, 2020 at 01:51:34PM +0100, Phong LE wrote:
> > This commit is a simple driver for bridge HMDI it66121.
> > The input format is RBG and there is no color conversion.
> > Audio, HDCP and CEC are not supported yet.
> 
> I guess you should have been told in your company how to use get_maintainer.pl
> to avoid spamming people.
> 
> Hint:
> 	scripts/get_maintainer.pl --git --git-min-percent=67 ...

I didn't even know about those options... I don't think we can't expect
contributors to know about this if it's not even documented in
Documentation/process/. And even in that case, if this is what every
contribution should use by default, then those options should become the
default for the get_maintainer.pl script.

> ...
> 
> > + * Copyright (C) 2020 BayLibre, SAS
> > + * Author: Phong LE <ple@baylibre.com>
> > + * Copyright (C) 2018-2019, Artem Mygaiev
> > + * Copyright (C) 2017, Fresco Logic, Incorporated.
> 
> This too compact to read, perhaps squeeze blank line after your (c) note
> followed by description how the rest (c) appear in the file.
> 
> > + *
> 
> Redundant line.
> 
> > + */
> 
> ...
> 
> > +#include <linux/of.h>
> 
> This can be replaced with property.h, see comments against ->probe().
> 
> > +#include <linux/of_device.h>
> > +#include <linux/of_gpio.h>
> 
> I didn't find evidence of use of any of those.
> 
> ...
> 
> > +#define IT66121_MASTER_SEL_REG			0x10
> 
> > +#define IT66121_AFE_DRV_REG			0x61
> 
> > +#define IT66121_INPUT_MODE_REG			0x70
> 
> > +#define IT66121_INPUT_CSC_REG			0x72
> 
> > +#define IT66121_AFE_XP_REG			0x62
> 
> > +#define IT66121_AFE_IP_REG			0x64
> 
> > +#define IT66121_AFE_XP_EC1_REG			0x68
> 
> > +#define IT66121_SW_RST_REG			0x04
> 
> > +#define IT66121_DDC_COMMAND_REG			0x15
> 
> > +#define IT66121_HDCP_REG			0x20
> 
> > +#define IT66121_INT_STATUS1_REG			0x06
> 
> > +#define IT66121_DDC_HEADER_REG			0x11
> 
> > +#define IT66121_DDC_OFFSET_REG			0x12
> > +#define IT66121_DDC_BYTE_REG			0x13
> > +#define IT66121_DDC_SEGMENT_REG			0x14
> > +#define IT66121_DDC_RD_FIFO_REG			0x17
> 
> > +#define IT66121_CLK_BANK_REG			0x0F
> 
> > +#define IT66121_INT_REG				0x05
> 
> > +#define IT66121_INT_MASK1_REG			0x09
> 
> > +#define IT66121_INT_CLR1_REG			0x0C
> 
> > +#define IT66121_AV_MUTE_REG			0xC1
> 
> > +#define IT66121_PKT_GEN_CTRL_REG		0xC6
> 
> > +#define IT66121_AVIINFO_DB1_REG			0x158
> > +#define IT66121_AVIINFO_DB2_REG			0x159
> > +#define IT66121_AVIINFO_DB3_REG			0x15A
> > +#define IT66121_AVIINFO_DB4_REG			0x15B
> > +#define IT66121_AVIINFO_DB5_REG			0x15C
> > +#define IT66121_AVIINFO_CSUM_REG		0x15D
> > +#define IT66121_AVIINFO_DB6_REG			0x15E
> > +#define IT66121_AVIINFO_DB7_REG			0x15F
> > +#define IT66121_AVIINFO_DB8_REG			0x160
> > +#define IT66121_AVIINFO_DB9_REG			0x161
> > +#define IT66121_AVIINFO_DB10_REG		0x162
> > +#define IT66121_AVIINFO_DB11_REG		0x163
> > +#define IT66121_AVIINFO_DB12_REG		0x164
> > +#define IT66121_AVIINFO_DB13_REG		0x165
> > +
> > +#define IT66121_AVI_INFO_PKT_REG		0xCD
> 
> > +#define IT66121_HDMI_MODE_REG			0xC0
> 
> > +#define IT66121_SYS_STATUS_REG			0x0E
> 
> > +#define IT66121_DDC_STATUS_REG			0x16
> 
> It's better to
> a) keep register sorted by value (easy to be oriented);
> b) have them in fixed width, e.g. 0x0CD.
> 
> ...
> 
> > +#define IT66121_DEVICE_MASK			0x0F
> 
> GENMASK() ?
> 
> > +#define IT66121_EDID_SLEEP			20000
> > +#define IT66121_EDID_TIMEOUT			200000
> 
> Care to add units?
> 
> > +#define IT66121_AFE_CLK_HIGH			80000
> 
> Also, what is the unit of this?
> 
> ...
> 
> > +	return regmap_write(ctx->regmap, IT66121_MASTER_SEL_REG,
> > +				IT66121_MASTER_SEL_HOST);
> 
> Indentation?
> Same for other similar places.
> 
> ...
> 
> > +static int it66121_configure_afe(struct it66121_ctx *ctx,
> > +				 const struct drm_display_mode *mode)
> 
> ...like this.
> 
> ...
> 
> > +	if (val & (IT66121_DDC_STATUS_NOACK | IT66121_DDC_STATUS_WAIT_BUS |
> > +	    IT66121_DDC_STATUS_ARBI_LOSE))
> > +		return -EAGAIN;
> 
> Perhaps better to
> 
> 	u32 busy = IT66121_DDC_STATUS_NOACK | IT66121_DDC_STATUS_WAIT_BUS |
> 		   IT66121_DDC_STATUS_ARBI_LOSE;
> 
> 
> 	if (val & busy)
> 		return -EAGAIN;
> 
> ?
> 
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int it66121_abort_ddc_ops(struct it66121_ctx *ctx)
> > +{
> > +	int ret;
> > +	unsigned int swreset, cpdesire;
> > +
> > +	ret = regmap_read(ctx->regmap, IT66121_SW_RST_REG, &swreset);
> > +	if (ret)
> > +		return ret;
> > +
> 
> > +	ret = regmap_read(ctx->regmap, IT66121_HDCP_REG, &cpdesire);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_write(ctx->regmap, IT66121_HDCP_REG,
> > +			   cpdesire & (~IT66121_HDCP_CPDESIRED & 0xFF));
> > +	if (ret)
> > +		return ret;
> 
> regmap_update_bits() ?
> 
> > +
> > +	ret = regmap_write(ctx->regmap, IT66121_SW_RST_REG,
> > +			   swreset | IT66121_SW_RST_HDCP);
> > +	if (ret)
> > +		return ret;
> 
> This should surround the inner update, correct? Otherwise, regmap_update_bits()
> can be used as well.
> 
> > +}
> 
> ...
> 
> > +static int it66121_get_edid_block(void *context, u8 *buf,
> > +				  unsigned int block, size_t len)
> > +{
> 
> > +		ret = regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
> > +				   IT66121_DDC_COMMAND_EDID_READ);
> > +		if (ret)
> > +			return ret;
> > +
> > +		offset += cnt;
> > +		remain -= cnt;
> 
> > +		msleep(20);
> 
> Should be explained.
> 
> > +
> > +		ret = it66121_wait_ddc_ready(ctx);
> > +		if (ret)
> > +			return ret;
> > +
> 
> > +		do {
> > +			ret = regmap_read(ctx->regmap,
> > +					  IT66121_DDC_RD_FIFO_REG, &val);
> > +			if (ret)
> > +				return ret;
> > +			*(buf++) = val;
> > +			cnt--;
> > +		} while (cnt > 0);
> 
> I'm wondering if regmap API has a helper for above like cases.
> 
> > +	}
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int it66121_connector_get_modes(struct drm_connector *connector)
> > +{
> 
> > +	struct it66121_ctx *ctx = container_of(connector, struct it66121_ctx,
> > +			connector);
> 
> Seems like it can be an inline helper and in all places you can use
> 
> 	struct it66121_ctx *ctx = to_it66121_ctx(connector);
> 
> 
> > +	ret = drm_connector_update_edid_property(connector,
> > +						 ctx->edid);
> 
> It quite fits one line, perhaps configure your editor to see 80 limit sharp?
> Applies to all similar cases as well.
> 
> > +	if (ret) {
> > +		DRM_ERROR("Failed to update EDID property: %d\n", ret);
> > +		goto unlock;
> > +	}
> 
> > +}
> 
> ...
> 
> > +	return (val & IT66121_SYS_STATUS_HPDETECT);
> 
> Too many parentheses.
> 
> ...
> 
> > +	max_clock = ctx->dual_edge ? 74250 : 148500;
> 
> Magic numbers? Also, It seems one definition is enough.
> 
> ...
> 
> > +	msleep(50);
> 
> Should be explained.
> 
> ...
> 
> > +	val = mute ? IT66121_AV_MUTE_ON : (~IT66121_AV_MUTE_ON & 0xFF);
> 
> 	val = mute ? IT66121_AV_MUTE_ON : 0;
> 
> > +	ret = regmap_write_bits(ctx->regmap, IT66121_AV_MUTE_REG,
> > +				IT66121_AV_MUTE_ON, val);
> 
> ...or even
> 
> 	mask = IT66121_AV_MUTE_ON;
> 	val = mute ? mask : 0;
> 
> 	ret = regmap_write_bits(ctx->regmap, IT66121_AV_MUTE_REG, mask, val);
> 
> > +	if (ret)
> > +		return ret;
> 
> ...
> 
> > +	regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
> > +			  IT66121_CLK_BANK_PWROFF_TXCLK,
> > +			  ~IT66121_CLK_BANK_PWROFF_TXCLK & 0xFF);
> 
> Same idea. What the point of all this operations in the value parameter?
> Please, fix over the code.
> 
> ...
> 
> 
> > +	if (val & IT66121_SYS_STATUS_ACTIVE_IRQ) {
> 
> 	if (!(val & IT66121_SYS_STATUS_ACTIVE_IRQ))
> 		goto unlock;
> 
> > +		ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
> > +		if (ret) {
> > +			dev_err(dev, "Cannot read STATUS1_REG %d\n", ret);
> > +		} else {
> > +			if (val & IT66121_INT_STATUS1_DDC_FIFOERR)
> > +				it66121_clear_ddc_fifo(ctx);
> 
> > +			if (val & (IT66121_INT_STATUS1_DDC_BUSHANG |
> > +					IT66121_INT_STATUS1_DDC_NOACK))
> 
> Indentation.
> 
> > +				it66121_abort_ddc_ops(ctx);
> > +			if (val & IT66121_INT_STATUS1_HPD_STATUS) {
> > +				regmap_write_bits(ctx->regmap,
> > +						  IT66121_INT_CLR1_REG,
> > +						  IT66121_INT_CLR1_HPD,
> > +						  IT66121_INT_CLR1_HPD);
> > +
> > +				if (!it66121_is_hpd_detect(ctx)) {
> > +					kfree(ctx->edid);
> > +					ctx->edid = NULL;
> > +				}
> > +				event = true;
> > +			}
> > +		}
> > +
> > +		regmap_write_bits(ctx->regmap, IT66121_SYS_STATUS_REG,
> > +				  IT66121_SYS_STATUS_CLEAR_IRQ,
> > +				  IT66121_SYS_STATUS_CLEAR_IRQ);
> > +	}
> > +
> > +unlock:
> > +	mutex_unlock(&ctx->lock);
> 
> ...
> 
> > +static int it66121_probe(struct i2c_client *client,
> > +			 const struct i2c_device_id *id)
> > +{
> 
> > +	u8 ids[4];
> 
> Magic, also see below.
> 
> > +	int i, ret;
> > +	struct it66121_ctx *ctx;
> > +	struct device *dev = &client->dev;
> 
> > +	ctx->conf = (struct it66121_conf *)of_device_get_match_data(dev);
> 
> device_get_match_data()
> 
> In any case why explicit casting?
> 
> > +	if (!ctx->conf)
> > +		return -ENODEV;
> > +
> 
> > +	ctx->dual_edge = of_property_read_bool(dev->of_node, "pclk-dual-edge");
> 
> device_property_read_bool()
> 
> > +	for (i = 0; i < 4; i++) {
> 
> Magic.
> 
> > +		regmap_read(ctx->regmap, i, &ret);
> > +		ids[i] = ret;
> > +	}
> 
> > +
> > +	if (ids[0] != IT66121_VENDOR_ID0 ||
> > +	    ids[1] != IT66121_VENDOR_ID1 ||
> > +	    ids[2] != IT66121_DEVICE_ID0 ||
> > +	    ((ids[3] & IT66121_DEVICE_MASK) != IT66121_DEVICE_ID1)) {
> > +		ite66121_power_off(ctx);
> > +		return -ENODEV;
> > +	}
> > +
> > +	ctx->bridge.funcs = &it66121_bridge_funcs;
> > +	ctx->bridge.of_node = dev->of_node;
> > +
> > +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> > +					it66121_irq_threaded_handler,
> 
> > +					IRQF_SHARED | IRQF_TRIGGER_LOW |
> > +					IRQF_ONESHOT,
> 
> Shouldn't flags come from appropriate resource provider (DT / ACPI / etc)?
> 
> > +					dev_name(dev),
> > +					ctx);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to request irq %d:%d\n", client->irq, ret);
> > +		ite66121_power_off(ctx);
> > +		return ret;
> > +	}
> > +
> > +	drm_bridge_add(&ctx->bridge);
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +static const struct of_device_id it66121_dt_match[] = {
> > +	{ .compatible = "ite,it66121",
> > +	  .data = &it66121_conf_simple,
> > +	},
> 
> > +	{ },
> 
> Terminator line doesn't need comma.
> 
> > +};
> 
> ...
> 
> > +static const struct i2c_device_id it66121_id[] = {
> > +	{ "it66121", 0 },
> 
> > +	{ },
> 
> Ditto.
> 
> > +};

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
