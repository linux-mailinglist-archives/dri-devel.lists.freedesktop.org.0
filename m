Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B8C248FA0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 22:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F216E110;
	Tue, 18 Aug 2020 20:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2FC6E110
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 20:34:53 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7C6E380519;
 Tue, 18 Aug 2020 22:34:48 +0200 (CEST)
Date: Tue, 18 Aug 2020 22:34:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 0/5] drm/panel: Use dev_ based logging
Message-ID: <20200818203447.GA6012@ravnborg.org>
References: <20200815125406.1153224-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200815125406.1153224-1-sam@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=_wIc6UtFb8ZiMK45WYkA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Chiras <robert.chiras@nxp.com>, Icenowy Zheng <icenowy@aosc.io>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 15, 2020 at 02:54:01PM +0200, Sam Ravnborg wrote:
> The drm/panel drivers uses a mixture of DRM_ and dev_ based logging.
> With this patchset all panel drivers are migrated to use dev_ based
> logging as the DRM_ based logging did not add any extra info.
> 
> Drop the now unused include of drm_print.h.
> 
> With this change new panel drivers will be requires to change to dev_
> based logging - so some of the in-flight panel drivers will need trivial
> updates before they are accepted.
> 
> Patch divided in smaller bites to ease review. There is no dependencies
> between the patches.
> 
> Copied a few people that may have input to the move away from DRM_ based
> logging (Daniel (presumeably on vacation), Jani).
> 
> 	Sam
> 
> Sam Ravnborg (5):
>       drm/panel: samsung: Use dev_ based logging
>       drm/panel: leadtek: Use dev_ based logging
>       drm/panel: raydium: Use dev_ based logging
>       drm/panel: sitronix: Use dev_ based logging
>       drm/panel: Use dev_ based logging

Thanks for the reviews from Linus and Guido.
Series is now applied to drm-misc-next.

	Sam

> 
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
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c       | 81 ++++++++--------------
>  drivers/gpu/drm/panel/panel-tpo-tpg110.c           | 38 +++++-----
>  drivers/gpu/drm/panel/panel-truly-nt35597.c        | 63 ++++++-----------
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 41 ++++-------
>  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   | 51 +++++---------
>  27 files changed, 308 insertions(+), 523 deletions(-)
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
