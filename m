Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA74B48EC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BF810E4B0;
	Mon, 14 Feb 2022 10:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D97510E4BC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:10:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id ABB5D580332;
 Mon, 14 Feb 2022 05:10:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 14 Feb 2022 05:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=EnwwaeNb5+LND6+6WXD288NdXE12D61i7kfAe0
 ieFqE=; b=CzE9rL1nAtOyYF3pwQDSQtVXJVXemJJIVUCBS+zUJ5XsNMUgAISIFz
 Cl6TC3ydR5Bnz0eRqKYQOl+wY3Z0L8+WLlMRZo6aSjbPu9sTfpUqZxoTAnUsmuM9
 VaPNe3Ecvrk04upczpsfSNzNxNiCY4BH6i+/uVBZTS9p4Kj7fz8ugVCkL1mMJPKM
 QsK+0CoP1WfqOMx1r8moR0D1KeY/8apfOKkhXChdH7xu1d6qh/YIYsVcAkEyk8a0
 TrZ/m1IgM1DVfPk/gh1wpJnZTy7VKoLHKFc7x5paHXAF/Iq10wNZe7nYyNvmXTlS
 7ZFcbOlmpQMMplPbpB8ERUNX4TWmxsfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EnwwaeNb5+LND6+6W
 XD288NdXE12D61i7kfAe0ieFqE=; b=EIaY9RDXdVZ7gbETjM4POhQxZQ3tbhFc9
 gqV4vGONT+GXNkMCHtsFndOt0qDEZgcKYpO8FFHZRqKN3vBdhPcDjmBikAC757bc
 HUaF/2Xdc0W8o6+ZZDwRiFutmbpDQeKyEnCH8sWgWf5dIlNxBunk7YUyQlJQUlj6
 /GWsZASAiRoSrgtpvc7iv2gQxRaNqYUPM24lDLx9D9wr8+EWrS9RRV27eBCwlBky
 AXQ67TZtXbFRUyYPx03bO1wM13n8FHMl57CjN8nXXWVzWTiYO0/u3SalB6w1DD5a
 sjoH2yELynJauf7lDxQsdaP4gEb7btWU/F53SouOwW2r97XqfAnyA==
X-ME-Sender: <xms:mSoKYsf2M0QNBOmG6Y7cCb5y2wtp1UOJ384EjRvi8mTVLe6Ynyv4VQ>
 <xme:mSoKYuP4QBNvEL-8xRhP8iRF7Hai3ngfL6Mzp_bMiQ3vJtC1w_fNapz-bBrRxd17U
 U2vPAg3vdXirZlGtaw>
X-ME-Received: <xmr:mSoKYthC6tTF4o-NimBCgq--W5t_heZZRxKVmkZZhQNQg_Y9SmEQ5ZMyBWFVt53CaS4mVWmWhl9DNZMP9hyu4fxU7yFJ2_GvbOHNEDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedvgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mSoKYh_yz1MNjdRlQdmWta6qmVeq3aZNtEYMP9sH_OUKrI-ImaBicQ>
 <xmx:mSoKYou16dW7_9G3CBD4w6LmQx70LIVbkgLTbAAdgIm-W2iJiXqrqg>
 <xmx:mSoKYoHKp3RvZTW2mPIxR6o9UOwKzYJR6hQJuuQWR9FOlHbYmsPEUQ>
 <xmx:mioKYo3zxUWhUvQ6BSQWDR0RJwQPH9BXQ0bj1oYLvbf-KCtD4Dxvkw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 05:10:32 -0500 (EST)
Date: Mon, 14 Feb 2022 11:10:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v7 1/7] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220214101031.kerresldiuopil6l@houat>
References: <20220213141649.1115987-1-15330273260@189.cn>
 <20220213141649.1115987-2-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="22dgeudp6wphcltc"
Content-Disposition: inline
In-Reply-To: <20220213141649.1115987-2-15330273260@189.cn>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Li Yi <liyi@loongson.cn>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--22dgeudp6wphcltc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 13, 2022 at 10:16:43PM +0800, Sui Jingfeng wrote:
> From: suijingfeng <suijingfeng@loongson.cn>
>=20
> There is a display controller in loongson's LS2K1000 SoC and LS7A1000
> bridge chip, the DC is a PCI device in those chips. It has two display
> pipes but with only one hardware cursor. Each way has a DVO interface
> which provide RGB888 signals, vertical & horizontal synchronisations,
> data enable and the pixel clock. Each CRTC is able to scanout from
> 1920x1080 resolution at 60Hz. The maxmium resolution is 2048x2048
> according to the hardware spec.
>=20
> Loongson display controllers are simple which require scanout buffers
> to be physically contiguous. LS2K1000 is a SOC, Only system memory is
> available. Therefore CMA helper based driver is intended to be use,
> although it is possible to use VRAM helper based solution by carving
> out part of system memory as VRAM.
>=20
> On LS7A1000/LS7A2000 bridge chip, the DC is equipped with a dedicated
> video memory which is typically 64MB or more. In this case, VRAM helper
> based solution which scanout from local VRAM is reconmended to use.
> It is reliable to use for massive production, but CMA based helper
> solution is still usable on ls7a1000 and ls7a2000, at the price of
> the CRTC must access the FB in RAM through the PCIe bus and HT3.0 bus.
> This causes continuous traffic on the bus regardless of whether the FB
> image is updating or not. Sadly, it suffer from screen flickering under
> RAM pressure on LS7A1000. Luckily, It show extremely good condition on
> LS7A2000 even under stressapptest, Maybe the hardware engineer resolve
> this issue. Integrating two distict helpers based driver into one piece
> allow code sharing.
>=20
> We have also implemented demage update on top of CMA helper which copy
> the demaged region from the shadow framebuffer in system RAM to the real
> framebuffer in VRAM manually. This is intend to overcome the screen
> flicking issue on LS7A1000, but the performance is not good.
> Using "lsdc.dirty_update=3D1" in the kernel commmand line if you would li=
ke
> to have a try.
>=20
> For LS7A1000, there are 4 dedicated GPIOs whose control register is
> located at the DC register space, They are used to emulate two way i2c.
> One for DVO0, another for DVO1. This is the reason why this driver is
> not switch to drm bridge framework yet. LS2K1000 and LS2K0500 SoC don't
> have such GPIO hardwared, they grab i2c adapter from other module,
> either general purpose GPIO emulated i2c or hardware i2c adapter.
> Drm bridge and drm panel driver for the external encoder is suitable for
> those SoC. We have already implemented this on our downstream 4.19.190
> kernel. But due to the GPIO, PWM and I2C device driver support for
> LS2K1000 is not upstreamed yet, this driver still can be use to bring
> the graphic environment up by providing display timings or similar things
> in the device tree.
>=20
> The DC in LS7A1000 has only one hardware cursor, we simply let the two
> CRTC share it. The DC in LS7A2000 have two cursor, two built-in hdmi
> encoder and one transparent vga encoder and more, surport for LS7A2000
> is on the way. In short, we have built-in gpio emulated i2c support,
> we also have hardware cursor support. LS7A2000 The kind of tiny drivers
> in drm/tiny is not suitable for us.
>=20
>     +------+            +-----------------------------------+
>     | DDR4 |            |  +-------------------+            |
>     +------+            |  | PCIe Root complex |   LS7A1000 |
>        || MC0           |  +--++---------++----+            |
>   +----------+  HT 3.0  |     ||         ||                 |
>   | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
>   |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
>   +----------+          | +--------+  +-+--+-+    +---------+   +------+
>        || MC1           +---------------|--|----------------+
>     +------+                            |  |
>     | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
>     +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
>                       +-------+                      +------+
>=20
> The above picture give a simple usage of LS7A1000, note that the encoder
> is not necessary adv7125 or tfp410, it is a choice of the downstream board
> manufacturer. Other candicate encoders can be ch7034b, sil9022 and ite661=
21
> lt8618 etc. Besides, the DC in both ls2k1000 and ls7k1000 has the same of
> PCI vendor id and pci device id. Both is 0x0014:0x7a06, the reverison id
> is also same. This is the firmware engineer's mistake, but such firmware
> and various boards ship with such firmware already released. We choose to
> deduce the chip's identification from information provided by device tree.
> For lsdc, there is only a 1:1 mapping of encoders and connectors.
>=20
> v2: fixup warnings reported by kernel test robot
>=20
> v3: fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
>     more details about lsdc.
>=20
> v4:
>    1) Add dts required and explain why device tree is required.
>    2) Give more description about lsdc and vram helper base driver.
>    3) Fix warnings reported by kernel test robot.
>    4) Introduce stride_alignment member into struct lsdc_chip_desc, the
>       stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500.
>       But ls7a2000 improve it to 32 bytes, for extend the support for the
>       device on coming
>
> v5:
>    1) using writel and readl replace writeq and readq, to fix kernel test
>       robot report build error on other archtecture
>    2) set default fb format to XRGB8888 at crtc reset time.
>    3) fix typos.
>=20
> v6:
>    1) Explain why we are not switch to drm dridge subsystem on ls2k1000.
>    2) Explain why tiny drm driver is not suitable for us.
>    3) Give a short description of the trival dirty uppdate implement based
>       on CMA helper.
>    4) code clean up
>=20
> v7:
>    1) Remove select I2C_GPIO and I2C_LS2X in Kconfig, it is not ready now
>    2) Licensing issues are fixed suggested by Krzysztof Kozlowski.
>    3) lsdc_pixpll_print() is removed, part of it move to debugfs.
>    4) Set prefer_shadow to true if vram based driver is in using.
>    5) Replace double blank lines with single line in all files
>    6) Verbose cmd line parameter is replaced with drm_dbg()
>    7) All warnnings reported by ./scripts/checkpatch.pl --strict are fixed
>    8) Get edid from dtb support is removed as suggested by Maxime Ripard
>    9) Fix typos and various improvement

A lot of the major comments I had haven't been fixed though: you *need*
to have a DT bindings description, Kconfig isn't the proper place to set
the VRAM preference, the command line isn't either, the command line
isn't the solution for all your parameters, etc.

Those things are major blockers at the moment, so ignoring them won't
help getting this merged.

Maxime

--22dgeudp6wphcltc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgoqlwAKCRDj7w1vZxhR
xaupAP9QxVn4MY8fLRgh0Kvu1RZ3LspqtlVOws7AVDIeCMHy7wD/VQn/keld+Nh9
d4Wh8dIVav3ralKQ8Aq9LaDK0Q/5rQE=
=fvHX
-----END PGP SIGNATURE-----

--22dgeudp6wphcltc--
