Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533C14D1160
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 08:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D4810ECA3;
	Tue,  8 Mar 2022 07:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B2D10ECA3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 07:57:23 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id a14so2559688qtx.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 23:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xE8X/O24ECZ2oEPs4kKsuJoL9ClwOxzXPA0pE9xGrTY=;
 b=T4dNdPyfWdLPboubQpUcyc9zSEY8/VhKP7wRwNHEjJMc/y54MFjLD2mDa0AZzn8kzT
 kxi5Hwc2BM3620Jm1owiL0Z2Q3GZDKcNl9Gwei61kXuKiriBPyI/tuqmxaExCMvk2XEw
 h510X0mgUMYz0ndbzSNzP+9dxye2RLStiOkV58WzYVtUYhZhGd2N1ka3SiOvqFSWOloB
 TNE2m0qhqrS4P6Od3e9dZ0Hlxd7B7Lo40dbWNew1UEhEXHhg9R2WK7sbWkeVfdmK2X9e
 CpvCN5x6L9/V9RlrcpeqDVU49w19qzJorIaXTgV23um0TXKZFIz3M6kLmnC6AOR3N/gD
 KOaw==
X-Gm-Message-State: AOAM5307qDLcYcmNQjEYFznMF9wVwH8QzUarzduYruT3DPAAHkzlkHjs
 0UiykVk86RVBnBhEM5vvkD+aoH6RP1BfcA==
X-Google-Smtp-Source: ABdhPJy9hQwTj4Uy6EqiDfHXkNiJMzmxkq/PyjYYUm4hmCCmMyqKsWOkfkgY0PwHqHmPRPoTbYwgaQ==
X-Received: by 2002:ac8:5a03:0:b0:2de:2d44:b2ee with SMTP id
 n3-20020ac85a03000000b002de2d44b2eemr12522153qta.363.1646726242622; 
 Mon, 07 Mar 2022 23:57:22 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 v72-20020a37614b000000b00648ebe9d4a5sm7417285qkb.116.2022.03.07.23.57.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 23:57:22 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2dc28791ecbso178435817b3.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 23:57:22 -0800 (PST)
X-Received: by 2002:a81:49d0:0:b0:2db:dc6d:445d with SMTP id
 w199-20020a8149d0000000b002dbdc6d445dmr12174880ywa.512.1646726242011; Mon, 07
 Mar 2022 23:57:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646683737.git.geert@linux-m68k.org>
 <cc84f1fcd0901ba58a2e4fd34c43846c622fd157.1646683737.git.geert@linux-m68k.org>
 <CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com>
In-Reply-To: <CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Mar 2022 08:57:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWbss2TY0J44PitLGCmCOBKcF0QrPv6CKe1r=2qD0+YLA@mail.gmail.com>
Message-ID: <CAMuHMdWbss2TY0J44PitLGCmCOBKcF0QrPv6CKe1r=2qD0+YLA@mail.gmail.com>
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

On Mon, Mar 7, 2022 at 10:23 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Mon, Mar 7, 2022 at 3:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> > index 953bf95492ee150c..42d75d700700dc3d 100644
> > --- a/tests/util/pattern.c
> > +++ b/tests/util/pattern.c
> > @@ -608,6 +608,46 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
> >  static unsigned int smpte_middle[7] = { 6, 7, 4, 7, 2, 7, 0 };
> >  static unsigned int smpte_bottom[8] = { 8, 9, 10, 7, 11, 7, 12, 7 };
> >
> > +static void write_pixel_4(uint8_t *mem, unsigned int x, unsigned int pixel)
> > +{
> > +       if (x & 1)
> > +               mem[x / 2] = (mem[x / 2] & 0xf0) | (pixel & 0x0f);
> > +       else
> > +               mem[x / 2] = (mem[x / 2] & 0x0f) | (pixel << 4);
> > +}
>
> The standard layout is MSB? i.e. first pixel goes in the upper bits of
> the first byte? It's been ages since I've dealt with C4 (or perhaps I
> never even touched it), but this seems a bit surprising.

Exactly. All register documentation I've ever seen shows the MSB on
the left, i.e. for bytes:

     MSB                         LSB
    +---+---+---+---+---+---+---+---+
    | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
    +---+---+---+---+---+---+---+---+

IBM used to count bits in the reverse order, but still had MSB left:

     MSB                         LSB
    +---+---+---+---+---+---+---+---+
    | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
    +---+---+---+---+---+---+---+---+

If the reverse ordering of pixels is ever needed, a new fourcc code can
be introduced.  Note that the fbdev API has support for both orderings
(see fb_bitfield.msb_right), but no driver ever sets msb_right = 1,
hence the fbdev core doesn't support it yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
