Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBC248C98
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 19:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EFF6E065;
	Tue, 18 Aug 2020 17:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5D26E065
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 17:10:24 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F23192001F;
 Tue, 18 Aug 2020 19:10:21 +0200 (CEST)
Date: Tue, 18 Aug 2020 19:10:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] drm/panel: s6e63m0: Add DSI transport
Message-ID: <20200818171020.GA2290142@ravnborg.org>
References: <20200809215104.1830206-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200809215104.1830206-1-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=ER_8r6IbAAAA:8
 a=cH34Jzw6FiXbyyiV9_4A:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Stephan Gerhold <stephan@gerhold.net>,
 =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

On Sun, Aug 09, 2020 at 11:51:00PM +0200, Linus Walleij wrote:
> This begins to modify the Samsung S6E63M0 driver to provide
> DSI support.
> 
> After these initial changes the driver can already be used
> with the Samsung GT-I8190 (Golden) phone.
> 
> After this initial support we will make more changes to
> support more gammas (more levels of backlight), special
> biasing on different display types and handling of the
> ESD IRQ.
> 
> But let's begin with this.

How does this patchset relate to the patchset posted by Paul?
https://lore.kernel.org/dri-devel/20200727164613.19744-1-paul@crapouillou.net/

Seems that two different approcahes are used for the same type of
problem.

Is it possible to find a common solution?

	Sam

> 
> Linus Walleij (4):
>   drm/panel: s6e63m0: Break out SPI transport
>   drm/panel: s6e63m0: Add DSI transport
>   drm/panel: s6e63m0: Add reading functionality
>   drm/panel: s6e63m0: Add code to identify panel
> 
>  drivers/gpu/drm/panel/Kconfig                 |  23 ++-
>  drivers/gpu/drm/panel/Makefile                |   2 +
>  .../gpu/drm/panel/panel-samsung-s6e63m0-dsi.c | 145 +++++++++++++++++
>  .../gpu/drm/panel/panel-samsung-s6e63m0-spi.c | 101 ++++++++++++
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 146 ++++++++++--------
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.h |  13 ++
>  6 files changed, 363 insertions(+), 67 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h
> 
> -- 
> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
