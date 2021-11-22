Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11D45981A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 00:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5EF89ECB;
	Mon, 22 Nov 2021 23:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2006089ECB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 23:01:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DBA960FED;
 Mon, 22 Nov 2021 23:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637622097;
 bh=5HPGeejKcq0/skHJyiqCEkuW5nT9h90VXdWH7CYPbFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nEdiJ23lulIvuZIRcBfsS+qhZQdy45DABTeQ/9eMEUl1h55xvksxls/uuZO4VBeI8
 VaCo7TKNLJwRLa3QYvdv6RNwEp2FVuh3jDzzlTQaQEP63m8H/MG3PA9JAEloDYolQp
 c9/rmjY39HvZyawWUPIV3NjC+iYFEvh7eF6njpejVduCoCGuYmDwm0WoROg8MZpuON
 SIl6D9XkBqQ40owCHtFzbFPFXQsgb6+Hp4V/BoNJJJnMHVdW/zgOyJBpirCAwPOfIz
 HcfB+kkGUqemGZoka/SinHrWStHXFAUQPzrIQFgTm1oadehKRNNCm1qA6BWKPpcaq0
 1TgibwoU5fvdw==
Date: Mon, 22 Nov 2021 23:01:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 00/11] dmaengine: kill off dma_slave_config->slave_id
Message-ID: <YZwhSPkhAqZy3bqY@sirena.org.uk>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="71Si6a9AhnlReqww"
Content-Disposition: inline
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
X-Cookie: Lake Erie died for your sins.
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


--71Si6a9AhnlReqww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 11:21:52PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> I recently came across some new uses of the 'slave_id' field that
> I had (almost) removed a few years ago. There are no legitimate
> uses of this field in the kernel, only a few stale references and
> two drivers that abuse the field as a side-channel between the
> dmaengine driver and its client.

Acked-by: Mark Brown <broonie@kernel.org>

--71Si6a9AhnlReqww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGcIUcACgkQJNaLcl1U
h9B/hgf6AiPwJAMMKcdb/6uCfAJACPZtqMFn2hE6HQgrw8mlTsR3sGqhQj3c3NWF
vkLYtSZ20L2tPvS1uyAxjIRzIm91rqriu6pNurmupB6D+347UfSMpYhtbEKXvbBw
1UF5ftPw1t5IGduAX6HKBfaN1Iab53577DJb/uJwR3Mb/WBh9aFpuyRwuZgjBOwE
MvpTaAK2GHY4loDjJChSAK+zlCQMFbc4I2mZuahtf4wvBts/eZn7bAqAruzPMnTL
e3crlktLeH7C0DMKJpmrxvTvS0CDsEUUOJ+tM7aNmtsdyYTAZEG35vzJgVly61jc
7e5I5GHB1Jxsid3oM7WeznOhbimQEw==
=AKUT
-----END PGP SIGNATURE-----

--71Si6a9AhnlReqww--
