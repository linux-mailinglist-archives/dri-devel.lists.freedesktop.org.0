Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D81449833
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 16:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1416E069;
	Mon,  8 Nov 2021 15:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431E16E062
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636385353;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=LxX27PUvW8zYXPaE43DBQpHp1EyxZfxkjrNYY5sVZfE=;
 b=ciw1jur2+PZqhEuv2ZrXrl9l9WVd8SkblHR9M/ZcLpiSzLvYknT6F8JMBt2QuudAPS
 Q2WQRpwSYJSIATA7g8o90lLhUFN65mlHodR1ltqJMCpD3+AzDvCAXWXe610AShf1Kq8h
 R0XrjVIEBIcpZbShGE13MYAWIOnCb90Cl+Cd6qYKga7KvbVngmyIJfm9Td9aby4hZZE3
 RrWcUZextRZlL2V5pgSMGzvuOt6BUqDYFijr38Z+zgfmEcSS0n0MiYW0K0pQbD+umHJH
 axikKq0iCwY4YuadvQvbAVlQgbkq+oaUE110atvfo7Wk69/AylXs6NagnXl3L065Teuq
 KFxg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3gMZ+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
 with ESMTPSA id 902c63xA8FTCLHS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 8 Nov 2021 16:29:12 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ZA692R.GHQL6RBCLFB12@crapouillou.net>
Date: Mon, 8 Nov 2021 16:29:11 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0809E59-DCB5-46CE-BE5E-D2A5D2ECA6F0@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
 <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
 <HQY82R.69JHJIC64HDO1@crapouillou.net>
 <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
 <ZA692R.GHQL6RBCLFB12@crapouillou.net>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bnjour Paul,


> Am 08.11.2021 um 13:20 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi,
>=20
> Le lun., nov. 8 2021 at 11:52:20 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>>>> Am 08.11.2021 um 10:37 schrieb Paul Cercueil =
<paul@crapouillou.net>:
>>>> Well, it was atomic: "add jz4780+hdmi functionality" or not. Now we =
separate into "preparation for adding jz4780" and "really adding". Yes, =
you can split atoms into quarks...
>>> And that's how it should be done. Lots of small atomic patches are =
much easier to review than a few big patches.
>> I doubt that in this case especially as it has nothing to do with =
jz4780...
>=20
> It has nothing to do with JZ4780 and that's exactly why it should be a =
separate patch.

Question is why *I* should then make this patch and not someone else...

I am not necessarily a volunteer to contribute to non-jz4780 code just =
because I want to upstream jz4780 code.

>=20
>> But I have a proposal for a better solution at the end of this mail.
>>>>> Note that you can do even better, set the .max_register field =
according to the memory resource you get from DTS. Have a look at the =
pinctrl driver which does exactly this.
>>>> That is an interesting idea. Although I don't see where
>>>> =
https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/pinctrl-ing=
enic.c#L4171
>>>> does make use of the memory resource from DTS. It just reads two =
values from the ingenic_chip_info instead of one I do read from =
soc_info.
>>> It overrides the .max_register from a static regmap_config instance.
>> To be precise: it overrides .max_register of a copy of a static =
regmap_config instance (which has .max_register =3D 0).
>>> You can do the same,
>> We already do the same...
>>> calculating the .max_register from the memory resource you get from =
DT.
>> I can't see any code in pinctrl-ingenic.c getting the memory resource =
that from DT. It calculates it from the ingenic_chip_info tables inside =
the driver code but not DT.
>>> I'm sure you guys can figure it out.
>> Ah, we have to figure out. You are not sure yourself how to do it? =
And it is *not* exactly like the pinctrl driver (already) does? Please =
give precise directions in reviews and not vague research homework. Our =
time is also valuable. Sorry if I review your reviews...
>> Anyways I think you roughly intend (untested):
>> 	struct resource *r;
>> 	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> 	regmap_config.max_register =3D r.end - r.start;
>=20
> Replace the "devm_platform_ioremap_resource" with =
"devm_platform_get_and_ioremap_resource" to get a pointer to the =
resource.
>=20
> Then the .max_register should be (r.end - r.start - 4) I think.
>=20
> And lose the aggressivity. It's not going to get you anywhere, =
especially since I'm the one who decides whether or not I should merge =
your patches. You want your code upstream, that's great, but it's your =
responsability to get it to shape so that it's eventually accepted.

Well on the other side of the fence it is maintainers responsibility to =
give clear and understandable rules and guidance about what will be =
accepted and to enable us to bring it into the shape he/she has in mind.

But a fundamental problem is: "good shape" is very subjective. What =
would you recommend me to do, if I feel that my proposed code is in =
better shape than what the maintainer thinks or recommends?

>=20
>> But I wonder how that could work at all (despite adding code =
execution time) with:
>=20
> Code execution time? ...

I reasoned about doing an additional platform_get_resource() call and =
doing a subtraction. This is additional execution time. Maybe not worth =
thinking about because it is in the probe function. And using =
devm_platform_get_and_ioremap_resource() is of course potentially =
better.

>=20
>> e.g. jz4770.dtsi:
>> 	lcd: lcd-controller@13050000 {
>> 		compatible =3D "ingenic,jz4770-lcd";
>> 		reg =3D <0x13050000 0x300>;
>> or jz4725b.dtsi:
>> 	lcd: lcd-controller@13050000 {
>> 		compatible =3D "ingenic,jz4725b-lcd";
>> 		reg =3D <0x13050000 0x1000>;
>> So max_register becomes 0x300 or 0x1000 but not
>> #define JZ_REG_LCD_SIZE1	0x12c
>> 	.max_reg =3D JZ_REG_LCD_SIZE1,
>> And therefore wastes a lot of regmap memory.
>=20
> "regmap memory"? ...

regmap allocates memory for its cache. Usually the total amount =
specified in the reg property.

>=20
>> Do you want this? DTS should not be reduced (DTS should be kept as =
stable as possible), since the reg property describes address mapping - =
not how many bytes are really used by registers or how big a cache =
should be allocated (cache allocation size requirements are not hardware =
description).
>=20
> The DTS should list the address and size of the register area. If your =
last register is at address 0x12c and there's nothing above, then the =
size in DTS should be 0x130.

If I look into some .dtsi it is sometimes that way but sometimes not. =
There seems to be no consistent rule.

So does this mean you allow me to modify jz4740.dtsi, jz4770.dtsi and =
jz4725b.dtsi as well (as mentioned above: this is beyond the scope of my =
project)?

>=20
>> But here are good news:
>> I have a simpler and less invasive proposal. We keep the =
devm_regmap_init_mmio code as is and just increase its .max_register =
from JZ_REG_LCD_SIZE1 to JZ_REG_LCD_PCFG when introducing the jz4780. =
This wastes a handful bytes for all non-jz4780 chips but less than using =
the DTS memory region size. And is less code (no entry in soc_info =
tables, no modifyable copy) and faster code execution than all other =
proposals.
>> This is then just a single-line change when introducing the jz4780. =
And no "preparation for adding jz4780" patch is needed at all. No patch =
to split out for separate review.
>> Let's go this way to get it eventually finalized. Ok?
>=20
> No.

Look friend, if you explain your "no" and what is wrong with my =
arguments, it helps to understand your decisions and learn something =
from them. A plain "no" does not help anyone.

So to summarize: if you prefer something which I consider worse, it is =
ok for me... In the end you are right - you are the maintainer, not me. =
So you have to live with your proposals.

Therefore, I have prepared new variants so you can choose which one is =
easier to maintain for you.

Note that they are both preparing for full jz4780-lcdc/hdmi support but =
in very different ways:

Variant 1 already adds some jz4780 stuff while Variant 2 just prepares =
for it.

Variant 2 is not tested (except to compile). So it needs some Tested-by: =
from someone with access to hardware. IMHO it is more invasive.

And don't forget: DTB could be in ROM or be provided by a separate =
bootloader... So we should not change it too often (I had such =
discussions some years ago with maintainers when I thought it is easier =
to change DTS instead of code).

Variant 3 would be to not separate this. As proposed in [PATCH v5 2/7].
(Finally, a Variant 3b would be to combine the simple change from =
Variant 1 with Variant 3).

So what is your choice?

BR and thanks,
Nikolaus


#### VARIANT 0001 ####

=46rom c7afa925f6b53bb6cafa080b7dd582788c8eb2eb Mon Sep 17 00:00:00 2001
From: "H. Nikolaus Schaller" <hns@goldelico.com>
Date: Mon, 8 Nov 2021 15:38:21 +0100
Subject: [PATCH] RFC: drm/ingenic: Add register definitions for JZ4780 =
lcdc

JZ4780 has additional registers compared to the other
SoC of the JZ47xx series. So we add the constants for
registers and bits we make use of (there are even more
which can be added later).

And we increase the regmap max_register accordingly.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm.h     | 39 +++++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =
b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index a5df1c8d34cde..1903e897d2299 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -122,7 +122,7 @@ static const struct regmap_config =
ingenic_drm_regmap_config =3D {
 	.val_bits =3D 32,
 	.reg_stride =3D 4,
=20
-	.max_register =3D JZ_REG_LCD_SIZE1,
+	.max_register =3D JZ_REG_LCD_PCFG,
 	.writeable_reg =3D ingenic_drm_writeable_reg,
 };
=20
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h =
b/drivers/gpu/drm/ingenic/ingenic-drm.h
index 22654ac1dde1c..e7430c4af41f6 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.h
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
@@ -44,8 +44,11 @@
 #define JZ_REG_LCD_XYP1				0x124
 #define JZ_REG_LCD_SIZE0			0x128
 #define JZ_REG_LCD_SIZE1			0x12c
+#define JZ_REG_LCD_PCFG				0x2c0
=20
 #define JZ_LCD_CFG_SLCD				BIT(31)
+#define JZ_LCD_CFG_DESCRIPTOR_8			BIT(28)
+#define JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN	BIT(25)
 #define JZ_LCD_CFG_PS_DISABLE			BIT(23)
 #define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
 #define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
@@ -63,6 +66,7 @@
 #define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
 #define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
 #define JZ_LCD_CFG_18_BIT			BIT(7)
+#define JZ_LCD_CFG_24_BIT			BIT(6)
 #define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
=20
 #define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
@@ -132,6 +136,7 @@
 #define JZ_LCD_CMD_SOF_IRQ			BIT(31)
 #define JZ_LCD_CMD_EOF_IRQ			BIT(30)
 #define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
+#define JZ_LCD_CMD_FRM_ENABLE			BIT(26)
=20
 #define JZ_LCD_SYNC_MASK			0x3ff
=20
@@ -153,6 +158,7 @@
 #define JZ_LCD_RGBC_EVEN_BGR			(0x5 << 0)
=20
 #define JZ_LCD_OSDC_OSDEN			BIT(0)
+#define JZ_LCD_OSDC_ALPHAEN			BIT(2)
 #define JZ_LCD_OSDC_F0EN			BIT(3)
 #define JZ_LCD_OSDC_F1EN			BIT(4)
=20
@@ -176,6 +182,39 @@
 #define JZ_LCD_SIZE01_WIDTH_LSB			0
 #define JZ_LCD_SIZE01_HEIGHT_LSB		16
=20
+#define JZ_LCD_DESSIZE_ALPHA_OFFSET		24
+#define JZ_LCD_DESSIZE_HEIGHT_MASK		GENMASK(23, 12)
+#define JZ_LCD_DESSIZE_WIDTH_MASK		GENMASK(11, 0)
+
+/* TODO: 4,5 and 7 match the above BPP */
+#define JZ_LCD_CPOS_BPP_15_16			(4 << 27)
+#define JZ_LCD_CPOS_BPP_18_24			(5 << 27)
+#define JZ_LCD_CPOS_BPP_30			(7 << 27)
+#define JZ_LCD_CPOS_RGB555			BIT(30)
+#define JZ_LCD_CPOS_PREMULTIPLY_LCD		BIT(26)
+#define JZ_LCD_CPOS_COEFFICIENT_OFFSET		24
+#define JZ_LCD_CPOS_COEFFICIENT_0		0
+#define JZ_LCD_CPOS_COEFFICIENT_1		1
+#define JZ_LCD_CPOS_COEFFICIENT_ALPHA1		2
+#define JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1	3
+
+#define JZ_LCD_RGBC_RGB_PADDING			BIT(15)
+#define JZ_LCD_RGBC_RGB_PADDING_FIRST		BIT(14)
+#define JZ_LCD_RGBC_422				BIT(8)
+#define JZ_LCD_RGBC_RGB_FORMAT_ENABLE		BIT(7)
+
+#define JZ_LCD_PCFG_PRI_MODE			BIT(31)
+#define JZ_LCD_PCFG_HP_BST_4			(0 << 28)
+#define JZ_LCD_PCFG_HP_BST_8			(1 << 28)
+#define JZ_LCD_PCFG_HP_BST_16			(2 << 28)
+#define JZ_LCD_PCFG_HP_BST_32			(3 << 28)
+#define JZ_LCD_PCFG_HP_BST_64			(4 << 28)
+#define JZ_LCD_PCFG_HP_BST_16_CONT		(5 << 28)
+#define JZ_LCD_PCFG_HP_BST_DISABLE		(7 << 28)
+#define JZ_LCD_PCFG_THRESHOLD2_OFFSET		18
+#define JZ_LCD_PCFG_THRESHOLD1_OFFSET		9
+#define JZ_LCD_PCFG_THRESHOLD0_OFFSET		0
+
 struct device;
 struct drm_plane;
 struct drm_plane_state;
--=20
2.33.0


#### VARIANT 0002 ####

=46rom c4b5cfa2789493f02da91e385719bc97aefb6c6c Mon Sep 17 00:00:00 2001
From: "H. Nikolaus Schaller" <hns@goldelico.com>
Date: Mon, 8 Nov 2021 14:40:58 +0100
Subject: [PATCH] RFC: drm/ingenic: prepare ingenic drm for later =
addition of
 JZ4780

This changes the way the regmap is allocated to prepare for the
later addition of the JZ4780 which has more registers and bits
than the others.

To make this work we have to change the device tree records of
all devices so that the reg property is limited to the physically
available registers.

The magic value 0x130 in the device tree is JZ_REG_LCD_SIZE1 + 4.

Note that it is not tested since I have no access to the hardware.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4725b.dtsi   | 2 +-
 arch/mips/boot/dts/ingenic/jz4740.dtsi    | 2 +-
 arch/mips/boot/dts/ingenic/jz4770.dtsi    | 2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 9 ++++++---
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi =
b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
index a1f0b71c92237..c017b087c0e52 100644
--- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
@@ -321,7 +321,7 @@ udc: usb@13040000 {
=20
 	lcd: lcd-controller@13050000 {
 		compatible =3D "ingenic,jz4725b-lcd";
-		reg =3D <0x13050000 0x1000>;
+		reg =3D <0x13050000 0x130>;
=20
 		interrupt-parent =3D <&intc>;
 		interrupts =3D <31>;
diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi =
b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index c1afdfdaa8a38..ce3689e5015b5 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -323,7 +323,7 @@ udc: usb@13040000 {
=20
 	lcd: lcd-controller@13050000 {
 		compatible =3D "ingenic,jz4740-lcd";
-		reg =3D <0x13050000 0x1000>;
+		reg =3D <0x13050000 0x130>;
=20
 		interrupt-parent =3D <&intc>;
 		interrupts =3D <30>;
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi =
b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index 05c00b93088e9..0d1ee58d6c40b 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -399,7 +399,7 @@ gpu: gpu@13040000 {
=20
 	lcd: lcd-controller@13050000 {
 		compatible =3D "ingenic,jz4770-lcd";
-		reg =3D <0x13050000 0x300>;
+		reg =3D <0x13050000 0x130>;
=20
 		interrupt-parent =3D <&intc>;
 		interrupts =3D <31>;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =
b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index a5df1c8d34cde..3c8e3c5a447bb 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -122,7 +122,6 @@ static const struct regmap_config =
ingenic_drm_regmap_config =3D {
 	.val_bits =3D 32,
 	.reg_stride =3D 4,
=20
-	.max_register =3D JZ_REG_LCD_SIZE1,
 	.writeable_reg =3D ingenic_drm_writeable_reg,
 };
=20
@@ -858,6 +857,8 @@ static int ingenic_drm_bind(struct device *dev, bool =
has_components)
 	struct drm_encoder *encoder;
 	struct drm_device *drm;
 	void __iomem *base;
+	struct resource *res;
+	struct regmap_config regmap_config;
 	long parent_rate;
 	unsigned int i, clone_mask =3D 0;
 	dma_addr_t dma_hwdesc_phys_f0, dma_hwdesc_phys_f1;
@@ -904,14 +905,16 @@ static int ingenic_drm_bind(struct device *dev, =
bool has_components)
 	drm->mode_config.funcs =3D &ingenic_drm_mode_config_funcs;
 	drm->mode_config.helper_private =3D =
&ingenic_drm_mode_config_helpers;
=20
-	base =3D devm_platform_ioremap_resource(pdev, 0);
+	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base)) {
 		dev_err(dev, "Failed to get memory resource\n");
 		return PTR_ERR(base);
 	}
=20
+	regmap_config =3D ingenic_drm_regmap_config;
+	regmap_config.max_register =3D res->end - res->start - 4;
 	priv->map =3D devm_regmap_init_mmio(dev, base,
-					  &ingenic_drm_regmap_config);
+					  &regmap_config);
 	if (IS_ERR(priv->map)) {
 		dev_err(dev, "Failed to create regmap\n");
 		return PTR_ERR(priv->map);
--=20
2.33.0


