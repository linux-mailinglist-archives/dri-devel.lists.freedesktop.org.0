Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEF149C865
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0EE10E49D;
	Wed, 26 Jan 2022 11:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B91610E49D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:14:53 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id e81so36785820oia.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 03:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kl2oEMPJE4ww4Hxl+lYFpaOA+BaBoN/MYSi9yoz3HIs=;
 b=SSWut5VJV6G6Sq61mn82ZkfomaVm3lstbRwrvYRhJCTlvVYarIwFEEFmlv5lvHgzoS
 jvwTTREiiB/aLk6Pp//CZXQzfkSCk+rhftZF8ELHFamw7Bwri0dziU0h7CNlRTrrTKSg
 roCqRhAQVeWWApR+1Uh+7kujMVkELSdRTWNJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kl2oEMPJE4ww4Hxl+lYFpaOA+BaBoN/MYSi9yoz3HIs=;
 b=d5MvSyn3woYDKBZtYVaSuihgBiaRrjk2GMkfLNNpypM7OrijJ6dZ5JHnrP58/QfPai
 XTVFqNxd9S0OBypt4FEQOPtQOhSHyergXrhPomnMbXFZ3mMQI7qKMkDG/mcydi4M4fyO
 SdvdpOXvz1ABBLz55XD2lyKS5LITEwrZnoenorO6tagWLOuGJUsFBCfYVC/SDx8hOnkw
 ylWbDbHK3qzW75+q84JI9jyhkbzBF++IaBnMZ8Le8V1hksVZzFEI2h6nZA4rdjKvk1Ke
 1TYL6jpq0k53AxFhFv/imFmbDl1YcT66+TXT3Hz598p6btRwqaeH86RUoWyPJKYTWa+8
 fjoQ==
X-Gm-Message-State: AOAM531FbYNvcfDCN+zzKVDWfaYS1TviHV1AVBuTnDwUO8r86xojsFik
 D6Zl091QaCCLlgh9O7n4/zrvocLXDk0i36dnkweXKw==
X-Google-Smtp-Source: ABdhPJyhXeRf+enuzSx2pBx/wF0n2BF4M6TDtdQ5w7YMW8zGqyceJuCbrHqscXdbd6TFvtZv9dWw8OSWjpTEV+FuAR8=
X-Received: by 2002:a05:6808:f03:: with SMTP id
 m3mr3327231oiw.330.1643195692341; 
 Wed, 26 Jan 2022 03:14:52 -0800 (PST)
MIME-Version: 1.0
References: <YfBLiUMokw6tLq0O@p100>
 <06f83d81-5df2-916a-4ae1-5a6e12b96832@gmx.de>
 <c1ec52f6-796d-63f2-1419-c73f6554de16@gmx.de>
In-Reply-To: <c1ec52f6-796d-63f2-1419-c73f6554de16@gmx.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 12:14:41 +0100
Message-ID: <CAKMK7uHZkS0H=89QJdiG0nCod6k6FpKihRcBFPinBCXMcEZcZw@mail.gmail.com>
Subject: Re: [PATCH] [RFC] fbcon: Add option to enable legacy hardware
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 8:44 PM Helge Deller <deller@gmx.de> wrote:
>
> On 1/25/22 20:17, Helge Deller wrote:
> > On 1/25/22 20:12, Helge Deller wrote:
> >> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
> >> enable bitblt and fillrect hardware acceleration in the framebuffer
> >> console. If disabled, such acceleration will not be used, even if it is
> >> supported by the graphics hardware driver.
> >>
> >> If you plan to use DRM as your main graphics output system, you should
> >> disable this option since it will prevent compiling in code which isn't
> >> used later on when DRM takes over.
> >>
> >> For all other configurations, e.g. if none of your graphic cards support
> >> DRM (yet), DRM isn't available for your architecture, or you can't be
> >> sure that the graphic card in the target system will support DRM, you
> >> most likely want to enable this option.
> >>
> >>
> >> This patch is the first RFC.
> >
> > I forgot to mention that by using the static fb_scrollmode() function
> > I expect the compiler to optimize-out all code which seems problematic
> > from DRM's POV...
>
> This patch is not complete, for example there are more changes necessary
> in fbcon_cw.c, bcon_ccw.c and fbcon_ccw.c.
>
> Anyway, for the first round I'm interested in general feedback, if this is
> the direction which is acceptable for you.
>
> In addition I think fb_scrollmode() should be renamed to fbcon_scrollmode()
> to make it clear that it's a fbcon-related function.

I started typing my on flavour of this and wasn't happy with some of
the ifdefs, your fb_scrollmode() takes care of the annoying ones in a
tidy way. I'll include your diff here and I'll try and get my series
sent out today (there's a bunch of random little locking cleanups in
fbcon.c that I've done since the code is just a bit too entertaining
as-is).

Cheers, Daniel
>
> If you want to test this patch you will need to first apply the revert-patches
> I sent earlier.
> Alternatively for testing it's possible to pull from the "fbcon-accel" branch from:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git  fbcon-accel
>
> Helge
>
>
>
> >> Independed of this patch I did some timing experiments with a qemu
> >> virtual machine running a PA-RISC Debian Linux installation with a
> >> screen resolution of 2048x1024 with 8bpp. In that case qemu emulated the
> >> graphics hardware bitblt and fillrect acceleration by using the native
> >> (x86) CPU.
> >>
> >> It was a simple testcase which was to run "time dmesg", where the syslog
> >> had 284 lines. The results showed a huge speedup:
> >> a) time dmesg (without acceleration):
> >>    -> 19.0 seconds
> >> b) time dmesg (with acceleration):
> >>    ->  2.6 seconds
> >>
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >>
> >> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> >> index 840d9813b0bc..da84d1c21c21 100644
> >> --- a/drivers/video/console/Kconfig
> >> +++ b/drivers/video/console/Kconfig
> >> @@ -78,6 +78,17 @@ config FRAMEBUFFER_CONSOLE
> >>      help
> >>        Low-level framebuffer-based console driver.
> >>
> >> +config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> >> +    bool "Framebuffer Console hardware acceleration support"
> >> +    depends on FRAMEBUFFER_CONSOLE
> >> +    default y if !DRM
> >> +    default y if !(X86 || ARM)
> >> +    help
> >> +      If you use a system on which DRM is fully supported you usually want to say N,
> >> +      otherwise you probably want to enable this option.
> >> +      If enabled the framebuffer console will utilize the hardware acceleration
> >> +      of your graphics card by using hardware bitblt and fillrect features.
> >> +
> >>  config FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
> >>         bool "Map the console to the primary display device"
> >>         depends on FRAMEBUFFER_CONSOLE
> >> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> >> index b813985f1403..f7b7d35953e8 100644
> >> --- a/drivers/video/fbdev/core/fbcon.c
> >> +++ b/drivers/video/fbdev/core/fbcon.c
> >> @@ -1136,11 +1136,13 @@ static void fbcon_init(struct vc_data *vc, int init)
> >>
> >>      ops->graphics = 0;
> >>
> >> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> >>      if ((cap & FBINFO_HWACCEL_COPYAREA) &&
> >>          !(cap & FBINFO_HWACCEL_DISABLED))
> >>              p->scrollmode = SCROLL_MOVE;
> >>      else /* default to something safe */
> >>              p->scrollmode = SCROLL_REDRAW;
> >> +#endif
> >>
> >>      /*
> >>       *  ++guenther: console.c:vc_allocate() relies on initializing
> >> @@ -1705,7 +1707,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
> >>                      count = vc->vc_rows;
> >>              if (logo_shown >= 0)
> >>                      goto redraw_up;
> >> -            switch (p->scrollmode) {
> >> +            switch (fb_scrollmode(p)) {
> >>              case SCROLL_MOVE:
> >>                      fbcon_redraw_blit(vc, info, p, t, b - t - count,
> >>                                   count);
> >> @@ -1795,7 +1797,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
> >>                      count = vc->vc_rows;
> >>              if (logo_shown >= 0)
> >>                      goto redraw_down;
> >> -            switch (p->scrollmode) {
> >> +            switch (fb_scrollmode(p)) {
> >>              case SCROLL_MOVE:
> >>                      fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
> >>                                   -count);
> >> @@ -1946,12 +1948,12 @@ static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy,
> >>                 height, width);
> >>  }
> >>
> >> -static void updatescrollmode(struct fbcon_display *p,
> >> +static void updatescrollmode_accel(struct fbcon_display *p,
> >>                                      struct fb_info *info,
> >>                                      struct vc_data *vc)
> >>  {
> >> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> >>      struct fbcon_ops *ops = info->fbcon_par;
> >> -    int fh = vc->vc_font.height;
> >>      int cap = info->flags;
> >>      u16 t = 0;
> >>      int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
> >> @@ -1972,12 +1974,6 @@ static void updatescrollmode(struct fbcon_display *p,
> >>      int fast_imageblit = (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
> >>              !(cap & FBINFO_HWACCEL_DISABLED);
> >>
> >> -    p->vrows = vyres/fh;
> >> -    if (yres > (fh * (vc->vc_rows + 1)))
> >> -            p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
> >> -    if ((yres % fh) && (vyres % fh < yres % fh))
> >> -            p->vrows--;
> >> -
> >>      if (good_wrap || good_pan) {
> >>              if (reading_fast || fast_copyarea)
> >>                      p->scrollmode = good_wrap ?
> >> @@ -1991,6 +1987,27 @@ static void updatescrollmode(struct fbcon_display *p,
> >>              else
> >>                      p->scrollmode = SCROLL_REDRAW;
> >>      }
> >> +#endif
> >> +}
> >> +
> >> +static void updatescrollmode(struct fbcon_display *p,
> >> +                                    struct fb_info *info,
> >> +                                    struct vc_data *vc)
> >> +{
> >> +    struct fbcon_ops *ops = info->fbcon_par;
> >> +    int fh = vc->vc_font.height;
> >> +    int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> >> +    int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
> >> +                               info->var.xres_virtual);
> >> +
> >> +    p->vrows = vyres/fh;
> >> +    if (yres > (fh * (vc->vc_rows + 1)))
> >> +            p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
> >> +    if ((yres % fh) && (vyres % fh < yres % fh))
> >> +            p->vrows--;
> >> +
> >> +    /* update scrollmode in case hardware acceleration is used */
> >> +    updatescrollmode_accel(p, info, vc);
> >>  }
> >>
> >>  #define PITCH(w) (((w) + 7) >> 3)
> >> @@ -2148,7 +2165,7 @@ static int fbcon_switch(struct vc_data *vc)
> >>
> >>      updatescrollmode(p, info, vc);
> >>
> >> -    switch (p->scrollmode) {
> >> +    switch (fb_scrollmode(p)) {
> >>      case SCROLL_WRAP_MOVE:
> >>              scrollback_phys_max = p->vrows - vc->vc_rows;
> >>              break;
> >> diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
> >> index 9315b360c898..c5c043f38162 100644
> >> --- a/drivers/video/fbdev/core/fbcon.h
> >> +++ b/drivers/video/fbdev/core/fbcon.h
> >> @@ -29,7 +29,9 @@ struct fbcon_display {
> >>      /* Filled in by the low-level console driver */
> >>      const u_char *fontdata;
> >>      int userfont;                   /* != 0 if fontdata kmalloc()ed */
> >> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> >>      u_short scrollmode;             /* Scroll Method */
> >> +#endif
> >>      u_short inverse;                /* != 0 text black on white as default */
> >>      short yscroll;                  /* Hardware scrolling */
> >>      int vrows;                      /* number of virtual rows */
> >> @@ -208,6 +210,17 @@ static inline int attr_col_ec(int shift, struct vc_data *vc,
> >>  #define SCROLL_REDRAW          0x004
> >>  #define SCROLL_PAN_REDRAW  0x005
> >>
> >> +static inline u_short fb_scrollmode(struct fbcon_display *fb)
> >> +{
> >> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> >> +    return fb->scrollmode;
> >> +#else
> >> +    /* hardcoded to SCROLL_REDRAW if acceleration was disabled. */
> >> +    return SCROLL_REDRAW;
> >> +#endif
> >> +}
> >> +
> >> +
> >>  #ifdef CONFIG_FB_TILEBLITTING
> >>  extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info);
> >>  #endif
> >>
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
