Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE274493E4F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 17:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016F510E15D;
	Wed, 19 Jan 2022 16:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B0310E1C1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 16:30:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E46661581;
 Wed, 19 Jan 2022 16:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955B2C004E1;
 Wed, 19 Jan 2022 16:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642609836;
 bh=NPkrUgRYzcxwa3lnZh2dJ3qyPo1V5StcWneeKtWaOTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GMhWu7C3B60BdL8/99pPFWzH0CB7LU7Dz7GFXyQtbGWeKeKQJEE+V2fEbRhv/QrJW
 yYagtUm7pysfgqkJMyR27/xktDwbdWcoif82n5bf4F716uAgvyW4CrM7nnlUKhGZf0
 FU8zZ8ZvZl+QEyzj+ByrVczubpcuk9CdfXWCIEjg23SntmAfLaHiquJ5KbvTGWQWfn
 Hr8GUX32FKay/k82RyllkJOyRWhWEFPpRz5SEs7TiLsMcVgix5+RDcoF6No3Mm8HeE
 dgP9NlrSSG2qLfoDBPumyLb9lbK1A0ADtU3DkLXQ9hZS91Urze/uzDqpkaas6/c5dZ
 OCMIIrEVF0X5A==
Date: Wed, 19 Jan 2022 16:30:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop unnecessary pinctrl properties
Message-ID: <Yeg8pWYUwWKqOjhe@sirena.org.uk>
References: <20220119015325.2438277-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pa3KE12yHs9Xnd2D"
Content-Disposition: inline
In-Reply-To: <20220119015325.2438277-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, - <patches@opensource.cirrus.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pa3KE12yHs9Xnd2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2022 at 07:53:25PM -0600, Rob Herring wrote:
> For a single pinctrl mode, it is not necessary to define pinctrl
> properties as the tools always allow pinctrl properties.

Acked-by: Mark Brown <broonie@kernel.org>

--pa3KE12yHs9Xnd2D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHoPKQACgkQJNaLcl1U
h9CK5ggAgSoOi6gEd+9fFCP6FCxOQatzUUojOHSGhmWyvIDZNwu17IQjUqhzZ5Lk
8Z9Or7iFzVcEVfaKQ0w1HRWHQIrPLjnGtm1pnD26p3iqmdDC/1hDvKb/kd7EjOmF
NEx6LRQoJL0LQX9I/c8rkwoW5mXpxaBck270IlQAaOI5/iOQFHp2oDn02Csbli0e
XtJH3S6dPtjKQN/+SC9ruVF3usw6u4Vxi5FNXA1ABQYeKP+4/lyft2SWzGZEShhy
Kmn6JJCH6fa4Aqbz85d4dpvuG9t9ukvdK8zrRCpsH2xw8AlHDeJtcDG6/LXw5hPG
u+NgtzFSWl0tPBvoyeSNpNi3YEkbyg==
=vG1Q
-----END PGP SIGNATURE-----

--pa3KE12yHs9Xnd2D--
