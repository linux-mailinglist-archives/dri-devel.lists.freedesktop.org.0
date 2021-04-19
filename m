Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B8E36425B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 15:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A146E30C;
	Mon, 19 Apr 2021 13:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBCF6E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 13:08:54 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AU6j+jqpTWzpVRm8IclErCfkaV5vcL9V00zAX?=
 =?us-ascii?q?/kB9WHVpW+afkN2jm+le6A/shF8qKRcdsP2jGI3Fe3PT8pZp/ZIcVI3PYCDKsH?=
 =?us-ascii?q?alRbsC0aLM2Dvlchefysd49YNNN5dzE8fxC18St6jHyS21CcwpztXC0I3Av5a7?=
 =?us-ascii?q?815XQQtna75t4m5CY27xeCJLbTNbDpk0Hof03LskmxOcfx0sH6eGL0UeU/OGj9?=
 =?us-ascii?q?PGk4+OW29iOzcXrCGIkDOB46LhH3Gjr25uK0I1sM1SjFTtokjQ+rijteq61w+Z?=
 =?us-ascii?q?7GPa9ZJQ8eGN9vJzQOezi8gJJjDtkBvAXvUcZ5Sy+BwwqOGrrHwtjN7Qyi1QSP?=
 =?us-ascii?q?hb2jf8b2Gw5TvBsjOQoQoG2jvGz1WRhD/Pp8jwRDVSMbsJuatpNiHU7Ectp7hH?=
 =?us-ascii?q?ocV29lPcjZxKFhnN9R6Nl+TgZlVRkFauq3ZnufUclRVkIPgjQY4Ul4oC50lYVL?=
 =?us-ascii?q?8dASOS0vFSLMBeSPvb+O1dfRexZ2mxhBgY/PWcGk40AgyNTgwuutf96UkloFlJ?=
 =?us-ascii?q?i3Ef2NcUkjMhzfsGOuZ5ztWBCKJ1j7tDCup+V9MCOM4xBfGwFnfGTVb3PGWeLU?=
 =?us-ascii?q?+PLtBzB07w?=
X-IronPort-AV: E=Sophos;i="5.82,234,1613430000"; d="scan'208";a="379061576"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 15:08:52 +0200
Date: Mon, 19 Apr 2021 15:08:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH 1/2] drm/amd/amdgpu/amdgpu_device.c:
 Replace drm_modeset_*_all with DRM_MODESET_LOCK_ALL_*
In-Reply-To: <20210419122059.738-2-fmdefrancesco@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104191506110.16374@hadrien>
References: <20210419122059.738-1-fmdefrancesco@gmail.com>
 <20210419122059.738-2-fmdefrancesco@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, outreachy-kernel@googlegroups.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Mon, 19 Apr 2021, Fabio M. De Francesco wrote:

> Replace the deprecated API with new helpers, according to the TODO list
> of the DRM subsystem.

The commit message will perhaps not be very meaningful one year from now.
You could say for example DRM_MODESET_LOCK_ALL_BEGIN was introduced in
commit XXX (there is a proper format for referring to other commits) for
what purpose.  And then say that you are making the replacement.

Actually, I'm a little surprised to see something that looks like a
function call be replaced by something that looks like a macro.  Maybe it
was a macro all along, and this is just making that more clear.  In any
case, if I were to look at this commit, I would appreciate a little more
context information.

julia

>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 6447cd6ca5a8..e1a71579f8e6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -32,6 +32,7 @@
>  #include <linux/slab.h>
>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/amdgpu_drm.h>
>  #include <linux/vgaarb.h>
> @@ -3694,14 +3695,17 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>
>  	if (!amdgpu_device_has_dc_support(adev)) {
>  		/* turn off display hw */
> -		drm_modeset_lock_all(dev);
> +		struct drm_modeset_acquire_ctx ctx;
> +		int ret;
> +
> +		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  		drm_connector_list_iter_begin(dev, &iter);
>  		drm_for_each_connector_iter(connector, &iter)
>  			drm_helper_connector_dpms(connector,
>  						  DRM_MODE_DPMS_OFF);
>  		drm_connector_list_iter_end(&iter);
> -		drm_modeset_unlock_all(dev);
> -			/* unpin the front buffers and cursors */
> +		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> +		/* unpin the front buffers and cursors */
>  		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>  			struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
>  			struct drm_framebuffer *fb = crtc->primary->fb;
> @@ -3830,19 +3834,21 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
>  	/* blat the mode back in */
>  	if (fbcon) {
>  		if (!amdgpu_device_has_dc_support(adev)) {
> +			struct drm_modeset_acquire_ctx ctx;
> +			int ret;
> +
>  			/* pre DCE11 */
>  			drm_helper_resume_force_mode(dev);
>
>  			/* turn on display hw */
> -			drm_modeset_lock_all(dev);
> +			DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>
>  			drm_connector_list_iter_begin(dev, &iter);
>  			drm_for_each_connector_iter(connector, &iter)
>  				drm_helper_connector_dpms(connector,
>  							  DRM_MODE_DPMS_ON);
>  			drm_connector_list_iter_end(&iter);
> -
> -			drm_modeset_unlock_all(dev);
> +			DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  		}
>  		amdgpu_fbdev_set_suspend(adev, 0);
>  	}
> --
> 2.31.1
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20210419122059.738-2-fmdefrancesco%40gmail.com.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
