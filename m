Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D254B119FD5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 01:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8AC6E9B1;
	Wed, 11 Dec 2019 00:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA2C6E9B1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 00:23:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0E2AD803DF;
 Wed, 11 Dec 2019 01:23:02 +0100 (CET)
Date: Wed, 11 Dec 2019 01:23:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/drm_panel: fix EXPORT of drm_panel_of_backlight
Message-ID: <20191211002300.GA28698@ravnborg.org>
References: <20191210194758.24087-1-sam@ravnborg.org>
 <CACRpkdY-8VMN-nZ=uTmOB_10_WGLFggkEDn_M4AYDn1P-bCXEA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdY-8VMN-nZ=uTmOB_10_WGLFggkEDn_M4AYDn1P-bCXEA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=llxM7Yg7cjnRgJtX4AcA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

On Tue, Dec 10, 2019 at 10:29:59PM +0100, Linus Walleij wrote:
> On Tue, Dec 10, 2019 at 8:48 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > Fix link failure for module builds of panels.
> > The conditional compilation around drm_panel_of_backlight()
> > was wrong for a module build.
> > Fix it using IS_ENABLED().
> >
> > Fixes: 152dbdeab1b2 ("drm/panel: add backlight support")
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Looks like the right fix to me:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks, patch pushed to drm-misc-next so we have this fixed.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
