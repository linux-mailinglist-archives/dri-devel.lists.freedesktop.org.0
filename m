Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF74D866E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D3210E257;
	Mon, 14 Mar 2022 14:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CBD10E257
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 14:06:16 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id s16so12795569qks.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 07:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3uOgYqhY1EvXY8jA39r2XJq9ZyYNg5/RWB1bxjJJ5no=;
 b=Q2H/GursyuY+rG66JpSb77sSGITypz4GkUDv7shZF1nsf2ke4AIYwt1dl4LnOLVzLq
 l9d8/WDeoOZGs/I12u6lCqb4CYcmQFDlGgSTqwdohZyqof0enob+YRdqwbyAQhpst+T9
 mbrPacv/vtQEHnO7hiKvG4nahY41cWcLrdzgkJUsHjltFr489WI6yPdFF1OO3abgCO4r
 P4NSOMOuMXDXO3Wf6zlOdLog79THsEzL2GAbUh+BraUqgfXoPpnEpFpe5fkcUJ156URv
 /SXyi6LOVomvsPd/pYPxDHZalMuxcTbII3RXK9We+0LcxNddwwcw2VwfYZQTbMvUiiAw
 VSgw==
X-Gm-Message-State: AOAM533LOZpxbiDycnvcHBiT1cD8ao4l8YyNqfa4kaC6axTtXdW0DXf2
 oW8eKgPuxzVZ/85LysWzjT3GEmkuMYLEhA==
X-Google-Smtp-Source: ABdhPJxsUCbcmxRyntOjgD4C0kf3+hdpqvgO6vizJQCG2YgyZ2GCNpz3ayh6Uf8GzKQ7hutmYQIO1A==
X-Received: by 2002:a37:9d13:0:b0:49b:66ac:1729 with SMTP id
 g19-20020a379d13000000b0049b66ac1729mr14405757qke.592.1647266775481; 
 Mon, 14 Mar 2022 07:06:15 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a108900b0067b13036bd5sm7880417qkk.52.2022.03.14.07.06.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 07:06:15 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id u3so30995096ybh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 07:06:14 -0700 (PDT)
X-Received: by 2002:a25:dfd3:0:b0:629:24ff:eab0 with SMTP id
 w202-20020a25dfd3000000b0062924ffeab0mr17628564ybg.613.1647266774463; Mon, 14
 Mar 2022 07:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646683737.git.geert@linux-m68k.org>
 <cc84f1fcd0901ba58a2e4fd34c43846c622fd157.1646683737.git.geert@linux-m68k.org>
 <CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com>
 <CAMuHMdWbss2TY0J44PitLGCmCOBKcF0QrPv6CKe1r=2qD0+YLA@mail.gmail.com>
 <CAMuHMdUFfe5sekY9vDNRL0AP5_9_h4wiyPcsYywdNsKaTFsHmA@mail.gmail.com>
 <CAKb7UviCU38H_v3HVB5pKJvOFHdQqaAn9s7c8rwUPxhf3bq+5g@mail.gmail.com>
In-Reply-To: <CAKb7UviCU38H_v3HVB5pKJvOFHdQqaAn9s7c8rwUPxhf3bq+5g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Mar 2022 15:06:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6rEnB-8KQP2=2aUKPzqAH=EpX0Vpt6x=rAxa1hqTv1g@mail.gmail.com>
Message-ID: <CAMuHMdV6rEnB-8KQP2=2aUKPzqAH=EpX0Vpt6x=rAxa1hqTv1g@mail.gmail.com>
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

On Mon, Mar 14, 2022 at 2:44 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Mon, Mar 14, 2022 at 9:07 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Mar 8, 2022 at 8:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Mon, Mar 7, 2022 at 10:23 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > > On Mon, Mar 7, 2022 at 3:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> > > > > index 953bf95492ee150c..42d75d700700dc3d 100644
> > > > > --- a/tests/util/pattern.c
> > > > > +++ b/tests/util/pattern.c
> > > > > @@ -608,6 +608,46 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
> > > > >  static unsigned int smpte_middle[7] = { 6, 7, 4, 7, 2, 7, 0 };
> > > > >  static unsigned int smpte_bottom[8] = { 8, 9, 10, 7, 11, 7, 12, 7 };
> > > > >
> > > > > +static void write_pixel_4(uint8_t *mem, unsigned int x, unsigned int pixel)
> > > > > +{
> > > > > +       if (x & 1)
> > > > > +               mem[x / 2] = (mem[x / 2] & 0xf0) | (pixel & 0x0f);
> > > > > +       else
> > > > > +               mem[x / 2] = (mem[x / 2] & 0x0f) | (pixel << 4);
> > > > > +}
> > > >
> > > > The standard layout is MSB? i.e. first pixel goes in the upper bits of
> > > > the first byte? It's been ages since I've dealt with C4 (or perhaps I
> > > > never even touched it), but this seems a bit surprising.
> > >
> > > Exactly. All register documentation I've ever seen shows the MSB on
> > > the left, i.e. for bytes:
> > >
> > >      MSB                         LSB
> > >     +---+---+---+---+---+---+---+---+
> > >     | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
> > >     +---+---+---+---+---+---+---+---+
> > >
> > > IBM used to count bits in the reverse order, but still had MSB left:
> > >
> > >      MSB                         LSB
> > >     +---+---+---+---+---+---+---+---+
> > >     | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
> > >     +---+---+---+---+---+---+---+---+
> > >
> > > If the reverse ordering of pixels is ever needed, a new fourcc code can
> > > be introduced.  Note that the fbdev API has support for both orderings
> > > (see fb_bitfield.msb_right), but no driver ever sets msb_right = 1,
> > > hence the fbdev core doesn't support it yet.
> >
> > Turns out I was wrong: fbdev ordering follows native ordering, and
> > there's also FBINFO_FOREIGN_ENDIAN  :-(
>
> I haven't double-checked the meaning in fbdev, but ENDIAN-ness
> generally refers to the layout of *bytes*, not *bits*. Although one
> could also argue that it's the layout of "elements", and so in that
> way, upper/lower values could be considered flipped. I've never gone
> that far though.

Yes, usually it refers to the ordering of bytes in a word.
Here, it's about the ordering of sub-byte pixels in a byte.
Note that with C2 and C4, there's a third ordering that comes into
play.
So we have:
  1. Ordering of bytes in a word, for bpp > 8,
  2. Ordering of pixels in a byte, for bpp < 8,
  3. Ordering of bits in a pixel, for bpp > 1.

1. Is handled by DRM_FORMAT_BIG_ENDIAN.
2. Is what we need to handle here.
   As bpp cannot be both < 8 and > 8, I think reusing
   DRM_FORMAT_BIG_ENDIAN is OK.
3. Is handled by fb_bitfield.msb_right, and always false
    (i.e. no driver ever set it).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
