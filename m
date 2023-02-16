Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C735699D28
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 20:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC4510E372;
	Thu, 16 Feb 2023 19:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E80A10E372
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 19:48:14 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso5119898wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SRA1G/DmUcHToOaDMqKdvCTBThydLs2V2NqUqvxvwmY=;
 b=ON7vzW1djzc9Oys/fu8MZDZhuHdvZNtCFfF9iHe/NZlrNWG9LLcG9zmebbYk64s3wt
 9CNfeKELL+gvAi08KNVJ1U+2O+9y3kcH1WL8xnMpw9fcN42l8kAKY+SAF7Fjvigc2av7
 Wshq4TaND8EkJX9zak5DT0Oddtyrfnw4Ocgww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRA1G/DmUcHToOaDMqKdvCTBThydLs2V2NqUqvxvwmY=;
 b=fR4f+AeDWpv/9LKHaNS4gvgMplgn+CYdKEHbju2B2iqO0BmbHB9q20lONK5lSPhnny
 rohRVbQfRHL6uOfvQvdxpHcXhHDQDkI63Zmf8Op/sNVWy/3dgj61PHkjmF1v6BxRHWOP
 wBZSJfgp+m303ffcf04611wSGz4TtEoq6ggiwEhisddYEN8KRDNlZChzykERXjEuTPJA
 YGMAedj/q528hI3wHUaIqaIm5Z3nucQ4PXYYGVQye3iJG1qt3YFgs1ys/U/kO/LlOM9/
 FEO6kuo/L7nKoaSnNo3f61gdZPkd26PyM6PKschWXE5xCa04RC3EmdBwDhrBvFHd7hfb
 7kWg==
X-Gm-Message-State: AO0yUKXftE4mCT264J/R+jZqEPH97CM37cfd6lNAuGvN/MriuuCggnCq
 29vTmPDRYkHnkw1ASzuIiRMvhg==
X-Google-Smtp-Source: AK7set/WWHa/gGtclI2mCaExhTfl4pMWh6tU2PPWpa6Mp+2KFajXHmLWZAyy42FUdxgDUOX8DB5ipg==
X-Received: by 2002:a05:600c:4f46:b0:3db:2922:2b99 with SMTP id
 m6-20020a05600c4f4600b003db29222b99mr6848579wmq.4.1676576893286; 
 Thu, 16 Feb 2023 11:48:13 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c21c900b003e11ad0750csm2698390wmj.47.2023.02.16.11.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 11:48:12 -0800 (PST)
Date: Thu, 16 Feb 2023 20:48:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm: document DRM_IOCTL_GEM_CLOSE
Message-ID: <Y+6IdQz1MNj9k+8K@phenom.ffwll.local>
References: <20230216130934.156541-1-contact@emersion.fr>
 <20230216130934.156541-2-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216130934.156541-2-contact@emersion.fr>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 01:09:45PM +0000, Simon Ser wrote:
> This is a bit tricky, because of the ref'counting considerations.
> See also [1] for more discussion about this topic. Since this is
> kernel docs, I've decided to elaborate a bit less on the user-space
> details.
> 
> [1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> ---
>  include/uapi/drm/drm.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 54b2313c8332..4829f1fa9570 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -972,6 +972,19 @@ extern "C" {
>  #define DRM_IOCTL_GET_STATS             DRM_IOR( 0x06, struct drm_stats)
>  #define DRM_IOCTL_SET_VERSION		DRM_IOWR(0x07, struct drm_set_version)
>  #define DRM_IOCTL_MODESET_CTL           DRM_IOW(0x08, struct drm_modeset_ctl)
> +/**
> + * DRM_IOCTL_GEM_CLOSE - Close a GEM handle.
> + *
> + * GEM handles are not reference-counted by the kernel. User-space is
> + * responsible for managing their lifetime. For example, if user-space imports
> + * the same memory object twice on the same DRM file description, the same GEM
> + * handle is returned by both imports, and user-space needs to ensure
> + * &DRM_IOCTL_GEM_CLOSE is performed once only. The same situation can happen
> + * when a memory object is allocated, then exported and imported again on the
> + * same DRM file description. The &DRM_IOCTL_MODE_GETFB2 IOCTL is an exception
> + * and always returns fresh new GEM handles even if an existing GEM handle
> + * already refers to the same memory object before the IOCTL is performed.

I'd duplicate the relevant parts into each ioctl doc too, just to increase
the chances people notice these caveats. But that's stuf for these other
patches. for this one:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

btw do the links from on ioctl text to the other work?
-Daniel

> + */
>  #define DRM_IOCTL_GEM_CLOSE		DRM_IOW (0x09, struct drm_gem_close)
>  #define DRM_IOCTL_GEM_FLINK		DRM_IOWR(0x0a, struct drm_gem_flink)
>  #define DRM_IOCTL_GEM_OPEN		DRM_IOWR(0x0b, struct drm_gem_open)
> -- 
> 2.39.1
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
