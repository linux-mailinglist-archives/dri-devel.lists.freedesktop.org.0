Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F6D811809
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081A010E272;
	Wed, 13 Dec 2023 15:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E62610E272
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:47:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A4BB1CE1E55;
 Wed, 13 Dec 2023 15:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A48DC433C8;
 Wed, 13 Dec 2023 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702482431;
 bh=9RhFnj/nJFzdBn9KNmwojHXDLcib5qtWVxspQiQULnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h3DXdhGTu78N2HFT2byE78ZW601sbjaJ/Xwy9am74QJW+pgAd2l90RZUJnfP/ztHb
 vIPZpEHb1WuuFxDB7GuFA32edNtEQ5bsaROAfgwyJG2A8YvbxH1vScnJHGXFJ1uKc1
 9kOBSmSSt9v+3T4FzGo4Y871eYkew8Xwcmh/CO6MGMpNRVbgxJuJlhH3TNpQLtizJ+
 gwQhmAqhREwl9N+hRmTkucQv3nB995epJlVHQ8FgsWF2ZOEK7BYXTJSOVLHDVnTVus
 4TNB0pXeWzK9MNYcZyDeqb0qn/9HdjJqzLhTznqKFPBZ7P3IIppbiZnQhtd5YJdbr8
 vPd93r/uw6zlg==
Date: Wed, 13 Dec 2023 16:47:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="izjt3dcctz3w4scm"
Content-Disposition: inline
In-Reply-To: <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--izjt3dcctz3w4scm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 10:51:27AM +0000, Biju Das wrote:
> The LCD controller is composed of Frame Compression Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
>=20
> It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> along with 2 RPFs to support the blending of two picture layers and
> raster operations (ROPs).
>=20
> The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> alike SoCs.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

I'd still like a review from Geert or Laurent, I don't know the SoC.

> +static int rzg2l_du_crtc_get(struct rzg2l_du_crtc *rcrtc)
> +{
> +	int ret;
> +
> +	/*
> +	 * Guard against double-get, as the function is called from both the
> +	 * .atomic_enable() and .atomic_flush() handlers.
> +	 */
> +	if (rcrtc->initialized)
> +		return 0;
> +
> +	ret =3D clk_prepare_enable(rcrtc->rzg2l_clocks.aclk);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D clk_prepare_enable(rcrtc->rzg2l_clocks.pclk);
> +	if (ret < 0)
> +		goto error_bus_clock;
> +
> +	ret =3D reset_control_deassert(rcrtc->rstc);
> +	if (ret < 0)
> +		goto error_peri_clock;
> +
> +	rzg2l_du_crtc_setup(rcrtc);
> +	rcrtc->initialized =3D true;
> +
> +	return 0;
> +
> +error_peri_clock:
> +	clk_disable_unprepare(rcrtc->rzg2l_clocks.pclk);
> +error_bus_clock:
> +	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
> +	return ret;
> +}

[...]

> +static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
> +				       struct drm_atomic_state *state)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +	struct drm_device *dev =3D rcrtc->crtc.dev;
> +	unsigned long flags;
> +
> +	WARN_ON(!crtc->state->enable);
> +
> +	/*
> +	 * If a mode set is in progress we can be called with the CRTC disabled.
> +	 * We thus need to first get and setup the CRTC in order to configure
> +	 * planes. We must *not* put the CRTC, as it must be kept awake until
> +	 * the .atomic_enable() call that will follow. The get operation in
> +	 * .atomic_enable() will in that case be a no-op, and the CRTC will be
> +	 * put later in .atomic_disable().
> +	 */
> +	rzg2l_du_crtc_get(rcrtc);

That's a bit suspicious. Have you looked at drm_atomic_helper_commit_tail_r=
pm() ?

> +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +
> +	rcrtc->vblank_enable =3D true;
> +
> +	return 0;
> +}
> +
> +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> +
> +	rcrtc->vblank_enable =3D false;
> +}

You should enable / disable your interrupts here

> +int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
> +{
> +	struct rzg2l_du_crtc *rcrtc =3D &rcdu->crtcs[0];
> +	struct drm_crtc *crtc =3D &rcrtc->crtc;
> +	struct drm_plane *primary;
> +	int ret;
> +
> +	rcrtc->rstc =3D devm_reset_control_get_shared(rcdu->dev, NULL);
> +	if (IS_ERR(rcrtc->rstc)) {
> +		dev_err(rcdu->dev, "can't get cpg reset\n");
> +		return PTR_ERR(rcrtc->rstc);
> +	}
> +
> +	rcrtc->rzg2l_clocks.aclk =3D devm_clk_get(rcdu->dev, "aclk");
> +	if (IS_ERR(rcrtc->rzg2l_clocks.aclk)) {
> +		dev_err(rcdu->dev, "no axi clock for DU\n");
> +		return PTR_ERR(rcrtc->rzg2l_clocks.aclk);
> +	}
> +
> +	rcrtc->rzg2l_clocks.pclk =3D devm_clk_get(rcdu->dev, "pclk");
> +	if (IS_ERR(rcrtc->rzg2l_clocks.pclk)) {
> +		dev_err(rcdu->dev, "no peripheral clock for DU\n");
> +		return PTR_ERR(rcrtc->rzg2l_clocks.pclk);
> +	}
> +
> +	rcrtc->rzg2l_clocks.dclk =3D devm_clk_get(rcdu->dev, "vclk");
> +	if (IS_ERR(rcrtc->rzg2l_clocks.dclk)) {
> +		dev_err(rcdu->dev, "no video clock for DU\n");
> +		return PTR_ERR(rcrtc->rzg2l_clocks.dclk);
> +	}
> +
> +	init_waitqueue_head(&rcrtc->flip_wait);
> +	rcrtc->dev =3D rcdu;
> +
> +	primary =3D &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
> +
> +	ret =3D drm_crtc_init_with_planes(&rcdu->ddev, crtc, primary, NULL,
> +					&crtc_funcs_rz, NULL);
> +	if (ret < 0)
> +		return ret;

You should use the drmm variant here

> +static void rzg2l_du_atomic_commit_tail(struct drm_atomic_state *old_sta=
te)
> +{
> +	struct drm_device *dev =3D old_state->dev;
> +
> +	/* Apply the atomic update. */
> +	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> +	drm_atomic_helper_commit_planes(dev, old_state,
> +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> +	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> +
> +	drm_atomic_helper_commit_hw_done(old_state);
> +	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> +
> +	drm_atomic_helper_cleanup_planes(dev, old_state);
> +}

AFAIK, there's no reason to roll your commit_tail implementation
yourself here. You should at the very least document why you needed to
do so.

> +int rzg2l_du_vsp_map_fb(struct rzg2l_du_vsp *vsp, struct drm_framebuffer=
 *fb,
> +			struct sg_table sg_tables[3])
> +{
> +	struct rzg2l_du_device *rcdu =3D vsp->dev;
> +	unsigned int i, j;
> +	int ret;
> +
> +	for (i =3D 0; i < fb->format->num_planes; ++i) {
> +		struct drm_gem_dma_object *gem =3D drm_fb_dma_get_gem_obj(fb, i);
> +		struct sg_table *sgt =3D &sg_tables[i];
> +
> +		if (gem->sgt) {
> +			struct scatterlist *src;
> +			struct scatterlist *dst;
> +
> +			/*
> +			 * If the GEM buffer has a scatter gather table, it has
> +			 * been imported from a dma-buf and has no physical
> +			 * address as it might not be physically contiguous.
> +			 * Copy the original scatter gather table to map it to
> +			 * the VSP.
> +			 */
> +			ret =3D sg_alloc_table(sgt, gem->sgt->orig_nents,
> +					     GFP_KERNEL);
> +			if (ret)
> +				goto fail;
> +
> +			src =3D gem->sgt->sgl;
> +			dst =3D sgt->sgl;
> +			for (j =3D 0; j < gem->sgt->orig_nents; ++j) {
> +				sg_set_page(dst, sg_page(src), src->length,
> +					    src->offset);
> +				src =3D sg_next(src);
> +				dst =3D sg_next(dst);
> +			}
> +		} else {
> +			ret =3D dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
> +					      gem->dma_addr, gem->base.size);
> +			if (ret)
> +				goto fail;
> +		}
> +
> +		ret =3D vsp1_du_map_sg(vsp->vsp, sgt);
> +		if (ret) {
> +			sg_free_table(sgt);
> +			goto fail;
> +		}
> +	}
> +
> +	return 0;
> +
> +fail:
> +	while (i--) {
> +		struct sg_table *sgt =3D &sg_tables[i];
> +
> +		vsp1_du_unmap_sg(vsp->vsp, sgt);
> +		sg_free_table(sgt);
> +	}
> +
> +	return ret;
> +}

Ditto, you should at least document why you're not using the helpers.

> +static void rzg2l_du_vsp_cleanup(struct drm_device *dev, void *res)
> +{
> +	struct rzg2l_du_vsp *vsp =3D res;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < vsp->num_planes; ++i) {
> +		struct rzg2l_du_vsp_plane *plane =3D &vsp->planes[i];
> +
> +		drm_plane_cleanup(&plane->plane);
> +	}
> +
> +	kfree(vsp->planes);
> +
> +	put_device(vsp->vsp);
> +}
> +
> +int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
> +		      unsigned int crtcs)
> +{
> +	struct rzg2l_du_device *rcdu =3D vsp->dev;
> +	struct platform_device *pdev;
> +	unsigned int num_crtcs =3D hweight32(crtcs);
> +	unsigned int num_planes =3D 2;
> +	unsigned int i;
> +	int ret;
> +
> +	/* Find the VSP device and initialize it. */
> +	pdev =3D of_find_device_by_node(np);
> +	if (!pdev)
> +		return -ENXIO;
> +
> +	vsp->vsp =3D &pdev->dev;
> +
> +	ret =3D drmm_add_action_or_reset(&rcdu->ddev, rzg2l_du_vsp_cleanup, vsp=
);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D vsp1_du_init(vsp->vsp);
> +	if (ret < 0)
> +		return ret;
> +
> +	vsp->planes =3D kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
> +	if (!vsp->planes)
> +		return -ENOMEM;

drmm_kcalloc or drmm_kmalloc_array

> +
> +	for (i =3D 0; i < num_planes; ++i) {
> +		enum drm_plane_type type =3D i < num_crtcs
> +					 ? DRM_PLANE_TYPE_PRIMARY
> +					 : DRM_PLANE_TYPE_OVERLAY;
> +		struct rzg2l_du_vsp_plane *plane =3D &vsp->planes[i];
> +
> +		plane->vsp =3D vsp;
> +		plane->index =3D i;
> +		ret =3D drm_universal_plane_init(&rcdu->ddev, &plane->plane,
> +					       crtcs, &rzg2l_du_vsp_plane_funcs,
> +					       rzg2l_du_vsp_formats,
> +					       ARRAY_SIZE(rzg2l_du_vsp_formats),
> +					       NULL, type, NULL);
> +		if (ret < 0)
> +			return ret;

you need to use drmm variant here too.

Maxime

--izjt3dcctz3w4scm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXnR/QAKCRDj7w1vZxhR
xeBLAP4otGkj6ThjDG+5byLmS/HdwmoqhzPsg3OiZ53+gyhXrwD5AWV3W0frEQNn
SyszKBl7+BTHXItUylLMKaX3Z14pYQw=
=lB7w
-----END PGP SIGNATURE-----

--izjt3dcctz3w4scm--
