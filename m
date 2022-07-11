Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E646570192
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 14:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBE01123C9;
	Mon, 11 Jul 2022 12:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E851123C9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 12:02:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 672965C011B;
 Mon, 11 Jul 2022 08:02:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 08:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657540966; x=1657627366; bh=SNJeB4/Dhx
 l49TyIs9UIYt5Da1GYDJCoWXl/+bNAjSg=; b=d2zQM0TT+dVDBVoO9zhQd5acBb
 lV4fTkkCb28HElRT+KGK2pLBIVLxOi0QsQY5xxT71YneRVlAOsFjRXHSsMiuXcmQ
 c1OwSHReUuZQT3QfyyHS1DqVf54kwb/UJfw7jDSkw9p1Y94RUAu8Xs+1pfPgmTg+
 2PCAWqyRrYbGepm2u4dpz0vi950hXhtYlhnroZRXydd3Kmep/tPvnfSUt0hbe08T
 LmsWD4B4p1OH/ULW8cbln3QdFAeYRJ8+RGz7vNs0txGQSqsz9RVyZzFtmrQsx792
 UrJYWW1yi082WuhQvzKnLurg4bA8N+frEbubTvTcN9tiCjS0L6jfwr9MFIvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657540966; x=1657627366; bh=SNJeB4/Dhxl49TyIs9UIYt5Da1GY
 DJCoWXl/+bNAjSg=; b=ZYyBOd45wTxQq8HnbyQvvMyDUdp1d4uBVDXUdw7wFbPS
 NNsFd5LREx0AcBhzv67bZ5RJF/uxNWPwFlVyGrp1q2dkNuIiI922TIf9+aDNwIAR
 J0VnS8e/xNmmeTgNnEzxfLt1J5s1DHgObR3ckiarHARw/VQ/0NK9qxVCBXdA3LoL
 b6vFr4KPuRnUtPDtCh3Uk/Mv2FeXlc1BKQglZlV9FiUUo+isUPcpfNoXbNPyxz48
 q7lpTpn0G7plK9HoJic0XHjamTsSNXqgllJaXc+8FEVTzlKhBKUXUN+JS9qRWSgR
 J/BQH6OjxocBl1dtecYTwxBFxFg4XHKmHScJvLBAmg==
X-ME-Sender: <xms:ZRHMYoK3i3JaIHiWcavScYKBKebkZiqyZgDFi3MbK1fuDKp482Y1Zw>
 <xme:ZRHMYoIKKnwY0SiSRuUjMrDa6byX4vVnikPglRQKHnMhpVG0qsv8OCH5GNBreJr0g
 AKn1ZmmZG12FKLmKKY>
X-ME-Received: <xmr:ZRHMYoudjwYKusiFf99YTicZpKpsuKHnKtkkqYwUJpP3RUK_1DO9G-DMbbbVIEx4T8fwZoBYkWyGV0S-cQVcmGycpnhGeRgKhn1Xn88>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgkeevueetgffhueeujefhgeejiefgiedtveefgfdugefhteejgedufedv
 geeukeenucffohhmrghinhepsghoohhtlhhinhdrtghomhdpfihikhhiphgvughirgdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZRHMYlZiuN1vDzy1npuRR7J7UOyphH-4r-QMdQFoT52v0OOSSv8EuA>
 <xmx:ZRHMYvbmZoee_JF7nAXHttP09yGmw6waEqA4seoTCp7Q0ULB3hS_JA>
 <xmx:ZRHMYhD3_9mvc9hYACv6NXeZigxW4aRAFZg52P9ZIj59OOFmKENArQ>
 <xmx:ZhHMYtP-XIR7VJ_8KK74t2nzs_cmwdM_1qmqfQWFJBXT2gnk6hpYQQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 08:02:45 -0400 (EDT)
Date: Mon, 11 Jul 2022 14:02:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
Message-ID: <20220711120243.v6lwoynqigle2aot@houat>
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
 <20220711093513.wilv6e6aqcuyg52w@houat>
 <43d75dce-988a-0a95-cb0a-0d0a7c81ca63@suse.de>
 <20220711114206.sawqdl54ibuxsxp4@houat>
 <CAMuHMdXbFHWWQoryXihVsSrC5ZzHEV-YYR_eLvNmSAw8Y61TQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x3skiy3qyum7i2u6"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXbFHWWQoryXihVsSrC5ZzHEV-YYR_eLvNmSAw8Y61TQg@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--x3skiy3qyum7i2u6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2022 at 01:59:28PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Mon, Jul 11, 2022 at 1:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Mon, Jul 11, 2022 at 01:11:14PM +0200, Thomas Zimmermann wrote:
> > > Am 11.07.22 um 11:35 schrieb Maxime Ripard:
> > > > On Mon, Jul 11, 2022 at 11:03:38AM +0200, Thomas Zimmermann wrote:
> > > > > Am 08.07.22 um 20:21 schrieb Geert Uytterhoeven:
> > > > > > The mode parsing code recognizes named modes only if they are e=
xplicitly
> > > > > > listed in the internal whitelist, which is currently limited to=
 "NTSC"
> > > > > > and "PAL".
> > > > > >
> > > > > > Provide a mechanism for drivers to override this list to suppor=
t custom
> > > > > > mode names.
> > > > > >
> > > > > > Ideally, this list should just come from the driver's actual li=
st of
> > > > > > modes, but connector->probed_modes is not yet populated at the =
time of
> > > > > > parsing.
> > > > >
> > > > > I've looked for code that uses these names, couldn't find any. Ho=
w is this
> > > > > being used in practice? For example, if I say "PAL" on the comman=
d line, is
> > > > > there DRM code that fills in the PAL mode parameters?
> > > >
> > > > We have some code to deal with this in sun4i:
> > > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4=
i/sun4i_tv.c#L292
> > > >
> > > > It's a bit off topic, but for TV standards, I'm still not sure what=
 the
> > > > best course of action is. There's several interactions that make th=
is a
> > > > bit troublesome:
> > > >
> > > >    * Some TV standards differ by their mode (ie, PAL vs NSTC), but =
some
> > > >      other differ by parameters that are not part of drm_display_mo=
de
> > > >      (NTSC vs NSTC-J where the only difference is the black and bla=
nking
> > > >      signal levels for example).
> > > >
> > > >    * The mode names allow to provide a fairly convenient way to add=
 that
> > > >      extra information, but the userspace is free to create its own=
 mode
> > > >      and might omit the mode name entirely.
> > > >
> > > > So in the code above, if the name has been preserved we match by na=
me,
> > > > but we fall back to matching by mode if it hasn't been, which in th=
is
> > > > case means that we have no way to differentiate between NTSC, NTSC-=
J,
> > > > PAL-M in this case.
> > > >
> > > > We have some patches downstream for the RaspberryPi that has the TV
> > > > standard as a property. There's a few extra logic required for the
> > > > userspace (like setting the PAL property, with the NTSC mode) so I'=
m not
> > > > sure it's preferable.
> > > >
> > > > Or we could do something like a property to try that standard, and
> > > > another that reports the one we actually chose.
> > > >
> > > > > And another question I have is whether this whitelist belongs int=
o the
> > > > > driver at all. Standard modes exist independent from drivers or h=
ardware.
> > > > > Shouldn't there simply be a global list of all possible mode name=
s? Drivers
> > > > > would filter out the unsupported modes anyway.
> > > >
> > > > We should totally do something like that, yeah
> > >
> > > That sun code already looks like sometihng the DRM core/helpers shoul=
d be
> > > doing. And if we want to support named modes well, there's a long lis=
t of
> > > modes in Wikipedia.
> > >
> > > https://en.wikipedia.org/wiki/Video_Graphics_Array#/media/File:Vector=
_Video_Standards2.svg
> >
> > Yeah, and NTSC is missing :)
>=20
> And that diagram is about the "digital" variant of PAL.
> If you go the analog route, the only fixed parts are vfreq/hfreq,
> number of lines, and synchronization. Other parameters like overscan
> can vary.  The actual dot clock can vary wildly: while there is an
> upper limit due to bandwidth limitations, you can come up with an
> almost infinite number of video modes that can be called PAL, which
> is one of the reasons why I don't want hardware-specific variants to
> end up in a global video mode database.

Do you have an example of what that would look like?

Maxime

--x3skiy3qyum7i2u6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYswRYwAKCRDj7w1vZxhR
xZyoAQCvlU6ptYDqlD+5OSnBEW8SlJn/EIzhjLez9dXEBiIMzAD4+ipmQOM8LYFe
Zmp1HcwEg3Jc/z7O6MErAiPEQdITAA==
=pcXa
-----END PGP SIGNATURE-----

--x3skiy3qyum7i2u6--
