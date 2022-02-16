Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A504B8B54
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 15:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AB510F1DD;
	Wed, 16 Feb 2022 14:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0202B10F1DD
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 14:22:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 49B585806FC;
 Wed, 16 Feb 2022 09:22:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 16 Feb 2022 09:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=zk/ftbifk89CxK9Kf4RzXPm5fU1M7n+kkegVce
 MJzJg=; b=abZu3XduReeCd/BnAt58NPZqVMZW+Lqg/jW1zopFwMm/zqgSgiaHZ1
 eRzAa/mRCXUYZcnfyku8PKRPiP+volDr1uRsxyral4Vl+PjQwB1ZjYUgletnOEYk
 RvEG61PUCVaoRt3y6+e9MbTSrwOrNguLgy9TifzqwPzvjSEsvdKAK4ugYFhPSSf+
 olQ89kA6R9TuXive47gKRI/Ryciw3f+PgBuQR7srw0unkwp2rr7m16SQ0vAqHBwa
 2JBBq926K25uERC1TnfGxUOo6fNfP0+oyVFbfvVKAjmOgmoogfMLUcnzR6L7xJqa
 IkFSYfjkGWZN48Li1B+nHYgVmMTGL+7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zk/ftbifk89CxK9Kf
 4RzXPm5fU1M7n+kkegVceMJzJg=; b=b2yJiclOgGnImqmZRmqQMmtjr69RUD7W1
 b/NjKgIFNInRoeyj9AfhPgWBrd/1nJler8uCnxjTDAiDr8IrqoVQIhNMLqb1wVL+
 MoPRc9KsH6UtNn0Ngu9hczIv+rH8JL7DO2mKL8Gn3b1kTRd6ERivTZhO81K2vin/
 BBD5fDkU9l5GkdJLxYkj8w5JukiH4nEIYj955XrmTN90ywOPoBe7XVmUuCP1S9VM
 n27D5CXtZ0GZVVC9VVD188mj1YvtyMQ/EOvqemwXsOY8DcjOddgplS7BL1mC3poC
 nPEgdWXH/I48Qw5avear2GL09Fi3B8i86feGCrpKLbdnK502/gvVA==
X-ME-Sender: <xms:swgNYu8tzqHFUzHUc4GTKl2_2kn50l_EeeMkdtEQfV9ChtEUHqKnIg>
 <xme:swgNYutkWAQzZ9-l8hhxI68dyZAE8eF-cV-vsfSXzCOAyxDNyySrdElWLf-mK21o_
 WAEsrhPB0P9aewvDgk>
X-ME-Received: <xmr:swgNYkByUg7JG4Yd5eEuqh7sg0wlHHldTkXR6hrZJSpnXexNkPoEk97PfCF7mn22T-tBJwLUo9kTQI8OgqOlmw0Z7co57UN1oTo00LA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:swgNYmeRo0MzfBMpMbMaAKCFloTEHo9hEmiERYmDmZKijwSo5mljhw>
 <xmx:swgNYjM3f1q9h4XkTFFftfsuIkWNdlPGc_YTcAiR0uuuLGcJJgpt2Q>
 <xmx:swgNYgnvrHFgos9GQywWns2P1nsPHZyeS1NHxQ0dgSc3M9LZVtn0DA>
 <xmx:tQgNYtXWgu0BSfe_y3-H3EWRklwlDoG4yMqJfK8rFwjZnBnN7VFHZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 09:22:43 -0500 (EST)
Date: Wed, 16 Feb 2022 15:22:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v7 1/7] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220216142241.vqizcrovxpurm7yx@houat>
References: <20220213141649.1115987-1-15330273260@189.cn>
 <20220213141649.1115987-2-15330273260@189.cn>
 <20220214101031.kerresldiuopil6l@houat>
 <afeeabbe-29ba-2878-c0c5-78f576f7865f@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ugefweottf2rvhh5"
Content-Disposition: inline
In-Reply-To: <afeeabbe-29ba-2878-c0c5-78f576f7865f@189.cn>
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


--ugefweottf2rvhh5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 06:50:36PM +0800, Sui Jingfeng wrote:
>=20
> On 2022/2/14 18:10, Maxime Ripard wrote:
> > On Sun, Feb 13, 2022 at 10:16:43PM +0800, Sui Jingfeng wrote:
> > > From: suijingfeng <suijingfeng@loongson.cn>
> > >=20
> > > There is a display controller in loongson's LS2K1000 SoC and LS7A1000
> > > bridge chip, the DC is a PCI device in those chips. It has two display
> > > pipes but with only one hardware cursor. Each way has a DVO interface
> > > which provide RGB888 signals, vertical & horizontal synchronisations,
> > > data enable and the pixel clock. Each CRTC is able to scanout from
> > > 1920x1080 resolution at 60Hz. The maxmium resolution is 2048x2048
> > > according to the hardware spec.
> > >=20
> > > Loongson display controllers are simple which require scanout buffers
> > > to be physically contiguous. LS2K1000 is a SOC, Only system memory is
> > > available. Therefore CMA helper based driver is intended to be use,
> > > although it is possible to use VRAM helper based solution by carving
> > > out part of system memory as VRAM.
> > >=20
> > > On LS7A1000/LS7A2000 bridge chip, the DC is equipped with a dedicated
> > > video memory which is typically 64MB or more. In this case, VRAM help=
er
> > > based solution which scanout from local VRAM is reconmended to use.
> > > It is reliable to use for massive production, but CMA based helper
> > > solution is still usable on ls7a1000 and ls7a2000, at the price of
> > > the CRTC must access the FB in RAM through the PCIe bus and HT3.0 bus.
> > > This causes continuous traffic on the bus regardless of whether the FB
> > > image is updating or not. Sadly, it suffer from screen flickering und=
er
> > > RAM pressure on LS7A1000. Luckily, It show extremely good condition on
> > > LS7A2000 even under stressapptest, Maybe the hardware engineer resolve
> > > this issue. Integrating two distict helpers based driver into one pie=
ce
> > > allow code sharing.
> > >=20
> > > We have also implemented demage update on top of CMA helper which copy
> > > the demaged region from the shadow framebuffer in system RAM to the r=
eal
> > > framebuffer in VRAM manually. This is intend to overcome the screen
> > > flicking issue on LS7A1000, but the performance is not good.
> > > Using "lsdc.dirty_update=3D1" in the kernel commmand line if you woul=
d like
> > > to have a try.
> > >=20
> > > For LS7A1000, there are 4 dedicated GPIOs whose control register is
> > > located at the DC register space, They are used to emulate two way i2=
c.
> > > One for DVO0, another for DVO1. This is the reason why this driver is
> > > not switch to drm bridge framework yet. LS2K1000 and LS2K0500 SoC don=
't
> > > have such GPIO hardwared, they grab i2c adapter from other module,
> > > either general purpose GPIO emulated i2c or hardware i2c adapter.
> > > Drm bridge and drm panel driver for the external encoder is suitable =
for
> > > those SoC. We have already implemented this on our downstream 4.19.190
> > > kernel. But due to the GPIO, PWM and I2C device driver support for
> > > LS2K1000 is not upstreamed yet, this driver still can be use to bring
> > > the graphic environment up by providing display timings or similar th=
ings
> > > in the device tree.
> > >=20
> > > The DC in LS7A1000 has only one hardware cursor, we simply let the two
> > > CRTC share it. The DC in LS7A2000 have two cursor, two built-in hdmi
> > > encoder and one transparent vga encoder and more, surport for LS7A2000
> > > is on the way. In short, we have built-in gpio emulated i2c support,
> > > we also have hardware cursor support. LS7A2000 The kind of tiny drive=
rs
> > > in drm/tiny is not suitable for us.
> > >=20
> > >      +------+            +-----------------------------------+
> > >      | DDR4 |            |  +-------------------+            |
> > >      +------+            |  | PCIe Root complex |   LS7A1000 |
> > >         || MC0           |  +--++---------++----+            |
> > >    +----------+  HT 3.0  |     ||         ||                 |
> > >    | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +---=
---+
> > >    |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VR=
AM |
> > >    +----------+          | +--------+  +-+--+-+    +---------+   +---=
---+
> > >         || MC1           +---------------|--|----------------+
> > >      +------+                            |  |
> > >      | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
> > >      +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI=
/HDMI
> > >                        +-------+                      +------+
> > >=20
> > > The above picture give a simple usage of LS7A1000, note that the enco=
der
> > > is not necessary adv7125 or tfp410, it is a choice of the downstream =
board
> > > manufacturer. Other candicate encoders can be ch7034b, sil9022 and it=
e66121
> > > lt8618 etc. Besides, the DC in both ls2k1000 and ls7k1000 has the sam=
e of
> > > PCI vendor id and pci device id. Both is 0x0014:0x7a06, the reverison=
 id
> > > is also same. This is the firmware engineer's mistake, but such firmw=
are
> > > and various boards ship with such firmware already released. We choos=
e to
> > > deduce the chip's identification from information provided by device =
tree.
> > > For lsdc, there is only a 1:1 mapping of encoders and connectors.
> > >=20
> > > v2: fixup warnings reported by kernel test robot
> > >=20
> > > v3: fix more grammar mistakes in Kconfig reported by Randy Dunlap and=
 give
> > >      more details about lsdc.
> > >=20
> > > v4:
> > >     1) Add dts required and explain why device tree is required.
> > >     2) Give more description about lsdc and vram helper base driver.
> > >     3) Fix warnings reported by kernel test robot.
> > >     4) Introduce stride_alignment member into struct lsdc_chip_desc, =
the
> > >        stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0=
500.
> > >        But ls7a2000 improve it to 32 bytes, for extend the support fo=
r the
> > >        device on coming
> > >=20
> > > v5:
> > >     1) using writel and readl replace writeq and readq, to fix kernel=
 test
> > >        robot report build error on other archtecture
> > >     2) set default fb format to XRGB8888 at crtc reset time.
> > >     3) fix typos.
> > >=20
> > > v6:
> > >     1) Explain why we are not switch to drm dridge subsystem on ls2k1=
000.
> > >     2) Explain why tiny drm driver is not suitable for us.
> > >     3) Give a short description of the trival dirty uppdate implement=
 based
> > >        on CMA helper.
> > >     4) code clean up
> > >=20
> > > v7:
> > >     1) Remove select I2C_GPIO and I2C_LS2X in Kconfig, it is not read=
y now
> > >     2) Licensing issues are fixed suggested by Krzysztof Kozlowski.
> > >     3) lsdc_pixpll_print() is removed, part of it move to debugfs.
> > >     4) Set prefer_shadow to true if vram based driver is in using.
> > >     5) Replace double blank lines with single line in all files
> > >     6) Verbose cmd line parameter is replaced with drm_dbg()
> > >     7) All warnnings reported by ./scripts/checkpatch.pl --strict are=
 fixed
> > >     8) Get edid from dtb support is removed as suggested by Maxime Ri=
pard
> > >     9) Fix typos and various improvement
> > A lot of the major comments I had haven't been fixed though: you *need*
> > to have a DT bindings description,
>=20
> This driver works on most of board even no device tree is supplied,
> the dts are mainly supplement purpose. For example, it supports let
> you to tell which DVO is not get used. Even no device tree is
> provided, the driver still works.

That's irrelevant, really. The DT is considered an ABI, and thus any
introduction of new DT bindings need to be properly documented and
reviewed. It's not negotiable.

If your bindings is not always used, is of secondary secondary to you,
and you don't want to bother with that discussion, then you always have
the option to remove it from the next version of your series.

> > Kconfig isn't the proper place to set the VRAM preference,
>=20
> It mainly helps=A0you to code review, to tell you which function is VRAM
> helper related. DRM_LSDC_VRAM_DRIVER option is mean to be always
> enabled. It can be deselected if you only want CMA based solution. On
> LS2K1000, select this or deselect this doesn't matter.

Don't worry about us then, we'll be fine reviewing this, it can be
removed.

> > the command line isn't either, the command line
> > isn't the solution for all your parameters, etc.
>=20
> The command line may not be a blocker, why support a command
> line=A0block this driver be merged? You do NOT need to touch it, this
> driver will pick up the right driver instance to use.

I mean, if it's not important and we'll always work by default, why are
you so against removing it then?

I've told you already why we don't like kernel parameters and thus our
motivations against it, but it seems like you don't have any to keep
them?

Maxime

--ugefweottf2rvhh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYg0IsQAKCRDj7w1vZxhR
xQ9iAP9m/V3eOSPQ+OrY6c3HKCGMBU7MiRETFaPzAqbdwtW6+wEA4A/lJrBVqn4L
mWgjeVvaCjd+OoRY12iGKhgNUsg9owI=
=OnyB
-----END PGP SIGNATURE-----

--ugefweottf2rvhh5--
