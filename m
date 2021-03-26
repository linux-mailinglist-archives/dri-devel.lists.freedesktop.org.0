Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CA334AABC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DF56F3F1;
	Fri, 26 Mar 2021 14:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B3B6F3FD;
 Fri, 26 Mar 2021 14:59:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1EA135C06B8;
 Fri, 26 Mar 2021 10:59:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 26 Mar 2021 10:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=CTL0NmnayxJOjLe7a8ik2kF63mM
 VJCYpWAUZPGVIWiI=; b=lF+bPR1aDy503O3gOJxslRVUVS5quP3bvN7nR4rbkHR
 UPMxr6iylRppqXrV9s62aHb4Ys7oTiZA7C2Tw4pKA/P5lsJbjFYNxrrDXVZ5sXZ0
 iz5ovtx3do+KU4RswqsOdWxfAN+AnvZWRdTFOCdwfCeig3Q8QV4wlC3kk2j4wFfr
 VnBdVUQYckV0Ab+pVYoBx3vU19Wjl708EpoA8hn4Nk5s1TTPeWlQQOK9OgOQJZ8g
 zp9j8JnxGLBsFMfeg+ztotCiIQofXguH4OitNS/sl/F7hfl2OalBwrIxjmz3YlEz
 z+KxBO0fvfYHuRCXp7wi9D0E7heJRDnm3YPBJsWFIFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CTL0Nm
 nayxJOjLe7a8ik2kF63mMVJCYpWAUZPGVIWiI=; b=uV3apl1u+tAU7+AGAHDz0T
 HNHn+n5rute2ycZ17VaD7b0FotLG9xhbyet0AqnZL5lareW2lF2OSfOTEuUWBLzk
 nTfGZ9gfNcVDLpQNpw53MAfDk60fhG5iStceF1oJvcS60xImn2Oiycb3C1R0KrSr
 ho4/0u8Vabp8fg8fHi9waNvVIVlOVjyIX1YNPMZhfFzL9Eyqker80t77PeQWFoEO
 lz26Fo2j0BlCt/REBoKB27Rpn0I1mTdmUgZCjSfP/77NwFzaq4B+5Jb9MkdWhlHD
 4lO6fPPaMBSzt432sF3I4WTNSX7tK2SgagTv/Yiw/tcNKQz8YiN0iFxDC4B9GiCQ
 ==
X-ME-Sender: <xms:2_ZdYPF4iOMwpqDW7bCY2yoaaPglKnycRANtW7NbsTiHry4EgCbIww>
 <xme:2_ZdYFtQVsuuS3Y6ToUNSVXocyavqgm3VXChZWPs2SnEE9LwpJT6uqGxSEnHo3eSv
 FNk63QPqDO2qKOfOXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2_ZdYJo21e0RsJ7m18rwzj-WE2gUsTOPpwaLqUcItZ3pFVYxhlwlFw>
 <xmx:2_ZdYMkZB_HooHozbTDgAxN5m7np0AEMdcFyF2dg5JREAsjkcTRdkA>
 <xmx:2_ZdYGiWKfMCsamlRW1qxkq2C4mGt6zm5_tkmB5sEG-vLrRiW4r-YQ>
 <xmx:3fZdYKcddbZUhoDiEv8lGHBzj8vT9MbSuJ85kE8amcdB5AhlJO8M_g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4179324005D;
 Fri, 26 Mar 2021 10:59:39 -0400 (EDT)
Date: Fri, 26 Mar 2021 15:59:37 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/2] drm/dp_helper: Define options for FRL
 training for HDMI2.1 PCON
Message-ID: <20210326145937.wfyxm4harrdi43c3@gilmour>
References: <20210323112422.1211-1-ankit.k.nautiyal@intel.com>
 <20210323112422.1211-2-ankit.k.nautiyal@intel.com>
 <87a6qq2qlt.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <87a6qq2qlt.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1906504141=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1906504141==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azt2smnv7sau4ccb"
Content-Disposition: inline


--azt2smnv7sau4ccb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 26, 2021 at 11:47:58AM +0200, Jani Nikula wrote:
> On Tue, 23 Mar 2021, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> > Currently the FRL training mode (Concurrent, Sequential) and
> > training type (Normal, Extended) are not defined properly and
> > are passed as bool values in drm_helpers for pcon
> > configuration for FRL training.
> >
> > This patch:
> > -Add register masks for Sequential and Normal FRL training options.
> > -Fixes the drm_helpers for FRL Training configuration to use the
> >  appropriate masks.
> > -Modifies the calls to the above drm_helpers in i915/intel_dp as per
> >  the above change.
> >
> > v2: Re-used the register masks for these options, instead of enum. (Vil=
le)
> >
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> Maarten, Maxime, Thomas -
>=20
> Can I get an ack for merging this via drm-intel-next, please?

I was hoping that someone with either i915 or DP knowledge would
comment, but the patch looks fine to me, you can go ahead I guess :)

Maxime

--azt2smnv7sau4ccb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYF322QAKCRDj7w1vZxhR
xQhXAQC/DwNCm6rNFtLc2i4wdpZJdV9XLae5DjYwK5YZ/+VTyAEAy6OafI7ddlv+
NfHjruX9fbAW6WeyTO2+TktPj1VKrwo=
=NrqV
-----END PGP SIGNATURE-----

--azt2smnv7sau4ccb--

--===============1906504141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1906504141==--
