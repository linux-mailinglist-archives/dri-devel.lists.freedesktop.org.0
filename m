Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CB87D6E6A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADAB10E663;
	Wed, 25 Oct 2023 14:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8290110E663
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:07:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DD0A2B82F7F;
 Wed, 25 Oct 2023 14:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFEFC433C8;
 Wed, 25 Oct 2023 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698242826;
 bh=Zee+eW93udYcnyqtqjHObnizhWlLmAgeUVCuNGTK10c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BmqVUmUz0UOCgO9GV+60fX6HqNIqZIp1hjMn6Tmm8aa45TUpCC8MbYutA93Z+/quZ
 bnI3K6Z544gS9Yxjyr0Cc5pZNZ3j9fiekUlH2Q5cbvNzD7/YyKDygMoG0xqao0ZJYo
 74JYxAc2EBJujr9Odf9sr+KFvIv921z42mcpTav5PHfwhOHcZ+LexTEk12M535Kqo4
 CGQ8LTP6RIy/O0C+jJEqUugYsVk5Zu4FhOJbIohWZJ1TZWGzx/JUX950EN7yGREPZB
 Wk0I5Xs0K+L3YOTR2+AqmKcrLaMDz/0D4woqgJM6ImuKcv2L7pFeo8TYuXCCl3+lnb
 1341mqfpN7b2g==
Date: Wed, 25 Oct 2023 16:07:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH v2 6/6] drm/vs: Add hdmi driver
Message-ID: <3ud27r322pkaflcs2bw7fwomymt4niws6nchmosjfhlcxr2wek@fvycunfo3rdn>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="66s2onyuolrasskv"
Content-Disposition: inline
In-Reply-To: <20231025103957.3776-7-keith.zhao@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jagan Teki <jagan@edgeble.ai>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--66s2onyuolrasskv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 25, 2023 at 06:39:57PM +0800, Keith Zhao wrote:
> +static int starfive_hdmi_setup(struct starfive_hdmi *hdmi,
> +			       struct drm_display_mode *mode)
> +{
> +	hdmi_modb(hdmi, STARFIVE_BIAS_CONTROL, STARFIVE_BIAS_ENABLE, STARFIVE_BIAS_ENABLE);
> +	hdmi_writeb(hdmi, STARFIVE_RX_CONTROL, STARFIVE_RX_ENABLE);
> +	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);

You're never using that variable.

> +	hdmi->tmds_rate = mode->clock * 1000;
> +	starfive_hdmi_phy_clk_set_rate(hdmi);
> +
> +	while (!(hdmi_readb(hdmi, STARFIVE_PRE_PLL_LOCK_STATUS) & 0x1))
> +		continue;
> +	while (!(hdmi_readb(hdmi, STARFIVE_POST_PLL_LOCK_STATUS) & 0x1))
> +		continue;
> +
> +	/*turn on LDO*/
> +	hdmi_writeb(hdmi, STARFIVE_LDO_CONTROL, STARFIVE_LDO_ENABLE);
> +	/*turn on serializer*/
> +	hdmi_writeb(hdmi, STARFIVE_SERIALIER_CONTROL, STARFIVE_SERIALIER_ENABLE);
> +
> +	starfive_hdmi_tx_phy_power_down(hdmi);
> +	starfive_hdmi_config_video_timing(hdmi, mode);
> +	starfive_hdmi_tx_phy_power_on(hdmi);
> +
> +	starfive_hdmi_tmds_driver_on(hdmi);
> +	starfive_hdmi_sync_tmds(hdmi);
> +
> +	return 0;
> +}
> +
> +static void starfive_hdmi_encoder_mode_set(struct drm_encoder *encoder,
> +					   struct drm_display_mode *mode,
> +					   struct drm_display_mode *adj_mode)
> +{
> +	struct starfive_hdmi *hdmi = encoder_to_hdmi(encoder);
> +
> +	drm_mode_copy(&hdmi->previous_mode, adj_mode);
> +}

You're never using that field, and it's not the previous mode, but the current mode.

> +static void starfive_hdmi_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct starfive_hdmi *hdmi = encoder_to_hdmi(encoder);
> +	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> +	int ret, idx;
> +	struct drm_device *drm = hdmi->connector.dev;
> +
> +	if (drm && !drm_dev_enter(drm, &idx))
> +		return;
> +
> +	ret = pm_runtime_get_sync(hdmi->dev);
> +	if (ret < 0)
> +		return;

pm_runtime_resume_and_get is what you want here

> +	mdelay(10);

???

Sprinkling delays here and there isn't great. What is the issue this is
trying to workaround?

> +	starfive_hdmi_setup(hdmi, mode);
> +
> +	if (drm)
> +		drm_dev_exit(idx);
> +}
> +
> +static void starfive_hdmi_encoder_disable(struct drm_encoder *encoder)
> +{
> +	struct starfive_hdmi *hdmi = encoder_to_hdmi(encoder);
> +
> +	int idx;
> +	struct drm_device *drm = hdmi->connector.dev;
> +
> +	if (drm && !drm_dev_enter(drm, &idx))
> +		return;
> +
> +	pm_runtime_put(hdmi->dev);

pm_runtime calls should be safe anytime. If you need to protect them
through a drm_dev_enter call, that call should be in the pm_runtime hook
itself.

> +	if (drm)
> +		drm_dev_exit(idx);
> +}
> +
> +static int
> +starfive_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
> +{
> +	bool valid = false;
> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +	struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(crtc_state);
> +
> +	vs_crtc_state->encoder_type = encoder->encoder_type;
> +	vs_crtc_state->output_fmt = MEDIA_BUS_FMT_RGB888_1X24;

Ok, so those two will always be ENCODER_TMDS and RGB888. Drop them from
your CRTC state and use the proper defines there.

> +	const struct pre_pll_config *cfg = pre_pll_cfg_table;
> +	int pclk = mode->clock * 1000;
> +
> +	for (; cfg->pixclock != 0; cfg++) {
> +		if (pclk == cfg->pixclock) {
> +			if (pclk > 297000000)
> +				continue;
> +
> +			valid = true;
> +			break;
> +		}
> +	}
> +
> +	return (valid) ? 0 : -EINVAL;
> +}
> +
> +static const struct drm_encoder_helper_funcs starfive_hdmi_encoder_helper_funcs = {
> +	.enable     = starfive_hdmi_encoder_enable,
> +	.disable    = starfive_hdmi_encoder_disable,
> +	.mode_set   = starfive_hdmi_encoder_mode_set,
> +	.atomic_check = starfive_hdmi_encoder_atomic_check,
> +};
> +
> +static enum drm_connector_status
> +starfive_hdmi_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	struct starfive_hdmi *hdmi = connector_to_hdmi(connector);
> +	struct drm_device *drm = hdmi->connector.dev;
> +	int ret;
> +	int idx;
> +
> +	if (drm && !drm_dev_enter(drm, &idx))
> +		return connector_status_disconnected;
> +
> +	ret = pm_runtime_get_sync(hdmi->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = (hdmi_readb(hdmi, HDMI_STATUS) & m_HOTPLUG) ?
> +		connector_status_connected : connector_status_disconnected;
> +	pm_runtime_put(hdmi->dev);
> +
> +	if (drm)
> +		drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static int starfive_hdmi_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct starfive_hdmi *hdmi = connector_to_hdmi(connector);
> +	struct edid *edid;
> +	int ret = 0;
> +
> +	if (!hdmi->ddc)
> +		return 0;
> +	ret = pm_runtime_get_sync(hdmi->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	edid = drm_get_edid(connector, hdmi->ddc);
> +	if (edid) {
> +		hdmi->hdmi_data.sink_is_hdmi = drm_detect_hdmi_monitor(edid);

You're not using that field anywhere, and it's available in drm_display_info already.

> +		hdmi->hdmi_data.sink_has_audio = drm_detect_monitor_audio(edid);

Ditto

> +struct hdmi_data_info {
> +	int vic;
> +	bool sink_is_hdmi;
> +	bool sink_has_audio;
> +	unsigned int enc_in_format;

You're not using it

> +	unsigned int enc_out_format;

Ditto

> +	unsigned int colorimetry;

Ditto

Which means that as things stands, you can get rid of that entire
structure.

> +};
> +
> +struct starfive_hdmi {
> +	struct device *dev;
> +	struct drm_device *drm_dev;
> +	struct drm_encoder	encoder;
> +	struct drm_connector	connector;
> +
> +	struct starfive_hdmi_i2c *i2c;
> +
> +	int irq;
> +	struct clk *sys_clk;
> +	struct clk *mclk;
> +	struct clk *bclk;
> +	struct reset_control *tx_rst;
> +	void __iomem *regs;
> +
> +	struct i2c_adapter *ddc;
> +
> +	unsigned long tmds_rate;

You're not using that either.

Maxime

--66s2onyuolrasskv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkhBwAKCRDj7w1vZxhR
xeTuAP99oERAnvU2fXnykYFW54PBm3gLFqfrf2Z5JgERsAxT0AD/WQn+VOFkfmGS
WHhxPbr9LHj5tiAXXZ37JfQt4XsOtgg=
=eGdb
-----END PGP SIGNATURE-----

--66s2onyuolrasskv--
