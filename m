Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B261A80ED
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 17:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3B26E197;
	Tue, 14 Apr 2020 15:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805776E197
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 15:05:07 +0000 (UTC)
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MKbc2-1jh10H1RrI-00L2Ck for <dri-devel@lists.freedesktop.org>; Tue, 14
 Apr 2020 17:05:05 +0200
Received: by mail-qv1-f42.google.com with SMTP id k9so6331716qvw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:05:05 -0700 (PDT)
X-Gm-Message-State: AGi0Pua1s30IkSMAXc2nq2J3V4f9/QPoVBuSlGFKwkTozlpPkPAX5S3p
 INwlpSf3KZ648smlTWIYyaw/QzIt1JKd8/i9DZI=
X-Google-Smtp-Source: APiQypLg53lbvwM7SS+vs6GZuu1V+f5ASJ1OTKDbmA6YwidcSTB5Gp26EmpzyTd2a0/A/WzgZ9UHn80nFHIsFLn9j2M=
X-Received: by 2002:a0c:9e2f:: with SMTP id p47mr355001qve.211.1586876703988; 
 Tue, 14 Apr 2020 08:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de>
 <CGME20200408202802eucas1p13a369a5c584245a1affee35d2c8cad32@eucas1p1.samsung.com>
 <20200408202711.1198966-5-arnd@arndb.de>
 <ff7809b6-f566-9c93-1838-610be5d22431@samsung.com>
In-Reply-To: <ff7809b6-f566-9c93-1838-610be5d22431@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Apr 2020 17:04:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2BXZAiHh83RZJ-v9HvoE1gSED59j8k0ydJKCnHzwYz=w@mail.gmail.com>
Message-ID: <CAK8P3a2BXZAiHh83RZJ-v9HvoE1gSED59j8k0ydJKCnHzwYz=w@mail.gmail.com>
Subject: Re: [RFC 4/6] drm/bridge/sii8620: fix extcon dependency
To: Andrzej Hajda <a.hajda@samsung.com>
X-Provags-ID: V03:K1:AktLx9EA72ZKiPBOj0zkRVx5bx7aUUbs0xkp9nIeMNf2d5RMnYx
 Y26281NEcI/sunRrSgM3VWeqyKWaBz676WZyHxzu2zI3RRblH7a9E1SiZGqdegFI0HeRuKd
 JQf9CPKTN/TSTfovFNyHl0zm0XICslkqgpySaMvLY6C18SAfgDJhvgFkslYSaGXstvUjLme
 FvHf7AU9V/E/BgsBFpUgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/fkDjhTdCa8=:KS2eoqFh5OF6eolSdOhhKx
 d/EtOusEnDvoc+42wh6Nh05V/6HCEB2qkYt4w2zj/35FrANadm8mPY4DY2l4tmd/Qx+WUM+n4
 P67a/NuayPTqyydL+cOmFQ+CpXd6MTvOxtm4WnX4Ac16uhfrcVmtJfvyCveLzYvLbWKcSEGia
 4VRBYZXu4e7ebE434bdc07+30elPQW4GoYV2ggiAE4RFPf+RB2ydpT8mg4WGE1vdK1OXWXyUZ
 IbAk0brpgQGITVosh6KoYgCLJheLtFQaPl0ZUIaYpOePMWyg/RMth0OLYL1D5CdUdVYsXDyki
 Ik1GnpsJ5CCv+W5bLnAy6tr3E3x9mlJM/5sFOtjKxh1iFh0jYQtb1Ogg58K9LtfGDfqi06T2s
 a4jMUUNWOpZeFtZfxQjocqKHfR8CYmVWEdur3npLF6ZDbtrvbX/NVJh2o4rxWCGh2U7g5wl+i
 Q5p8M1eQ/85FnBP6lWgW2hMijf3HHT7pmAHeLZ5Tf9uBjkAI78KpNlHWpibXuoM6VhWQ0Ryqk
 mDkVfbgXLYIrL1lsPRdKSmPxF+vpXfV8fGMeq2cgwS9pLYDED9IJP7aDIo7G+B5vM3Q5d8vF1
 RsFmtwo+lIsGb7sqlrLir4zPr801d/geW6kp2ojOzoPHgry+PclWZM38jD9G8/QZfMU/nQ5Pg
 6q90IniC7eAeb8G9oFdHX/2Qdh5cR3oz87b49ghDKL50PxaYl2lcniLVwH4x4ArqSw2Zs54sA
 NXaOvfzjd+hg+5ip2KiGcRhJIzMkzu1/h5Vg4CKga9uk7YoZn94pIpQlrzslgjueIsaLLgwV+
 D8fhDzk7PO1THH6l6uJS6tuaVJyZrmjJR0xSBJZ5VhOo60VFYE=
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Leon Romanovsky <leon@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Networking <netdev@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Pitre <nico@fluxnic.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Saeed Mahameed <saeedm@mellanox.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 10, 2020 at 8:56 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> On 08.04.2020 22:27, Arnd Bergmann wrote:
> > Using 'imply' does not work here, it still cause the same build
> > failure:
> >
> > arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_remove':
> > sil-sii8620.c:(.text+0x1b8): undefined reference to `extcon_unregister_notifier'
> > arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_probe':
> > sil-sii8620.c:(.text+0x27e8): undefined reference to `extcon_find_edev_by_node'
> > arm-linux-gnueabi-ld: sil-sii8620.c:(.text+0x2870): undefined reference to `extcon_register_notifier'
> > arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_extcon_work':
> > sil-sii8620.c:(.text+0x2908): undefined reference to `extcon_get_state'
> >
> > I tried the usual 'depends on EXTCON || !EXTCON' logic, but that caused
> > a circular Kconfig dependency. Using IS_REACHABLE() is ugly but works.
>
> 'depends on EXTCON || !EXTCON' seems to be proper solution, maybe would be better to try to solve circular dependencies issue.

I agree that would be nice, but I failed to come to a proper solution
here. FWIW, there
is one circular dependency that I managed to avoid by changing all
drivers that select FB_DDC
to depend on I2C rather than selecting it:

drivers/i2c/Kconfig:8:error: recursive dependency detected!
drivers/i2c/Kconfig:8: symbol I2C is selected by FB_DDC
drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
drivers/gpu/drm/Kconfig:80: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
drivers/gpu/drm/Kconfig:74: symbol DRM_KMS_HELPER is selected by DRM_SIL_SII8620
drivers/gpu/drm/bridge/Kconfig:89: symbol DRM_SIL_SII8620 depends on EXTCON
drivers/extcon/Kconfig:2: symbol EXTCON is selected by CHARGER_MANAGER
drivers/power/supply/Kconfig:482: symbol CHARGER_MANAGER depends on POWER_SUPPLY
drivers/power/supply/Kconfig:2: symbol POWER_SUPPLY is selected by
HID_BATTERY_STRENGTH
drivers/hid/Kconfig:29: symbol HID_BATTERY_STRENGTH depends on HID
drivers/hid/Kconfig:8: symbol HID is selected by I2C_HID
drivers/hid/i2c-hid/Kconfig:5: symbol I2C_HID depends on I2C

After that, Kconfig crashes with a segfault:

drivers/video/fbdev/Kconfig:12:error: recursive dependency detected!
drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
drivers/gpu/drm/Kconfig:80: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
drivers/gpu/drm/Kconfig:74: symbol DRM_KMS_HELPER is selected by DRM_SIL_SII8620
drivers/gpu/drm/bridge/Kconfig:89: symbol DRM_SIL_SII8620 depends on EXTCON
drivers/extcon/Kconfig:2: symbol EXTCON is selected by CHARGER_MANAGER
drivers/power/supply/Kconfig:482: symbol CHARGER_MANAGER depends on POWER_SUPPLY
drivers/power/supply/Kconfig:2: symbol POWER_SUPPLY is selected by HID_ASUS
drivers/hid/Kconfig:150: symbol HID_ASUS depends on LEDS_CLASS
drivers/leds/Kconfig:17: symbol LEDS_CLASS depends on NEW_LEDS
drivers/leds/Kconfig:9: symbol NEW_LEDS is selected by SENSORS_APPLESMC
drivers/hwmon/Kconfig:327: symbol SENSORS_APPLESMC depends on HWMON
drivers/hwmon/Kconfig:6: symbol HWMON is selected by EEEPC_LAPTOP
drivers/platform/x86/Kconfig:260: symbol EEEPC_LAPTOP depends on ACPI_VIDEO
make[3]: *** [/git/arm-soc/scripts/kconfig/Makefile:71: randconfig]
Segmentation fault (core dumped)

After changing EEEPC_LAPTOP and THINKPAD_ACPI to 'depends on HWMON' instead of
'select HWMON', I get this one:

drivers/video/fbdev/Kconfig:12:error: recursive dependency detected!
drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
drivers/gpu/drm/Kconfig:80: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
drivers/gpu/drm/Kconfig:74: symbol DRM_KMS_HELPER is selected by DRM_SIL_SII8620
drivers/gpu/drm/bridge/Kconfig:89: symbol DRM_SIL_SII8620 depends on EXTCON
drivers/extcon/Kconfig:2: symbol EXTCON is selected by CHARGER_MANAGER
drivers/power/supply/Kconfig:482: symbol CHARGER_MANAGER depends on POWER_SUPPLY
drivers/power/supply/Kconfig:2: symbol POWER_SUPPLY is selected by HID_ASUS
drivers/hid/Kconfig:150: symbol HID_ASUS depends on LEDS_CLASS
drivers/leds/Kconfig:17: symbol LEDS_CLASS depends on NEW_LEDS
drivers/leds/Kconfig:9: symbol NEW_LEDS is selected by BACKLIGHT_ADP8860
drivers/video/backlight/Kconfig:316: symbol BACKLIGHT_ADP8860 depends
on BACKLIGHT_CLASS_DEVICE
drivers/video/backlight/Kconfig:143: symbol BACKLIGHT_CLASS_DEVICE is
selected by FB_BACKLIGHT
drivers/video/fbdev/Kconfig:187: symbol FB_BACKLIGHT depends on FB

Changing all drivers that select 'FB_BACKLIGHT' or 'BACKLIGHT_CLASS_DEVICE' to
'depends on BACKLIGHT_CLASS_DEVICE' gets it to build.

The steps each seem reasonable, in particular since they mostly clean
up the legacy
fbdev drivers to what they should have done anyway, but it is quite
invasive in the end.
Any other ideas?

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
