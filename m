Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7FD27ABD3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 12:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A592A89F77;
	Mon, 28 Sep 2020 10:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBF489F77
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 10:33:30 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 297B58051F;
 Mon, 28 Sep 2020 12:33:26 +0200 (CEST)
Date: Mon, 28 Sep 2020 12:33:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/rockchip: Include <drm/drm_gem_cma_helper> for
 drm_gem_cm_vm_ops
Message-ID: <20200928103324.GA634445@ravnborg.org>
References: <20200928081643.8575-1-tzimmermann@suse.de>
 <20200928084019.GA625010@ravnborg.org>
 <7e928cd3-d185-065d-40de-1541b08d2ec4@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e928cd3-d185-065d-40de-1541b08d2ec4@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=zd2uoN0lAAAA:8
 a=s8YR1HE3AAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=BVKix5vYCW0Mtb0Nrh8A:9
 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
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
Cc: kernel test robot <lkp@intel.com>, airlied@linux.ie,
 Daniel Vetter <daniel.vetter@ffwll.ch>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 10:48:31AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 28.09.20 um 10:40 schrieb Sam Ravnborg:
> > Hi Thomas.
> > On Mon, Sep 28, 2020 at 10:16:43AM +0200, Thomas Zimmermann wrote:
> >> Include <drm/drm_gem_cma_helper.h> to get drm_gem_cma_vm_ops. Fallout
> >> from the recent conversion to GEM object functions.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Fixes: 0d590af3140d ("drm/rockchip: Convert to drm_gem_object_funcs")
> > =

> > As this has only hit drm-misc-next and not pushed anywhere else there is
> > really no need for the Fixes: tag. At least thats my understanding.
> =

> I'm not sure what the upstream requirements are. As part of my dayjob, I
> maintain drivers for Suse distributions. If we pick the original patch,
> we also want the fixes. We have scripts that look for these Fixes tags
> to find the fixes. So it's helpful.
That makes sense, I will keep Fixes tags in the future also for
"internal" fixes then.

	Sam
> =

> > =

> > Otherwise the patch is equal to what I posted in the weekend so:
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> =

> Thanks
> =

> Best regards
> Thomas
> =

> > =

> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Cc: Christian K=F6nig <christian.koenig@amd.com>
> >> Cc: Sandy Huang <hjc@rock-chips.com>
> >> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-rockchip@lists.infradead.org
> >> ---
> >>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu=
/drm/rockchip/rockchip_drm_gem.c
> >> index 1cf4631461c9..7d5ebb10323b 100644
> >> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> >> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> >> @@ -10,6 +10,7 @@
> >>  =

> >>  #include <drm/drm.h>
> >>  #include <drm/drm_gem.h>
> >> +#include <drm/drm_gem_cma_helper.h>
> >>  #include <drm/drm_prime.h>
> >>  #include <drm/drm_vma_manager.h>
> >>  =

> >> -- =

> >> 2.28.0
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
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
