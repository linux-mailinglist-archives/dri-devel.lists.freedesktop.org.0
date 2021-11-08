Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D5C447CF0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 10:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFC16EB38;
	Mon,  8 Nov 2021 09:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625C86EB34
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 09:37:45 +0000 (UTC)
Date: Mon, 08 Nov 2021 09:37:29 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <HQY82R.69JHJIC64HDO1@crapouillou.net>
In-Reply-To: <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
 <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
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
 linux-mips <linux-mips@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
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

Hi Nikolaus,

Le dim., nov. 7 2021 at 21:25:38 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 07.11.2021 um 20:01 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>  Le dim., nov. 7 2021 at 14:41:18 +0100, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  Hi Paul,
>>>  sorry for the delay in getting back to this, but I was distracted=20
>>> by more urgent topics.
>>>>  Am 05.10.2021 um 22:22 schrieb Paul Cercueil=20
>>>> <paul@crapouillou.net>:
>>>>  Hi Nikolaus,
>>>>  Le mar., oct. 5 2021 at 14:29:14 +0200, H. Nikolaus Schaller=20
>>>> <hns@goldelico.com> a =E9crit :
>>>>>  From: Paul Boddie <paul@boddie.org.uk>
>>>>>  Add support for the LCD controller present on JZ4780 SoCs.
>>>>>  This SoC uses 8-byte descriptors which extend the current
>>>>>  4-byte descriptors used for other Ingenic SoCs.
>>>>>  Tested on MIPS Creator CI20 board.
>>>>>  Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>>>>>  Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>>  ---
>>>>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 85=20
>>>>> +++++++++++++++++++++--
>>>>>  drivers/gpu/drm/ingenic/ingenic-drm.h     | 42 +++++++++++
>>>>>  2 files changed, 122 insertions(+), 5 deletions(-)
>>>>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>>>>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>>  index f73522bdacaa..e2df4b085905 100644
>>>>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>>  @@ -6,6 +6,7 @@
>>>>>  			case DRM_FORMAT_XRGB8888:
>>>>>  +				hwdesc->cpos |=3D JZ_LCD_CPOS_BPP_18_24;
>>>>>  +				break;
>>>>>  +			}
>>>>>  +			hwdesc->cpos |=3D JZ_LCD_CPOS_PREMULTIPLY_LCD |
>>>>>  +					    (JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1 <<
>>>>>  +					     JZ_LCD_CPOS_COEFFICIENT_OFFSET);
>>>>  Knowing that OSD mode doesn't really work with this patch, I=20
>>>> doubt you need to configure per-plane alpha blending.
>>>  Well, we can not omit setting some CPOS_COEFFICIENT different from=20
>>> 0.
>>>  This would mean to multiply all values with 0, i.e. gives a black=20
>>> screen.
>>>  So at least we have to apply JZ_LCD_CPOS_COEFFICIENT_1.
>>>  JZ_LCD_CPOS_PREMULTIPLY_LCD is not relevant in the non-alpha case.
>>=20
>>  hwdesc->cpos =3D JZ_LCD_CPOS_COEFFICIENT_1 <<=20
>> JZ_LCD_CPOS_COEFFICIENT_OFFSET;
>=20
> Exactly what I wrote and did test.
>=20
>>=20
>>  That's enough to get an image.
>=20
> Fine that we can agree on that.
>=20
>>=20
>>>  But then, why not do it right from the beginning?
>>=20
>>  Because there's no way to test alpha blending without getting the=20
>> overlay plane to work first.
>>=20
>>>>  	}
>>>>  +	regmap_config =3D ingenic_drm_regmap_config;
>>>>  +	regmap_config.max_register =3D soc_info->max_reg;
>>>>  	priv->map =3D devm_regmap_init_mmio(dev, base,
>>>>  -					  &ingenic_drm_regmap_config);
>>>>  +					  &regmap_config);
>>>>  I remember saying to split this change into its own patch :)
>>>  Yes, I remember as well, but it does not make sense to me.
>>>  A first patch would introduce regmap_config. This needs=20
>>> soc_info->max_reg
>>>  to be defined as a struct component.
>>>  This requires all soc_info to be updated for all SoC (w/o=20
>>> jz4780_soc_info
>>>  in this first patch because it has not been added yet) to a=20
>>> constant (!)
>>>  JZ_REG_LCD_SIZE1.
>>>  And the second patch would then add jz4780_soc_info and set its=20
>>> max_reg to
>>>  a different value.
>>=20
>>  Correct, that's how it should be.
>=20
> Well, if you prefer separating things that are deeply related into=20
> two commits...
>=20
>>=20
>>  Note that you can do even better, set the .max_register field=20
>> according to the memory resource you get from DTS. Have a look at=20
>> the pinctrl driver which does exactly this.
>=20
> That is an interesting idea. Although I don't see where
>=20
> https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/pinctrl-in=
genic.c#L4171
>=20
> does make use of the memory resource from DTS. It just reads two=20
> values from the ingenic_chip_info instead of one I do read from=20
> soc_info.

It overrides the .max_register from a static regmap_config instance.=20
You can do the same, calculating the .max_register from the memory=20
resource you get from DT. I'm sure you guys can figure it out.

> If you see it I'd prefer to leave this patch to you (as it is not=20
> jz4780 related except that jz4780 needs it to be in place) and then I=20
> can simply make use of it for adding jz4780+hdmi.
>=20
>>=20
>>>  IMHO, such a separate first patch has no benefit independent from=20
>>> adding
>>>  jz4780 support, as far as I can see.
>>>  If your fear issues with bisectability:
>>>  - code has been tested
>>>  - if this fails, bisect will still point to this patch, where it=20
>>> is easy to locate
>>=20
>>  It's not about bisectability. One functional change per patch, and=20
>> patches should be as atomic as possible.
>=20
> Well, it was atomic: "add jz4780+hdmi functionality" or not. Now we=20
> separate into "preparation for adding jz4780" and "really adding".=20
> Yes, you can split atoms into quarks...

And that's how it should be done. Lots of small atomic patches are much=20
easier to review than a few big patches.

> BTW: without adding jz4780_soc_info there is not even a functional=20
> change. Just the constant is made dependent on the .compatible entry.=20
> And since it is initialized to the same constant value in all cases,=20
> it is still a constant. A very very clever compiler could find out=20
> that regmap_config.max_register =3D soc_info->max_reg is a NOOP and=20
> produce the same code as before by avoiding the copy operation of=20
> regmap_config =3D ingenic_drm_regmap_config.
>=20
>>=20
>>>  So I leave it in v6 unsplitted.
>>>>>  	if (IS_ERR(priv->map)) {
>>>>>  		dev_err(dev, "Failed to create regmap\n");
>>>>>  		return PTR_ERR(priv->map);
>>>>>  @@ -1274,7 +1319,7 @@ static int ingenic_drm_bind(struct device=20
>>>>> *dev, bool has_components)
>>>>>  	/* Enable OSD if available */
>>>>>  	if (soc_info->has_osd)
>>>>>  -		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
>>>>>  +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC,=20
>>>>> JZ_LCD_OSDC_OSDEN);
>>>>  This change is unrelated to this patch, and I'm not even sure=20
>>>> it's a valid change. The driver shouldn't rely on previous=20
>>>> register values.
>>>  I think I already commented that I think the driver should also=20
>>> not reset
>>>  previous register values to zero.
>>=20
>>  You did comment this, yes, but I don't agree. The driver *should*=20
>> reset the registers to zero. It should *not* have to rely on=20
>> whatever was configured before.
>>=20
>>  Even if I did agree, this is a functional change unrelated to=20
>> JZ4780 support, so it would have to be splitted to its own patch.
>=20
> Well it is in preparation of setting more bits that are only=20
> available for the jz4780.
>=20
> But it will be splitted into its own patch for other reasons - if we=20
> ever make osd working...
>=20
>>=20
>>>  If I counted correctly this register has 18 bits which seem to=20
>>> include
>>>  some interrupt masks (which could be initialized somewhere else)=20
>>> and we
>>>  write a constant 0x1.
>>>  Of course most other bits are clearly OSD related (alpha blending),
>>>  i.e. they can have any value (incl. 0) if OSD is disabled. But=20
>>> here we
>>>  enable it. I think there may be missing some setting for the other=20
>>> bits.
>>>  So are you sure, that we can unconditionally reset *all* bits
>>>  except JZ_LCD_OSDC_OSDEN for the jz4780?
>>>  Well I have no experience with OSD being enabled at all. I.e. I=20
>>> have no
>>>  test scenario.
>>>  So we can leave it out in v6.
>=20
> So we agree as here well.
>=20
>>>>>=20
>>>>>  +	}
>>>>  As I said in your v4... You don't need to add this here. The=20
>>>> ingenic-dw-hdmi.c should take care of registering its driver.
>>>  Well, I can not identify any difference in code structure to the=20
>>> IPU code.
>>>  The Makefile (after our patch) looks like:
>>>  obj-$(CONFIG_DRM_INGENIC) +=3D ingenic-drm.o
>>>  ingenic-drm-y =3D ingenic-drm-drv.o
>>>  ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) +=3D ingenic-ipu.o
>>>  ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) +=3D ingenic-dw-hdmi.o
>>>  which means that ingenic-dw-hdmi.o is also compiled into=20
>>> ingenic-drm,
>>>  like ingenic-drm-drv.o and ingenic-ipu.o - if CONFIGured. If not,=20
>>> there
>>>  are these IS_ENABLED() tests to guard against compiler errors.
>>>  Is there any technical reason to request a driver structure and=20
>>> registration
>>>  different from IPU here?
>>=20
>>  There is no reason to have ingenic-dw-hdmi built into the=20
>> ingenic-drm module. It should be a separate module.
>>=20
>>>  Why not having ingenic-ipu.c taking care of registering its driver=20
>>> as well?
>>=20
>>  IIRC ingenic-ipu.c was built into the ingenic-drm at the beginning=20
>> because of circular dependencies between the IPU and main DRM=20
>> driver. I think ingenic-ipu.c could be its own module now. That's=20
>> something I will test soon.
>=20
> Ok, that was the piece of information I was missing. I always thought=20
> that the way IPU is integrated is the best one and there is some=20
> special requirement. And it shows how we should do it.
>=20
> So I'll wait until I see your proposal for IPU.

Don't need to wait for me - just create a standard platform_driver=20
module for the HDMI code. Since it won't touch the ingenic-drm-drv.c=20
file, if I later patch the IPU code to be its own module, it won't=20
conflict.

Cheers,
-Paul

>>=20
>>>  As soon as this is clarified, I can post a v6.
>>>  Hm. I am not familiar with how ingenic_drm_crtc_atomic_check()
>>>  would be notified about planes. Which configuration parameters
>>>  should be checked for?
>>=20
>>  You know that the &ingenic_drm->f0 plane cannot be used (right=20
>> now), so in ingenic_drm_plane_atomic_check() just:
>>=20
>>  if (plane =3D=3D &priv->f0 && crtc)
>>    return -EINVAL;
>=20
> Ok, that is simple to add. Prepared for v6.
>=20
> So v6 is to be postponed by the patch for setting up=20
> regmap_config.max_register and the separation of the IPU driver so=20
> that it does not interfere.
>=20
> BR and thanks for all comments,
> Nikolaus
>=20


