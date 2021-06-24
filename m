Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4608E3B2A75
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 10:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEA06EB19;
	Thu, 24 Jun 2021 08:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AA16EB19
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 08:34:30 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lwKg5-0005gL-Pp; Thu, 24 Jun 2021 10:25:37 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lwKfk-0005je-QP; Thu, 24 Jun 2021 10:25:16 +0200
Message-ID: <2c06d7eab5a20191723eb1d9a8027978342c66e9.camel@pengutronix.de>
Subject: Re: [PATCH v3 11/27] drm/imx: Don't set struct drm_device.irq_enabled
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie,  alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com,  james.qian.wang@arm.com, liviu.dudau@arm.com,
 mihail.atanassov@arm.com,  brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, 
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com, 
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org, 
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, 
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 linux-imx@nxp.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com, 
 bskeggs@redhat.com, tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de, 
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com, 
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, 
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net,  linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com,  laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com,  jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk, 
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com, 
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Date: Thu, 24 Jun 2021 10:25:16 +0200
In-Reply-To: <20210624072916.27703-12-tzimmermann@suse.de>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-12-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-06-24 at 09:29 +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in imx.
>=20
> v3:
> 	* move dcss changes into separate patch (Laurentiu)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/imx/imx-drm-core.c | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx=
-drm-core.c
> index 76819a8ac37f..9558e9e1b431 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -207,17 +207,6 @@ static int imx_drm_bind(struct device *dev)
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
> =20
> -	/*
> -	 * enable drm irq mode.
> -	 * - with irq_enabled =3D true, we can use the vblank feature.
> -	 *
> -	 * P.S. note that we wouldn't use drm irq handler but
> -	 *      just specific driver own one instead because
> -	 *      drm framework supports only one irq handler and
> -	 *      drivers can well take care of their interrupts
> -	 */
> -	drm->irq_enabled =3D true;
> -
>  	/*
>  	 * set max width and height as default value(4096x4096).
>  	 * this value would be used to check framebuffer size limitation

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
