Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F554ACCE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 11:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF15010F52D;
	Tue, 14 Jun 2022 09:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AFA10F52D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:04:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 637F0320091A;
 Tue, 14 Jun 2022 05:04:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 14 Jun 2022 05:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655197482; x=1655283882; bh=ftciWJCPsZ
 D/F+ErozlD0QrPnAK8YxtYoBMWsq9f6Xo=; b=BTQzy4npkhJzBIrjns7c/fUrZG
 kycYU/yA9RXViC0SdWMYpErYQreGoPfQ+dNlzxQ3nYR/iRs1gRfQA0808Z9GHDIZ
 Pz/u2TrzWTQNV5wdPtP0kRu4moxWgazCyMNoddVp89swqLIeC9r4ct00MUiQhwcA
 sjbkMnhy6hHeInWDEYc2DKL1wkYplcKyAcwxd6N8rCaF8T30OzZl0Sqnauy9HCr+
 25EHKb728nzYjOWDO7WSw7e11xnfp+RkgL5coknVf4754ZGlnfO/1lcsf65LJT5k
 pcWojeqIeslbZMgn7YYOFJ/WWiA74dBi6sil/s0IYguv/LXP2Tg+Uq6XMorw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655197482; x=1655283882; bh=ftciWJCPsZD/F+ErozlD0QrPnAK8
 YxtYoBMWsq9f6Xo=; b=lxOWbnBf1nUSzjCtE+jsolqDt5/2Ft8WOxsF8wiIHtI3
 B5q3si+AU0t6FpImpPfkJMdp/T5/K7Sul+mIREZvWiDzbLvsMUBGu2cjH2fjWkIk
 Kj/mA5qFxjbFKgazlR9+CS0S6bUOGfYMijBtS/Q5TpYvAGHe/YVsT/VSdLvTEdpS
 f1QfD9q1JXjxL0CdODO7b3UblJAbLuZezs0zcyI3WqIUQHveOMPu53yaPWAKM2fu
 cANRaK/idJ/cRMOrGWcjtI/qcIWZ+/wgh6NS0e4xlpkC2YyA5Z7wtrxH2hAf4kUI
 oocyqJeUUZK+V33EfNCY8T/2LWSGC2E/i0D1HHUN7A==
X-ME-Sender: <xms:Kk-oYvX07pV6tNuRowlE3FVacuBXxAWCBoYeE35VWJ1AqzIJC-w-0A>
 <xme:Kk-oYnmGpBY-FNKxoW1tRy0XO6-iuIjFDCxKS710aXP44dM2FyUHqua1QRUYYwtna
 EYdtZfPhoEOn-lgpCo>
X-ME-Received: <xmr:Kk-oYrZPylFhgF0uXRAS1A9tFZyBNvk_IWp7aAfOdrc2LlMFQwfAo6nFQamzh_8f12HPEnBHlsf3bl0pGO3ZQQnurIdB6c3W6VSZRes>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduledgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetffeuvdetgeehfeetledthefgieeigffghfejueetuefhveeutdffvddu
 geduteenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghh
X-ME-Proxy: <xmx:Kk-oYqXgbCt5c7pV4gmxW5owcyeRY-CMnleu0F8z3TjjGV-XcVjs8w>
 <xmx:Kk-oYpmoj7l0-Ac3q1qwFhUmhUOA31Q5-1vvmftLqO_OX0BXMY5AgQ>
 <xmx:Kk-oYnfblq_8RQFXZ-IZURC73VvWhdyHY0ADkC6QjFpfyf2_8dL8qg>
 <xmx:Kk-oYuzPI0e_gGEAfE5qd9IuqJ9LTVFQslj2KAC3YQKGCY8tVJiqSg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jun 2022 05:04:42 -0400 (EDT)
Date: Tue, 14 Jun 2022 11:04:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
Message-ID: <20220614090440.dwfvsmqnsd7fo24c@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
 <20220614073716.zwshdcf3q5fjobuq@houat>
 <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k7fzu5dme3z45f5r"
Content-Disposition: inline
In-Reply-To: <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
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


--k7fzu5dme3z45f5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 10:29:20AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 14.06.22 um 09:37 schrieb Maxime Ripard:
> > Hi Thomas,
> >=20
> > On Mon, Jun 13, 2022 at 01:23:54PM +0200, Thomas Zimmermann wrote:
> > > Am 10.06.22 um 11:28 schrieb Maxime Ripard:
> > > > The DRM-managed function to register a CRTC is
> > > > drmm_crtc_alloc_with_planes(), which will allocate the underlying
> > > > structure and initialisation the CRTC.
> > > >=20
> > > > However, we might want to separate the structure creation and the C=
RTC
> > > > initialisation, for example if the structure is shared across multi=
ple
> > > > DRM entities, for example an encoder and a connector.
> > > >=20
> > > > Let's create an helper to only initialise a CRTC that would be pass=
ed as
> > > > an argument.
> > >=20
> > > Before I review all of thes patches, one question. it's yet not clear=
 to me
> > > why drm_crtc_init_with_planes() wouldn't work. (I know we discussed t=
his on
> > > IRC.)
> > >=20
> > > If you're calling drmm_mode_config_init(), it will clean up all the C=
RTC,
> > > encoder connector, etc. data structures for you. For CRTC instances in
> > > kmalloced memory, wouldn't it be simpler to put the corresponding kfr=
ee into
> > > vc4_crtc_destroy()?
> >=20
> > My intent was to remove as much of the lifetime handling and
> > memory-management from drivers as possible.
> >=20
> > My feeling is that while the solution you suggest would definitely work,
> > it relies on drivers authors to know about this, and make the effort to
> > convert the drivers themselves. And then we would have to review that,
> > which we will probably miss (collectively), because it's a bit obscure.
> >=20
> > While with either the drmm_alloc_* functions, or the new functions I
> > introduce there, we can just deprecate the old ones, create a TODO entry
> > and a coccinelle script and trust that it works properly.
>=20
> Thanks for explaining the motivation.
>=20
> I would not want to deprecate any of the existing functions, as they work
> for many drivers. The drmm_ functions add additional overhead that not
> everyone is willing to pay.

I'm a bit confused. drm_crtc_init_with_planes() at the moment has:

* Note: consider using drmm_crtc_alloc_with_planes() instead of
* drm_crtc_init_with_planes() to let the DRM managed resource infrastructure
* take care of cleanup and deallocation.

Just like drm_encoder_init(), drm_simple_encoder_init() and
drm_universal_plane_init(), so all the functions we have a drmm_* helper
for.

And we have a TODO-list item that heavily hints at using them:
https://dri.freedesktop.org/docs/drm/gpu/todo.html#object-lifetime-fixes

So it looks like we're already well on the deprecation path?

Maxime

--k7fzu5dme3z45f5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqhPKAAKCRDj7w1vZxhR
xXDPAP4+edDLt1Q28DiMuNbRA12N51RTJPURVFj1VHB2t5t93AEA94fkdkpAHhCW
C9T4FiK5ydu9YWOHlC1UIpiQrv4wVAY=
=Xiwv
-----END PGP SIGNATURE-----

--k7fzu5dme3z45f5r--
