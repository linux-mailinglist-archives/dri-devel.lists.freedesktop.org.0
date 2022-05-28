Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2671536E51
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 22:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D381610F6AC;
	Sat, 28 May 2022 20:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C6B10F6AB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 20:17:59 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id r84so8075701qke.10
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 13:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UW6Y4vJiidlHWFIwlmPdp6Tw0q2d8acxVjTk7ACvPCk=;
 b=UqpHCo3BvZdYN3YglEmA0Em/o5OC1fErmSbrKry0pbuMAHuvli0eYegM46bPM/Q+L9
 C0k4v3/OR+sRUIrUMkVP3O6HAP7KfA2qzCYu4esas5CydOUnm6h42VwC9fUEBQtVseSR
 ri1fAdLdA88YQ0/aqQvDo4l5iVGkF0sab7iy2wi5CuzAHce3Xr4Qv5u5WHAtAb9ZDNXL
 5u2jR75DtUTrdZWvO1XSTmMIK1l30K8IyQuQ0oX9BlVDENi/0z8OLwi0Lif2Ae77zXOc
 NR041XExXl+n7hogoYQcWIfjPpoVFksZlCGy3nF5Nq3cl+hvn+oxtLZozKKYl52XWiEq
 lJqQ==
X-Gm-Message-State: AOAM533IATqJJNrSncRflLQhqtjidxGDEZuKSTknYYvTz/zdeIJOXc9I
 CjxhfbRDfDM/2a1TLyR63DqVgz8TIj4GaQ==
X-Google-Smtp-Source: ABdhPJw3oL4z818CMSFTwwKeP/ytoSBDQ0qH9p+a8Y64pzbKj33WRfpKNY5Wu3+0vfiz+qUIWMbGXQ==
X-Received: by 2002:a05:620a:4404:b0:6a0:51e5:ee72 with SMTP id
 v4-20020a05620a440400b006a051e5ee72mr33192679qkp.121.1653769078491; 
 Sat, 28 May 2022 13:17:58 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05622a034d00b002fc12020a1esm5007010qtw.80.2022.05.28.13.17.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 May 2022 13:17:57 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-2ef5380669cso76881377b3.9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 13:17:57 -0700 (PDT)
X-Received: by 2002:a81:6c05:0:b0:30c:18f5:d2b0 with SMTP id
 h5-20020a816c05000000b0030c18f5d2b0mr3886464ywc.502.1653769077224; Sat, 28
 May 2022 13:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-10-tzimmermann@suse.de>
In-Reply-To: <20191014140416.28517-10-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 28 May 2022 22:17:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9p7KUy3WEFox9KgZBHGZGNO2y5m8tLVbzGGVHu2iNYQ@mail.gmail.com>
Message-ID: <CAMuHMdU9p7KUy3WEFox9KgZBHGZGNO2y5m8tLVbzGGVHu2iNYQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] drm/fbconv: Mode-setting pipeline enable /
 disable
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 michel@daenzer.net, Jonathan Corbet <corbet@lwn.net>,
 Mathieu Malaterre <malat@debian.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Oct 14, 2019 at 4:05 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> The display mode is set by converting the DRM display mode to an
> fb_info state and handling it to the fbdev driver's fb_setvar()
> function. This also requires a color depth, which we take from the
> value of struct drm_mode_config.preferred_depth
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

> --- a/drivers/gpu/drm/drm_fbconv_helper.c
> +++ b/drivers/gpu/drm/drm_fbconv_helper.c
> @@ -919,6 +919,24 @@ static int drm_fbconv_update_fb_var_screeninfo_from_framebuffer(
>         return 0;
>  }
>
> +static int drm_fbconv_update_fb_var_screeninfo_from_simple_display_pipe(
> +       struct fb_var_screeninfo *fb_var, struct drm_simple_display_pipe *pipe)
> +{
> +       struct drm_plane *primary = pipe->crtc.primary;
> +       struct drm_fbconv_modeset *modeset = drm_fbconv_modeset_of_pipe(pipe);
> +
> +       if (primary && primary->state && primary->state->fb)
> +               return drm_fbconv_update_fb_var_screeninfo_from_framebuffer(
> +                       fb_var, primary->state->fb,
> +                       modeset->fb_info->fix.smem_len);
> +
> +       fb_var->xres_virtual = fb_var->xres;
> +       fb_var->yres_virtual = fb_var->yres;
> +       fb_var->bits_per_pixel = modeset->dev->mode_config.preferred_depth;

This looks wrong to me: IMHO bits_per_pixel should be derived from
the fourcc format of the _new_ mode to be set...

> +
> +       return 0;
> +}
> +
>  /**
>   * drm_fbconv_simple_display_pipe_mode_valid - default implementation for
>   *     struct drm_simple_display_pipe_funcs.mode_valid
> @@ -950,6 +968,28 @@ bool drm_fbconv_simple_display_pipe_mode_fixup(
>         struct drm_crtc *crtc, const struct drm_display_mode *mode,
>         struct drm_display_mode *adjusted_mode)
>  {
> +       struct drm_simple_display_pipe *pipe =
> +               container_of(crtc, struct drm_simple_display_pipe, crtc);
> +       struct drm_fbconv_modeset *modeset = drm_fbconv_modeset_of_pipe(pipe);
> +       struct fb_var_screeninfo fb_var;
> +       int ret;
> +
> +       if (!modeset->fb_info->fbops->fb_check_var)
> +               return true;
> +
> +       drm_fbconv_init_fb_var_screeninfo_from_mode(&fb_var, mode);
> +
> +       ret = drm_fbconv_update_fb_var_screeninfo_from_simple_display_pipe(
> +               &fb_var, &modeset->pipe);
> +       if (ret)
> +               return true;
> +
> +       ret = modeset->fb_info->fbops->fb_check_var(&fb_var, modeset->fb_info);

... hence this fails if the requested mode is valid with the new
fourcc format, but invalid with the old (but preferred) depth.
E.g. due to bandwidth limitations, a high-resolution mode is valid
with a low color depth, while a high color depth is limited to lower
resolutions.

Unfortunately we do not know the new fourcc format here, as both
drm_simple_display_pipe_funcs.mode_{valid,fixup}() are passed
the mode (from drm_mode_set.mode), but not the new format (from
drm_mode_set.fb->format).

Am I missing something? Is the new format available in some other way?
Thanks!

> +       if (ret < 0)
> +               return false;
> +
> +       drm_mode_update_from_fb_var_screeninfo(adjusted_mode, &fb_var);
> +
>         return true;
>  }
>  EXPORT_SYMBOL(drm_fbconv_simple_display_pipe_mode_fixup);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
