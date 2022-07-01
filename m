Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B98563A4B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0B12BDCC;
	Fri,  1 Jul 2022 20:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE24412BDCC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 20:01:41 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id b125so2577299qkg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 13:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p2stC06lnxIJ04peLci0uJckjsb+NhjEnb2d6jyIQDI=;
 b=QvD0DekK+2rEVBsL3YOPgrCeE98qOZejqvuODqrWq8GEjsoD17sZIIAfMNNiA3zcZx
 6OudL4ni7yYo+ofbdR+1f/jMuDeA72QPGz7VIperu8hhqz0fC214Fuk98QL+0B0uxg5/
 svKOp45RHJ8EiXvtsoZYkKwN+sJ5GQJTgXGUfCfwm4i+J2ydCIqud51+DNzfPTWGk6s1
 BGAkLJNn9KLKWtc7wM+XcTjGES/QryLbfezDhM1HMmZ3KXhPIy4zye4KBFzgsu7fq1Dx
 fZijXZCgS6AL4MEVfuVEojF5Vo9AYq0xymU/GUwoTMGWvEnjA68Td4KERtj5gUrCKiXG
 FwKQ==
X-Gm-Message-State: AJIora9tXwnSdoXyIQG698eiPT1zzsYRyPD9Hnr1Si23H0tT/tqOJM8I
 gSkIAZkQG2i9+d8HGHH92CJIA1X3jQ+vdw==
X-Google-Smtp-Source: AGRyM1tyJ7HCE2hWYJQut8aoUvC69okfBHJ96j1j1ZSbRYdaBuVLvB5dyW8CK0KciTWydhHSwaNBOQ==
X-Received: by 2002:ae9:efd5:0:b0:6ae:f7fe:4502 with SMTP id
 d204-20020ae9efd5000000b006aef7fe4502mr11819387qkg.421.1656705700546; 
 Fri, 01 Jul 2022 13:01:40 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 az8-20020a05620a170800b006b14b303b37sm5732918qkb.102.2022.07.01.13.01.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 13:01:39 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id i7so5777862ybe.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 13:01:39 -0700 (PDT)
X-Received: by 2002:a25:3288:0:b0:66c:8a91:74bb with SMTP id
 y130-20020a253288000000b0066c8a9174bbmr16964347yby.89.1656705699367; Fri, 01
 Jul 2022 13:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-10-tzimmermann@suse.de>
 <CAMuHMdU9p7KUy3WEFox9KgZBHGZGNO2y5m8tLVbzGGVHu2iNYQ@mail.gmail.com>
 <8b79b40b-9786-9ddf-0dc9-89efbab38c7f@suse.de>
 <CAMuHMdX7webJ0_R8uj=nagTHJY6viLGkhv2hmc9X48gwz1JDew@mail.gmail.com>
In-Reply-To: <CAMuHMdX7webJ0_R8uj=nagTHJY6viLGkhv2hmc9X48gwz1JDew@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Jul 2022 22:01:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-QWCG16asy4o_p21meY4AnbpVNSmd4+PJkDipwPg2Vg@mail.gmail.com>
Message-ID: <CAMuHMdU-QWCG16asy4o_p21meY4AnbpVNSmd4+PJkDipwPg2Vg@mail.gmail.com>
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
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>, michel@daenzer.net,
 Mathieu Malaterre <malat@debian.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, May 30, 2022 at 10:34 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, May 30, 2022 at 9:47 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Am 28.05.22 um 22:17 schrieb Geert Uytterhoeven:
> > > On Mon, Oct 14, 2019 at 4:05 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >> The display mode is set by converting the DRM display mode to an
> > >> fb_info state and handling it to the fbdev driver's fb_setvar()
> > >> function. This also requires a color depth, which we take from the
> > >> value of struct drm_mode_config.preferred_depth
> > >>
> > >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >
> > >> --- a/drivers/gpu/drm/drm_fbconv_helper.c
> > >> +++ b/drivers/gpu/drm/drm_fbconv_helper.c
> > >> @@ -919,6 +919,24 @@ static int drm_fbconv_update_fb_var_screeninfo_from_framebuffer(
> > >>          return 0;
> > >>   }
> > >>
> > >> +static int drm_fbconv_update_fb_var_screeninfo_from_simple_display_pipe(
> > >> +       struct fb_var_screeninfo *fb_var, struct drm_simple_display_pipe *pipe)
> > >> +{
> > >> +       struct drm_plane *primary = pipe->crtc.primary;
> > >> +       struct drm_fbconv_modeset *modeset = drm_fbconv_modeset_of_pipe(pipe);
> > >> +
> > >> +       if (primary && primary->state && primary->state->fb)
> > >> +               return drm_fbconv_update_fb_var_screeninfo_from_framebuffer(
> > >> +                       fb_var, primary->state->fb,
> > >> +                       modeset->fb_info->fix.smem_len);
> > >> +
> > >> +       fb_var->xres_virtual = fb_var->xres;
> > >> +       fb_var->yres_virtual = fb_var->yres;
> > >> +       fb_var->bits_per_pixel = modeset->dev->mode_config.preferred_depth;
> > >
> > > This looks wrong to me: IMHO bits_per_pixel should be derived from
> > > the fourcc format of the _new_ mode to be set...
> >
> > Indeed, this appears to be wrong.
>
> OK.
>
> >
> > >
> > >> +
> > >> +       return 0;
> > >> +}
> > >> +
> > >>   /**
> > >>    * drm_fbconv_simple_display_pipe_mode_valid - default implementation for
> > >>    *     struct drm_simple_display_pipe_funcs.mode_valid
> > >> @@ -950,6 +968,28 @@ bool drm_fbconv_simple_display_pipe_mode_fixup(
> > >>          struct drm_crtc *crtc, const struct drm_display_mode *mode,
> > >>          struct drm_display_mode *adjusted_mode)
> > >>   {
> > >> +       struct drm_simple_display_pipe *pipe =
> > >> +               container_of(crtc, struct drm_simple_display_pipe, crtc);
> > >> +       struct drm_fbconv_modeset *modeset = drm_fbconv_modeset_of_pipe(pipe);
> > >> +       struct fb_var_screeninfo fb_var;
> > >> +       int ret;
> > >> +
> > >> +       if (!modeset->fb_info->fbops->fb_check_var)
> > >> +               return true;
> > >> +
> > >> +       drm_fbconv_init_fb_var_screeninfo_from_mode(&fb_var, mode);
> > >> +
> > >> +       ret = drm_fbconv_update_fb_var_screeninfo_from_simple_display_pipe(
> > >> +               &fb_var, &modeset->pipe);
> > >> +       if (ret)
> > >> +               return true;
> > >> +
> > >> +       ret = modeset->fb_info->fbops->fb_check_var(&fb_var, modeset->fb_info);
> > >
> > > ... hence this fails if the requested mode is valid with the new
> > > fourcc format, but invalid with the old (but preferred) depth.
> > > E.g. due to bandwidth limitations, a high-resolution mode is valid
> > > with a low color depth, while a high color depth is limited to lower
> > > resolutions.

> > > Unfortunately we do not know the new fourcc format here, as both
> > > drm_simple_display_pipe_funcs.mode_{valid,fixup}() are passed
> > > the mode (from drm_mode_set.mode), but not the new format (from
> > > drm_mode_set.fb->format).
> > >
> > > Am I missing something? Is the new format available in some other way?
> >
> > We can always get the format from the new plane state of
> > modeset->pipe->plane. We'd have this in the atomic_check call. And it
> > appears that drm_fbconv_simple_display_pipe_check() is a better place
> > for this code anyway.
>
> Thanks, I'll give that a try!

Getting the format from the new plane state of pipe->plane doesn't
work, as pipe->plane.state->fb = NULL.
But it is indeed available in the drm_simple_display_pipe_funcs.check()
callback, so that seems to work...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
