Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5AAA2AB9C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B6610E2F0;
	Thu,  6 Feb 2025 14:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="I+G9jbTm";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="X8fmXUjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7791510E2F0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1738852733; x=1770388733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tDw+wvEmKZCtU2ZRF/kEehWEfxlmuiMVYComcBD/45w=;
 b=I+G9jbTm5ycLAqs5c9gwxYU8Vj09Isu+JDxe0G49DUKJ4LLP6ycR0oEY
 QxDgS57AGO4QvzrEDkRv6O5qvG/YS+54oOKx4pVpkr+BswEDAKALOFi91
 toLRkgRalbu1b28TOetxuv6yi59VB2b4Hp1CPcFH+lWGl7hNcRKSH7b4U
 bRtsKGXe8agpQ49w/J9MY+CENanmo3vVB1MiFztuNOcewhDJvUhjRKg2h
 uBd+kWY/TiIu94UKaUN2H2Hp6YFPrYwgTHILQladnPnp7VbL8YBbCTTqU
 g/SkEe4ofDrWSEQEyV/pi1FNXv4/VP0y2IUNzJ5xj83kh5/avjhqgYRdT g==;
X-CSE-ConnectionGUID: F4Yc3AtGSgSJCd6jr9F7zA==
X-CSE-MsgGUID: XILBY/edQCaSZP2uA96rmQ==
X-IronPort-AV: E=Sophos;i="6.13,264,1732575600"; d="scan'208";a="41611131"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 06 Feb 2025 15:38:51 +0100
X-CheckPoint: {67A4C97B-11-727D2C21-EE1B71AA}
X-MAIL-CPID: B751B00B03E09C216C4DABD7A9077BB5_5
X-Control-Analysis: str=0001.0A682F25.67A4C97B.0656, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C4B1166522; Thu,  6 Feb 2025 15:38:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1738852727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tDw+wvEmKZCtU2ZRF/kEehWEfxlmuiMVYComcBD/45w=;
 b=X8fmXUjC4Lgtf3FXFF4LWp/8m0fFWa33G1gYWkFRfs5PiTStlYn51WmWvrDyuqjEZq9zAx
 2gVb2OoD+sXRyMmmDgD1sBbmpKrbys+Ya2EB5EEHPrmIgB0HyHYBhSzo0irN+k0xiCl89b
 cyN3WD3Q499cOnv+nnE1uGVJ2CqkBOZ0NtucW4o+RVb9OxbcArqhIBltQ4OOd+JkY3D5ui
 drRC494L3t2RlovFYAJCTPwLSHSak6txuKkmQTvDtgXt1CkKtYyfKoROHVLAYI4k//ihcv
 YkYA5MuYBbweERjzuZT24DFsWPZ3Vx3KXv0ZBbJ0AvZSeC2PyMXgicigddb7Lw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>, Herve Codina <herve.codina@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 4/4] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Date: Thu, 06 Feb 2025 15:38:42 +0100
Message-ID: <3605739.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250203161607.223731-5-herve.codina@bootlin.com>
References: <20250203161607.223731-1-herve.codina@bootlin.com>
 <20250203161607.223731-5-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Montag, 3. Februar 2025, 17:16:06 CET schrieb Herve Codina:
> In some cases observed during ESD tests, the TI SN65DSI83 cannot recover
> from errors by itself. A full restart of the bridge is needed in those
> cases to have the bridge output LVDS signals again.
>=20
> Also, during tests, cases were observed where reading the status of the
> bridge was not even possible. Indeed, in those cases, the bridge stops
> to acknowledge I2C transactions. Only a full reset of the bridge (power
> off/on) brings back the bridge to a functional state.
>=20
> The TI SN65DSI83 has some error detection capabilities. Introduce an
> error recovery mechanism based on this detection.
>=20
> The errors detected are signaled through an interrupt. On system where
> this interrupt is not available, the driver uses a polling monitoring
> fallback to check for errors. When an error is present or when reading
> the bridge status leads to an I2C failure, the recovery process is
> launched.
>=20
> Restarting the bridge needs to redo the initialization sequence. This
> initialization sequence has to be done with the DSI data lanes driven in
> LP11 state. In order to do that, the recovery process resets the whole
> output path (i.e the path from the encoder to the connector) where the
> bridge is located.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---

With interrupt configured I got the following stack trace upon
reboot/poweroff:

[   91.317264] sn65dsi83 2-002d: reset the pipe
[   91.344093] Unable to handle ke
** replaying previous printk message **
[   91.344093] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000000
[   91.344107] Mem abort info:
[   91.344111]   ESR =3D 0x0000000096000004
[   91.344115]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   91.344120]   SET =3D 0, FnV =3D 0
[   91.344122]   EA =3D 0, S1PTW =3D 0
[   91.344125]   FSC =3D 0x04: level 0 translation fault
[   91.344128] Data abort info:
[   91.344130]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
[   91.344133]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[   91.344136]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[   91.344141] user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000102eec000
[   91.344145] [0000000000000000] pgd=3D0000000000000000, p4d=3D00000000000=
00000
[   91.344155] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[   91.420670] Modules linked in: bluetooth 8021q garp mrp stp llc hid_gene=
ric hantro_vpu snd_soc_fsl_asoc_card snd_soc_fsl_sai snd_soc_imx_audmux snd=
_soc_t
lv320aic32x4_i2c imx_pcm_dma v4l2_vp9 snd_soc_simple_card_utils snd_soc_tlv=
320aic32x4 snd_soc_fsl_utils v4l2_h264 v4l2_jpeg snd_soc_core videobuf2_dma=
_conti
g v4l2_mem2mem videobuf2_memops videobuf2_v4l2 snd_pcm_dmaengine videobuf2_=
common imx8m_ddrc phy_generic snd_pcm ci_hdrc_imx ti_sn65dsi83 ci_hdrc clk_=
renesa
s_pcie mxsfb snd_timer samsung_dsim usbmisc_imx pwm_imx27 snd soundcore spi=
_imx imx_sdma imx8mm_thermal panel_simple gpio_aggregator pwm_beeper cfg802=
11 rfk
ill fuse ipv6
[   91.476291] CPU: 0 UID: 0 PID: 83 Comm: kworker/0:3 Not tainted 6.14.0-r=
c1-next-20250205+ #2906 da26d4e444ec7c54f82096af1ee2c91e843e9303
[   91.488555] Hardware name: TQ-Systems GmbH i.MX8MM TQMa8MxML on MBa8Mx (=
DT)
[   91.495517] Workqueue: events sn65dsi83_reset_work [ti_sn65dsi83]
[   91.501623] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   91.508588] pc : drm_atomic_helper_reset_crtc+0x18/0x100
[   91.513906] lr : sn65dsi83_reset_work+0x80/0x118 [ti_sn65dsi83]
[   91.519832] sp : ffff80008271bcc0
[   91.523146] x29: ffff80008271bcc0 x28: 0000000000000000 x27: 00000000000=
00000
[   91.530288] x26: ffff0000c0d6e340 x25: 0000000000000000 x24: ffff0000c00=
22005
[   91.537432] x23: ffff0000c4cb4248 x22: ffff0000ff736e40 x21: ffff8000827=
1bcf8
[   91.544576] x20: 0000000000000000 x19: 0000000000000000 x18: 00000000000=
00000
[   91.551719] x17: 000000040044ffff x16: 0000000000000000 x15: 00000015425=
993c0
[   91.558860] x14: 0000000000000001 x13: ffff0000c0ece800 x12: 00000000000=
00020
[   91.566004] x11: ffff0000c0ece800 x10: 0000000000000af0 x9 : ffff8000827=
1ba70
[   91.573147] x8 : ffff0000c0ecf2d0 x7 : ffff0000c0ece800 x6 : dead0000000=
00122
[   91.580291] x5 : 0000000000000000 x4 : ffff0000c0ece780 x3 : 00000000000=
00000
[   91.587436] x2 : ffff0000c4cb40b8 x1 : ffff80008271bcf8 x0 : 00000000000=
00000
[   91.594580] Call trace:
[   91.597027]  drm_atomic_helper_reset_crtc+0x18/0x100 (P)
[   91.602346]  sn65dsi83_reset_work+0x80/0x118 [ti_sn65dsi83 d96dc31a1413a=
92a7c205a475a2357ddacaa4a3b]
[   91.611485]  process_one_work+0x14c/0x3e0
[   91.615503]  worker_thread+0x2d0/0x3f0
[   91.619257]  kthread+0x110/0x1e0
[   91.622488]  ret_from_fork+0x10/0x20
[   91.626073] Code: a90153f3 aa0003f4 f90013f5 aa0103f5 (f9400000)=20
[   91.632167] ---[ end trace 0000000000000000 ]---

Running with workqueue does not raise this error.

Best regards,
Alexander

>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 131 ++++++++++++++++++++++++++
>  1 file changed, 131 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> index 336380114eea..26a050b13997 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -35,9 +35,12 @@
>  #include <linux/of_graph.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/timer.h>
> +#include <linux/workqueue.h>
> =20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_drv.h> /* DRM_MODESET_LOCK_ALL_BEGIN() needs drm_drv_u=
ses_atomic_modeset() */
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -159,6 +162,9 @@ struct sn65dsi83 {
>  	bool				lvds_dual_link_even_odd_swap;
>  	int				lvds_vod_swing_conf[2];
>  	int				lvds_term_conf[2];
> +	int				irq;
> +	struct delayed_work		monitor_work;
> +	struct work_struct		reset_work;
>  };
> =20
>  static const struct regmap_range sn65dsi83_readable_ranges[] =3D {
> @@ -363,6 +369,95 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ct=
x)
>  	return dsi_div - 1;
>  }
> =20
> +static int sn65dsi83_reset_pipe(struct sn65dsi83 *sn65dsi83)
> +{
> +	struct drm_device *dev =3D sn65dsi83->bridge.dev;
> +	struct drm_modeset_acquire_ctx ctx;
> +	int err;
> +
> +	/*
> +	 * Reset active outputs of the related CRTC.
> +	 *
> +	 * This way, drm core will reconfigure each components in the CRTC
> +	 * outputs path. In our case, this will force the previous component to
> +	 * go back in LP11 mode and so allow the reconfiguration of SN64DSI83
> +	 * bridge.
> +	 *
> +	 * Keep the lock during the whole operation to be atomic.
> +	 */
> +
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> +
> +	err =3D drm_atomic_helper_reset_crtc(sn65dsi83->bridge.encoder->crtc, &=
ctx);
> +
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
> +
> +	return err;
> +}
> +
> +static void sn65dsi83_reset_work(struct work_struct *ws)
> +{
> +	struct sn65dsi83 *ctx =3D container_of(ws, struct sn65dsi83, reset_work=
);
> +	int ret;
> +
> +	dev_warn(ctx->dev, "reset the pipe\n");
> +
> +	/* Reset the pipe */
> +	ret =3D sn65dsi83_reset_pipe(ctx);
> +	if (ret) {
> +		dev_err(ctx->dev, "reset pipe failed %pe\n", ERR_PTR(ret));
> +		return;
> +	}
> +	if (ctx->irq)
> +		enable_irq(ctx->irq);
> +}
> +
> +static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
> +{
> +	unsigned int irq_stat;
> +	int ret;
> +
> +	/*
> +	 * Schedule a reset in case of:
> +	 *  - the bridge doesn't answer
> +	 *  - the bridge signals an error
> +	 */
> +
> +	ret =3D regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
> +	if (ret || irq_stat) {
> +		/*
> +		 * IRQ acknowledged is not always possible (the bridge can be in
> +		 * a state where it doesn't answer anymore). To prevent an
> +		 * interrupt storm, disable interrupt. The interrupt will be
> +		 * after the reset.
> +		 */
> +		if (ctx->irq)
> +			disable_irq_nosync(ctx->irq);
> +
> +		schedule_work(&ctx->reset_work);
> +	}
> +}
> +
> +static void sn65dsi83_monitor_work(struct work_struct *work)
> +{
> +	struct sn65dsi83 *ctx =3D container_of(to_delayed_work(work),
> +					     struct sn65dsi83, monitor_work);
> +
> +	sn65dsi83_handle_errors(ctx);
> +
> +	schedule_delayed_work(&ctx->monitor_work, msecs_to_jiffies(1000));
> +}
> +
> +static void sn65dsi83_monitor_start(struct sn65dsi83 *ctx)
> +{
> +	schedule_delayed_work(&ctx->monitor_work, msecs_to_jiffies(1000));
> +}
> +
> +static void sn65dsi83_monitor_stop(struct sn65dsi83 *ctx)
> +{
> +	cancel_delayed_work_sync(&ctx->monitor_work);
> +}
> +
>  static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
>  					struct drm_bridge_state *old_bridge_state)
>  {
> @@ -549,6 +644,15 @@ static void sn65dsi83_atomic_enable(struct drm_bridg=
e *bridge,
>  	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>  	if (pval)
>  		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
> +
> +	if (ctx->irq) {
> +		/* Enable irq to detect errors */
> +		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, REG_IRQ_GLOBAL_IRQ_EN);
> +		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff);
> +	} else {
> +		/* Use the polling task */
> +		sn65dsi83_monitor_start(ctx);
> +	}
>  }
> =20
>  static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
> @@ -557,6 +661,15 @@ static void sn65dsi83_atomic_disable(struct drm_brid=
ge *bridge,
>  	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
>  	int ret;
> =20
> +	if (ctx->irq) {
> +		/* Disable irq */
> +		regmap_write(ctx->regmap, REG_IRQ_EN, 0x0);
> +		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, 0x0);
> +	} else {
> +		/* Stop the polling task */
> +		sn65dsi83_monitor_stop(ctx);
> +	}
> +
>  	/* Put the chip in reset, pull EN line low, and assure 10ms reset low t=
iming. */
>  	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
>  	usleep_range(10000, 11000);
> @@ -806,6 +919,14 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *c=
tx)
>  	return 0;
>  }
> =20
> +static irqreturn_t sn65dsi83_irq(int irq, void *data)
> +{
> +	struct sn65dsi83 *ctx =3D data;
> +
> +	sn65dsi83_handle_errors(ctx);
> +	return IRQ_HANDLED;
> +}
> +
>  static int sn65dsi83_probe(struct i2c_client *client)
>  {
>  	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
> @@ -819,6 +940,8 @@ static int sn65dsi83_probe(struct i2c_client *client)
>  		return -ENOMEM;
> =20
>  	ctx->dev =3D dev;
> +	INIT_WORK(&ctx->reset_work, sn65dsi83_reset_work);
> +	INIT_DELAYED_WORK(&ctx->monitor_work, sn65dsi83_monitor_work);
> =20
>  	if (dev->of_node) {
>  		model =3D (enum sn65dsi83_model)(uintptr_t)
> @@ -843,6 +966,14 @@ static int sn65dsi83_probe(struct i2c_client *client)
>  	if (IS_ERR(ctx->regmap))
>  		return dev_err_probe(dev, PTR_ERR(ctx->regmap), "failed to get regmap\=
n");
> =20
> +	if (client->irq) {
> +		ctx->irq =3D client->irq;
> +		ret =3D devm_request_threaded_irq(ctx->dev, ctx->irq, NULL, sn65dsi83_=
irq,
> +						IRQF_ONESHOT, dev_name(ctx->dev), ctx);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to request irq\n");
> +	}
> +
>  	dev_set_drvdata(dev, ctx);
>  	i2c_set_clientdata(client, ctx);
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


