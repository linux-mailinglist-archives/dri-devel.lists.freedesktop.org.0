Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8815459041A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1E311B7F0;
	Thu, 11 Aug 2022 16:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FC511375E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:46:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n4so20205019wrp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 09:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=MsiIfGZtqnj82WtdxEIy2x+sk2Oec4YyNFcl2flkh+I=;
 b=Z5zIk7qYWbK54y3TZPpi4dU44U+mE0zjCVIACY2ZP5Wr5XeRjfnx2imOunkaI4odFW
 o0VihYHGXIU8lNFnXyEzG0FajB1q9laWTUXYUskpmqf1HEgDPCxlvhjTFxJB333OmAhu
 iQibouoJARRr8xZmchbSCjaaA9VApkAtgdBeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=MsiIfGZtqnj82WtdxEIy2x+sk2Oec4YyNFcl2flkh+I=;
 b=Lv2KF9092/6siGmB7w63x/qej9Z6zkwVWeVO81X/IAZ0ey2Ks+aSOp4ipB0Kdw8Wvu
 IrLJeCYoqsNXooklOtusPwv8wXCkiunHmEbcH3iur7Ta8icbxL7sBEOr/MgeiLU5Xthl
 Uazirg4HOIRfsZRgAph0G/nEjPAuz2EjGiBDT9oJDRakoA0pzGolENcxj/0pg2Vvvdhn
 ZgeLU0ugkAh7+eeYLOToXG16rDHc29vaEJ2qQIHQMVj9/Ump8pDdBbPHhHffsf/h8UZW
 HnUJ4eHHeyurpRtq+KoJUSu4t1+b9+Cbf2IK7eFVIp2SoQ1uJorkDYsk9cXexeFgkPaB
 LV2g==
X-Gm-Message-State: ACgBeo0nSfU8PLz+nAcp8KajpkIJgG4wLfeqs+LQjcyCttSTJ6c8KkBm
 3sAGv+v1dYekIWMUmpETsFBDOg==
X-Google-Smtp-Source: AA6agR7/4Va804iR5OB8hhG8MHokzBOxpFwpBYSZNIbHg4I1Zr2mFXyPlRrqcK0SJ2QD6lDGy3ziTw==
X-Received: by 2002:a5d:5581:0:b0:20f:fc51:7754 with SMTP id
 i1-20020a5d5581000000b0020ffc517754mr21457387wrv.413.1660236367371; 
 Thu, 11 Aug 2022 09:46:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y13-20020adfdf0d000000b0021f0ff1bc6csm19541228wrl.41.2022.08.11.09.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:46:06 -0700 (PDT)
Date: Thu, 11 Aug 2022 18:46:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 7/7] drm/fsl-dcu: Use drm_plane_helper_destroy()
Message-ID: <YvUyTNLUDTwBe9eD@phenom.ffwll.local>
References: <20220720083058.15371-1-tzimmermann@suse.de>
 <20220720083058.15371-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720083058.15371-8-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: airlied@linux.ie, alison.wang@nxp.com, linux@armlinux.org.uk,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 20, 2022 at 10:30:58AM +0200, Thomas Zimmermann wrote:
> Replace the driver's own function with drm_plane_helper_destroy(). No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Somewhat aside, but the real fix here is switching over to the drmm
versions of this. As long as all you're doing is cleanup+kfree those
should be safe, even if the driver overall is not converted at all.

Well ok I think you need to minimally convert over to
drmm_mode_config_init(), otherwise things go boom.

Quick grep says we don't have _destroy() helpers for anything else, so
this plane helper here is very much the odd one out, not sure spreading it
is a good idea. Maybe some todo at least?
-Daniel

> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
> index e4f518e44945..3b20e79158c8 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  
>  #include "fsl_dcu_drm_drv.h"
> @@ -170,16 +171,10 @@ static const struct drm_plane_helper_funcs fsl_dcu_drm_plane_helper_funcs = {
>  	.atomic_update = fsl_dcu_drm_plane_atomic_update,
>  };
>  
> -static void fsl_dcu_drm_plane_destroy(struct drm_plane *plane)
> -{
> -	drm_plane_cleanup(plane);
> -	kfree(plane);
> -}
> -
>  static const struct drm_plane_funcs fsl_dcu_drm_plane_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> -	.destroy = fsl_dcu_drm_plane_destroy,
> +	.destroy = drm_plane_helper_destroy,
>  	.disable_plane = drm_atomic_helper_disable_plane,
>  	.reset = drm_atomic_helper_plane_reset,
>  	.update_plane = drm_atomic_helper_update_plane,
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
