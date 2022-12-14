Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3758664CCB5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 15:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF9E10E002;
	Wed, 14 Dec 2022 14:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D9510E002
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 14:54:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37C4361AE4;
 Wed, 14 Dec 2022 14:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52846C433D2;
 Wed, 14 Dec 2022 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671029650;
 bh=dgiUwqY3/7v657x+/yxqqCjT8BOqg5IiKbLRL0qNu0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GDMHkP2ZG5Etx3OT7LdkSD4vda9Jpb1ZBL4MZ1Ize55EWcYQIETDXO7wgZylU9xUE
 /NIuSLpNRwJOIOZ9L+Hu8pcD+6RRFradKMCCj3AvR5UVVI46oMwTDDgl9gt9L3i6+n
 yvWnVVRXTqHVNNZkTm9PV0boUNYgsPOG9rbLEWzNOQkL2WuPzERSW8AcFmiCc8ryly
 +DS/EWxmN/zh3Bg2+qcEZVv+05azM6osd+7EoD7QfBxBozsE8BdvBJpd+7M2RdWyim
 nzq61f4QhiTH9JUgMQYIUdDqwP/o5X9eeg2u7P04QKfK7WAY4w5GwrZmnNTbvQ69Y0
 RFCNuzD4gMaMw==
Date: Wed, 14 Dec 2022 14:54:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Message-ID: <Y5njirPlB8cGD7QT@sirena.org.uk>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
 <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
 <Y5nUmJVmiOFfoMQl@sirena.org.uk>
 <5cd34471-08cd-b4b8-c814-dc120417f602@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r01mdQDmJNGtac/H"
Content-Disposition: inline
In-Reply-To: <5cd34471-08cd-b4b8-c814-dc120417f602@collabora.com>
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


--r01mdQDmJNGtac/H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 14, 2022 at 03:27:56PM +0100, Guillaume Tucker wrote:
> On 14/12/2022 14:50, Mark Brown wrote:

> > As a developer I tend to find this unhelpful, it makes it much more
> > likely that the mail will get missed.  As a reporter it means there's
> > more information to copy into the report.

> Well it's up to you or anyone reporting the bisection result.
> Base on my personal experience, I always got very quick replies
> when doing this.

For me on the recipient side it's more a question of if you get any at
all.

> I don't see your point about copying more information though, I
> would just open the mbox in my mail client to reply and paste the
> content of the bisection report.  With a bit more work this could
> be fully automated but that should be part of the bisection
> rework using the new API & pipeline so sometime later in 2023...

If I'm manually pasing stuff I either have to quote it by hand or feel
like I need to edit the automatically generated bits.

> > I do notice that the Renesas tree tends to get a *lot* of the bisection
> > reports generated for some reason (vastly more than any other tree
> > including mainline or -next), however this wasn't sent based on the tree
> > at all - I just looked at the people involved with the commit.

> In the past month, there were 15 bisection reports on renesas, 7
> on linux-next and 28 on mainline for a total of 79 so 29 in other
> trees.  So it's true renesas is getting quite a lot of them, it's
> not entirely clear to me why that's the case but it's worth
> investigating a bit.

Yeah, that's vastly more than I'd expect and the overwhelming majority
of them are quite clearly not specific to the Renesas tree (things like
bootrr failures for non-Renesas boards).

--r01mdQDmJNGtac/H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOZ44oACgkQJNaLcl1U
h9B2xQf/ZVor3wmRAeG1aBDtCMNMjPi4jQ+7kKlLkPGWex+MN1eEvP5yJyd9EE+I
YsGjvpuMPA18nG0a/0Tq9mu+7eBeTIQ8/viKHsyOsYfRGwvd/6B16ITx03iF4Ga/
e0Rnc1ScGje81n+c/ax9pb1GPDrn/EH8yKawX7knlQsHm6DGFYAA8TaXLQxK9iU6
DkncmuYe/LGpIYqpaXOZkzP93kOGE8lvhuTxXgUwWm7mk4HoKTjhMApSXDTpCg2b
aYSUL4RQN6qQgdvKKjC/p5rc0+J6TxAoEn6O7fuDwEN/YuatHt0NwRYiP6FK6QLW
FX5zG15+CL7h2KVay8+gfADc/sPaug==
=vRv+
-----END PGP SIGNATURE-----

--r01mdQDmJNGtac/H--
