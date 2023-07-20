Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A175A62F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 08:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE48B10E55C;
	Thu, 20 Jul 2023 06:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACEF10E55C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 06:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1689833997; x=1690438797; i=deller@gmx.de;
 bh=GqbM9uazU1aG9mZPA7y4FkFMh3oOFi2SYaKQzQeo6RU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=F+uctR4DarX5dfuN+E+FYCY+87t9IBUFLA6PyyY9o+C5ZUiz11Nq9n3o93iWRMhnI9Qr0LX
 3lf0H99EdBweZjJUTV0BEr+b9QkABB3TneYvJ3vwT2aidUehyKe6HLCNYGWW+4MWMUkZfyu+3
 f6H5R2DKUpMdICvoqbtlUJ3ipoohMo/bm4w6ZF37RTv8sNOv0w4VKOLA9ieXaIJXd6Y23W3Z+
 H4YzsWmmq9Kib5WtsFvxUZ99gp4HmyUPxecuaZJDEo0tR6o/9uRc6HCQSQLe5M7Hh+ereL9XI
 5p015nPXYPP9VvmBTc4SDHWVCr1HXcR3IuHoUM2OJI/iQegO8brA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.9]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQj7-1q8NSi2Es1-00Go1r; Thu, 20
 Jul 2023 08:19:57 +0200
Message-ID: <7217d0fe-7b06-7213-f939-3e2d9b2f6b5a@gmx.de>
Date: Thu, 20 Jul 2023 08:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] fb: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@amd.com>
References: <20230718143227.1067178-1-robh@kernel.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230718143227.1067178-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tzrjxkOY0OvdPVtGD9X87Pcn8+yA2eAF2PSQLlfJ/953Dzxj2k6
 JnOGMkm8SyGB0piIsyKXTKuoeSmKpDrooJzB7nCQqL1VcbuTqEkoLtQ/TMXsuodhZGcnjab
 ib0ctJU5kGHVK+U8+dRrhnrmX/IfhQrVUcWWphWwN49NJbbppLpkqrEZqyukj022OebAwkT
 vqmz6PtZaDQ6OQh1Zydrg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MHdg98xXBVI=;vI3z3MFtGHabpbietwhGBnnHUtU
 ofP3Mi5Urf6AibhoBasPEBc2apbV066cYbbeffvqq92n69ptV+Gfobqpss5t78XNaMLjBhZfa
 CJERbSj+/0xpgtVj6Y2Oneeksg34/kdbOIr44g1/GoUqOtj6s2OnvYAB1oe1LQ8PuzFKulRpp
 +sAqE7VV0P6eC9Qi0pWaoruwBvMKj4BpVFQBgRjPMWjEGY29Cz0DPUt1+37f/OBa4z6aTi4Nw
 2oFxpFdoybrZAvNKkzSVPYBczgoMa0feYtnMWxUYnRBHEzrNMvd7PCshCffMZojiQWhNDGh9R
 kqgEhJaD/6R1Vz0TeBzcv+ryPVTlTrOhxVy/SwLbUG87jum1Zh9k+4zNh9xGd6tCi0l7WeIWv
 ajP0Tu7NOViRutgJCL7TtbcPsXVlzAZBqMnLu9YtPdN7eE0xVwW7TyNkBVEUi0pAyBW4XoJJ0
 hDId2lsWx+k/LQ+DlEMFnmFlaZD4xmz8KfQttXyUklb1tboHJI2+eblSr6AD7nkexjR4deqVW
 qclAWlZ+EHSaSkbs1xd3H0IdW+5c663kaOFuyHCWiSbQts/PS8thegFiP1BbVz4KTAg9n31iz
 uer0X1lNQcV3OEcHl7aIqRPWwepyItuESM+vAK8/Srwf/s7fOu+GrttnnparhrCMEAVW7GQZs
 v53WNXfb1iFj2PulqQKij3/v9+0mGJBbeTGCsUeX6JKY2vbKrc6jX6G/V9yVJ410eJ+jjCi9D
 vZZDfb3s9JgtpVZwAYAJFtL3cqW2NOXT+EIAzKBkZaizR48wX7d0Gy5LjdhZ6XDXBszNJo2kI
 imzVa4ujfiLF1yMEyN828O+w4GOnGxsEBC9rC+rBOUTeGQULT70sOdpwyFNx8wZA/GBjCUKfa
 2TAD9GSxSop/Ea3FnKAVVHY8Ewo0Ynyq5ToAQwR7qhSER01+87/seHVp2kEUBGIbV7qmIImb/
 08PKukElyAMOJ7FUxXupnL5vHws=
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/18/23 16:32, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Rob Herring <robh@kernel.org>

applied to fbdev git tree.

Thanks!
Helge

> ---
> v2:
>   - Drop whitespace changes in sbuslib.c
> ---
>   drivers/video/fbdev/bw2.c                                | 3 ++-
>   drivers/video/fbdev/cg14.c                               | 3 ++-
>   drivers/video/fbdev/cg3.c                                | 3 ++-
>   drivers/video/fbdev/cg6.c                                | 3 ++-
>   drivers/video/fbdev/ffb.c                                | 3 ++-
>   drivers/video/fbdev/grvga.c                              | 3 +--
>   drivers/video/fbdev/leo.c                                | 3 ++-
>   drivers/video/fbdev/mb862xx/mb862xxfb_accel.c            | 4 +---
>   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c               | 6 +++---
>   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c | 2 +-
>   drivers/video/fbdev/p9100.c                              | 3 ++-
>   drivers/video/fbdev/platinumfb.c                         | 4 ++--
>   drivers/video/fbdev/sbuslib.c                            | 2 +-
>   drivers/video/fbdev/sunxvr1000.c                         | 3 ++-
>   drivers/video/fbdev/sunxvr2500.c                         | 2 +-
>   drivers/video/fbdev/sunxvr500.c                          | 2 +-
>   drivers/video/fbdev/tcx.c                                | 3 ++-
>   drivers/video/fbdev/xilinxfb.c                           | 5 ++---
>   18 files changed, 31 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
> index 025d663dc6fd..39f438de0d6b 100644
> --- a/drivers/video/fbdev/bw2.c
> +++ b/drivers/video/fbdev/bw2.c
> @@ -17,7 +17,8 @@
>   #include <linux/init.h>
>   #include <linux/fb.h>
>   #include <linux/mm.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>
>   #include <asm/io.h>
>   #include <asm/fbio.h>
> diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
> index 832a82f45c80..90fdc9d9bf5a 100644
> --- a/drivers/video/fbdev/cg14.c
> +++ b/drivers/video/fbdev/cg14.c
> @@ -17,7 +17,8 @@
>   #include <linux/fb.h>
>   #include <linux/mm.h>
>   #include <linux/uaccess.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>
>   #include <asm/io.h>
>   #include <asm/fbio.h>
> diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
> index 6335cd364c74..98c60f72046a 100644
> --- a/drivers/video/fbdev/cg3.c
> +++ b/drivers/video/fbdev/cg3.c
> @@ -17,7 +17,8 @@
>   #include <linux/init.h>
>   #include <linux/fb.h>
>   #include <linux/mm.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>
>   #include <asm/io.h>
>   #include <asm/fbio.h>
> diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
> index 6884572efea1..6427b85f1a94 100644
> --- a/drivers/video/fbdev/cg6.c
> +++ b/drivers/video/fbdev/cg6.c
> @@ -17,7 +17,8 @@
>   #include <linux/init.h>
>   #include <linux/fb.h>
>   #include <linux/mm.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>
>   #include <asm/io.h>
>   #include <asm/fbio.h>
> diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
> index c6d3111dcbb0..c473841eb6ff 100644
> --- a/drivers/video/fbdev/ffb.c
> +++ b/drivers/video/fbdev/ffb.c
> @@ -16,7 +16,8 @@
>   #include <linux/fb.h>
>   #include <linux/mm.h>
>   #include <linux/timer.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>
>   #include <asm/io.h>
>   #include <asm/upa.h>
> diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
> index 9aa15be29ea9..d4a9a58b3691 100644
> --- a/drivers/video/fbdev/grvga.c
> +++ b/drivers/video/fbdev/grvga.c
> @@ -12,8 +12,7 @@
>
>   #include <linux/platform_device.h>
>   #include <linux/dma-mapping.h>
> -#include <linux/of_platform.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>   #include <linux/module.h>
>   #include <linux/kernel.h>
>   #include <linux/string.h>
> diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
> index 3ffc0a725f89..89ca48235dbe 100644
> --- a/drivers/video/fbdev/leo.c
> +++ b/drivers/video/fbdev/leo.c
> @@ -16,8 +16,9 @@
>   #include <linux/init.h>
>   #include <linux/fb.h>
>   #include <linux/mm.h>
> -#include <linux/of_device.h>
>   #include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>
>   #include <asm/fbio.h>
>
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c b/drivers/vid=
eo/fbdev/mb862xx/mb862xxfb_accel.c
> index 61aed7fc0b8d..c35a7479fbf2 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
> @@ -15,9 +15,7 @@
>   #include <linux/module.h>
>   #include <linux/pci.h>
>   #include <linux/slab.h>
> -#if defined(CONFIG_OF)
> -#include <linux/of_platform.h>
> -#endif
> +
>   #include "mb862xxfb.h"
>   #include "mb862xx_reg.h"
>   #include "mb862xxfb_accel.h"
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/=
fbdev/mb862xx/mb862xxfbdrv.c
> index b5c8fcab9940..9dc347d163cf 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> @@ -18,11 +18,11 @@
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
>   #include <linux/pci.h>
> -#if defined(CONFIG_OF)
> +#include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/of_irq.h>
> -#include <linux/of_platform.h>
> -#endif
> +#include <linux/platform_device.h>
> +
>   #include "mb862xxfb.h"
>   #include "mb862xx_reg.h"
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/=
drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
> index ba94a0a7bd4f..77fce1223a64 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
> @@ -15,12 +15,12 @@
>   #include <linux/gpio/consumer.h>
>   #include <linux/interrupt.h>
>   #include <linux/jiffies.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/sched/signal.h>
>   #include <linux/slab.h>
>   #include <linux/workqueue.h>
> -#include <linux/of_device.h>
>
>   #include <video/omapfb_dss.h>
>   #include <video/mipi_display.h>
> diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
> index 0876962c52eb..e2e747cae9b1 100644
> --- a/drivers/video/fbdev/p9100.c
> +++ b/drivers/video/fbdev/p9100.c
> @@ -15,7 +15,8 @@
>   #include <linux/init.h>
>   #include <linux/fb.h>
>   #include <linux/mm.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>
>   #include <asm/io.h>
>   #include <asm/fbio.h>
> diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/plat=
inumfb.c
> index f8283fcd5edb..b27f43b3616e 100644
> --- a/drivers/video/fbdev/platinumfb.c
> +++ b/drivers/video/fbdev/platinumfb.c
> @@ -30,9 +30,9 @@
>   #include <linux/fb.h>
>   #include <linux/init.h>
>   #include <linux/nvram.h>
> +#include <linux/of.h>
>   #include <linux/of_address.h>
> -#include <linux/of_device.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>
>   #include "macmodes.h"
>   #include "platinumfb.h"
> diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib=
.c
> index 7f79db827b07..21e9fd8e69e2 100644
> --- a/drivers/video/fbdev/sbuslib.c
> +++ b/drivers/video/fbdev/sbuslib.c
> @@ -11,7 +11,7 @@
>   #include <linux/fb.h>
>   #include <linux/mm.h>
>   #include <linux/uaccess.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>
>   #include <asm/fbio.h>
>
> diff --git a/drivers/video/fbdev/sunxvr1000.c b/drivers/video/fbdev/sunx=
vr1000.c
> index 490bd9a14763..17d61e1d11a6 100644
> --- a/drivers/video/fbdev/sunxvr1000.c
> +++ b/drivers/video/fbdev/sunxvr1000.c
> @@ -8,7 +8,8 @@
>   #include <linux/kernel.h>
>   #include <linux/fb.h>
>   #include <linux/init.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>
>   struct gfb_info {
>   	struct fb_info		*info;
> diff --git a/drivers/video/fbdev/sunxvr2500.c b/drivers/video/fbdev/sunx=
vr2500.c
> index 2cab4b9be68a..e64ec7d0caf9 100644
> --- a/drivers/video/fbdev/sunxvr2500.c
> +++ b/drivers/video/fbdev/sunxvr2500.c
> @@ -10,7 +10,7 @@
>   #include <linux/fb.h>
>   #include <linux/pci.h>
>   #include <linux/init.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>
>   #include <asm/io.h>
>
> diff --git a/drivers/video/fbdev/sunxvr500.c b/drivers/video/fbdev/sunxv=
r500.c
> index 6ec358af1256..c4e01e871483 100644
> --- a/drivers/video/fbdev/sunxvr500.c
> +++ b/drivers/video/fbdev/sunxvr500.c
> @@ -10,7 +10,7 @@
>   #include <linux/fb.h>
>   #include <linux/pci.h>
>   #include <linux/init.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>
>   #include <asm/io.h>
>
> diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
> index fc3ac2301b45..255eb57aefa2 100644
> --- a/drivers/video/fbdev/tcx.c
> +++ b/drivers/video/fbdev/tcx.c
> @@ -17,7 +17,8 @@
>   #include <linux/init.h>
>   #include <linux/fb.h>
>   #include <linux/mm.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>
>   #include <asm/io.h>
>   #include <asm/fbio.h>
> diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinx=
fb.c
> index 2aa3a528277f..542baddd54ad 100644
> --- a/drivers/video/fbdev/xilinxfb.c
> +++ b/drivers/video/fbdev/xilinxfb.c
> @@ -24,14 +24,13 @@
>   #include <linux/module.h>
>   #include <linux/kernel.h>
>   #include <linux/errno.h>
> +#include <linux/platform_device.h>
>   #include <linux/string.h>
>   #include <linux/mm.h>
>   #include <linux/fb.h>
>   #include <linux/init.h>
>   #include <linux/dma-mapping.h>
> -#include <linux/of_device.h>
> -#include <linux/of_platform.h>
> -#include <linux/of_address.h>
> +#include <linux/of.h>
>   #include <linux/io.h>
>   #include <linux/slab.h>
>

