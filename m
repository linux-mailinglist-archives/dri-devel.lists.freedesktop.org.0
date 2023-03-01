Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB79D6A75DD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 22:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603AA10E252;
	Wed,  1 Mar 2023 21:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B39010E252
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 21:09:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C204B8111A;
 Wed,  1 Mar 2023 21:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074E4C433EF;
 Wed,  1 Mar 2023 21:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677704944;
 bh=rCPgKyY8pL4WsWbwal7/GnROcvnC0cplhyx7czzuBrI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=XPtEoCOK0uCzDk5+9/F+HsvDisG6x30coh35MtKooxhGCdVLAujsC16RjuFJNeJSs
 j7ciysEU7AIVDGDF0mVl0eCUtDQPZdCGf/LDWZa7s46dd2DQYHGUjBbGf6Ck8HIGfp
 QaPDKylGnfmK/uLRTK7f5kJ4WEuHlXrjDJUcqkdMIUgs9xlO4K/9BBusrKlAGzSaFK
 9bZOKQsXERsjEMkdZTHcBw9PEuUsfTHkY5vQ4UEhdVKlT6sTmtmkWE2uREh5ZQ3l4U
 XeMOJhBFHPbU3QD2rS1Om+3BJzD9KFZ3Tb2gxhY/s7cVeRc2dMWj7kw3wy45x80er/
 Aj12X7L3l1l0A==
Message-ID: <5d53f8abdaa50b19ac60c198252c5a5e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230228215433.3944508-1-robh@kernel.org>
References: <20230228215433.3944508-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix SPI and I2C bus node names in examples
From: Stephen Boyd <sboyd@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh@kernel.org>
Date: Wed, 01 Mar 2023 13:09:01 -0800
User-Agent: alot/0.10
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
	Andrzej Hajda <andrzej.hajda@intel.com>,
	dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
	Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Guenter Roeck <groeck@chromium.org>,
	Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
	linux-leds@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>, linux-can@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger,
	kernel.org@freedesktop.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Herring (2023-02-28 13:54:33)
> SPI and I2C bus node names are expected to be "spi" or "i2c",
> respectively, with nothing else, a unit-address, or a '-N' index. A
> pattern of 'spi0' or 'i2c0' or similar has crept in. Fix all these
> cases. Mostly scripted with the following commands:
>=20
> git grep -l '\si2c[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's=
/i2c[0-9] {/i2c {/'
> git grep -l '\sspi[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's=
/spi[0-9] {/spi {/'
>=20
> With this, a few errors in examples were exposed and fixed.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

> diff --git a/Documentation/devicetree/bindings/clock/ti,lmk04832.yaml b/D=
ocumentation/devicetree/bindings/clock/ti,lmk04832.yaml
> index 73d17830f165..13d7b3d03d84 100644
> --- a/Documentation/devicetree/bindings/clock/ti,lmk04832.yaml
> +++ b/Documentation/devicetree/bindings/clock/ti,lmk04832.yaml
> @@ -160,7 +160,7 @@ examples:
>          };
>      };
> =20
> -    spi0 {
> +    spi {
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
>
