Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606575AF476
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77CC10E194;
	Tue,  6 Sep 2022 19:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A4010E194
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:33:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b5so16969337wrr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=HbHLG70UmLtGR8mHDZUxxp+bzLPchRix1BO7BipF8lk=;
 b=BW67QFA+r+Jmwen3wT684O2NiBqIp1dM1qGhN44EtS5Ru+B98pKBG/Gob9Lnsg5qT9
 jgw0j0Pbcr6XGkj4IV9Pja+0hfrlHm2FlSwEMYtUy8qprtlvFiGC9AsrfSb9uO9Q64gK
 hbN6s/0oeV/LxOFvii/r4h+kDxu/QCRknVP8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=HbHLG70UmLtGR8mHDZUxxp+bzLPchRix1BO7BipF8lk=;
 b=TQO3mu9pBv7BiEvwbMyP+Te1lSfPzMfPFzk8A8PIk33O3z1+8aNsRzSEUXVgP2f8kg
 XJBj2g+45nu16J/VDTmVXkcvdxRITboqmVyJa8tBTHCAdRS8ucD+FTlRo69NTBU/fChh
 jPIYRXjPgWESuIRvo3OWH8YzJ/ichoJxCnuWYD/pdXg+882r2r34YKEAbiLF+sb6D+Ch
 nZ5jT3/PM7BuMdwQ1adW/EOartgi4cOk31FrCNz1ptqVGk/C7M3FtqZplfyF+TmsNsES
 nhRhOaj+trlImxZ+brlHYQEAxf56Wo3ouKcrwa2C3t0CnKejLAXb7fLMWnK1h6TgmEK0
 9neg==
X-Gm-Message-State: ACgBeo2SfknShYgfN9RJtYAwYRjQjxIZkJOEEbYlH7gIP56/L27TcTpr
 q8J2V6mVsnLZg2/3Rcbc/nMfpQ==
X-Google-Smtp-Source: AA6agR4gzLaC0G/Q6mOA0auz/RCq1TcagOirT+ub2CK2UZA2lDoLJZSmUM8b4NYxfSzF8GGkugAZ8Q==
X-Received: by 2002:adf:a3c2:0:b0:228:64c2:6c5c with SMTP id
 m2-20020adfa3c2000000b0022864c26c5cmr13686wrb.674.1662492811689; 
 Tue, 06 Sep 2022 12:33:31 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 p4-20020a5d48c4000000b00225239d9265sm13381950wrs.74.2022.09.06.12.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:33:31 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:33:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/udl: Restore display mode on resume
Message-ID: <YxegiQFAv+OWjjqE@phenom.ffwll.local>
References: <20220728073109.5640-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728073109.5640-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: airlied@linux.ie, airlied@redhat.com, sean@poorly.run,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 09:31:09AM +0200, Thomas Zimmermann wrote:
> Restore the display mode whne resuming from suspend. Currently, the
> display remains dark.
> 
> On resume, the CRTC's mode does not change, but the 'active' flag
> changes to 'true'. Taking this into account when considering a mode
> switch restores the display mode.
> 
> The bug is reproducable by using Gnome with udl and observing the
> adapter's suspend/resume behavior.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_modeset.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index e67c40a48fb4..bf17f38fdb54 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2009 Bernie Thompson <bernie@plugable.com>
>   */
>  
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_damage_helper.h>
> @@ -382,7 +383,7 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
>  
>  	udl_handle_damage(fb, &shadow_plane_state->data[0], 0, 0, fb->width, fb->height);
>  
> -	if (!crtc_state->mode_changed)
> +	if (!drm_atomic_crtc_needs_modeset(crtc_state))
>  		return;

The helpers shouldn't even call you in this case. Which means you
should outright remove this check. I think this simple dates back to the
old legacy crtc helper implementation, where stuff like this was necessary
because the crtc helpers just loved to disable you multiple times.

Looking at git history this seems to have been a regression introduced by 
997d33c35618 ("drm/udl: Inline DPMS code into CRTC enable and disable functions")

So you need cc: stable here and all that. And before this change there was
no such check either, so we don't need to backport if further.

Since this seems to have been stuck for a while here's my upfront

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

for v2 with all these changes applied.
-Daniel

>  
>  	/* enable display */
> -- 
> 2.37.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
