Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B632F2BA717
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 11:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC42589B8F;
	Fri, 20 Nov 2020 10:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C715A89B98
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 10:09:52 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 92so5170856otd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 02:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0zFwPNPWTF3Sfy+s0FkmnYztDRPt0kZDla4N9SLoDyU=;
 b=k7JYMvS0youhIdsMAS5pBG5zaHirsNQ75qEtQHPCR9l2raPMwOLvvn7sCHzwaRAXpI
 PsMSxA02bcwcv5+UFKHHg61CPVNylDmqQutoqju7o+U0bemaZqJOKYB3tTv6zUlgQRGH
 cF3IUagMvyrcWZ5G3zD4k/1ZZqZRHCGvYOCbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0zFwPNPWTF3Sfy+s0FkmnYztDRPt0kZDla4N9SLoDyU=;
 b=FjyZ9QJVZcYE3qU41B+Ur1wn9lgf98qrWfiYx2MY7YWdf+wvbZYhhbFjK1Mftnekzk
 ftqP6bxGDIvfJSmr6O3PJtGgYCF0425ReXTZKQzsK4Ljt46wp6pjw77onBfnJBIvrqVA
 AbuMt/cu60p3wrT8+QySAGe/YxaYwHAJxb7iQfVeLh3QoMQjqz008QvOunwnAPbMI9sm
 KaJCi+dxKx+oAw9Oz9Ngag5O/Ja+Svk6JLoNq4p9JuA68VwBu4kmmGZ7Zodp5Q/6/1PV
 mRdciTavTrQxeE74zTXXc6XL91lsV9TY8EmSsRZzCLkAVRylJpM3ox2tO2brevfrF2bs
 Kdwg==
X-Gm-Message-State: AOAM531jZBqrByLOZUGH9G833ylewNb70Ku7yKZkphQkI8asfaqO5vxO
 h6z9Yy4s+M7zSzpaC7OFKbG0JfIFjLBfSfj8WkYxjbRz28c=
X-Google-Smtp-Source: ABdhPJygWFyOKKbBwaX3UqbnYsLdzX5fpZuXRu5wG+Z3bEnhGtlxKWPy67xVgRo0c0E5kVKdnY6Z3ZlQvV/qRM0Rh78=
X-Received: by 2002:a05:6830:3155:: with SMTP id
 c21mr13871976ots.281.1605866992176; 
 Fri, 20 Nov 2020 02:09:52 -0800 (PST)
MIME-Version: 1.0
References: <BBtyuxgs3DvcrMtbRyb7KBEWUviGy1dtWO61eB4@cp3-web-016.plabs.ch>
In-Reply-To: <BBtyuxgs3DvcrMtbRyb7KBEWUviGy1dtWO61eB4@cp3-web-016.plabs.ch>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 20 Nov 2020 11:09:40 +0100
Message-ID: <CAKMK7uEYx7UH3ztTQnimjsq4X2dFnQnG-yGJZBAto=NCvNfEoQ@mail.gmail.com>
Subject: Re: [PATCH] drm: document drm_mode_modeinfo
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 10:46 AM Simon Ser <contact@emersion.fr> wrote:
>
> This allows `struct drm_mode_modeinfo` references to be linkified.
>
> Some descriptions are borrowed from struct drm_display_mode.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/uapi/drm/drm_mode.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 3979389fcc4f..900b6f87d5c8 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -218,6 +218,24 @@ extern "C" {
>  #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
>  #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
>
> +/**
> + * struct drm_mode_modeinfo - Display mode information.
> + * @clock: pixel clock in kHz
> + * @hdisplay: horizontal display size
> + * @hsync_start: horizontal sync start
> + * @hsync_end: horizontal sync end
> + * @htotal: horizontal total size
> + * @hskew: horizontal skew
> + * @vdisplay: vertical display size
> + * @vsync_start: vertical sync start
> + * @vsync_end: vertical sync end
> + * @vtotal: vertical total size
> + * @vscan: vertical scan
> + * @vrefresh: approximate vertical refresh rate in Hz
> + * @flags: bitmask of misc. flags, see DRM_MODE_FLAG_* defines
> + * @type: bitmask of type flags, see DRM_MODE_TYPE_* defines
> + * @name: string describing the mode resolution

Since if you look at this following random links it's not clear this
is the uapi version.

So maybe add something like "This is the userspace API display mode
information structure. For the kernel version seee struct
drm_display_mode". And a similar comment in reverse in the
kernel-internal struct.

With that added: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + */
>  struct drm_mode_modeinfo {
>         __u32 clock;
>         __u16 hdisplay;
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
