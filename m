Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC14D8756
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3E210E846;
	Mon, 14 Mar 2022 14:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABB110E846
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 14:48:27 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id v15so12912858qkg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 07:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HLt9WUtSjuqAdAFWkE7AqCVj1rDoc3w5IF5wxwH+1iw=;
 b=wQSNTtIM0zZfMt07kZJrcEeQqktE/UQhP5/Ni5tSn5WNSSrMMhhzJ38cG08UslyhDY
 3QB3KB9jIX4QHZEvMGrQTHRLJWNlrkrFxDOh+p7tpXXvXmPqkGjLkhr/9JQYoFr39z1v
 t/JDJBNI6WsjQu8C5qVwQoXg5DkqLBbsEQlER3ZP5ngZVT6BII6t3ZMqAZ4oVF3zv5Ve
 3xyDaZ9kKC1xLSN1Q3cIZNwoRMcHSc+1NggEtdh93FDE8yWDSSoApgloX0ohZdXabCgP
 LIOz0Vz0DgxNnUm0f8PCLpSLtYqB/aiMC1GWs6pOWZ0cWGMn3/elDhbXVBN17vGrNXAC
 cvuQ==
X-Gm-Message-State: AOAM5311MkAhsspA/fGbKnm0FvW/Yjv9NfZClTM2QDED6sxi+zlD+OPY
 4JKXYFpzldXl7RMbNqlofKf7QamE0A+k9g==
X-Google-Smtp-Source: ABdhPJzSaZlz0BxlkW9PkKPvQjEYbgbpauFD2Vi13fIGir2SkGtqtwEWJs+weGRRbSpeMrjlVgq0wg==
X-Received: by 2002:a05:620a:170c:b0:67d:a6da:1dce with SMTP id
 az12-20020a05620a170c00b0067da6da1dcemr6433627qkb.116.1647269306146; 
 Mon, 14 Mar 2022 07:48:26 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05622a048d00b002e1ce0c627csm3154536qtx.58.2022.03.14.07.48.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 07:48:25 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso166099467b3.9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 07:48:25 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr19389368ywb.132.1647269305417; Mon, 14
 Mar 2022 07:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646683737.git.geert@linux-m68k.org>
 <cc84f1fcd0901ba58a2e4fd34c43846c622fd157.1646683737.git.geert@linux-m68k.org>
 <CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com>
 <CAMuHMdWbss2TY0J44PitLGCmCOBKcF0QrPv6CKe1r=2qD0+YLA@mail.gmail.com>
 <CAMuHMdUFfe5sekY9vDNRL0AP5_9_h4wiyPcsYywdNsKaTFsHmA@mail.gmail.com>
 <CAKb7UviCU38H_v3HVB5pKJvOFHdQqaAn9s7c8rwUPxhf3bq+5g@mail.gmail.com>
 <CAMuHMdV6rEnB-8KQP2=2aUKPzqAH=EpX0Vpt6x=rAxa1hqTv1g@mail.gmail.com>
 <CAKb7Uvjk3xzabe_bSFSXPhSdtgR=ZUTNcNXx_jeP5=AujO7N3A@mail.gmail.com>
In-Reply-To: <CAKb7Uvjk3xzabe_bSFSXPhSdtgR=ZUTNcNXx_jeP5=AujO7N3A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Mar 2022 15:48:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwVnqvtFyKvzfc==_QokqOS5fExNzFTrLHdiLtvo5OpQ@mail.gmail.com>
Message-ID: <CAMuHMdVwVnqvtFyKvzfc==_QokqOS5fExNzFTrLHdiLtvo5OpQ@mail.gmail.com>
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

On Mon, Mar 14, 2022 at 3:39 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Mon, Mar 14, 2022 at 10:06 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Mar 14, 2022 at 2:44 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > On Mon, Mar 14, 2022 at 9:07 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, Mar 8, 2022 at 8:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Mon, Mar 7, 2022 at 10:23 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > > > > On Mon, Mar 7, 2022 at 3:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> > > > > > > index 953bf95492ee150c..42d75d700700dc3d 100644
> > > > > > > --- a/tests/util/pattern.c
> > > > > > > +++ b/tests/util/pattern.c
> > > > > > > @@ -608,6 +608,46 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
> > > > > > >  static unsigned int smpte_middle[7] = { 6, 7, 4, 7, 2, 7, 0 };
> > > > > > >  static unsigned int smpte_bottom[8] = { 8, 9, 10, 7, 11, 7, 12, 7 };
> > > > > > >
> > > > > > > +static void write_pixel_4(uint8_t *mem, unsigned int x, unsigned int pixel)
> > > > > > > +{
> > > > > > > +       if (x & 1)
> > > > > > > +               mem[x / 2] = (mem[x / 2] & 0xf0) | (pixel & 0x0f);
> > > > > > > +       else
> > > > > > > +               mem[x / 2] = (mem[x / 2] & 0x0f) | (pixel << 4);
> > > > > > > +}
> > > > > >
> > > > > > The standard layout is MSB? i.e. first pixel goes in the upper bits of
> > > > > > the first byte? It's been ages since I've dealt with C4 (or perhaps I
> > > > > > never even touched it), but this seems a bit surprising.

> > > > Turns out I was wrong: fbdev ordering follows native ordering, and
> > > > there's also FBINFO_FOREIGN_ENDIAN  :-(
> > >
> > > I haven't double-checked the meaning in fbdev, but ENDIAN-ness
> > > generally refers to the layout of *bytes*, not *bits*. Although one
> > > could also argue that it's the layout of "elements", and so in that
> > > way, upper/lower values could be considered flipped. I've never gone
> > > that far though.
> >
> > Yes, usually it refers to the ordering of bytes in a word.
> > Here, it's about the ordering of sub-byte pixels in a byte.
> > Note that with C2 and C4, there's a third ordering that comes into
> > play.
> > So we have:
> >   1. Ordering of bytes in a word, for bpp > 8,
> >   2. Ordering of pixels in a byte, for bpp < 8,
> >   3. Ordering of bits in a pixel, for bpp > 1.
> >
> > 1. Is handled by DRM_FORMAT_BIG_ENDIAN.
>
> OK. Note that DRM_FORMAT_BIG_ENDIAN flag for formats other than
> RGBX8888 and very similar formats is basically broken in drm. So ...
> watch out. There are two setups supported for big-endian currently:
>
> 1. Legacy: radeon/nouveau, ignore the "little endian" comment about
> formats and only supports AddFB, not AddFB2. The former only has
> depth/bpp, not the actual format, anyways. This matches what current
> user-space expects too. (quirk_addfb_prefer_host_byte_order = 1)
> 2. AddFB2 support with proper formats. Only used for vmwgfx and virgl
> in practice for BE, IIRC. Only supports 32-bit 8bpc formats, and uses
> some helpers to just flip around DRM_FORMAT_BIG_ENDIAN bit to an
> equivalent format in the frontend api handling. This obviously won't
> work for other formats, but none of the helpers are ready to receive
> the BIG_ENDIAN bit.

I'm fully aware the DRM_FORMAT_BIG_ENDIAN flag is broken,
and it's on my list of things to fix (for 16-bpp Atari).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
