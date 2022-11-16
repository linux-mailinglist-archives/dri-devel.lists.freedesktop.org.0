Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5962C1FF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE45610E4BC;
	Wed, 16 Nov 2022 15:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A3810E4BC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 15:12:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E1AD12B0585E;
 Wed, 16 Nov 2022 10:12:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 16 Nov 2022 10:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668611537; x=1668618737; bh=8BDN+pZuF0
 +dz4UnJXYgDF0OQFq3R4XVWXe3mOWDNIY=; b=BnyLjBUP+bBg7wHGpn4jRfyETi
 Uckk+7sD1WXQ1uJ16ekl9aG7psyYTeqIVB4bsL3GnSekIKY4peg02VGcC5O51jNS
 f37L62Y3P5SYHyO2eyJahven1IGp+PvVFeXjoI53N1fuhKM5vpaP8S5LY/UxCb1o
 M3H939s7EfGnO6/ZU9eYBHDKr4iG0mBfH6o9sWHv8+/aXePiqwVOK0B/WG86ha9j
 sXHZGIJP4ZbtgotcLEcpMfNbqCLsGDYMa2NQs7f8UOg5RjyQHSQOnZParTkzUxwP
 8QAzTxiybL3SyZGyV5P0XsNlT1Lh+uHpCQjLEnJ9pej74JpOjpacAOvJmVyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668611537; x=1668618737; bh=8BDN+pZuF0+dz4UnJXYgDF0OQFq3
 R4XVWXe3mOWDNIY=; b=L4Myc8rwymHxHeJuE8IWCe2mBz7vyGhqpVKL0x+JUQpI
 mRW6eEUpqP96KzJHYS9QhmGLHamGuDNYujFeOMJHCLwI/soIaGurwCA513gAOuXb
 EGKZQOE6Rn1FEjjmunLUGOkxAeAmKkBikTnw1R1YmjL1LmAAYfIG1+cJnXiwya/q
 l3UCqIIuKzvIiZ5mMbpP9ledJNpmuMKyfazRF9axCAkzCZCDV1GXxzBz02ZuB1Rg
 tuzIjTDEf3dKHVVIH1GybmQO5R1A2ANpR/V9WHNSbL0w8JZYfh7dVVk0IysxAkls
 LANQ2NoAHo1zNo2Fh/jL7lPcHhXKboOssl+vU8vAgA==
X-ME-Sender: <xms:0P10Y_5ybu_lqCroIXuyBTeWB5QBf7TdXVI73BgTAdnx7FCtbzEBuA>
 <xme:0P10Y05GdbvASBCTK62EthBwqLByiaQM5RJKsfGImwREJJV7wKzykzW06qCWsDY1w
 lLxP1uDaS6NX2L3nmQ>
X-ME-Received: <xmr:0P10Y2dbYZkJhu4fb3Wy_PoPeu6ehfAkEIFlMm4EbmiRamjfqzdjUL0MvDb8TW03Xa0226fH-40NYdPFt_Ns4tbuk1xmlbIaDyzMfagcRP9ULg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeigdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeevfeehfeekieffgeevleevtefgffefkedtfeeuhfettdegjeehgfegudff
 ffdunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0P10YwLhaaDe5xwMi_UUzScIOvAxWpWjY2nMdkBjX6Q44BHQzOj-YA>
 <xmx:0P10YzJeWNPW-9tYqKKzgYXSBKHkFoRsYHVyg9gM5GFhoqOrqUHgQg>
 <xmx:0P10Y5yjPxTolW7z8Ey_6RBPtN-yCslv-w97JH-tnj_w1DDiZIhDrA>
 <xmx:0f10Y7JAPpiyv_-jOzWUgECW4Wfr4tNhUqJfLKycjPNlEEI4VlJCFAe_c4s>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 10:12:16 -0500 (EST)
Date: Wed, 16 Nov 2022 16:12:14 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/tests: helpers: Add module infos
Message-ID: <20221116151214.pnwszhhbassplbr3@houat>
References: <20221116091712.1309651-1-maxime@cerno.tech>
 <20221116091712.1309651-2-maxime@cerno.tech>
 <6dba9207-5ba2-5c73-e575-a7a86a2b9520@riseup.net>
 <874juz2kyk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q2kahrldamsxvebm"
Content-Disposition: inline
In-Reply-To: <874juz2kyk.fsf@intel.com>
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
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--q2kahrldamsxvebm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2022 at 01:32:51PM +0200, Jani Nikula wrote:
> On Wed, 16 Nov 2022, Ma=EDra Canal <mairacanal@riseup.net> wrote:
> > Hi Maxime,
> >
> > On 11/16/22 06:17, Maxime Ripard wrote:
> >> The MODULE_LICENSE macro is missing from the kunit helpers file, thus
> >> leading to a build error.
> >>=20
> >> Let's introduce it along with MODULE_AUTHOR.
> >>=20
> >> Fixes: 44a3928324e9 ("drm/tests: Add Kunit Helpers")
> >> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > It would be nice to add the SPDX-License-Identifier tag in the source
> > file as well. Besides that,
>=20
> It's not just nice, it's basically mandatory to add license boilerplate.
>=20
> Checkpatch would've warned about this. And actually about a lot of stuff
> in the series.

Right, sorry about that. I'll send additional patches to address the
issues already in.

> (And our CI checkpatch did too, although we don't send the replies to
> the world, just intel-gfx [1].)

I'm not sure how helpful it is though if the author is not a recipient
of the report

Maxime

--q2kahrldamsxvebm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY3T9zgAKCRDj7w1vZxhR
xQV6AQDDefSWZmNhC3yqYFfx6B8kVL6kMiQMWWbqULTSA2ic9AEAk4GfUjhAuS7q
VbB2ZrBY+Y69u1BYRqwpfL3ruJE+Lws=
=OhLF
-----END PGP SIGNATURE-----

--q2kahrldamsxvebm--
