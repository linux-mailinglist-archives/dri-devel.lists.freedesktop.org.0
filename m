Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FE1551F0B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 16:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE13510E071;
	Mon, 20 Jun 2022 14:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E6D10E071
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 14:39:33 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A3BB9320076F;
 Mon, 20 Jun 2022 10:39:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 20 Jun 2022 10:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655735971; x=1655822371; bh=0DVoyn1GEo
 xg3S9g9a5wXlgHMWysIAhMxtkVHAEuIAQ=; b=eJlpA5airsBVAAuHV1nI+SRFY6
 4nOU2vCw8CKCkAozizEgsTKTcwI2hOSKzqxYvS+508oXpJVZLt3+OtZbZgZ3FQwV
 LOnGI9hhBzB0Q2Z5NTn3wjS+CnUho2GCqXZuRlodjND/VYm1FvXyBWamDckag+Bt
 nB5wAP8n17vrS/5pD4hKyKh/RGhFbBTn7Naj/sqHDVcPcRyhkVllvLbmLxjS/QHZ
 RbQ4lJODTPtRk9UYczK/BFcDfLEh7/LM5BxvDAFpsn6okcnN49SuV86WyBwQ7Tdw
 UUK/Ogn4TGA6PgWi/lmY+w+/avjNfqgysAnPOynpxxNkhyjTfjr5u+Mf+q+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655735971; x=1655822371; bh=0DVoyn1GEoxg3S9g9a5wXlgHMWys
 IAhMxtkVHAEuIAQ=; b=agZiuBZwP22gx9miF1FVISPyD6i/YMWP5NeqcyxYmAaa
 ZqndHjJYwxg0F1AkPcEzdA7fDUiFXAWRrOfnDJrl7UNMi0ruYCfYBobD8/bH5DdO
 vlvXiKx6+hbs+LGOMt/l/quDd1ynjiJ2uzsbEUJJ+PQLt6fDWVXrtuD4QpfEmb3r
 GGlAAyWVuaE4va65tTLBoPOGp0cPuAxIG/zndPZB25WbrcaRgU9ARNEh9Nho+1gE
 9D+Q8Luf3dbHC/5KTPvutbhXSorotxQK8g8VUjaRwknX0WG9d9C2lq4aUhroFJzx
 qGlCCcvhAjVm796L15ALbE0ylxQ6BRfiW7usyNZzQA==
X-ME-Sender: <xms:ooawYmkV93fy9RJj9ETPVh2GzumJDD_0I7xzmsiPyiupG-y9okUVSA>
 <xme:ooawYt2PMiTbJCeGZI62MUS1MvgfdnYghTelaJtTy1jIAToycN4WF-cTsiONMIm8n
 fi7mHP3FnXumdwIKkk>
X-ME-Received: <xmr:ooawYkon5BPvY_iDD8eH5bYq4Jnpdj0al15BaNzg2tDoq6PgGd3lqhQCLc3de-UylpivftzienaLL4XlZBTtAi1Hhc46bv0Z10QqRGY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefuddgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ooawYqmijByjbHRKsoDfvE2FZZ2N4OpPZKYq4NKSNblFoTYSldyCfg>
 <xmx:ooawYk3cFECJeHS2TXbWhmNJC5o5cJF96-wjdXZ6hnzgCpMBWAivMQ>
 <xmx:ooawYhuXsWTGlSPIBLk_KFGs3qoyDCFp3o2_8ZEeA0PBGhJGOQ7EAw>
 <xmx:o4awYhylTcnFP2tJTK0jzymwUDzfrNEE405_aDOFU-R84lDo6oSovw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 10:39:30 -0400 (EDT)
Date: Mon, 20 Jun 2022 16:39:28 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
Message-ID: <20220620143928.zbbaltwcah3rpkqh@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
 <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
 <20220620134823.oqjrbnlsce3erhum@houat>
 <92f5306c-3808-b140-4845-f744df4c92fc@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bpl4zz5mvygbn5nu"
Content-Disposition: inline
In-Reply-To: <92f5306c-3808-b140-4845-f744df4c92fc@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bpl4zz5mvygbn5nu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 04:25:38PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 20.06.22 um 15:48 schrieb Maxime Ripard:
> > Hi,
> >=20
> > On Mon, Jun 20, 2022 at 12:44:24PM +0200, Thomas Zimmermann wrote:
> > > Am 10.06.22 um 11:28 schrieb Maxime Ripard:
> > > > The DRM-managed function to register an encoder is
> > > > drmm_simple_encoder_alloc() and its variants, which will allocate t=
he
> > > > underlying structure and initialisation the encoder.
> > > >=20
> > > > However, we might want to separate the structure creation and the e=
ncoder
> > > > initialisation, for example if the structure is shared across multi=
ple DRM
> > > > entities, for example an encoder and a connector.
> > > >=20
> > > > Let's create an helper to only initialise an encoder that would be =
passed
> > > > as an argument.
> > > >=20
> > >=20
> > > There's nothing wrong with this patch, but I have to admit that adding
> > > drm_simple_encoder_init() et al was a mistake.
> >=20
> > Why do you think it was a mistake?
>=20
> The simple-encoder stuff is an interface that no one really needs. Compar=
ed
> to open-coding the function, it's barely an improvement in LOCs, but noth=
ing
> else.
>=20
> Back when I added drm_simple_encoder_init(), I wanted to simplify the many
> drivers that initialized the encoder with a cleanup callback and nothing
> else.  IIRC it was an improvement back then.  But now we already have a
> related drmm_ helper and a drmm_alloc_ helper. If I had only added the ma=
cro
> back then, we could use the regular encoder helpers.
>=20
> >=20
> > > It would have been better to add an initializer macro like
> > >=20
> > > #define DRM_STATIC_ENCODER_DEFAULT_FUNCS \
> > >    .destroy =3D drm_encoder_cleanup
> > >=20
> > > It's way more flexible and similarly easy to use. Anyway...
> >=20
> > We can still have this. It would simplify this series so I could
> > definitely squeeze that patch in and add a TODO item / deprecation
> > notice for simple encoders if you think it's needed
>=20
> Not necessary. It's not super important.

The corollary is though :)

If I understand you right, it means that you'd rather have a destroy
callback everywhere instead of calling the _cleanup function through a
drm-managed callback, and let drm_dev_unregister do its job?

If so, it means that we shouldn't be following the drmm_.*_alloc
functions and should drop all the new ones from this series.

Maxime

--bpl4zz5mvygbn5nu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrCGoAAKCRDj7w1vZxhR
xdIjAQDu9Wjz0rSx1yq4tzgHHR/MMC9T2zZNjVO2ba+v/qod8QEA7+LD0sQo6ZHJ
p3vVzBHlA7yf164ZJml9+XM/Z8hg2gw=
=Mcun
-----END PGP SIGNATURE-----

--bpl4zz5mvygbn5nu--
