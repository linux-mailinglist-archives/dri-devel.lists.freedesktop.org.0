Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0596545C9BF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430FC6E20F;
	Wed, 24 Nov 2021 16:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573DB6E20F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637770750;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=eM7VdsFTT2Al6uH7jEIMJgSHl1hTYDbctjEV/JmG41Q=;
 b=hzN9YKNysXORTCdGyeNzgfFJwPpYa5I9MBv1Bf1LpTFJIIGZZttBS7AgJOnkpwOsYs
 aJsjA7XJapd6OOhGqsI8O2NNZJGIGHmQaawEXm+y0hYaoyQVz5HvCD5qpSuytfwT/Qt4
 It3C4yZUFIm2vmJosBzV8MOvt/0T++dejtbFEdp+77PxzeSf1vbrxby1BbvbFzRE3XZ9
 NaRgVYsdThcCQIxapW1jgxOPrT4vYSr3oFsDnKYNS7Vx+ENmVcImr4L7GQvspu9h9fHR
 Fk6gf3IwAGf5P5bQD1yVbhiIwPvG0wGJ/TSaWzW1saS1KyZbF6fP0rM+/zdrsuz3/qfG
 kf2g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jsN+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
 with ESMTPSA id e05ed8xAOGJ93kU
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 24 Nov 2021 17:19:09 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 6/8] MIPS: DTS: CI20: Add DT nodes for HDMI setup
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <O0K13R.TIL3JBQ5L8TO1@crapouillou.net>
Date: Wed, 24 Nov 2021 17:19:09 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <04F0ED7C-3D18-4CCF-8F10-E0A36B0E4F4B@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
 <O0K13R.TIL3JBQ5L8TO1@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Am 23.11.2021 um 21:10 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le mar., nov. 23 2021 at 19:13:59 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> From: Paul Boddie <paul@boddie.org.uk>
>> We need to hook up
>> * HDMI connector
>> * HDMI power regulator
>> * JZ4780_CLK_HDMI @ 27 MHz
>> * DDC pinmux
>> * HDMI and LCDC endpoint connections
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> arch/mips/boot/dts/ingenic/ci20.dts | 83 =
+++++++++++++++++++++++++++--
>> 1 file changed, 80 insertions(+), 3 deletions(-)
>> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts =
b/arch/mips/boot/dts/ingenic/ci20.dts
>> index b249a4f0f6b62..15cf03670693f 100644
>> --- a/arch/mips/boot/dts/ingenic/ci20.dts
>> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>> @@ -78,6 +78,18 @@ eth0_power: fixedregulator@0 {
>> 		enable-active-high;
>> 	};
>> +	hdmi_out: connector {
>> +		compatible =3D "hdmi-connector";
>> +		label =3D "HDMI OUT";
>> +		type =3D "a";
>> +
>> +		port {
>> +			hdmi_con: endpoint {
>> +				remote-endpoint =3D <&dw_hdmi_out>;
>> +			};
>> +		};
>> +	};
>> +
>> 	ir: ir {
>> 		compatible =3D "gpio-ir-receiver";
>> 		gpios =3D <&gpe 3 GPIO_ACTIVE_LOW>;
>> @@ -102,6 +114,17 @@ otg_power: fixedregulator@2 {
>> 		gpio =3D <&gpf 14 GPIO_ACTIVE_LOW>;
>> 		enable-active-high;
>> 	};
>> +
>> +	hdmi_power: fixedregulator@3 {
>> +		compatible =3D "regulator-fixed";
>> +
>> +		regulator-name =3D "hdmi_power";
>> +		regulator-min-microvolt =3D <5000000>;
>> +		regulator-max-microvolt =3D <5000000>;
>> +
>> +		gpio =3D <&gpa 25 0>;
>> +		enable-active-high;
>> +	};
>> };
>> &ext {
>> @@ -114,11 +137,13 @@ &cgu {
>> 	 * precision.
>> 	 */
>> 	assigned-clocks =3D <&cgu JZ4780_CLK_OTGPHY>, <&cgu =
JZ4780_CLK_RTC>,
>> -			  <&cgu JZ4780_CLK_SSIPLL>, <&cgu =
JZ4780_CLK_SSI>;
>> +			  <&cgu JZ4780_CLK_SSIPLL>, <&cgu =
JZ4780_CLK_SSI>,
>> +			  <&cgu JZ4780_CLK_HDMI>;
>> 	assigned-clock-parents =3D <0>, <&cgu JZ4780_CLK_RTCLK>,
>> 				 <&cgu JZ4780_CLK_MPLL>,
>> -				 <&cgu JZ4780_CLK_SSIPLL>;
>> -	assigned-clock-rates =3D <48000000>, <0>, <54000000>;
>> +				 <&cgu JZ4780_CLK_SSIPLL>,
>> +				 <0>;
>=20
> Nit - you can remove the last <0>, it will be the default.

Well, it might make life easier for the next addition but I've removed =
it.

>=20
>> +	assigned-clock-rates =3D <48000000>, <0>, <54000000>, <0>, =
<27000000>;
>> };
>> &tcu {
>> @@ -509,6 +534,19 @@ pins_i2c4: i2c4 {
>> 		bias-disable;
>> 	};
>> +	pins_hdmi_ddc: hdmi_ddc {
>> +		function =3D "hdmi-ddc";
>> +		groups =3D "hdmi-ddc";
>> +		bias-disable;
>> +	};
>> +
>> +	/* switch to PF25 as gpio driving DDC_SDA low */
>> +	pins_hdmi_ddc_unwedge: hdmi_ddc {
>> +		function =3D "hdmi-ddc";
>> +		groups =3D "hdmi-ddc";
>> +		bias-disable;
>> +	};
>=20
> Your pins_hdmi_ddc and pins_hdmi_ddc_unwedge are the exact same? You =
could just use the former and pass it to both pinctrl-0 and pinctrl-1.

This was forgotten to remove. We do not make use of the unwedge feature =
because I could not find out how to use pinctrl to switch this to gpio25 =
and drive it low.
And I always had a revert for this in my test tree and we haven't seen a =
stuck DDC so far. Therefore I remove it (and leave it as maybe-to-to in =
my tree).

>=20
> Cheers,
> -Paul
>=20
>> +
>> 	pins_nemc: nemc {
>> 		function =3D "nemc";
>> 		groups =3D "nemc-data", "nemc-cle-ale", "nemc-rd-we", =
"nemc-frd-fwe";
>> @@ -539,3 +577,42 @@ pins_mmc1: mmc1 {
>> 		bias-disable;
>> 	};
>> };
>> +
>> +&hdmi {
>> +	status =3D "okay";
>> +
>> +	pinctrl-names =3D "default", "unwedge";
>> +	pinctrl-0 =3D <&pins_hdmi_ddc>;
>> +	pinctrl-1 =3D <&pins_hdmi_ddc_unwedge>;
>> +
>> +	hdmi-5v-supply =3D <&hdmi_power>;
>> +
>> +	ports {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		port@0 {
>> +			reg =3D <0>;
>> +			dw_hdmi_in: endpoint {
>> +				remote-endpoint =3D <&lcd_out>;
>> +			};
>> +		};
>> +
>> +		port@1 {
>> +			reg =3D <1>;
>> +			dw_hdmi_out: endpoint {
>> +				remote-endpoint =3D <&hdmi_con>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&lcdc0 {
>> +	status =3D "okay";
>> +
>> +	port {
>> +		lcd_out: endpoint {
>> +			remote-endpoint =3D <&dw_hdmi_in>;
>> +		};
>> +	};
>> +};
>> --
>> 2.33.0

