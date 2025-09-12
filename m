Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092D0B55396
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 17:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DA910EC99;
	Fri, 12 Sep 2025 15:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E16iH+BK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DAC10EC99
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 15:31:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5EE134199D;
 Fri, 12 Sep 2025 15:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E60C4CEFB;
 Fri, 12 Sep 2025 15:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757691080;
 bh=DfzfoP4LUFnqa3Wsl3Um+UvMhB6DGbMsnpcmsfS13pg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E16iH+BK2u2kqaak0gAUhF84I+EgA7pDLB+UIbVtm0rfgo2PYhWuHO6/6xrvmlbwX
 gRHwcNy1r8qoZxe4J3s6JAb/Mc3+VbmJBiUogbksDXkvQ51oGwp2jfXTJqLC2WAVFE
 topW0piSoOOZdsYgMkOMP1vyKcWzlW5l70Qzfhj2JQxs2wx+ZCLSVo3WvQp8TVVyEY
 Y9rdKjKwS/rqgmg57h8yXJCzsSeuVT1l2PMUu3B4oYSlVhMrL6zKvvTDWYdIUQjmzp
 lOVYlEERgKiQUgV1zWsJf6WMFGdTdU2gTenlgIgVoKYMg7fwvXo2itHIFlw7nMjl1D
 42vJGmcgDufbw==
Date: Fri, 12 Sep 2025 17:31:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com, andri@yngvason.is, 
 sebastian.wick@redhat.com, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, 
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com, 
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 5/8] drm: Pass supported color formats straight onto
 drm_bridge
Message-ID: <20250912-amiable-dandelion-bullfrog-abc930@penduick>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-6-marius.vlad@collabora.com>
 <fekbw2ngxyg4mvkhlvkvegylcm4vm74y5rhhxeygiqxve7oqaj@sxvkyqjssdru>
 <aMMIOBfuQ7oJFH6i@xpredator>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="pdhx47zes7ky7zts"
Content-Disposition: inline
In-Reply-To: <aMMIOBfuQ7oJFH6i@xpredator>
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


--pdhx47zes7ky7zts
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] drm: Pass supported color formats straight onto
 drm_bridge
MIME-Version: 1.0

Hi,

On Thu, Sep 11, 2025 at 08:34:48PM +0300, Marius Vlad wrote:
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/=
msm/dsi/dsi_manager.c
> > > index ca400924d4ee..4b87f4f78d38 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > @@ -479,7 +479,7 @@ int msm_dsi_manager_connector_init(struct msm_dsi=
 *msm_dsi,
> > >  	if (ret)
> > >  		return ret;
> > > =20
> > > -	connector =3D drm_bridge_connector_init(dev, encoder);
> > > +	connector =3D drm_bridge_connector_init(dev, encoder, BIT(HDMI_COLO=
RSPACE_RGB));
> >=20
> > And this totally depends on the bridge chain. If we have a DSI-to-HDMI
> > bridge somewhere in the middle, we are able to output YUV data to the
> > HDMI connector.
> That's actually the usecase for this patch: to allow passing other color
> formats, but this patch is a transitory patch to further expose the fact
> drm_bridge_connector_init was embedding BIT(HDMI_COLORSPACE_RGB) for the
> format. See rockchip implementation for this bit, the last patch in this
> series.

I think Dmitry's point is that it needs to be integrated with the
atomic_get_input_bus_fmt / atomic_get_output_bus_fmt, because not only
we need to make sure the monitor supports it, and the userspace demands
it, we also need to make sure every bridge in the chain (and possibly
the encoder) can implement it.

Maxime

--pdhx47zes7ky7zts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMQ8xAAKCRAnX84Zoj2+
djA3AX9ep0uc4hBe8RMe9s83DJyb7dMfOITvQ1qqxhlfYMxxBSOgMjiwUHbZH5zF
nmQrHBQBgP8SZF8XbkkA2+zGq4itD6PmZ27B+mEeBY1/w4T59Qf8/FltxESa56TT
tUSKLnOs/Q==
=hMwp
-----END PGP SIGNATURE-----

--pdhx47zes7ky7zts--
