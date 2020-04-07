Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156931A0ADF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 12:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E186E80B;
	Tue,  7 Apr 2020 10:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5676E80B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 10:14:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3172420021;
 Tue,  7 Apr 2020 12:13:56 +0200 (CEST)
Date: Tue, 7 Apr 2020 12:13:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
Message-ID: <20200407101354.GA12686@ravnborg.org>
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <20200406200051.GA26582@ravnborg.org>
 <fe7d4cbb-5e44-60fb-c54a-6cb975154ad7@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe7d4cbb-5e44-60fb-c54a-6cb975154ad7@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=VwQbUJbxAAAA:8 a=PeMLKsBA2vLvDOwWRwIA:9 a=wPNLvfGTeEIA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 kraxel@redhat.com, emil.velikov@collabora.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, chunkuang.hu@kernel.org,
 puck.chen@hisilicon.com, hdegoede@redhat.com, jsarha@ti.com,
 matthias.bgg@gmail.com, sean@poorly.run, zourongrong@gmail.com,
 tiantao6@hisilicon.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Tue, Apr 07, 2020 at 08:28:59AM +0200, Thomas Zimmermann wrote:
> Hi Sam
> =

> Am 06.04.20 um 22:00 schrieb Sam Ravnborg:
> > Hi Thomas.
> > =

> > On Mon, Apr 06, 2020 at 03:43:55PM +0200, Thomas Zimmermann wrote:
> >> Generic fbdev emulation is a DRM client. If possible, it should behave
> >> like userspace clients. Therefore it should not run before the driver
> >> registered the new DRM device. If the setup function fails, the driver
> >> should not report an error.
> > =

> > Thanks for taking the time to refactor all the relevant drivers.
> > =

> > I have received some push-back in the past when suggesting this,
> > but cannot remember from who.
> > Let's see what review comments you get.
> > =

> > As the rule is that the fbdev setup shall be setup after registering
> > the DRM device - it would be nice to have this included in the
> > documentation of drm_fbdev_generic_setup
> > =

> > Could you try to to update the documentation to cover this?
> =

> Good idea. I'll add this to patchset's next iteration.

Thanks

Patch 1 to 9 are all:
Acked-by: Sam Ravnborg <sam@ravnborg.org>


This patch "drm/tilcdc: Set up fbdev after fully registering device"
looks a little point less, but I see from a consistency point of view
why you did it.
So therefore it is also acked.


	Sam


> =

> Best regards
> Thomas
> =

> > =

> > I will get back to the patches later this week.
> > =

> > 	Sam
> > =

> >>
> >> This is a follow-up patchset to the discussion at [1].  I went
> >> through all calls to drm_fbdev_generic_setup(), moved them to the
> >> final operation of their driver's probe function, and removed the
> >> return value.
> >>
> >> Built-tested on x86-64, aarch64 and arm.
> >>
> >> [1] https://lore.kernel.org/dri-devel/20200403135828.2542770-1-daniel.=
vetter@ffwll.ch/T/#m216b5b37aeeb7b28d55ad73b7a702b3d1d7bf867
> >>
> >> Thomas Zimmermann (10):
> >>   drm/ast: Set up fbdev after registering device; remove error checks
> >>   drm/hibmc: Remove error check from fbdev setup
> >>   drm/kirin: Set up fbdev after fully registering device
> >>   drm/ingenic: Remove error check from fbdev setup
> >>   drm/mediathek: Remove error check from fbdev setup
> >>   drm/mgag200: Set up fbdev after registering device; remove error
> >>     checks
> >>   drm/tilcdc: Set up fbdev after fully registering device
> >>   drm/udl: Remove error check from fbdev setup
> >>   drm/vboxvideo: Set up fbdev after registering device; remove error
> >>     checks
> >>   drm/fb-helper: Remove return value from drm_fbdev_generic_setup()
> >>
> >>  drivers/gpu/drm/ast/ast_drv.c                  |  3 +++
> >>  drivers/gpu/drm/ast/ast_main.c                 |  5 -----
> >>  drivers/gpu/drm/drm_fb_helper.c                | 18 ++++++++----------
> >>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |  6 +-----
> >>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  4 ++--
> >>  drivers/gpu/drm/ingenic/ingenic-drm.c          |  4 +---
> >>  drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  4 +---
> >>  drivers/gpu/drm/mgag200/mgag200_drv.c          |  2 ++
> >>  drivers/gpu/drm/mgag200/mgag200_main.c         |  4 ----
> >>  drivers/gpu/drm/tilcdc/tilcdc_drv.c            |  3 +--
> >>  drivers/gpu/drm/udl/udl_drv.c                  |  6 +-----
> >>  drivers/gpu/drm/vboxvideo/vbox_drv.c           |  6 ++----
> >>  include/drm/drm_fb_helper.h                    |  5 +++--
> >>  13 files changed, 25 insertions(+), 45 deletions(-)
> >>
> >> --
> >> 2.26.0
> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
