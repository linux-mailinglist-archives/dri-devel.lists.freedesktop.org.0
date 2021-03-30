Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA134EC9E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 17:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADB26E926;
	Tue, 30 Mar 2021 15:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4D66E925;
 Tue, 30 Mar 2021 15:35:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DD75223A6;
 Tue, 30 Mar 2021 11:35:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 30 Mar 2021 11:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=FtYc42a6moG7QOyHDjvIAF34l5j
 YgoXhjKeBBMCpSAY=; b=pkLri1415Rs9PAS8cVC5uxc9wKysAoRoiGCxU30K16z
 KbTcy8MwEaYglaAR9p2G1F5+WkVDhdvnSHQyAJUtrh4I3JGMs5EfYu9tinq3SP0Z
 iwSMHPPZYwbD83DL63ca605FGHlyJ6fLtgFiHPCK/3sdvVrdE3oY8Hubch4IwRoU
 qC9ykOslhnA6sDqsHTPNeBPyeo3exCEze56tmYPz0z3SepF9T0+axzoyvlCTU47j
 qp8WLcTIXrF+dgY3lKR3naQiPfec343KOn5lJmFpsHFGd7h1WVdJb+AkpgMdLez+
 NMte+nHG9ufc3z5vyfKynqOAOVjEiZ1Rm+Fh+yyrLig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FtYc42
 a6moG7QOyHDjvIAF34l5jYgoXhjKeBBMCpSAY=; b=jW5b26byLCV+AjIt/u+F15
 ZRpj0bqnKrUjnNGB4MI2KPYNNlngsRHZ/pWfvq/zgcepIQG8w8NCyKi+LpkDkTu6
 eNrR3quV6sGek9Rq9DR3n/OS9tqVUXlK+o6xAsbshSKXkHCt7tvc3UMDyLvy2l2s
 +nrYoflD4HJBor+0pbvlLuZykeWwJsXPs/LxCVSeBdw/euHytiDqvlujEJ1Vxm6s
 8b7BPDL+OfPjFL+07GZR32A8SwUw09jWAb9LHKUNqg5OVLA80jVvDah4QDOxT4Ho
 JYVLXcrqlgODDnhCu91oiIh6cW+AoaTFNJY3ZZm2Y0huMJt6FG+SFvgyDNlpr0Sg
 ==
X-ME-Sender: <xms:QUVjYAd1SfHuwoVOJUc6SubhtvxHUlddWymUgbDwPD8XlERIDespYw>
 <xme:QUVjYCM61feyDIQU8vnKKeGRUeEgXSUgM3NaAff8FiREQr0GFyTFxJvbOMjdanPTA
 QUnWvEp-fNlhnwgKT8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QUVjYBiLqQEDRU58uZ8DHqiCT1LmioKoO_by12zvb99ZjKnLtqfnWg>
 <xmx:QUVjYF81K1fwXSkYuT7zCIgHflJM6YgRoJE2FsiP6Ly6XkPbFPArJA>
 <xmx:QUVjYMvXMMGAGLGYi7hJGPdaPaVnmvJ6owO8QnnkU3oEFxDkP9YSWg>
 <xmx:Q0VjYAgqKil7BAqk7OdU4rtMyTzYd2mUQaId-_h1jRM1axCPRhaXaw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C1E11080057;
 Tue, 30 Mar 2021 11:35:29 -0400 (EDT)
Date: Tue, 30 Mar 2021 17:35:27 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 10/11] drm: Use state helper instead of the plane
 state pointer
Message-ID: <20210330153527.gw33t4o2b35wwzbg@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-10-maxime@cerno.tech>
 <161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
In-Reply-To: <161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0227614882=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0227614882==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yzekckmcck6rsmon"
Content-Disposition: inline


--yzekckmcck6rsmon
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, Mar 29, 2021 at 06:52:01PM -0700, Stephen Boyd wrote:
> Trimming Cc list way down, sorry if that's too much.
>=20
> Quoting Maxime Ripard (2021-02-19 04:00:30)
> > Many drivers reference the plane->state pointer in order to get the
> > current plane state in their atomic_update or atomic_disable hooks,
> > which would be the new plane state in the global atomic state since
> > _swap_state happened when those hooks are run.
>=20
> Does this mean drm_atomic_helper_swap_state()?

Yep. Previous to that call in drm_atomic_helper_commit, plane->state is
the state currently programmed in the hardware, so the old state (that's
the case you have with atomic_check for example)

Once drm_atomic_helper_swap_state has run, plane->state is now the state
that needs to be programmed into the hardware, so the new state.

> > Use the drm_atomic_get_new_plane_state helper to get that state to make=
 it
> > more obvious.
> >=20
> > This was made using the coccinelle script below:
> >=20
> > @ plane_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > (
> >  static const struct drm_plane_helper_funcs helpers =3D {
> >         ...,
> >         .atomic_disable =3D func,
> >         ...,
> >  };
> > |
> >  static const struct drm_plane_helper_funcs helpers =3D {
> >         ...,
> >         .atomic_update =3D func,
> >         ...,
> >  };
> > )
> >=20
> > @ adds_new_state @
> > identifier plane_atomic_func.func;
> > identifier plane, state;
> > identifier new_state;
> > @@
> >=20
> >  func(struct drm_plane *plane, struct drm_atomic_state *state)
> >  {
> >         ...
> > -       struct drm_plane_state *new_state =3D plane->state;
> > +       struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_=
state(state, plane);
> >         ...
> >  }
> >=20
> > @ include depends on adds_new_state @
> > @@
> >=20
> >  #include <drm/drm_atomic.h>
> >=20
> > @ no_include depends on !include && adds_new_state @
> > @@
> >=20
> > + #include <drm/drm_atomic.h>
> >   #include <drm/...>
> >=20
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c       | 3 ++-
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c      | 4 +++-
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c      | 3 ++-
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 31071f9e21d7..e8ce72fe54a4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1244,7 +1244,8 @@ static void dpu_plane_atomic_update(struct drm_pl=
ane *plane,
> >                                 struct drm_atomic_state *state)
> >  {
> >         struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > -       struct drm_plane_state *new_state =3D plane->state;
> > +       struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_=
state(state,
> > +                                                                      =
    plane);
> > =20
> >         pdpu->is_error =3D false;
> > =20
>=20
> This is oopsing for me. It turns out that 'new_state' is NULL. According
> to the comments drm_atomic_get_new_plane_state() can return NULL if the
> plane isn't part of the global state. I haven't looked much further but
> wanted to report it here in case that type of return value makes sense.

Yeah, it can return NULL, but in this case I'm not really sure how we
could end up with a plane_state that isn't in the global state, but
somehow with the associated plane atomic_update call being run :/

Maxime

--yzekckmcck6rsmon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYGNFPwAKCRDj7w1vZxhR
xT66AQCBwUC3/zX2ho+dPE63dTDnJVeTqhxvdKRAtI6bFvZwdAD5Ad+Acvl+oElk
wpeNhdIrOTyHieNNht1KzaQ5EkO4fwU=
=Elec
-----END PGP SIGNATURE-----

--yzekckmcck6rsmon--

--===============0227614882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0227614882==--
