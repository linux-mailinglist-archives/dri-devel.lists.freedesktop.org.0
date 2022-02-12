Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67FF4B35BF
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 15:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE7A10E228;
	Sat, 12 Feb 2022 14:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698EB10E228
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 14:58:32 +0000 (UTC)
Date: Sat, 12 Feb 2022 14:58:12 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v14 8/9] [already applied to mips-fixes] MIPS: DTS: CI20:
 fix how ddc power is enabled
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <0L577R.CVAM5NCZN3F72@crapouillou.net>
In-Reply-To: <6722afd4a89d2bf0d95e49e6738ff50bf9f26245.1644675567.git.hns@goldelico.com>
References: <cover.1644675566.git.hns@goldelico.com>
 <6722afd4a89d2bf0d95e49e6738ff50bf9f26245.1644675567.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le sam., f=E9vr. 12 2022 at 15:19:26 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Originally we proposed a new hdmi-5v-supply regulator reference
> for CI20 device tree but that was superseded by a better idea to use
> the already defined "ddc-en-gpios" property of the "hdmi-connector".
>=20
> Since "MIPS: DTS: CI20: Add DT nodes for HDMI setup" has already
> been applied to v5.17-rc1, we add this on top.
>=20
> Fixes: ae1b8d2c2de9 ("MIPS: DTS: CI20: Add DT nodes for HDMI setup")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Since it's already applied you don't have to send this patch anymore.

Cheers,
-Paul

> ---
>  arch/mips/boot/dts/ingenic/ci20.dts | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts=20
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index 3e336b3dbb109..ab6e3dc0bc1d0 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -83,6 +83,8 @@ hdmi_out: connector {
>  		label =3D "HDMI OUT";
>  		type =3D "a";
>=20
> +		ddc-en-gpios =3D <&gpa 25 GPIO_ACTIVE_HIGH>;
> +
>  		port {
>  			hdmi_con: endpoint {
>  				remote-endpoint =3D <&dw_hdmi_out>;
> @@ -114,17 +116,6 @@ otg_power: fixedregulator@2 {
>  		gpio =3D <&gpf 14 GPIO_ACTIVE_LOW>;
>  		enable-active-high;
>  	};
> -
> -	hdmi_power: fixedregulator@3 {
> -		compatible =3D "regulator-fixed";
> -
> -		regulator-name =3D "hdmi_power";
> -		regulator-min-microvolt =3D <5000000>;
> -		regulator-max-microvolt =3D <5000000>;
> -
> -		gpio =3D <&gpa 25 0>;
> -		enable-active-high;
> -	};
>  };
>=20
>  &ext {
> @@ -576,8 +567,6 @@ &hdmi {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pins_hdmi_ddc>;
>=20
> -	hdmi-5v-supply =3D <&hdmi_power>;
> -
>  	ports {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> --
> 2.33.0
>=20


