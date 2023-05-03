Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4036F52BF
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 10:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FEB10E1E6;
	Wed,  3 May 2023 08:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A068B10E1E6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 08:09:53 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-b99efd7c335so6845415276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 01:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683101392; x=1685693392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3SVmNF978sXXspcYjjZLpiBDqyot8IfsoBtpE1ZoRNc=;
 b=dH4fELjRI9Od4uiV8+mpht/xAibde3aGYwjmhPJUJkbJQlEeAoHDq2BlS27paYCv9M
 APl0qKljD0J6h0tBxJx2BDoCwyCpyOOhA58DGCq6OWW3K2HYkij0LFb0Rr/rPEWPSgim
 TFAKLnKGlGTJTyBqfJcM4ZTK30orHrR+t2MJmVz62gK7yS64ltdSjZJsfYc3Z07ejZeP
 D7h1Rp07EEBBfSh44atF34sRwqQlK5BHGJ4K6SwwFIvtxNbg1VzRrWZh/4sdp0k1qHD7
 eKTYifKywTq4m6REk6pkOx1QvLv6Wv2X4MGCEDZc8BLX0o4G4UUI6kPWK4uhIOFTJPA7
 r7aw==
X-Gm-Message-State: AC+VfDz//bVmQbEOCKr2/Ik8zdwO7smCAjs/xAWmAmfi8bbUjx+KDedT
 eB7SF1uC5jLbnG1xTEPrI5JwkBr6BiZ3EA==
X-Google-Smtp-Source: ACHHUZ5AqmIAq0hpDmvAzxn0E5ejvRe7Zmy5xGu2y68097e63hDCfa9FN/rFiqqd7zVBTW3rcg3ePw==
X-Received: by 2002:a25:746:0:b0:b8f:2047:181a with SMTP id
 67-20020a250746000000b00b8f2047181amr19960892ybh.24.1683101391883; 
 Wed, 03 May 2023 01:09:51 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 p203-20020a255bd4000000b00b993b8e0e4bsm2903519ybb.38.2023.05.03.01.09.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 01:09:51 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-55a6efe95c9so38614677b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 01:09:50 -0700 (PDT)
X-Received: by 2002:a0d:c347:0:b0:556:dd1b:3bb7 with SMTP id
 f68-20020a0dc347000000b00556dd1b3bb7mr19301020ywd.43.1683101390642; Wed, 03
 May 2023 01:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-5-tzimmermann@suse.de>
 <20230502195429.GA319489@ravnborg.org>
 <563673c0-799d-e353-974c-91b1ab881a22@suse.de>
 <87354dyj9i.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87354dyj9i.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 10:09:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8Sm7sBu47XQ1xygn6fzq2FzQeiuK0ncMVGHan-_k4Ow@mail.gmail.com>
Message-ID: <CAMuHMdW8Sm7sBu47XQ1xygn6fzq2FzQeiuK0ncMVGHan-_k4Ow@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] fbdev: Include <linux/io.h> via <asm/fb.h>
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 arnd@arndb.de, deller@gmx.de, chenhuacai@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 linux-parisc@vger.kernel.org, loongarch@lists.linux.dev, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 3, 2023 at 9:19=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> > Am 02.05.23 um 21:54 schrieb Sam Ravnborg:
> >> On Tue, May 02, 2023 at 03:02:21PM +0200, Thomas Zimmermann wrote:
>
> [...]
>
> >>>   #include <linux/console.h> /* Why should fb driver call console fun=
ctions? because console_lock() */
> >>>   #include <video/vga.h>
> >>>
> >>> +#include <asm/fb.h>
> >>
> >> When we have a header like linux/fb.h - it is my understanding that it=
 is
> >> preferred to include that file, and not the asm/fb.h variant.
> >>
> >> This is assuming the linux/fb.h contains the generic stuff, and includ=
es
> >> asm/fb.h for the architecture specific parts.
> >>
> >> So drivers will include linux/fb.h and then they automatically get the
> >> architecture specific parts from asm/fb.h.
> >>
> >> In other words, drivers are not supposed to include asm/fb.h, if
> >> linux.fb.h exists - and linux/fb.h shall include the asm/fb.h.
> >>
> >> If the above holds true, then it is wrong and not needed to add asm/fb=
.h
> >> as seen above.
> >>
> >>
> >> There are countless examples where the above are not followed,
> >> but to my best understanding the above it the preferred way to do it.
> >
> > Where did youher this? I only know about this in the case of asm/io.h
> > vs. linux/io.h.
> >
>
> I understand that's the case too. I believe even checkpatch.pl complains
> about it? (not that the script always get right, but just as an example).

One more to chime in: in general, drivers should only include <linux/foo.h>=
.
Including <asm/foo.h> directly is the exception.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
