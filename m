Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C628B1A93BD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 08:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D793A6E845;
	Wed, 15 Apr 2020 06:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9455F6E845
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 06:58:17 +0000 (UTC)
IronPort-SDR: 7k5QqP5ICIZxhkeWftAkc/2wFS50ycfRbE0nhy80LCJsTy+1W0U7eFra5StNzN4WQDv8u4O/uE
 wkJBjyHB7BMQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 23:58:17 -0700
IronPort-SDR: BMdpj2SHxf1RtzrB9dSirnQO7I/coXxGNfia+jS+5NoX6yBD1FKk0rzg8EONtUk0S211iAcYtQ
 kQgIv8R7L6wQ==
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="427335418"
Received: from ssolodk-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.48.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 23:58:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 4/6] drm/bridge/sii8620: fix extcon dependency
In-Reply-To: <CAKMK7uGpRkPsNqFR=taD68dT8T2tnEhias380ayGnjMH1b09xg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200408202711.1198966-1-arnd@arndb.de>
 <CGME20200408202802eucas1p13a369a5c584245a1affee35d2c8cad32@eucas1p1.samsung.com>
 <20200408202711.1198966-5-arnd@arndb.de>
 <ff7809b6-f566-9c93-1838-610be5d22431@samsung.com>
 <CAK8P3a2BXZAiHh83RZJ-v9HvoE1gSED59j8k0ydJKCnHzwYz=w@mail.gmail.com>
 <CAKMK7uGpRkPsNqFR=taD68dT8T2tnEhias380ayGnjMH1b09xg@mail.gmail.com>
Date: Wed, 15 Apr 2020 09:58:08 +0300
Message-ID: <87tv1l5j7j.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Leon Romanovsky <leon@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Networking <netdev@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Pitre <nico@fluxnic.net>, Saeed Mahameed <saeedm@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Apr 2020, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, Apr 14, 2020 at 5:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Fri, Apr 10, 2020 at 8:56 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>> >
>> >
>> > On 08.04.2020 22:27, Arnd Bergmann wrote:
>> > > Using 'imply' does not work here, it still cause the same build
>> > > failure:
>> > >
>> > > arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_remove':
>> > > sil-sii8620.c:(.text+0x1b8): undefined reference to `extcon_unregister_notifier'
>> > > arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_probe':
>> > > sil-sii8620.c:(.text+0x27e8): undefined reference to `extcon_find_edev_by_node'
>> > > arm-linux-gnueabi-ld: sil-sii8620.c:(.text+0x2870): undefined reference to `extcon_register_notifier'
>> > > arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_extcon_work':
>> > > sil-sii8620.c:(.text+0x2908): undefined reference to `extcon_get_state'
>> > >
>> > > I tried the usual 'depends on EXTCON || !EXTCON' logic, but that caused
>> > > a circular Kconfig dependency. Using IS_REACHABLE() is ugly but works.
>> >
>> > 'depends on EXTCON || !EXTCON' seems to be proper solution, maybe would be better to try to solve circular dependencies issue.
>>
>> I agree that would be nice, but I failed to come to a proper solution
>> here. FWIW, there
>> is one circular dependency that I managed to avoid by changing all
>> drivers that select FB_DDC
>> to depend on I2C rather than selecting it:
>>
>> drivers/i2c/Kconfig:8:error: recursive dependency detected!
>> drivers/i2c/Kconfig:8: symbol I2C is selected by FB_DDC
>> drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
>> drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
>> drivers/gpu/drm/Kconfig:80: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
>> drivers/gpu/drm/Kconfig:74: symbol DRM_KMS_HELPER is selected by DRM_SIL_SII8620
>> drivers/gpu/drm/bridge/Kconfig:89: symbol DRM_SIL_SII8620 depends on EXTCON
>> drivers/extcon/Kconfig:2: symbol EXTCON is selected by CHARGER_MANAGER
>> drivers/power/supply/Kconfig:482: symbol CHARGER_MANAGER depends on POWER_SUPPLY
>> drivers/power/supply/Kconfig:2: symbol POWER_SUPPLY is selected by
>> HID_BATTERY_STRENGTH
>> drivers/hid/Kconfig:29: symbol HID_BATTERY_STRENGTH depends on HID
>> drivers/hid/Kconfig:8: symbol HID is selected by I2C_HID
>> drivers/hid/i2c-hid/Kconfig:5: symbol I2C_HID depends on I2C
>>
>> After that, Kconfig crashes with a segfault:
>>
>> drivers/video/fbdev/Kconfig:12:error: recursive dependency detected!
>> drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
>> drivers/gpu/drm/Kconfig:80: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
>> drivers/gpu/drm/Kconfig:74: symbol DRM_KMS_HELPER is selected by DRM_SIL_SII8620
>> drivers/gpu/drm/bridge/Kconfig:89: symbol DRM_SIL_SII8620 depends on EXTCON
>> drivers/extcon/Kconfig:2: symbol EXTCON is selected by CHARGER_MANAGER
>> drivers/power/supply/Kconfig:482: symbol CHARGER_MANAGER depends on POWER_SUPPLY
>> drivers/power/supply/Kconfig:2: symbol POWER_SUPPLY is selected by HID_ASUS
>> drivers/hid/Kconfig:150: symbol HID_ASUS depends on LEDS_CLASS
>> drivers/leds/Kconfig:17: symbol LEDS_CLASS depends on NEW_LEDS
>> drivers/leds/Kconfig:9: symbol NEW_LEDS is selected by SENSORS_APPLESMC
>> drivers/hwmon/Kconfig:327: symbol SENSORS_APPLESMC depends on HWMON
>> drivers/hwmon/Kconfig:6: symbol HWMON is selected by EEEPC_LAPTOP
>> drivers/platform/x86/Kconfig:260: symbol EEEPC_LAPTOP depends on ACPI_VIDEO
>> make[3]: *** [/git/arm-soc/scripts/kconfig/Makefile:71: randconfig]
>> Segmentation fault (core dumped)
>>
>> After changing EEEPC_LAPTOP and THINKPAD_ACPI to 'depends on HWMON' instead of
>> 'select HWMON', I get this one:
>>
>> drivers/video/fbdev/Kconfig:12:error: recursive dependency detected!
>> drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
>> drivers/gpu/drm/Kconfig:80: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
>> drivers/gpu/drm/Kconfig:74: symbol DRM_KMS_HELPER is selected by DRM_SIL_SII8620
>> drivers/gpu/drm/bridge/Kconfig:89: symbol DRM_SIL_SII8620 depends on EXTCON
>> drivers/extcon/Kconfig:2: symbol EXTCON is selected by CHARGER_MANAGER
>> drivers/power/supply/Kconfig:482: symbol CHARGER_MANAGER depends on POWER_SUPPLY
>> drivers/power/supply/Kconfig:2: symbol POWER_SUPPLY is selected by HID_ASUS
>> drivers/hid/Kconfig:150: symbol HID_ASUS depends on LEDS_CLASS
>> drivers/leds/Kconfig:17: symbol LEDS_CLASS depends on NEW_LEDS
>> drivers/leds/Kconfig:9: symbol NEW_LEDS is selected by BACKLIGHT_ADP8860
>> drivers/video/backlight/Kconfig:316: symbol BACKLIGHT_ADP8860 depends
>> on BACKLIGHT_CLASS_DEVICE
>> drivers/video/backlight/Kconfig:143: symbol BACKLIGHT_CLASS_DEVICE is
>> selected by FB_BACKLIGHT
>> drivers/video/fbdev/Kconfig:187: symbol FB_BACKLIGHT depends on FB
>>
>> Changing all drivers that select 'FB_BACKLIGHT' or 'BACKLIGHT_CLASS_DEVICE' to
>> 'depends on BACKLIGHT_CLASS_DEVICE' gets it to build.
>>
>> The steps each seem reasonable, in particular since they mostly clean
>> up the legacy
>> fbdev drivers to what they should have done anyway, but it is quite
>> invasive in the end.
>> Any other ideas?
>
> Adding Jani, since iirc he looked at the entire backlight Kconfig
> story before. I think there's some nonsense going on where in some
> cases you don't get reasonable dummy functions where it just doesn't
> make sense. Or something like that.
>
> At least the entire select vs depends on backlight sounds eerily familiar.

TL;DR I'd ack a patch switching to depends.

I'm all for switching to "depends on BACKLIGHT_CLASS_DEVICE" throughout,
and I've sent patches to do just that years ago. Alas it was met with
opposition because if you have BACKLIGHT_CLASS_DEVICE=n as a starting
point, you won't even see your driver that depends on it in menuconfig.

I do think the menuconfig usability issue is a big part of the problem
here. You can't find and enable the options you want easily if the
dependencies aren't met. And you can't easily enable the dependencies
either. Select is an answer to that question. It's the wrong answer, but
it's *an* answer.

On another level, a lot of the problems could be avoided if we took heed
of the note in Documentation/kbuild/kconfig-language.rst:

  Note:
	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
	In general use select only for non-visible symbols
	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.

Another part of the problem is that there is no warning or lint option
or anything to warn about this usage in config. You can easily add more
of these, and it'll break later in subtle ways. And we'll just keep
repeating the same discussion over and over again, some folks fixing
issues in kconfig, some folks using IS_REACHABLE() and eventually
hitting different kinds of problems. (Personally, I wouldn't very easily
accept a patch adding IS_REACHABLE() use in i915.)


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
