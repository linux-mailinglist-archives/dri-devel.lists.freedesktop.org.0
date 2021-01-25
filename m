Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C2630381C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083266E44B;
	Tue, 26 Jan 2021 08:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2323B6E046;
 Mon, 25 Jan 2021 09:07:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8B7505806D9;
 Mon, 25 Jan 2021 04:07:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 25 Jan 2021 04:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=JiTUH6NbhECvc0BAfVIYFzk8Pbx
 ygiTICPCrQkvqTSs=; b=mOVG3LwoCHMVO1OCxS7SRLBDZp/kcDvrWYp20pQUxHF
 B3+oAHD93iFsZpiUnOmpqnFuOE8Ohm5oAKE9cx/mG91aqv+fVhcSC1k1YisgY3K8
 oUdHU5oLeJzRQYIyYjOO7zzvhCrKmw+a8m+f+vbwHiShvuWElLlQ9HMz8lczZZYA
 SeTKM5Lq/7UhNYJD7hlCaf8niMZPAKeTVjj0UPqm6SckBaG1b+W8beTSDTPOBaU6
 V9gVF/GdpSYKJmB7HHsl/A2FUtgu0bB0Gmf1bS5qXOmdGnJl1c1Oa8BOJmsHusB6
 HIfyK4q/IJqUEjTnXDN7VTXsBR+coYCI6qhxjDMavpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JiTUH6
 NbhECvc0BAfVIYFzk8PbxygiTICPCrQkvqTSs=; b=c7ArYP6TU8pLfNGg1E1pEc
 KabWCdPnPVNCeoYYhXkxhoIwypP234hG7gDRGdhHxy5WUwm3SyU5IWUKOPwdcz+K
 niWbcw4xhq84tCPwk9JZxGvryXu9PVMDthjKh0NKJs/oI21S7mPSVCY6v965Zotf
 BPTEJ3oDXMV0cg+V7oKf4YTHacsjdIbUdbr9INxEXDGgiiWSqyY0OZsqot32+DLL
 sdvFTdPoAWuYw0C9tvUB/HQiAnvfnab/5Ooe+qYUllJUritDNfiN9Qs6NXXn2fhq
 ZNV5wWAoLEzruIS1Cg19Q1FhYjkCYAS2PRoQsNuHKvyFcmVMZq/8E6L2d8ZHkzeA
 ==
X-ME-Sender: <xms:YooOYPFSGIu89Kgs9BAoaIPvFOf2LHOAYDlWnh0P4OmZs5089oY5qA>
 <xme:YooOYMXyAdCpU7lmzFUEsyEv7CUh2Cv1tbKJlyX53EPy_o1E1pPA4tCzlPLa2axVm
 hTOZ_Kmx9Vy0LC1f-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YooOYBK07eshggnGeuMT97QR_46r2s9gfTqQW-1j5-U87_TFZhvoEg>
 <xmx:YooOYNFDeeUjD4mJnHZOSBxey_bHEAVe5qIwMbYMBtdBy24DWIQsCw>
 <xmx:YooOYFVqf6b59gJSLl6aZAjzb0TL78pRq-5tPTB1vpRfjqC9YTxG3g>
 <xmx:ZIoOYGvaHC3xi9OZuNeQH3r1_ByPhKhcLh221NI8ZGJUux18bUH2Xw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 552DE24005A;
 Mon, 25 Jan 2021 04:07:46 -0500 (EST)
Date: Mon, 25 Jan 2021 10:07:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 06/11] drm: Use state helper instead of plane state
 pointer in atomic_check
Message-ID: <20210125090744.txiofqzevcoturyl@gilmour>
References: <20210121163537.1466118-1-maxime@cerno.tech>
 <20210121163537.1466118-6-maxime@cerno.tech>
 <YAq/+udQfTwdamQ0@intel.com>
MIME-Version: 1.0
In-Reply-To: <YAq/+udQfTwdamQ0@intel.com>
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1231940713=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1231940713==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vtqax52knlanow52"
Content-Disposition: inline


--vtqax52knlanow52
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,

On Fri, Jan 22, 2021 at 02:07:22PM +0200, Ville Syrj=E4l=E4 wrote:
> On Thu, Jan 21, 2021 at 05:35:31PM +0100, Maxime Ripard wrote:
> > Many drivers reference the plane->state pointer in order to get the
> > current plane state in their atomic_check hook, which would be the old
> > plane state in the global atomic state since _swap_state hasn't happened
> > when atomic_check is run.
> >=20
> > Use the drm_atomic_get_old_plane_state helper to get that state to make
> > it more obvious.
> >=20
> > This was made using the coccinelle script below:
> >=20
> > @ plane_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > static struct drm_plane_helper_funcs helpers =3D {
> > 	...,
> > 	.atomic_check =3D func,
> > 	...,
> > };
> >=20
> > @ replaces_old_state @
> > identifier plane_atomic_func.func;
> > identifier plane, state, plane_state;
> > @@
> >=20
> >  func(struct drm_plane *plane, struct drm_atomic_state *state) {
> >  	...
> > -	struct drm_plane_state *plane_state =3D plane->state;
> > +	struct drm_plane_state *plane_state =3D drm_atomic_get_old_plane_stat=
e(state, plane);
> >  	...
> >  }
> >=20
> > @@
> > identifier plane_atomic_func.func;
> > identifier plane, state, plane_state;
> > @@
> >=20
> >  func(struct drm_plane *plane, struct drm_atomic_state *state) {
> >  	struct drm_plane_state *plane_state =3D drm_atomic_get_old_plane_stat=
e(state, plane);
> >  	...
> > -	plane->state
> > +	plane_state
> >  	...
>=20
> We don't need the <... ...> style here? It's been a while since
> I did any serious cocci so I'm getting a bit rusty on the details...

You're right, I've changed it and caught some more users (ingenic). I'll up=
date it.

> Otherwise looks great
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Thanks!
Maxime

--vtqax52knlanow52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYA6KYAAKCRDj7w1vZxhR
xV4jAP9wskueG1EvM6VdG/WWEqFcTANGURoA1xviblkDem9ahwD8DirdDfSOI4th
FvH1xXFS9wLlQezjAobLpjrzR/4RLQc=
=0SF+
-----END PGP SIGNATURE-----

--vtqax52knlanow52--

--===============1231940713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1231940713==--
