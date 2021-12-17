Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01702478989
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 12:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D40610FA4B;
	Fri, 17 Dec 2021 11:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B73210F891
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 11:12:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0FC78B82785;
 Fri, 17 Dec 2021 11:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB669C36AE5;
 Fri, 17 Dec 2021 11:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639739560;
 bh=RKGJPz8C0U0ZsiMre2FfG3eQ6nqVexMQpsMDBwuEE2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jgHIs90s3mcHXbZiOaTYVaQTBnIlBNyPYKTR2xcON3733zeL++yT/PrSQ1Iog1Pm0
 RWj5PLfDKWNYAX/D/FBArpOzUZFbf97tBlDPNQ2ySEGi7xpcbtu4TRg8nqdAHuY01S
 QK7QNVhP8vEfOjQYYMkoeNfKQegc5nCIFQN9EYVOjF0AFPkVeftTioUSW+TvCOhhm5
 fkDR8yQed3EU7OwHQhwTsacZI7jSDV/HPxZQ5DGDfXrclqZo41KJ1Yduws2Mvzy8cl
 VgPZ+3XPGfhWa48Aq5RTLXB9VEJYj31auR4usBY/hX/Rw0nz6naLwOUVU9ez0Xrrzm
 6S7/c9BaDc5Bg==
Date: Fri, 17 Dec 2021 11:12:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Message-ID: <Ybxwovlw2GARzqUO@sirena.org.uk>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-5-digetx@gmail.com> <YbtLJeIxXlVyQhd3@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JAZpGbY8XOTfys+K"
Content-Disposition: inline
In-Reply-To: <YbtLJeIxXlVyQhd3@orome>
X-Cookie: Pause for storage relocation.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Rob Herring <robh+dt@kernel.org>, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--JAZpGbY8XOTfys+K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 16, 2021 at 03:20:21PM +0100, Thierry Reding wrote:
> On Sat, Dec 04, 2021 at 05:37:07PM +0300, Dmitry Osipenko wrote:
> > Document new optional sound-dai-cells property of HDMI node. This node will
> > be used as endpoint of HDMI sound DAI graph.

> It's probably best for this to go through ASoC along with the other
> audio-related bindings.

> Alternatively, I've just sent out a patch that converts the host1x
> bindings to json-schema, so I could work this into that as well.

It doesn't apply to the ASoC tree for whatever reason so probably best
to roll it in with those JSON updates.

--JAZpGbY8XOTfys+K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8cKEACgkQJNaLcl1U
h9DhhAf/UDAiarRWxcOWMBLEJipkZDqy3MtVHPRhVBmjPClHzCw8XiqKmOxxEhqj
1Ec9I4WJ9ABw8o3OeNS+ajtkNG9QuORTVNKRcav90/uAQweEBIcoitYuGmUA+Mty
NFk7jyE+Loz2jh4Ya7TrV8l0PRK9V/jpeaXkpNlK/G1xrRpzRsnZsI2opDwXUZCm
OzafBX6UzCO+VW+zjc0PEqe4khyiGnJrTDjY5CA+pTexnjyNTyvIcCM8oFZx75vr
GIut6OfPBNFO2sPhoAx92dEmzs0jD4jyzHerrEebtxr8HjSYqR+/kHyby2+XWXlj
qKglzvyEcYihHJPF/ma0KJbHQzgapg==
=Ca/Y
-----END PGP SIGNATURE-----

--JAZpGbY8XOTfys+K--
