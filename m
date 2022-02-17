Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8BC4B9D68
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E34410EBBC;
	Thu, 17 Feb 2022 10:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71F510EBBF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 10:42:42 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id y4so5657226vsd.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 02:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=URz3vGbBYIEN5IQJZpThn97AmYBtZHbYQoPJObvpYus=;
 b=TwxCfgoUXw91Ce3R/Hm7sv5+z0aCPlSUQKi2gKRXjT766ofyxAPXbIM9SC3vmoDcWe
 bwWL2g2g2Q5S8eW37BInBR5oUiLDFT0e0i3zkWXzYQI3p5tKXTgFRPi/rTr81oUDHxef
 LTVgJiGMSEC18Gk7OETM/QexthnHlrrgzKo5GiGUHrNSBT735UDamLxmObRD5ulsmpep
 zfkz8K1rBtIvnIIB3JJl91erd1bUWvCvm0noDAEMEiUlplk/eY/Z+oJEGxbFEGbtFweQ
 lo04GjV5dPVigNj7C4aqgQ7rOAttxeBJvav/5pSE3Zku6GmJ/keu0LclYACyOXlYr+KY
 UQnA==
X-Gm-Message-State: AOAM530wYjSdvFaGMH62lRpSkn3zSIUHwzjMYqZnferA2ZpqKfIAJ3eo
 cmASDIlnoPvQreBGQLjrnhhuMyWHxGy+Zg==
X-Google-Smtp-Source: ABdhPJwtzanzDDvz6MBigGotf0rop04yKotOxCMKEo8S3SYyV3HvzAKa3yz3mvnL77kuSUKKgZQSYg==
X-Received: by 2002:a67:2e4c:0:b0:31b:91a5:5b51 with SMTP id
 u73-20020a672e4c000000b0031b91a55b51mr783356vsu.77.1645094561246; 
 Thu, 17 Feb 2022 02:42:41 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id h20sm841813vsk.16.2022.02.17.02.42.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 02:42:41 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id 102so266540uag.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 02:42:40 -0800 (PST)
X-Received: by 2002:ab0:750e:0:b0:33e:8f30:e8ec with SMTP id
 m14-20020ab0750e000000b0033e8f30e8ecmr816005uap.114.1645094560576; Thu, 17
 Feb 2022 02:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-9-geert@linux-m68k.org>
 <20220217121033.0fc7f6ba@eldfell>
In-Reply-To: <20220217121033.0fc7f6ba@eldfell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Feb 2022 11:42:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXf3tFLb16Y=wh5C3QUYN4PdCjaYPCzMOTCye-eYS-N8w@mail.gmail.com>
Message-ID: <CAMuHMdXf3tFLb16Y=wh5C3QUYN4PdCjaYPCzMOTCye-eYS-N8w@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/fourcc: Add DRM_FORMAT_D1
To: Pekka Paalanen <ppaalanen@gmail.com>
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
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Thu, Feb 17, 2022 at 11:10 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Tue, 15 Feb 2022 17:52:26 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Introduce a fourcc code for a single-channel frame buffer format with two
> > darkness levels.  This can be used for two-level dark-on-light displays.
> >
> > As the number of bits per pixel is less than eight, this relies on
> > proper block handling for the calculation of bits per pixel and pitch.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -151,6 +151,8 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >               { .format = DRM_FORMAT_C4,              .depth = 4,  .num_planes = 1,
> >                 .char_per_block = { 1, }, .block_w = { 2, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_C8,              .depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +             { .format = DRM_FORMAT_D1,              .depth = 1,  .num_planes = 1,
> > +               .char_per_block = { 1, }, .block_w = { 8, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_R1,              .depth = 1,  .num_planes = 1,
> >                 .char_per_block = { 1, }, .block_w = { 8, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_R2,              .depth = 2,  .num_planes = 1,
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 8605a1acc6813e6c..c15c6efcc65e5827 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -104,6 +104,9 @@ extern "C" {
> >  #define DRM_FORMAT_C4                fourcc_code('C', '4', ' ', ' ') /* [3:0] C */
> >  #define DRM_FORMAT_C8                fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
> >
> > +/* 1 bpp Darkness */
> > +#define DRM_FORMAT_D1                fourcc_code('D', '1', ' ', ' ') /* [0] D */
> > +
>
> the same comment here as for C1 and R1 formats, need to specify pixel
> ordering inside a byte.

Right, will do.

> I think it would also be good to explain the rationale why C1 and R1
> are not suitable for this case and we need yet another 1-bit format in
> the commit message.
>
> For posterity, of course. I roughly remember the discussions.

C1 is color-indexed, which can be any two colors.
R1 is light-on-dark.
D1 is dark-on-light.

> I also wonder if anyone would actually use D1. Should it be added
> anyway? There is no rule that a pixel format must be used inside the
> kernel AFAIK, but is there even a prospective userspace wanting this?
>
> Exposing R1 and inverting bits while copying to hardware might be
> enough?

That's an option.  The repaper driver does that:

    drm_fb_xrgb8888_to_gray8(buf, 0, cma_obj->vaddr, fb, &clip);
    repaper_gray8_to_mono_reversed(buf, fb->width, fb->height);

Can drm_framebuffer objects be backed by graphics memory, i.e.
can they be displayed without copying?

> >  /* 1 bpp Red */
> >  #define DRM_FORMAT_R1                fourcc_code('R', '1', ' ', ' ') /* [0] R */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
