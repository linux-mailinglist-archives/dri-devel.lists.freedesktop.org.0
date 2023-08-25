Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE3B788BD8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010C310E6AF;
	Fri, 25 Aug 2023 14:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2F210E6B0;
 Fri, 25 Aug 2023 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o5p34PDcTghp4IcXJxW0IU2VOTknJHaApVKT199fn3s=; b=I2qDPBhnFldD3ja8tpXs/OJJyX
 hrNyiCsMaO91/4v8Wb6ZSCcveOE/K2qM15LzqEslU81JJkOIfNk+RedGtQ4bzSDD9Lo9xakRSkXGQ
 wpu/W/1Ci9Jq0+ErdjLvF89qbe+l/oY1dnWsu9dF8bahvxzFu/wXBUAVXRBbg3kamgZi9qWaY8nQE
 izTrL4+xPpAqSW4LfyO0YivQwM9kp7ut8Nf6g8ewvul5zYv+eElu593hJiyJzlhlindbEW+IfQp1O
 ar9g0eQp1RFJrNZ/hqTEaZDdqysyy4f9vvKkyku1hhA1r6IFwbvYJWoBEkROSbgvCaUxw7+vGmJYX
 g1cUrORQ==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qZXw9-00FJV4-IC; Fri, 25 Aug 2023 16:37:21 +0200
Date: Fri, 25 Aug 2023 13:37:08 -0100
From: Melissa Wen <mwen@igalia.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v2 31/34] drm/amd/display: set stream gamut remap matrix
 to MPC for DCN301
Message-ID: <20230825143708.hpndb5gmrdj3sjpp@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-32-mwen@igalia.com>
 <20230822153030.4d410ff9.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wl6emhv5tvlbwx44"
Content-Disposition: inline
In-Reply-To: <20230822153030.4d410ff9.pekka.paalanen@collabora.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wl6emhv5tvlbwx44
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/22, Pekka Paalanen wrote:
> On Thu, 10 Aug 2023 15:03:11 -0100
> Melissa Wen <mwen@igalia.com> wrote:
>=20
> > dc->caps.color.mpc.gamut_remap says there is a post-blending color block
> > for gamut remap matrix for DCN3 HW family and newer versions. However,
> > those drivers still follow DCN10 programming that remap stream
> > gamut_remap_matrix to DPP (pre-blending).
>=20
> That's ok only as long as CRTC degamma is pass-through. Blending itself
> is a linear operation, so it doesn't matter if a matrix is applied to
> the blending result or to all blending inputs. But you cannot move a
> matrix operation to the other side of a non-linear operation, and you
> cannot move a non-linear operation across blending.

Oh, I'm not moving it, what I'm doing here is the opposite and fixing
it. This patch puts each pre- and post-blending CTM in their right
place, since we have the HW caps for it on DCN3+... Or are you just
pointing out the implementation mistake on old driver versions?

>=20
>=20
> Thanks,
> pq
>=20
> > To enable pre-blending and post-blending gamut_remap matrix supports at
> > the same time, set stream gamut_remap to MPC and plane gamut_remap to
> > DPP for DCN301 that support both.
> >=20
> > It was tested using IGT KMS color tests for DRM CRTC CTM property and it
> > preserves test results.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 37 +++++++++++++++++++
> >  .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |  3 ++
> >  .../drm/amd/display/dc/dcn301/dcn301_init.c   |  2 +-
> >  3 files changed, 41 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drive=
rs/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > index 4cd4ae07d73d..4fb4e9ec03f1 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > @@ -186,6 +186,43 @@ bool dcn30_set_input_transfer_func(struct dc *dc,
> >  	return result;
> >  }
> > =20
> > +void dcn30_program_gamut_remap(struct pipe_ctx *pipe_ctx)
> > +{
> > +	int i =3D 0;
> > +	struct dpp_grph_csc_adjustment dpp_adjust;
> > +	struct mpc_grph_gamut_adjustment mpc_adjust;
> > +	int mpcc_id =3D pipe_ctx->plane_res.hubp->inst;
> > +	struct mpc *mpc =3D pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
> > +
> > +	memset(&dpp_adjust, 0, sizeof(dpp_adjust));
> > +	dpp_adjust.gamut_adjust_type =3D GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
> > +
> > +	if (pipe_ctx->plane_state &&
> > +	    pipe_ctx->plane_state->gamut_remap_matrix.enable_remap =3D=3D tru=
e) {
> > +		dpp_adjust.gamut_adjust_type =3D GRAPHICS_GAMUT_ADJUST_TYPE_SW;
> > +		for (i =3D 0; i < CSC_TEMPERATURE_MATRIX_SIZE; i++)
> > +			dpp_adjust.temperature_matrix[i] =3D
> > +				pipe_ctx->plane_state->gamut_remap_matrix.matrix[i];
> > +	}
> > +
> > +	pipe_ctx->plane_res.dpp->funcs->dpp_set_gamut_remap(pipe_ctx->plane_r=
es.dpp,
> > +							    &dpp_adjust);
> > +
> > +	memset(&mpc_adjust, 0, sizeof(mpc_adjust));
> > +	mpc_adjust.gamut_adjust_type =3D GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
> > +
> > +	if (pipe_ctx->top_pipe =3D=3D NULL) {
> > +		if (pipe_ctx->stream->gamut_remap_matrix.enable_remap =3D=3D true) {
> > +			mpc_adjust.gamut_adjust_type =3D GRAPHICS_GAMUT_ADJUST_TYPE_SW;
> > +			for (i =3D 0; i < CSC_TEMPERATURE_MATRIX_SIZE; i++)
> > +				mpc_adjust.temperature_matrix[i] =3D
> > +					pipe_ctx->stream->gamut_remap_matrix.matrix[i];
> > +		}
> > +	}
> > +
> > +	mpc->funcs->set_gamut_remap(mpc, mpcc_id, &mpc_adjust);
> > +}
> > +
> >  bool dcn30_set_output_transfer_func(struct dc *dc,
> >  				struct pipe_ctx *pipe_ctx,
> >  				const struct dc_stream_state *stream)
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h b/drive=
rs/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> > index a24a8e33a3d2..cb34ca932a5f 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> > @@ -58,6 +58,9 @@ bool dcn30_set_blend_lut(struct pipe_ctx *pipe_ctx,
> >  bool dcn30_set_input_transfer_func(struct dc *dc,
> >  				struct pipe_ctx *pipe_ctx,
> >  				const struct dc_plane_state *plane_state);
> > +
> > +void dcn30_program_gamut_remap(struct pipe_ctx *pipe_ctx);
> > +
> >  bool dcn30_set_output_transfer_func(struct dc *dc,
> >  				struct pipe_ctx *pipe_ctx,
> >  				const struct dc_stream_state *stream);
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c b/driv=
ers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> > index 257df8660b4c..81fd50ee97c3 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> > @@ -33,7 +33,7 @@
> >  #include "dcn301_init.h"
> > =20
> >  static const struct hw_sequencer_funcs dcn301_funcs =3D {
> > -	.program_gamut_remap =3D dcn10_program_gamut_remap,
> > +	.program_gamut_remap =3D dcn30_program_gamut_remap,
> >  	.init_hw =3D dcn10_init_hw,
> >  	.power_down_on_boot =3D dcn10_power_down_on_boot,
> >  	.apply_ctx_to_hw =3D dce110_apply_ctx_to_hw,
>=20

--wl6emhv5tvlbwx44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmTovJQACgkQwqF3j0dL
ehy00Q/+JNvzZkN+aRomiGvIj9Vt5di7Az/9zeSM0m3n6wRYVaHU9UNDOcaeLtqb
XAzYssJYoJzzB2Ytkluuh9rRCKys/AiX3KIiR5ZTY4EGZoHnf772peHc0Y6EVoFp
XhA6Gniyn0OEkem9Ad6COMdAxteMSf4BDOvX2ze+QPfD5mnRwOrXAtSdarNHzrff
09GSVQztOB1Ciwzazj8nWv9mTAQ7oz5utcsCgbe2xwvmknQZfpqoqR3yQUjx20Al
WJS8Ub+UDvkNLUbxaa77Zy6OQNrOFcVGeWE1k2RTPTl33flFgItEsoGx86xzGfZG
XH9e9GyDCXCHLIXFeulSt5ieLifu8VEOORCyXlqcL7y+IZFMgRoMiFeG+MVJW0sc
dAYF7VofqKGzSpIhUsM8k0viChz48HpSh9+E+zfX+8t6fCJTlGYuemcCeLqMj/NZ
M1vw+NutWoZ/rUXt8nWDPqE+x69zp7EBPwhSpRPzHhSima/ulLrw7xmsqxFChFHO
tkobw/s5nUp1ubCvwM/7mGLKKhy+3N9QXvT3h0nkVBaBYgJHylidvfJbFLrdRG+6
v5o4ptUreSjdhqFkI4KBsa3TeEOEjoLZwPKqa7173r/zOymGqy02tnAFhjea0NSW
qrItzwQZ/a0IJmvmh/OnJYXpHbToTFfugY7rgpBkb4zToHjpHpI=
=2+6Z
-----END PGP SIGNATURE-----

--wl6emhv5tvlbwx44--
