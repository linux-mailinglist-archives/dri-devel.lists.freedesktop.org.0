Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B464B5059
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 13:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA13E10E30F;
	Mon, 14 Feb 2022 12:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5133210E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:40:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5B0AB80E91;
 Mon, 14 Feb 2022 12:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4250FC340E9;
 Mon, 14 Feb 2022 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644842418;
 bh=IQKHs148sOwzSOJ9x7YM1yay1qSuKlbeZzKnX8pviEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rWhH+LSokZ3Zs/QiXpu8o5Ki+KnAslQZ/LWSTzG9fMRcf+8pxIVHNAgtUU1oj6cvU
 ueXKCU7WZKJ/wRK68K+zEAjeJMdaM7s47AyvQ25N8LoFbUMh7pKIayN3VgCmqiQ99S
 EQR52sV8lX24QDh5Y6RmFhExf1wnMLker7AQ7F8D4NFlTeWtaasxrCVfhF99LVv4oK
 GCeaHeVIzO4MU8vxm/xgXbvG8u+tFoMpgRZSLd4+HwKHyKf5X75+YbpnFVMkkgUSk6
 fDvjyddaRrvSTNImWVKyRUoZuzRyOMhMV3cPUcakLZra9OnBOGXZW/szRhs+oQ3MYF
 1e2CJ3Ew+jpfQ==
Date: Mon, 14 Feb 2022 12:40:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 20/23] ASoC: codecs: wcd938x: Make use of the helper
 component_compare/release_of
Message-ID: <YgpNqLQzpx4J6d8K@sirena.org.uk>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-21-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kmbocLNYrfZ7Ic0Q"
Content-Disposition: inline
In-Reply-To: <20220214060819.7334-21-yong.wu@mediatek.com>
X-Cookie: Am I in GRADUATE SCHOOL yet?
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, Takashi Iwai <tiwai@suse.com>,
 James Wang <james.qian.wang@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kmbocLNYrfZ7Ic0Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2022 at 02:08:16PM +0800, Yong Wu wrote:
> Use the common compare/release helpers from component.

What's the story with dependencies here?  I've just got this one patch
with no cover letter...

--kmbocLNYrfZ7Ic0Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIKTagACgkQJNaLcl1U
h9ChNwf9H0Bf8Q4NJFX6MpkURJU1WTUkJZ8s9zjT9F5003kszR2qdhtG8TCUYisF
m+Ywr7okO1EGsbMSae1gxr0q5In/J/buVsEnIjl42Be7doIn1xXcDB+3tjDyi4aH
ZN/sHluDMyiwzeBgN2jiu99gsgHDVXThtPOdyMLab2QMCVo6PEox6vsKyIb6vO2F
Rl7BLwS916U45mWEFF/XAJLWV7QPG5f43JvKlSkjKLgJhFP8H/cxKzlNZclRAdEi
fSWK497fgwmyoHrXr2inZNyDmAh20f9np1WMgLBl2sJwN8LnmWSDpp76C/XfRV0T
Qp7CAMe19I/TqvJsaFw7oluNeBT7Yg==
=2URH
-----END PGP SIGNATURE-----

--kmbocLNYrfZ7Ic0Q--
