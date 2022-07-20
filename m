Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4114B57C05A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 00:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5E81128D4;
	Wed, 20 Jul 2022 22:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9996112DE2;
 Wed, 20 Jul 2022 22:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XSAdUXgBEYxTOnJTbuhf0sCIRbziFUyOhLG243d2AT4=; b=fHW01bp2y5COODMQ9pH8gvqOQi
 zLXJiDKmMDhD6X+C0e3uKH9wCHiCQXI7fuK6zGqOoBjJu2sgtdepG9S7afig775rpoIzXq1nVA4iz
 ieLn7mMOriPIkIOSXTZZgTPbu7oGlxSvP/UUWpFCrP5wsTJRZSSiK819f/VBNHNglvuEIsHvTmqvQ
 nsGhpbpNhmLtdZ2mReY4EhiwliO/kqCvwheBWVvDa1OwRVMZmAzJkT/4Ml9SwZI/uwZgYckw7wSAi
 HBVIWj++b7N8K+PpAkSeJFj7Yk6kCOnAq91sUbT/eio2vgcbjf+9UZRXC/QC6Z0l2d2PlkDoyEVM1
 vNhf7qNQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEIck-000piy-Gg; Thu, 21 Jul 2022 00:56:58 +0200
Date: Wed, 20 Jul 2022 21:56:44 -0100
From: Melissa Wen <mwen@igalia.com>
To: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Subject: Re: [PATCH 4/4] Documentation/gpu/amdgpu/amdgpu_dm: add DM docs for
 pixel blend mode
Message-ID: <20220720225644.p7sty6peovhrewf3@mail.igalia.com>
References: <20220716222529.421115-1-mwen@igalia.com>
 <20220716222529.421115-5-mwen@igalia.com>
 <6078df20-348d-e690-6189-8d5c7b0b98f1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s4wxczk3sdhofbhb"
Content-Disposition: inline
In-Reply-To: <6078df20-348d-e690-6189-8d5c7b0b98f1@gmail.com>
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--s4wxczk3sdhofbhb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/17, Tales Lelo da Aparecida wrote:
> On 16/07/2022 19:25, Melissa Wen wrote:
> > AMD GPU display manager (DM) maps DRM pixel blend modes (None,
> > Pre-multiplied, Coverage) to MPC hw blocks through blend configuration
> > options. Describe relevant elements and how to set and test them to get
> > the expected DRM blend mode on DCN hw.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   .../gpu/amdgpu/display/display-manager.rst    | 98 +++++++++++++++++++
> >   Documentation/gpu/drm-kms.rst                 |  2 +
> >   2 files changed, 100 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Doc=
umentation/gpu/amdgpu/display/display-manager.rst
> > index 8960a5f1fa66..7a495ed1f69e 100644
> > --- a/Documentation/gpu/amdgpu/display/display-manager.rst
> > +++ b/Documentation/gpu/amdgpu/display/display-manager.rst
> > @@ -84,3 +84,101 @@ families below.
> >   **DCN 3.0 family color caps and mapping**
> >   .. kernel-figure:: dcn3_cm_drm_current.svg
> > +
> > +Blend Mode Properties
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Pixel blend mode is a DRM plane composition property of :c:type:`drm_p=
lane` used to
> > +describes how pixels from a foreground plane (fg) are composited with =
the
> > +background plane (bg). Here, we present main concepts of DRM blend mod=
e to help
> > +to understand how this property is mapped to AMD DC interface. See mor=
e about
> > +this DRM property and the alpha blending equations in :ref:`DRM Plane
> > +Composition Properties <plane_composition_properties>`.
> > +
> > +Basically, a blend mode sets the alpha blending equation for plane
> > +composition that fits the mode in which the alpha channel affects the =
state of
> > +pixel color values and, therefore, the resulted pixel color. For
> > +example, consider the following elements of the alpha blending equatio=
n:
> > +
> > +- *fg.rgb*: Each of the RGB component values from the foreground's pix=
el.
> > +- *fg.alpha*: Alpha component value from the foreground's pixel.
> > +- *bg.rgb*: Each of the RGB component values from the background.
> > +- *plane_alpha*: Plane alpha value set by the **plane "alpha" property=
**, see
> > +  more in `DRM Plane Composition Properties <plane_composition_propert=
ies>`.
>=20
> You forgot to use :ref: in here.
>=20
> > +
> > +in the basic alpha blending equation::
> > +
> > +   out.rgb =3D alpha * fg.rgb + (1 - alpha) * bg.rgb
> > +
> > +the alpha channel value of each pixel in a plane is ignored and only t=
he plane
> > +alpha affects the resulted pixel color values.
> > +
> > +DRM has three blend mode to define the blend formula in the plane comp=
osition:
> > +
> > +* **None**: Blend formula that ignores the pixel alpha.
> > +
> > +* **Pre-multiplied**: Blend formula that assumes the pixel color value=
s in a
> > +  plane was already pre-multiplied by its own alpha channel before sto=
rage.
> > +
> > +* **Coverage**: Blend formula that assumes the pixel color values were=
 not
> > +  pre-multiplied with the alpha channel values.
> > +
> > +and pre-multiplied is the default pixel blend mode, that means, when n=
o blend
> > +mode property is created or defined, DRM considers the plane's pixels =
has
> > +pre-multiplied color values. On IGT GPU tools, the kms_plane_alpha_ble=
nd test
> > +provides a set of subtests to verify plane alpha and blend mode proper=
ties.
> > +
> > +The DRM blend mode and its elements are then mapped by AMDGPU display =
manager
> > +(DM) to program the blending configuration of the Multiple Pipe/Plane =
Combined
> > +(MPC), as follows:
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > +   :doc: mpc-overview
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > +   :functions: mpcc_blnd_cfg
> > +
> > +Therefore, the blending configuration for a single MPCC instance on th=
e MPC
> > +tree is defined by :c:type:`mpcc_blnd_cfg`, where
> > +:c:type:`pre_multiplied_alpha` is the alpha pre-multiplied mode flag u=
sed to
> > +set :c:type:`MPCC_ALPHA_MULTIPLIED_MODE`. It controls whether alpha is
> > +multiplied (true/false), being only true for DRM pre-multiplied blend =
mode.
> > +:c:type:`mpcc_alpha_blend_mode` defines the alpha blend mode regarding=
 pixel
> > +alpha and plane alpha values. It sets one of the three modes for
> > +:c:type:`MPCC_ALPHA_BLND_MODE`, as described below.
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > +   :functions: mpcc_alpha_blend_mode
> > +
> > +DM then maps the elements of `enum mpcc_alpha_blend_mode` to those in =
the DRM
> > +blend formula, as follows:
> > +
> > +* *MPC pixel alpha* matches *DRM fg.alpha* as the alpha component value
> > +  from the plane's pixel
> > +* *MPC global alpha* matches *DRM plane_alpha* when the pixel alpha sh=
ould
> > +  be ignored and, therefore, pixel values are not pre-multiplied
> > +* *MPC global gain* assumes *MPC global alpha* value when both *DRM
> > +  fg.alpha* and *DRM plane_alpha* participate in the blend equation
> > +
> > +In short, *fg.alpha* is ignored by selecting
> > +:c:type:`MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA`. On the other hand, (plan=
e_alpha *
> > +fg.alpha) component becomes available by selecting
> > +:c:type:`MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN`. =
And the
> > +:c:type:`MPCC_ALPHA_MULTIPLIED_MODE` defines if the pixel color values=
 are
> > +pre-multiplied by alpha or not.
> > +
> > +Blend configuration flow
> > +------------------------
> > +
> > +The alpha blending equation is configured from DRM to DC interface by =
the
> > +following path:
> > +
> > +1. When updating a :c:type:`drm_plane_state <drm_plane_state>`, DM cal=
ls
> > +   :c:type:`fill_blending_from_plane_state()` that maps
> > +   :c:type:`drm_plane_state <drm_plane_state>` attributes to
> > +   :c:type:`dc_plane_info <dc_plane_info>` struct to be handled in the
> > +   OS-agnostic component (DC).
> > +
> > +2. On DC interface, :c:type:`struct mpcc_blnd_cfg <mpcc_blnd_cfg>` pro=
grams the
> > +   MPCC blend configuration considering the :c:type:`dc_plane_info
> > +   <dc_plane_info>` input from DPP.
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.=
rst
> > index d14bf1c35d7e..7ec9dbe18b65 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -532,6 +532,8 @@ Standard Plane Properties
> >   .. kernel-doc:: drivers/gpu/drm/drm_plane.c
> >      :doc: standard plane properties
> > +.. _plane_composition_properties:
> > +
> >   Plane Composition Properties
> >   ----------------------------
>=20
> From a beginner's perspective, the changes from this series are readable,
> but I cannot tell if there are any technical mistakes. So,
> regarding readability and rendering htmldocs, apart from the nits I've
> raised, this whole series is
>=20
> Reviewed-by: Tales Aparecida <tales.aparecida@gmail.com>
>=20
> Thanks for the patch series, Melissa,

Hi Tales,

Thanks for taking a look at this series and reviewing it carefully.
Again, I'll address your comments in the next version.

Best Regards,

Melissa

> Tales Aparecida

--s4wxczk3sdhofbhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLYiCwACgkQwqF3j0dL
ehwhOxAAm2cqpBsWiVG40hlYjPr/ylBGoYaEaemtsHzdNI5MtqijCYGIgf0I231b
lkBZFTaUtHat+ePNDjyDIbuX3nq6NtmMpxUWBzsfcbh9vNxk0bAG1xouV2AHOTOw
Q4lJiTln1kXdOeZtZY1Vrq+n+tOOYflkmDVJDCwRX3W2HbJM+7nV7ID8NFGr5Mrh
MTxboxtHUvE3me5WiN8xFv2Y0p6Zmy5Ka447VxMmqfydewNF6SEGqEGmEsXpkkdf
boFlyZNfp1QrgXjaOiW5F5DcmW+ejHpUslZnMfrcAGNS0lYmhEHCNi4Bw0UXkvP6
o3okG1kdy1KbvxfpatMNsx6PeGV1NKUwfQGOUOhKthhYq6qrX5fe5Jo5voamgpHR
BzSlYLYDYWfznQqXHMgbM+Q8GGaekwDjZy0sO5cUnWIPKUueOzIzzViVebSkuIDk
IIVFKBHTYto0zQqR4ogXju5X24k3+AL9501D2QlJevh/Lfc7dbegaJ1q9/eIdDer
wsMiS3PVJJPiyeT6plGHb6SvexA4YihtB4uIgJob98ECS38qcPIcN08Yz4LQgvHN
6eO+rm7ZPQov8VvAVM5nCfKMaH4SDT54DTj4gvUsJ/vNxcucY6zhP5WmbsTPYqMk
HSFINsfdpEH6p2T23Hy46WLSw+lPNgvAYR3eofhjgBnfDpBApSo=
=/FrH
-----END PGP SIGNATURE-----

--s4wxczk3sdhofbhb--
