Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80824D2FC5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA1C10E99E;
	Wed,  9 Mar 2022 13:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B65210E951
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:14:46 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id e22so1883960qvf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XUvHkX5812DRzHn1EeBQVzC3fP1RFckTmLb18DWoP3k=;
 b=Vy3bK/o85WejIMhr5T0Tr4LSoIwD2MVfwkXrbjKT2Jnh0znjCV4nuepQUehFgFmJ8y
 gk1jvnG1f2gpGana1jnTIkKfhZKD4aI2+wQewqVMEZNe3trnsSIutUB3L8o26XyVyc4Z
 FHaaVp4n0JLIIU2EzTHvz+h5PgkPvFA06ew9OXjAuKFnC5Q6cgxDRcmKGRE71F4o1il9
 rNkZG/TcECsXQIm5BYn2pD6jUG1066NCGjFTTVlu+M93lMR0dqKk8zLp+HREqWRdKh8u
 OvJPinOAxB6ehc9r5E/25U4nAmI4bKgfpj2F6mQy1vu6xZBqw1ZNfk2wCgoPXVPHTQ0C
 OK/g==
X-Gm-Message-State: AOAM530qWa4fY109Pcy4KFyIap3Gv7m8xX84If2pBIZmE4C2Rt1TPuPo
 R0v+l9UPBtf82/U1bPjL0CxywKiiOb/q3w==
X-Google-Smtp-Source: ABdhPJy2/0+99B9WESt+cpJQRHYNM3Sel/OD/jt0EuDsi8SfhKLPuxmiYjX+sd5ZhYHTXC1wAgN/sQ==
X-Received: by 2002:ad4:596c:0:b0:42c:3a47:5d8 with SMTP id
 eq12-20020ad4596c000000b0042c3a4705d8mr16535411qvb.93.1646831685004; 
 Wed, 09 Mar 2022 05:14:45 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 g21-20020ac85815000000b002e06e2623a7sm1222750qtg.0.2022.03.09.05.14.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:14:44 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id w16so4183851ybi.12
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:14:44 -0800 (PST)
X-Received: by 2002:a5b:5d0:0:b0:623:c68d:d473 with SMTP id
 w16-20020a5b05d0000000b00623c68dd473mr16176129ybp.506.1646831684073; Wed, 09
 Mar 2022 05:14:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646683502.git.geert@linux-m68k.org>
 <c665d6ba072f3debb3fa0a139454fefef6a55011.1646683502.git.geert@linux-m68k.org>
 <355f94c7-fc8a-7d92-5979-5b1b49c1d738@redhat.com>
In-Reply-To: <355f94c7-fc8a-7d92-5979-5b1b49c1d738@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Mar 2022 14:14:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8X1k1BeHoNOGkTQq4bQM5bpr7nMzVfzD6VYB7vvuWNw@mail.gmail.com>
Message-ID: <CAMuHMdV8X1k1BeHoNOGkTQq4bQM5bpr7nMzVfzD6VYB7vvuWNw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] drm/fb-helper: Add support for DRM_FORMAT_C[124]
To: Javier Martinez Canillas <javierm@redhat.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, Linux/m68k <linux-m68k@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Wed, Mar 9, 2022 at 2:10 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 3/7/22 21:52, Geert Uytterhoeven wrote:
> > Add support for color-indexed frame buffer formats with two, four, and
> > sixteen colors to the DRM framebuffer helper functions:
> >   1. Add support for 1, 2, and 4 bits per pixel to the damage helper,
> >   2. For color-indexed modes, the length of the color bitfields must be
> >      set to the color depth, else the logo code may pick a logo with too
> >      many colors.  Drop the incorrect DAC width comment, which
> >      originates from the i915 driver.
> >   3. Accept C[124] modes when validating or filling in struct
> >      fb_var_screeninfo, and use the correct number of bits per pixel.
> >   4. Set the visual to FB_VISUAL_PSEUDOCOLOR for all color-indexed
> >      modes.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> [snip]
>
> >  static void drm_fb_helper_fill_fix(struct fb_info *info, uint32_t pitch,
> > -                                uint32_t depth)
> > +                                bool is_color_indexed)
> >  {
> >       info->fix.type = FB_TYPE_PACKED_PIXELS;
> > -     info->fix.visual = depth == 8 ? FB_VISUAL_PSEUDOCOLOR :
> > -             FB_VISUAL_TRUECOLOR;
> > +     info->fix.visual = is_color_indexed ? FB_VISUAL_PSEUDOCOLOR
> > +                                         : info->fix.visual;
>
> Shouldn't this be the following instead ?
>
>   +     info->fix.visual = is_color_indexed ? FB_VISUAL_PSEUDOCOLOR
>   +                                         : FB_VISUAL_TRUECOLOR;

Indeed. Will fix in v3.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
