Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3D945056C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 14:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FEE89E59;
	Mon, 15 Nov 2021 13:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34F689E65
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 13:29:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01B2961C4F;
 Mon, 15 Nov 2021 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636982957;
 bh=d7tYqUsWDtoH/nl2BZKWt1Fg723w2autMfgUYEMNJag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NxAtFPBbvP/6AMCR/771dj85JLwT9nMjXuRQW/p/vGkRcrzxY2dfXvwIZFnFfefwu
 kvsKyiub8ajs3EgHPbs6+p59+0bA/wbHJl2rz7tgW3TeuyJq/UzZVAAAGhAdFi+CZW
 Uw+2qQawe1sg1MzO5qZDCDpwqeQYNaR5EdOhc2COOEUfXCP0x7GGBQFYXF9J63TxGW
 AwoXnh5gr7ftDkRGa/KmDw/s4JgpvjP7FcwtMuv6k/iKRgLccKlkjLmXo33ME7VFfJ
 JbTTzrKQ/VAOfK2BvkUlHyAruho4/iLVVQdqlwG9oXsUX0VqxqKDDGf3cxU4kWKLOe
 vGM3FZPU3/xnQ==
Date: Mon, 15 Nov 2021 13:29:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 02/11] spi: pic32: stop setting dma_config->slave_id
Message-ID: <YZJgoxE15OYKYP2K@sirena.org.uk>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IMTM3OEYqWoLprto"
Content-Disposition: inline
In-Reply-To: <20211115085403.360194-3-arnd@kernel.org>
X-Cookie: Custer committed Siouxicide.
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
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 Jaroslav Kysela <perex@perex.cz>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--IMTM3OEYqWoLprto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 09:53:54AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Setting slave_id makes no sense with DT based probing, and
> should eventually get removed entirely. Address this driver
> by no longer setting the field here.

Acked-by: Mark Brown <broonie@kernel.org>

--IMTM3OEYqWoLprto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGSYKMACgkQJNaLcl1U
h9BFJgf/fpBvGqcjOVPEzPWsUxd950Aql84mdfpVf7Q34yAtuAJMlorUf+ARZFeV
RvrFCJ6tyeWZsZCKm+HMgfJFIp4GSOcn2asZ7p06z3lpAzDdX9Yn8aFW1bcIUOee
EjiSLquSQyBmUy+upf3bbaVPV1YyDaj5IajH5PQCVwj1mfRcilnqGpBPEJgpEo99
MNhpTEA3rcd6ESQQ0QyMAliW+T4BwAkXCtnWnSt4bVq1NfViOEbTGn/Nh7OaGwrI
dNe0cE4t3/9Vo3mtQY6IgF2d7gcIiTePrXRq74w940zsn4Rh6RpX5mGPiwM+OYh3
l7AvLSoqMeL1h9M5Yek/O6k8yVVJuQ==
=RhAB
-----END PGP SIGNATURE-----

--IMTM3OEYqWoLprto--
