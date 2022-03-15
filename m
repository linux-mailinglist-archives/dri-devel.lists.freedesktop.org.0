Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9CB4D95A2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 08:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14BE10E3F0;
	Tue, 15 Mar 2022 07:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3527C10E3F0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 07:51:48 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id j21so8832867qta.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 00:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ObFdDEGPbS4cXSj2f1wbzT/S3dzkw4/ydKSbGaEoIE=;
 b=XJKkYUHZI/j7oREzetKflROzTCoh0FOmupqKLSH0mfIdPrn3Ai3vRmpnXi28vWpXUh
 9VpV202zdL8MvRNPrj5K/Xo8EEnhHddBXyk7Gr2+mrDVIfVlDcfmcOgDq9/QzDuOIqqv
 5IP8ejpyAdS1s8l2U7ZQYVLRkFp7sFPl61zspiTtFg+GJ6ZCX0fLLR6IqALOntIdzkSd
 P7B+cCQGxpMC+4O4spEvZ/3I62mZWB82P0TJyObs1mbohP4ABgzUdnr0ev1VqMQQ6ipx
 dqsS1xTg4TCpbY3eEUvOwx1czrBMCi0sdYVSK3DyhzJYkSqlHg/A6oVUiiZSOdZxfk0E
 8QEg==
X-Gm-Message-State: AOAM531M2uTLKDwQoPw1Nk7cS/36iPgYwYmMmRKfylGqGl/9Z85NP/HR
 PU8IQRbnWyHU/uFinVq99rRD2009LXRCyQ==
X-Google-Smtp-Source: ABdhPJz+i7mI/B9hc0CvFQm+6N9tQt+0QhKF1D0hyF/rFU2qD08jQ2rEb4HhdiW9UtZpM+YaAU7eXA==
X-Received: by 2002:ac8:7d82:0:b0:2e1:ce18:abac with SMTP id
 c2-20020ac87d82000000b002e1ce18abacmr8387571qtd.365.1647330706157; 
 Tue, 15 Mar 2022 00:51:46 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 u17-20020a05622a14d100b002e1d620d2b0sm2782896qtx.14.2022.03.15.00.51.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 00:51:45 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so191380677b3.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 00:51:44 -0700 (PDT)
X-Received: by 2002:a81:6dd1:0:b0:2dc:56d1:1dae with SMTP id
 i200-20020a816dd1000000b002dc56d11daemr22488819ywc.479.1647330704238; Tue, 15
 Mar 2022 00:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646683502.git.geert@linux-m68k.org>
 <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
 <CAMuHMdVq19wpA_7nKKTm-G2EmK3cMxxP6nbR_u=vkazqCZ=KhQ@mail.gmail.com>
 <20220314170539.17400f93@eldfell>
 <CAMuHMdVj8wxAVbcov1wFsgt_knMkcySBH8nMoKjyr=G+mLQmjQ@mail.gmail.com>
 <1f915fcc-1d95-99d1-c7b7-dc4e3b49e09f@linux-m68k.org>
 <20220315093250.71352a56@eldfell>
In-Reply-To: <20220315093250.71352a56@eldfell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Mar 2022 08:51:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVU=JKwEn-=Wf3CYObtaLt2T7NmWrXUwdPHdvNsbgge=g@mail.gmail.com>
Message-ID: <CAMuHMdVU=JKwEn-=Wf3CYObtaLt2T7NmWrXUwdPHdvNsbgge=g@mail.gmail.com>
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
 Finn Thain <fthain@linux-m68k.org>, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Tue, Mar 15, 2022 at 8:33 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Tue, 15 Mar 2022 09:15:08 +1100 (AEDT)
> Finn Thain <fthain@linux-m68k.org> wrote:
> > On Mon, 14 Mar 2022, Geert Uytterhoeven wrote:
> > > On Mon, Mar 14, 2022 at 4:05 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > > On Mon, 14 Mar 2022 14:30:18 +0100
> > > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Mon, Mar 7, 2022 at 9:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > Introduce fourcc codes for color-indexed frame buffer formats with
> > > > > > two, four, and sixteen colors, and provide a mapping from bit per
> > > > > > pixel and depth to fourcc codes.
> > > > > >
> > > > > > As the number of bits per pixel is less than eight, these rely on
> > > > > > proper block handling for the calculation of bits per pixel and
> > > > > > pitch.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > >
> > > > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > @@ -99,7 +99,10 @@ extern "C" {
> > > > > >  #define DRM_FORMAT_INVALID     0
> > > > > >
> > > > > >  /* color index */
> > > > > > -#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
> > > > > > +#define DRM_FORMAT_C1          fourcc_code('C', '1', ' ', ' ') /* [7:0] C0:C1:C2:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
> > > > > > +#define DRM_FORMAT_C2          fourcc_code('C', '2', ' ', ' ') /* [7:0] C0:C1:C2:C3 2:2:2:2 four pixels/byte */
> > > > > > +#define DRM_FORMAT_C4          fourcc_code('C', '4', ' ', ' ') /* [7:0] C0:C1 4:4 two pixels/byte */
> > > > > > +#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0] C 8 one pixel/byte */
> > > > > >
> > > > > >  /* 8 bpp Red */
> > > > > >  #define DRM_FORMAT_R8          fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
> > > > >
> > > > > After replying to Ilia's comment[1], I realized the CFB drawing
> > > > > operations use native byte and bit ordering, unless
> > > > > FBINFO_FOREIGN_ENDIAN is set.
> > > > > While Amiga, Atari, and Sun-3 use big-endian bit ordering,
> > > > > e.g. Acorn VIDC[2] uses little endian, and SH7760[3] is configurable
> > > > > (sh7760fb configures ordering to match host order).
> > > > > BTW, ssd130{7fb,x}_update_rect() both assume little-endian, so I
> > > > > guess they are broken on big-endian.
> > > > > Fbtest uses big-endian bit ordering, so < 8 bpp is probably broken
> > > > > on little-endian.
> > > > >
> > > > > Hence the above should become:
> > > > >
> > > > >     #define DRM_FORMAT_C1          fourcc_code('C', '1', ' ', ' ') /*
> > > > > [7:0] C7:C6:C5:C4:C3:C2:C1:C0 1:1:1:1:1:1:1:1 eight pixels/byte */
> > > > >     #define DRM_FORMAT_C2          fourcc_code('C', '2', ' ', ' ') /*
> > > > > [7:0] C3:C2:C1:C0 2:2:2:2 four pixels/byte */
> > > > >     #define DRM_FORMAT_C4          fourcc_code('C', '4', ' ', ' ') /*
> > > > > [7:0] C1:C0 4:4 two pixels/byte */
> > > > >
> > > > > The same changes should be made for DRM_FORMAT_[RD][124].
> > > > >
> > > > > The fbdev emulation code should gain support for these with and without
> > > > > DRM_FORMAT_BIG_ENDIAN, the latter perhaps only on big-endian platforms?
> > > > >
> > > > > [1] https://lore.kernel.org/r/CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com/
> > > > > [2] See p.30 of the VIDC datasheet
> > > > >     http://chrisacorns.computinghistory.org.uk/docs/Acorn/Misc/Acorn_VIDC_Datasheet.pdf
> > > > > [3] See p.1178 of the SH7660 datasheet
> > > > >     https://datasheet.octopart.com/HD6417760BL200AV-Renesas-datasheet-14105759.pdf
> > > >
> > > > why would CPU endianess affect the order of bits in a byte?
> > >
> > > It doesn't, but see below.
> > >
> > > > Do you mean that bit 0 one machine is (1 << 0), and on another machine
> > > > bit 0 is (1 << 7)?
> > >
> > > No, I mean that in case of multiple pixels per byte, the display
> > > hardware pumps out pixels to the CRTC starting from either the MSB
> > > or the LSB of the first display byte.  Which order depends on the
> > > display hardware, not on the CPU.
> > >
> > > > In C, we have only one way to address bits of a byte and that is with
> > > > arithmetic. You cannot take the address of a bit any other way, can you?
> > > >
> > > > Can we standardise on "bit n of a byte is addressed as (1 << n)"?
> > >
> > > BIT(n) in Linux works the same for little- and big-endian CPUs.
> > > But display hardware may use a different bit order.
> >
> > Perhaps some of this confusion could be avoided if you describe the
> > problem in terms of the sequence of scan-out of pixels, rather than in
> > terms of the serialization of bits. The significance of bits within each
> > pixel and the ordering of pixels within each memory word are independent,
> > right?
>
> Yes, that might help.

Display:

     P0  P1  P2  P3  P4  P5  P6  P7  P8  P9 P10 P11 P12 P13 P14 P15

    P15 P14 P13 P12 P11 P10  P9  P8  P7  P6  P5  P4  P3  P2  P1  P0

Memory:

  1 bpp (MSB first):

              bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0
              ---- ---- ---- ---- ---- ---- ---- ----
      byte 0:   P0   P1   P2   P3   P4   P5   P6   P7
      byte 1:   P8   P9  P10  P11  P12  P13  P14  P15

  1 bpp (LSB first):

              bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0
              ---- ---- ---- ---- ---- ---- ---- ----
      byte 0:   P7   P6   P5   P4   P3   P2   P1   P0
      byte 1:  P15  P14  P13  P12  P11  P10   P9   P8

  2 bpp (MSB first):

              bits7-6 bits5-4 bits3-2 bits1-0
              ------- ------- ------- -------
      byte 0:    P0      P1      P2      P3
      byte 1:    P4      P5      P6      P7
      byte 2:    P8      P9     P10     P11
      byte 3:   P12     P13     P14     P15

  2 bpp (LSB first):

              bits7-6 bits5-4 bits3-2 bits1-0
              ------- ------- ------- -------
      byte 0:    P3      P2      P1      P0
      byte 1:    P7      P6      P5      P4
      byte 2:   P11     P10      P9      P8
      byte 3:   P15     P14     P13     P12

  4 bpp (MSB first):

              bits7-4 bits3-0
              ------- -------
      byte 0:    P0      P1
      byte 1:    P2      P3
      byte 2:    P4      P5
      byte 3:    P6      P7
      byte 4:    P8      P9
      byte 5:   P10     P11
      byte 6:   P12     P13
      byte 7:   P14     P15

  4 bpp (LSB first):

              bits7-4 bits3-0
              ------- -------
      byte 0:    P1      P0
      byte 1:    P3      P2
      byte 2:    P5      P4
      byte 3:    P7      P6
      byte 4:    P9      P8
      byte 5:   P11     P10
      byte 6:   P13     P12
      byte 7:   P15     P14

> Also, when drm_fourcc.h is describing pixel formats, it needs to
> consider only how a little-endian CPU accesses them. That's how pixel
> data in memory is described. Display hardware plays no part in that.
> It is the driver's job to expose the pixel formats that match display
> hardware behaviour.

But if the "CPU format" does not match the "display support",
all pixel data must be converted?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
