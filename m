Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F654A6574
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 21:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA18D10E1F6;
	Tue,  1 Feb 2022 20:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2254F10E1F0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 20:11:30 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id t199so18920105oie.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 12:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yzB4vOozlRvqIX/gL3fNjGFB/Ao0+yfv5NKHebS3Iss=;
 b=DgXAbUcDJko8VPl6xNaizrWSBZbGo+5G8wqkQC2HYC9nOsQbJGGPbPB7e4sbPNCZ0A
 9hD2fzdNyGVjDQ6mShAli+TZ6Ieh8o440NNXLKQhb0WZPMQDnU4GykkmqnypYQmQN9/k
 2e544mEZDFn/HDnn/JCG6d/bJiX3gVi2qXJOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yzB4vOozlRvqIX/gL3fNjGFB/Ao0+yfv5NKHebS3Iss=;
 b=r6sn215D6atqCGgERTZWnASt8SA7rTarVfpBjwHQNATTL0NlkbH7m8Ux+YFD4B27A0
 TyEazIDUcVAKcaU/FvQEomYEgN4Q4gStQt16dDOQliwf0Eb0yV44sTXbwx5jDHYv6w+c
 qbZvA1EPCWDHdACn+QogySMPcyK+K/zTD3Iytk8xIqSnIihF8pLmrpYoqxpz9HCIVMCg
 WX27iGybiKma3RYaEQFkC/MoIGj1ONLSMO/CQMkiZKh6WzE/glxwEFBhTGavQFCwcep4
 7q4Lbltbq72Tfj3qE/g4G8CcJOaJG4yIDQPpNK5wqgoN6MZD4YRa6Ov4RiYpBK7IJFko
 h1Fg==
X-Gm-Message-State: AOAM532HoPWvzrSluPxRA73zQVB30BIfDTh4TMq+Wpqu2ghNReOV1M0l
 T4kz7rnFBA35M5+jH9hwGJ5Q2LBZ5N9eb+3mHAz2LA==
X-Google-Smtp-Source: ABdhPJwVvRbWL6gjVUcnLM5w4N0qqioF/vWvItdYlCLyR9xZipwmixPGQ5/Zi+zCONTvo3gsqmuzVJT2t7pVDVROnFI=
X-Received: by 2002:a05:6808:222a:: with SMTP id
 bd42mr570223oib.260.1643746289217; 
 Tue, 01 Feb 2022 12:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20220201185954.169768-1-deller@gmx.de>
 <20220201185954.169768-4-deller@gmx.de>
In-Reply-To: <20220201185954.169768-4-deller@gmx.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 1 Feb 2022 21:11:17 +0100
Message-ID: <CAKMK7uFmMcC4p_zDq5G1Rpvjeg0zOz7v38mTj57JDZEis9fGAA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] fbcon: Add option to enable legacy hardware
 acceleration
To: Helge Deller <deller@gmx.de>
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
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 linux-fbdev@vger.kernel.org, John David Anglin <dave.anglin@bell.net>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 7:59 PM Helge Deller <deller@gmx.de> wrote:
>
> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
> enable bitblt and fillrect hardware acceleration in the framebuffer
> console. If disabled, such acceleration will not be used, even if it is
> supported by the graphics hardware driver.
>
> If you plan to use DRM as your main graphics output system, you should
> disable this option since it will prevent compiling in code which isn't
> used later on when DRM takes over.
>
> For all other configurations, e.g. if none of your graphic cards support
> DRM (yet), DRM isn't available for your architecture, or you can't be
> sure that the graphic card in the target system will support DRM, you
> most likely want to enable this option.
>
> In the non-accelerated case (e.g. when DRM is used), the inlined
> fb_scrollmode() function is hardcoded to return SCROLL_REDRAW and as such the
> compiler is able to optimize much unneccesary code away.
>
> In this v3 patch version I additionally changed the GETVYRES() and GETVXRES()
> macros to take a pointer to the fbcon_display struct. This fixes the build when
> console rotation is enabled and helps the compiler again to optimize out code.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.10+
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  drivers/video/console/Kconfig           | 11 +++++++
>  drivers/video/fbdev/core/fbcon.c        | 39 ++++++++++++++++++-------
>  drivers/video/fbdev/core/fbcon.h        | 15 +++++++++-
>  drivers/video/fbdev/core/fbcon_ccw.c    | 10 +++----
>  drivers/video/fbdev/core/fbcon_cw.c     | 10 +++----
>  drivers/video/fbdev/core/fbcon_rotate.h |  4 +--
>  drivers/video/fbdev/core/fbcon_ud.c     | 20 ++++++-------
>  7 files changed, 75 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> index 840d9813b0bc..6029fd41d7d0 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -78,6 +78,17 @@ config FRAMEBUFFER_CONSOLE
>         help
>           Low-level framebuffer-based console driver.
>
> +config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> +       bool "Framebuffer Console hardware acceleration support"
> +       depends on FRAMEBUFFER_CONSOLE
> +       default n if DRM
> +       default y
> +       help
> +         If you use a system on which DRM is fully supported you usually want to say N,
> +         otherwise you probably want to enable this option.
> +         If enabled the framebuffer console will utilize the hardware acceleration
> +         of your graphics card by using hardware bitblt and fillrect features.

This really doesn't have much to do with DRM but more about running
questionable code. That's why I went with the generalized stern
warning and default n, and explained when it's ok to do this (single
user and you care more about fbcon performance than potential issues
because you only run trusted stuff with access to your vt and fbdev
/dev node). Also you didn't keep any todo entry for removing DRM accel
code, and iirc some nouveau folks also complained that they at least
once had some kind of accel, so that's another reason to not tie this
to DRM.

Anyway aside from this looks reasonable, can you pls respin with a
more cautious Kconfig text?

Thanks, Daniel

> +
>  config FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
>         bool "Map the console to the primary display device"
>         depends on FRAMEBUFFER_CONSOLE
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index b813985f1403..f7b7d35953e8 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1136,11 +1136,13 @@ static void fbcon_init(struct vc_data *vc, int init)
>
>         ops->graphics = 0;
>
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>         if ((cap & FBINFO_HWACCEL_COPYAREA) &&
>             !(cap & FBINFO_HWACCEL_DISABLED))
>                 p->scrollmode = SCROLL_MOVE;
>         else /* default to something safe */
>                 p->scrollmode = SCROLL_REDRAW;
> +#endif
>
>         /*
>          *  ++guenther: console.c:vc_allocate() relies on initializing
> @@ -1705,7 +1707,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>                         count = vc->vc_rows;
>                 if (logo_shown >= 0)
>                         goto redraw_up;
> -               switch (p->scrollmode) {
> +               switch (fb_scrollmode(p)) {
>                 case SCROLL_MOVE:
>                         fbcon_redraw_blit(vc, info, p, t, b - t - count,
>                                      count);
> @@ -1795,7 +1797,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>                         count = vc->vc_rows;
>                 if (logo_shown >= 0)
>                         goto redraw_down;
> -               switch (p->scrollmode) {
> +               switch (fb_scrollmode(p)) {
>                 case SCROLL_MOVE:
>                         fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
>                                      -count);
> @@ -1946,12 +1948,12 @@ static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy,
>                    height, width);
>  }
>
> -static void updatescrollmode(struct fbcon_display *p,
> +static void updatescrollmode_accel(struct fbcon_display *p,
>                                         struct fb_info *info,
>                                         struct vc_data *vc)
>  {
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>         struct fbcon_ops *ops = info->fbcon_par;
> -       int fh = vc->vc_font.height;
>         int cap = info->flags;
>         u16 t = 0;
>         int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
> @@ -1972,12 +1974,6 @@ static void updatescrollmode(struct fbcon_display *p,
>         int fast_imageblit = (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
>                 !(cap & FBINFO_HWACCEL_DISABLED);
>
> -       p->vrows = vyres/fh;
> -       if (yres > (fh * (vc->vc_rows + 1)))
> -               p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
> -       if ((yres % fh) && (vyres % fh < yres % fh))
> -               p->vrows--;
> -
>         if (good_wrap || good_pan) {
>                 if (reading_fast || fast_copyarea)
>                         p->scrollmode = good_wrap ?
> @@ -1991,6 +1987,27 @@ static void updatescrollmode(struct fbcon_display *p,
>                 else
>                         p->scrollmode = SCROLL_REDRAW;
>         }
> +#endif
> +}
> +
> +static void updatescrollmode(struct fbcon_display *p,
> +                                       struct fb_info *info,
> +                                       struct vc_data *vc)
> +{
> +       struct fbcon_ops *ops = info->fbcon_par;
> +       int fh = vc->vc_font.height;
> +       int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> +       int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
> +                                  info->var.xres_virtual);
> +
> +       p->vrows = vyres/fh;
> +       if (yres > (fh * (vc->vc_rows + 1)))
> +               p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
> +       if ((yres % fh) && (vyres % fh < yres % fh))
> +               p->vrows--;
> +
> +       /* update scrollmode in case hardware acceleration is used */
> +       updatescrollmode_accel(p, info, vc);
>  }
>
>  #define PITCH(w) (((w) + 7) >> 3)
> @@ -2148,7 +2165,7 @@ static int fbcon_switch(struct vc_data *vc)
>
>         updatescrollmode(p, info, vc);
>
> -       switch (p->scrollmode) {
> +       switch (fb_scrollmode(p)) {
>         case SCROLL_WRAP_MOVE:
>                 scrollback_phys_max = p->vrows - vc->vc_rows;
>                 break;
> diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
> index 9315b360c898..0f16cbc99e6a 100644
> --- a/drivers/video/fbdev/core/fbcon.h
> +++ b/drivers/video/fbdev/core/fbcon.h
> @@ -29,7 +29,9 @@ struct fbcon_display {
>      /* Filled in by the low-level console driver */
>      const u_char *fontdata;
>      int userfont;                   /* != 0 if fontdata kmalloc()ed */
> -    u_short scrollmode;             /* Scroll Method */
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> +    u_short scrollmode;             /* Scroll Method, use fb_scrollmode() */
> +#endif
>      u_short inverse;                /* != 0 text black on white as default */
>      short yscroll;                  /* Hardware scrolling */
>      int vrows;                      /* number of virtual rows */
> @@ -208,6 +210,17 @@ static inline int attr_col_ec(int shift, struct vc_data *vc,
>  #define SCROLL_REDRAW     0x004
>  #define SCROLL_PAN_REDRAW  0x005
>
> +static inline u_short fb_scrollmode(struct fbcon_display *fb)
> +{
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> +       return fb->scrollmode;
> +#else
> +       /* hardcoded to SCROLL_REDRAW if acceleration was disabled. */
> +       return SCROLL_REDRAW;
> +#endif
> +}
> +
> +
>  #ifdef CONFIG_FB_TILEBLITTING
>  extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info);
>  #endif
> diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
> index 9cd2c4b05c32..2789ace79634 100644
> --- a/drivers/video/fbdev/core/fbcon_ccw.c
> +++ b/drivers/video/fbdev/core/fbcon_ccw.c
> @@ -65,7 +65,7 @@ static void ccw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
>  {
>         struct fbcon_ops *ops = info->fbcon_par;
>         struct fb_copyarea area;
> -       u32 vyres = GETVYRES(ops->p->scrollmode, info);
> +       u32 vyres = GETVYRES(ops->p, info);
>
>         area.sx = sy * vc->vc_font.height;
>         area.sy = vyres - ((sx + width) * vc->vc_font.width);
> @@ -83,7 +83,7 @@ static void ccw_clear(struct vc_data *vc, struct fb_info *info, int sy,
>         struct fbcon_ops *ops = info->fbcon_par;
>         struct fb_fillrect region;
>         int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
> -       u32 vyres = GETVYRES(ops->p->scrollmode, info);
> +       u32 vyres = GETVYRES(ops->p, info);
>
>         region.color = attr_bgcol_ec(bgshift,vc,info);
>         region.dx = sy * vc->vc_font.height;
> @@ -140,7 +140,7 @@ static void ccw_putcs(struct vc_data *vc, struct fb_info *info,
>         u32 cnt, pitch, size;
>         u32 attribute = get_attribute(info, scr_readw(s));
>         u8 *dst, *buf = NULL;
> -       u32 vyres = GETVYRES(ops->p->scrollmode, info);
> +       u32 vyres = GETVYRES(ops->p, info);
>
>         if (!ops->fontbuffer)
>                 return;
> @@ -229,7 +229,7 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>         int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
>         int err = 1, dx, dy;
>         char *src;
> -       u32 vyres = GETVYRES(ops->p->scrollmode, info);
> +       u32 vyres = GETVYRES(ops->p, info);
>
>         if (!ops->fontbuffer)
>                 return;
> @@ -387,7 +387,7 @@ static int ccw_update_start(struct fb_info *info)
>  {
>         struct fbcon_ops *ops = info->fbcon_par;
>         u32 yoffset;
> -       u32 vyres = GETVYRES(ops->p->scrollmode, info);
> +       u32 vyres = GETVYRES(ops->p, info);
>         int err;
>
>         yoffset = (vyres - info->var.yres) - ops->var.xoffset;
> diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
> index 88d89fad3f05..86a254c1b2b7 100644
> --- a/drivers/video/fbdev/core/fbcon_cw.c
> +++ b/drivers/video/fbdev/core/fbcon_cw.c
> @@ -50,7 +50,7 @@ static void cw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
>  {
>         struct fbcon_ops *ops = info->fbcon_par;
>         struct fb_copyarea area;
> -       u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +       u32 vxres = GETVXRES(ops->p, info);
>
>         area.sx = vxres - ((sy + height) * vc->vc_font.height);
>         area.sy = sx * vc->vc_font.width;
> @@ -68,7 +68,7 @@ static void cw_clear(struct vc_data *vc, struct fb_info *info, int sy,
>         struct fbcon_ops *ops = info->fbcon_par;
>         struct fb_fillrect region;
>         int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
> -       u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +       u32 vxres = GETVXRES(ops->p, info);
>
>         region.color = attr_bgcol_ec(bgshift,vc,info);
>         region.dx = vxres - ((sy + height) * vc->vc_font.height);
> @@ -125,7 +125,7 @@ static void cw_putcs(struct vc_data *vc, struct fb_info *info,
>         u32 cnt, pitch, size;
>         u32 attribute = get_attribute(info, scr_readw(s));
>         u8 *dst, *buf = NULL;
> -       u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +       u32 vxres = GETVXRES(ops->p, info);
>
>         if (!ops->fontbuffer)
>                 return;
> @@ -212,7 +212,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>         int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
>         int err = 1, dx, dy;
>         char *src;
> -       u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +       u32 vxres = GETVXRES(ops->p, info);
>
>         if (!ops->fontbuffer)
>                 return;
> @@ -369,7 +369,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>  static int cw_update_start(struct fb_info *info)
>  {
>         struct fbcon_ops *ops = info->fbcon_par;
> -       u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +       u32 vxres = GETVXRES(ops->p, info);
>         u32 xoffset;
>         int err;
>
> diff --git a/drivers/video/fbdev/core/fbcon_rotate.h b/drivers/video/fbdev/core/fbcon_rotate.h
> index e233444cda66..01cbe303b8a2 100644
> --- a/drivers/video/fbdev/core/fbcon_rotate.h
> +++ b/drivers/video/fbdev/core/fbcon_rotate.h
> @@ -12,11 +12,11 @@
>  #define _FBCON_ROTATE_H
>
>  #define GETVYRES(s,i) ({                           \
> -        (s == SCROLL_REDRAW || s == SCROLL_MOVE) ? \
> +        (fb_scrollmode(s) == SCROLL_REDRAW || fb_scrollmode(s) == SCROLL_MOVE) ? \
>          (i)->var.yres : (i)->var.yres_virtual; })
>
>  #define GETVXRES(s,i) ({                           \
> -        (s == SCROLL_REDRAW || s == SCROLL_MOVE || !(i)->fix.xpanstep) ? \
> +        (fb_scrollmode(s) == SCROLL_REDRAW || fb_scrollmode(s) == SCROLL_MOVE || !(i)->fix.xpanstep) ? \
>          (i)->var.xres : (i)->var.xres_virtual; })
>
>
> diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
> index 8d5e66b1bdfb..23bc045769d0 100644
> --- a/drivers/video/fbdev/core/fbcon_ud.c
> +++ b/drivers/video/fbdev/core/fbcon_ud.c
> @@ -50,8 +50,8 @@ static void ud_bmove(struct vc_data *vc, struct fb_info *info, int sy,
>  {
>         struct fbcon_ops *ops = info->fbcon_par;
>         struct fb_copyarea area;
> -       u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -       u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +       u32 vyres = GETVYRES(ops->p, info);
> +       u32 vxres = GETVXRES(ops->p, info);
>
>         area.sy = vyres - ((sy + height) * vc->vc_font.height);
>         area.sx = vxres - ((sx + width) * vc->vc_font.width);
> @@ -69,8 +69,8 @@ static void ud_clear(struct vc_data *vc, struct fb_info *info, int sy,
>         struct fbcon_ops *ops = info->fbcon_par;
>         struct fb_fillrect region;
>         int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
> -       u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -       u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +       u32 vyres = GETVYRES(ops->p, info);
> +       u32 vxres = GETVXRES(ops->p, info);
>
>         region.color = attr_bgcol_ec(bgshift,vc,info);
>         region.dy = vyres - ((sy + height) * vc->vc_font.height);
> @@ -162,8 +162,8 @@ static void ud_putcs(struct vc_data *vc, struct fb_info *info,
>         u32 mod = vc->vc_font.width % 8, cnt, pitch, size;
>         u32 attribute = get_attribute(info, scr_readw(s));
>         u8 *dst, *buf = NULL;
> -       u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -       u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +       u32 vyres = GETVYRES(ops->p, info);
> +       u32 vxres = GETVXRES(ops->p, info);
>
>         if (!ops->fontbuffer)
>                 return;
> @@ -259,8 +259,8 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>         int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
>         int err = 1, dx, dy;
>         char *src;
> -       u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -       u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +       u32 vyres = GETVYRES(ops->p, info);
> +       u32 vxres = GETVXRES(ops->p, info);
>
>         if (!ops->fontbuffer)
>                 return;
> @@ -410,8 +410,8 @@ static int ud_update_start(struct fb_info *info)
>  {
>         struct fbcon_ops *ops = info->fbcon_par;
>         int xoffset, yoffset;
> -       u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -       u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +       u32 vyres = GETVYRES(ops->p, info);
> +       u32 vxres = GETVXRES(ops->p, info);
>         int err;
>
>         xoffset = vxres - info->var.xres - ops->var.xoffset;
> --
> 2.34.1
>


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
