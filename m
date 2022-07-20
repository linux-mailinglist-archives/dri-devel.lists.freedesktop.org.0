Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284AB57BFA5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 23:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7595A14BB3E;
	Wed, 20 Jul 2022 21:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6432C14BB3E;
 Wed, 20 Jul 2022 21:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9v13iavs6lCgOil43aovldoYre9cJyzLP8S/FRwNDeE=; b=XmePOprAw7LmnVZrztG6P2OCzI
 Qhw/WQqcrmphUeMlVfw3NlclyuohttUrjI1QqMS6sWjiHcf0LZnT9LXv+4r4m+Uk7Dc2FOrfn1eW5
 wmh1bzTJLWMZRTIxh8IgZcF+Jcr4DGQHcDhYprHVhfmuswhtYDyswqSkQ0k6bNVfU3n08FY8qa4ij
 ffvvlwoQsQEImo+vAAGiznr5Mf8YceLD+OnRfuakj8gzoJ0Q7Kxb3z/3MO3S/Ba8ZpJUo5ZXZSO6n
 2mCzvKTm9OR5UTiQ5aDwbLJPj94NVpKsFeyiFPL44Ze78LFnjyLQSC9NV7HdBH3C+SoffkGEuOVyb
 UnK1rreg==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEHKN-000mA8-Lz; Wed, 20 Jul 2022 23:33:55 +0200
Date: Wed, 20 Jul 2022 20:33:42 -0100
From: Melissa Wen <mwen@igalia.com>
To: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Subject: Re: [PATCH 3/4] drm/amd/display: add doc entries for MPC blending
 configuration
Message-ID: <20220720213323.r6tg3vzp2jtbbed2@mail.igalia.com>
References: <20220716222529.421115-1-mwen@igalia.com>
 <20220716222529.421115-4-mwen@igalia.com>
 <26ceed85-c9f8-4b01-58e1-f6f1b4250f09@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ksv4hwwpx54eiils"
Content-Disposition: inline
In-Reply-To: <26ceed85-c9f8-4b01-58e1-f6f1b4250f09@gmail.com>
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


--ksv4hwwpx54eiils
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4b2z5bxgoowflqf"
Content-Disposition: inline


--j4b2z5bxgoowflqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/17, Tales Lelo da Aparecida wrote:
> On 16/07/2022 19:25, Melissa Wen wrote:
> > Describe structs and enums used to set blend mode properties to MPC
> > blocks. Some pieces of information are already available as code
> > comments, and were just formatted. Others were collected and summarised
> > from discusssions on AMD issue tracker[1][2].
>=20
> Typo in the commit message: discusssions -> discussions
>=20
> >=20
> > [1] https://gitlab.freedesktop.org/drm/amd/-/issues/1734
> > [2] https://gitlab.freedesktop.org/drm/amd/-/issues/1769
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 91 +++++++++++++++++----
> >   1 file changed, 77 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/=
drm/amd/display/dc/inc/hw/mpc.h
> > index 5097037e3962..cf28b841c42d 100644
> > --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > @@ -22,6 +22,16 @@
> >    *
> >    */
> > +/**
> > + * DOC: mpc-overview
> > + *
> > + * Multiple Pipe/Plane Combined (MPC) is a component in the hardware p=
ipeline
> > + * that performs blending of multiple planes, using global and per-pix=
el alpha.
> > + * It also performs post-blending color correction operations accordin=
g to the
> > + * hardware capabilities, such as color transformation matrix and gamm=
a 1D and
> > + * 3D LUT.
> > + */
> > +
> >   #ifndef __DC_MPCC_H__
> >   #define __DC_MPCC_H__
> > @@ -48,14 +58,39 @@ enum mpcc_blend_mode {
> >   	MPCC_BLEND_MODE_TOP_BOT_BLENDING
> >   };
> > +/**
> > + * enum mpcc_alpha_blend_mode - define the alpha blend mode regarding =
pixel
> > + * alpha and plane alpha values
> > + */
> >   enum mpcc_alpha_blend_mode {
> > +	/**
> > +	 * @MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA: per pixel alpha using DPP
> > +	 * alpha value
> > +	 */
> >   	MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA,
> > +	/**
> > +	 * @MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN: per
> > +	 * pixel alpha using DPP alpha value multiplied by a global gain (pla=
ne
> > +	 * alpha)
> > +	 */
> >   	MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN,
> > +	/**
> > +	 * @MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA: global alpha value, ignores
> > +	 * pixel alpha and consider only plane alpha
> > +	 */
> >   	MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA
> >   };
> > -/*
> > - * MPCC blending configuration
> > +/**
> > + * struct mpcc_blnd_cfg - MPCC blending configuration
> > + *
> > + * @black_color: background color
> > + * @alpha_mode: alpha blend mode (MPCC_ALPHA_BLND_MODE)
> > + * @pre_multiplied_alpha: whether pixel color values were pre-multipli=
ed by the
> > + * alpha channel (MPCC_ALPHA_MULTIPLIED_MODE)
> > + * @global_gain: used when blend mode considers both pixel alpha and p=
lane
> > + * alpha value and assumes the global alpha value.
> > + * @global_alpha: plane alpha value
>=20
> There's quite a few members missing definition. After reading the 4th pat=
ch
> may I conclude that they weren't relevant for what's being described about
> alpha blending?

Hi Tales,

although they aren't changed for DRM blend modes programming, it would
be nice if someone can describe them and also avoid those warnings. I
wasn't able to identify how they behave for MPC programming (hope
someone from AMD can help on documenting them).

>=20
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function
> parameter or member 'overlap_only' not described in 'mpcc_blnd_cfg'
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function
> parameter or member 'bottom_gain_mode' not described in 'mpcc_blnd_cfg'
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function
> parameter or member 'background_color_bpc' not described in 'mpcc_blnd_cf=
g'
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function
> parameter or member 'top_gain' not described in 'mpcc_blnd_cfg'
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function
> parameter or member 'bottom_inside_gain' not described in 'mpcc_blnd_cfg'
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function
> parameter or member 'bottom_outside_gain' not described in 'mpcc_blnd_cfg'
>=20
> >    */
> >   struct mpcc_blnd_cfg {
> >   	struct tg_color black_color;	/* background color */
> > @@ -107,8 +142,15 @@ struct mpc_dwb_flow_control {
> >   	int flow_ctrl_cnt1;
> >   };
> > -/*
> > - * MPCC connection and blending configuration for a single MPCC instan=
ce.
> > +/**
> > + * struct mpcc - MPCC connection and blending configuration for a sing=
le MPCC instance.
>=20
> Might be worth writing the definition of the abbreviation, if not here, in
> the glossary... I couldn't find what the last "C" stands for, my guess wo=
uld
> be "context". hehehe
>=20
> > + * @mpcc_id: MPCC physical instance
> > + * @dpp_id: DPP input to this MPCC
> > + * @mpcc_bot: pointer to bottom layer MPCC. NULL when not connected.
> > + * @blnd_cfg: the blending configuration for this MPCC
> > + * @sm_cfg: stereo mix setting for this MPCC
> > + * @shared_bottom: if MPCC output to both OPP and DWB endpoints, true.=
 Othewise, false.
>=20
> Typo Othewise -> Otherwise
>=20
> > + *
> >    * This struct is used as a node in an MPC tree.
> >    */
> >   struct mpcc {
> > @@ -120,8 +162,12 @@ struct mpcc {
> >   	bool shared_bottom;		/* TRUE if MPCC output to both OPP and DWB endp=
oints, else FALSE */
> >   };
> > -/*
> > - * MPC tree represents all MPCC connections for a pipe.
> > +/**
> > + * struct mpc_tree - MPC tree represents all MPCC connections for a pi=
pe.
> > + *
> > + * @opp_id: the OPP instance that owns this MPC tree
> > + * @opp_list: the top MPCC layer of the MPC tree that outputs to OPP e=
ndpoint
> > + *
> >    */
> >   struct mpc_tree {
> >   	int opp_id;			/* The OPP instance that owns this MPC tree */
> > @@ -149,13 +195,18 @@ struct mpcc_state {
> >   	uint32_t busy;
> >   };
> > +/**
> > + * struct mpc_funcs - funcs
> > + */
> >   struct mpc_funcs {
> >   	void (*read_mpcc_state)(
> >   			struct mpc *mpc,
> >   			int mpcc_inst,
> >   			struct mpcc_state *s);
> > -	/*
> > +	/**
> > +	 * @insert_plane:
> > +	 *
> >   	 * Insert DPP into MPC tree based on specified blending position.
> >   	 * Only used for planes that are part of blending chain for OPP outp=
ut
> >   	 *
> > @@ -180,7 +231,9 @@ struct mpc_funcs {
> >   			int dpp_id,
> >   			int mpcc_id);
> > -	/*
> > +	/**
> > +	 * @remove_mpcc:
> > +	 *
> >   	 * Remove a specified MPCC from the MPC tree.
> >   	 *
> >   	 * Parameters:
> > @@ -195,7 +248,9 @@ struct mpc_funcs {
> >   			struct mpc_tree *tree,
> >   			struct mpcc *mpcc);
> > -	/*
> > +	/**
> > +	 * @mpc_init:
> > +	 *
> >   	 * Reset the MPCC HW status by disconnecting all muxes.
> >   	 *
> >   	 * Parameters:
> > @@ -208,7 +263,9 @@ struct mpc_funcs {
> >   			struct mpc *mpc,
> >   			unsigned int mpcc_id);
> > -	/*
> > +	/**
> > +	 * @update_blending:
> > +	 *
> >   	 * Update the blending configuration for a specified MPCC.
> >   	 *
> >   	 * Parameters:
> > @@ -223,7 +280,9 @@ struct mpc_funcs {
> >   		struct mpcc_blnd_cfg *blnd_cfg,
> >   		int mpcc_id);
> > -	/*
> > +	/**
> > +	 * @cursor_lock:
> > +	 *
> >   	 * Lock cursor updates for the specified OPP.
> >   	 * OPP defines the set of MPCC that are locked together for cursor.
> >   	 *
> > @@ -239,8 +298,10 @@ struct mpc_funcs {
> >   			int opp_id,
> >   			bool lock);
> > -	/*
> > -	 * Add DPP into 'secondary' MPC tree based on specified blending posi=
tion.
> > +	/**
> > +	 * @insert_plane_to_secondary:
> > +	 *
> > +	 * Add DPP into secondary MPC tree based on specified blending positi=
on.
> >   	 * Only used for planes that are part of blending chain for DWB outp=
ut
> >   	 *
> >   	 * Parameters:
> > @@ -264,7 +325,9 @@ struct mpc_funcs {
> >   			int dpp_id,
> >   			int mpcc_id);
> > -	/*
> > +	/**
> > +	 * @remove_mpcc_from_secondary:
> > +	 *
> >   	 * Remove a specified DPP from the 'secondary' MPC tree.
> >   	 *
> >   	 * Parameters:
>=20
> Thanks for the patch,
> Tales Aparecida

Thanks for reviewing them. I'll address your suggestions in the next
version.

Melissa


--j4b2z5bxgoowflqf--

--ksv4hwwpx54eiils
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLYdLYACgkQwqF3j0dL
ehxxIw//Sp1BYUgxl01uGFGOUCoWl4uab9eJ7dbl12kEdHhuQ0IzHWWS0oWm7LlP
veBPzQsfB64GNW5knpHgiQ6mhG3sVjTg1x2JwbJdYcOdVPymnkho8uzr236kF/Nk
3l4klJlaCvePJ+r9bUZnRZ0qMVwYxT2C3Hg8b4ezgPzZdNlRjWw9G5Yi6JdneGgP
SzNnzWgz0HKIJIsi9LS3kIMLhPPZC9ZvILRhvdCvgPk/G0QeAnlnZ9ZvKu80V8+I
Bjx/xxxx1tb8sdC9I/krnOG8B1yjWDoWb3604f58Or23xfHWq/TuTX5tLG6UnUai
6htvLPDbSkAaVDwQ6KH40A8JJCiaXwmCcOtiAD/yzAZy9HPNGwIdO4qWALH/lOPb
Vgxna2PWGPSWT4LolNfmDQUFxhbzg0HH0B0quLVW2gvA1Y/pr2TjBy+10Zkx4zRk
QQWavtwbpxa/KclAMzIyeiZ6BsZCTAc5qBKq2miEWa48Xj0BUKXEFWMrSwqlTq1B
S8Wk1abE+nSj7we7D78y/lmZWnaDmbp1rECh3mRyHejP3y97pz/Kve9x472thBTv
egbjmEYbPbBFQCGg6LEOUYwENVyaANW5CKcR6M7RLcP22bSTt/UQ73omfOIa+DFp
XgvECN7nMDJEBhKs9AsJnC+z9iKWLHAkgoY3ZQB1m2Ct10yMc/E=
=y/Ni
-----END PGP SIGNATURE-----

--ksv4hwwpx54eiils--
