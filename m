Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC364CC7A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 15:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C1110E035;
	Wed, 14 Dec 2022 14:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5699610E035
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 14:40:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8EC961AC3;
 Wed, 14 Dec 2022 14:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FE0C433F1;
 Wed, 14 Dec 2022 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671028777;
 bh=I5OOBuoMYeLEH0RwCL77Nq9TiErE1+thKyQwphD+cQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OzOPSvWTzMMY0ppg6U0BnqNqg4l9RQkuKsY1ewfc/02oHyT2LkAp6eMgKh+TS03vX
 JmYY0Wt6WkfMKyfpwasYJb9ykP3dbSm++RR6kHiVX4mwMF5pdZyoc9iI967IRv6Or1
 NNgOHU6KLDtdXPqnlqWdQmPNQHClZWhJ4ioO+KLbXwmDKXtEmQwp5FQr4BG+zR2p53
 OCnClGilfo3Ks7Amj+48N9585ZVazaSxuuuxZMIXY/vjd7+6aEe2lHIFhcDIDrKw5Y
 Nunt5T78pw0N9tblVMX5GIifCxx1ZAF4Xl3JiCKjEu3Usn8/AR2tuAwkZNT6vYy/gg
 rGUXBl6bSCyKg==
Date: Wed, 14 Dec 2022 14:39:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Message-ID: <Y5ngIwSr7PradhxE@sirena.org.uk>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
 <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
 <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
 <fea3d246-d1d5-450f-6e9e-1ab63a91a053@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DtV7b4PmSjtvIBY5"
Content-Disposition: inline
In-Reply-To: <fea3d246-d1d5-450f-6e9e-1ab63a91a053@collabora.com>
X-Cookie: I disagree with unanimity.
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Brian Norris <briannorris@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, kernelci@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DtV7b4PmSjtvIBY5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2022 at 03:16:33PM +0100, Guillaume Tucker wrote:

> Mark, how did you get the list of recipients?

> There's a command for this btw, which was used when the reports
> were automatically sent to the recipients before we reverted to
> manual filtering to reduce the noise:

My standard thing is to look at who touched the commit, possibly also
adding seemingly relevant maintainers depending on how good the list
=66rom the commit was (IIRC in this case the commit went entirely through
ChromeOS people so I added relevant DRM submaintainers which turned out
to be a surprisingly large number of people), and relevant lists.

> As you can see, Geert is not listed there.

I didn't send the report to Geert as far as I can see, I imagine he saw
it as a result of it going to one of the lists and noticed the mention
of Renesas as the tree, possibly he's got some filter set up to find
things that mention it.  The recipient list I have is:

| To: kernelci-results@groups.io, bot@kernelci.org, Brian Norris
|         <briannorris@chromium.org>, Sean Paul <seanpaul@chromium.org>, Do=
uglas
|         Anderson <dianders@chromium.org>
| Cc: gtucker@collabora.com, dri-devel@lists.freedesktop.org,
|         linux-arm-kernel@lists.infradead.org, Andrzej Hajda
|         <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.=
org>,
|         Robert Foss <robert.foss@linaro.org>, Laurent Pinchart
|         <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.=
se>,
|         Jernej Skrabec <jernej.skrabec@gmail.com>

which doesn't mention him at all.

> >> Yes it would be good to have 2nd order regressions based on a
> >> reference branch (e.g. mainline in this case) in KernelCI but
> >=20
> > Sorry, I don't know what is a "2nd order regression".
>=20
> Regressions are basically a delta between results in a given
> revision and the previous one on the same branch (new failures).
> What I call "2nd order" regressions are a delta of these
> regressions compared to another reference branch.  For example,
> regressions that are in a particular tree and aren't also in
> mainline such as the one at hand which isn't specific to renesas.

Like I said in the other mail there is something going on which means
that a *very* lerge proportion of our bisection results are found in the
Renesas tree.

> >> that's for next year.  Regardless, it found a commit and the
> >> bisection looks legit.

> > Good. So please report it to the relevant parties.

That's what I did...

> > While bisecting, as soon as you happen to arrive at a commit
> > that is already upstream...

> > 'ata-6.0-rc2' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata
> >     > git bisect bad 044610f8e4155ec0374f7c8307b725b7d01d750c
> > (which happens here  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^)

> > ... there is no point in "blaming" any of the bisection points before.

I'm not sure I understand the logic here?  The goal with a bisection is
to identify which commit caused an issue to aid in resolving whatever
the problem is.  It doesn't really matter if this happens before or
after the commit lands in Linus' tree.  I do agree that the tree
mentioned becomes a bit misleading though.

--DtV7b4PmSjtvIBY5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOZ4CIACgkQJNaLcl1U
h9DzIgf6Aif9NdqpwjA2ifrdE2SughCOtt0QcyUwLA5/bqwbhQDgPARuB9H1+FIL
2ubkbd1TTSVp7I/fUMcDnGQvolil0vfKQK0F1SOlRMfjRKrd4i+zHxlzyosjM4NY
vaBNkz0FjnjTxiCiG8C6OVKKwfXu9xAGSNZ6hDkfgBdq4KjhFGZ7nz2Tm+uJ+R8a
TDn1eTBA0pkomhc08UOgfQVnOlAWVHdHPnT8MYi/Ja5cjmSyh2xs/5mkGA3F1w9J
3Qq4jy9JmvWNOs3rkGtug78dIvIHHX3+SCFLH4RGdgZ8Pmsfwwt8zBEG/7g99sxD
vTI8vxoa1DvjoQOMsLDmBvfpdJFJIg==
=WLSf
-----END PGP SIGNATURE-----

--DtV7b4PmSjtvIBY5--
