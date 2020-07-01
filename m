Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED0211CD6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1108A6EA66;
	Thu,  2 Jul 2020 07:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9FA6E955
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593621736; bh=KxUzxz7KwYwMf8rZUJNXWkDofCaDRZo8njkBzSnWVWE=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=esruAha9QuQvsYqjkikeeyljlKuqcM5Qoep+nmmhQzydZ3HF2nuZ4ryef+IsXPGtH
 hNIKBAZSUn4LP2WSBklanuWaffu096QA80N9Nf1tdedGLlmV0kfCokBBxcWyvj29d8
 cR2Fm2F0mn07Y4tPZQXotsjtYHH9t+fiFe00Biok=
Date: Wed, 1 Jul 2020 18:42:15 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>
Subject: Re: [PATCH v6 00/13] Add support for PinePhone LCD panel
Message-ID: <20200701164215.warjiiduzschibkt@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>,
 linux-sunxi@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Purism Kernel Team <kernel@puri.sm>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Icenowy Zheng <icenowy@aosc.io>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>,
 Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
 Bhushan Shah <bshah@kde.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701155405.GA174356@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701155405.GA174356@bogon.m.sigxcpu.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Weiss <luca@z3ntu.xyz>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Jul 01, 2020 at 05:54:05PM +0200, Guido G=FCnther wrote:
> Hi,
> On Wed, Jul 01, 2020 at 12:31:13PM +0200, Ondrej Jirman wrote:
> > This patchset adds support for the LCD panel of PinePhone.
> =

> I gave this a quick spin on the Librem5 devkit so
> =

> Tested-by: Guido G=FCnther <agx@sigxcpu.org>
> =

> but please also adjust MAINTAINERS so we stay in the loop on driver
> changes.

Ah, right. I'll send a quick followup patch[1] after this gets merged,
or add it to v8 if there will be a need for v8. Thanks for noticing.

[1] https://megous.com/dl/tmp/0001-MAINTAINERS-Update-entry-for-st7703-driv=
er-after-the.patch

And thanks for testing, too. :)

regards,
	o.

> Cheers,
>  -- Guido
> =

> > =

> > I've tested this on PinePhone 1.0 and 1.2.
> > =

> > Please take a look.
> > =

> > thank you and regards,
> >   Ondrej Jirman
> > =

> > Changes in v6:
> > - Fixed spacing in yaml
> > - Fixed wrong vccio->iovcc supply name in the bindings doc
> > - I noticed that the original driver uses a delay of 20ms in the init
> >   function to achieve a combined total of 120ms required from post-reset
> >   to display_on. I've added a similar delay to xbd599_init, so that
> >   xbd599 panel also has the right timing. (patch 9)
> > - v5->v6 diff: https://megous.com/dl/tmp/v5-v6.patch
> > - Added review/ack tags
> > - Learned to run dt_binding_check by myself ;)
> > =

> > Changes in v5:
> > - rewritten on top of rocktech-jh057n00900 driver
> > - rocktech-jh057n00900 renamed to st7703 (controller name)
> > - converted rocktech-jh057n00900 bindings to yaml and extended for xbd5=
99
> > =

> > Changes in v4:
> > - use ->type from the mode instead of hardcoding (Samuel)
> > - move init_sequence to ->prepare (Samuel)
> > - move anti-flicker delay to ->enable, explain it (Samuel)
> > - add enter_sleep after display_off (Samuel)
> > - drop ->disable (move code to ->unprepare)
> > - add ID bytes dumping (Linus)
> >   (I can't test it since allwinner DSI driver has a broken
> >    dcs_read function, and I didn't manage to fix it.)
> > - document magic bytes (Linus)
> > - assert reset during powerup
> > - cleanup powerup timings according to the datasheet
> > =

> > Changes in v3:
> > - Panel driver renamed to the name of the LCD controller
> > - Re-organize the driver slightly to more easily support more panels
> >   based on the same controller.
> > - Add patch to enable the touchscreen to complete the LCD support
> >   on PinePhone.
> > - Dropped the "DSI fix" patch (the driver seems to work for me without =
it)
> > - Improved brightness levels handling:
> >   - PinePhone 1.0 uses default levels generated by the driver
> >   - On PinePhone 1.1 duty cycles < 20% lead to black screen, so
> >     default levels can't be used. Martijn Braam came up with a
> >     list of duty cycle values that lead to perception of linear
> >     brigtness level <-> light intensity on PinePhone 1.1
> > - There was some feedback on v2 about this being similar to st7701.
> >   It's only similar in name. Most of the "user commands" are different,
> >   so I opted to keep this in a new driver instead of creating st770x.
> >   =

> >   Anyone who likes to check the differences, here are datasheets:
> > =

> >   - https://megous.com/dl/tmp/ST7703_DS_v01_20160128.pdf
> >   - https://megous.com/dl/tmp/ST7701.pdf
> > =

> > Changes in v2:
> > - DT Example fix.
> > - DT Format fix.
> > - Raised copyright info to 2020.
> > - Sort panel operation functions.
> > - Sort inclusion.
> > =

> > =

> > -- For phone owners: --
> > =

> > There's an open question on how to set the backlight brightness values
> > on post 1.0 revision phone, since lower duty cycles (< 10-20%) lead
> > to backlight being black. It would be nice if more people can test
> > the various backlight levels on 1.1 and 1.2 revision with this change
> > in dts:
> > =

> >        brightness-levels =3D <0 1000>;
> >        num-interpolated-steps =3D <1000>;
> > =

> > and report at what brightness level the backlight turns on. So far it
> > seems this has a wide range. Lowest useable duty cycle for me is ~7%
> > on 1.2 and for Martijn ~20% on 1.1.
> > =

> > Icenowy Zheng (2):
> >   dt-bindings: vendor-prefixes: Add Xingbangda
> >   arm64: dts: sun50i-a64-pinephone: Enable LCD support on PinePhone
> > =

> > Ondrej Jirman (11):
> >   dt-bindings: panel: Convert rocktech,jh057n00900 to yaml
> >   dt-bindings: panel: Add compatible for Xingbangda XBD599 panel
> >   drm/panel: rocktech-jh057n00900: Rename the driver to st7703
> >   drm/panel: st7703: Rename functions from jh057n prefix to st7703
> >   drm/panel: st7703: Prepare for supporting multiple panels
> >   drm/panel: st7703: Move code specific to jh057n closer together
> >   drm/panel: st7703: Move generic part of init sequence to enable
> >     callback
> >   drm/panel: st7703: Add support for Xingbangda XBD599
> >   drm/panel: st7703: Enter sleep after display off
> >   drm/panel: st7703: Assert reset prior to powering down the regulators
> >   arm64: dts: sun50i-a64-pinephone: Add touchscreen support
> > =

> >  .../display/panel/rocktech,jh057n00900.txt    |  23 -
> >  .../display/panel/rocktech,jh057n00900.yaml   |  70 ++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  .../allwinner/sun50i-a64-pinephone-1.1.dts    |  19 +
> >  .../dts/allwinner/sun50i-a64-pinephone.dtsi   |  54 ++
> >  drivers/gpu/drm/panel/Kconfig                 |  26 +-
> >  drivers/gpu/drm/panel/Makefile                |   2 +-
> >  .../drm/panel/panel-rocktech-jh057n00900.c    | 424 -----------
> >  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 656 ++++++++++++++++++
> >  9 files changed, 815 insertions(+), 461 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/roc=
ktech,jh057n00900.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/roc=
ktech,jh057n00900.yaml
> >  delete mode 100644 drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> >  create mode 100644 drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > =

> > -- =

> > 2.27.0
> > =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
