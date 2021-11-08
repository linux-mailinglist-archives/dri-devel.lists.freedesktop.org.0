Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DBA4499E1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 17:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CC389718;
	Mon,  8 Nov 2021 16:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3995896E5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 16:31:04 +0000 (UTC)
Date: Mon, 08 Nov 2021 16:30:47 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <BVH92R.0VU3IKPQTLX9@crapouillou.net>
In-Reply-To: <D0809E59-DCB5-46CE-BE5E-D2A5D2ECA6F0@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
 <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
 <HQY82R.69JHJIC64HDO1@crapouillou.net>
 <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
 <ZA692R.GHQL6RBCLFB12@crapouillou.net>
 <D0809E59-DCB5-46CE-BE5E-D2A5D2ECA6F0@goldelico.com>
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

Hi,

Le lun., nov. 8 2021 at 16:29:11 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Bnjour Paul,
>=20
>=20
>>  Am 08.11.2021 um 13:20 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi,
>>=20
>>  Le lun., nov. 8 2021 at 11:52:20 +0100, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  Hi Paul,
>>>>>  Am 08.11.2021 um 10:37 schrieb Paul Cercueil=20
>>>>> <paul@crapouillou.net>:
>>>>>  Well, it was atomic: "add jz4780+hdmi functionality" or not. Now=20
>>>>> we separate into "preparation for adding jz4780" and "really=20
>>>>> adding". Yes, you can split atoms into quarks...
>>>>  And that's how it should be done. Lots of small atomic patches=20
>>>> are much easier to review than a few big patches.
>>>  I doubt that in this case especially as it has nothing to do with=20
>>> jz4780...
>>=20
>>  It has nothing to do with JZ4780 and that's exactly why it should=20
>> be a separate patch.
>=20
> Question is why *I* should then make this patch and not someone=20
> else...
>=20
> I am not necessarily a volunteer to contribute to non-jz4780 code=20
> just because I want to upstream jz4780 code.

The JZ4780 patch lies on top of the other one, so they are still=20
related. They just shouldn't be the same patch.

>>=20
>>>  But I have a proposal for a better solution at the end of this=20
>>> mail.
>>>>>>  Note that you can do even better, set the .max_register field=20
>>>>>> according to the memory resource you get from DTS. Have a look=20
>>>>>> at the pinctrl driver which does exactly this.
>>>>>  That is an interesting idea. Although I don't see where
>>>>> =20
>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/pinctr=
l-ingenic.c#L4171
>>>>>  does make use of the memory resource from DTS. It just reads two=20
>>>>> values from the ingenic_chip_info instead of one I do read from=20
>>>>> soc_info.
>>>>  It overrides the .max_register from a static regmap_config=20
>>>> instance.
>>>  To be precise: it overrides .max_register of a copy of a static=20
>>> regmap_config instance (which has .max_register =3D 0).
>>>>  You can do the same,
>>>  We already do the same...
>>>>  calculating the .max_register from the memory resource you get=20
>>>> from DT.
>>>  I can't see any code in pinctrl-ingenic.c getting the memory=20
>>> resource that from DT. It calculates it from the ingenic_chip_info=20
>>> tables inside the driver code but not DT.
>>>>  I'm sure you guys can figure it out.
>>>  Ah, we have to figure out. You are not sure yourself how to do it?=20
>>> And it is *not* exactly like the pinctrl driver (already) does?=20
>>> Please give precise directions in reviews and not vague research=20
>>> homework. Our time is also valuable. Sorry if I review your=20
>>> reviews...
>>>  Anyways I think you roughly intend (untested):
>>>  	struct resource *r;
>>>  	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>  	regmap_config.max_register =3D r.end - r.start;
>>=20
>>  Replace the "devm_platform_ioremap_resource" with=20
>> "devm_platform_get_and_ioremap_resource" to get a pointer to the=20
>> resource.
>>=20
>>  Then the .max_register should be (r.end - r.start - 4) I think.
>>=20
>>  And lose the aggressivity. It's not going to get you anywhere,=20
>> especially since I'm the one who decides whether or not I should=20
>> merge your patches. You want your code upstream, that's great, but=20
>> it's your responsability to get it to shape so that it's eventually=20
>> accepted.
>=20
> Well on the other side of the fence it is maintainers responsibility=20
> to give clear and understandable rules and guidance about what will=20
> be accepted and to enable us to bring it into the shape he/she has in=20
> mind.
>=20
> But a fundamental problem is: "good shape" is very subjective. What=20
> would you recommend me to do, if I feel that my proposed code is in=20
> better shape than what the maintainer thinks or recommends?
>=20
>>=20
>>>  But I wonder how that could work at all (despite adding code=20
>>> execution time) with:
>>=20
>>  Code execution time? ...
>=20
> I reasoned about doing an additional platform_get_resource() call and=20
> doing a subtraction. This is additional execution time. Maybe not=20
> worth thinking about because it is in the probe function. And using=20
> devm_platform_get_and_ioremap_resource() is of course potentially=20
> better.
>=20
>>=20
>>>  e.g. jz4770.dtsi:
>>>  	lcd: lcd-controller@13050000 {
>>>  		compatible =3D "ingenic,jz4770-lcd";
>>>  		reg =3D <0x13050000 0x300>;
>>>  or jz4725b.dtsi:
>>>  	lcd: lcd-controller@13050000 {
>>>  		compatible =3D "ingenic,jz4725b-lcd";
>>>  		reg =3D <0x13050000 0x1000>;
>>>  So max_register becomes 0x300 or 0x1000 but not
>>>  #define JZ_REG_LCD_SIZE1	0x12c
>>>  	.max_reg =3D JZ_REG_LCD_SIZE1,
>>>  And therefore wastes a lot of regmap memory.
>>=20
>>  "regmap memory"? ...
>=20
> regmap allocates memory for its cache. Usually the total amount=20
> specified in the reg property.

We are not using any register cache here.

>>=20
>>>  Do you want this? DTS should not be reduced (DTS should be kept as=20
>>> stable as possible), since the reg property describes address=20
>>> mapping - not how many bytes are really used by registers or how=20
>>> big a cache should be allocated (cache allocation size requirements=20
>>> are not hardware description).
>>=20
>>  The DTS should list the address and size of the register area. If=20
>> your last register is at address 0x12c and there's nothing above,=20
>> then the size in DTS should be 0x130.
>=20
> If I look into some .dtsi it is sometimes that way but sometimes not.=20
> There seems to be no consistent rule.
>=20
> So does this mean you allow me to modify jz4740.dtsi, jz4770.dtsi and=20
> jz4725b.dtsi as well (as mentioned above: this is beyond the scope of=20
> my project)?

You could update them if you wanted to, but there is no need to do it=20
here.

>>=20
>>>  But here are good news:
>>>  I have a simpler and less invasive proposal. We keep the=20
>>> devm_regmap_init_mmio code as is and just increase its=20
>>> .max_register from JZ_REG_LCD_SIZE1 to JZ_REG_LCD_PCFG when=20
>>> introducing the jz4780. This wastes a handful bytes for all=20
>>> non-jz4780 chips but less than using the DTS memory region size.=20
>>> And is less code (no entry in soc_info tables, no modifyable copy)=20
>>> and faster code execution than all other proposals.
>>>  This is then just a single-line change when introducing the=20
>>> jz4780. And no "preparation for adding jz4780" patch is needed at=20
>>> all. No patch to split out for separate review.
>>>  Let's go this way to get it eventually finalized. Ok?
>>=20
>>  No.
>=20
> Look friend, if you explain your "no" and what is wrong with my=20
> arguments, it helps to understand your decisions and learn something=20
> from them. A plain "no" does not help anyone.

I answered just "no" because I felt like I explained already what I=20
wanted to see in the previous email.

By using a huge number as the .max_register, we do *not* waste=20
additional memory. Computing the value of the .max_register field does=20
not add any overhead, either.

The .max_register is only used for boundary checking. To make sure that=20
you're not calling regmap_write() with an invalid register. That's all=20
there is to it.

> So to summarize: if you prefer something which I consider worse, it=20
> is ok for me... In the end you are right - you are the maintainer,=20
> not me. So you have to live with your proposals.
>=20
> Therefore, I have prepared new variants so you can choose which one=20
> is easier to maintain for you.
>=20
> Note that they are both preparing for full jz4780-lcdc/hdmi support=20
> but in very different ways:
>=20
> Variant 1 already adds some jz4780 stuff while Variant 2 just=20
> prepares for it.
>=20
> Variant 2 is not tested (except to compile). So it needs some=20
> Tested-by: from someone with access to hardware. IMHO it is more=20
> invasive.
>=20
> And don't forget: DTB could be in ROM or be provided by a separate=20
> bootloader... So we should not change it too often (I had such=20
> discussions some years ago with maintainers when I thought it is=20
> easier to change DTS instead of code).
>=20
> Variant 3 would be to not separate this. As proposed in [PATCH v5=20
> 2/7].
> (Finally, a Variant 3b would be to combine the simple change from=20
> Variant 1 with Variant 3).
>=20
> So what is your choice?

Variant 4: the variant #2 without the changes to the DTSI files.

Cheers,
-Paul


> BR and thanks,
> Nikolaus
>=20
>=20
> #### VARIANT 0001 ####
>=20
> From c7afa925f6b53bb6cafa080b7dd582788c8eb2eb Mon Sep 17 00:00:00 2001
> From: "H. Nikolaus Schaller" <hns@goldelico.com>
> Date: Mon, 8 Nov 2021 15:38:21 +0100
> Subject: [PATCH] RFC: drm/ingenic: Add register definitions for=20
> JZ4780 lcdc
>=20
> JZ4780 has additional registers compared to the other
> SoC of the JZ47xx series. So we add the constants for
> registers and bits we make use of (there are even more
> which can be added later).
>=20
> And we increase the regmap max_register accordingly.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm.h     | 39=20
> +++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index a5df1c8d34cde..1903e897d2299 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -122,7 +122,7 @@ static const struct regmap_config=20
> ingenic_drm_regmap_config =3D {
>  	.val_bits =3D 32,
>  	.reg_stride =3D 4,
>=20
> -	.max_register =3D JZ_REG_LCD_SIZE1,
> +	.max_register =3D JZ_REG_LCD_PCFG,
>  	.writeable_reg =3D ingenic_drm_writeable_reg,
>  };
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h=20
> b/drivers/gpu/drm/ingenic/ingenic-drm.h
> index 22654ac1dde1c..e7430c4af41f6 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.h
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
> @@ -44,8 +44,11 @@
>  #define JZ_REG_LCD_XYP1				0x124
>  #define JZ_REG_LCD_SIZE0			0x128
>  #define JZ_REG_LCD_SIZE1			0x12c
> +#define JZ_REG_LCD_PCFG				0x2c0
>=20
>  #define JZ_LCD_CFG_SLCD				BIT(31)
> +#define JZ_LCD_CFG_DESCRIPTOR_8			BIT(28)
> +#define JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN	BIT(25)
>  #define JZ_LCD_CFG_PS_DISABLE			BIT(23)
>  #define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
>  #define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
> @@ -63,6 +66,7 @@
>  #define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
>  #define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
>  #define JZ_LCD_CFG_18_BIT			BIT(7)
> +#define JZ_LCD_CFG_24_BIT			BIT(6)
>  #define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
>=20
>  #define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
> @@ -132,6 +136,7 @@
>  #define JZ_LCD_CMD_SOF_IRQ			BIT(31)
>  #define JZ_LCD_CMD_EOF_IRQ			BIT(30)
>  #define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
> +#define JZ_LCD_CMD_FRM_ENABLE			BIT(26)
>=20
>  #define JZ_LCD_SYNC_MASK			0x3ff
>=20
> @@ -153,6 +158,7 @@
>  #define JZ_LCD_RGBC_EVEN_BGR			(0x5 << 0)
>=20
>  #define JZ_LCD_OSDC_OSDEN			BIT(0)
> +#define JZ_LCD_OSDC_ALPHAEN			BIT(2)
>  #define JZ_LCD_OSDC_F0EN			BIT(3)
>  #define JZ_LCD_OSDC_F1EN			BIT(4)
>=20
> @@ -176,6 +182,39 @@
>  #define JZ_LCD_SIZE01_WIDTH_LSB			0
>  #define JZ_LCD_SIZE01_HEIGHT_LSB		16
>=20
> +#define JZ_LCD_DESSIZE_ALPHA_OFFSET		24
> +#define JZ_LCD_DESSIZE_HEIGHT_MASK		GENMASK(23, 12)
> +#define JZ_LCD_DESSIZE_WIDTH_MASK		GENMASK(11, 0)
> +
> +/* TODO: 4,5 and 7 match the above BPP */
> +#define JZ_LCD_CPOS_BPP_15_16			(4 << 27)
> +#define JZ_LCD_CPOS_BPP_18_24			(5 << 27)
> +#define JZ_LCD_CPOS_BPP_30			(7 << 27)
> +#define JZ_LCD_CPOS_RGB555			BIT(30)
> +#define JZ_LCD_CPOS_PREMULTIPLY_LCD		BIT(26)
> +#define JZ_LCD_CPOS_COEFFICIENT_OFFSET		24
> +#define JZ_LCD_CPOS_COEFFICIENT_0		0
> +#define JZ_LCD_CPOS_COEFFICIENT_1		1
> +#define JZ_LCD_CPOS_COEFFICIENT_ALPHA1		2
> +#define JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1	3
> +
> +#define JZ_LCD_RGBC_RGB_PADDING			BIT(15)
> +#define JZ_LCD_RGBC_RGB_PADDING_FIRST		BIT(14)
> +#define JZ_LCD_RGBC_422				BIT(8)
> +#define JZ_LCD_RGBC_RGB_FORMAT_ENABLE		BIT(7)
> +
> +#define JZ_LCD_PCFG_PRI_MODE			BIT(31)
> +#define JZ_LCD_PCFG_HP_BST_4			(0 << 28)
> +#define JZ_LCD_PCFG_HP_BST_8			(1 << 28)
> +#define JZ_LCD_PCFG_HP_BST_16			(2 << 28)
> +#define JZ_LCD_PCFG_HP_BST_32			(3 << 28)
> +#define JZ_LCD_PCFG_HP_BST_64			(4 << 28)
> +#define JZ_LCD_PCFG_HP_BST_16_CONT		(5 << 28)
> +#define JZ_LCD_PCFG_HP_BST_DISABLE		(7 << 28)
> +#define JZ_LCD_PCFG_THRESHOLD2_OFFSET		18
> +#define JZ_LCD_PCFG_THRESHOLD1_OFFSET		9
> +#define JZ_LCD_PCFG_THRESHOLD0_OFFSET		0
> +
>  struct device;
>  struct drm_plane;
>  struct drm_plane_state;
> --
> 2.33.0
>=20
>=20
> #### VARIANT 0002 ####
>=20
> From c4b5cfa2789493f02da91e385719bc97aefb6c6c Mon Sep 17 00:00:00 2001
> From: "H. Nikolaus Schaller" <hns@goldelico.com>
> Date: Mon, 8 Nov 2021 14:40:58 +0100
> Subject: [PATCH] RFC: drm/ingenic: prepare ingenic drm for later=20
> addition of
>  JZ4780
>=20
> This changes the way the regmap is allocated to prepare for the
> later addition of the JZ4780 which has more registers and bits
> than the others.
>=20
> To make this work we have to change the device tree records of
> all devices so that the reg property is limited to the physically
> available registers.
>=20
> The magic value 0x130 in the device tree is JZ_REG_LCD_SIZE1 + 4.
>=20
> Note that it is not tested since I have no access to the hardware.
>=20
> Suggested-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4725b.dtsi   | 2 +-
>  arch/mips/boot/dts/ingenic/jz4740.dtsi    | 2 +-
>  arch/mips/boot/dts/ingenic/jz4770.dtsi    | 2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 9 ++++++---
>  4 files changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> index a1f0b71c92237..c017b087c0e52 100644
> --- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> @@ -321,7 +321,7 @@ udc: usb@13040000 {
>=20
>  	lcd: lcd-controller@13050000 {
>  		compatible =3D "ingenic,jz4725b-lcd";
> -		reg =3D <0x13050000 0x1000>;
> +		reg =3D <0x13050000 0x130>;
>=20
>  		interrupt-parent =3D <&intc>;
>  		interrupts =3D <31>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index c1afdfdaa8a38..ce3689e5015b5 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -323,7 +323,7 @@ udc: usb@13040000 {
>=20
>  	lcd: lcd-controller@13050000 {
>  		compatible =3D "ingenic,jz4740-lcd";
> -		reg =3D <0x13050000 0x1000>;
> +		reg =3D <0x13050000 0x130>;
>=20
>  		interrupt-parent =3D <&intc>;
>  		interrupts =3D <30>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index 05c00b93088e9..0d1ee58d6c40b 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -399,7 +399,7 @@ gpu: gpu@13040000 {
>=20
>  	lcd: lcd-controller@13050000 {
>  		compatible =3D "ingenic,jz4770-lcd";
> -		reg =3D <0x13050000 0x300>;
> +		reg =3D <0x13050000 0x130>;
>=20
>  		interrupt-parent =3D <&intc>;
>  		interrupts =3D <31>;
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index a5df1c8d34cde..3c8e3c5a447bb 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -122,7 +122,6 @@ static const struct regmap_config=20
> ingenic_drm_regmap_config =3D {
>  	.val_bits =3D 32,
>  	.reg_stride =3D 4,
>=20
> -	.max_register =3D JZ_REG_LCD_SIZE1,
>  	.writeable_reg =3D ingenic_drm_writeable_reg,
>  };
>=20
> @@ -858,6 +857,8 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>  	struct drm_encoder *encoder;
>  	struct drm_device *drm;
>  	void __iomem *base;
> +	struct resource *res;
> +	struct regmap_config regmap_config;
>  	long parent_rate;
>  	unsigned int i, clone_mask =3D 0;
>  	dma_addr_t dma_hwdesc_phys_f0, dma_hwdesc_phys_f1;
> @@ -904,14 +905,16 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>  	drm->mode_config.funcs =3D &ingenic_drm_mode_config_funcs;
>  	drm->mode_config.helper_private =3D &ingenic_drm_mode_config_helpers;
>=20
> -	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(base)) {
>  		dev_err(dev, "Failed to get memory resource\n");
>  		return PTR_ERR(base);
>  	}
>=20
> +	regmap_config =3D ingenic_drm_regmap_config;
> +	regmap_config.max_register =3D res->end - res->start - 4;
>  	priv->map =3D devm_regmap_init_mmio(dev, base,
> -					  &ingenic_drm_regmap_config);
> +					  &regmap_config);
>  	if (IS_ERR(priv->map)) {
>  		dev_err(dev, "Failed to create regmap\n");
>  		return PTR_ERR(priv->map);
> --
> 2.33.0
>=20
>=20


