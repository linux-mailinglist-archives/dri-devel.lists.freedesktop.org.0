Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C4C63A8EE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 14:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2CD10E1C4;
	Mon, 28 Nov 2022 13:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4E610E1C4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 13:08:16 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id w9so6537103qtv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 05:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9NyJ4oC6Fj5jfuI9pmJZJst2bJ3O+9u6ckzE/ZvDK8M=;
 b=v1/YGPJ98yAipo1j9fPYoKf6056Yf3+hrYrUjirThB1qo9GHszDuUvnnSbJlueAS8j
 BmqYkYR+BtyPmqF8inWS9elNL1GnJapBTmgyhl6XVCLY9jfLKLSM6LVAPG61rq5IeHRf
 9S0SkFKbZNkgUH5k/sjFMarygF3zUVz9qVLJmu5x/8xqBVfgR1yT10ZiN6fgqkSPQwoM
 o/tMGifBj5pefPWy0RvrGsUWbJVVu5b8MSWut8GBrf4ThM5cMdwogmgDguW8Vml7Vsvq
 z5RXkUm2SdwntP92AS5ywE01rkXCpKQIGJgOnh6y9KZw6BPoymQ4BwcUNNAdJG9RJpf6
 Iq/g==
X-Gm-Message-State: ANoB5pnYMQ4VBdu7OeR/pmccG6Fnm8VXyRghIbCiGEsVOUM+gjka4olp
 K8vX5gSpUuuiJ9XYfeckT7MFf99OmfnlfA==
X-Google-Smtp-Source: AA0mqf4neHruQ+/Jhldtb7OxcHHLV8geE5mSEidPaZ7v/LJHFkrl70tSxqhfmv67SDS01d7LrrMXdQ==
X-Received: by 2002:ac8:528d:0:b0:3a5:1eb:d8ab with SMTP id
 s13-20020ac8528d000000b003a501ebd8abmr46868706qtn.443.1669640895269; 
 Mon, 28 Nov 2022 05:08:15 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 bq10-20020a05622a1c0a00b003a582090530sm6877713qtb.83.2022.11.28.05.08.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 05:08:14 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 7so13171418ybp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 05:08:14 -0800 (PST)
X-Received: by 2002:a25:7a02:0:b0:6f7:952d:b145 with SMTP id
 v2-20020a257a02000000b006f7952db145mr2006716ybc.604.1669640893818; Mon, 28
 Nov 2022 05:08:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669406380.git.geert@linux-m68k.org>
 <9ef3ed30a45a367db0231ea2e98f6f37ba860b4c.1669406382.git.geert@linux-m68k.org>
 <488b261a-843e-de94-bace-16364e6f9d92@suse.de>
In-Reply-To: <488b261a-843e-de94-bace-16364e6f9d92@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Nov 2022 14:08:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWcY1i-oFKu11Lk-urFi=E3TXinWKBL98hMhkVPzQPfZQ@mail.gmail.com>
Message-ID: <CAMuHMdWcY1i-oFKu11Lk-urFi=E3TXinWKBL98hMhkVPzQPfZQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 3/3] drm: atari: Add a DRM driver for Atari graphics
 hardware
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Sat, Nov 26, 2022 at 3:51 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> that's an interesting driver. I left a few comments below.

Thanks for your comments!

> Am 25.11.22 um 21:31 schrieb Geert Uytterhoeven:
> > Supported formats:
> >    - C[1248],
> >    - RG16 (both standard DRM (little-endian) and native (big-endian)),
> >    - XR24.
> >
> > RG16 and XR24 are only supported with the underlying RGB565 hardware
> > mode on Falcon, and are subject to hardware restrictions (limited to
> > e.g. "qvga" and "hvga" modes).
> >
> > All formats use a shadow buffer (TODO: BE RG16 buffers from ST-RAM).
> > Initial mode setting works, later mode changes sometimes fail.

> > --- a/drivers/gpu/drm/tiny/Kconfig
> > +++ b/drivers/gpu/drm/tiny/Kconfig
> > @@ -10,6 +10,14 @@ config DRM_ARCPGU
> >
> >         If M is selected the module will be called arcpgu.
> >
> > +config DRM_ATARI
> > +     tristate "DRM support for Atari native chipset"
> > +     depends on DRM && ATARI
> > +     select DRM_KMS_HELPER
> > +     select DRM_GEM_SHMEM_HELPER
>
> Alphabetical sorting of the select statements.

OK

(I blame the chain of DRM_KMS_CMA_HELPER -> DRM_GEM_CMA_HELPER ->
 DRM_GEM_DMA_HELPER renames ;-)

> > --- a/drivers/video/fbdev/atafb.c
> > +++ b/drivers/gpu/drm/tiny/atari_drm.c

> > @@ -2288,11 +2279,13 @@ static struct fb_hwswitch tt_switch = {
> >   static struct fb_hwswitch falcon_switch = {
> >       .detect         = falcon_detect,
> >       .encode_fix     = falcon_encode_fix,
> > +     .config_init    = falcon_config_init,
> >       .decode_var     = falcon_decode_var,
> >       .encode_var     = falcon_encode_var,
> >       .get_par        = falcon_get_par,
> >       .set_par        = falcon_set_par,
> >       .set_screen_base = set_screen_base,
> > +     .set_col_reg    = falcon_set_col_reg,
> >       .blank          = falcon_blank,
> >       .pan_display    = falcon_pan_display,
> >   };
> > @@ -2302,11 +2295,13 @@ static struct fb_hwswitch falcon_switch = {
> >   static struct fb_hwswitch st_switch = {
> >       .detect         = stste_detect,
> >       .encode_fix     = stste_encode_fix,
> > +     .config_init    = stste_config_init,
> >       .decode_var     = stste_decode_var,
> >       .encode_var     = stste_encode_var,
> >       .get_par        = stste_get_par,
> >       .set_par        = stste_set_par,
> >       .set_screen_base = stste_set_screen_base,
> > +     .set_col_reg    = stste_set_col_reg,
> >       .pan_display    = pan_display
> >   };
> >   #endif
> > @@ -2315,10 +2310,12 @@ static struct fb_hwswitch st_switch = {
> >   static struct fb_hwswitch ext_switch = {
> >       .detect         = ext_detect,
> >       .encode_fix     = ext_encode_fix,
> > +     .config_init    = ext_config_init,
> >       .decode_var     = ext_decode_var,
> >       .encode_var     = ext_encode_var,
> >       .get_par        = ext_get_par,
> >       .set_par        = ext_set_par,
> > +     .set_col_reg    = ext_set_col_reg,
> >   };
> >   #endif
>
> This design is problematic. It recreates fbdev interfaces within DRM and
> makes it very hard to convert the driver to good DRM code. I suggest to
> branch at the outer-most point for each supported model. So each model
> effectively receives it's own mode-config pipeline. Common code can
> still be shared.
>
> For a good example, I'd refer to the latest mgag200 driver, which
> implements this pattern for the variety of revisions of its hardware.

I do not intend to keep this internal API.
It should be reworked by removing all fbdev'isms.

> > +// FIXME helpers from
> > +// "[PATCH v2 5/15] drm/fbconv: Add DRM <-> fbdev pixel-format conversion"
> > +// by Thomas Zimmermann <tzimmermann@suse.de>
>
> All these FIXMEs will need to be resolved.

Definitely.

> > +static void atari_drm_pipe_update(struct drm_simple_display_pipe *pipe,
> > +                               struct drm_plane_state *old_plane_state)
> > +{
> > +     struct atari_drm_device *atari_drm = atari_drm_from_pipe(pipe);
> > +     struct drm_plane_state *plane_state = pipe->plane.state;
> > +     struct drm_shadow_plane_state *shadow_plane_state =
> > +             to_drm_shadow_plane_state(plane_state);
> > +     struct drm_framebuffer *fb = plane_state->fb;
> > +     struct drm_crtc *crtc = &pipe->crtc;

> > +     // FIXME removing the block below triggers WARN_ON(new_crtc_state->event) in drivers/gpu/drm/drm_atomic_helper.c:2475 drm_atomic_helper_commit_hw_done
> > +     // FIXME I still see that warning when running modetest

BTW, do you know why I see that warning?
It happens less when sprinkling debug prints all over the place.

> > +     if (crtc->state->event) {
> > +             spin_lock_irq(&crtc->dev->event_lock);
> > +             drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +             crtc->state->event = NULL;
> > +             spin_unlock_irq(&crtc->dev->event_lock);
> > +     }
> > +}

> > +static struct drm_framebuffer*
> > +atari_drm_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> > +                 const struct drm_mode_fb_cmd2 *mode_cmd)
> > +{
> > +     struct drm_framebuffer *fb;
> > +
> > +     switch (mode_cmd->pixel_format) {
> > +     case DRM_FORMAT_C1:
> > +     case DRM_FORMAT_C2:
> > +     case DRM_FORMAT_C4:
> > +             break;
> > +
> > +     case DRM_FORMAT_C8:
> > +             // FIXME TT & Falcon only
> > +             break;
> > +
> > +     case DRM_FORMAT_RGB565:
> > +     case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
> > +             // FIXME Falcon only
> > +             break;
> > +
> > +     case DRM_FORMAT_XRGB8888:
> > +             // FIXME
> > +             break;
> > +
> > +     default:
> > +             return ERR_PTR(-EINVAL);
> > +     }
>
> The format checks don't belong here. IIRC the format will be validated
> when you try to set the framebuffer for a plane during the atomic commit

OK

> > +
> > +     if (atari_drm_check_size(mode_cmd->width, mode_cmd->height, NULL) < 0)
> > +             return ERR_PTR(-EINVAL);
>
> Same here. The size checks are performed when the framebuffer is used.

FTR, this was based on cirrus_fb_create()...

> > +
> > +     // FIXME allocate C1 and RGB565 in ST-RAM?
> > +     fb = drm_gem_fb_create_with_dirty(dev, file_priv, mode_cmd);

BTW, how do I allocate a buffer from graphics memory?
Any example to point me to?

> > +     drm_WARN_ON_ONCE(dev, fb->pitches[0] > fb->width *
> > +                           drm_format_info_bpp(fb->format, 0) / 8);
> > +     return fb;
> > +}
> > +
> > +static const struct drm_mode_config_funcs atari_drm_mode_config_funcs = {
> > +     .fb_create = atari_drm_fb_create,
> > +     .atomic_check = drm_atomic_helper_check,        // FIXME
> > +     .atomic_commit = drm_atomic_helper_commit,      // FIXME
>
> Why FIXMEs? Thes elines appear correct.

Because I had the feeling I should pass my own functions...

>
> > +};

> > +static int __init atari_drm_probe(struct platform_device *pdev)
> > +{
> > +     struct atari_drm_device *atari_drm;
> > +     int pad, detected_mode, error;
> > +     struct drm_device *dev;
> > +     unsigned long mem_req;
> > +     char *option = NULL;
> > +     int ret;
> > +
> > +     if (fb_get_options("atafb", &option))
> > +             return -ENODEV;
>
> That function is not available here.

It is.

But now I see drm_connector_get_cmdline_mode() already calls
fb_get_options(), and handles this when calling drm_connector_init(),
albeit a bit late (it should bail out before changing any hardware
state)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
