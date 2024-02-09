Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF9184F824
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 16:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1828810F5B3;
	Fri,  9 Feb 2024 15:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dBZzGonE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA2F10F59A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 15:07:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75BA761DA3;
 Fri,  9 Feb 2024 15:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC513C433C7;
 Fri,  9 Feb 2024 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707491237;
 bh=rinS97pjiqsWtLhUSgft+o6SOva2SBJaGuOj+ryFpkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dBZzGonEEQyIIm7NlUI1T0TIfsPwn2+p51y4K3zmruvxQEzpLzcGf/BMUDMjWXY8T
 1fV0biGk3M7z6sr6kAcrRqudgZGX31HUgPtfuz52EzylU4/P4AAsNbZftcAwlgaisH
 AnW9MeSx7CrscRbuytl8H8oC8yuUaOSYsqlChBm7SZr0NNQ9zgkJj9PgE0Ul0ipxOx
 cz/tuAjhhV3dp1XC9B7jYYZBIc1uVGirnaJUHiBQ03GYcqFX4vZgjVfjB2g1wctQXS
 xD/zO3g0kCB+AElQS7/t0u42rdu/EL6dbyU7aGD2EPOd4EKc3w41nKTwHNPvbkAlPS
 mxW3NvkqY8zKA==
Date: Fri, 9 Feb 2024 16:07:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v16 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <ksm44nhkamq3gdbykn3o3d7xobvhepm44gnwjhtw3xaygvgsn4@5tq7hatvbrd4>
References: <20240122164257.56326-1-biju.das.jz@bp.renesas.com>
 <20240122164257.56326-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fwu2odvuxvffijsk"
Content-Disposition: inline
In-Reply-To: <20240122164257.56326-4-biju.das.jz@bp.renesas.com>
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


--fwu2odvuxvffijsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 04:42:55PM +0000, Biju Das wrote:
> +static const struct drm_gem_object_funcs rzg2l_du_gem_funcs = {
> +	.free = drm_gem_dma_object_free,
> +	.print_info = drm_gem_dma_object_print_info,
> +	.get_sg_table = drm_gem_dma_object_get_sg_table,
> +	.vmap = drm_gem_dma_object_vmap,
> +	.mmap = drm_gem_dma_object_mmap,
> +	.vm_ops = &drm_gem_dma_vm_ops,
> +};
> +
> +struct drm_gem_object *
> +rzg2l_du_gem_prime_import_sg_table(struct drm_device *dev,
> +				   struct dma_buf_attachment *attach,
> +				   struct sg_table *sgt)
> +{
> +	struct drm_gem_dma_object *dma_obj;
> +	struct drm_gem_object *gem_obj;
> +	int ret;
> +
> +	/* Create a DMA GEM buffer. */
> +	dma_obj = kzalloc(sizeof(*dma_obj), GFP_KERNEL);
> +	if (!dma_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	gem_obj = &dma_obj->base;
> +	gem_obj->funcs = &rzg2l_du_gem_funcs;
> +
> +	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
> +	dma_obj->map_noncoherent = false;
> +
> +	ret = drm_gem_create_mmap_offset(gem_obj);
> +	if (ret) {
> +		drm_gem_object_release(gem_obj);
> +		kfree(dma_obj);
> +		return ERR_PTR(ret);
> +	}
> +
> +	dma_obj->dma_addr = 0;
> +	dma_obj->sgt = sgt;
> +
> +	return gem_obj;
> +}

It looks like you're just reusing the helpers there, why do you need to
declare a new import_sg_table implementation?

Maxime

--fwu2odvuxvffijsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcY/oQAKCRDj7w1vZxhR
xfXfAP9/s1rUrawgMsN6iFY3i0twov7+iO6YQ+ohbqcgD3mZxgD+Ki8z0f6ucECn
CdAs1qPMF8cxGSMkHPNrv/KBO5uFugw=
=2u3k
-----END PGP SIGNATURE-----

--fwu2odvuxvffijsk--
