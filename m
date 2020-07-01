Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4308210FC7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 17:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDB76E93B;
	Wed,  1 Jul 2020 15:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0706E93B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id BF2E5FB03;
 Wed,  1 Jul 2020 17:54:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCl797Eo_EWk; Wed,  1 Jul 2020 17:54:06 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 6DCB540972; Wed,  1 Jul 2020 17:54:05 +0200 (CEST)
Date: Wed, 1 Jul 2020 17:54:05 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 00/13] Add support for PinePhone LCD panel
Message-ID: <20200701155405.GA174356@bogon.m.sigxcpu.org>
References: <20200701103126.1512615-1-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701103126.1512615-1-megous@megous.com>
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

Hi,
On Wed, Jul 01, 2020 at 12:31:13PM +0200, Ondrej Jirman wrote:
> This patchset adds support for the LCD panel of PinePhone.

I gave this a quick spin on the Librem5 devkit so

Tested-by: Guido G=FCnther <agx@sigxcpu.org>

but please also adjust MAINTAINERS so we stay in the loop on driver
changes.
Cheers,
 -- Guido

> =

> I've tested this on PinePhone 1.0 and 1.2.
> =

> Please take a look.
> =

> thank you and regards,
>   Ondrej Jirman
> =

> Changes in v6:
> - Fixed spacing in yaml
> - Fixed wrong vccio->iovcc supply name in the bindings doc
> - I noticed that the original driver uses a delay of 20ms in the init
>   function to achieve a combined total of 120ms required from post-reset
>   to display_on. I've added a similar delay to xbd599_init, so that
>   xbd599 panel also has the right timing. (patch 9)
> - v5->v6 diff: https://megous.com/dl/tmp/v5-v6.patch
> - Added review/ack tags
> - Learned to run dt_binding_check by myself ;)
> =

> Changes in v5:
> - rewritten on top of rocktech-jh057n00900 driver
> - rocktech-jh057n00900 renamed to st7703 (controller name)
> - converted rocktech-jh057n00900 bindings to yaml and extended for xbd599
> =

> Changes in v4:
> - use ->type from the mode instead of hardcoding (Samuel)
> - move init_sequence to ->prepare (Samuel)
> - move anti-flicker delay to ->enable, explain it (Samuel)
> - add enter_sleep after display_off (Samuel)
> - drop ->disable (move code to ->unprepare)
> - add ID bytes dumping (Linus)
>   (I can't test it since allwinner DSI driver has a broken
>    dcs_read function, and I didn't manage to fix it.)
> - document magic bytes (Linus)
> - assert reset during powerup
> - cleanup powerup timings according to the datasheet
> =

> Changes in v3:
> - Panel driver renamed to the name of the LCD controller
> - Re-organize the driver slightly to more easily support more panels
>   based on the same controller.
> - Add patch to enable the touchscreen to complete the LCD support
>   on PinePhone.
> - Dropped the "DSI fix" patch (the driver seems to work for me without it)
> - Improved brightness levels handling:
>   - PinePhone 1.0 uses default levels generated by the driver
>   - On PinePhone 1.1 duty cycles < 20% lead to black screen, so
>     default levels can't be used. Martijn Braam came up with a
>     list of duty cycle values that lead to perception of linear
>     brigtness level <-> light intensity on PinePhone 1.1
> - There was some feedback on v2 about this being similar to st7701.
>   It's only similar in name. Most of the "user commands" are different,
>   so I opted to keep this in a new driver instead of creating st770x.
>   =

>   Anyone who likes to check the differences, here are datasheets:
> =

>   - https://megous.com/dl/tmp/ST7703_DS_v01_20160128.pdf
>   - https://megous.com/dl/tmp/ST7701.pdf
> =

> Changes in v2:
> - DT Example fix.
> - DT Format fix.
> - Raised copyright info to 2020.
> - Sort panel operation functions.
> - Sort inclusion.
> =

> =

> -- For phone owners: --
> =

> There's an open question on how to set the backlight brightness values
> on post 1.0 revision phone, since lower duty cycles (< 10-20%) lead
> to backlight being black. It would be nice if more people can test
> the various backlight levels on 1.1 and 1.2 revision with this change
> in dts:
> =

>        brightness-levels =3D <0 1000>;
>        num-interpolated-steps =3D <1000>;
> =

> and report at what brightness level the backlight turns on. So far it
> seems this has a wide range. Lowest useable duty cycle for me is ~7%
> on 1.2 and for Martijn ~20% on 1.1.
> =

> Icenowy Zheng (2):
>   dt-bindings: vendor-prefixes: Add Xingbangda
>   arm64: dts: sun50i-a64-pinephone: Enable LCD support on PinePhone
> =

> Ondrej Jirman (11):
>   dt-bindings: panel: Convert rocktech,jh057n00900 to yaml
>   dt-bindings: panel: Add compatible for Xingbangda XBD599 panel
>   drm/panel: rocktech-jh057n00900: Rename the driver to st7703
>   drm/panel: st7703: Rename functions from jh057n prefix to st7703
>   drm/panel: st7703: Prepare for supporting multiple panels
>   drm/panel: st7703: Move code specific to jh057n closer together
>   drm/panel: st7703: Move generic part of init sequence to enable
>     callback
>   drm/panel: st7703: Add support for Xingbangda XBD599
>   drm/panel: st7703: Enter sleep after display off
>   drm/panel: st7703: Assert reset prior to powering down the regulators
>   arm64: dts: sun50i-a64-pinephone: Add touchscreen support
> =

>  .../display/panel/rocktech,jh057n00900.txt    |  23 -
>  .../display/panel/rocktech,jh057n00900.yaml   |  70 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  .../allwinner/sun50i-a64-pinephone-1.1.dts    |  19 +
>  .../dts/allwinner/sun50i-a64-pinephone.dtsi   |  54 ++
>  drivers/gpu/drm/panel/Kconfig                 |  26 +-
>  drivers/gpu/drm/panel/Makefile                |   2 +-
>  .../drm/panel/panel-rocktech-jh057n00900.c    | 424 -----------
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 656 ++++++++++++++++++
>  9 files changed, 815 insertions(+), 461 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/rockt=
ech,jh057n00900.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/rockt=
ech,jh057n00900.yaml
>  delete mode 100644 drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
>  create mode 100644 drivers/gpu/drm/panel/panel-sitronix-st7703.c
> =

> -- =

> 2.27.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
