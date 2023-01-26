Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F2267CC65
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA1210E8EE;
	Thu, 26 Jan 2023 13:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B8110E8EE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:40:06 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F8365C049F;
 Thu, 26 Jan 2023 08:40:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 26 Jan 2023 08:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674740406; x=1674826806; bh=CBiXFVMDAv
 Nxh7UYGmOLV494Qj440CJpCvkMHt7+Ygs=; b=o5ql+HZEfcWc61BRUIcf8UIHLt
 dcyrInVEzN8+WZLR5nhODmNIBLfjGWiZO+H9VBOiV4UjmVACFxVaBwqUaiWR5gxG
 EOZ0Z0cfqyHwsnUjC3G0BT8t0235p/89DabBQf2+RuQdFeg4ahOCi0LjpXSFOy0T
 7lg/SYm8IJ1yifHbu3pZjHAyTSGDeExGlJdlNTXWRuBPmkIaDQv8wFaJqbkI0pxk
 Z4UHUkEfMj8gcRrR0woQmBt4QQploi/bBts8hddd7gEF43ddHW1Rus53AwL2mzqD
 bR06Jb17yQi/ZDBJURXUKjKhRmPgjRxjf2pASLsDv+LeBc9XwB+jjaYjowJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674740406; x=1674826806; bh=CBiXFVMDAvNxh7UYGmOLV494Qj44
 0CJpCvkMHt7+Ygs=; b=ewAn02uD4RyW9svtZMxx+E98pZJkv0iq+K8awNRjNd3A
 KMDTb9Fdck80XEnpdBjrfDGb4oru3VEL3LIBGubg/upHXc7GJx1hWJddDmmtD0GC
 6a4w6qi2Qu4TBZFu02w1NxgyoZv2iJhJ7vpHC7DwpwiYOL2e6VA65RZ1wRbkapyn
 GgP3sWrfF+Y6v+jldDlgHRf/0ihSMIaT7+FgMvDBwsesfS5V1OopQzQWonxalj90
 naozKJamSzN80W0RKff6Nx54vg0VhD+Af5W+7eCeavlKRkgaOBpy2i6+BqTy/Iwj
 4VAVBJ9+qi3Xc7olJc0twzIP8Epm/BMDNHtsjAihjQ==
X-ME-Sender: <xms:tYLSY7U167LJ0KBExhY1bhst-DETOy7hICUtsqn4yNneZLIXJiUZKw>
 <xme:tYLSYzmYOEEf0_yIeMYIpq11Z1ukhULBGnzNlHPsh_zOvtEfybzTJU2-sRxZCFp57
 GYA5UgkWSbuR-TOJYI>
X-ME-Received: <xmr:tYLSY3ZeyFdG3NOVLLxflboll_7aOFXbWTS24KVP0wUOCe227bkLUl91uSQoQzSl80KP9sbTnYOqJ_mtfDg-nfSvm7xfHhZPqI2r6hDItFzIYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tYLSY2Wo2RLw_GB0evFWtfckSHFYlpmrhhrJzf-k7GTdXevm9gFdLA>
 <xmx:tYLSY1k1V6NfUzmFRBq1F9RWzn45z-mhGSCRbEzleX8p0c5omSdgow>
 <xmx:tYLSYzdJAsMVSGI5BLvoKzKPtC2bgc2-W2f5nYTEU3Wu4BXn0GOe9w>
 <xmx:toLSY48GzEHbK7R6TV2MoNQRUtgRt_-g8Y0lSBW0rtadr0ZO6VPiMw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:40:05 -0500 (EST)
Date: Thu, 26 Jan 2023 14:40:03 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 5/9] drm/vc4: hdmi: Rework the CSC matrices organization
Message-ID: <20230126134003.74z4iazwcsyl4et7@houat>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-5-6b15f774c13a@cerno.tech>
 <5394a702-20ef-bada-4731-b720b810998d@suse.de>
 <CAPY8ntCsp_qbjeyYvUQ0jmKh8gecvR-NmYaEPkrsxBhyZrHPxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uqgeyzk4fr7m4qsq"
Content-Disposition: inline
In-Reply-To: <CAPY8ntCsp_qbjeyYvUQ0jmKh8gecvR-NmYaEPkrsxBhyZrHPxg@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uqgeyzk4fr7m4qsq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 11, 2023 at 05:00:41PM +0000, Dave Stevenson wrote:
> Hi Thomas
>=20
> Thanks for the review
>=20
> On Wed, 11 Jan 2023 at 15:03, Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
> >
> > Hi
> >
> > Am 07.12.22 um 17:07 schrieb Maxime Ripard:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >
> > > The CSC matrices were stored as separate matrix for each colorspace, =
and
> > > if we wanted a limited or full RGB output.
> > >
> > > This created some gaps in our support and we would not always pick the
> > > relevant matrix.
> > >
> > > Let's rework our data structure to store one per colorspace, and then=
 a
> > > matrix for limited range and one for full range. This makes us add a =
new
> > > matrix to support full range BT709 YUV output, and drops the redundant
> > > (but somehow different) BT709 YUV444 vs YUV422 matrix.
> >
> > The final sentence is confusing and I didn't understand how two
> > different matrices can now be just one.
>=20
> Two changes to accommodate the hardware requirements:
>=20
> Firstly the driver was only defining
> vc5_hdmi_csc_full_rgb_to_limited_yuv444_bt709 and
> vc5_hdmi_csc_full_rgb_to_limited_yuv422_bt709. There was no matrix for
> full_rgb_to_full_yuv_bt709, so that had to be added.
>=20
> Secondly, for some reason when in 444 mode the hardware wants the
> matrix rows in a different order. That is why
> vc5_hdmi_csc_full_rgb_to_limited_yuv444_bt709 differed from
> vc5_hdmi_csc_full_rgb_to_limited_yuv422_bt709 - it was a simple
> reordering of the rows.
>=20
> This patch dropped the special handling for 444, and in the process
> programmed the wrong coefficients into the hardware :-(
> Patch 6/9 then reintroduces this reordering, so really should be
> squashed into the one patch.

Thanks to both of you for that feedback. I've chosen a slightly
different solution since I believe it still makes sens to have the swap
patch separate. I've move the swap function introduction earlier and
removed the two redundant matrices in that patch. And now, that patch
doesn't drop any matrix anymore so I've removed the confusing part of
the commit log.

> Looking at my more recent work, it looks like I messed up on 6/9 too.
> One of the patches on [1] corrects that row swapping for yuv444 - I
> was obviously having a bad day.
>=20
> Maxime: Are you OK to fix that up?

I've squashed it in for the next revision

Thanks!
maxime

--uqgeyzk4fr7m4qsq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9KCswAKCRDj7w1vZxhR
xVZVAP9BUveF4g7kHJ31THWzenNzfC5tUhEdCsdRdQQs+9BCAQD/WEdo4PZs5TW5
iz/FvN1naNwFlq41Z/WAhNBhI3oSjgc=
=a4Zh
-----END PGP SIGNATURE-----

--uqgeyzk4fr7m4qsq--
