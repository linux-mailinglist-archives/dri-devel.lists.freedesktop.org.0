Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0511945E7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 18:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40166E218;
	Thu, 26 Mar 2020 17:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0852B6E218
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 17:55:48 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id d3so1737685oic.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 10:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kyyRkqAa4GLrD/JWrAE8IcDWLxdG+0fyjlLtBcjZDlA=;
 b=gc8EH6aFyvPMr3V/iPORTpE3wrPAbuNXDxcJPfvFJC8P3ksvi4h853gyiCd+XzS+Gc
 s7EqJZggkDBmk/hgRKW7En+sMFomvAxI56QeF1rHzOVqzK2RRfSJsAVlwn4NRPOq0QBu
 C4iXgUa4EpkKyLqFwOFXXVdm6lHBUBRqRBewQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kyyRkqAa4GLrD/JWrAE8IcDWLxdG+0fyjlLtBcjZDlA=;
 b=C+35t5sC/Ptbwh2Tpo4Q4glY6bX+hemoW7Na7rk3Sav29Qr/okORBNpOShrEtUMgn0
 ywxgK41jGpWgU5eNV0P3osthIuUOMTk5y9krNVKdNI65DIs8JuQNw4FxE7koudZyRtxo
 rj4HhUndMD1jtEcg03PUtqhnD7vsgQJgwRXDdLTL+ZcOdNR4gErqbW62QP6WGsJG+SmN
 zt+BodpZemeHnshLFIXHGks46kl0Q0cHM4l9BjzABHCxKv48dpQDh3fAh7eAtTw//3+P
 9Csed5yqNthJnQiQUNhXFLvxOo5ECbNJp+q/P6UhhZw9bGtsU4jNGDdP6KrYvAkz/dw0
 Mp9w==
X-Gm-Message-State: ANhLgQ2HdAYK+2FX5XMZdwjiTTeKSufigTI8Z/V1WM91R4HTtboljRq0
 L37s25u9A4TaJPflbYZ4J3dW4xB2SBUKKXfLZ/9v6Q==
X-Google-Smtp-Source: ADFU+vuZKSVe/lJQBo/YrzYyzYxSgkXT/HvDv1T6mmgb4NVEaT6Tb8KbyKMQZJIn4Gde/MxJhA62YIhQmxja4ifQ2KU=
X-Received: by 2002:aca:be08:: with SMTP id o8mr979021oif.101.1585245347281;
 Thu, 26 Mar 2020 10:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200326151009.102377-1-hdegoede@redhat.com>
In-Reply-To: <20200326151009.102377-1-hdegoede@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 26 Mar 2020 18:55:36 +0100
Message-ID: <CAKMK7uFgyt_LD7wSTDB-LdaW_cc9Ge12DY8kWxeL_dS4Q4deOQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fb-helper: Add TODO for making drm_fb_helper_alloc_fbi
 fill apertures
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 4:10 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Currently drivers using drm_fbdev_generic_setup() end up with a single
> empty aperture in their fb_info struct.
>
> Not having the proper info in the apertures list causes
> register_framebuffer to not remove conflicting framebuffers,
> which some drivers currently workaround by manually calling
> drm_fb_helper_remove_conflicting_pci_framebuffers().
>
> Add a TODO as a reminder that we need to fix this.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 4c7cbce7bae7..16b8dc38d022 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -526,6 +526,14 @@ struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
>         if (ret)
>                 goto err_release;
>
> +       /*
> +        * TODO: We really should be smarter here and alloc an apperture
> +        * for each IORESOURCE_MEM resource helper->dev->dev has and also
> +        * init the ranges of the appertures based on the resources.
> +        * Note some drivers currently count on there being only 1 empty
> +        * aperture and fill this themselves, these will need to be dealt
> +        * with somehow when fixing this.
> +        */

Ah yes this is a bit more involved than first apperances suggest - we
might want to have a dedicated solution for the generic_setup helper
only, so we don't break all the other drivers using this function
directly.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>         info->apertures = alloc_apertures(1);
>         if (!info->apertures) {
>                 ret = -ENOMEM;
> --
> 2.26.0.rc2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
