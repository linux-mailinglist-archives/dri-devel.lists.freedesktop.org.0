Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79144D8713
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC1A10E317;
	Mon, 14 Mar 2022 14:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632C010E317
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 14:39:53 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id 195so18538481iou.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 07:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=maKP7OGKbJexFkAiggLB06p7A04p57g/+KrVwPSIydQ=;
 b=1/rzFBeDM4E2yTJupsbKlbhrQcI6I6A3TvLLTre/SA8OAybxwxuiqTOvPN0RFTni8X
 7KvJI8mOMt17iu/2zp/aZsB+rkKMXEfnI37GpPuiP2r694wd08TohsPNzjI5XwTeBjmF
 Be5OUdmZVfOOkUdIZlsY/2CCEVXSz0w7/2CNYJXV/b8zVtZTOOUa1eJBnXnqUlQebpy2
 oLbFZd1ymvNuZH88vmltT1Ol4WUkMNnQKuGya6UXNUXUQJ1+KP4wJ7uvy3FbCdXFTh0c
 dweQCYJLpKVoffpyaLYerij2SnnYgfJSZvsZgS59kqw8Bkta4rhXvuEJmLR0ZRPl01v3
 5qgg==
X-Gm-Message-State: AOAM530DKTWda9HhdO1ETBQJcCbkeqdDWww8ZslUFRtQpyRVwCm8iWS8
 mZkuGB+XdVJaZiIDFoLayi9Ni7YWA36q+MUhcSU=
X-Google-Smtp-Source: ABdhPJySsA16ckfM+uP2LPiws5r6TOe1DgFFgSO3FAiD5wE07DSx7jVjtLjySz+UAIp9r4Gy7JEd8dQAQ7LPBE9R9jg=
X-Received: by 2002:a6b:fd0c:0:b0:645:d261:ba25 with SMTP id
 c12-20020a6bfd0c000000b00645d261ba25mr19814121ioi.124.1647268792707; Mon, 14
 Mar 2022 07:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646683737.git.geert@linux-m68k.org>
 <cc84f1fcd0901ba58a2e4fd34c43846c622fd157.1646683737.git.geert@linux-m68k.org>
 <CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com>
 <CAMuHMdWbss2TY0J44PitLGCmCOBKcF0QrPv6CKe1r=2qD0+YLA@mail.gmail.com>
 <CAMuHMdUFfe5sekY9vDNRL0AP5_9_h4wiyPcsYywdNsKaTFsHmA@mail.gmail.com>
 <CAKb7UviCU38H_v3HVB5pKJvOFHdQqaAn9s7c8rwUPxhf3bq+5g@mail.gmail.com>
 <CAMuHMdV6rEnB-8KQP2=2aUKPzqAH=EpX0Vpt6x=rAxa1hqTv1g@mail.gmail.com>
In-Reply-To: <CAMuHMdV6rEnB-8KQP2=2aUKPzqAH=EpX0Vpt6x=rAxa1hqTv1g@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 14 Mar 2022 10:39:41 -0400
Message-ID: <CAKb7Uvjk3xzabe_bSFSXPhSdtgR=ZUTNcNXx_jeP5=AujO7N3A@mail.gmail.com>
Subject: Re: [PATCH libdrm 3/3] util: Add SMPTE pattern support for C4 format
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 10:06 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Ilia,
>
> On Mon, Mar 14, 2022 at 2:44 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > On Mon, Mar 14, 2022 at 9:07 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Mar 8, 2022 at 8:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Mon, Mar 7, 2022 at 10:23 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > > > On Mon, Mar 7, 2022 at 3:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> > > > > > index 953bf95492ee150c..42d75d700700dc3d 100644
> > > > > > --- a/tests/util/pattern.c
> > > > > > +++ b/tests/util/pattern.c
> > > > > > @@ -608,6 +608,46 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
> > > > > >  static unsigned int smpte_middle[7] = { 6, 7, 4, 7, 2, 7, 0 };
> > > > > >  static unsigned int smpte_bottom[8] = { 8, 9, 10, 7, 11, 7, 12, 7 };
> > > > > >
> > > > > > +static void write_pixel_4(uint8_t *mem, unsigned int x, unsigned int pixel)
> > > > > > +{
> > > > > > +       if (x & 1)
> > > > > > +               mem[x / 2] = (mem[x / 2] & 0xf0) | (pixel & 0x0f);
> > > > > > +       else
> > > > > > +               mem[x / 2] = (mem[x / 2] & 0x0f) | (pixel << 4);
> > > > > > +}
> > > > >
> > > > > The standard layout is MSB? i.e. first pixel goes in the upper bits of
> > > > > the first byte? It's been ages since I've dealt with C4 (or perhaps I
> > > > > never even touched it), but this seems a bit surprising.
> > > >
> > > > Exactly. All register documentation I've ever seen shows the MSB on
> > > > the left, i.e. for bytes:
> > > >
> > > >      MSB                         LSB
> > > >     +---+---+---+---+---+---+---+---+
> > > >     | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
> > > >     +---+---+---+---+---+---+---+---+
> > > >
> > > > IBM used to count bits in the reverse order, but still had MSB left:
> > > >
> > > >      MSB                         LSB
> > > >     +---+---+---+---+---+---+---+---+
> > > >     | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
> > > >     +---+---+---+---+---+---+---+---+
> > > >
> > > > If the reverse ordering of pixels is ever needed, a new fourcc code can
> > > > be introduced.  Note that the fbdev API has support for both orderings
> > > > (see fb_bitfield.msb_right), but no driver ever sets msb_right = 1,
> > > > hence the fbdev core doesn't support it yet.
> > >
> > > Turns out I was wrong: fbdev ordering follows native ordering, and
> > > there's also FBINFO_FOREIGN_ENDIAN  :-(
> >
> > I haven't double-checked the meaning in fbdev, but ENDIAN-ness
> > generally refers to the layout of *bytes*, not *bits*. Although one
> > could also argue that it's the layout of "elements", and so in that
> > way, upper/lower values could be considered flipped. I've never gone
> > that far though.
>
> Yes, usually it refers to the ordering of bytes in a word.
> Here, it's about the ordering of sub-byte pixels in a byte.
> Note that with C2 and C4, there's a third ordering that comes into
> play.
> So we have:
>   1. Ordering of bytes in a word, for bpp > 8,
>   2. Ordering of pixels in a byte, for bpp < 8,
>   3. Ordering of bits in a pixel, for bpp > 1.
>
> 1. Is handled by DRM_FORMAT_BIG_ENDIAN.

OK. Note that DRM_FORMAT_BIG_ENDIAN flag for formats other than
RGBX8888 and very similar formats is basically broken in drm. So ...
watch out. There are two setups supported for big-endian currently:

1. Legacy: radeon/nouveau, ignore the "little endian" comment about
formats and only supports AddFB, not AddFB2. The former only has
depth/bpp, not the actual format, anyways. This matches what current
user-space expects too. (quirk_addfb_prefer_host_byte_order = 1)
2. AddFB2 support with proper formats. Only used for vmwgfx and virgl
in practice for BE, IIRC. Only supports 32-bit 8bpc formats, and uses
some helpers to just flip around DRM_FORMAT_BIG_ENDIAN bit to an
equivalent format in the frontend api handling. This obviously won't
work for other formats, but none of the helpers are ready to receive
the BIG_ENDIAN bit.

Cheers,

  -ilia
