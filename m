Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4692756007
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 12:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647B310E21C;
	Mon, 17 Jul 2023 10:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1C410E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 10:03:38 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5701e8f2b79so43936697b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 03:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689588217; x=1692180217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r38XqAfbSP4Ur+0AuPdJrDlGHf8b+ew1arLdw+Z2HI0=;
 b=JSoNTMbqPYtHOk5U2Tcuh+FJv0JNnsmwc17trCeWx+maXpRBPZ8q3B83S4RiYiSBx+
 C29dz5fxUdw+AqSmdDCUulQujTAWZSB2+qA/MRzmNlc5C1tv0gPQVCRZ0fnmBco7DbYc
 QgHX4iDzcq5kGKUUH199EXuS5t5MNoGfJI0oesz9AdNYwareIraJT7oe736UiDmyucW2
 AI3U2MdVykYvOG+K+L6NHEaWQr0dY3Z/3ETldEGW25PmB18rq2QJGBzQGdAxxsFwwKX4
 9YMSpUvrwnzYk4lmNSR3iVFbUtNlqJF5CLuKX08AfK1Jdg9T4nL6hrfaZ+ye5gylp9Mm
 fNqA==
X-Gm-Message-State: ABy/qLYMlk9S/8WAQ84Y3ASVARmVejHQSLWHzZSSoErC75YIN6NIYLwq
 UQ+mtTreGTWhu6LEe1Du8Z9vrbBGZ2bZmQ==
X-Google-Smtp-Source: APBJJlExEvjM+m2cle1QMzKL8Y842Rxa8CDwiHQ1EUKmjH3S5QKp281LBNhx3LLVsUVPVnChLlLZjA==
X-Received: by 2002:a81:83d0:0:b0:577:21ff:4d47 with SMTP id
 t199-20020a8183d0000000b0057721ff4d47mr10846497ywf.7.1689588217409; 
 Mon, 17 Jul 2023 03:03:37 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 b8-20020a816708000000b0056d31a089e9sm3726571ywc.126.2023.07.17.03.03.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 03:03:37 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-cada5e4e3f6so4381609276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 03:03:37 -0700 (PDT)
X-Received: by 2002:a25:b90a:0:b0:c63:a04d:ad34 with SMTP id
 x10-20020a25b90a000000b00c63a04dad34mr9332442ybj.64.1689588216863; Mon, 17
 Jul 2023 03:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689252746.git.geert@linux-m68k.org>
 <87zg3w7zlz.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdV_qNfytroBEfqDMe04POt27s9o=FevXht7N4YXRmBz8Q@mail.gmail.com>
 <87o7kakijn.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdURa8E9cmphbDkTgS2o3ORWd7JAj68PV9bxd3aygKZRJg@mail.gmail.com>
 <87jzuykhm5.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87jzuykhm5.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 12:03:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiEXgk51Bjo+SdTXJz=bCrPzrcd8k1cZcEJUamsn0d1g@mail.gmail.com>
Message-ID: <CAMuHMdUiEXgk51Bjo+SdTXJz=bCrPzrcd8k1cZcEJUamsn0d1g@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm: fb-helper/ssd130x: Add support for DRM_FORMAT_R1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Mon, Jul 17, 2023 at 11:33=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> >> >> penguin in test004 is not displayed correctly. I was expecting that=
 to be
> >> >> working correctly since you mentioned to be using the Linux logo on=
 boot.
> >> >
> >> > Linux has logos for displays using 2, 16, and 256 colors. Note that =
the
> >> > default logos are 80x80, which is larger than your display, so no lo=
go
> >> > is drawn.
> >> > Fbtest has only the full color logo, so it will look bad on a monoch=
rome
> >> > display.
> >>
> >> I see. Should the test check for minimum num_colors and skip that test=
 then?
> >
> > The test still works (you did see an ugly black-and-white penguin), doe=
sn't it?
>
> Fair enough. But when it defaulted to XRGB8888, it looked better. So I
> thought that it was a regression. No strong opinion though if the test
> should be skipped or not.

IC, fbtest's mono_match_color() just finds the closest color (black or
white), while drm_fb_xrgb8888_to_gray8_line() uses a weighted average
of the RGB components. That might make a small but visible difference.

We could make it look even better using Floyd-Steinberg dithering... ;-)
Fbtest does have an unused match_color_error() helper, so I must have
had that in mind, initially...

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
