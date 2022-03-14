Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AA44D8C03
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 20:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ECF10E35F;
	Mon, 14 Mar 2022 19:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1306910E36D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 19:01:33 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id q4so13582823qki.11
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 12:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9wa7IOBiuASlB+32+n56EcLNxFBqD1voa0yMtMLvTIY=;
 b=U/bIdIxl2dInfTF3EFj0ghqzCCUv36vr+GvTHsafsb/rSUh7Lxp6KlLKHvO4LjQjzw
 WMZ25vRqBK3IWfKpTlP6dAfV/OOC8B0DEhz8ynwHrwtA8nxentwbSwvg396IJkxl7lmf
 QQD/6OqwvVUNHD1lxC3QcTWe1lDVSVmaDcnnrH6Y0dxRcfchtNxJfGmk5afBf7Rk7QeW
 bgmtRxExxsEE46f8IiP7welflc31UOm7kM1BgcnebFZreN6tV7LupZLaE40SPaRD4Qw1
 JVjFR89B3H8lqscLjTM62nmY2gE2bycy7BY5JfG6KckA2MX1WJt/uQzn5n1OkS+H8kgl
 sZaA==
X-Gm-Message-State: AOAM532NphpmGRn5Arx6sXuN4KRPbenu2bAyf1mlVNvUx5Iky83Tkogn
 dNrpQvi+ZTiUEO7964O9D3c5W8g0WBW56g==
X-Google-Smtp-Source: ABdhPJxRjJ3/t65b7gIgYl2aOEX/96XHt2PlZoGLjYP/d/M5mKa9cXxT5fQGCwXt8POfPYak8XXITg==
X-Received: by 2002:a05:620a:2993:b0:67d:7119:9f19 with SMTP id
 r19-20020a05620a299300b0067d71199f19mr12421828qkp.494.1647284491738; 
 Mon, 14 Mar 2022 12:01:31 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 b202-20020ae9ebd3000000b0067b11d53365sm8101914qkg.47.2022.03.14.12.01.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 12:01:31 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id e186so32683986ybc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 12:01:31 -0700 (PDT)
X-Received: by 2002:a25:d782:0:b0:628:942b:3815 with SMTP id
 o124-20020a25d782000000b00628942b3815mr20400266ybg.393.1647284490932; Mon, 14
 Mar 2022 12:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646683502.git.geert@linux-m68k.org>
 <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
 <CAMuHMdVq19wpA_7nKKTm-G2EmK3cMxxP6nbR_u=vkazqCZ=KhQ@mail.gmail.com>
 <20220314170539.17400f93@eldfell>
In-Reply-To: <20220314170539.17400f93@eldfell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Mar 2022 20:01:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVj8wxAVbcov1wFsgt_knMkcySBH8nMoKjyr=G+mLQmjQ@mail.gmail.com>
Message-ID: <CAMuHMdVj8wxAVbcov1wFsgt_knMkcySBH8nMoKjyr=G+mLQmjQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] drm/fourcc: Add DRM_FORMAT_C[124]
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Mon, Mar 14, 2022 at 4:05 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Mon, 14 Mar 2022 14:30:18 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Mar 7, 2022 at 9:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > Introduce fourcc codes for color-indexed frame buffer formats with two,
> > > four, and sixteen colors, and provide a mapping from bit per pixel and
> > > depth to fourcc codes.
> > >
> > > As the number of bits per pixel is less than eight, these rely on proper
> > > block handling for the calculation of bits per pixel and pitch.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -99,7 +99,10 @@ extern "C" {
> > >  #define DRM_FORMAT_INVALID     0
> > >
> > >  /* color index */
> > > -#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
> > > +#define DRM_FORMAT_C1          fourcc_code('C', '1', ' ', ' ') /* [7:0] C0:C1:C2:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
> > > +#define DRM_FORMAT_C2          fourcc_code('C', '2', ' ', ' ') /* [7:0] C0:C1:C2:C3 2:2:2:2 four pixels/byte */
> > > +#define DRM_FORMAT_C4          fourcc_code('C', '4', ' ', ' ') /* [7:0] C0:C1 4:4 two pixels/byte */
> > > +#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0] C 8 one pixel/byte */
> > >
> > >  /* 8 bpp Red */
> > >  #define DRM_FORMAT_R8          fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
> >
> > After replying to Ilia's comment[1], I realized the CFB drawing
> > operations use native byte and bit ordering, unless
> > FBINFO_FOREIGN_ENDIAN is set.
> > While Amiga, Atari, and Sun-3 use big-endian bit ordering,
> > e.g. Acorn VIDC[2] uses little endian, and SH7760[3] is configurable
> > (sh7760fb configures ordering to match host order).
> > BTW, ssd130{7fb,x}_update_rect() both assume little-endian, so I
> > guess they are broken on big-endian.
> > Fbtest uses big-endian bit ordering, so < 8 bpp is probably broken
> > on little-endian.
> >
> > Hence the above should become:
> >
> >     #define DRM_FORMAT_C1          fourcc_code('C', '1', ' ', ' ') /*
> > [7:0] C7:C6:C5:C4:C3:C2:C1:C0 1:1:1:1:1:1:1:1 eight pixels/byte */
> >     #define DRM_FORMAT_C2          fourcc_code('C', '2', ' ', ' ') /*
> > [7:0] C3:C2:C1:C0 2:2:2:2 four pixels/byte */
> >     #define DRM_FORMAT_C4          fourcc_code('C', '4', ' ', ' ') /*
> > [7:0] C1:C0 4:4 two pixels/byte */
> >
> > The same changes should be made for DRM_FORMAT_[RD][124].
> >
> > The fbdev emulation code should gain support for these with and without
> > DRM_FORMAT_BIG_ENDIAN, the latter perhaps only on big-endian platforms?
> >
> > [1] https://lore.kernel.org/r/CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com/
> > [2] See p.30 of the VIDC datasheet
> >     http://chrisacorns.computinghistory.org.uk/docs/Acorn/Misc/Acorn_VIDC_Datasheet.pdf
> > [3] See p.1178 of the SH7660 datasheet
> >     https://datasheet.octopart.com/HD6417760BL200AV-Renesas-datasheet-14105759.pdf
>
> why would CPU endianess affect the order of bits in a byte?

It doesn't, but see below.

> Do you mean that bit 0 one machine is (1 << 0), and on another machine
> bit 0 is (1 << 7)?

No, I mean that in case of multiple pixels per byte, the display
hardware pumps out pixels to the CRTC starting from either the MSB
or the LSB of the first display byte.  Which order depends on the
display hardware, not on the CPU.

> In C, we have only one way to address bits of a byte and that is with
> arithmetic. You cannot take the address of a bit any other way, can you?
>
> Can we standardise on "bit n of a byte is addressed as (1 << n)"?

BIT(n) in Linux works the same for little- and big-endian CPUs.
But display hardware may use a different bit order.

> I don't mind in which order the pixels are inside a byte, as long as it
> doesn't change by CPU endianess. If you need both directions, then use
> two different drm_fourcc codes that do not change their meaning by CPU
> endianess. Just like we have XRGB and BGRX formats.

OK.

> I would not like to see DRM_FORMAT_BIG_ENDIAN used for this, it would
> conflate a whole new concept into the mess that is little- vs.
> big-endian.

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
