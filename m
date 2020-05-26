Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EBF1DE7C8
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 15:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AF86E0BE;
	Fri, 22 May 2020 13:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B29F6E0BE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 13:12:45 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4C7E206B6;
 Fri, 22 May 2020 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590153165;
 bh=eJKC82/JdUZHlra7wt2AcwBxZx0GOUHbM5qLt27y8DM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f5GKNdFgRnnBIO23cQpX5VzjxVD3vjqLDm5zKWQYH9PGzsWz88uDSXU4smxDdAEXw
 DuNIoPjen0K7HCQd+h/fexnZt0GCdHeqg99S0u9/zoItXB2B9XKxiQ9/4fuSQ5PaaE
 bXVA5rstzRikNPoIOt1rnpDxZXLvYgs5dXdkH0XQ=
Date: Fri, 22 May 2020 14:12:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
Message-ID: <20200522131242.GI5801@sirena.org.uk>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <CAA+D8APAMRwtVneqFsuBgAhozmQo3R0AQi0bVdUCQO4Af4xVfw@mail.gmail.com>
 <20200520123850.GE4823@sirena.org.uk>
 <CAA+D8AOiVVi3B4dzU8r=rCMz=6w9R=wxBkzAQ=0=RAQLKCWy8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA+D8AOiVVi3B4dzU8r=rCMz=6w9R=wxBkzAQ=0=RAQLKCWy8Q@mail.gmail.com>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linaro-mm-sig@lists.linaro.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 shawnguo@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, perex@perex.cz,
 Nicolin Chen <nicoleotsuka@gmail.com>, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-media@vger.kernel.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0863520544=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0863520544==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3U8TY7m7wOx7RL1F"
Content-Disposition: inline


--3U8TY7m7wOx7RL1F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2020 at 07:30:04PM +0800, Shengjiu Wang wrote:
> On Wed, May 20, 2020 at 8:38 PM Mark Brown <broonie@kernel.org> wrote:

> > Other drivers having problems means those drivers should be fixed, not
> > that we should copy the problems.  In the case of the PXA driver that's
> > very old code which predates deferred probe by I'd guess a decade.

> Thanks.

> For the FE-BE case, do you have any suggestion for how fix it?

> With DMA1->ASRC->DMA2->ESAI case, the DMA1->ASRC->DMA2
> is in FE,  ESAI is in BE.  When ESAI drvier probe,  DMA3 channel is
> created with ESAI's "dma:tx" (DMA3 channel
> is not used in this FE-BE case).    When FE-BE startup, DMA2
> channel is created, it needs the ESAI's "dma:tx", so the warning
> comes out.

Not really TBH, this seems like another one of those csaes where DPCM is
creaking at the seams :/

--3U8TY7m7wOx7RL1F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Hz8kACgkQJNaLcl1U
h9DJFQf+KOiSW3M/3ZDsfcMnTGh5HgNgjzZUpEU5f1ZyNw/EXh1ViAvYDpkQp2Er
kpo1Tgzodk1pkqsn1sWa5yWP+0c6LboBqkCq+02NHr3Kjyw3dQ6uV4ObJH35s/d1
39jbo9WIGQVqo8IOFdGhjpP4q72Vwxz1ki5asUYV3e1IO8aEowWvvbpnSIRlyuvH
rXKaqX6fYMsrMzXOhUx7afrt0n6HR/eBg/XkyIsnhXvvPpmxEAySIyKPOGGrftBM
rNmOV/XPKbLQXFzjWbK+3ChCcp6ETGTyUyHP25Dm+qXnIyvI6D1ssajhiZHN02RB
EdzpF/hkR+YLYUFNuN3fRvDOjQZT1A==
=fSbG
-----END PGP SIGNATURE-----

--3U8TY7m7wOx7RL1F--

--===============0863520544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0863520544==--
