Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A9493D80
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25B010E126;
	Wed, 19 Jan 2022 15:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADB810E126
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:45:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1AB961518;
 Wed, 19 Jan 2022 15:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1238AC004E1;
 Wed, 19 Jan 2022 15:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642607145;
 bh=lGvpU5SU2oeO2Gj2gUOdONvIDUBxvoCyLVrP9LdAyK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uFHSCn+eRhus5s0gMFtlk4M/7JhocnfANlW1cVHA0G6W01cpJd8F+h8fndGiFBKZn
 nCZZCtAQC4k7abNvVhvbVvzHZ7dwbuD74/T+NiX/IT3CWwnmAbzJ0EI/MN3ouRA4NK
 JcMa2vYnHRlxojVgmRVHQy8kAseKCb6RYvwbbz/tuDQ+FYrQPMEKinDs+/J/QCmOle
 OH44fC1gV0pSNhO5CC8MUprlf5WJ73QIy9YW2JqYDexDIA+m9Gz2JyKjFMMikgheJ8
 PhLYlTQI+6mhi8SuY2B8vNy7F68ziMiWUL/NDEe4veZOx2TcwQKBwmk2W+zhD/Bwkn
 UzTQKF64F/eMw==
Date: Wed, 19 Jan 2022 15:45:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
Message-ID: <YegyGbGcwSNo49gY@sirena.org.uk>
References: <20220119015038.2433585-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="czK8d+IES+j+3Pl3"
Content-Disposition: inline
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
X-Cookie: This bag is recyclable.
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, iommu@lists.linux-foundation.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-usb@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-crypto@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 dmaengine@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Joerg Roedel <joro@8bytes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--czK8d+IES+j+3Pl3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2022 at 07:50:38PM -0600, Rob Herring wrote:
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.

Acked-by: Mark Brown <broonie@kernel.org>

--czK8d+IES+j+3Pl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHoMhgACgkQJNaLcl1U
h9AndQf6AqqY9YG2aSYiiYYVIPZoOOjUX2h6CnkvjYCVewt5gN+SxENXpgaLc0p7
vUq1Rp5AXTu7uFjL2ebgJ8UZPO5cjNIcj81k5OTqRYCvRBqWrPJpsacwSvuNAIUC
wrrUMNkFdRa0zaMGhMzVeaIAH9o5nqER6z2qXqGG9ccVbPBok8wg6W1xQCDlmyp8
wzYMD1gLPXMihGy7mzkZd/BHFVdUjKVmYlGiUNl7GI9MVp6v8wt8BbDP4qng30Yz
BLjhS3YyPDXdeYumU5Mvht+JzYmhn8Ihggw6dbQf6dO/UjwL+5ApN6em8mMhc0VH
9cXSuI+tv6I8BrIvDkVLV+hVCpjdBg==
=GpmZ
-----END PGP SIGNATURE-----

--czK8d+IES+j+3Pl3--
