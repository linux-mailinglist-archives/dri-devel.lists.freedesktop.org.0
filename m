Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CA82451DC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 23:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEC289B61;
	Sat, 15 Aug 2020 21:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9458489B61
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 21:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 055FEFB0A;
 Sat, 15 Aug 2020 23:20:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUtLIni-zTN7; Sat, 15 Aug 2020 23:20:49 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id D73354576F; Sat, 15 Aug 2020 23:20:48 +0200 (CEST)
Date: Sat, 15 Aug 2020 23:20:48 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 0/5] drm/panel: Use dev_ based logging
Message-ID: <20200815212048.GA134339@bogon.m.sigxcpu.org>
References: <20200815125406.1153224-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200815125406.1153224-1-sam@ravnborg.org>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Sat, Aug 15, 2020 at 02:54:01PM +0200, Sam Ravnborg wrote:
> The drm/panel drivers uses a mixture of DRM_ and dev_ based logging.
> With this patchset all panel drivers are migrated to use dev_ based
> logging as the DRM_ based logging did not add any extra info.
> =

> Drop the now unused include of drm_print.h.
> =

> With this change new panel drivers will be requires to change to dev_
> based logging - so some of the in-flight panel drivers will need trivial
> updates before they are accepted.
> =

> Patch divided in smaller bites to ease review. There is no dependencies
> between the patches.
> =

> Copied a few people that may have input to the move away from DRM_ based
> logging (Daniel (presumeably on vacation), Jani).

Looks good to me and after applying to next-20200824 i couldn't spot any
DRM_ style logging leftovers:

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>

Cheers,
 -- Guido

> =

> 	Sam
> =

> Sam Ravnborg (5):
>       drm/panel: samsung: Use dev_ based logging
>       drm/panel: leadtek: Use dev_ based logging
>       drm/panel: raydium: Use dev_ based logging
>       drm/panel: sitronix: Use dev_ based logging
>       drm/panel: Use dev_ based logging
> =

>  drivers/gpu/drm/panel/panel-boe-himax8279d.c       | 44 ++++--------
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c       | 51 +++++---------
>  drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  | 19 +++--
>  .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  | 21 +++---
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |  3 +-
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c      | 31 +++------
>  drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 33 ++++-----
>  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 58 ++++++----------
>  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 49 +++++--------
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c      | 40 ++++-------
>  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   | 13 ++--
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c      | 33 ++++-----
>  drivers/gpu/drm/panel/panel-raydium-rm68200.c      | 18 +++--
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       | 16 ++---
>  drivers/gpu/drm/panel/panel-samsung-ld9040.c       |  3 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      | 23 +++---
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |  3 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |  3 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      | 22 +++---
>  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |  3 +-
>  drivers/gpu/drm/panel/panel-sitronix-st7701.c      | 10 ++-
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c      | 61 ++++++----------
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c       | 81 ++++++++--------=
------
>  drivers/gpu/drm/panel/panel-tpo-tpg110.c           | 38 +++++-----
>  drivers/gpu/drm/panel/panel-truly-nt35597.c        | 63 ++++++-----------
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 41 ++++-------
>  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   | 51 +++++---------
>  27 files changed, 308 insertions(+), 523 deletions(-)
> =

> =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
