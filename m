Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0B413EAF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 02:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECC76E978;
	Wed, 22 Sep 2021 00:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859006E978
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 00:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1632271553;
 bh=hXvO8OuNaSrv4ooeA7gU5YK2T3P3KpeyR9oPEm4Yo00=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kfCZzOV/BNPyfmmev8lERFb8HVJxeVKlts9ZdlReU2u+djE5F0TPYQMTFNkc73tAx
 lypC1B+PrpTDullSCk2CQEgnBtJTmUrVR03tP6+59h6WSDinVZ/RYk0frn0UQP+Hxq
 GIzDQzh8uy5a5H6pPzS3PyGQHKcfYiSgHyVZks8iSyryDDWB32Qjq/6dEFFvb50bg2
 Z0x/lTkYvTv4ZzNCz6tK3lxQ1vW6BJZJMcrFvAjILR019qHwZ3nXWa/6KDuSdY+Xto
 tOkMZ05EGyNUNU1Z2lKVg3wCCKSnLJkMr8MHTqE8XsiyIubQmUGDDHeRoVCn/9KzFE
 6WXAK3Wfi8Pfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HDfjW4Rr6z9sW4;
 Wed, 22 Sep 2021 10:45:51 +1000 (AEST)
Date: Wed, 22 Sep 2021 10:45:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 manasi.d.navare@intel.com, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-next@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v3 03/13] drm/dp: add LTTPR DP 2.0 DPCD
 addresses
Message-ID: <20210922104550.744a96ca@canb.auug.org.au>
In-Reply-To: <YUpjj7IwBqMYSR7z@archlinux-ax161>
References: <cover.1631191763.git.jani.nikula@intel.com>
 <def17e2329722f22c35807be26b35590ccb93bfd.1631191763.git.jani.nikula@intel.com>
 <YUpjj7IwBqMYSR7z@archlinux-ax161>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+_2Du7kYJPSA8cCB7WSmVyA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/+_2Du7kYJPSA8cCB7WSmVyA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Tue, 21 Sep 2021 15:58:23 -0700 Nathan Chancellor <nathan@kernel.org> wr=
ote:
>
> On Thu, Sep 09, 2021 at 03:51:55PM +0300, Jani Nikula wrote:
> > DP 2.0 brings some new DPCD addresses for PHY repeaters.
> >=20
> > Cc: dri-devel@lists.freedesktop.org
> > Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  include/drm/drm_dp_helper.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 1d5b3dbb6e56..f3a61341011d 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1319,6 +1319,10 @@ struct drm_panel;
> >  #define DP_MAX_LANE_COUNT_PHY_REPEATER			    0xf0004 /* 1.4a */
> >  #define DP_Repeater_FEC_CAPABILITY			    0xf0004 /* 1.4 */
> >  #define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT		    0xf0005 /* 1.4a */
> > +#define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER	    0xf0006 /* 2.0 */
> > +# define DP_PHY_REPEATER_128B132B_SUPPORTED		    (1 << 0)
> > +/* See DP_128B132B_SUPPORTED_LINK_RATES for values */
> > +#define DP_PHY_REPEATER_128B132B_RATES			    0xf0007 /* 2.0 */
> > =20
> >  enum drm_dp_phy {
> >  	DP_PHY_DPRX,
> > --=20
> > 2.30.2
> >=20
> >  =20
>=20
> This patch causes a build failure in -next when combined with the AMD
> tree:
>=20
> In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:33:
> In file included from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:70:
> In file included from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.=
h:36:
> ./include/drm/drm_dp_helper.h:1322:9: error: 'DP_MAIN_LINK_CHANNEL_CODING=
_PHY_REPEATER' macro redefined [-Werror,-Wmacro-redefined]
> #define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER            0xf0006 /* 2.=
0 */
>         ^
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dp_types.h:881:9: note: pre=
vious definition is here
> #define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER        0xF0006
>         ^
> 1 error generated.
>=20
> Perhaps something like this should be applied during the merge of the
> second tree or maybe this patch should be in a branch that could be
> shared between the Intel and AMD trees so that this diff could be
> applied to the AMD tree directly? Not sure what the standard procedure
> for this is.
>=20
> Cheers,
> Nathan
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/g=
pu/drm/amd/display/dc/core/dc_link_dp.c
> index 234dfbea926a..279863b5c650 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -4590,7 +4590,7 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
>  								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
> =20
>  		link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.raw =3D
> -				lttpr_dpcd_data[DP_PHY_REPEATER_128b_132b_RATES -
> +				lttpr_dpcd_data[DP_PHY_REPEATER_128B132B_RATES -
>  								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
>  #endif
> =20
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/d=
rm/amd/display/dc/dc_dp_types.h
> index a5e798b5da79..8caf9af5ffa2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> @@ -878,8 +878,6 @@ struct psr_caps {
>  # define DP_DSC_DECODER_COUNT_MASK			(0b111 << 5)
>  # define DP_DSC_DECODER_COUNT_SHIFT			5
>  #define DP_MAIN_LINK_CHANNEL_CODING_SET			0x108
> -#define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER	0xF0006
> -#define DP_PHY_REPEATER_128b_132b_RATES			0xF0007
>  #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1	0xF0022
>  #define DP_INTRA_HOP_AUX_REPLY_INDICATION		(1 << 3)
>  /* TODO - Use DRM header to replace above once available */

Thanks for the heads up.  I have applied the above as a merge fix patch
until something else happens.

--=20
Cheers,
Stephen Rothwell

--Sig_/+_2Du7kYJPSA8cCB7WSmVyA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFKfL4ACgkQAVBC80lX
0Gz2Awf/Q8TFzd9c5tHgftmNV0J36OaxF54OWCngyKdEb1OcK2nrFhQY0pxgaFSx
/pY+fppfi66VxX9b33/SUZo0jxGgSV/UfOXzp/qOr+WZCBUo3ywqtpTPWn9dx4LO
yv2C7sp93Mc8xNhjE3bwMZpTqyqQoTLTPQ/ogiQzGV5be8EE5AIyaFeSFblT71L4
Ah9pS5xQ0eI21anOoi3t4ifqmehhIeu/DP/LjyZE4Q4/jWHwI4pBdn+KccagS/2c
qlml6fQFcEF2kPIYrFssdz1+2/KGwBmFJXED7J2Xac3XnkexcCSyn/XF/OHoqLmc
OL4U7Ry7cZvqmwbfao4tCu+dTF/kNQ==
=+5Xi
-----END PGP SIGNATURE-----

--Sig_/+_2Du7kYJPSA8cCB7WSmVyA--
