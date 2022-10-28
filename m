Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168B5610FAF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 13:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A9B10E7FB;
	Fri, 28 Oct 2022 11:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EB010E7FB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 11:29:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5493D5C004F;
 Fri, 28 Oct 2022 07:29:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 28 Oct 2022 07:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666956576; x=1667042976; bh=Qm4IRqLiRB
 kLSjR7vK0uIG5GMpYwOluO0lTKxZvizEo=; b=AJ47OfNHw79qe4BRBYQ9VyYdK4
 sDg0Gug1IG1DQ6uHimrQ2ERiFi+qhqINjVK40ZMjnGfc9955tU2hFUGTMMSj4+OU
 rXyq+l4SekG0IdsCqwrVZ/ukU+OYgdU41fV7O02+67gIbPk1bmMV4UB+9x7OJykR
 Rf+zXf+kP1FC/6P7++DKm79oGkuQjQ01Lk7gi0gb26CoQaCsfACwf8N5EMaNS3ri
 m1Uecvfm+XBsYgtOesRHSPn7x/mt5bzqXwzFUUDGgyZht5MljcfvmA564awufFXi
 GBhZdYbMBetPmPjjXR81s2cxETIkfngo2Kk+YNbLiBMgZEHwnR8s6DBIDFOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666956576; x=1667042976; bh=Qm4IRqLiRBkLSjR7vK0uIG5GMpYw
 OluO0lTKxZvizEo=; b=nwujf4cSAzFLxv1/VxVB83derTkilPv32O6Wy4gruiFi
 CqI5FER6McHa1E7lqYSp0Nu7+ZUjHxaHUA/S3R+MSQIwioRr14qXNTOAPkmz+ijC
 TSmmgAzs41JyBHIo3uJnuQ+ElUGEi/C8V49r87MZqJJpjxGqKYNKVP2kI5PlKjs+
 k9DJ8SbOnmHGfPNbvWZjjOi1R+GM9i9b0tS795QeC2USxwIxxV2FyVdcu3p9l6tV
 F4YMLScE111FJPNT0HU5euDflKu9vvCB/nh4J/WzguWjKCGsVaHw2348Itet5hVe
 Zw7TvMt08+Jmv6dI5wuT3Y5RH9RinSfeHSpnIDYEsA==
X-ME-Sender: <xms:H71bY1qiWqQ-Z8IVq_u1ZwNq6rEEiA3DhLH3wWi9X5ix5kpBAWyPZQ>
 <xme:H71bY3oYYmeGkUmtNi8m86BMMyOnKdHpO5o-LjGjWgWkYt3tvUvpiynSSWX3-m0pf
 fQ72cjEYFb_1Kw8NbI>
X-ME-Received: <xmr:H71bYyNgmnq7-CDSgbotYOqRNx6UxJsn-3Lzvkc6v7H1yOcIZprMWevUk7AMCYuDyJ48Gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeigdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:H71bYw7NQSXjiAHdzhV-Xub4F773Lwp4zGGzPbe1GO6old0Nj_1WMQ>
 <xmx:H71bY06namSDmkzahXe9-N-z74uS1RSpj_PlBMGFGhe1QGV3SEIqZA>
 <xmx:H71bY4jsh_TreRr3EXwF_f8s5UT2JzEI6N4ORofHccGCpkM5T1MKww>
 <xmx:IL1bY0wvsIe352vNcD5VCgVS_gc6W00HYnjECgcBuwQWOug7-coLKw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 07:29:35 -0400 (EDT)
Date: Fri, 28 Oct 2022 13:29:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] drm/vc4: hdmi: Fix HSM clock too low on Pi4
Message-ID: <20221028112933.fcl4prk3xhvq5qi4@houat>
References: <20221021131339.2203291-1-maxime@cerno.tech>
 <bb901a65-d7c3-b75e-c34b-23ec46c960f6@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2zvnnpwaiarsczi6"
Content-Disposition: inline
In-Reply-To: <bb901a65-d7c3-b75e-c34b-23ec46c960f6@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2zvnnpwaiarsczi6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Javier,

On Thu, Oct 27, 2022 at 05:25:49PM +0200, Javier Martinez Canillas wrote:
> On 10/21/22 15:13, maxime@cerno.tech wrote:
> > Commit ae71ab585c81 ("drm/vc4: hdmi: Enforce the minimum rate at
> > runtime_resume") reintroduced the call to clk_set_min_rate in an attempt
> > to fix the boot without a monitor connected on the RaspberryPi3.
> >=20
> > However, that introduced a regression breaking the display output
> > entirely (black screen but no vblank timeout) on the Pi4.
> >=20
> > This is due to the fact that we now have in a typical modeset at boot,
> > in vc4_hdmi_encoder_pre_crtc_configure(), we have a first call to
> > clk_set_min_rate() asking for the minimum rate of the HSM clock for our
> > given resolution, and then a call to pm_runtime_resume_and_get(). We
> > will thus execute vc4_hdmi_runtime_resume() which, since the commit
> > mentioned above, will call clk_set_min_rate() a second time with the
> > absolute minimum rate we want to enforce on the HSM clock.
> >=20
> > We're thus effectively erasing the minimum mandated by the mode we're
> > trying to set. The fact that only the Pi4 is affected is due to the fact
> > that it uses a different clock driver that tries to minimize the HSM
> > clock at all time. It will thus lower the HSM clock rate to 120MHz on
> > the second clk_set_min_rate() call.
> >=20
> > The Pi3 doesn't use the same driver and will not change the frequency on
> > the second clk_set_min_rate() call since it's still within the new
> > boundaries and it doesn't have the code to minimize the clock rate as
> > needed. So even though the boundaries are still off, the clock rate is
> > still the right one for our given mode, so everything works.
> >=20
> > There is a lot of moving parts, so I couldn't find any obvious
> > solution:
> >=20
> >   - Reverting the original is not an option, as that would break the Pi3
> >     again.
> >=20
> >   - We can't move the clk_set_min_rate() call in _pre_crtc_configure()
> >     since because, on the Pi3, the HSM clock has the CLK_SET_RATE_GATE
> >     flag which prevents the clock rate from being changed after it's
> >     been enabled. Our calls to clk_set_min_rate() can change it, so they
> >     need to be done before clk_prepare_enable().
> >=20
> >   - We can't remove the call to clk_prepare_enable() from the
> >     runtime_resume hook to put it into _pre_crtc_configure() either,
> >     since we need that clock to be enabled to access the registers, and
> >     we can't count on the fact that the display will be active in all
> >     situations (doing any CEC operation, or listing the modes while
> >     inactive are valid for example()).
> >=20
> >   - We can't drop the call to clk_set_min_rate() in
> >     _pre_crtc_configure() since we would need to still enforce the
> >     minimum rate for a given resolution, and runtime_resume doesn't have
> >     access to the current mode, if there's any.
> >=20
> >   - We can't copy the TMDS character rate into vc4_hdmi and reuse it
> >     since, because it's part of the KMS atomic state, it needs to be
> >     protected by a mutex. Unfortunately, some functions (CEC operations,
> >     mostly) can be reentrant (through the CEC framework) and still need
> >     a pm_runtime_get.
> >=20
> > However, we can work around this issue by leveraging the fact that the
> > clk_set_min_rate() calls set boundaries for its given struct clk, and
> > that each different clk_get() call will return a different instance of
> > struct clk. The clock framework will then aggregate the boundaries for
> > each struct clk instances linked to a given clock, plus its hardware
> > boundaries, and will use that.
> >=20
> > We can thus get an extra HSM clock user for runtime_pm use only, and use
> > our different clock instances depending on the context: runtime_pm will
> > use its own to set the absolute minimum clock setup so that we never
> > lock the CPU waiting for a register access, and the modeset part will
> > set its requirement for the current resolution. And we let the CCF do
> > the coordination.
> >=20
> > It's not an ideal solution, but it's fairly unintrusive and doesn't
> > really change any part of the logic so it looks like a rather safe fix.
> >=20
>=20
> What a great commit message. I learned a couple of things from it :)
>=20
> [...]
>=20
> Maybe adding some comments here explaining why two instances of the
> same clock are getting by the driver? It's very clear after reading
> your commit message, but it may not be for someone looking the code.

Yeah, possibly. I have every intention on switching to the same clock
driver for the Pi 0-3 and Pi4 (patches have been sent already), and
reverting that commit and a few others in a few releases.

I've already tested that everything works with the firmware clocks + the
reverts, so it's just a matter of letting enough time for everybody to
catch up. So that patch is just transitory and is just meant to fix the
code right now.

Maxime

--2zvnnpwaiarsczi6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1u9HQAKCRDj7w1vZxhR
xb6VAP4zmQYRe8jk6DBsgWqWpanYgUkRbMmSmoiK80DJ02MLCwEA9ZK55j/JurbK
685wyDfr/1zyGDHL//St7SEnYTHrwwc=
=ZnG7
-----END PGP SIGNATURE-----

--2zvnnpwaiarsczi6--
