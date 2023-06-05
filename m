Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D526C7222B8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 11:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4744910E1B8;
	Mon,  5 Jun 2023 09:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0975E10E1B8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 09:56:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5525061016;
 Mon,  5 Jun 2023 09:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B51EC433D2;
 Mon,  5 Jun 2023 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685958978;
 bh=E0sAzZZmP5WA1Nwo3dxOCDReq4iq5AIC9EGQphYjTpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bErdGzNY2CmDdzKa+JSuXnENnoWBEZhEfN1CjJA42rochcJAzsTmwhQgjeGA7RzKl
 h/lT3hAkIPCwG8aXhHAVR+shMKLMbRjbUjGitdmddEBDMzFXDy03jqQa+2ZGCvJpKs
 JBYPF5nOf/OBaU+evEXkwRnmc9TtQosKCKHvFGCI+hjlEyBGp+dLIC6gyZnz34tTAX
 QgwpmaMeF9yT/D4/t3JtKiz+aUCNuPP7d/augH+oAAY34+2MH2+noUTSRfJhzSI9s2
 ZX2zDaKS4KuAic9ukqDgdkfXu6YMIyYuA7NbK/dZVFliyw6lfaBgsb0RI/Hc9wen7l
 67FeaF2Sct8vA==
Date: Mon, 5 Jun 2023 11:56:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH 9/9] drm/verisilicon: Add starfive hdmi driver
Message-ID: <ayygsdwzogu4ygkobs7zkroxicxtixtp5bxayn5vzk4qlkwt6x@yo5s2qwt77mo>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-10-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c3ccdoac5xz7n6if"
Content-Disposition: inline
In-Reply-To: <20230602074043.33872-10-keith.zhao@starfivetech.com>
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


--c3ccdoac5xz7n6if
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 02, 2023 at 03:40:43PM +0800, Keith Zhao wrote:
> Add HDMI dirver for StarFive SoC JH7110.
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>

I have a few high level comments:

> +static int starfive_hdmi_setup(struct starfive_hdmi *hdmi,
> +			       struct drm_display_mode *mode)
> +{
> +	hdmi_modb(hdmi, STARFIVE_BIAS_CONTROL, STARFIVE_BIAS_ENABLE, STARFIVE_B=
IAS_ENABLE);
> +	hdmi_writeb(hdmi, STARFIVE_RX_CONTROL, STARFIVE_RX_ENABLE);
> +	hdmi->hdmi_data.vic =3D drm_match_cea_mode(mode);
> +
> +	hdmi->tmds_rate =3D mode->clock * 1000;
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
> +	hdmi_writeb(hdmi, STARFIVE_SERIALIER_CONTROL, STARFIVE_SERIALIER_ENABLE=
);
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

The PHY PLL supports rate until 594MHz, but I don't see any scrambler
setup here?

> +static void starfive_hdmi_encoder_mode_set(struct drm_encoder *encoder,
> +					   struct drm_display_mode *mode,
> +					   struct drm_display_mode *adj_mode)
> +{
> +	struct starfive_hdmi *hdmi =3D encoder_to_hdmi(encoder);
> +
> +	starfive_hdmi_setup(hdmi, adj_mode);

You should put that call into the enable callback, there's no need to
power it up at that point.

> +	memcpy(&hdmi->previous_mode, adj_mode, sizeof(hdmi->previous_mode));

You don't seem to be using that anywhere, and it's not the previous but
the current mode.

> +}
> +
> +static void starfive_hdmi_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct starfive_hdmi *hdmi =3D encoder_to_hdmi(encoder);
> +
> +	pm_runtime_get_sync(hdmi->dev);
> +}
> +
> +static void starfive_hdmi_encoder_disable(struct drm_encoder *encoder)
> +{
> +	struct starfive_hdmi *hdmi =3D encoder_to_hdmi(encoder);
> +
> +	pm_runtime_put(hdmi->dev);
> +}
> +
> +static bool starfive_hdmi_encoder_mode_fixup(struct drm_encoder *encoder,
> +					     const struct drm_display_mode *mode,
> +					     struct drm_display_mode *adj_mode)
> +{
> +	return true;
> +}

You can drop that one

> +static int
> +starfive_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
> +{
> +	return 0;
> +}

Ditto

> +static int starfive_hdmi_connector_get_modes(struct drm_connector *conne=
ctor)
> +{
> +	struct starfive_hdmi *hdmi =3D connector_to_hdmi(connector);
> +	struct edid *edid;
> +	int ret =3D 0;
> +
> +	if (!hdmi->ddc)
> +		return 0;
> +
> +	edid =3D drm_get_edid(connector, hdmi->ddc);
> +	if (edid) {
> +		hdmi->hdmi_data.sink_is_hdmi =3D drm_detect_hdmi_monitor(edid);
> +		hdmi->hdmi_data.sink_has_audio =3D drm_detect_monitor_audio(edid);
> +		drm_connector_update_edid_property(connector, edid);
> +		ret =3D drm_add_edid_modes(connector, edid);
> +		kfree(edid);
> +	}
> +
> +	return ret;
> +}

get_modes can be called while the connector is inactive, you need to
call pm_runtime_get_sync / pm_runtime_put here

> +static enum drm_mode_status
> +starfive_hdmi_connector_mode_valid(struct drm_connector *connector,
> +				   struct drm_display_mode *mode)
> +{
> +	const struct pre_pll_config *cfg =3D pre_pll_cfg_table;
> +	int pclk =3D mode->clock * 1000;
> +	bool valid =3D false;
> +	int i;
> +
> +	for (i =3D 0; cfg[i].pixclock !=3D (~0UL); i++) {
> +		if (pclk =3D=3D cfg[i].pixclock) {
> +			if (pclk > 297000000)
> +				continue;
> +
> +			valid =3D true;
> +			break;
> +		}
> +	}
> +
> +	return (valid) ? MODE_OK : MODE_BAD;
> +}

So I guess that's why you don't bother with the scrambler, you filter
all the modes > 297MHz?

If so, you also need to make sure it happens in atomic_check. mode_valid
will only filter the modes exposed to userspace, but the userspace is
free to send any mode it wants and that's checked by atomic_check.

> +
> +static int
> +starfive_hdmi_probe_single_connector_modes(struct drm_connector *connect=
or,
> +					   u32 maxX, u32 maxY)
> +{
> +	struct starfive_hdmi *hdmi =3D connector_to_hdmi(connector);
> +	int ret;
> +
> +	pm_runtime_get_sync(hdmi->dev);
> +
> +	ret =3D drm_helper_probe_single_connector_modes(connector, 3840, 2160);
> +
> +	pm_runtime_put(hdmi->dev);
> +
> +	return ret;
> +}

You already have a pm_runtime_get_sync call in get_modes, why is that
necessary?

> +
> +static void starfive_hdmi_connector_destroy(struct drm_connector *connec=
tor)
> +{
> +	drm_connector_unregister(connector);
> +	drm_connector_cleanup(connector);
> +}

Use drmm_connector_init.

> +static irqreturn_t starfive_hdmi_irq(int irq, void *dev_id)
> +{
> +	struct starfive_hdmi *hdmi =3D dev_id;
> +
> +	drm_helper_hpd_irq_event(hdmi->connector.dev);

drm_connector_helper_hpd_irq_event()

> +static int starfive_hdmi_get_clk_rst(struct device *dev, struct starfive=
_hdmi *hdmi)
> +{
> +	hdmi->sys_clk =3D devm_clk_get(dev, "sysclk");
> +	if (IS_ERR(hdmi->sys_clk)) {
> +		DRM_DEV_ERROR(dev, "Unable to get HDMI sysclk clk\n");
> +		return PTR_ERR(hdmi->sys_clk);
> +	}
> +	hdmi->mclk =3D devm_clk_get(dev, "mclk");
> +	if (IS_ERR(hdmi->mclk)) {
> +		DRM_DEV_ERROR(dev, "Unable to get HDMI mclk clk\n");
> +		return PTR_ERR(hdmi->mclk);
> +	}
> +	hdmi->bclk =3D devm_clk_get(dev, "bclk");
> +	if (IS_ERR(hdmi->bclk)) {
> +		DRM_DEV_ERROR(dev, "Unable to get HDMI bclk clk\n");
> +		return PTR_ERR(hdmi->bclk);
> +	}
> +	hdmi->tx_rst =3D reset_control_get_shared(dev, "hdmi_tx");
> +	if (IS_ERR(hdmi->tx_rst)) {
> +		DRM_DEV_ERROR(dev, "Unable to get HDMI tx rst\n");
> +		return PTR_ERR(hdmi->tx_rst);
> +	}

That one isn't device-managed, you'll need to put back the reference in
unbind.

> +	return 0;
> +}
> +
> +static int starfive_hdmi_bind(struct device *dev, struct device *master,
> +			      void *data)
> +{
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	struct drm_device *drm =3D data;
> +	struct starfive_hdmi *hdmi;
> +	struct resource *iores;
> +	int irq;
> +	int ret;
> +
> +	hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> +	if (!hdmi)
> +		return -ENOMEM;

Using device-managed actions to allocate memory that will eventually
hold the connectors and encoders is unsafe.

Please use drmm_kzalloc here, and test that it all works fine by
enabling KASAN and removing the module.

> +
> +	hdmi->dev =3D dev;
> +	hdmi->drm_dev =3D drm;
> +
> +	iores =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	hdmi->regs =3D devm_ioremap_resource(dev, iores);
> +	if (IS_ERR(hdmi->regs))
> +		return PTR_ERR(hdmi->regs);

The main issue I was mentioning above is that whenever the device is
unbound from its driver, all the device-managed actions are executed.

However, the KMS device will still be there until the last (userspace)
user closes its FD, so if anything happens between the time the module
is removed and the FD is closed, you get plenty of use-after-free errors.

For MMIO accesses, this is even more true since you need to use a
device-managed action for the registers mapping (this is true for any
resource tied to the device itself, so clocks, reset, etc. fit that
description too).

To protect against it, you need to protect any device access by a call
to drm_dev_enter/drm_dev_exit.

> +
> +	ret =3D starfive_hdmi_get_clk_rst(dev, hdmi);
> +	ret =3D starfive_hdmi_enable_clk_deassert_rst(dev, hdmi);

Why does the device need to be powered here?

> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret =3D irq;
> +		goto err_disable_clk;
> +	}
> +
> +	hdmi->ddc =3D starfive_hdmi_i2c_adapter(hdmi);
> +	if (IS_ERR(hdmi->ddc)) {
> +		ret =3D PTR_ERR(hdmi->ddc);
> +		hdmi->ddc =3D NULL;
> +		goto err_disable_clk;
> +	}
> +
> +	hdmi->tmds_rate =3D clk_get_rate(hdmi->sys_clk);

It's not clear to me what tmds_rate is here, wouldn't that change from
one mode to the next?

> +	starfive_hdmi_i2c_init(hdmi);
> +
> +	ret =3D starfive_hdmi_register(drm, hdmi);
> +	if (ret)
> +		goto err_put_adapter;
> +
> +	dev_set_drvdata(dev, hdmi);
> +
> +	/* Unmute hotplug interrupt */
> +	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
> +
> +	ret =3D devm_request_threaded_irq(dev, irq, starfive_hdmi_hardirq,
> +					starfive_hdmi_irq, IRQF_SHARED,
> +					dev_name(dev), hdmi);
> +	if (ret < 0)
> +		goto err_cleanup_hdmi;
> +
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);

Autosuspend? Shouldn't we enable the device as long as there is an
active video output (and you have that covered already)?

> +	pm_runtime_enable(&pdev->dev);
> +
> +	starfive_hdmi_disable_clk_assert_rst(dev, hdmi);

It would be clearer if you would move
starfive_hdmi_enable_clk_deassert_rst()/disable_clk_assert_rst() into
runtime_resume/runtime_suspend, and then in you bind just call
pm_runtime_enable(), pm_runtime_get_sync(), do the registration, and
pm_runtime_put.

> +#define UPDATE(x, h, l)\
> +({\
> +	typeof(x) x_ =3D (x);\
> +	typeof(h) h_ =3D (h);\
> +	typeof(l) l_ =3D (l);\
> +	(((x_) << (l_)) & GENMASK((h_), (l_)));\
> +})

That's FIELD_PREP, right?
Maxime

--c3ccdoac5xz7n6if
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZH2xPwAKCRDj7w1vZxhR
xRFAAP0f3J6Tu7GQHeZqx5luoDhXXLf8/1gmqshwjcYtEt7awgEAoRRjwu25Pah9
m5eSDewNpcJYQHuxezva0a9w+5vmPQk=
=BH5E
-----END PGP SIGNATURE-----

--c3ccdoac5xz7n6if--
