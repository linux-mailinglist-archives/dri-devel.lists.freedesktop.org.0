Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD46537689
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 10:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA6F10E2FF;
	Mon, 30 May 2022 08:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1612110E2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 08:34:27 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id v29so10599146qtc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 01:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d8SPd3n38l95dEtxPv4gdTmZ3OWEYGAzL0sZiwgOqrc=;
 b=FSLM5aO+QTXPQneaGKxr63wRHcvoB7R/86FWzp7snGUP3Fw/LRGJpmQYgvFXKoBbcs
 D1QN5StRhMCkkUX+KyQJ5JGrLa8DZDIJk7LLKtFluMjEsv4Oyvd43HWW6EMnbXdEtfMd
 aM637/HYtuG/WO4h7zJEPxeju9W4MBdksQKJUytUXOkESrGC4ut5Z06yAbGo4v9SZk1S
 sowz+v3kzSaWlXNd9iFGg4CaRGpFlBl9Wgc3hcAAko5atycZRHIPR5+fj6ZOI3gdpuM/
 4b8vdOpAGsGPds8kFyyaJSMQ8tJELTHZmSH3Xh8LzX2lFccIpz/frGwUbTRJQd+tsUl/
 0mpA==
X-Gm-Message-State: AOAM533wBiPvthOC3MtKiidY+3n1CsJOsF9L92gIJSR7OGwjObJ6PRHY
 EFIPpwrLHbrRW4uYj6x9gAYOyvTGTiWSbA==
X-Google-Smtp-Source: ABdhPJyDG1ekFE0pUG2A6ToiY1vvhreyB9lchgVfEQVTlc6vjNBQkj83Kgew2kNnzZqUeDv0a8tERA==
X-Received: by 2002:ac8:5c51:0:b0:2f3:bc1a:4922 with SMTP id
 j17-20020ac85c51000000b002f3bc1a4922mr42337639qtj.560.1653899665883; 
 Mon, 30 May 2022 01:34:25 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 h8-20020a37c448000000b006a6278a2b31sm1953895qkm.75.2022.05.30.01.34.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 01:34:24 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id t31so4955826ybi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 01:34:23 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr52772984ybu.604.1653899663236; Mon, 30
 May 2022 01:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-10-tzimmermann@suse.de>
 <CAMuHMdU9p7KUy3WEFox9KgZBHGZGNO2y5m8tLVbzGGVHu2iNYQ@mail.gmail.com>
 <8b79b40b-9786-9ddf-0dc9-89efbab38c7f@suse.de>
In-Reply-To: <8b79b40b-9786-9ddf-0dc9-89efbab38c7f@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 May 2022 10:34:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7webJ0_R8uj=nagTHJY6viLGkhv2hmc9X48gwz1JDew@mail.gmail.com>
Message-ID: <CAMuHMdX7webJ0_R8uj=nagTHJY6viLGkhv2hmc9X48gwz1JDew@mail.gmail.com>
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

On Mon, May 30, 2022 at 9:47 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> first of all, thanks for looking at the patch.

Thank you, your patch series helped a lot.

> Am 28.05.22 um 22:17 schrieb Geert Uytterhoeven:
> > On Mon, Oct 14, 2019 at 4:05 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> The display mode is set by converting the DRM display mode to an
> >> fb_info state and handling it to the fbdev driver's fb_setvar()
> >> function. This also requires a color depth, which we take from the
> >> value of struct drm_mode_config.preferred_depth
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> >> --- a/drivers/gpu/drm/drm_fbconv_helper.c
> >> +++ b/drivers/gpu/drm/drm_fbconv_helper.c
> >> @@ -919,6 +919,24 @@ static int drm_fbconv_update_fb_var_screeninfo_from_framebuffer(
> >>          return 0;
> >>   }
> >>
> >> +static int drm_fbconv_update_fb_var_screeninfo_from_simple_display_pipe(
> >> +       struct fb_var_screeninfo *fb_var, struct drm_simple_display_pipe *pipe)
> >> +{
> >> +       struct drm_plane *primary = pipe->crtc.primary;
> >> +       struct drm_fbconv_modeset *modeset = drm_fbconv_modeset_of_pipe(pipe);
> >> +
> >> +       if (primary && primary->state && primary->state->fb)
> >> +               return drm_fbconv_update_fb_var_screeninfo_from_framebuffer(
> >> +                       fb_var, primary->state->fb,
> >> +                       modeset->fb_info->fix.smem_len);
> >> +
> >> +       fb_var->xres_virtual = fb_var->xres;
> >> +       fb_var->yres_virtual = fb_var->yres;
> >> +       fb_var->bits_per_pixel = modeset->dev->mode_config.preferred_depth;
> >
> > This looks wrong to me: IMHO bits_per_pixel should be derived from
> > the fourcc format of the _new_ mode to be set...
>
> Indeed, this appears to be wrong.

OK.

>
> >
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>   /**
> >>    * drm_fbconv_simple_display_pipe_mode_valid - default implementation for
> >>    *     struct drm_simple_display_pipe_funcs.mode_valid
> >> @@ -950,6 +968,28 @@ bool drm_fbconv_simple_display_pipe_mode_fixup(
> >>          struct drm_crtc *crtc, const struct drm_display_mode *mode,
> >>          struct drm_display_mode *adjusted_mode)
> >>   {
> >> +       struct drm_simple_display_pipe *pipe =
> >> +               container_of(crtc, struct drm_simple_display_pipe, crtc);
> >> +       struct drm_fbconv_modeset *modeset = drm_fbconv_modeset_of_pipe(pipe);
> >> +       struct fb_var_screeninfo fb_var;
> >> +       int ret;
> >> +
> >> +       if (!modeset->fb_info->fbops->fb_check_var)
> >> +               return true;
> >> +
> >> +       drm_fbconv_init_fb_var_screeninfo_from_mode(&fb_var, mode);
> >> +
> >> +       ret = drm_fbconv_update_fb_var_screeninfo_from_simple_display_pipe(
> >> +               &fb_var, &modeset->pipe);
> >> +       if (ret)
> >> +               return true;
> >> +
> >> +       ret = modeset->fb_info->fbops->fb_check_var(&fb_var, modeset->fb_info);
> >
> > ... hence this fails if the requested mode is valid with the new
> > fourcc format, but invalid with the old (but preferred) depth.
> > E.g. due to bandwidth limitations, a high-resolution mode is valid
> > with a low color depth, while a high color depth is limited to lower
> > resolutions.
>
> I tested the helpers with various fbdev drivers and modified them until
> all of these drivers produced at least some output. I'm not surprised
> that there are still bugs.

As usual, the devil is in the details ;-)

The other issue I was facing are the non-rounding KHZ2PICOS() and
PICOS2KHZ() macros, and the numerous back-and-forth conversions:
a valid pixclock in kHz is converted to a valid pixclock in ps,
and accepted.  The returned pixclock in ps is slightly different,
and converted to an invalid pixclock in kHz, hence rejected in the
next iteration (remember: fb_ops.fb_check_var() should only round up
values to match, never round down)...

> > Unfortunately we do not know the new fourcc format here, as both
> > drm_simple_display_pipe_funcs.mode_{valid,fixup}() are passed
> > the mode (from drm_mode_set.mode), but not the new format (from
> > drm_mode_set.fb->format).
> >
> > Am I missing something? Is the new format available in some other way?
>
> We can always get the format from the new plane state of
> modeset->pipe->plane. We'd have this in the atomic_check call. And it
> appears that drm_fbconv_simple_display_pipe_check() is a better place
> for this code anyway.

Thanks, I'll give that a try!

Anyway, I finally made some progress with KMS-style mode-setting inside
my ataridrm driver. Before, I relied solely on initial fbdev-style
mode-setting in the probe function.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
