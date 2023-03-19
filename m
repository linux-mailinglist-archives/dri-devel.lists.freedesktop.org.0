Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AF46C03B2
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 19:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACF510E185;
	Sun, 19 Mar 2023 18:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CD210E185
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 18:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1679249099; i=deller@gmx.de;
 bh=+sWpEtXEvBr7yZDavGqNS6S62MukCM3hdjT7cESk55Q=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=UUGIovN46vt9TgOdaPgAvLvsLSNXOET7MXkLaaRiQZoG7Q506S7I8Vc5V6oCTi/5T
 deMNYyxgum71BuCjzjRw7RnfeZcBsKM5h8tMgnYVM9JKLwaDjg0ndHEbtehVU0pTRI
 MaslDy8EvaxvwfZ52Kun2imXulEPJXdErE7ZAyiBO5v3xW89xl3JsA2FHJt5X8O9U5
 iiyWY6vmyrNEifqrQulry+kmKhyxOZCOFKxf9ZDdRTzdDIbJVxOH2eA08I0om0Asf0
 szyCRz492e7ipC8swK1EJQfQ/iK6dJwlYELPXWwJ6jWliK1RY+XqR2n3zQTDrGlhPG
 JESt+H1fYlXhw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.150.189]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FnZ-1pXe0q0Vlv-006Kfn; Sun, 19
 Mar 2023 19:04:59 +0100
Message-ID: <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
Date: Sun, 19 Mar 2023 19:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Yihao Han <hanyihao@vivo.com>, Javier Martinez Canillas
 <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Alexander Shiyan <shc_work@mail.ru>, Dongliang Mu <dzm91@hust.edu.cn>,
 Peter Jones <pjones@redhat.com>, Gaosheng Cui <cuigaosheng1@huawei.com>,
 Timur Tabi <timur@kernel.org>, Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Stephen Kitt
 <steve@sk2.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Yu Zhe
 <yuzhe@nfschina.com>, Xu Panda <xu.panda@zte.com.cn>,
 Zhang Qilong <zhangqilong3@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, Wang Qing <wangqing@vivo.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans de Goede <hdegoede@redhat.com>, Michal Januszewski <spock@gentoo.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zeng Heng <zengheng4@huawei.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S2Ob7Sb22mthOOeU6dil7PPjXBXP9Hc8SZkdR1IZ5YCor0QNNFb
 Nu8bRxHYLdivGl543yZgVLjUO58xBIYN0conq25vCzSEC8mZWr4KXgtfaYYqINDp7ht6hln
 oyJY47PaY6kDjKy8yO2b5EYKalvWq5EBLuxOIHH4cwAw/Aw4CEdwysVvnaH+XUO6xEkmzdu
 VwP+Wjc+VUJf+RLcDxySA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3Bo1vY26v6w=;g0HelX/LmA1pdWkRqXNjNqFLTng
 I4hZSJeZsVg4w7L5suher9lzLDHD84hlh0YXowt6Vcuzj14y93KZHlHgngpKGI6SEWfEblTYQ
 rUEiiIFGN4axL1VjQcGrJuWleRolM6n/OCYb/sWzqhg5W9uaAlOAEjsLPV8tJuiXOHhO3DB7x
 0zbZTKK4c1mzda0SesYh4ENrWu7silOSbJ9YaQzE0ttuJlmasM0exEL3Ne50wDac1zyJ4L5DF
 xGEmVUX65UqFRcSvdqs0Ob6l8RP9TJNjBcBBZXbioVyhG8x7yQNCLGMpCZnxQ/SS3sHIAq1dU
 E0tBTVwiMERPVTqPEyxYsWi3Rm68QBP7j88pu2/QrIUPb1SGYzbMRpbU1Ootc3oV4DdboU8BV
 yy4HSljKkNtUvQxo70AG3SUdvXGI1iulwzy8lIuqCiCIx/xwDG4QRwczmqDEyMW3tXhxSeRQ4
 q7FBFipr+49dOASUvsVpB319tGq4QjySeRSQREItbHTU7s01FaZ5CiGf40KeTfQctpM93M/of
 mNZ44MfEvd9eeeffV9mJe0X6Gs2UIFojaCDYbNce3WKxc3FWYk0tRFJeEINvvWddB4kAAeBiB
 Wl9zNAuxvdRqljryGRqqcGmGdrlv+sMnQ+BuW+HR7CNWOJd2Dt9WoAcYmZLbT6HMrRsIYMPi4
 jV/CGERNXNkC/7ntJdBgeAOS6oJiByNbssoTa3kU28fQH+pMXWFMn3omTiusI7zOLFzm3nEEr
 7zw7Lr7mwPStqplU68n02z8s2SZgOCGCIFkHWteAAgGWJHs3pW1IdsUl2mAVqdDaTxjdyNbXB
 mpy3h0ov6YLbD59NRHaFcZBhseokVh0MFyYy0TSLQ/MXOxWkb5JEuMu4hVYseDI8CSLoMYeh6
 Z+LMqX8pRf1a4YcVhg7ncYNUVscKAA4PvugjkDnBp5pOQee3aNTj+fZGO0IGQ6VEAvdEqj/m8
 Tf3KE4zBBR0NI9B6aeEGjWe1Icw=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Uwe,

On 3/19/23 00:53, Uwe Kleine-K=C3=B6nig wrote:
> this series adapts the platform drivers below drivers/video/fbdev to use=
 the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver =
core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warni=
ng. The
> device is removed anyhow and an early return from .remove() usually yiel=
ds a
> resource leak.
>
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
>
> The first patch simplifies the remove callback of one driver to obviousl=
y
> always return zero. After that all drivers are converted trivially to
> .remove_new().

Thanks for that patch series. It's a nice cleanup.
I've applied it to the fbdev "for-next" git tree for now to get some compi=
le testing.
I hope that's ok for you.

Regarding the new "remove_new" struct member I'd prefer a better name but =
don't
have any idea yet...

Helge

>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (51):
>    video: fbdev: au1100fb: Drop if with an always false condition
>    video: fbdev: arcfb: Convert to platform remove callback returning
>      void
>    video: fbdev: au1100fb: Convert to platform remove callback returning
>      void
>    video: fbdev: au1200fb: Convert to platform remove callback returning
>      void
>    video: fbdev: broadsheetfb: Convert to platform remove callback
>      returning void
>    video: fbdev: bw2: Convert to platform remove callback returning void
>    video: fbdev: cg14: Convert to platform remove callback returning voi=
d
>    video: fbdev: cg3: Convert to platform remove callback returning void
>    video: fbdev: cg6: Convert to platform remove callback returning void
>    video: fbdev: clps711x-fb: Convert to platform remove callback
>      returning void
>    video: fbdev: cobalt_lcdfb: Convert to platform remove callback
>      returning void
>    video: fbdev: da8xx-fb: Convert to platform remove callback returning
>      void
>    video: fbdev: efifb: Convert to platform remove callback returning
>      void
>    video: fbdev: ep93xx-fb: Convert to platform remove callback returnin=
g
>      void
>    video: fbdev: ffb: Convert to platform remove callback returning void
>    video: fbdev: fsl-diu-fb: Convert to platform remove callback
>      returning void
>    video: fbdev: gbefb: Convert to platform remove callback returning
>      void
>    video: fbdev: goldfishfb: Convert to platform remove callback
>      returning void
>    video: fbdev: grvga: Convert to platform remove callback returning
>      void
>    video: fbdev: hecubafb: Convert to platform remove callback returning
>      void
>    video: fbdev: hgafb: Convert to platform remove callback returning
>      void
>    video: fbdev: hitfb: Convert to platform remove callback returning
>      void
>    video: fbdev: imxfb: Convert to platform remove callback returning
>      void
>    video: fbdev: leo: Convert to platform remove callback returning void
>    video: fbdev: mb862xx: Convert to platform remove callback returning
>      void
>    video: fbdev: metronomefb: Convert to platform remove callback
>      returning void
>    video: fbdev: mx3fb: Convert to platform remove callback returning
>      void
>    video: fbdev: ocfb: Convert to platform remove callback returning voi=
d
>    video: fbdev: offb: Convert to platform remove callback returning voi=
d
>    video: fbdev: omapfb: Convert to platform remove callback returning
>      void
>    video: fbdev: p9100: Convert to platform remove callback returning
>      void
>    video: fbdev: platinumfb: Convert to platform remove callback
>      returning void
>    video: fbdev: pxa168fb: Convert to platform remove callback returning
>      void
>    video: fbdev: pxa3xx-gcu: Convert to platform remove callback
>      returning void
>    video: fbdev: pxafb: Convert to platform remove callback returning
>      void
>    video: fbdev: s1d13xxxfb: Convert to platform remove callback
>      returning void
>    video: fbdev: s3c-fb: Convert to platform remove callback returning
>      void
>    video: fbdev: sh7760fb: Convert to platform remove callback returning
>      void
>    video: fbdev: sh_mobile_lcdcfb: Convert to platform remove callback
>      returning void
>    video: fbdev: simplefb: Convert to platform remove callback returning
>      void
>    video: fbdev: sm501fb: Convert to platform remove callback returning
>      void
>    video: fbdev: tcx: Convert to platform remove callback returning void
>    video: fbdev: uvesafb: Convert to platform remove callback returning
>      void
>    video: fbdev: vesafb: Convert to platform remove callback returning
>      void
>    video: fbdev: vfb: Convert to platform remove callback returning void
>    video: fbdev: vga16fb: Convert to platform remove callback returning
>      void
>    video: fbdev: via: Convert to platform remove callback returning void
>    video: fbdev: vt8500lcdfb: Convert to platform remove callback
>      returning void
>    video: fbdev: wm8505fb: Convert to platform remove callback returning
>      void
>    video: fbdev: wmt_ge_rops: Convert to platform remove callback
>      returning void
>    video: fbdev: xilinxfb: Convert to platform remove callback returning
>      void
>
>   drivers/video/fbdev/arcfb.c                    |  5 ++---
>   drivers/video/fbdev/au1100fb.c                 | 11 +++--------
>   drivers/video/fbdev/au1200fb.c                 |  6 ++----
>   drivers/video/fbdev/broadsheetfb.c             |  5 ++---
>   drivers/video/fbdev/bw2.c                      |  6 ++----
>   drivers/video/fbdev/cg14.c                     |  6 ++----
>   drivers/video/fbdev/cg3.c                      |  6 ++----
>   drivers/video/fbdev/cg6.c                      |  6 ++----
>   drivers/video/fbdev/clps711x-fb.c              |  6 ++----
>   drivers/video/fbdev/cobalt_lcdfb.c             |  6 ++----
>   drivers/video/fbdev/da8xx-fb.c                 |  6 ++----
>   drivers/video/fbdev/efifb.c                    |  6 ++----
>   drivers/video/fbdev/ep93xx-fb.c                |  6 ++----
>   drivers/video/fbdev/ffb.c                      |  6 ++----
>   drivers/video/fbdev/fsl-diu-fb.c               |  6 ++----
>   drivers/video/fbdev/gbefb.c                    |  6 ++----
>   drivers/video/fbdev/goldfishfb.c               |  5 ++---
>   drivers/video/fbdev/grvga.c                    |  6 ++----
>   drivers/video/fbdev/hecubafb.c                 |  5 ++---
>   drivers/video/fbdev/hgafb.c                    |  6 ++----
>   drivers/video/fbdev/hitfb.c                    |  6 ++----
>   drivers/video/fbdev/imxfb.c                    |  6 ++----
>   drivers/video/fbdev/leo.c                      |  6 ++----
>   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c     |  5 ++---
>   drivers/video/fbdev/metronomefb.c              |  5 ++---
>   drivers/video/fbdev/mx3fb.c                    |  5 ++---
>   drivers/video/fbdev/ocfb.c                     |  6 ++----
>   drivers/video/fbdev/offb.c                     |  8 +++-----
>   drivers/video/fbdev/omap/omapfb_main.c         |  6 ++----
>   drivers/video/fbdev/omap2/omapfb/dss/core.c    |  6 ++----
>   drivers/video/fbdev/omap2/omapfb/dss/dispc.c   |  5 ++---
>   drivers/video/fbdev/omap2/omapfb/dss/dpi.c     |  5 ++---
>   drivers/video/fbdev/omap2/omapfb/dss/dsi.c     |  5 ++---
>   drivers/video/fbdev/omap2/omapfb/dss/dss.c     |  5 ++---
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c   |  5 ++---
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c   |  5 ++---
>   drivers/video/fbdev/omap2/omapfb/dss/sdi.c     |  5 ++---
>   drivers/video/fbdev/omap2/omapfb/dss/venc.c    |  5 ++---
>   drivers/video/fbdev/omap2/omapfb/omapfb-main.c |  6 ++----
>   drivers/video/fbdev/p9100.c                    |  6 ++----
>   drivers/video/fbdev/platinumfb.c               |  6 ++----
>   drivers/video/fbdev/pxa168fb.c                 |  8 +++-----
>   drivers/video/fbdev/pxa3xx-gcu.c               |  6 ++----
>   drivers/video/fbdev/pxafb.c                    |  8 +++-----
>   drivers/video/fbdev/s1d13xxxfb.c               |  5 ++---
>   drivers/video/fbdev/s3c-fb.c                   |  6 ++----
>   drivers/video/fbdev/sh7760fb.c                 |  6 ++----
>   drivers/video/fbdev/sh_mobile_lcdcfb.c         |  5 ++---
>   drivers/video/fbdev/simplefb.c                 |  6 ++----
>   drivers/video/fbdev/sm501fb.c                  |  6 ++----
>   drivers/video/fbdev/tcx.c                      |  6 ++----
>   drivers/video/fbdev/uvesafb.c                  |  6 ++----
>   drivers/video/fbdev/vesafb.c                   |  6 ++----
>   drivers/video/fbdev/vfb.c                      |  5 ++---
>   drivers/video/fbdev/vga16fb.c                  |  6 ++----
>   drivers/video/fbdev/via/via-gpio.c             |  5 ++---
>   drivers/video/fbdev/via/via_i2c.c              |  5 ++---
>   drivers/video/fbdev/vt8500lcdfb.c              |  6 ++----
>   drivers/video/fbdev/wm8505fb.c                 |  6 ++----
>   drivers/video/fbdev/wmt_ge_rops.c              |  5 ++---
>   drivers/video/fbdev/xilinxfb.c                 |  6 ++----
>   61 files changed, 126 insertions(+), 230 deletions(-)
>
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6

