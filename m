Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A1572094
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 18:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C9F953E6;
	Tue, 12 Jul 2022 16:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7450953D2;
 Tue, 12 Jul 2022 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ob1V+g0AkE7iDmCT+SRKBmZihqbOIbJWqdLl9FCddig=; b=b6v2OdrfuFdXZS0me7cVV92/17
 kzFUCKRIBTrDebmF//W7gkQsgtdfb2Wvmi+d7WCN7n4WtOQkKl1vrXC8/rR0ZiOEzkqVVdCvm5HOx
 0i8Opd2PmNKw5P64mIGAZ3eCFb9P83Y+aqwn27LqVT3+pCx3YQh6NZYpiZ1AaP5cXHajjYm79F6uN
 C/SPskd2V7FM3ZZ1rhRaGHPYcmWtcyPk/hXZNF35/3ccgkn9tA/77D2NuzjJGcffVKBBoxGpDA9aD
 Ep/KB6EgsdhLjjm7viaUy9P3vh85XBuVPMKsDSyxdJrtSOzfN/qLK3rcbzPi9Sox1+DaJkwh/GPZB
 2rXKH3ig==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oBIZ1-00Dlvq-7P; Tue, 12 Jul 2022 18:16:43 +0200
Date: Tue, 12 Jul 2022 15:16:29 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 0/5] DRM CRTC 3D LUT interface for AMD DCN
Message-ID: <20220712161629.6i645yonynqa34pj@mail.igalia.com>
References: <20220619223104.667413-1-mwen@igalia.com>
 <288325e9-46e4-5807-6d54-a0276cca0779@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cd4z3tfawg6yyrxm"
Content-Disposition: inline
In-Reply-To: <288325e9-46e4-5807-6d54-a0276cca0779@amd.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, nikola.cornij@amd.com,
 sunpeng.li@amd.com, alex.hung@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, seanpaul@chromium.org, nicholas.kazlauskas@amd.com,
 bhawanpreet.lakha@amd.com, christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cd4z3tfawg6yyrxm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/28, Harry Wentland wrote:
>=20
>=20
> On 2022-06-19 18:30, Melissa Wen wrote:
> > Hi,
> >=20
> > I've been working on a proposal to add 3D LUT interface to DRM CRTC
> > color mgmt, that means new **after-blending** properties for color
> > correction. As I'm targeting AMD display drivers, I need to map these
> > new properties to AMD DC interface and I have some doubts about the 3D
> > LUT programming on DCN blocks.
> >=20
> > First of all, this patchset is a working in progress and further
> > discussions about the DRM interface should be done. I've examined
> > previous proposal to add 3D LUT[1][2] and I understand that the main
> > difference between them is regarding the property position in the DRM
> > color management pipeline (between CTM and Gamma 1D or after Gamma 1D).
> > On the other hand, AMD DC always considers a shaper (1D) LUT before a 3D
> > LUT, used to delinearize and shape the content.  These LUTs are then
> > positioned between DRM CTM and Gamma (1D).
> >=20
> > By comparing the AMD design with the other proposals, I see that it's
> > possible to cover all of them by adding and combining shaper (1D) LUT
> > and 3D LUT as new color mgmt properties. Moreover, it'll not limit the
> > exposure of AMD color correction caps to the userspace. Therefore, my
> > proposal is to add these two new properties in the DRM color mgmt
> > pipeline as follows:
> >=20
> >  +------------+
> >  |            |
> >  |  Degamma   |
> >  +-----+------+
> >        |
> >  +-----v------+
> >  |            |
> >  |    CTM     |
> >  +-----+------+
> >        |
> > ++-----v------++
> > ||            ||
> > || Shaper LUT ||
> > ++-----+------++
> >        |
> > ++-----v------++
> > ||            ||
> > ||  3D LUT    ||
> > ++-----+------++
> >        |
> >  +-----v------+
> >  |            |
> >  | Gamma (1D) |
> >  +------------+
> >=20
>=20
> As Ville already mentioned on patch 4, the increasing complexity of the
> color pipeline and the arguments about the placement of the 3D LUT means
> that we will probably need a definition of a particular HW's color
> pipeline. Something like this proposal from Sebastian:
> https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11
>=20
> > However, many doubts arose when I was mapping these two new properties
> > to DC interface. This is why I decided to share an not-yet-completed
> > implementation to get some feedback and explanation.
> >=20
> > This RFC patchset is divided in three scopes of change. The first two
> > patches document the AMD DM color correction mapping. Some comments were
> > rewritten as kernel doc entries. I also summarize all information
> > provided in previous discussions[3] and also redid those diagrams to
> > svg. All doc should be reviewed and some struct members lack
> > explanation. I can add them to documentation if you can provide a
> > description. Some examples that lack description so far:
> > * in amdgpu_display_manager: dmub_outbox_params, dmub_aux_transfer_done=
, delayed_hpd_wq;
> > * in dpp_color_caps: dgam_ram, dgam_rom_for_yuv;
> > * in mpc_color_caps: ogam_ram.
> >=20
> > The next two patches expand DRM color mgmt interface to add shaper LUT
> > and 3D LUT. Finally, the last patch focuses on mapping DRM properties to
> > DC interface and these are my doubts so far:
> >=20
> > - To configure a shaper LUT, I related it to the current configuration
> >   of gamma 1D. For dc_transfer_func, I should set tf according to the
> >   input space, that means, LINEAR for shaper LUT after blending, right?
> >   When 3D LUT is set, the input space for gamma 1D will no longer be
> >   linear, so how to define the tf?  should I set tf as sRGB, BT709 or
> >   what?
> >=20
>=20
> We don't know the input space. It's nowhere defined in the KMS API. It
> entirely depends on how a compositor renders the framebuffer (or transfor=
ms
> it using some future KMS plane API).
>=20
> DC interfaces are designed for a system where the driver is aware of the =
input
> color space and linearity/non-linearity. This means that you'll often need
> to dig through the API down to the HW programming bits to understand what
> it actually does. A leaky abstraction, essentially.
>=20
> Because KMS drivers don't know the linearity/non-linearity at any point
> int the pipeline we need an API where the KMS client provides the
> appropriate shaper LUT. In the case of any current KMS client that
> will always be non-colormanaged and is assumed to be sRGB.
>=20
> If your framebuffer is non-linear (sRGB) and you're not linearizing it
> using the CRTC Degamma you'll already have non-linear values and won't
> need to program the shaper LUT (i.e. use it in bypass or linear).
>=20
> If your framebuffer is linear and you're not de-linearizing it with the
> CRTC Degamma LUT you'll have linear values and need to program the
> inverse EOTF for sRGB in your shaper (or degamma) LUT.
>=20
> > - I see the 3dlut values being mapped to struct tetrahedral_17 as four
> >   arrays lut0-4. From that I am considering tetrahedral interpolation.
> >   Is there any other interpolation option? Also, as the total size of t=
he
> >   four arrays is the same of the 3D LUT size, I'm mapping DRM color lut
> >   values in ascending order, starting by filling lut0 to lut4. Is it ri=
ght
> >   or is there another way to distribute these values across lut0-4 arra=
ys?
> >=20
>=20
> We seem to do this on other platforms (illustrating for red only)
>=20
> for (lut_i =3D 0, i =3D 0; i < lut_size-4; lut_i++, i +=3D 4) {
> 	lut0[lut_i].red =3D rgb[i].red;
> 	lut1[lut_i].red =3D rgb[i + 1].red;
> 	lut2[lut_i].red =3D rgb[i + 2].red;
> 	lut3[lut_i].red =3D rgb[i + 3].red;
> }
> lut0[lut_i].red =3D rgb[i].red;
>=20
> And yes, it uses tetrahedral interpolation.
>=20
> > - I also see tetrahedral 9x9x9, that means DC supports 9x9x9 3D LUT too?
> >   If so, does it depend on hw caps or it is defined by the user? Also, I
> >   see 10 and 12 bits color channel precision, does it depend on hw caps=
 or
> >   it is also defined by the userspace? Any ideas on how to expose it?
> >=20
>=20
> This is user-configurable, HW supports both 9^3 and 17^3 and both 10 and
> 12-bit variants.
>=20
> > - Why func_shaper and lut3d_func are defined as constant on
> >   dc_stream_state, while the other color properties are not? How should
> >   I change them from the proposed DRM properties? should I set 3D LUT i=
n a
> >   different struct of the DC interface or a different DC pipeline stage?
> >=20
>=20
> It's a pointer to constant struct. If you want to change it you should
> allocate a new func_shaper or lut3d_func struct.
>=20
> See https://www.internalpointers.com/post/constant-pointers-vs-pointer-co=
nstants-c-and-c
>=20
> > - In mpc3_program_3dlut(), why we are setting is_12bits_color_channel in
> >   get3dlut_config(), since right after that we are changing its values
> >   with this line `is_12bits_color_channel =3D params->use_12bits`?
> >=20
>=20
> We're reading the HW default to be used unless someone sets use_12bits
> but then we're always setting it based on use_12bits anyways. We wouldn't
> need the former but it's code that's never hurt anyone. :)
>=20
> > - In mpc3_set3dlut_ram10(), there is a suspicious comment for a shift
> >   operation: `should we shift red 22bit and green 12? ask Nvenko` So, is
> >   this operation stable/working as expected?
> >=20
>=20
> You can safely ignore this, at least as long as your LUT programming work=
s.
> If it doesn't this comment is an indication of what you can try.

Hi Harry,

So, I need to fix many points to program 3D LUT on AMD correctly...
Thanks for explaining all questions, from this, I'm working on a new
version.

Best Regards,

Melissa



>=20
> Harry
>=20
> > Thanks in advance for clarifications,
> >=20
> > Melissa
> >=20
> > [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart=
+renesas@ideasonboard.com/
> > [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc17=
cbb4656fe23e69
> > [3] https://lore.kernel.org/amd-gfx/20220505220744.3sex7ka2ha2vcguv@mai=
l.igalia.com/
> >=20
> > Melissa Wen (5):
> >   Documentation/amdgpu_dm: Add DM color correction documentation
> >   Documentation/amdgpu/display: add DC color caps info
> >   drm/drm_color_mgmt: add shaper LUT to color mgmt properties
> >   drm/drm_color_mgmt: add 3D LUT to color mgmt properties
> >   drm/amd/display: mapping new DRM 3D LUT properties to AMD hw blocks
> >=20
> >  .../amdgpu/display/dcn2_cm_drm_current.svg    | 1370 +++++++++++++++
> >  .../amdgpu/display/dcn3_cm_drm_current.svg    | 1528 +++++++++++++++++
> >  .../gpu/amdgpu/display/display-manager.rst    |   44 +
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    2 +-
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |    5 +-
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  265 ++-
> >  drivers/gpu/drm/amd/display/dc/dc.h           |   53 +-
> >  drivers/gpu/drm/amd/display/dc/dc_stream.h    |    4 +-
> >  drivers/gpu/drm/drm_atomic_state_helper.c     |    7 +
> >  drivers/gpu/drm/drm_atomic_uapi.c             |   20 +
> >  drivers/gpu/drm/drm_color_mgmt.c              |   89 +-
> >  drivers/gpu/drm/drm_fb_helper.c               |    5 +
> >  drivers/gpu/drm/drm_mode_config.c             |   28 +
> >  include/drm/drm_color_mgmt.h                  |    4 +
> >  include/drm/drm_crtc.h                        |   24 +-
> >  include/drm/drm_mode_config.h                 |   25 +
> >  16 files changed, 3411 insertions(+), 62 deletions(-)
> >  create mode 100644 Documentation/gpu/amdgpu/display/dcn2_cm_drm_curren=
t.svg
> >  create mode 100644 Documentation/gpu/amdgpu/display/dcn3_cm_drm_curren=
t.svg
> >=20
>=20

--cd4z3tfawg6yyrxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLNnkEACgkQwqF3j0dL
ehzgVQ/9FR1MGwVWttxIGVnpIvvnwzTbYQHF/sr/ntPpBv3ZF0I37HdcfH+3kxEw
5hYxnt9/mQTYo8nBzLV+8RVIxL9bkoOy4CMypiSqMPAjh5CovHpWyfC569nceWiN
vb8inxFRCK3Lzis3gxtczdv4v31AlVGP9+YTvoiBz/LHldu5tKnjJEYbdTUeNTxy
hw//M+11W75Kz3Ey6ocHKYNKr95PuBBlxsI9fLdFtSSU1pCqpPKEE+sqigPZ+u/I
cKiDGVvzN99Vj1kyhZw6HtEtLdmmqqodwIHAa1DwkDgWmAaTNzgwa4sOlO3xI2Yn
dwp4tvJYacmPUt2gTkmU0w3N1ugUSk+UVRrA3W62sUGwRuTIINVeMvn7b5/Krbmw
g1rgVoEI4g77r1zlQ+jPbjAki3V4VW4HNAKrMtaptsi8BDbHE0Lrx+orJWf+wdQN
3ZahOGicGlr8zbwhvCBGd5dOIJH0CeBAS8PPobIDVqfNKRo2jkhmHPXR03e45dzS
ViZN6aTjOnj5XTfEEPuZrknKfTz0IhtwesdE4cg5RBtOjDtaJ0CtsCOZEF32weTm
z/TGXRKsuE87YkJlkmLC/pant94tlbFjbc6b20kJ/8yFGpVX6518zWVf/Vd6m+o3
3t/L1O/I/lgx0XwHiXsExuVtjhLyKFt+gO4PfdhrR0BTu/Sht4o=
=0bz5
-----END PGP SIGNATURE-----

--cd4z3tfawg6yyrxm--
