Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9652C8780
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 16:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD546E4B6;
	Mon, 30 Nov 2020 15:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263BC6E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 15:16:06 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e25so6637356wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ucx6MzhFV1VQJU1fV/rdBniGURBhUXtQw/6DfZtc1GI=;
 b=TQoBMqQ0yKE/ZoBZ3T8IKyqYvXGOCGJIjRj+bnnE7gh5I913vY6NirXHHyECjDnVTO
 iu/6ggR82f5CGXnhUKCbLcFjR9WNM1Lv9qj9/0tOdHF7uET11pxmBQScosvE8nGozhha
 JQoDpAsDJbuNqy1bJkwFwmMAMu/2FbGb5dg/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ucx6MzhFV1VQJU1fV/rdBniGURBhUXtQw/6DfZtc1GI=;
 b=FdDERuBrYiESuUYFBRbX+e+UlkTPQcEJcyy1IST4PXA8J8wIyEnTL0uKm8NPP6q7kQ
 ii89g3SQOe80iwHZ2M1NLz9g6vFiLVWxUJuLVMl+wdizmey0TcwB7FA2rcXBYkbVaUtk
 ohIs29keacuIFxjcwaDnm9ogsbywe1fMgoW1cG1vYy4U6mZOuZi+TJ8zeUvpm3HWot96
 5xgVTIrzNu7o7XLpziaq/GNDvfXFbVMZ4DnONRjdsJEmCAyA7hIN61LuX88H4rbKI0hR
 wIIJlLT4km2kSWT2QFTvYri6TMlFSLxwW7Irqu99x4+SsXCEDwYcCjQaWf7sLNNTADpo
 e2zA==
X-Gm-Message-State: AOAM532sMNGbyL1dJttVRZA+lCvxDwWS3oKpMkiD1123C3LWh6XiOhMJ
 lowPh9umzOXOHr9hzmkcf/0d+w==
X-Google-Smtp-Source: ABdhPJzojR0OEbodUOEmELkZbBiBvcljhY3o/dACYNObPhHemaLB7ahOB6NFdcQOVT5KAGv5dYGeBQ==
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr23900200wmd.61.1606749364503; 
 Mon, 30 Nov 2020 07:16:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 21sm14382370wme.0.2020.11.30.07.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:16:03 -0800 (PST)
Date: Mon, 30 Nov 2020 16:16:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document that user-space should force-probe
 connectors
Message-ID: <20201130151601.GR401619@phenom.ffwll.local>
References: <PMgUyeZTj1TlgnS4s5MIkNFDuGbth7EfFW73Gq2fQ@cp4-web-038.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PMgUyeZTj1TlgnS4s5MIkNFDuGbth7EfFW73Gq2fQ@cp4-web-038.plabs.ch>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 09:08:23AM +0000, Simon Ser wrote:
> It seems like we can't have nice things, so let's just document the
> disappointing behaviour instead.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Fixes: 2ac5ef3b2362 ("drm: document drm_mode_get_connector")
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index b49fbf2bdc40..2e99f29d7f81 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -414,15 +414,10 @@ enum drm_mode_subconnector {
>   *
>   * If the @count_modes field is set to zero, the kernel will perform a forced
>   * probe on the connector to refresh the connector status, modes and EDID.
> - * A forced-probe can be slow and the ioctl will block. A force-probe can cause
> - * flickering and temporary freezes, so it should not be performed
> - * automatically.
> + * A forced-probe can be slow and the ioctl will block.

I think we should still have a notice here along the lines of "without a
reason". Some compositors have done polling every 30s or other dumb stuff
like that "A forced-probe should not be done without a need like a hotplug
event from the kernel, explicit request for output probing from the user,
or when starting the compositor."

Also I'd keep the "can be slow, might cause flickering, and the ioctl will
block" or so.

>   *
> - * User-space shouldn't need to force-probe connectors in general: the kernel
> - * will automatically take care of probing connectors that don't support
> - * hot-plug detection when appropriate. However, user-space may force-probe
> - * connectors on user request (e.g. clicking a "Scan connectors" button, or
> - * opening a UI to manage screens).
> + * User-space needs to force-probe connectors to ensure their metadata is
> + * up-to-date.

I'd add a "after receiving a hotplug event" here.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>   */
>  struct drm_mode_get_connector {
>  	/** @encoders_ptr: Pointer to ``__u32`` array of object IDs. */
> -- 
> 2.29.2
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
