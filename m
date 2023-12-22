Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C254C81CD65
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 17:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2BC10E7DA;
	Fri, 22 Dec 2023 16:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 583 seconds by postgrey-1.36 at gabe;
 Fri, 22 Dec 2023 16:59:32 UTC
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6451210E7C3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 16:59:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1703263785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ErvDQcJbtNazTvA7ofzMhh10seib29pmsETLyke7Hfw=;
 b=Ua+1kP0ovBMWSseoDN2nCgNB6Xg5KSPml2pLS0rxSOZ+TzRhKdlhDS0DT6ABauzZsa8wyL
 klV9HRZbQlts2+LWIVIMmy/HfXY1IO+qfINb/FzpjFlEP1BIDPJVvNprzyBRy30CGXVzlM
 n9piVAn0te1I5QfLciGL84utA9Qc3uwfHyGysCASnI7BAe5kBllMdJiowqHImjDHZ4Ozzr
 t6nnazNjF8TvexAI8PRTvsrrcJEpjOLLJ9l5th8Rsv6neNM4gEm7eX77cKr/3kMyrHtgr+
 bC+d/yNutAxY9TzkF6xvVqDBKe0EW5W2hm0GaT8vFM8+waAPObIEDLTFQzwNLA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>,
 Manuel Traut <manut@mecka.net>, Danct12 <danct12@disroot.org>
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: Add devicetree for Pine64
 Pinetab2
Date: Fri, 22 Dec 2023 17:49:35 +0100
Message-ID: <2250271.fI8GBZLEnK@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231222-pinetab2-v1-4-e148a7f61bd1@mecka.net>
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
 <20231222-pinetab2-v1-4-e148a7f61bd1@mecka.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1735942.3G8mRxy5iN";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT
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
Cc: devicetree@vger.kernel.org, Manuel Traut <manut@mecka.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart1735942.3G8mRxy5iN
Content-Type: multipart/mixed; boundary="nextPart2189696.cEvZYOimPK";
 protected-headers="v1"
Content-Transfer-Encoding: 7Bit
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
Date: Fri, 22 Dec 2023 17:49:35 +0100
Message-ID: <2250271.fI8GBZLEnK@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231222-pinetab2-v1-4-e148a7f61bd1@mecka.net>
MIME-Version: 1.0

This is a multi-part message in MIME format.

--nextPart2189696.cEvZYOimPK
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 22 December 2023 12:05:44 CET Manuel Traut wrote:
> +       rk817-sound {
> +               compatible = "simple-audio-card";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&hp_det_l>;
> +               simple-audio-card,format = "i2s";
> +               simple-audio-card,name = "PineTab2";
> +               simple-audio-card,mclk-fs = <256>;
> +
> +               simple-audio-card,widgets =
> +                       "Microphone", "Mic Jack",
> +                       "Headphone", "Headphones",
> +                       "Microphone", "Microphone",
> +                       "Speaker", "Speakers";
> +
> +               simple-audio-card,routing =
> +                       "MICL", "Microphone",
> +                       "MICR", "Mic Jack",
> +                       "Headphones", "HPOL",
> +                       "Headphones", "HPOR",
> +                       "Speaker Amplifier INL", "HPOL",
> +                       "Speaker Amplifier INR", "HPOR",
> +                       "Speakers", "Speaker Amplifier OUTL",
> +                       "Speakers", "Speaker Amplifier OUTR";
> +
> +               simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6
> GPIO_ACTIVE_HIGH>; +               simple-audio-card,aux-devs =
> <&speaker_amp>;
> +               simple-audio-card,pin-switches = "Speakers", "Microphone";
> +
> +               simple-audio-card,cpu {
> +                       sound-dai = <&i2s1_8ch>;
> +               };
> +
> +               simple-audio-card,codec {
> +                       sound-dai = <&rk817>;
> +               };
> +       };

Not sure if it's right (or allowed) to post a different patch as attachment, 
but I have been using a different audio configuration (see attachment).
I haven't yet tried if/how it works via HDMI yet, but the speakers and 
headphones work fine.
This patch is based on the following commit:
https://github.com/TuxThePenguin0/linux/commit/
872b829a3511cfa853bd3af3bd4f30be1cb3d1ab

I've added 'Danct12' to the To list as they are the maintainer of the primary 
PT2 image and we worked together to get to this audio config.
I don't if they still use it.
(I've been using my own kernel/image for a while now).

Cheers,
  Diederik
--nextPart2189696.cEvZYOimPK
Content-Disposition: attachment;
 filename="0003-arm64-dts-rk3566-pinetab2-Fix-audio-configuration.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="x-UTF_8J";
 name="0003-arm64-dts-rk3566-pinetab2-Fix-audio-configuration.patch"

From 17efeb0ae766886345ff0574c534079742539b56 Mon Sep 17 00:00:00 2001
From: Scott Santucci <ScottFreeCode@users.noreply.github.com>
Date: Mon, 17 Jul 2023 13:06:20 +0200
Subject: [PATCH 3/8] arm64: dts: rk3566-pinetab2: Fix audio configuration

The audio configuration of the PineTab2 matches the `rk817_ext` alsa
ucm2 profile, so switch the configuration to that. Use `rk817_ext` and
not `rk817_int` as the PineTab2 uses an external amplifier.

Also the headphones plugged/unplugged detection is backwards, so apply
the fix provided by Danct12 <danct12@disroot.org>.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
Link: https://github.com/dreemurrs-embedded/Pine64-Arch/pull/555
---
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
index a766f21bd6f8..59e4bf2f77c7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
@@ -116,14 +116,14 @@ rk817-sound {
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_det_l>;
 		simple-audio-card,format = "i2s";
-		simple-audio-card,name = "PineTab2";
+		simple-audio-card,name = "rk817_ext";
 		simple-audio-card,mclk-fs = <256>;
 
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
 			"Headphone", "Headphones",
 			"Microphone", "Microphone",
-			"Speaker", "Speakers";
+			"Speaker", "Internal Speakers";
 
 		simple-audio-card,routing =
 			"MICL", "Microphone",
@@ -132,12 +132,12 @@ rk817-sound {
 			"Headphones", "HPOR",
 			"Speaker Amplifier INL", "HPOL",
 			"Speaker Amplifier INR", "HPOR",
-			"Speakers", "Speaker Amplifier OUTL",
-			"Speakers", "Speaker Amplifier OUTR";
+			"Internal Speakers", "Speaker Amplifier OUTL",
+			"Internal Speakers", "Speaker Amplifier OUTR";
 
-		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
 		simple-audio-card,aux-devs = <&speaker_amp>;
-		simple-audio-card,pin-switches = "Speakers", "Microphone";
+		simple-audio-card,pin-switches = "Internal Speakers", "Microphone";
 
 		simple-audio-card,cpu {
 			sound-dai = <&i2s1_8ch>;
-- 
2.42.0


--nextPart2189696.cEvZYOimPK--

--nextPart1735942.3G8mRxy5iN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZYW+HwAKCRDXblvOeH7b
bk8YAP9l/Ynyc1NgUzHaJH+8pqpPvbqfRat1qp4Tm/CX1vZjiQEAi+d8vAIDfJs2
ytBGxf56fdtLqnUcH11NRRCnHeSFMA0=
=znXm
-----END PGP SIGNATURE-----

--nextPart1735942.3G8mRxy5iN--



