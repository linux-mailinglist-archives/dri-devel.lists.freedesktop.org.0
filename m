Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE805FD688
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EFA10E6FD;
	Thu, 13 Oct 2022 08:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57A210E6A1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 08:59:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2B83C580467;
 Thu, 13 Oct 2022 04:59:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 13 Oct 2022 04:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665651590; x=1665658790; bh=CTVtQG5QiC
 zBfichKHTfygU6liaBhjCGgKbiqW/tDag=; b=meAYUrWfzZ7ZLVN/7//nT42nm/
 J+AwjjQY0RXplKHkADeZH+p/c8Hr4fjdsejYw9Xt3QYy8catdQAKDWvipGj2bZI1
 sCQ/UuJ83ZWusQyumr1XXjfXf+20a3LZkhctBY93hlcvDzKDX9gwAbNJVp/4UA1x
 E3SHpxXn32ShXojQA6Oxi1FYZ+34Co3071J4qV0QkbyM1fwBngTzr3t0YVUfeG7f
 F0DgfKhAq1uaaI1zQIa2DQUEoGZo7onubZlvDLQTZrwmS/z9672F9DlVDSD9se1m
 iiPwyKsbskNK1cgEE73pcrCGYz1pyD8CTHn7aamlIS/JHEiCSdUjsNfddPjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665651590; x=1665658790; bh=CTVtQG5QiCzBfichKHTfygU6liaB
 hjCGgKbiqW/tDag=; b=VXzOGEqsT64dNHSl3mUD+EG9RJDP4bnk6x86Jh9cjWCa
 N5KbLjG1LbZtRyLDtvDhMHiUZxJFnwEU/hFB9NClM6CSbquX7lghRinvORkEUnv1
 xZKac1MNkRB11ZPECAFkcKh1BVtNKshNBghQDbu6JOZp4+X1RU1aH58Ew9QWePDu
 nFiB0IJFeEDo+M55e0L1Ot9am0rXlCNZW2bop94+EcDgjwb7lm+BA0+4fOqPuFQv
 haraG9KkzNDHJ6qMxBsJ0uiaRCgpdeGlukAtuwhDr9hhr1cijBVF3sTnYREbKmBj
 U7v24AByTwLbO71l+beZ11j4hxulG+qAH2w3nbtTsQ==
X-ME-Sender: <xms:hdNHY4unUbygZrgmv_SNNW1E0i4vwIjGFTBczHXmhM5jPxLAyChhDw>
 <xme:hdNHY1dUZdE2DLzfBKT8Py41NV-o2BSDMz4Vvp_y0Bc4W1n_KYpYafxm7zyozRqg_
 1K0NpZs0r_okwwUe4U>
X-ME-Received: <xmr:hdNHYzxrf1vEbYFZRytIn4stBph8pRJvyq1IA6gLZeOY6d1ca-Psj7TevQPJs4occmUzWtKWS_Wcmkns4_Ufps6ku2dcfJFYZfH9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:hdNHY7P8y5d8Oar6GTPsWEuLDWgZY7__3jyncN1aoqbTr8YJhfW8-A>
 <xmx:hdNHY48uK1KZcX6fsOqA6YnLaEL_xE0Rlu7nKlIY12DAt1E8tXpdNg>
 <xmx:hdNHYzXp8TYIgQHY6aN4knYcFx8Jm0bgr0v6A0KfX20DqI5A6uL6lQ>
 <xmx:htNHY8I7s84wa8XhqWLc1v8fSpmjQ0TSV37zs8ZFgFMl3y8FXAkUvg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 04:59:49 -0400 (EDT)
Date: Thu, 13 Oct 2022 10:59:47 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 0/7] drm/vc4: Fix the core clock behaviour
Message-ID: <20221013085947.jux4tfbh64ldluin@houat>
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
 <20221010114420.beytjynzshjgiy6y@houat>
 <395633de-193f-609e-abc6-9dddb2cae3c0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xi2nxcoqs7owfyl4"
Content-Disposition: inline
In-Reply-To: <395633de-193f-609e-abc6-9dddb2cae3c0@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Scott Branden <sbranden@broadcom.com>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xi2nxcoqs7owfyl4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Florian,

On Mon, Oct 10, 2022 at 12:07:22PM -0700, Florian Fainelli wrote:
> On 10/10/22 04:44, Maxime Ripard wrote:
> > Hi Florian,
> >=20
> > On Tue, Sep 20, 2022 at 02:50:19PM +0200, Maxime Ripard wrote:
> > > Those patches used to be part of a larger clock fixes series:
> > > https://lore.kernel.org/linux-clk/20220715160014.2623107-1-maxime@cer=
no.tech/
> > >=20
> > > However, that series doesn't seem to be getting anywhere, so I've spl=
it out
> > > these patches that fix a regression that has been there since 5.18 an=
d that
> > > prevents the 4k output from working on the RaspberryPi4.
> > >=20
> > > Hopefully, we will be able to merge those patches through the DRM tre=
e to avoid
> > > any further disruption.
> >=20
> > Could you review this? Ideally this would be merged through drm-misc due
> > to the dependencies between the new firmware functions and the DRM
> > patches.
>=20
> I suppose I can review the firmware parts if you would like me to

I was of course asking for the firmware parts :)

> for vc4 I am pretty much clueless, and despite efforts from Emma to
> get the vc4 driver to be usable on platforms other than Pi, that never
> happened unfortunately.

Stefan had the same concerns, but I don't think that's a big one. If
needs be, we can move the call to the firware into an if statement or
whatever and support a firmware-less device.

> It would be better to keep the firmware and vc4 drivers decoupled,
> just so "wrong" assumptions are not made, but for all practical
> purposes this is the only combination that exists.

I know, and my initial proposal was relying on a generic CCF function to
implement this. Stephen didn't feel like a single user for it was
enough, and there were some technical drawbacks too that might not have
made this solution robust enough. Hence the firmware solution.

Maxime

--xi2nxcoqs7owfyl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0fTgwAKCRDj7w1vZxhR
xWmxAQDOTnHICbSvwbYwASVkNAnE/Tiwz+E7mi+miG42l+Xi8wEAy7apqdl/hFYY
g+PNXCY9HOx+PMldyNRRP9lFgFC1sQA=
=oC3j
-----END PGP SIGNATURE-----

--xi2nxcoqs7owfyl4--
