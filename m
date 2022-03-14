Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84E4D85B2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 14:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6957510E641;
	Mon, 14 Mar 2022 13:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C987510E641
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 13:07:04 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id eq14so12435348qvb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NYteRwSae/wJ7882hcALEO6X99QTJhfde3GnJEVnXW0=;
 b=ZAQZ1dKpPc828CPxb8aHP1b6+DTJsSW4mXMZ4S1njxYBUuNp5eSmITSK80iKoEW1Tu
 IPitIgq20I6GYoDSVKZ6OER/7N3FolMSsfAGJfNNAQ2Qgb6f0+W2pgRm2wzpO9JNNi87
 pgShTsgU6hguTtUCGmwrlqgqz17Fg96/br24Pe0dvacCYFiTdl2UXigoUrkJVb6vCJbI
 46SFKtPc79bc8aQlj15xq+PewNtV5cT45QvZW7yvqVQm79OfZ6e2qW6VWBGyf2gBEJa6
 +/J4r6cpqgZn1JCFB9MWsujPeHzYRGjmNYOFAwPHWkSMsv/TRG4jzxGgsK58iJLrCQCc
 uiRQ==
X-Gm-Message-State: AOAM531vju4ykgTD2GFi3bIttOFSmLSfV4QHu/W4E1PL5oWsGQbm4904
 6eM/EzmegJdeBN9wBfkatm+yIl6rPHn5Nw==
X-Google-Smtp-Source: ABdhPJxgSih4t9MYgGJhRK7nNHxZJuXtdrLA+eZZYpBWRl1QqBVxZj9AAURJxmiH3My8c0f/uHmC/g==
X-Received: by 2002:a05:6214:23c8:b0:432:e69f:5d77 with SMTP id
 hr8-20020a05621423c800b00432e69f5d77mr16966181qvb.7.1647263223317; 
 Mon, 14 Mar 2022 06:07:03 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 n131-20020a372789000000b0067bce1ac001sm8019317qkn.71.2022.03.14.06.07.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:07:03 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2e51609648cso70166017b3.10
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:07:03 -0700 (PDT)
X-Received: by 2002:a81:5a08:0:b0:2db:d8c6:7e4f with SMTP id
 o8-20020a815a08000000b002dbd8c67e4fmr18671807ywb.256.1647263222744; Mon, 14
 Mar 2022 06:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646683737.git.geert@linux-m68k.org>
 <cc84f1fcd0901ba58a2e4fd34c43846c622fd157.1646683737.git.geert@linux-m68k.org>
 <CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com>
 <CAMuHMdWbss2TY0J44PitLGCmCOBKcF0QrPv6CKe1r=2qD0+YLA@mail.gmail.com>
In-Reply-To: <CAMuHMdWbss2TY0J44PitLGCmCOBKcF0QrPv6CKe1r=2qD0+YLA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Mar 2022 14:06:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFfe5sekY9vDNRL0AP5_9_h4wiyPcsYywdNsKaTFsHmA@mail.gmail.com>
Message-ID: <CAMuHMdUFfe5sekY9vDNRL0AP5_9_h4wiyPcsYywdNsKaTFsHmA@mail.gmail.com>
Subject: Re: [PATCH libdrm 3/3] util: Add SMPTE pattern support for C4 format
To: Ilia Mirkin <imirkin@alum.mit.edu>
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

Hi Ilia,

On Tue, Mar 8, 2022 at 8:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Mar 7, 2022 at 10:23 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > On Mon, Mar 7, 2022 at 3:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> > > index 953bf95492ee150c..42d75d700700dc3d 100644
> > > --- a/tests/util/pattern.c
> > > +++ b/tests/util/pattern.c
> > > @@ -608,6 +608,46 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
> > >  static unsigned int smpte_middle[7] = { 6, 7, 4, 7, 2, 7, 0 };
> > >  static unsigned int smpte_bottom[8] = { 8, 9, 10, 7, 11, 7, 12, 7 };
> > >
> > > +static void write_pixel_4(uint8_t *mem, unsigned int x, unsigned int pixel)
> > > +{
> > > +       if (x & 1)
> > > +               mem[x / 2] = (mem[x / 2] & 0xf0) | (pixel & 0x0f);
> > > +       else
> > > +               mem[x / 2] = (mem[x / 2] & 0x0f) | (pixel << 4);
> > > +}
> >
> > The standard layout is MSB? i.e. first pixel goes in the upper bits of
> > the first byte? It's been ages since I've dealt with C4 (or perhaps I
> > never even touched it), but this seems a bit surprising.
>
> Exactly. All register documentation I've ever seen shows the MSB on
> the left, i.e. for bytes:
>
>      MSB                         LSB
>     +---+---+---+---+---+---+---+---+
>     | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
>     +---+---+---+---+---+---+---+---+
>
> IBM used to count bits in the reverse order, but still had MSB left:
>
>      MSB                         LSB
>     +---+---+---+---+---+---+---+---+
>     | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
>     +---+---+---+---+---+---+---+---+
>
> If the reverse ordering of pixels is ever needed, a new fourcc code can
> be introduced.  Note that the fbdev API has support for both orderings
> (see fb_bitfield.msb_right), but no driver ever sets msb_right = 1,
> hence the fbdev core doesn't support it yet.

Turns out I was wrong: fbdev ordering follows native ordering, and
there's also FBINFO_FOREIGN_ENDIAN  :-(

I'll reply to the thread that introduced the format.
https://lore.kernel.org/all/8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
