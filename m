Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372B4D862D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 14:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FC210EBDB;
	Mon, 14 Mar 2022 13:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FD210EBDD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 13:44:06 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id h7so10995527ile.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qxNSQ6u0Ke8tCKdWfgmIZVWN+zSeGRNuOVV9876mlgw=;
 b=emoq9DdrcOdc/pCm1hXZFlAYWDPbpsxqQk8S9As9Fg9LPi1YdTh9S58xSST6U8ZgqR
 jWyVhevhmGzhVKOYUG9FWVgTUWq2eafHRncXD2dxNCfdd7lpEdY/rQ/0JpjXOhDN71sf
 qhVoVyLxX9ZoQhh0VvEHIFxYi/+JLqWTJdxWMo9CX5sXax+tv6L32iYt3u8h2zG2SwrU
 RjHec15MEEFyA5SYC39SmxwKdCC/TfMd7IBbYZINrHKfQEqJV4a1Yl/Hcl/pHfW3JofC
 LXvwvZh4HPbtSjXdab3mpdNt/3Qg+c6SUb2hu7Qz1nCefvAkDBBKJ3XViisL4CFH7FO0
 i5NQ==
X-Gm-Message-State: AOAM531c5y1983upyfDvSWo8t7BG7bpLLEK3/MJIcjn9iPKw4EeL0HHU
 HuI8PsCXg8ps4B7vDEfqEF5eG/z1FOL+A4uh07yatK46
X-Google-Smtp-Source: ABdhPJzfklIrxWeEvBaBDsNOlZbw87hwLV/9abKDucIjQMhNr1gTuwGjhLSXcKi+BuEAtmcQMZXy2n83Ko/x5MFZ314=
X-Received: by 2002:a92:1902:0:b0:2c7:94cb:14b6 with SMTP id
 2-20020a921902000000b002c794cb14b6mr7413868ilz.70.1647265445389; Mon, 14 Mar
 2022 06:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646683737.git.geert@linux-m68k.org>
 <cc84f1fcd0901ba58a2e4fd34c43846c622fd157.1646683737.git.geert@linux-m68k.org>
 <CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com>
 <CAMuHMdWbss2TY0J44PitLGCmCOBKcF0QrPv6CKe1r=2qD0+YLA@mail.gmail.com>
 <CAMuHMdUFfe5sekY9vDNRL0AP5_9_h4wiyPcsYywdNsKaTFsHmA@mail.gmail.com>
In-Reply-To: <CAMuHMdUFfe5sekY9vDNRL0AP5_9_h4wiyPcsYywdNsKaTFsHmA@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 14 Mar 2022 09:43:54 -0400
Message-ID: <CAKb7UviCU38H_v3HVB5pKJvOFHdQqaAn9s7c8rwUPxhf3bq+5g@mail.gmail.com>
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

On Mon, Mar 14, 2022 at 9:07 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ilia,
>
> On Tue, Mar 8, 2022 at 8:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Mar 7, 2022 at 10:23 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > On Mon, Mar 7, 2022 at 3:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> > > > index 953bf95492ee150c..42d75d700700dc3d 100644
> > > > --- a/tests/util/pattern.c
> > > > +++ b/tests/util/pattern.c
> > > > @@ -608,6 +608,46 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
> > > >  static unsigned int smpte_middle[7] = { 6, 7, 4, 7, 2, 7, 0 };
> > > >  static unsigned int smpte_bottom[8] = { 8, 9, 10, 7, 11, 7, 12, 7 };
> > > >
> > > > +static void write_pixel_4(uint8_t *mem, unsigned int x, unsigned int pixel)
> > > > +{
> > > > +       if (x & 1)
> > > > +               mem[x / 2] = (mem[x / 2] & 0xf0) | (pixel & 0x0f);
> > > > +       else
> > > > +               mem[x / 2] = (mem[x / 2] & 0x0f) | (pixel << 4);
> > > > +}
> > >
> > > The standard layout is MSB? i.e. first pixel goes in the upper bits of
> > > the first byte? It's been ages since I've dealt with C4 (or perhaps I
> > > never even touched it), but this seems a bit surprising.
> >
> > Exactly. All register documentation I've ever seen shows the MSB on
> > the left, i.e. for bytes:
> >
> >      MSB                         LSB
> >     +---+---+---+---+---+---+---+---+
> >     | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
> >     +---+---+---+---+---+---+---+---+
> >
> > IBM used to count bits in the reverse order, but still had MSB left:
> >
> >      MSB                         LSB
> >     +---+---+---+---+---+---+---+---+
> >     | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
> >     +---+---+---+---+---+---+---+---+
> >
> > If the reverse ordering of pixels is ever needed, a new fourcc code can
> > be introduced.  Note that the fbdev API has support for both orderings
> > (see fb_bitfield.msb_right), but no driver ever sets msb_right = 1,
> > hence the fbdev core doesn't support it yet.
>
> Turns out I was wrong: fbdev ordering follows native ordering, and
> there's also FBINFO_FOREIGN_ENDIAN  :-(

I haven't double-checked the meaning in fbdev, but ENDIAN-ness
generally refers to the layout of *bytes*, not *bits*. Although one
could also argue that it's the layout of "elements", and so in that
way, upper/lower values could be considered flipped. I've never gone
that far though.

Cheers,

  -ilia
