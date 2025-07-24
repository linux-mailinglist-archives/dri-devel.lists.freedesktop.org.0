Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F2B107F4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 12:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4983610E925;
	Thu, 24 Jul 2025 10:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=public-files.de header.i=frank-w@public-files.de header.b="n3gB+ccw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 402 seconds by postgrey-1.36 at gabe;
 Thu, 24 Jul 2025 10:42:26 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0DD10E061
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 10:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
 s=s31663417; t=1753353743; x=1753958543; i=frank-w@public-files.de;
 bh=qwlcmLAbRr/MQRSxhxjFBqTr2CYUizJoPcZmxNDBDks=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
 References:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=n3gB+ccwcpRviisqrT2H0zEzpMvyPoYRP2lG+c7M8OrUxZI1DLlu80hQGdsRoiaE
 Y2/5V/TUhyW291Rl/lu/kN4X5QbC/+6WogmC/9H7SoaSEmZjc1pE6gF9WIdtJDgXE
 eANGs0YJ70B7XY/R3FescTVF5hWKRS12hXjIpcubgwh4GaT/e8xlbcMPQNVkX0ghE
 q9hDu03gols+s1LtMaHUg4jH4Qd0H/2v3LUdeLDcA6rzMB64D008nLIJh4FrMRH8b
 If5XcO5+AAXodU+UIESHZJmrG0uiYzcT28/9rx4GHBtQVE7uW/+2aTXXuevtcKg11
 74SJcVynU9WVUJB1FQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.69.140]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzhnN-1uSBvr1TE1-00qu8U; Thu, 24
 Jul 2025 12:35:42 +0200
Date: Thu, 24 Jul 2025 12:35:32 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
CC: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com,
 ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org,
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com,
 mwalle@kernel.org, fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_27/38=5D_arm64=3A_dts=3A_mediatek=3A_m?=
 =?US-ASCII?Q?t7988a=3A_Fix_PCI-Express_T-PHY_node_address?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250724083914.61351-28-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-28-angelogioacchino.delregno@collabora.com>
Message-ID: <E00D9C7A-CEC6-4BB3-8568-CC54C80E1F9F@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nkz0xBWOn6njT18nQoUfw6V1GVlL8WpIemZpMHLlbE8QqNvMruQ
 Dw1Pn/9vrDC5T+QE1uC+gQrBvCbuCBubKZuNY/QtmAr8uYJpemV1UWgy1GRhjhzujMe4Sno
 OFT//bgrHPOQkyWfSsQl5jIAop0RmK2bQYCM8GBsuQbZ18A3HnORU53wBCWooCm/gqkZStX
 r26BYjnhKxDQSZciDLXoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mgZ48VJGxb8=;775ZXHy//kHKJjvD24peUpDrSJI
 d6kmETVuRhJK1VtF7Qrc0a+4coXYaxMF04YAaVouUofGQZQSHuxn4MgljH5mjOF2vTI+/fcK+
 SZmWrpVzRQfOHoMI+7BztBj8BIck5eJegQQSGRjZoZMaRre7ji9F9IIKkaNnkcNgpiILkUkKD
 YdeXjSLYyF8D9+KgHGJy61EMAOBO46E9JLnGyEN12hcxfQZaXWIP8lul7I/uRpsXwABayXQyf
 kN9cvxFjgwvEK1BlkVgN9qiksnI0TTlp1lHMf5jiHyFjCIrE3v1+N/0RB3BAcreJrDldPUDoz
 RNnJEM/OvQthqKwrHXxgibSTRgvY0lUkjpUQ9QDAWymD/ZGG+ClerERcH02NCe2plQSfodZA5
 V7RyziAZjRLxksBFvtjGik+OzSmf/p8Kfu306U/WRUhlV6QhWhfRHTodW34BpMeJ1pwWHWfI1
 yFgi/DR4cFl7KZT8BsCaIFPQad6Iv+xvGtz1l/PcaElnfUDnk88hymxtcKj/7+t1Qm7DrbGMt
 CqemTUS87oG0tmF6h6nhcOFt4gqV2oyRs1rZ8PVOqvQOGMrVpYcC09N3VafHuYb444m5uKE16
 usm7hkMJvSU6dCetlh9EYLzRhABXk0FZwkK+BFDqdp88pG+Z5A9h0Gr82N/1ov8zwnDzxBRYl
 J7LTgmfXFomBa8H1LLbsuQ4AKdKTJnYJi+SZqxzjY54F6V69TkRJjiLHKX6EycpB8qj3hwpTA
 g8+PVahcVym/KtWH43ZUGc22v0V3+S2U/MEyKrmtaAWLdGiUV8/omNLY2/s2tdaOBvwI2qaZz
 es7WmcbcqX+3FceLBkMp0TQubNogLIgwAGYMSaiLCapqFhS+ubofAo1AYbofxOlD1Qbm6/TAO
 /28zuRP6h2HllmzilKJCNRwuidJc3wTZ9QVeNxEI2mEbKw6Y+nPO0V6norx2O4Yn4UBGs0cG9
 fs+SvNzwepEctuSa+hlZAvIQvw2Mb5v3v1GT9612HcDVDIil8mIoK/dHSRhA7TyaLZ6Ksgun2
 BCYVuShNUmoYM5yT9M0ixqQFXAWsUaeDtVMandSboJSsPKX2tynoMbxA5kk8Ii8uvBSI8Qk4b
 uaV31+FVxy90uvJULieKQMoBHCAkiQ5JzGthQcYEGzS0IgVTckRJcmjBMSIlkHPPZCXy1MWfl
 zJCt8e7ygcqyxypYBafQuyrp2Zq29FsnERk31P8ieo6NHNDnp7londQGYC8UgzT+mh2225HxU
 1EKJnJ2pOludUAqsm0VLa8NyK7niZ7M7XEg/83vgYI0CBRl79ID/jnYGXXreRoprsW4Jip7NN
 R6h3hBaVO7bXUJo29jRGYEQ80bTYqSHzl8y72fU6KmoC6hKbujwkwePJ3ZBuYZuUyMh2ZpkW7
 K3Mta/GIjzIqxTqtTBDagoLpghchxWEa8FhxJ7LsG06HKMMhc66ewFBc3fnX9DUGFWHlLhs14
 HUe1M8kz39397ljbCrGADlQlHy4ax61HleeSS5xST+aoRpObCsDw2zpDUDEKYDax4csFuxlbe
 lEfYJu6hvthIZoWIuJAKt1GXzKqj34Zs91llGYk2HcH8XqAxBFJjhEG9JFD82bGlhZtO7FcVg
 pvVNsYNEWAUjl6FdSGhfPluFvM6Zv9yXXwCrlAiED/5llY+ESlOtN1d6OViZ8FUZIAQX0kJRu
 KBmYz2iFHw8o8Xso6S9/G6rukrdyVM+F+qfH16rwNARGxLcQBV/l31pp10IN6yfVH5W+wIwLF
 blYglzbDqPe08UAFWlZkQ0Ss88r/YGmk8xmhAmmse5P/tiOWUCW9bteuAvFxjhwtCeOJtChma
 iebgslM2xDmcEhZZpM9m/NOE22kw9mg3fbosT9Wp1crKyuxGfqfKi+rg2+k3bS+stqSzuP+sj
 0rV/PJKhBMjdPSGJcP1BYWx/wolL9jVkEoParduJpxJWyHzhbWxoLpzeLeylmJNBlVaDEpArp
 MszFADmPFsrDDz8ucc3j9v1iq/Nahyub2YgCmVhYLwTJYAG4maW9UQrXJUcYxK8wEmF3UdJ4s
 Ho3ONs6oujB+I+NNg+AHMa5yFzfTs3NnPoXtZwAOUER5PhPV1E18qepHslOJ8fACG0KdLSFxq
 90Auek72znGG8sWrdbE5I5siHywzMz8aCVQJrs/h7/4jRHlE5Pg4ucOaHISh00yhJg1z+20KQ
 BYDRRX+OL2XO1z+z4ZVhFQ5Y7DrJQ+PfXZGaKHoKUupCp0Wd58NnSBwLQ+S6DN5h90jLKMD8X
 NQwsnBFo8PclJT6GSQa6hx4/FIDb9sMCRR8v04f8OyvbDYXiYBwsfa6MTWnOxT+NHh62oodgE
 eOYIsgvGAptT1x9/k3dsD+opLmQNZ7epGmCdFmhFYyqQZAXOl8TrmPuHTZUPOYbdLodCHwOKG
 j45DsgsVgbfh5ASKybaiXIk2cOqMS6e1qyy+0f3PX7Q9dnjqwJGIIZrw3RxHKjDIkL/RWZ/Kb
 B4L4EpuKd8Rq7OUSTtrEq8fPbFEQ0tYPctnq87h8qLVt7zmdccJdoTS4WL3G288YeAFif3Fj8
 RY/jOMzufHo2G4O2G8+f0PDsIa3Fnkd/vjS124u21XJGI3CfF1WsroT239798UwOBmHVkixkU
 AK2x+u8nCcEQ/VBGNMsEm2VPCkvzIAp4YUj19HOkVgsyQJqvqT7rnTmzDciwmtGtSjCDD+e6Q
 tqGJiTbOgve5qm6E6s4IT49LnF4dllfwZLVLRJ9MqMIXtBLCW7B2g0tZXJhH6zoVUmAhuVWCg
 9cOSi+QZicp59wDcWSvGq+tFQ7MTF33M5SGNzYx0Ja1U5iD5bWVKEzEu1lfVXwayg+nZcZRre
 hmT3ynIycnq/pXExqyt2P2pTYAXDbtolQPL7IlJG3ubZ80liywFvDOlwowso0oGY78mEtvBi1
 oZqUGF0Ki67RkHJOMYu1nZc8PX2ftg8SZREsDgvLzD9wVXhekQqVQxvRVH3OWfjqNZrbuByQm
 KLMBUlGNjgx+xM1PfK11MkY8C0Q9vArNsOPz30AP8/C9Cd5HYgLB2bXBui9KPi4+tjLDnqvE2
 oZNjrpcvp4HX52czVOGaz2C7Q7/m1JXvKM433QcFmlkG3VDJt4kESwj8OT5shr3VbpXvWYYnd
 Dc0GQqJem1t+xkAeBvGM2Y8vsZYtw3hExc5QPlPnJt6PFIb+gm1Txq0LHjOKqijIaJ+DeHsFC
 9I1orWBahqFWexAK1MeCYiEAEIFaRqqWtyWz9ChRPkIBfSCxQcvRB/UgLr7tYrR60cpFN/4n9
 X/EGRMmN4jFxNS6iwDxtEVNekHL5vEntBeNRb7ra5sfZ7YxQL5frU46lTX2Lsh9Ew178Fb2gI
 N9zYQ5sYvKGt7qCiY3d32ttN5TAtYAaIHYVQHcOnWa7mORQhRYLj8144PCsS2YRLzmwsHRIBF
 uLEjRtxnw8opkywHhS3HeRO0wlNKf5byx2buLVPxsdEZArBx8DqqEbU8GGN8t6BePbd0PJMle
 30CId24ZbnYxlfxe3yiuGEL/0bFRU7gB7oBLTVd9KymPK0r3vmAnDVPv7e4aqcYXfklob2mV7
 x4U0vSEF5KsY1OteKGVxJYI4aK3WT2MGDhPwtlGteQZfXJwitnnH0YM72Syr9xf+Bg==
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
Reply-To: frank-w@public-files.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24=2E Juli 2025 10:39:03 MESZ schrieb AngeloGioacchino Del Regno <angelo=
gioacchino=2Edelregno@collabora=2Ecom>:
>The PCIe and USB TPHYs are under the soc bus, which provides MMIO,
>and all nodes under that must use the bus, otherwise those would
>clearly be out of place=2E
>
>Add ranges to both the tphy(s) and assign the address to the main
>node to silence a dtbs_check warning, and fix the children to
>use the MMIO range of t-phy=2E
>
>Fixes: ("f693e6ba55ae arm64: dts: mediatek: mt7988: Add t-phy for ssusb1"=
)
>Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino=2Edelregno@co=
llabora=2Ecom>
>---
> arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi | 28 +++++++++++------------
> 1 file changed, 14 insertions(+), 14 deletions(-)
>
>diff --git a/arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi b/arch/arm64/boo=
t/dts/mediatek/mt7988a=2Edtsi
>index 560ec86dbec0=2E=2Ecc0d3e3f4374 100644
>--- a/arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi
>+++ b/arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi
>@@ -629,20 +629,20 @@ pcie_intc1: interrupt-controller {
> 		tphy: t-phy@11c50000 {
> 			compatible =3D "mediatek,mt7986-tphy",
> 				     "mediatek,generic-tphy-v2";
>-			#address-cells =3D <2>;
>-			#size-cells =3D <2>;
>-			ranges;
>+			#address-cells =3D <1>;
>+			#size-cells =3D <1>;
>+			ranges =3D <0 0 0x11c50000 0x1000>;
> 			status =3D "disabled";
>=20
>-			tphyu2port0: usb-phy@11c50000 {
>-				reg =3D <0 0x11c50000 0 0x700>;
>+			tphyu2port0: usb-phy@0 {
>+				reg =3D <0 0x700>;
> 				clocks =3D <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
> 				clock-names =3D "ref";
> 				#phy-cells =3D <1>;
> 			};
>=20
>-			tphyu3port0: usb-phy@11c50700 {
>-				reg =3D <0 0x11c50700 0 0x900>;
>+			tphyu3port0: usb-phy@700 {
>+				reg =3D <0 0x700 0 0x900>;

This one looks wrong to me

I guess it should be=20

reg =3D <0x700 0x900>;

> 				clocks =3D <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
> 				clock-names =3D "ref";
> 				#phy-cells =3D <1>;
>@@ -659,20 +659,20 @@ topmisc: system-controller@11d10084 {
> 		xsphy: xs-phy@11e10000 {
> 			compatible =3D "mediatek,mt7988-xsphy",
> 				     "mediatek,xsphy";
>-			#address-cells =3D <2>;
>-			#size-cells =3D <2>;
>-			ranges;
>+			#address-cells =3D <1>;
>+			#size-cells =3D <1>;
>+			ranges =3D <0 0 0x11e10000 0x3900>;
> 			status =3D "disabled";
>=20
>-			xphyu2port0: usb-phy@11e10000 {
>-				reg =3D <0 0x11e10000 0 0x400>;
>+			xphyu2port0: usb-phy@0 {
>+				reg =3D <0 0x400>;
> 				clocks =3D <&infracfg CLK_INFRA_USB_UTMI>;
> 				clock-names =3D "ref";
> 				#phy-cells =3D <1>;
> 			};
>=20
>-			xphyu3port0: usb-phy@11e13000 {
>-				reg =3D <0 0x11e13400 0 0x500>;
>+			xphyu3port0: usb-phy@3400 {
>+				reg =3D <0x3400 0x500>;
> 				clocks =3D <&infracfg CLK_INFRA_USB_PIPE>;
> 				clock-names =3D "ref";
> 				#phy-cells =3D <1>;

Hi Angelo,

thanks for taking case of many of current binding errors (only wondering a=
bout this one as i had checked it before sending upstream)=2E
regards Frank
