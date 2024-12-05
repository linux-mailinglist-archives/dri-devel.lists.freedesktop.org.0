Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368269E5ED5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 20:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B1010EF80;
	Thu,  5 Dec 2024 19:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GueeBRFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A60F10EF80
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 19:35:29 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53e152731d0so2125252e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 11:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733427327; x=1734032127; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9S8RsTdn0sMTjJIGfbeOK6kTewNAIU+Mvw8MKGo2JS8=;
 b=GueeBRFELiBwHYBNsfNo+si1Xr9vmP1H7Y8yKJpMVCpJmcMJ3z4TLuuOZx9IohI2Ox
 YXC+luLJ4mxp+Von1T/JWQX4Yi/3d7KuTwffBIEy9vPLNqqQoKM0N93eZ8UA61RYqt2l
 iIxO/f0rCAfPtEe2HKcMKULIHAber27y6KsJCwshcxl5X9vl2NuTwJvnDkOMNGenv6dC
 ZhFLG+u8bMQVFvpnDtoT8+MplqxgHDdRtSFBkZFw8jpX1hchLMY+6HkYuD1gYQCJhEoi
 7uk1+lU2shTqAbl+/tXmxvmIJsVCTu7C0X2D4ows4aMXHYuWVIU4zaclhAxHgCriwerl
 5KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733427327; x=1734032127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9S8RsTdn0sMTjJIGfbeOK6kTewNAIU+Mvw8MKGo2JS8=;
 b=JbMzH3AODXO6Ek0I5//8jXHo4VmR3KIoHMbhcnywhoNjxj0UrUPJyqLyngsY/l8vuP
 IMbPYk1FqxJryAF/3MBKUl31Z/E/3MTYp6l2O+pHJjMu10ZBOqZ9XnE2tRustLWf1S8g
 2PbLNhqQyx5cjDXo2hq9XnULrsSASx/Qzdy4u1esmj8wp8J5Eor0Ngvof2ImIEsICEKX
 xbvoMO4/rF7770MSg2nk5mxjRqXRNkUFjVHEiL+pRlYgU6f5pbWvuhIQWNQybZSKldIN
 /Th6yK9qb2ESgSeQDy/e87HnqEQduzsMiyWDUu54PWZ1JS1802BGugl2uxb8Pr3RewQ1
 O+jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp1vzP4UCzzUVTn7WInWv1Hiz9ATiiejs6hskbPmej3ri6z5PNa2GSUsS73KZjdkvxU/kOTOQwGo8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXCr5VnTlsF4+gjyP7b30wiXxuhGOz/Kg40BD+B0aA5ZYPcS3q
 igPAn5RR4fPLZaDYDNlXY+kpCeobYaitfaLTce58h1jhOwRIp95CJEvbsDf0eyk=
X-Gm-Gg: ASbGncuIVXyN1hneHTAgaRiy0tFJZFvyI+CCYhuF7Yu7muJoiA94HvYKbG2d9IrEYfT
 t4NG5D+kfbB0mUPNXwPxgBOs5Fl4yn08oBUGGzw/azMsRZhx3Nt1g1O79BJfRNeuaMz1suaa8pi
 LAtF4VmPalb4uhkveaIcA3S6LtIe0nlttP2hsM4+SIWfIKXX/LwJY/ujTyBtuxLXRcAmsXiC5I2
 sKme6IXBsPO637gNhKMda0h2dw7XJWTYJbC9NGQSGAPDsoccoR3aeSk6lhjf3b7plabIfSTkDvt
 aBg7HGbSyEKG5xiSxXW+0R6DwtQm/Q==
X-Google-Smtp-Source: AGHT+IGFrK2H/ob2QGWXfJHSb8e119RrKRAfgEocoDRBmzA04v/V3A76FGV/VQz7I65Os/Jolm+7xg==
X-Received: by 2002:a05:6512:39d3:b0:53d:f67d:d580 with SMTP id
 2adb3069b0e04-53e216f02f0mr1698149e87.2.1733427327271; 
 Thu, 05 Dec 2024 11:35:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ca11csm317706e87.238.2024.12.05.11.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 11:35:25 -0800 (PST)
Date: Thu, 5 Dec 2024 21:35:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, 
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <m7u6xzm2o4dmcjot4xfk6do4slikpsp6gi3uyiuw4d35kunbc5@jyzgkrp4xjwc>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
 <4lvsvo6vsc7bipcgftsq3mzunwxoka3wjqad42ptr37oz77zub@5uarhvjmcxnc>
 <a4a74f96-29cc-4007-9b03-f634b84d9cc2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4a74f96-29cc-4007-9b03-f634b84d9cc2@collabora.com>
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

On Thu, Dec 05, 2024 at 02:30:51PM +0100, AngeloGioacchino Del Regno wrote:
> Il 05/12/24 13:56, Dmitry Baryshkov ha scritto:
> > On Thu, Dec 05, 2024 at 12:45:17PM +0100, AngeloGioacchino Del Regno wrote:
> > > Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> > > found in MediaTek's MT8195, MT8188 SoC and their variants, and
> > > including support for display modes up to 4k60 and for HDMI
> > > Audio, as per the HDMI 2.0 spec.
> > > 
> > > HDCP and CEC functionalities are also supported by this hardware,
> > > but are not included in this commit and that also poses a slight
> > > difference between the V2 and V1 controllers in how they handle
> > > Hotplug Detection (HPD).
> > > 
> > > While the v1 controller was using the CEC controller to check
> > > HDMI cable connection and disconnection, in this driver the v2
> > > one does not.
> > > 
> > > This is due to the fact that on parts with v2 designs, like the
> > > MT8195 SoC, there is one CEC controller shared between the HDMI
> > > Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
> > > adding support to use the CEC HW to wake up the HDMI controllers
> > > it is necessary to have support for one TX, one RX *and* for both
> > > at the same time.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/gpu/drm/mediatek/Kconfig            |    8 +
> > >   drivers/gpu/drm/mediatek/Makefile           |    4 +
> > >   drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |    5 +
> > >   drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |    1 +
> > >   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c  |  403 +++++
> > >   drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h |  263 ++++
> > >   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      | 1488 +++++++++++++++++++
> > >   7 files changed, 2172 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> > >   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
> > >   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> > > 
> 
> ..snip..
> 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> > > new file mode 100644
> > > index 000000000000..05cbfc45be54
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> > > @@ -0,0 +1,1488 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> 
> ..snip..
> 
> > > +static int mtk_hdmi_v2_setup_audio_infoframe(struct mtk_hdmi *hdmi)
> > > +{
> > > +	struct hdmi_codec_params *params = &hdmi->aud_param.codec_params;
> > > +	struct hdmi_audio_infoframe frame;
> > > +	u8 buffer[14];
> > > +	ssize_t ret;
> > > +
> > > +	memcpy(&frame, &params->cea, sizeof(frame));
> > > +
> > > +	ret = hdmi_audio_infoframe_pack(&frame, buffer, sizeof(buffer));
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
> > 
> > This should be handled via HDMI Connector framework too. There is
> > already an interface to set / clear audio infoframes.
> > als I have been working on an interface to make HDMI codec
> > implementation more generic, see [1]. Your comments are appreciated.
> > 
> > [1] https://patchwork.freedesktop.org/series/134927/
> > 
> 
> I didn't go for that because I was afraid that your series wouldn't actually
> land in the same window as this driver.

There were two points in my comment (sorry for being not explicit
enough). One is to point to the HDMI codec infra (and you are right,
it's not yet in the mergeable state). Second one is to use
drm_atomic_helper_connector_hdmi_update_audio_infoframe() and
drm_atomic_helper_connector_hdmi_clear_audio_infoframe() if possible (it
might be hard to do it - in fact it being hard kind of forced me to
work on the HDMI codec infra).

> I am at this point puzzled to whether I should add a commit on top of this
> submission that switches this driver to using the generic HDMI Codec infra
> (which could also be helpful as guidance to others trying to do the same on
> other drivers, I guess), or if I should just rebase on top of that.

I'd say, a completely separate patch might be even better, I can then
integrate it into the HDMI codec patchset, adding a soft dependency on
your series. If for some reason the codec lands earlier than your
patchset, the patch can be dropped and reintegrated into your series. Or
just committed separately.

> I'd rather add a commit on top to mainly avoid risking to delay this driver,
> but if you're absolutely certain that you can get your series merged in the
> same window as this driver I have *zero* problems in just rebasing on top.
> 
> Besides...
> 
> I'll find the time to review your series - I'm sad it didn't land earlier as
> I would've written a bit less code otherwise :-)
> 
> > > +
> > > +	return 0;
> > > +}
> > > +
> 
> ..snip..
> 
> > > +
> > > +	/* Enable the controller at attach time for HPD/Pord feedback */
> > > +	ret = mtk_hdmi_v2_enable(hdmi);
> > > +	if (ret)
> > > +		return ret;
> > 
> > This looks like a hack. Please use .hpd_enable() / .hpd_disable()
> > callbacks.
> > 
> 
> ...but there's no way to power on only the HPD - you can either power on
> the entire controller, or nothing.
> 
> I can't call mtk_hdmi_v2_enable/disable() from the HPD callbacks.

Why? Add a powerup refcount if necessary.

> 
> Perhaps the comment should have been
> 
> "Enable the controller attach time also allows HPD/Pord feedback"?

I think it should still be explicit call from those callbacks. Consider
a platform using external GPIO to implement HPD. Then the HDMI
controller can stay disabled if it is not necessary.

> 
> > > +
> > > +	/* Enable Hotplug and Pord pins internal debouncing */
> > > +	regmap_set_bits(hdmi->regs, HPD_DDC_CTRL,
> > > +			HPD_DDC_HPD_DBNC_EN | HPD_DDC_PORD_DBNC_EN);
> > > +
> > > +	irq_clear_status_flags(hdmi->irq, IRQ_NOAUTOEN);
> > > +	enable_irq(hdmi->irq);
> > > +
> > > +	/*
> > > +	 * Check if any HDMI monitor was connected before probing this driver
> > > +	 * and/or attaching the bridge, without debouncing: if so, we want to
> > > +	 * notify the DRM so that we start outputting an image ASAP.
> > > +	 * Note that calling the ISR thread function will also perform a HW
> > > +	 * registers write that enables both the HPD and Pord interrupts.
> > > +	 */
> > > +	__mtk_hdmi_v2_isr_thread(hdmi);
> > > +
> > > +	return 0;
> > > +}
> > > +
> 
> ..snip..
> 
> > > +static void mtk_hdmi_v2_bridge_pre_enable(struct drm_bridge *bridge,
> > > +					  struct drm_bridge_state *old_state)
> > > +{
> > > +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> > > +	struct drm_atomic_state *state = old_state->base.state;
> > > +	struct drm_connector_state *conn_state;
> > > +	union phy_configure_opts opts = {
> > > +		.dp = { .link_rate = hdmi->mode.clock * KILO }
> > > +	};
> > > +
> > > +	/* Retrieve the connector through the atomic state */
> > > +	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> > > +
> > > +	conn_state = drm_atomic_get_new_connector_state(state, hdmi->curr_conn);
> > > +	if (WARN_ON(!conn_state))
> > > +		return;
> > > +
> > > +	/*
> > > +	 * Preconfigure the HDMI controller and the HDMI PHY at pre_enable
> > > +	 * stage to make sure that this IP is ready and clocked before the
> > > +	 * mtk_dpi gets powered on and before it enables the output.
> > > +	 */
> > > +	hdmi->dvi_mode = !hdmi->curr_conn->display_info.is_hdmi;
> > 
> > Can you access display_info directly instead?
> > 
> 
> Nice catch. Yeah, I should've done that from the beginning. Fixed for v3.
> 
> > > +	mtk_hdmi_v2_output_set_display_mode(hdmi, &hdmi->mode);
> > > +
> > > +	/* Reconfigure phy clock link with appropriate rate */
> > > +	phy_configure(hdmi->phy, &opts);
> > > +
> > > +	/* Power on the PHY here to make sure that DPI_HDMI is clocked */
> > > +	phy_power_on(hdmi->phy);
> > > +
> > > +	hdmi->powered = true;
> > > +}
> > > +
> > > +static void mtk_hdmi_v2_bridge_enable(struct drm_bridge *bridge,
> > > +				      struct drm_bridge_state *old_state)
> > > +{
> > > +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> > > +	struct drm_atomic_state *state = old_state->base.state;
> > > +	int ret;
> > > +
> > > +	ret = drm_atomic_helper_connector_hdmi_update_infoframes(hdmi->curr_conn, state);
> > > +	if (ret)
> > > +		dev_err(hdmi->dev, "Could not update infoframes: %d\n", ret);
> > > +
> > > +	mtk_hdmi_v2_hw_vid_mute(hdmi, false);
> > > +	mtk_hdmi_v2_hw_aud_mute(hdmi, false);
> > > +
> > > +	/* signal the connect event to audio codec */
> > > +	mtk_hdmi_v2_handle_plugged_change(hdmi, true);
> > 
> > I think it was agreed that this should be called from the hotplug path,
> > see the (linked) HDMI codec infrastructure patchset and dicussions for
> > the previous revisions.
> > 
> 
> Okay, I'll check that out.
> 
> > > +
> > > +	hdmi->enabled = true;
> > > +}
> > > +
> 
> ..snip..
> 
> > > +
> > > +static int mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> > > +						 const struct drm_display_mode *mode,
> > > +						 unsigned long long tmds_rate)
> > > +{
> > > +	if (mode->clock < MTK_HDMI_V2_CLOCK_MIN)
> > > +		return MODE_CLOCK_LOW;
> > > +	else if (mode->clock > MTK_HDMI_V2_CLOCK_MAX)
> > > +		return MODE_CLOCK_HIGH;
> > > +	else
> > > +		return MODE_OK;
> > > +}
> > > +
> > > +static enum drm_mode_status
> > > +mtk_hdmi_v2_bridge_mode_valid(struct drm_bridge *bridge,
> > > +			      const struct drm_display_info *info,
> > > +			      const struct drm_display_mode *mode)
> > > +{
> > > +	unsigned long long rate;
> > > +
> > > +	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> > > +	return mtk_hdmi_v2_hdmi_tmds_char_rate_valid(bridge, mode, rate);
> > > +}
> > 
> > Please rebase on top of https://patchwork.freedesktop.org/series/140193/
> > There should be no need to do this manually.
> > 
> 
> Oh finally there's a helper for this. Cool, will rebase! Thanks!

And it doesn't even add an extra dependency for you.

> 
> > > +
> > > +static int mtk_hdmi_v2_hdmi_clear_infoframe(struct drm_bridge *bridge,
> > > +					    enum hdmi_infoframe_type type)
> > > +{
> > > +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> > > +	u32 reg_start, reg_end;
> > > +
> > > +	switch (type) {
> > > +	case HDMI_INFOFRAME_TYPE_AUDIO:
> > > +		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AUD_EN | AUD_EN_WR);
> > > +		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
> > > +		reg_start = TOP_AIF_HEADER;
> > > +		reg_end = TOP_AIF_PKT03;
> > > +		break;
> > > +	case HDMI_INFOFRAME_TYPE_AVI:
> > > +		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
> > > +		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
> > > +		reg_start = TOP_AVI_HEADER;
> > > +		reg_end = TOP_AVI_PKT05;
> > > +		break;
> > > +	case HDMI_INFOFRAME_TYPE_SPD:
> > > +		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
> > > +		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
> > > +		reg_start = TOP_SPDIF_HEADER;
> > > +		reg_end = TOP_SPDIF_PKT07;
> > > +		break;
> > > +	case HDMI_INFOFRAME_TYPE_VENDOR:
> > > +		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
> > > +		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
> > > +		reg_start = TOP_VSIF_HEADER;
> > > +		reg_end = TOP_VSIF_PKT07;
> > > +		break;
> > > +	case HDMI_INFOFRAME_TYPE_DRM:
> > > +	default:
> > > +		return 0;
> > > +	};
> > > +
> > > +	for (; reg_start <= reg_end; reg_start += 4)
> > > +		regmap_write(hdmi->regs, reg_start, 0);
> > 
> > Interesting. Usually sending of the infoframe is controlled by a
> > register of a kind.
> > 
> 
> "This callback clears the infoframes in the hardware during commit"
> 
> ...and that's exactly what this function does: clears the infoframes
> in the HW and stops the RPT, making the HW ready for the "next round".
> 
> Did I get the documentation wrong?
> Should this function *send* an all-zero infoframe to the external display?

No, it should stop sending the callback. My point was that usually there
is a separate register which controls the infoframes. You code just
clears the header (which probably is handled as disabling in the IP
core).

> 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mtk_hdmi_v2_hdmi_write_infoframe(struct drm_bridge *bridge,
> > > +					    enum hdmi_infoframe_type type,
> > > +					    const u8 *buffer, size_t len)
> > > +{
> > > +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> > > +
> > > +	switch (type) {
> > > +	case HDMI_INFOFRAME_TYPE_AUDIO:
> > > +		mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
> > > +		break;
> > > +	case HDMI_INFOFRAME_TYPE_AVI:
> > > +		mtk_hdmi_v2_hw_write_avi_infoframe(hdmi, buffer);
> > > +		break;
> > > +	case HDMI_INFOFRAME_TYPE_SPD:
> > > +		mtk_hdmi_v2_hw_write_spd_infoframe(hdmi, buffer);
> > > +		break;
> > > +	case HDMI_INFOFRAME_TYPE_VENDOR:
> > > +		mtk_hdmi_v2_hw_write_vendor_infoframe(hdmi, buffer);
> > > +		break;
> > > +	case HDMI_INFOFRAME_TYPE_DRM:
> > > +	default:
> > > +		dev_err(hdmi->dev, "Unsupported HDMI infoframe type %u\n", type);
> > > +		break;
> > > +	};
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mtk_hdmi_v2_bridge_atomic_check(struct drm_bridge *bridge,
> > > +					   struct drm_bridge_state *bridge_state,
> > > +					   struct drm_crtc_state *crtc_state,
> > > +					   struct drm_connector_state *conn_state)
> > > +{
> > > +	return drm_atomic_helper_connector_hdmi_check(conn_state->connector,
> > > +						      conn_state->state);
> > > +}
> > 
> > Note to myself, probably we can move this to drm_bridge_connector too.
> > 
> > > +
> > > +static int mtk_hdmi_v2_set_abist(struct mtk_hdmi *hdmi, bool enable)
> > > +{
> > > +	struct drm_display_mode *mode = &hdmi->mode;
> > > +	int abist_format = -EINVAL;
> > > +	bool interlaced;
> > > +
> > > +	if (!enable) {
> > > +		regmap_clear_bits(hdmi->regs, TOP_CFG00, HDMI_ABIST_ENABLE);
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (!mode->hdisplay || !mode->vdisplay)
> > > +		return -EINVAL;
> > > +
> > > +	interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
> > 
> > The interlaced modes should be filtered, unless you also set
> > bridge->interlace_allowed to true.
> > 
> 
> Noted. Many Thanks for the review!
> 
> I'll wait until next week for more feedback before sending a v3.

-- 
With best wishes
Dmitry
