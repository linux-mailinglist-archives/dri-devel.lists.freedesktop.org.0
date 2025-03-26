Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A3A71A2F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E009B10E00D;
	Wed, 26 Mar 2025 15:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ibhRk9N+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE3C10E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 15:26:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8AF8BA402A4;
 Wed, 26 Mar 2025 15:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD585C4CEE2;
 Wed, 26 Mar 2025 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743002810;
 bh=E3LVCXLoRzbhs4MzPU/33YNPn5UAO0vP8mj3ilyU6MU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ibhRk9N+8JE80IkNKOMMxpqqoMdJJsAZ7apRKKEOTN17yaiQBtdMMPI8Qnu4WlT9e
 p02y4Op1o8uWoq2qdPHVjYsjl/O+CUFdMIcLF4CU6YT1efrGgfEUkeKmAPpcvW3Wuy
 hrtsVDWnjiFPemqHMG7LEGmlvHmFWwPo2LJG4+Nq88zffW6Tib0SzqhuXxHZSh87M3
 E5GcfkttsX/C3G3yk3zFkDM0RO3O/tPutcaa1REMUfemtCfdu1TRCae5APvbGj0S+Z
 MhABIa2aq+dfzWBb7PicBNq94fMySf4sTALjbFVaGnJMEnM0GCutN/9lpsQQvHk0z6
 VeYzPfk7jn7aQ==
Date: Wed, 26 Mar 2025 16:26:47 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250326-camouflaged-satisfied-quokka-8d5afc@houat>
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-1-4e2bf5d19c5d@redhat.com>
 <20250326102259.3bdbc22d@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kx76iyfxdbnxqini"
Content-Disposition: inline
In-Reply-To: <20250326102259.3bdbc22d@booty>
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


--kx76iyfxdbnxqini
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] drm/panel: Add new helpers for refcounted panel
 allocatons
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 10:22:59AM +0100, Luca Ceresoli wrote:
> Hello Anusha,
>=20
> On Tue, 25 Mar 2025 13:24:08 -0400
> Anusha Srivatsa <asrivats@redhat.com> wrote:
>=20
> > Introduce reference counted allocations for panels to avoid
> > use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> > to allocate a new refcounted panel. Followed the documentation for
> > drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> > implementations for this purpose.
> >=20
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>=20
> [...]
>=20
> > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t o=
ffset,
> > +			     const struct drm_panel_funcs *funcs,
> > +			     int connector_type);
> > +
> > +/**
> > + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
>                                                      ^^
> "a refcounted panel"
>=20
> > + * @dev: struct device of the panel device
> > + * @type: the type of the struct which contains struct &drm_panel
> > + * @member: the name of the &drm_panel within @type
> > + * @funcs: callbacks for this panel
> > + * @connector_type: connector type of the driver
>=20
> I'd say it's the connector type in the hardware, rather than of the
> driver (the driver follows what is in the hardware. Maybe you can just
> copy the description present in the drm_panel_init kdoc:
>=20
>  * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) correspondi=
ng to
>  *      the panel interface (must NOT be DRM_MODE_CONNECTOR_Unknown)
>=20
> Other than that it looks good!

Heh, Unknown is fine, but you're right for the rest. I'd use the
drm_panel_init doc for that field actually.

Maxime

--kx76iyfxdbnxqini
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+QctgAKCRDj7w1vZxhR
xW8DAQD40+ulGnIJEDIE/lvd8rfwdrKdgFym/9bSB9uZ01XXHAEA5MNcCIEyKhj4
MGIvSR/D/1GUWfEkNBH4dz32KHIupgA=
=9uMY
-----END PGP SIGNATURE-----

--kx76iyfxdbnxqini--
