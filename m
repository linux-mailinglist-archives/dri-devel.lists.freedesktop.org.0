Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F1114A122
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 10:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818076EAA1;
	Mon, 27 Jan 2020 09:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696AB6EAA2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 09:47:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f129so6289229wmf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 01:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H6zmf5XzCvSMH9uJ4yak9/j0gn5TwDDcpXp+N0GvNHo=;
 b=NCVXrrNnL4lyVfhwYABdKDq/2VD10nrlZBZBe3FObKCZRT96shMvVvzOJki+O6QtFg
 EKMM/rhgc7ZN20P1bLv7MEUldvDF0nYx4fyp8ccghH1u5knbG0v2iyAdYmGsO25VEy0S
 RJq/xEMeFTyMCmxFJhlZ+YoWpubcwcOCzrldM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H6zmf5XzCvSMH9uJ4yak9/j0gn5TwDDcpXp+N0GvNHo=;
 b=lhVEH55/ZvDfNRto8OetpieTFPXVVTCI2L2zCiN3KLCGA5dE6h4qwCOf/sp9b7C2sf
 cI7Q3I8DrKyWEn1miEN3fGs6rHgAwvDzygBCsfxlT7dann2ZW0uLO36YCfeGK5SXQI+9
 yZ/LiEsaoPBfjlNZuEQ8PzS9hJORvMWI2pTM4aNCqeYxPd4lsq/jfMtVtYI/Oai9KU3c
 egglW5uiPOyMcuv2vrhyO0ih86PW6sjtNNxNUNR1/fApKSlQVh1Jxvy20hoj8HCM6xU3
 Xxag+QImW/2M3FY9Pjx2iWdGHT/CxJixPw04r0SeRYhVIkdJJIrWMF6ro93gGw0n3Uy9
 M6pA==
X-Gm-Message-State: APjAAAWLF1bcyT2ugBik7kvNYpG2m8t08dp5xD9j7R6JbCdbr9YOU4jk
 eDTmltouxMmDmXvHM1mnG+H5RQ==
X-Google-Smtp-Source: APXvYqxiuy6Py0Q5jzlpt7uYzU5B7HYSxIB1lnaCN0G0+kt5/J1oUyOyFtRJvmBLfiSE5JdJs4h2WA==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr5128572wme.129.1580118464074; 
 Mon, 27 Jan 2020 01:47:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x10sm19636740wrv.60.2020.01.27.01.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 01:47:43 -0800 (PST)
Date: Mon, 27 Jan 2020 10:47:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 15/15] drm/xen: Explicitly disable automatic sending
 of vblank event
Message-ID: <20200127094741.GA43062@phenom.ffwll.local>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-16-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123092123.28368-16-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 kraxel@redhat.com, xen-devel@lists.xenproject.org, emil.velikov@collabora.com,
 sean@poorly.run, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 10:21:23AM +0100, Thomas Zimmermann wrote:
> The atomic helpers automatically send out fake VBLANK events if no
> vblanking has been initialized. This would apply to xen, but xen has
> its own vblank logic. To avoid interfering with the atomic helpers,
> disable automatic vblank events explictly.
> 
> v4:
> 	* separate commit from core vblank changes
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

On all the driver patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/xen/xen_drm_front_kms.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> index 4f34c5208180..efde4561836f 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> @@ -220,6 +220,18 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
>  	return false;
>  }
>  
> +static int display_check(struct drm_simple_display_pipe *pipe,
> +			 struct drm_plane_state *plane_state,
> +			 struct drm_crtc_state *crtc_state)
> +{
> +	/* Make sure that DRM helpers don't send VBLANK events
> +	 * automatically. Xen has it's own logic to do so.
> +	 */
> +	crtc_state->no_vblank = false;

So this here is strictly speaking dead code, because the fake_vblank
helper makes sure to only send out the event if it hasn't been processed
yet.

Which is a bit awkward, since it does this silently, potentially hiding
bugs. We already have a warning that complains if a crtc_state->event
hasn't been processed at all. But with the auto-vblank stuff here we kinda
defeat that a bit ... I think adding a WARN_ON in fake_vblank that fires
if no_vblank is set, but the event is somehow gone, would be really
useful. That would point at some serious driver snafu ...

Care to throw that on top?
-Daniel

> +
> +	return 0;
> +}
> +
>  static void display_update(struct drm_simple_display_pipe *pipe,
>  			   struct drm_plane_state *old_plane_state)
>  {
> @@ -284,6 +296,7 @@ static const struct drm_simple_display_pipe_funcs display_funcs = {
>  	.enable = display_enable,
>  	.disable = display_disable,
>  	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.check = display_check,
>  	.update = display_update,
>  };
>  
> -- 
> 2.24.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
