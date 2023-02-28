Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 356486A61F5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 22:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BCD10E0D1;
	Tue, 28 Feb 2023 21:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAC610E0D1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 21:58:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33EEC611F4;
 Tue, 28 Feb 2023 21:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB95C4339B;
 Tue, 28 Feb 2023 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677621538;
 bh=EApezt/xrKSUqcwtPB/lYFfV3ScYq2GN1UtJeJ9Yc+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cUYRfMKeK+p4AXiL2yRjGGOTvS01vXKugWnhKFkzYTZRH2viq9VagyHHpn9RYO06E
 7161gTVDpaIwYbqDcrlmVPN0o/cugLq/+gDN1auuBxF/uZPh9OpMPhpNLHF+53h7/f
 DoT1TtdWlebJgWhfw4OQoDjoiCvi0XiuNGbnLek0xsWC1Yu/OVJnYFJLHZprcXRPiC
 7v5WbvF/tLxYWQO6MfSWwUmY8KP3GIJ8Wrz1RAHaWryhlvgwMlV6ERJb7McemY4aKl
 vDe/gg3FPRtgYCN2VZVVoHhp+1BFL8FRLCFU2j+s5qzK8bnhmFkzpbIMlP6wDedOvJ
 P7W07HuSh0APg==
Date: Tue, 28 Feb 2023 21:58:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix SPI and I2C bus node names in examples
Message-ID: <Y/55H2lZZf7a3Xbu@sirena.org.uk>
References: <20230228215433.3944508-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MyLQObbLmZa89Gv8"
Content-Disposition: inline
In-Reply-To: <20230228215433.3944508-1-robh@kernel.org>
X-Cookie: Single tasking: Just Say No.
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
Cc: alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--MyLQObbLmZa89Gv8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 28, 2023 at 03:54:33PM -0600, Rob Herring wrote:
> SPI and I2C bus node names are expected to be "spi" or "i2c",
> respectively, with nothing else, a unit-address, or a '-N' index. A
> pattern of 'spi0' or 'i2c0' or similar has crept in. Fix all these
> cases. Mostly scripted with the following commands:

Acked-by: Mark Brown <broonie@kernel.org>

--MyLQObbLmZa89Gv8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP+eR4ACgkQJNaLcl1U
h9DqWQf/fzAqwVcR5vEvDlZIOyeJ93q74mz/Rl0dA1kXgtn8VCrgOTQv1BlYjrCE
YSIOVaCA5NiKGfDp99bOWw61eY5vrMwgY1dL8JB2fdMVGhAnk4dN0ewMN2lc2Zxs
/aZeYDxjeMRJOEv+9UinuEKROblNzSwDJFxyTFoOddlrYg7leB2icMBQRsd3m5+h
Thr8sNClvv0OyNBx5LchcIvla+hu2AAQSAvLHe/Q0aUCOGooYIUsdfDeNqNJa6vF
7wjeN3etYc7wp/PyeJKwrO9AhmkCXzazy4OwW4esqLUxQEO88PTJxkHJjNW+tvu3
lFl5XDtQUMJ9ACGlaRM0sEP28dPf5w==
=8se/
-----END PGP SIGNATURE-----

--MyLQObbLmZa89Gv8--
