Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B8658F03E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49FE92FF9;
	Wed, 10 Aug 2022 16:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD49D12A90D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:18:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA46B61136;
 Wed, 10 Aug 2022 16:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FF3C433D6;
 Wed, 10 Aug 2022 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660148335;
 bh=WOQyPg8F0GVppRHtF6EF9IpQjF8KSCRpyTeSvQhMwxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S89LvgN8qVLeqDRD2w8AhD8yUAPYdHlfhL6whMkMxakEohbZ+Un4+LjsfKKaIaUe7
 EJsJZeZPXTn3F6xD/lHbj5AEBAPRflPFS0IdDB/1GtTyuKpu6AG9Blr/jff7Dbl+ZC
 G1adPQFCuYz404oBBoeY4IjfH5FrDXs9fnje8W/WQ8dLSYq3Oykw/u6P686Omusjzl
 KZYjpx612gkx65/8XkAzwHWLoeJ/KLAZapG4/G7VFgkV9wdCkZ1hAXN3rF34y6D/rG
 Eo3ONAbz+SMT+pkve212jW7LMzFgPVgtBEub//Gg0L3+sJQUFVQn2oMIX44rB/uapM
 MjeFMq3Bc9cuw==
Date: Wed, 10 Aug 2022 17:18:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] spi/panel: dt-bindings: drop 3-wire from common properties
Message-ID: <YvPaaOgCUABREOcX@sirena.org.uk>
References: <20220810131311.428645-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="C7paN41YzbGadmb4"
Content-Disposition: inline
In-Reply-To: <20220810131311.428645-1-krzysztof.kozlowski@linaro.org>
X-Cookie: First pull up, then pull down.
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Jonathan Bakker <xc-racer2@live.ca>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Pratyush Yadav <p.yadav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--C7paN41YzbGadmb4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 04:13:11PM +0300, Krzysztof Kozlowski wrote:
> The spi-3wire property is device specific and should be accepted only if
> device really needs them.  Drop it from common spi-peripheral-props.yaml
> schema, mention in few panel drivers which use it and include instead in
> the SPI controller bindings.  The controller bindings will provide
> spi-3wire type validation and one place for description.  Each device
> schema must list the property if it is applicable.

What's the plan for getting this merged?  I can just apply it at -rc1 if
that works for people?

--C7paN41YzbGadmb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLz2mgACgkQJNaLcl1U
h9ChMQf9H6LPOdfGbu1FptjroVm8hHLsgruU3wnuUkhB1F1WtZkMEbcb9zAEutl7
JxSo0Fu8wBzvndSpzXzOyZlQsukueeOcTXd9lFZI3NQmKRSD7DAgl9UzMeXnETdx
aarr1MxJYaTONXaMvQxrCLMLuaqNZ7eQ4XexnuXrv52Lh6LYp52/IAijKwfH19oz
E79hMp+bVng67iZRNwn+0HuZgbR83ZCyDqFJpP9li7m756PseyEU2nf1F3cYP0D6
Y8hVZ02benHf+kIxA0nQR4FjM2OV1tuzvDobJikC3V3OLg8VVGoM4aZEbM6rEiaP
gTGuMwxcZU0NSsmxTd30vnu3YkgzCg==
=keHt
-----END PGP SIGNATURE-----

--C7paN41YzbGadmb4--
