Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B1B40C9F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 19:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A87E10E80D;
	Tue,  2 Sep 2025 17:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TAxHDJj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8B310E80D;
 Tue,  2 Sep 2025 17:57:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC67B4356D;
 Tue,  2 Sep 2025 17:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21020C4CEED;
 Tue,  2 Sep 2025 17:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756835861;
 bh=uHABCx0VqkfzurnmQC58wRTWxlIybKD4dg9qy2olHdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TAxHDJj+yaaPGDMpnDh4spc9d9yPjHCsp92rvLbeJEuET6c/6HRFgOdX3fFFs74Zr
 CXHQpqBnnU/OXFRcUGOKTMLDRo4QWUCwFROJEzryIjjDp5PTe5v3wgxOHu6OuPGqr/
 2O3LWJ1KyENaHoHorZm3lILBblPjiuSzJU5WDyVk/zWorplYRy/TZ/HEKl0qMQ3qM4
 7luagzb/2egFB25WPd3Qb4WOKtKfxj6o1Eim1XfpkyW7vrWIo6FHaF0z9OM1wzdpo5
 jGuDwiOSoKKHJnVIDXzDzev31XGHWEY8i7r7K8U1eQcAfO0dKBfbuxXbeVVAUrXukm
 MyPb3S4bSV7ug==
Date: Tue, 2 Sep 2025 19:57:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, acourbot@nvidia.com, 
 daniel.almeida@collabora.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
Message-ID: <enuksb2qk5wyrilz3l2vnog45lghgmplrav5to6pd5k5owi36h@pxdq6y5dpgpt>
References: <20250901202850.208116-1-dakr@kernel.org>
 <humoafx7njwhvdwarelew2bwyl34q3ls5vbrkj6psfukoroni5@z7ap6mc4lj3k>
 <DCII677CICRL.2OCMSV7ESGTQ5@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="k6igpdwgcafaqguy"
Content-Disposition: inline
In-Reply-To: <DCII677CICRL.2OCMSV7ESGTQ5@kernel.org>
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


--k6igpdwgcafaqguy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 07:49:56PM +0200, Danilo Krummrich wrote:
> On Tue Sep 2, 2025 at 7:40 PM CEST, Maxime Ripard wrote:
> > On Mon, Sep 01, 2025 at 10:26:39PM +0200, Danilo Krummrich wrote:
> >> Multiple DRM Rust drivers (e.g. nova-core, nova-drm, Tyr, rvkms) are in
> >> development, with at least Nova and (soon) Tyr already upstream. Havin=
g a
> >> shared tree will ease and accelerate development, since all drivers can
> >> consume new infrastructure in the same release cycle.
> >>=20
> >> This includes infrastructure shared with other subsystem trees (e.g. R=
ust
> >> or driver-core). By consolidating in drm-rust, we avoid adding extra
> >> burden to drm-misc maintainers, e.g. dealing with cross-tree topic
> >> branches.
> >>=20
> >> The drm-misc tree is not a good fit for this stage of development, sin=
ce
> >> its documented scope is small drivers with occasional large series.
> >>=20
> >> Rust drivers in development upstream, however, regularly involve large
> >> patch series, new infrastructure, and shared topic branches, which may
> >> not align well with drm-misc at this stage.
> >>=20
> >> The drm-rust tree may not be a permanent solution. Once the core Rust,
> >> DRM, and KMS infrastructure have stabilized, drivers and infrastructure
> >> changes are expected to transition into drm-misc or standalone driver
> >> trees respectively. Until then, drm-rust provides a dedicated place to
> >> coordinate development without disrupting existing workflows too much.
> >>=20
> >> Cc: Alice Ryhl <aliceryhl@google.com>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Simona Vetter <simona@ffwll.ch>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Alexandre Courbot <acourbot@nvidia.com>
> >> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >> ---
> >>  MAINTAINERS | 11 ++++++++++-
> >>  1 file changed, 10 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index fe168477caa4..1cd6597c7f1d 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -8079,7 +8079,6 @@ F:	Documentation/devicetree/bindings/gpu/
> >>  F:	Documentation/gpu/
> >>  F:	drivers/gpu/drm/
> >>  F:	drivers/gpu/vga/
> >> -F:	rust/kernel/drm/
> >>  F:	include/drm/drm
> >>  F:	include/linux/vga*
> >>  F:	include/uapi/drm/
> >> @@ -8096,6 +8095,16 @@ X:	drivers/gpu/drm/radeon/
> >>  X:	drivers/gpu/drm/tegra/
> >>  X:	drivers/gpu/drm/xe/
> >> =20
> >> +DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
> >> +M:	Danilo Krummrich <dakr@kernel.org>
> >> +M:	Alice Ryhl <aliceryhl@google.com>
> >> +S:	Supported
> >> +W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
> >> +T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
> >> +F:	drivers/gpu/drm/nova/
> >> +F:	drivers/gpu/nova-core/
> >> +F:	rust/kernel/drm/
> >> +
> >
> > Would it make sense to add the drm-misc maintainers as reviewers for the
> > bindings?
>=20
> This will get you all the driver patches in your inbox as well, maybe
> discarding the following hunk is what we want instead?

I guess we would receive just as many patches as we do today :)

> 	@@ -8079,7 +8079,6 @@ F:	Documentation/devicetree/bindings/gpu/
> 	 F:	Documentation/gpu/
> 	 F:	drivers/gpu/drm/
> 	 F:	drivers/gpu/vga/
> 	-F:	rust/kernel/drm/
> 	 F:	include/drm/drm
> 	 F:	include/linux/vga*
> 	 F:	include/uapi/drm/

That's not really what I meant, what I meant was that rust/kernel/drm/
is the only thing I'm really interested on, but we don't need to
maintain it if it makes more sense to do so separately.

BTW, we should probably add to drm-misc

X: drivers/gpu/drm/nova

because we have a catch-all at the moment.

Maxime

--k6igpdwgcafaqguy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLcwEQAKCRAnX84Zoj2+
dlccAYDo9QYrxJCz0OhoOfPcIPgVc+XUoIj2Thx9znf/cTvLNYEaRcY/I0/HuCne
+XUOuCgBf2CpjVGBv2ii4XtIaC80SQ9raQ4m8QBGhKMPAVMSCTuVvOehQcFuZk7N
Gb2eLXotGw==
=8gSv
-----END PGP SIGNATURE-----

--k6igpdwgcafaqguy--
