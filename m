Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438B61AE65E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 21:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F1D6E959;
	Fri, 17 Apr 2020 19:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0756E959
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 19:56:03 +0000 (UTC)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M1YpJ-1jN3Bi1xk3-0032gV for <dri-devel@lists.freedesktop.org>; Fri, 17
 Apr 2020 21:56:01 +0200
Received: by mail-qk1-f170.google.com with SMTP id s63so3780232qke.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 12:56:01 -0700 (PDT)
X-Gm-Message-State: AGi0PuY1eYgvV7BceQydnKUcK0r/F1oEPAxPpxB64B12YA8K5l+l98eU
 VbTA9ljMcepLX7l8qldhDST8COZBKwrbebB/dnI=
X-Google-Smtp-Source: APiQypL/aYirBTw1joqQ0inaCArzn25FqAScTc6+QUlF+iqIJ3O0t/oDB2nctjg42E3+diNZLCqFSq8zjwVtRBsHEo8=
X-Received: by 2002:a37:63d0:: with SMTP id x199mr4824368qkb.3.1587153360346; 
 Fri, 17 Apr 2020 12:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417155553.675905-8-arnd@arndb.de>
 <20200417170444.GB30483@ravnborg.org>
In-Reply-To: <20200417170444.GB30483@ravnborg.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Apr 2020 21:55:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a31OMHOycpGv5tjQXS=NBGw+OoFRGQ0Za7QWw9=EcwgZg@mail.gmail.com>
Message-ID: <CAK8P3a31OMHOycpGv5tjQXS=NBGw+OoFRGQ0Za7QWw9=EcwgZg@mail.gmail.com>
Subject: Re: [PATCH 7/8] fbdev: rework backlight dependencies
To: Sam Ravnborg <sam@ravnborg.org>
X-Provags-ID: V03:K1:Vz///P1j34nWNehYwI0Ecmw+kWs84fYjxTJSEPICamAfYR5WF6d
 UXyvA/uTbuH2PiRbib0WCdwydP5LoMj1XWm1WXsxN5RohHs9ci2lGopVHUCIGMqiQyI18i5
 ZjyDpRkJIvbM0Zj7J6d10sE2FKMzJpFLyhq4He9VlbQurkrKhYrEFI7DC6/mprur2P82uo0
 N54i1oupG7VT9t3HH4p/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dLLcLXZsqbc=:qnHKf/lzwG2TgXO6NR9b0I
 bb9V2AOoBuHAMfTLaF5UYa99S21F6kCX2NUKdACIdmuwM16vj+YSQQKOGLs0ozZUF4aTyFu8u
 EGgwkZ1n+f5eUSFoE586YxmzVDlFVdARIHDyNTTjEnQe7kk9TopsfRnHQuMItMKd1wyF91fqn
 vrgK5qkF/9gmClvhgVmuwLtRQ0lZLKhZj7u96G7CKMeshg4pG3hv7ozAXJtiT3mkyNpu/cUAw
 WpVpBIpNJpZ2J7JybBFSTpbYgYHxeuAeEVZg8PjS19FCZtjJH7MCkX4tFKiKJksPGM2WE7N+O
 TEE554uFCy/IsleafJz78s2X60IJGylqnVtcpyNro5BBfM1KgbW+APmynQSk1deU61BjA9MrR
 yfUm0ILP4jsdZHEcgRV7vioufMQhCoRM236c6w01KVjo29N8JpEOlKUZMDii4p97AF8ncg5Yr
 kZs8gRxjxw/hjjmLFKaGPuAmuw9112ifkFDn/5tMrYEA1v11lIebvFmavKeRXiTA+fmFsv/6V
 VAzLng3TJnfmMdtz/paI8pfXlOrYQ3wCRADRlR6I7ECJegfUF/T5fB9qeAVOpXZRoNeRehlTZ
 /B1tVRA4mxX16uw0CIFHMQO9/tuliPseONBAuauzVYRjKRzFT5KiIxDZnvzhjns80dBJIyTBC
 AoN6heFj+PK9EODnZkL7LYA88y4z4mdJzXUUWaUy1loscWSmIPMG1HYEQ22rUrAb0k8qT9StK
 eJzrp0inNkq01D0ZM+3NjAxZxk1x6B1xwJ1S9hZ69WQPRSwNbCAUp3Tz96aH5rLWluAyBopbO
 JbRIh5FdE3/33uXQm0L5/qwm4+aVGioRjg3OvizJ1bL3NjMRw0=
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
Cc: Marek Vasut <marex@denx.de>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, dsd@laptop.org,
 Nicolas Pitre <nico@fluxnic.net>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, jfrederich@gmail.com,
 Saeed Mahameed <saeedm@mellanox.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Mack <daniel@zonque.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 7:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Arnd.
>
> On Fri, Apr 17, 2020 at 05:55:52PM +0200, Arnd Bergmann wrote:
> > Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
> > make any driver that needs it have a dependency on the class device
> > being available, to prevent circular dependencies.
> >
> > This is the same way that the backlight is already treated for the DRM
> > subsystem.
>
> I am not happy with the direction of this patch.
> It is not easy to understand that one has to enable backlight to
> be allowed to select a display or an fbdev driver.
>
>
> How about somthing like this:
>
> config BACKLIGHT_CLASS_DEVICE
>         tristate
>         # Will enable backlight module
>         # Has no dependencies
>
> config  BACKLIGHT
>         bool "Backlight drivers"
>         # Will make the backlight drivers visible - a visibility option
>         # only
>
> All drivers outside video/backlight/ can then select
> BACKLIGHT_CLASS_DEVICE to get the backlight core
> module.
> Or in other words BACKLIGHT_CLASS_DEVICE is used as a sort
> of library symbol that gices us access to backlight functionality.

Right, this could work as long as nobody puts back any "depends on
BACKLIGHT_CLASS_DEVICE, but it does cause another problem: There
are a couple of drivers that can optionally use backlight support
or just leave it out depending on CONFIG_BACKLIGHT_CLASS_DEVICE.

Changing them to select the class device support unconditionally
would make it impossible to build those drivers without it.
Instead we could all need an individual Kconfig symbol, or use
have "select BACKLIGHT_CLASS_DEVICE if BACKLIGHT"
in each case, but I'm not sure if that's still a win over having a
simple 'depends on BACKLIGHT_CLASS_DEVICE'.

On a related note, the NEW_LEDS/LEDS_CLASS option probably
falls into the same category, and could also be done as you suggest.
At the moment, this has the problem that both symbols are user
visible and also frequently selected by device drivers (but not others),
which is causing another set of dependency issues.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
