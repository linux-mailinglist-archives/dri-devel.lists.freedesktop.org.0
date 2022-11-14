Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B546B628084
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D0C10E2A1;
	Mon, 14 Nov 2022 13:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AD210E237
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 13:06:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CD4325C0118;
 Mon, 14 Nov 2022 08:06:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 08:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668431170; x=1668517570; bh=hTwfEL8WhY
 8IR4P7vKxZDyu4A7kRyCha3szkP5Ui2Og=; b=XFdwPJCq6MfipI6W6CxCjWujM8
 qKW6zvR1ZYsCyx1+cyr+9dTvnTFdKJeITINg8GhcyYFH+1se7R+lIW8Gd+sasxD0
 ZfYKHqQ6Pf9RpD/fWYkuNKD/zp0S2XYwAmrbrkuf5PMuR5Z3N1GvdtZ7PobEpwF0
 uqWybooDrC+1g7pGlO0DgALC/38dzu+zuJkxDljXmM0qAHNl51/209zYxq6HXNer
 ZIj8z+z3ERT2tmEu5FcuRAAtfvGISvOipkJalfF9jrrp9W6axuPukAgk9FK6C84M
 21m3GtwN+YqGK8mqIwyWgTEFjBlkCmUZPB+p+XUZze/eVQEdDW3kvb+lusvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668431170; x=1668517570; bh=hTwfEL8WhY8IR4P7vKxZDyu4A7kR
 yCha3szkP5Ui2Og=; b=JuZeLjuR+w22RCnq0vwKBm6Xad6BN6Fubtp5SqLmo688
 qWoban8NACaUVRV91919czkb3Lv/5e4t2yUYxwQBV82XvRZQsUoqCEyys+n62F32
 YmN8uIXGkusTXYYrnzPoFEukN0G3XGHkYmZMfTXRKFYz3m5c6AZAoUhzYGGa+mKW
 BiDs/jjFTY14j1C33siqSK6SVzFrMnf4FvrrPPGxoSmNOoiBRML1ypO1HpzmK3u9
 16//z3TVW8s2Scj/XUcupuBESaiQNROuwGDSZ4Bxwlm5tCGlB5QDrQ2G7m0j2JeR
 LIUosup1G476E8dfTf3bU7LVlYIKuUbIhgIoTYHUeA==
X-ME-Sender: <xms:Qj1yY9cok38ROpNvFFdd4RXK-4OPSKfC8-DgImY8CZF3mnrB4IT2tA>
 <xme:Qj1yY7Opg-gLExeq8lrK7ERV1dPmsZc7K6u8MZfq6IcA7-WNiSUzRxd5vLrVdHcdh
 DmRoXwHzafaRfT1npU>
X-ME-Received: <xmr:Qj1yY2hr6uy3_Yv_Ofct-6fME9fQK223nVPYdSp60mBNPxo6f0TkXQfQibQAu5os8yzwzPCXOeXMbSVPOOH8e3k40YCeCwpdxUfD7M-jU2QMSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleejuefggeevteelveekteffgeduveeiteeiueegueegiedvtdejjedvfeef
 tefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Qj1yY2-XEvWxG9h7ZB34iMtixqf404DtbTQWcK9P8-TsTv0VfP_JmA>
 <xmx:Qj1yY5v4jyUghn1q2YBfcsAUSKUWxx50meyv0GfcaWp2_S6vE_kBhA>
 <xmx:Qj1yY1G4cnHMTnEjbLjrlpVXigtgVb-VsC_NEUxRv4FvH3ZSYHrzyQ>
 <xmx:Qj1yYy82mZ2iCYsrdDXr5sqcRgAE8JOoyyaajeBiCM6_FxazEYjAAQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:06:09 -0500 (EST)
Date: Mon, 14 Nov 2022 14:06:08 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Enforce the minimum rate at
 runtime_resume
Message-ID: <20221114130608.kqxhorlee25rvrc7@houat>
References: <20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296c@cerno.tech>
 <20220929-rpi-pi3-unplugged-fixes-v1-1-cd22e962296c@cerno.tech>
 <737e7e23-1bc5-eaf3-2d15-5498fc5b0415@i2se.com>
 <b49a242f-dc85-171d-1f0c-93b9099712a3@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zvzqn4wjbzjl3o27"
Content-Disposition: inline
In-Reply-To: <b49a242f-dc85-171d-1f0c-93b9099712a3@i2se.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zvzqn4wjbzjl3o27
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Mon, Nov 14, 2022 at 01:48:14AM +0100, Stefan Wahren wrote:
> Am 11.11.22 um 22:08 schrieb Stefan Wahren:
> > Hi Maxime,
> >=20
> > Am 29.09.22 um 11:21 schrieb Maxime Ripard:
> > > This is a revert of commit fd5894fa2413 ("drm/vc4: hdmi: Remove clock
> > > rate initialization"), with the code slightly moved around.
> > >=20
> > > It turns out that we can't downright remove that code from the driver,
> > > since the Pi0-3 and Pi4 are in different cases, and it only works for
> > > the Pi4.
> > >=20
> > > Indeed, the commit mentioned above was relying on the RaspberryPi
> > > firmware clocks driver to initialize the rate if it wasn't done by the
> > > firmware. However, the Pi0-3 are using the clk-bcm2835 clock driver t=
hat
> > > wasn't doing this initialization. We therefore end up with the clock =
not
> > > being assigned a rate, and the CPU stalling when trying to access a
> > > register.
> > >=20
> > > We can't move that initialization in the clk-bcm2835 driver, since the
> > > HSM clock we depend on is actually part of the HDMI power domain, so =
any
> > > rate setup is only valid when the power domain is enabled. Thus, we
> > > reinstated the minimum rate setup at runtime_suspend, which should
> > > address both issues.
> > >=20
> > > Link: https://lore.kernel.org/dri-devel/20220922145448.w3xfywkn5ecak2=
et@pengutronix.de/
> > > Fixes: fd5894fa2413 ("drm/vc4: hdmi: Remove clock rate initialization=
")
> > > Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > > =A0 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++++
> > > =A0 1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index 199bc398817f..2e28fe16ed5e 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -2891,6 +2891,15 @@ static int vc4_hdmi_runtime_resume(struct
> > > device *dev)
> > > =A0=A0=A0=A0=A0 u32 __maybe_unused value;
> > > =A0=A0=A0=A0=A0 int ret;
> > > =A0 +=A0=A0=A0 /*
> > > +=A0=A0=A0=A0 * The HSM clock is in the HDMI power domain, so we need=
 to set
> > > +=A0=A0=A0=A0 * its frequency while the power domain is active so tha=
t it
> > > +=A0=A0=A0=A0 * keeps its rate.
> > > +=A0=A0=A0=A0 */
> > > +=A0=A0=A0 ret =3D clk_set_min_rate(vc4_hdmi->hsm_clock, HSM_MIN_CLOC=
K_FREQ);
> > > +=A0=A0=A0 if (ret)
> > > +=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > +
> >=20
> > unfortunately this breaks X on Raspberry Pi 4 in Linux 6.0.5
> > (multi_v7_defconfig + LPAE). Today i saw this report [1] and bisected
> > the issue down to this patch. Shame on me that i only tested this patch
> > with Rpi 3B+ :-(
>
> Looks like "drm/vc4: hdmi: Fix HSM clock too low on Pi4" addresses this
> issue ...

Yes, indeed. The fix should be on its way to -stable already

Maxime

--zvzqn4wjbzjl3o27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY3I9QAAKCRDj7w1vZxhR
xQKtAP4+zlNIn7+r6XxtuDBvv0Eo4QlHEDhlHIQWW069FlLORAD+LiRnVQRFYCRX
sJL1ElqKtlXEsrhB6Q2bUqMfY9W+Lww=
=9ceS
-----END PGP SIGNATURE-----

--zvzqn4wjbzjl3o27--
