Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1511E1FC739
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B436E328;
	Wed, 17 Jun 2020 07:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FC66E8BB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 12:31:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D5DD9580230;
 Tue, 16 Jun 2020 08:31:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 16 Jun 2020 08:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Czu8B8/QH/WNCgJQNgYJNhpSKue
 t+bFlALwMiXQlt7Q=; b=M7dBEPbeWLwwTqlbLUs3KVxosMxMWtxu157ekKSzfRe
 IRe2Cwba8ac60C0H4drOIvkhepU3/jYX5wACKHQ6Pzhr2Fp5PY1t3lN288pUc2Jn
 oE3m4e+kDBi+IdxV/jPLgZoT5lPxZC98W/R4VR2cTE+sDwMgd4pBrDinWuaAs9yo
 9kX6uSS7/9VE3DvuQ+Cir2m5AfIE9+RxBkRC0ZSR9oOvFsisdXVHeFzuPGXLBk8d
 rw4uH6wyKm6Sv+Km/7lPWM5uJhXe0bdepy4avpEpriiTaZ/mBkM7PEN1bxRtOZx1
 DiKqwSITgkDlpnI1a608T7j4pX2Rz9dh4PBvwzM+Dsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Czu8B8
 /QH/WNCgJQNgYJNhpSKuet+bFlALwMiXQlt7Q=; b=RkDOGdQSXIbFE7mVnntUg6
 gtzvEYQ929qV8uboYKIDxIxIrh7fs1z3L1xm/2zOJuUD6e0PcuF+wc1IcdlypP77
 ICwnJdA2vYjAQoJoCoI0bUoC6LkYDEgcnOLbhGZS3Q3D9dH0202C7JvHttRBPRWS
 BKkADc3N9SS4nqjZPUQF9mZPr9/6aRlK0wTtIkatYBijvrFOMvYHCnlHb/6Sd6EN
 QTfVP68NhEnKUVCYpNRZBrECP5nGSD98qpzdF+RdSYuxa8jHsyHAXwkPYOfSMGUQ
 EanP8l0pKGV4V1a/RPuw4UGQfY3h7uiOypO0V56lmn0K9J7I7atsa3q5bsawJocA
 ==
X-ME-Sender: <xms:hLvoXljkBehjch5RkoIgRfjal7ws-UNUHZ-W4XwnYzikDhz3jvL_RA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejtddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeekkefftdffhffhvedvudetgfdtleejveffvedvvdetgeeltdfggefhhedv
 ieffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hLvoXqBlvy7B1v3bIFYxEVVnyB6EY5lVLyr9AFhexzp0GnL_IcsDhA>
 <xmx:hLvoXlFdrEM7v5h1cYprIX0lKT7TUuxsP2SJCjat9zNA5S6dD69O3w>
 <xmx:hLvoXqTtyTUyNunov6n2cEhqOTm0aNaIOLjBN-RiYookQILJr4LtHg>
 <xmx:hbvoXtyXTVzevx9bJGEqiHilEKUF4etRgDp9TQE3mkdOX2Kwpsvpwg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 200833280064;
 Tue, 16 Jun 2020 08:31:00 -0400 (EDT)
Date: Tue, 16 Jun 2020 14:30:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3 070/105] drm/vc4: hdmi: rework connectors and encoders
Message-ID: <20200616123058.skjudypbsefiom5c@gilmour.lan>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <020de18840a1075b2671736c6cc2e451030fad74.1590594512.git-series.maxime@cerno.tech>
 <CADaigPXJ0BnMUp=XN6G92Tx=H9j55pmsBAujO2mcpiiTs-RHnQ@mail.gmail.com>
 <20200602155421.niyvpwqc42xh5c7v@gilmour>
 <6cd190e0-c81c-8e47-3ca8-22360de9b46d@i2se.com>
 <20200605143536.i6cc2v57eupmlvtn@gilmour.lan>
 <197a3164-828b-510e-47a7-f18ce1300d9d@i2se.com>
 <20200611133444.narsdlxmko2wgyj7@gilmour.lan>
 <8ad354c1-203c-e4bc-ef24-36a2a7b4a9b5@i2se.com>
MIME-Version: 1.0
In-Reply-To: <8ad354c1-203c-e4bc-ef24-36a2a7b4a9b5@i2se.com>
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1186494562=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1186494562==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mnj3pykzsuovov52"
Content-Disposition: inline


--mnj3pykzsuovov52
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2020 at 06:16:56PM +0200, Stefan Wahren wrote:
> Am 11.06.20 um 15:34 schrieb Maxime Ripard:
> > Hi Stefan,
> >
> > On Sat, Jun 06, 2020 at 10:06:12AM +0200, Stefan Wahren wrote:
> >> Hi Maxime,
> >>
> >> Am 05.06.20 um 16:35 schrieb Maxime Ripard:
> >>> Hi Stefan,
> >>>
> >>> On Wed, Jun 03, 2020 at 07:32:30PM +0200, Stefan Wahren wrote:
> >>>> Am 02.06.20 um 17:54 schrieb Maxime Ripard:
> >>>> FWIW this is the first patch which breaks X on my Raspberry Pi 3 B.
> >>>>
> >>>> Here are the bisect results:
> >>>>
> >>>> 587d6e4a529a8d807a5c0bae583dd432d77064d6 bad (black screen, no heart=
beat)
> >>>>
> >>>> b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8 good
> >>>>
> >>>> 2c6a651cac6359cb0244a40d3b7a14e72918f169 good
> >>>>
> >>>> 1705c3cb40906863ec0d24ee5ea5092f5ee2e994 bad (black screen, but hear=
tbeat)
> >>>>
> >>>> 601527fea6bb226abd088a864e74b25368218e87 good
> >>>>
> >>>> 2165607ede34d229d0cbce916c70c7fb6c0337be good
> >>>>
> >>>> f094f388fc2df848227e2ae648df2c97872df42b good
> >>>>
> >>>> 020de18840a1075b2671736c6cc2e451030fad74 bad (black screen, but hear=
tbeat)
> >>>>
> >>>> 4c4da3823e4d1a8189e96a59a79451fff372f70b good
> >>>>
> >>>> 020de18840a1075b2671736c6cc2e451030fad74 is the first bad commit
> >>>> commit 020de18840a1075b2671736c6cc2e451030fad74
> >>>> Author: Maxime Ripard <maxime@cerno.tech>
> >>>> Date:=A0=A0 Mon Jan 6 17:17:29 2020 +0100
> >>>>
> >>>> =A0=A0=A0 drm/vc4: hdmi: rework connectors and encoders
> >>>> =A0=A0=A0
> >>>> =A0=A0=A0 the vc4_hdmi driver has some custom structures to hold the=
 data it
> >>>> needs to
> >>>> =A0=A0=A0 associate with the drm_encoder and drm_connector structure=
s.
> >>>> =A0=A0=A0
> >>>> =A0=A0=A0 However, it allocates them separately from the vc4_hdmi st=
ructure which
> >>>> =A0=A0=A0 makes it more complicated than it needs to be.
> >>>> =A0=A0=A0
> >>>> =A0=A0=A0 Move those structures to be contained by vc4_hdmi and upda=
te the code
> >>>> =A0=A0=A0 accordingly.
> >>>> =A0=A0=A0
> >>>> =A0=A0=A0 Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>> So it looks like there was two issues on the Pi3. The first one was
> >>> causing the timeouts (and therefore likely the black screen but
> >>> heartbeat case you had) and I've fixed it.
> >>>
> >>> However, I can indeed reproduce the case with the black screen / no
> >>> heartbeat you mentionned. My bisection however returns that it's the
> >>> patch "drm/vc4: hdmi: Implement finer-grained hooks" that is at fault.
> >>> I've pushed my updated branch, if you have some spare time, it would =
be
> >>> great if you could confirm it on your Pi.
> >> yesterday i checked out your latest rpi4-kms branch, but i was still
> >> facing similiar issues with my Raspberry Pi 3 and multi_v7_defconfig
> >> (heartbeat stops, splashscreen freeze, heartbeat is abnormal fast). So=
 i
> >> tried to bisect but the offending commit didn't cause an issue the
> >> second time.
> >>
> >> By accident i noticed that a simple reboot seems to hang for at least 8
> >> minutes (using b0523c7b1c9d0edcd the base of your branch). This usually
> >> take a few seconds. So i consider this base on linux-next as too
> >> unstable for reliable testing.
> >>
> >> Is it possible to rebase this on something more stable like linux-5.7 =
or
> >> at least drm-misc-next? This should avoid chasing unrelated issues.
> > I've rebased it on 5.7 here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git/log/?=
h=3Drpi4-kms-5.7
> >
> > And it looks to be indeed an issue coming from next. That branch can
> > start the desktop just fine on an RPi3 here. It would be great if you
> > could confirm on your end.
> >
> > Thanks!
> > Maxime
>=20
> thank you very much. The good news are that the "black screen, but
> heartbeat" issue and reboot hang are gone. Unfortunately the "no
> heartbeat" issue is still there.
>=20
> Here are more details about the issue. It doesn't occur everytime. I
> would guess the probability is about 40 percent, which made bisecting
> much harder.

Are you sure about that 40% reliability? I found out that the culprit
was that the commit we mentionned was actually running atomic_disable
before our own custom callbacks, meaning that we would run the custom
callbacks with the clocks and the power domain shut down, resulting in a
stall.

I was seeing it all the time when X was shutting down the display, but
maybe you were changing the resolution between the framebuffer console
or something, and since the power domain is shut down asynchronously, it
wasn't running fast enough for the next enable to come up and re-enable
it again?

> It is reproducible on my 2 Raspberry Pi 3 B Rev 1.2. It is
> also seems independent from the display because the problem occured on
> my Computer display and my TV.

But only on HDMI, right?

I've pushed a new branch with that fix.

Maxime

--mnj3pykzsuovov52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXui7ggAKCRDj7w1vZxhR
xTIYAP4gnQF4W2S9Kk51AvcjH8hnbrHB6RyGKzF2l9eqWRerZgEA0wobgfw2R4Sr
w16Vk3zTXggYQVJtfTF3hYpNXafEhQQ=
=1RvC
-----END PGP SIGNATURE-----

--mnj3pykzsuovov52--

--===============1186494562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1186494562==--
