Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C620264CB9C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 14:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE07089CAC;
	Wed, 14 Dec 2022 13:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0000989CAC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 13:50:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34C6B61A6D;
 Wed, 14 Dec 2022 13:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC252C433EF;
 Wed, 14 Dec 2022 13:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671025822;
 bh=wgoeiizVigHzlgSKCnu58TvkgEyPuCP7omUUezVwRzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P5/QpPs6g3HJW0DHIj9DvNCUo/az0ASQQ3gT6w6KNqhD/LlZi8TRZvPrBz+AKpY9B
 Ag23jLzeAuuHymihA05+H9iBRZGl3lLp0EzUU/L+t5elr9u84HsWVm4u9zPj+EQmMf
 xGdX+0nRAmYcD/VRn9w/r6e+whA5HdNJ50mAaBQWBPzT9IOCKeOVUh6Mp1Jwnw8HBg
 QeHDGN82aOBpVU50CqLPAzUhcZJPZfshMuEZnmR21bnXjSMi/XhCygOSaoME3kedhG
 bXiaUwvePgZE5IfXD/Peli/TOT7PwvrlmXX3BcacpptY3A3iQ5uFoO4DbTnC0rxI8S
 a8ZIrViy+h5nQ==
Date: Wed, 14 Dec 2022 13:50:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Message-ID: <Y5nUmJVmiOFfoMQl@sirena.org.uk>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
 <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oNvy1vpahnwJSFVs"
Content-Disposition: inline
In-Reply-To: <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
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


--oNvy1vpahnwJSFVs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 14, 2022 at 01:55:03PM +0100, Guillaume Tucker wrote:

> Maybe you could retrieve the original thread and rely to it with
> the report?  That's the ideal way of following up on a patch I
> think.  You can get the mbox file this way:

> ./kci_bisect get_mbox \
>   --commit ca871659ec1606d33b1e76de8d4cf924cf627e34 \
>   --kdir ~/src/linux

As a developer I tend to find this unhelpful, it makes it much more
likely that the mail will get missed.  As a reporter it means there's
more information to copy into the report.

> > ... which is an old commit, added in v5.19-rc2, and which did not
> > enter through the renesas tree at all?

> Do you mean this report shouldn't have been sent to you?

I do notice that the Renesas tree tends to get a *lot* of the bisection
reports generated for some reason (vastly more than any other tree
including mainline or -next), however this wasn't sent based on the tree
at all - I just looked at the people involved with the commit.

--oNvy1vpahnwJSFVs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOZ1JcACgkQJNaLcl1U
h9BOLAgAgGFv6pKTz4u1a8C9tAfbaFPsovD36k4vPE7uKiqEFWW7uytaJLeQtSNJ
vn6Bmt8qssNHs1UxeiUlgAO+1mcK6lllgnYBK/Wt/pXLOsf0fTRWPIG5dD7UhRnK
VJAfStQm7mpkKwkmvKlKRf4s5NtFxgLGlU9TpqkMfUdEOpo/1uLlwLY+fN/Dn8ns
wEhyys8vFLANgmxbmeTnfQk7GCC4OZgAvCrrtb9CJo6YjB2XJmdmNFwZzT3ZYPYr
gvYelHCNQhNU9r9KAMuSfxukPTritjyTeSfBzitnwt09tEz30smB5A+8gJDCDPYe
7fKjcRLOkWFZD4SGcDYYwAFBMBablw==
=ZUUp
-----END PGP SIGNATURE-----

--oNvy1vpahnwJSFVs--
