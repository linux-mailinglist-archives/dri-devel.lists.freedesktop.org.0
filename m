Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9A7540FC1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C5B10F567;
	Tue,  7 Jun 2022 19:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEA910F567
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:12:28 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id hh4so13339112qtb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 12:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4teGkJzSagIZsgcLH+V56SrWNU+r6L/guCBWA6f0Qx0=;
 b=e2xuOqjVNFJYOtWvJedkZBxXBSQbUEDP5gOb2pcknpDE7s279mL7IedFhCNUvdXJpS
 xOZqepDNf4XJRpSqngrqDth44fo+oLZddAbS0ShDYxDXEKDly6+OyndQcmOJoLG2P3tt
 YsmeaCJENGVHgjv6EnmDbJWiHJqtn8CsTtdvZue3f7Qt9vLS+o9f6F/VM5/B/EeaFpWq
 fUYyYK3uFwfza9ar9te00dtFjJVzIwYojATQp3R6AVdGiZKTP6UchOpR1PsBYFy78KsB
 /ubArLe2oN1d2cpjkxRjmoyucmzAtVeU89/Jp56RYRm7KQfcbY7tQae219E+5IfcWuM8
 ooDg==
X-Gm-Message-State: AOAM530FwdqcTbB/9q9ZmZ0y/GQfeXkO+UCi4LM1fZn137rZagCiKDVR
 DOGB+QtuBvDZDikFA9ElShAF0v+p1jacTQ==
X-Google-Smtp-Source: ABdhPJxV6hAAkohCMDPW3amjToMTMxwao6EI7HiT4LO+z9tRSpSt+2LzJoX9XoTzVSSc2L+J2BFTKQ==
X-Received: by 2002:ac8:4e53:0:b0:304:e911:b41f with SMTP id
 e19-20020ac84e53000000b00304e911b41fmr12355921qtw.592.1654629147092; 
 Tue, 07 Jun 2022 12:12:27 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05622a054d00b003030d9f518dsm13202106qtx.60.2022.06.07.12.12.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 12:12:26 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id s39so5135058ybi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 12:12:26 -0700 (PDT)
X-Received: by 2002:a25:cc53:0:b0:65c:b19c:fac1 with SMTP id
 l80-20020a25cc53000000b0065cb19cfac1mr30127900ybf.89.1654629145915; Tue, 07
 Jun 2022 12:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
 <CAMuHMdXb5-gOVRsQx6tDqjQMD9cC-p=o56VuF2cBPWyMFRgHMA@mail.gmail.com>
 <CAHk-=wgcv_YewP0rgwR1+gj3YF-7Jz8WPVzDgndx0DVMVKzV=Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgcv_YewP0rgwR1+gj3YF-7Jz8WPVzDgndx0DVMVKzV=Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jun 2022 21:12:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-HQZ3ZozS8AEP2P6aU3eMp6jO-GYOCOFOju_rcxOg+w@mail.gmail.com>
Message-ID: <CAMuHMdU-HQZ3ZozS8AEP2P6aU3eMp6jO-GYOCOFOju_rcxOg+w@mail.gmail.com>
Subject: Re: [git pull] drm for 5.19-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Tue, Jun 7, 2022 at 8:15 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Jun 7, 2022 at 3:23 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > These header files are heavy users of large constants lacking the "U"
> > suffix e.g.:
> >
> >     #define NB_ADAPTER_ID__SUBSYSTEM_ID_MASK 0xFFFF0000L
>
> As Andreas says, this is not undefined behavior.
>
> A hexadecimal integer constant will always get a type that fits the
> actual value. So on a 32-bit architecture, because 0xFFFF0000 doesn't
> fit in 'long', it will automatically become 'unsigned long'.
>
> Now, a C compiler might still warn about such implicit type
> conversions, but I'd be a bit surprised if any version of gcc actually
> would do that, because this behavior for hex constants is *very*
> traditional, and very common.
>
> It's also true that the type of the constant - but not the value -
> will be different on 32-bit and 64-bit architectures (ie on 64-bit, it
> will be plain "long" and never extended to "unsigned long", because
> the hex value obviously fits just fine).
>
> I don't see any normal situation where that really matters, since any
> normal use will have the same result.
>
> The case you point to at
>
>   https://lore.kernel.org/r/CAK8P3a0QrihBR_2FQ7uZ5w2JmLjv7czfrrarCMmJOhvNdJ3p9g@mail.gmail.com
>
> is very different, because the constant "1" is always just a plain
> signed "int". So when you do "(1 << 31)", that is now a signed integer
> with the top bit set, and so it will have an actual negative value,
> and that can cause various problems (when right-shifted, or when
> compared to other values).
>
> But hexadecimal constants can be signed types, but they never have
> negative values.

Thank you, I stand corrected.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
