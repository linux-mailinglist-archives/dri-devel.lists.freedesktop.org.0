Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002EB2D9854
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 13:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A5489ABE;
	Mon, 14 Dec 2020 12:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBEC89ABE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 12:54:02 +0000 (UTC)
Date: Mon, 14 Dec 2020 13:54:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607950442;
 bh=DTqrqIOLCwoBrw5fYOWa55MhwQeU4KrgHCeyTN3EAxo=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=LIejV2/qrFAHHhgyWxlZsVBrtGWEbTXW+34baVLS8TlkJVHdDZBvdU5OhnaelTvPb
 oQnuc/l16wKFqWCX8Zy7d0D40KPEVXHWAu0qheMKXr0CpPFPrJgl1zz4wXpxWrx2io
 SVfBYstkpfqWt2Q324bPDnhU31XU861ohp3I8n6rnIPd7TWjcmQwS7iy4z8WkJGXhl
 KnKdQcff+rd/SiMJuvw865gMauDWkOJ0ICkznyd9PO9xqvhaFHhH9VuetoKr8eKY5D
 ZzvuJd04o8kUDBEbzOjqVipI3bW8l0RAYkkz2ZdGAMbOeZ9sXf4XIfUv7hpOMPkfHk
 hJJUf1hb3HQ0w==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 53/80] drm/omap: remove dispc_ops
Message-ID: <20201214125400.h3qbulsf3uwstb4q@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-54-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201124124538.660710-54-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============0947091421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0947091421==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xjl5e2swurlwubjh"
Content-Disposition: inline


--xjl5e2swurlwubjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:11PM +0200, Tomi Valkeinen wrote:
> dispc_ops was created to help with the multi-module architecture and
> giving us the possibility of multiple dispc implementations. Neither of
> these is valid anymore, and we can remove dispc_ops and use direct
> calls to dispc.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/base.c    |   5 --
>  drivers/gpu/drm/omapdrm/dss/dispc.c   | 101 +++++++-------------------
>  drivers/gpu/drm/omapdrm/dss/dss.h     |  71 +++++++++++++++++-
>  drivers/gpu/drm/omapdrm/dss/omapdss.h |  71 ------------------
>  drivers/gpu/drm/omapdrm/omap_crtc.c   |  30 ++++----
>  drivers/gpu/drm/omapdrm/omap_drv.c    |  15 ++--
>  drivers/gpu/drm/omapdrm/omap_drv.h    |   2 +-
>  drivers/gpu/drm/omapdrm/omap_irq.c    |  34 ++++-----
>  drivers/gpu/drm/omapdrm/omap_plane.c  |  12 +--
>  9 files changed, 143 insertions(+), 198 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm=
/dss/base.c
> index 6c57d9292415..ee71b05ef567 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -21,11 +21,6 @@ struct dispc_device *dispc_get_dispc(struct dss_device=
 *dss)
>  	return dss->dispc;
>  }
> =20
> -const struct dispc_ops *dispc_get_ops(struct dss_device *dss)
> -{
> -	return dss->dispc_ops;
> -}
> -
>  /* ---------------------------------------------------------------------=
--------
>   * OMAP DSS Devices Handling
>   */
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdr=
m/dss/dispc.c
> index 48593932bddf..509bac99cb57 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -351,8 +351,6 @@ static unsigned long dispc_plane_pclk_rate(struct dis=
pc_device *dispc,
>  static unsigned long dispc_plane_lclk_rate(struct dispc_device *dispc,
>  					   enum omap_plane_id plane);
> =20
> -static void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask);
> -
>  static inline void dispc_write_reg(struct dispc_device *dispc, u16 idx, =
u32 val)
>  {
>  	__raw_writel(val, dispc->base + idx);
> @@ -379,12 +377,12 @@ static void mgr_fld_write(struct dispc_device *disp=
c, enum omap_channel channel,
>  	REG_FLD_MOD(dispc, rfld->reg, val, rfld->high, rfld->low);
>  }
> =20
> -static int dispc_get_num_ovls(struct dispc_device *dispc)
> +int dispc_get_num_ovls(struct dispc_device *dispc)
>  {
>  	return dispc->feat->num_ovls;
>  }
> =20
> -static int dispc_get_num_mgrs(struct dispc_device *dispc)
> +int dispc_get_num_mgrs(struct dispc_device *dispc)
>  {
>  	return dispc->feat->num_mgrs;
>  }
> @@ -667,13 +665,13 @@ void dispc_runtime_put(struct dispc_device *dispc)
>  	WARN_ON(r < 0 && r !=3D -ENOSYS);
>  }
> =20
> -static u32 dispc_mgr_get_vsync_irq(struct dispc_device *dispc,
> +u32 dispc_mgr_get_vsync_irq(struct dispc_device *dispc,
>  				   enum omap_channel channel)
>  {
>  	return mgr_desc[channel].vsync_irq;
>  }
> =20
> -static u32 dispc_mgr_get_framedone_irq(struct dispc_device *dispc,
> +u32 dispc_mgr_get_framedone_irq(struct dispc_device *dispc,
>  				       enum omap_channel channel)
>  {
>  	if (channel =3D=3D OMAP_DSS_CHANNEL_DIGIT && dispc->feat->no_framedone_=
tv)
> @@ -682,18 +680,18 @@ static u32 dispc_mgr_get_framedone_irq(struct dispc=
_device *dispc,
>  	return mgr_desc[channel].framedone_irq;
>  }
> =20
> -static u32 dispc_mgr_get_sync_lost_irq(struct dispc_device *dispc,
> +u32 dispc_mgr_get_sync_lost_irq(struct dispc_device *dispc,
>  				       enum omap_channel channel)
>  {
>  	return mgr_desc[channel].sync_lost_irq;
>  }
> =20
> -static u32 dispc_wb_get_framedone_irq(struct dispc_device *dispc)
> +u32 dispc_wb_get_framedone_irq(struct dispc_device *dispc)
>  {
>  	return DISPC_IRQ_FRAMEDONEWB;
>  }
> =20
> -static void dispc_mgr_enable(struct dispc_device *dispc,
> +void dispc_mgr_enable(struct dispc_device *dispc,
>  			     enum omap_channel channel, bool enable)
>  {
>  	mgr_fld_write(dispc, channel, DISPC_MGR_FLD_ENABLE, enable);
> @@ -707,13 +705,13 @@ static bool dispc_mgr_is_enabled(struct dispc_devic=
e *dispc,
>  	return !!mgr_fld_read(dispc, channel, DISPC_MGR_FLD_ENABLE);
>  }
> =20
> -static bool dispc_mgr_go_busy(struct dispc_device *dispc,
> +bool dispc_mgr_go_busy(struct dispc_device *dispc,
>  			      enum omap_channel channel)
>  {
>  	return mgr_fld_read(dispc, channel, DISPC_MGR_FLD_GO) =3D=3D 1;
>  }
> =20
> -static void dispc_mgr_go(struct dispc_device *dispc, enum omap_channel c=
hannel)
> +void dispc_mgr_go(struct dispc_device *dispc, enum omap_channel channel)
>  {
>  	WARN_ON(!dispc_mgr_is_enabled(dispc, channel));
>  	WARN_ON(dispc_mgr_go_busy(dispc, channel));
> @@ -723,12 +721,12 @@ static void dispc_mgr_go(struct dispc_device *dispc=
, enum omap_channel channel)
>  	mgr_fld_write(dispc, channel, DISPC_MGR_FLD_GO, 1);
>  }
> =20
> -static bool dispc_wb_go_busy(struct dispc_device *dispc)
> +bool dispc_wb_go_busy(struct dispc_device *dispc)
>  {
>  	return REG_GET(dispc, DISPC_CONTROL2, 6, 6) =3D=3D 1;
>  }
> =20
> -static void dispc_wb_go(struct dispc_device *dispc)
> +void dispc_wb_go(struct dispc_device *dispc)
>  {
>  	enum omap_plane_id plane =3D OMAP_DSS_WB;
>  	bool enable, go;
> @@ -1282,7 +1280,7 @@ static bool dispc_ovl_color_mode_supported(struct d=
ispc_device *dispc,
>  	return false;
>  }
> =20
> -static const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
> +const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
>  					    enum omap_plane_id plane)
>  {
>  	return dispc->feat->supported_color_modes[plane];
> @@ -2761,7 +2759,7 @@ static int dispc_ovl_setup_common(struct dispc_devi=
ce *dispc,
>  	return 0;
>  }
> =20
> -static int dispc_ovl_setup(struct dispc_device *dispc,
> +int dispc_ovl_setup(struct dispc_device *dispc,
>  			   enum omap_plane_id plane,
>  			   const struct omap_overlay_info *oi,
>  			   const struct videomode *vm, bool mem_to_mem,
> @@ -2788,7 +2786,7 @@ static int dispc_ovl_setup(struct dispc_device *dis=
pc,
>  	return r;
>  }
> =20
> -static int dispc_wb_setup(struct dispc_device *dispc,
> +int dispc_wb_setup(struct dispc_device *dispc,
>  		   const struct omap_dss_writeback_info *wi,
>  		   bool mem_to_mem, const struct videomode *vm,
>  		   enum dss_writeback_channel channel_in)
> @@ -2871,12 +2869,12 @@ static int dispc_wb_setup(struct dispc_device *di=
spc,
>  	return 0;
>  }
> =20
> -static bool dispc_has_writeback(struct dispc_device *dispc)
> +bool dispc_has_writeback(struct dispc_device *dispc)
>  {
>  	return dispc->feat->has_writeback;
>  }
> =20
> -static int dispc_ovl_enable(struct dispc_device *dispc,
> +int dispc_ovl_enable(struct dispc_device *dispc,
>  			    enum omap_plane_id plane, bool enable)
>  {
>  	DSSDBG("dispc_enable_plane %d, %d\n", plane, enable);
> @@ -2967,7 +2965,7 @@ static void dispc_mgr_enable_alpha_fixed_zorder(str=
uct dispc_device *dispc,
>  		REG_FLD_MOD(dispc, DISPC_CONFIG, enable, 19, 19);
>  }
> =20
> -static void dispc_mgr_setup(struct dispc_device *dispc,
> +void dispc_mgr_setup(struct dispc_device *dispc,
>  			    enum omap_channel channel,
>  			    const struct omap_overlay_manager_info *info)
>  {
> @@ -3046,7 +3044,7 @@ static void dispc_mgr_enable_stallmode(struct dispc=
_device *dispc,
>  	mgr_fld_write(dispc, channel, DISPC_MGR_FLD_STALLMODE, enable);
>  }
> =20
> -static void dispc_mgr_set_lcd_config(struct dispc_device *dispc,
> +void dispc_mgr_set_lcd_config(struct dispc_device *dispc,
>  				     enum omap_channel channel,
>  				     const struct dss_lcd_mgr_config *config)
>  {
> @@ -3095,7 +3093,7 @@ static bool _dispc_mgr_pclk_ok(struct dispc_device =
*dispc,
>  		return pclk <=3D dispc->feat->max_tv_pclk;
>  }
> =20
> -static int dispc_mgr_check_timings(struct dispc_device *dispc,
> +int dispc_mgr_check_timings(struct dispc_device *dispc,
>  				   enum omap_channel channel,
>  				   const struct videomode *vm)
>  {
> @@ -3188,7 +3186,7 @@ static int vm_flag_to_int(enum display_flags flags,=
 enum display_flags high,
>  }
> =20
>  /* change name to mode? */
> -static void dispc_mgr_set_timings(struct dispc_device *dispc,
> +void dispc_mgr_set_timings(struct dispc_device *dispc,
>  				  enum omap_channel channel,
>  				  const struct videomode *vm)
>  {
> @@ -3732,17 +3730,17 @@ int dispc_mgr_get_clock_div(struct dispc_device *=
dispc,
>  	return 0;
>  }
> =20
> -static u32 dispc_read_irqstatus(struct dispc_device *dispc)
> +u32 dispc_read_irqstatus(struct dispc_device *dispc)
>  {
>  	return dispc_read_reg(dispc, DISPC_IRQSTATUS);
>  }
> =20
> -static void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask)
> +void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask)
>  {
>  	dispc_write_reg(dispc, DISPC_IRQSTATUS, mask);
>  }
> =20
> -static void dispc_write_irqenable(struct dispc_device *dispc, u32 mask)
> +void dispc_write_irqenable(struct dispc_device *dispc, u32 mask)
>  {
>  	u32 old_mask =3D dispc_read_reg(dispc, DISPC_IRQENABLE);
> =20
> @@ -3766,7 +3764,7 @@ void dispc_disable_sidle(struct dispc_device *dispc)
>  	REG_FLD_MOD(dispc, DISPC_SYSCONFIG, 1, 4, 3);	/* SIDLEMODE: no idle */
>  }
> =20
> -static u32 dispc_mgr_gamma_size(struct dispc_device *dispc,
> +u32 dispc_mgr_gamma_size(struct dispc_device *dispc,
>  				enum omap_channel channel)
>  {
>  	const struct dispc_gamma_desc *gdesc =3D &mgr_desc[channel].gamma;
> @@ -3821,7 +3819,7 @@ static const struct drm_color_lut dispc_mgr_gamma_d=
efault_lut[] =3D {
>  	{ .red =3D U16_MAX, .green =3D U16_MAX, .blue =3D U16_MAX, },
>  };
> =20
> -static void dispc_mgr_set_gamma(struct dispc_device *dispc,
> +void dispc_mgr_set_gamma(struct dispc_device *dispc,
>  				enum omap_channel channel,
>  				const struct drm_color_lut *lut,
>  				unsigned int length)
> @@ -4479,7 +4477,7 @@ static irqreturn_t dispc_irq_handler(int irq, void =
*arg)
>  	return dispc->user_handler(irq, dispc->user_data);
>  }
> =20
> -static int dispc_request_irq(struct dispc_device *dispc, irq_handler_t h=
andler,
> +int dispc_request_irq(struct dispc_device *dispc, irq_handler_t handler,
>  			     void *dev_id)
>  {
>  	int r;
> @@ -4503,7 +4501,7 @@ static int dispc_request_irq(struct dispc_device *d=
ispc, irq_handler_t handler,
>  	return r;
>  }
> =20
> -static void dispc_free_irq(struct dispc_device *dispc, void *dev_id)
> +void dispc_free_irq(struct dispc_device *dispc, void *dev_id)
>  {
>  	devm_free_irq(&dispc->pdev->dev, dispc->irq, dispc);
> =20
> @@ -4511,7 +4509,7 @@ static void dispc_free_irq(struct dispc_device *dis=
pc, void *dev_id)
>  	dispc->user_data =3D NULL;
>  }
> =20
> -static u32 dispc_get_memory_bandwidth_limit(struct dispc_device *dispc)
> +u32 dispc_get_memory_bandwidth_limit(struct dispc_device *dispc)
>  {
>  	u32 limit =3D 0;
> =20
> @@ -4681,47 +4679,6 @@ static void dispc_errata_i734_wa(struct dispc_devi=
ce *dispc)
>  	REG_FLD_MOD(dispc, DISPC_CONFIG, gatestate, 8, 4);
>  }
> =20
> -static const struct dispc_ops dispc_ops =3D {
> -	.read_irqstatus =3D dispc_read_irqstatus,
> -	.clear_irqstatus =3D dispc_clear_irqstatus,
> -	.write_irqenable =3D dispc_write_irqenable,
> -
> -	.request_irq =3D dispc_request_irq,
> -	.free_irq =3D dispc_free_irq,
> -
> -	.runtime_get =3D dispc_runtime_get,
> -	.runtime_put =3D dispc_runtime_put,
> -
> -	.get_num_ovls =3D dispc_get_num_ovls,
> -	.get_num_mgrs =3D dispc_get_num_mgrs,
> -
> -	.get_memory_bandwidth_limit =3D dispc_get_memory_bandwidth_limit,
> -
> -	.mgr_enable =3D dispc_mgr_enable,
> -	.mgr_is_enabled =3D dispc_mgr_is_enabled,
> -	.mgr_get_vsync_irq =3D dispc_mgr_get_vsync_irq,
> -	.mgr_get_framedone_irq =3D dispc_mgr_get_framedone_irq,
> -	.mgr_get_sync_lost_irq =3D dispc_mgr_get_sync_lost_irq,
> -	.mgr_go_busy =3D dispc_mgr_go_busy,
> -	.mgr_go =3D dispc_mgr_go,
> -	.mgr_set_lcd_config =3D dispc_mgr_set_lcd_config,
> -	.mgr_check_timings =3D dispc_mgr_check_timings,
> -	.mgr_set_timings =3D dispc_mgr_set_timings,
> -	.mgr_setup =3D dispc_mgr_setup,
> -	.mgr_gamma_size =3D dispc_mgr_gamma_size,
> -	.mgr_set_gamma =3D dispc_mgr_set_gamma,
> -
> -	.ovl_enable =3D dispc_ovl_enable,
> -	.ovl_setup =3D dispc_ovl_setup,
> -	.ovl_get_color_modes =3D dispc_ovl_get_color_modes,
> -
> -	.wb_get_framedone_irq =3D dispc_wb_get_framedone_irq,
> -	.wb_setup =3D dispc_wb_setup,
> -	.has_writeback =3D dispc_has_writeback,
> -	.wb_go_busy =3D dispc_wb_go_busy,
> -	.wb_go =3D dispc_wb_go,
> -};
> -
>  /* DISPC HW IP initialisation */
>  static const struct of_device_id dispc_of_match[] =3D {
>  	{ .compatible =3D "ti,omap2-dispc", .data =3D &omap24xx_dispc_feats },
> @@ -4823,7 +4780,6 @@ static int dispc_bind(struct device *dev, struct de=
vice *master, void *data)
>  	dispc_runtime_put(dispc);
> =20
>  	dss->dispc =3D dispc;
> -	dss->dispc_ops =3D &dispc_ops;
> =20
>  	dispc->debugfs =3D dss_debugfs_create_file(dss, "dispc", dispc_dump_reg=
s,
>  						 dispc);
> @@ -4845,7 +4801,6 @@ static void dispc_unbind(struct device *dev, struct=
 device *master, void *data)
>  	dss_debugfs_remove_file(dispc->debugfs);
> =20
>  	dss->dispc =3D NULL;
> -	dss->dispc_ops =3D NULL;
> =20
>  	pm_runtime_disable(dev);
> =20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/=
dss/dss.h
> index 2b404bcb41dd..96f702314c8c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.h
> @@ -257,7 +257,6 @@ struct dss_device {
>  	struct dss_pll	*video2_pll;
> =20
>  	struct dispc_device *dispc;
> -	const struct dispc_ops *dispc_ops;
>  	const struct dss_mgr_ops *mgr_ops;
>  	struct omap_drm_private *mgr_ops_priv;
>  };
> @@ -393,6 +392,76 @@ void dispc_dump_clocks(struct dispc_device *dispc, s=
truct seq_file *s);
>  int dispc_runtime_get(struct dispc_device *dispc);
>  void dispc_runtime_put(struct dispc_device *dispc);
> =20
> +int dispc_get_num_ovls(struct dispc_device *dispc);
> +int dispc_get_num_mgrs(struct dispc_device *dispc);
> +
> +const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
> +					    enum omap_plane_id plane);
> +
> +u32 dispc_read_irqstatus(struct dispc_device *dispc);
> +void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask);
> +void dispc_write_irqenable(struct dispc_device *dispc, u32 mask);
> +
> +int dispc_request_irq(struct dispc_device *dispc, irq_handler_t handler,
> +			     void *dev_id);
> +void dispc_free_irq(struct dispc_device *dispc, void *dev_id);
> +
> +u32 dispc_mgr_get_vsync_irq(struct dispc_device *dispc,
> +				   enum omap_channel channel);
> +u32 dispc_mgr_get_framedone_irq(struct dispc_device *dispc,
> +				       enum omap_channel channel);
> +u32 dispc_mgr_get_sync_lost_irq(struct dispc_device *dispc,
> +				       enum omap_channel channel);
> +u32 dispc_wb_get_framedone_irq(struct dispc_device *dispc);
> +
> +u32 dispc_get_memory_bandwidth_limit(struct dispc_device *dispc);
> +
> +void dispc_mgr_enable(struct dispc_device *dispc,
> +			     enum omap_channel channel, bool enable);
> +
> +bool dispc_mgr_go_busy(struct dispc_device *dispc,
> +			      enum omap_channel channel);
> +
> +void dispc_mgr_go(struct dispc_device *dispc, enum omap_channel channel);
> +
> +void dispc_mgr_set_lcd_config(struct dispc_device *dispc,
> +				     enum omap_channel channel,
> +				     const struct dss_lcd_mgr_config *config);
> +void dispc_mgr_set_timings(struct dispc_device *dispc,
> +				  enum omap_channel channel,
> +				  const struct videomode *vm);
> +void dispc_mgr_setup(struct dispc_device *dispc,
> +			    enum omap_channel channel,
> +			    const struct omap_overlay_manager_info *info);
> +
> +int dispc_mgr_check_timings(struct dispc_device *dispc,
> +				   enum omap_channel channel,
> +				   const struct videomode *vm);
> +
> +u32 dispc_mgr_gamma_size(struct dispc_device *dispc,
> +				enum omap_channel channel);
> +void dispc_mgr_set_gamma(struct dispc_device *dispc,
> +				enum omap_channel channel,
> +				const struct drm_color_lut *lut,
> +				unsigned int length);
> +
> +int dispc_ovl_setup(struct dispc_device *dispc,
> +			   enum omap_plane_id plane,
> +			   const struct omap_overlay_info *oi,
> +			   const struct videomode *vm, bool mem_to_mem,
> +			   enum omap_channel channel);
> +
> +int dispc_ovl_enable(struct dispc_device *dispc,
> +			    enum omap_plane_id plane, bool enable);
> +
> +bool dispc_has_writeback(struct dispc_device *dispc);
> +int dispc_wb_setup(struct dispc_device *dispc,
> +		   const struct omap_dss_writeback_info *wi,
> +		   bool mem_to_mem, const struct videomode *vm,
> +		   enum dss_writeback_channel channel_in);
> +bool dispc_wb_go_busy(struct dispc_device *dispc);
> +void dispc_wb_go(struct dispc_device *dispc);
> +
>  void dispc_enable_sidle(struct dispc_device *dispc);
>  void dispc_disable_sidle(struct dispc_device *dispc);
> =20
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omap=
drm/dss/omapdss.h
> index 4442e49ffc5c..fba5f05e5e48 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -376,78 +376,7 @@ int dss_mgr_register_framedone_handler(struct omap_d=
ss_device *dssdev,
>  void dss_mgr_unregister_framedone_handler(struct omap_dss_device *dssdev,
>  		void (*handler)(void *), void *data);
> =20
> -/* dispc ops */
> -
> -struct dispc_ops {
> -	u32 (*read_irqstatus)(struct dispc_device *dispc);
> -	void (*clear_irqstatus)(struct dispc_device *dispc, u32 mask);
> -	void (*write_irqenable)(struct dispc_device *dispc, u32 mask);
> -
> -	int (*request_irq)(struct dispc_device *dispc, irq_handler_t handler,
> -			   void *dev_id);
> -	void (*free_irq)(struct dispc_device *dispc, void *dev_id);
> -
> -	int (*runtime_get)(struct dispc_device *dispc);
> -	void (*runtime_put)(struct dispc_device *dispc);
> -
> -	int (*get_num_ovls)(struct dispc_device *dispc);
> -	int (*get_num_mgrs)(struct dispc_device *dispc);
> -
> -	u32 (*get_memory_bandwidth_limit)(struct dispc_device *dispc);
> -
> -	void (*mgr_enable)(struct dispc_device *dispc,
> -			   enum omap_channel channel, bool enable);
> -	bool (*mgr_is_enabled)(struct dispc_device *dispc,
> -			       enum omap_channel channel);
> -	u32 (*mgr_get_vsync_irq)(struct dispc_device *dispc,
> -				 enum omap_channel channel);
> -	u32 (*mgr_get_framedone_irq)(struct dispc_device *dispc,
> -				     enum omap_channel channel);
> -	u32 (*mgr_get_sync_lost_irq)(struct dispc_device *dispc,
> -				     enum omap_channel channel);
> -	bool (*mgr_go_busy)(struct dispc_device *dispc,
> -			    enum omap_channel channel);
> -	void (*mgr_go)(struct dispc_device *dispc, enum omap_channel channel);
> -	void (*mgr_set_lcd_config)(struct dispc_device *dispc,
> -				   enum omap_channel channel,
> -				   const struct dss_lcd_mgr_config *config);
> -	int (*mgr_check_timings)(struct dispc_device *dispc,
> -				 enum omap_channel channel,
> -				 const struct videomode *vm);
> -	void (*mgr_set_timings)(struct dispc_device *dispc,
> -				enum omap_channel channel,
> -				const struct videomode *vm);
> -	void (*mgr_setup)(struct dispc_device *dispc, enum omap_channel channel,
> -			  const struct omap_overlay_manager_info *info);
> -	u32 (*mgr_gamma_size)(struct dispc_device *dispc,
> -			      enum omap_channel channel);
> -	void (*mgr_set_gamma)(struct dispc_device *dispc,
> -			      enum omap_channel channel,
> -			      const struct drm_color_lut *lut,
> -			      unsigned int length);
> -
> -	int (*ovl_enable)(struct dispc_device *dispc, enum omap_plane_id plane,
> -			  bool enable);
> -	int (*ovl_setup)(struct dispc_device *dispc, enum omap_plane_id plane,
> -			 const struct omap_overlay_info *oi,
> -			 const struct videomode *vm, bool mem_to_mem,
> -			 enum omap_channel channel);
> -
> -	const u32 *(*ovl_get_color_modes)(struct dispc_device *dispc,
> -					  enum omap_plane_id plane);
> -
> -	u32 (*wb_get_framedone_irq)(struct dispc_device *dispc);
> -	int (*wb_setup)(struct dispc_device *dispc,
> -		const struct omap_dss_writeback_info *wi,
> -		bool mem_to_mem, const struct videomode *vm,
> -		enum dss_writeback_channel channel_in);
> -	bool (*has_writeback)(struct dispc_device *dispc);
> -	bool (*wb_go_busy)(struct dispc_device *dispc);
> -	void (*wb_go)(struct dispc_device *dispc);
> -};
> -
>  struct dispc_device *dispc_get_dispc(struct dss_device *dss);
> -const struct dispc_ops *dispc_get_ops(struct dss_device *dss);
> =20
>  bool omapdss_stack_is_ready(void);
>  void omapdss_gather_components(struct device *dev);
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdr=
m/omap_crtc.c
> index 5ab557c477ef..0bf5cef579b5 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -103,7 +103,7 @@ int omap_crtc_wait_pending(struct drm_crtc *crtc)
>  static void omap_crtc_dss_start_update(struct omap_drm_private *priv,
>  				       enum omap_channel channel)
>  {
> -	priv->dispc_ops->mgr_enable(priv->dispc, channel, true);
> +	dispc_mgr_enable(priv->dispc, channel, true);
>  }
> =20
>  /* Called only from the encoder enable/disable and suspend/resume handle=
rs. */
> @@ -128,7 +128,7 @@ static void omap_crtc_set_enabled(struct drm_crtc *cr=
tc, bool enable)
>  	}
> =20
>  	if (omap_crtc->pipe->output->type =3D=3D OMAP_DISPLAY_TYPE_HDMI) {
> -		priv->dispc_ops->mgr_enable(priv->dispc, channel, enable);
> +		dispc_mgr_enable(priv->dispc, channel, enable);
>  		omap_crtc->enabled =3D enable;
>  		return;
>  	}
> @@ -141,9 +141,9 @@ static void omap_crtc_set_enabled(struct drm_crtc *cr=
tc, bool enable)
>  		omap_crtc->ignore_digit_sync_lost =3D true;
>  	}
> =20
> -	framedone_irq =3D priv->dispc_ops->mgr_get_framedone_irq(priv->dispc,
> +	framedone_irq =3D dispc_mgr_get_framedone_irq(priv->dispc,
>  							       channel);
> -	vsync_irq =3D priv->dispc_ops->mgr_get_vsync_irq(priv->dispc, channel);
> +	vsync_irq =3D dispc_mgr_get_vsync_irq(priv->dispc, channel);
> =20
>  	if (enable) {
>  		wait =3D omap_irq_wait_init(dev, vsync_irq, 1);
> @@ -163,7 +163,7 @@ static void omap_crtc_set_enabled(struct drm_crtc *cr=
tc, bool enable)
>  			wait =3D omap_irq_wait_init(dev, vsync_irq, 2);
>  	}
> =20
> -	priv->dispc_ops->mgr_enable(priv->dispc, channel, enable);
> +	dispc_mgr_enable(priv->dispc, channel, enable);
>  	omap_crtc->enabled =3D enable;
> =20
>  	ret =3D omap_irq_wait(dev, wait, msecs_to_jiffies(100));
> @@ -186,7 +186,7 @@ static int omap_crtc_dss_enable(struct omap_drm_priva=
te *priv,
>  	struct drm_crtc *crtc =3D priv->channels[channel]->crtc;
>  	struct omap_crtc *omap_crtc =3D to_omap_crtc(crtc);
> =20
> -	priv->dispc_ops->mgr_set_timings(priv->dispc, omap_crtc->channel,
> +	dispc_mgr_set_timings(priv->dispc, omap_crtc->channel,
>  					 &omap_crtc->vm);
>  	omap_crtc_set_enabled(&omap_crtc->base, true);
> =20
> @@ -221,7 +221,7 @@ static void omap_crtc_dss_set_lcd_config(struct omap_=
drm_private *priv,
>  	struct omap_crtc *omap_crtc =3D to_omap_crtc(crtc);
> =20
>  	DBG("%s", omap_crtc->name);
> -	priv->dispc_ops->mgr_set_lcd_config(priv->dispc, omap_crtc->channel,
> +	dispc_mgr_set_lcd_config(priv->dispc, omap_crtc->channel,
>  					    config);
>  }
> =20
> @@ -300,7 +300,7 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
>  	 * If the dispc is busy we're racing the flush operation. Try again on
>  	 * the next vblank interrupt.
>  	 */
> -	if (priv->dispc_ops->mgr_go_busy(priv->dispc, omap_crtc->channel)) {
> +	if (dispc_mgr_go_busy(priv->dispc, omap_crtc->channel)) {
>  		spin_unlock(&crtc->dev->event_lock);
>  		return;
>  	}
> @@ -391,7 +391,7 @@ static void omap_crtc_write_crtc_properties(struct dr=
m_crtc *crtc)
>  	info.partial_alpha_enabled =3D false;
>  	info.cpr_enable =3D false;
> =20
> -	priv->dispc_ops->mgr_setup(priv->dispc, omap_crtc->channel, &info);
> +	dispc_mgr_setup(priv->dispc, omap_crtc->channel, &info);
>  }
> =20
>  /* ---------------------------------------------------------------------=
--------
> @@ -432,7 +432,7 @@ static void omap_crtc_atomic_enable(struct drm_crtc *=
crtc,
> =20
>  	DBG("%s", omap_crtc->name);
> =20
> -	priv->dispc_ops->runtime_get(priv->dispc);
> +	dispc_runtime_get(priv->dispc);
> =20
>  	/* manual updated display will not trigger vsync irq */
>  	if (omap_state->manually_updated)
> @@ -471,7 +471,7 @@ static void omap_crtc_atomic_disable(struct drm_crtc =
*crtc,
> =20
>  	drm_crtc_vblank_off(crtc);
> =20
> -	priv->dispc_ops->runtime_put(priv->dispc);
> +	dispc_runtime_put(priv->dispc);
>  }
> =20
>  static enum drm_mode_status omap_crtc_mode_valid(struct drm_crtc *crtc,
> @@ -490,7 +490,7 @@ static enum drm_mode_status omap_crtc_mode_valid(stru=
ct drm_crtc *crtc,
>  	 * proper DISPC mode later.
>  	 */
>  	if (omap_crtc->pipe->output->type !=3D OMAP_DISPLAY_TYPE_DSI) {
> -		r =3D priv->dispc_ops->mgr_check_timings(priv->dispc,
> +		r =3D dispc_mgr_check_timings(priv->dispc,
>  						       omap_crtc->channel,
>  						       &vm);
>  		if (r)
> @@ -605,7 +605,7 @@ static void omap_crtc_atomic_flush(struct drm_crtc *c=
rtc,
>  			length =3D crtc->state->gamma_lut->length /
>  				sizeof(*lut);
>  		}
> -		priv->dispc_ops->mgr_set_gamma(priv->dispc, omap_crtc->channel,
> +		dispc_mgr_set_gamma(priv->dispc, omap_crtc->channel,
>  					       lut, length);
>  	}
> =20
> @@ -630,7 +630,7 @@ static void omap_crtc_atomic_flush(struct drm_crtc *c=
rtc,
>  	WARN_ON(ret !=3D 0);
> =20
>  	spin_lock_irq(&crtc->dev->event_lock);
> -	priv->dispc_ops->mgr_go(priv->dispc, omap_crtc->channel);
> +	dispc_mgr_go(priv->dispc, omap_crtc->channel);
>  	omap_crtc_arm_event(crtc);
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }
> @@ -821,7 +821,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *de=
v,
>  	 * extracted with dispc_mgr_gamma_size(). If it returns 0
>  	 * gamma table is not supported.
>  	 */
> -	if (priv->dispc_ops->mgr_gamma_size(priv->dispc, channel)) {
> +	if (dispc_mgr_gamma_size(priv->dispc, channel)) {
>  		unsigned int gamma_lut_size =3D 256;
> =20
>  		drm_crtc_enable_color_mgmt(crtc, 0, false, gamma_lut_size);
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm=
/omap_drv.c
> index b6ba4a43f217..46cb088c2977 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -69,7 +69,7 @@ static void omap_atomic_commit_tail(struct drm_atomic_s=
tate *old_state)
>  	struct drm_device *dev =3D old_state->dev;
>  	struct omap_drm_private *priv =3D dev->dev_private;
> =20
> -	priv->dispc_ops->runtime_get(priv->dispc);
> +	dispc_runtime_get(priv->dispc);
> =20
>  	/* Apply the atomic update. */
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> @@ -113,7 +113,7 @@ static void omap_atomic_commit_tail(struct drm_atomic=
_state *old_state)
> =20
>  	drm_atomic_helper_cleanup_planes(dev, old_state);
> =20
> -	priv->dispc_ops->runtime_put(priv->dispc);
> +	dispc_runtime_put(priv->dispc);
>  }
> =20
>  static const struct drm_mode_config_helper_funcs omap_mode_config_helper=
_funcs =3D {
> @@ -192,7 +192,7 @@ static int omap_compare_pipelines(const void *a, cons=
t void *b)
>  static int omap_modeset_init_properties(struct drm_device *dev)
>  {
>  	struct omap_drm_private *priv =3D dev->dev_private;
> -	unsigned int num_planes =3D priv->dispc_ops->get_num_ovls(priv->dispc);
> +	unsigned int num_planes =3D dispc_get_num_ovls(priv->dispc);
> =20
>  	priv->zorder_prop =3D drm_property_create_range(dev, 0, "zorder", 0,
>  						      num_planes - 1);
> @@ -221,8 +221,8 @@ static int omap_display_id(struct omap_dss_device *ou=
tput)
>  static int omap_modeset_init(struct drm_device *dev)
>  {
>  	struct omap_drm_private *priv =3D dev->dev_private;
> -	int num_ovls =3D priv->dispc_ops->get_num_ovls(priv->dispc);
> -	int num_mgrs =3D priv->dispc_ops->get_num_mgrs(priv->dispc);
> +	int num_ovls =3D dispc_get_num_ovls(priv->dispc);
> +	int num_mgrs =3D dispc_get_num_mgrs(priv->dispc);
>  	unsigned int i;
>  	int ret;
>  	u32 plane_crtc_mask;
> @@ -580,7 +580,6 @@ static int omapdrm_init(struct omap_drm_private *priv=
, struct device *dev)
>  	priv->dev =3D dev;
>  	priv->dss =3D pdata->dss;
>  	priv->dispc =3D dispc_get_dispc(priv->dss);
> -	priv->dispc_ops =3D dispc_get_ops(priv->dss);
> =20
>  	omap_crtc_pre_init(priv);
> =20
> @@ -592,9 +591,7 @@ static int omapdrm_init(struct omap_drm_private *priv=
, struct device *dev)
>  	INIT_LIST_HEAD(&priv->obj_list);
> =20
>  	/* Get memory bandwidth limits */
> -	if (priv->dispc_ops->get_memory_bandwidth_limit)
> -		priv->max_bandwidth =3D
> -			priv->dispc_ops->get_memory_bandwidth_limit(priv->dispc);
> +	priv->max_bandwidth =3D dispc_get_memory_bandwidth_limit(priv->dispc);
> =20
>  	omap_gem_init(ddev);
> =20
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm=
/omap_drv.h
> index 93d171ffd26d..6e69358f624c 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
> @@ -12,6 +12,7 @@
>  #include <linux/workqueue.h>
> =20
>  #include "dss/omapdss.h"
> +#include "dss/dss.h"
> =20
>  #include <drm/drm_gem.h>
>  #include <drm/omap_drm.h>
> @@ -46,7 +47,6 @@ struct omap_drm_private {
> =20
>  	struct dss_device *dss;
>  	struct dispc_device *dispc;
> -	const struct dispc_ops *dispc_ops;
> =20
>  	unsigned int num_pipes;
>  	struct omap_drm_pipeline pipes[8];
> diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm=
/omap_irq.c
> index 382bcdc72ac0..981387220765 100644
> --- a/drivers/gpu/drm/omapdrm/omap_irq.c
> +++ b/drivers/gpu/drm/omapdrm/omap_irq.c
> @@ -29,7 +29,7 @@ static void omap_irq_update(struct drm_device *dev)
> =20
>  	DBG("irqmask=3D%08x", irqmask);
> =20
> -	priv->dispc_ops->write_irqenable(priv->dispc, irqmask);
> +	dispc_write_irqenable(priv->dispc, irqmask);
>  }
> =20
>  static void omap_irq_wait_handler(struct omap_irq_wait *wait)
> @@ -83,7 +83,7 @@ int omap_irq_enable_framedone(struct drm_crtc *crtc, bo=
ol enable)
>  	unsigned long flags;
>  	enum omap_channel channel =3D omap_crtc_channel(crtc);
>  	int framedone_irq =3D
> -		priv->dispc_ops->mgr_get_framedone_irq(priv->dispc, channel);
> +		dispc_mgr_get_framedone_irq(priv->dispc, channel);
> =20
>  	DBG("dev=3D%p, crtc=3D%u, enable=3D%d", dev, channel, enable);
> =20
> @@ -121,7 +121,7 @@ int omap_irq_enable_vblank(struct drm_crtc *crtc)
>  	DBG("dev=3D%p, crtc=3D%u", dev, channel);
> =20
>  	spin_lock_irqsave(&priv->wait_lock, flags);
> -	priv->irq_mask |=3D priv->dispc_ops->mgr_get_vsync_irq(priv->dispc,
> +	priv->irq_mask |=3D dispc_mgr_get_vsync_irq(priv->dispc,
>  							     channel);
>  	omap_irq_update(dev);
>  	spin_unlock_irqrestore(&priv->wait_lock, flags);
> @@ -148,7 +148,7 @@ void omap_irq_disable_vblank(struct drm_crtc *crtc)
>  	DBG("dev=3D%p, crtc=3D%u", dev, channel);
> =20
>  	spin_lock_irqsave(&priv->wait_lock, flags);
> -	priv->irq_mask &=3D ~priv->dispc_ops->mgr_get_vsync_irq(priv->dispc,
> +	priv->irq_mask &=3D ~dispc_mgr_get_vsync_irq(priv->dispc,
>  							      channel);
>  	omap_irq_update(dev);
>  	spin_unlock_irqrestore(&priv->wait_lock, flags);
> @@ -213,9 +213,9 @@ static irqreturn_t omap_irq_handler(int irq, void *ar=
g)
>  	unsigned int id;
>  	u32 irqstatus;
> =20
> -	irqstatus =3D priv->dispc_ops->read_irqstatus(priv->dispc);
> -	priv->dispc_ops->clear_irqstatus(priv->dispc, irqstatus);
> -	priv->dispc_ops->read_irqstatus(priv->dispc);	/* flush posted write */
> +	irqstatus =3D dispc_read_irqstatus(priv->dispc);
> +	dispc_clear_irqstatus(priv->dispc, irqstatus);
> +	dispc_read_irqstatus(priv->dispc);	/* flush posted write */
> =20
>  	VERB("irqs: %08x", irqstatus);
> =20
> @@ -223,15 +223,15 @@ static irqreturn_t omap_irq_handler(int irq, void *=
arg)
>  		struct drm_crtc *crtc =3D priv->pipes[id].crtc;
>  		enum omap_channel channel =3D omap_crtc_channel(crtc);
> =20
> -		if (irqstatus & priv->dispc_ops->mgr_get_vsync_irq(priv->dispc, channe=
l)) {
> +		if (irqstatus & dispc_mgr_get_vsync_irq(priv->dispc, channel)) {
>  			drm_handle_vblank(dev, id);
>  			omap_crtc_vblank_irq(crtc);
>  		}
> =20
> -		if (irqstatus & priv->dispc_ops->mgr_get_sync_lost_irq(priv->dispc, ch=
annel))
> +		if (irqstatus & dispc_mgr_get_sync_lost_irq(priv->dispc, channel))
>  			omap_crtc_error_irq(crtc, irqstatus);
> =20
> -		if (irqstatus & priv->dispc_ops->mgr_get_framedone_irq(priv->dispc, ch=
annel))
> +		if (irqstatus & dispc_mgr_get_framedone_irq(priv->dispc, channel))
>  			omap_crtc_framedone_irq(crtc, irqstatus);
>  	}
> =20
> @@ -265,7 +265,7 @@ static const u32 omap_underflow_irqs[] =3D {
>  int omap_drm_irq_install(struct drm_device *dev)
>  {
>  	struct omap_drm_private *priv =3D dev->dev_private;
> -	unsigned int num_mgrs =3D priv->dispc_ops->get_num_mgrs(priv->dispc);
> +	unsigned int num_mgrs =3D dispc_get_num_mgrs(priv->dispc);
>  	unsigned int max_planes;
>  	unsigned int i;
>  	int ret;
> @@ -283,13 +283,13 @@ int omap_drm_irq_install(struct drm_device *dev)
>  	}
> =20
>  	for (i =3D 0; i < num_mgrs; ++i)
> -		priv->irq_mask |=3D priv->dispc_ops->mgr_get_sync_lost_irq(priv->dispc=
, i);
> +		priv->irq_mask |=3D dispc_mgr_get_sync_lost_irq(priv->dispc, i);
> =20
> -	priv->dispc_ops->runtime_get(priv->dispc);
> -	priv->dispc_ops->clear_irqstatus(priv->dispc, 0xffffffff);
> -	priv->dispc_ops->runtime_put(priv->dispc);
> +	dispc_runtime_get(priv->dispc);
> +	dispc_clear_irqstatus(priv->dispc, 0xffffffff);
> +	dispc_runtime_put(priv->dispc);
> =20
> -	ret =3D priv->dispc_ops->request_irq(priv->dispc, omap_irq_handler, dev=
);
> +	ret =3D dispc_request_irq(priv->dispc, omap_irq_handler, dev);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -307,5 +307,5 @@ void omap_drm_irq_uninstall(struct drm_device *dev)
> =20
>  	dev->irq_enabled =3D false;
> =20
> -	priv->dispc_ops->free_irq(priv->dispc, dev);
> +	dispc_free_irq(priv->dispc, dev);
>  }
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapd=
rm/omap_plane.c
> index 73ec99819a3d..88d2a986d880 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -70,17 +70,17 @@ static void omap_plane_atomic_update(struct drm_plane=
 *plane,
>  			&info.paddr, &info.p_uv_addr);
> =20
>  	/* and finally, update omapdss: */
> -	ret =3D priv->dispc_ops->ovl_setup(priv->dispc, omap_plane->id, &info,
> +	ret =3D dispc_ovl_setup(priv->dispc, omap_plane->id, &info,
>  			      omap_crtc_timings(state->crtc), false,
>  			      omap_crtc_channel(state->crtc));
>  	if (ret) {
>  		dev_err(plane->dev->dev, "Failed to setup plane %s\n",
>  			omap_plane->name);
> -		priv->dispc_ops->ovl_enable(priv->dispc, omap_plane->id, false);
> +		dispc_ovl_enable(priv->dispc, omap_plane->id, false);
>  		return;
>  	}
> =20
> -	priv->dispc_ops->ovl_enable(priv->dispc, omap_plane->id, true);
> +	dispc_ovl_enable(priv->dispc, omap_plane->id, true);
>  }
> =20
>  static void omap_plane_atomic_disable(struct drm_plane *plane,
> @@ -93,7 +93,7 @@ static void omap_plane_atomic_disable(struct drm_plane =
*plane,
>  	plane->state->zpos =3D plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY
>  			   ? 0 : omap_plane->id;
> =20
> -	priv->dispc_ops->ovl_enable(priv->dispc, omap_plane->id, false);
> +	dispc_ovl_enable(priv->dispc, omap_plane->id, false);
>  }
> =20
>  static int omap_plane_atomic_check(struct drm_plane *plane,
> @@ -252,7 +252,7 @@ struct drm_plane *omap_plane_init(struct drm_device *=
dev,
>  		u32 possible_crtcs)
>  {
>  	struct omap_drm_private *priv =3D dev->dev_private;
> -	unsigned int num_planes =3D priv->dispc_ops->get_num_ovls(priv->dispc);
> +	unsigned int num_planes =3D dispc_get_num_ovls(priv->dispc);
>  	struct drm_plane *plane;
>  	struct omap_plane *omap_plane;
>  	enum omap_plane_id id;
> @@ -271,7 +271,7 @@ struct drm_plane *omap_plane_init(struct drm_device *=
dev,
>  	if (!omap_plane)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	formats =3D priv->dispc_ops->ovl_get_color_modes(priv->dispc, id);
> +	formats =3D dispc_ovl_get_color_modes(priv->dispc, id);
>  	for (nformats =3D 0; formats[nformats]; ++nformats)
>  		;
>  	omap_plane->id =3D id;
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--xjl5e2swurlwubjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYGcACgkQ2O7X88g7
+ppLJg//byF1QbtwKSI0+ubwhPs7Vb93tfNMh3d0aRHZtNCvC//GIYnG/xMbxvjr
p3cbTuSqbWQyVnlyQAZgUPnbAKBy3Ti5DzFk/pzuT25+QI98o4BS7qYzCgFOgGwf
EMlBkm2PxvraqYl8FI65KetBHn8owf9dgjVRhg/DNrQ79S9Ne3r5Ru/Rv1uTjRFn
IaqAQkEVcuSvcIho6hPIprzkOijiLStbXucNSwIpsf7W0YerpxFQNIfpF049D0Ab
Xz1sCeCOsm4xErVG9Mc56Z+OFb7cYpwtcTLAWZwpH8rpFJ/YqYVEibn/qG+M4PEj
72G57sYHYDNRr3M7UKAL98kX05A/ZGbUOK2CUlG8PLNAjx/AaFKR/yXKbe15l5uX
hwLtzMHvAQO5PE16m2I98su7N1yZJcWqiE1sUUzb4Yzv240GU84B6Xi/HgiujLI+
0MRoF7+H582UVY7YtHJi75ZwdoeilcezrsLjQ9v1V86GZD+KpfQyAOPPqOyFk53p
SU0+wbSNead7MAJ02cKebkZr4LG1J/qL2NM2+bC8rvhkSf1A8tlOGXTYhvncjhMt
/cvEuv9tv4o7xRXBKbt75VL7Zfan/AySAzYFZk7O8Y+6NVYw88mS5bHx2CCRi1MC
178rF85cUbp8v7rNst6pW9F0uOVsZPKriGfAQ5XUmzBLUmA0gYU=
=9ebA
-----END PGP SIGNATURE-----

--xjl5e2swurlwubjh--

--===============0947091421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0947091421==--
