Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7562F0F0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 10:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC8610E208;
	Fri, 18 Nov 2022 09:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEB510E208;
 Fri, 18 Nov 2022 09:20:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 523F45C0513;
 Fri, 18 Nov 2022 04:20:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 18 Nov 2022 04:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668763223; x=1668849623; bh=4n4DR4UwM1
 0Hw+UX/vwcqMHSZCvbtAN5htQFeot9k0s=; b=LYNeULVFAebnqpXOJpHXpNjDeY
 XS0flPyOKrAZxKsh4iQc0ZI5EJvqg/vL6nqEYs2k4HELn5ioOaZASWxsOBDZz8Nk
 U05AvRz/anebMho0GIoFAUzeWR1Q6yHnU5KvMD1nZOe9dV2tCagLqZhi0JH3vmc1
 LtG7PYqX4CR6zcupd+XfXf2RZZ7wky/8sxvaKpgnawNa9PBoZU0XWNLEBuTHrV+i
 Dt9H/w54YuWeBAsGdv+QQNxbSMV265i4e6LiwviudQHCQc9zv90hT1Vw/cIQoosB
 PtT0UHFH6679yAOFMWv+pSsE8UAUuA6b3otS69gmmKEp0Hw2aMEydArXGhHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668763223; x=1668849623; bh=4n4DR4UwM10Hw+UX/vwcqMHSZCvb
 tAN5htQFeot9k0s=; b=dYtPEl3UgKwY4kyD4AclEMrQ2EtGmLPlA68TpselZHFF
 9u8LIdlGK0KAGUzTewj5FC9HO3MG39VuhRI9zm+ur9hWzfEkDlRNbeU9sL2qLVmh
 l6v/t6vop4T3uI8/LivxEaQyaJWmgtH9aYewlRAVb8j7ag0mz4E2v7cI7LOh6voh
 /brht4rf2zmC395EH+IGCIHNyyZpNURecjznZ6jIAtZY+V15ds2359kF8IrdJwYr
 zHvtZDwHd6wq7ElS1IfwH7Sjao5l6JXsJ8P2Sy4Soqpn0N1m+w5WBYvMwhs8l3kn
 cOdGElnKuyTbwsdFDvebzfpfudJciGUooy4nSwbV2w==
X-ME-Sender: <xms:Vk53Y-mYyWluu8ptma9_HbxzN6V0WEpT_zpG02A8sZ0p4Td9uapCrw>
 <xme:Vk53Y12N-XZjh3vrK1cA6dPEI_PelFPLODYnhhJEBfbWIzdJieuCywjCJIfyyG9mX
 2VuecYVem3sERPMWKc>
X-ME-Received: <xmr:Vk53Y8oWX8yXhLN6ibFL6-YdpceVsXUpxT1bIWXFHrJ2u2si28bNZ-uOdYrR9x4V3rXXjRoq3c5mHX3uzb1vPUDmQtq3o5DOQaedOjnVGNt49w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrhedtgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Vk53YymcEeZCWCnz6mZOA7HIRDHqvrJ3RJhYNSBbdApXSrbN5jJdLQ>
 <xmx:Vk53Y80X3IftNfwIwF5-yOrZ4Hj2t-qhk6Nplx_5Me_yOEJ2DXcITw>
 <xmx:Vk53Y5vs-s38Diftjkj7piocKdDWJO3Q2-Af4vCMmlWqcY_7cI1Emw>
 <xmx:V053Y1HYD8gWp49Ur4aXLMO6qjTii50h3ivR-O1mqw55YOZ9nRnksQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Nov 2022 04:20:22 -0500 (EST)
Date: Fri, 18 Nov 2022 10:20:20 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with the origin tree
Message-ID: <20221118092020.nhvjomvwwryb7j3n@houat>
References: <20221116105702.746ce3cf@canb.auug.org.au>
 <Y3ZvffZiR+SgtY6h@dev-arch.thelio-3990X>
 <20221118090636.00bfc293@canb.auug.org.au>
 <Y3bLRLDCrd7KYqom@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="utkgyjtezkaepsh6"
Content-Disposition: inline
In-Reply-To: <Y3bLRLDCrd7KYqom@dev-arch.thelio-3990X>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--utkgyjtezkaepsh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 05:01:08PM -0700, Nathan Chancellor wrote:
> On Fri, Nov 18, 2022 at 09:06:36AM +1100, Stephen Rothwell wrote:
> > Hi Nathan,
> >=20
> > On Thu, 17 Nov 2022 10:29:33 -0700 Nathan Chancellor <nathan@kernel.org=
> wrote:
> > >
> > > This resolution is not quite right, as pointed out by clang:
> > >=20
> > >     drivers/gpu/drm/vc4/vc4_hdmi.c:351:14: error: variable 'vc4_hdmi'=
 is uninitialized when used here [-Werror,-Wuninitialized]
> > >             mutex_lock(&vc4_hdmi->mutex);
> > >                         ^~~~~~~~
> > >     ./include/linux/mutex.h:187:44: note: expanded from macro 'mutex_=
lock'
> > >     #define mutex_lock(lock) mutex_lock_nested(lock, 0)
> > >                                                ^~~~
> > >     drivers/gpu/drm/vc4/vc4_hdmi.c:322:27: note: initialize the varia=
ble 'vc4_hdmi' to silence this warning
> > >             struct vc4_hdmi *vc4_hdmi;
> > >                                      ^
> > >                                       =3D NULL
> > >     1 error generated.
> > >=20
> > > Obviously, the assignment of vc4_hdmi should be before mutex_lock().
> >=20
> > Thanks for pointing that out (silly me :-) ).  I have fixed up the
> > resolution for today.
>=20
> Great, thank you so much! One less warning to worry about :)

I actually did the same conflict resolution in drm-tip. I've fixed it up
too, thanks for your report :)

Maxime

--utkgyjtezkaepsh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY3dOVAAKCRDj7w1vZxhR
xa2fAQD933QJY5E3XRwJGvMvYIALowd4qIYtQyxBCrk/Zo2bTQEAiLYk8Ij68h6E
CzpNCMHNSYp+43IPN7VzU0UqzQpvawk=
=GyeM
-----END PGP SIGNATURE-----

--utkgyjtezkaepsh6--
