Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A807B755F18
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770FF10E210;
	Mon, 17 Jul 2023 09:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AAE10E219
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:19:59 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6b91ad1f9c1so2736836a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 02:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689585598; x=1692177598;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iL6H4V2XU8kmGm5fHcmeXtpvI5hQ0R0kS2i0q5dCFTY=;
 b=eIKkl60dyo0MapuBS78/c2/OrrYi5h+X6RLKUCBI/jsxqwYBPqdxkOgu+GhPPMNKqz
 fXjHVEFW+3A5wa2gaJ43LO1GxVtV5Jsm4q7XBcHh3wKOkqZCA1AWT35s6xLzLIZmjXX3
 X2Emgq0FNj2Nap2WEk+safN4kncp9tQgxy0EViehiLkm8L7m6KE31bKOyMMk+HwIDTaF
 Ew7gyJZOfNqsv+ipfrRQMQhutG2oR133vJ94aejX9uGiPgacCb3G8BDrCeC+tWZXMa0O
 0jSXmO5xtGWwfN6n5w3JNWThYcxoxhCO9uLK2jGUyVc5S4z3bKYvxzP+c3y5jaIbWd/y
 X6XQ==
X-Gm-Message-State: ABy/qLbbfiPZ2CndHlAmA2FtuEXMiqD5XxccwBbOA299ktp8JCNmd9l0
 7K6vuVFSHLqBH3scMyIWpoiz5n0SfIB4Hg==
X-Google-Smtp-Source: APBJJlFvYKkEQAQneInhqlyPFuYDfwhysb4aV7/368FvnUmLwZiz7NqPjA+GplQm4g+1K06w9YYYmA==
X-Received: by 2002:a05:6358:3803:b0:132:f294:77fe with SMTP id
 r3-20020a056358380300b00132f29477femr7478427rwd.2.1689585597841; 
 Mon, 17 Jul 2023 02:19:57 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 k125-20020a816f83000000b0055a07c7be39sm3760102ywc.31.2023.07.17.02.19.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 02:19:57 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-cabf1dbafc4so4379489276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 02:19:56 -0700 (PDT)
X-Received: by 2002:a25:6ec3:0:b0:c8b:7d63:72b0 with SMTP id
 j186-20020a256ec3000000b00c8b7d6372b0mr10263134ybc.10.1689585596517; Mon, 17
 Jul 2023 02:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689252746.git.geert@linux-m68k.org>
 <87zg3w7zlz.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdV_qNfytroBEfqDMe04POt27s9o=FevXht7N4YXRmBz8Q@mail.gmail.com>
 <87o7kakijn.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87o7kakijn.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 11:19:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURa8E9cmphbDkTgS2o3ORWd7JAj68PV9bxd3aygKZRJg@mail.gmail.com>
Message-ID: <CAMuHMdURa8E9cmphbDkTgS2o3ORWd7JAj68PV9bxd3aygKZRJg@mail.gmail.com>
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

On Mon, Jul 17, 2023 at 11:13=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > On Sun, Jul 16, 2023 at 3:30=E2=80=AFPM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> >> > The native display format of ssd1306 OLED displays is monochrome
> >> > light-on-dark (R1).  This patch series adds support for the R1 buffe=
r
> >> > format to both the ssd130x DRM driver and the FB helpers, so monochr=
ome
> >> > applications (including fbdev emulation and the text console) can av=
oid
> >> > the overhead of back-and-forth conversions between R1 and XR24.
> >>
> >> I've tested your series on a ssd1306 I2C OLED panel and fbcon did work=
 for
> >> me, but had some issues when trying to run your fbtest suite. Because =
the
> >
> > Thanks, due to the limited userspace environment on my RV32 test system=
,
> > I didn't run fbtest myself.
> >
>
> You are welcome.
>
> >> test005 gets killed with a SIGSEGV.
> >>
> >> $ ./fbtest -d
> >> fb_init()
> >> fb_open()
> >> fb_get_var()
> >> fb_get_fix()
> >> fb_map()
> >> fb_start =3D 0, fb_offset =3D 0, fb_len =3D 1000
> >
> >    [...]
> >
> >> Running test test005
> >> Caught signal 11. Exiting
> >
> > Strange.
> >
> >> Maybe more tests are missing the minimum num_colors requirement? Also,=
 the
> >
> > On monochrome, test005 should make the left half of the screen black,
> > and the right half white.  It works on ARAnyM, and there don't seem
> > to be off-by-one errors in the call to fill_rect().
> > Can you please run this under gdb or valgrind?
> >
>
> Sure. I only spent my free time on these panels though so likely will do
> during the week or more likely the weekend. I believe the bug is somewher=
e
> in the test though and not in your kernel patches.

OK.

> >> penguin in test004 is not displayed correctly. I was expecting that to=
 be
> >> working correctly since you mentioned to be using the Linux logo on bo=
ot.
> >
> > Linux has logos for displays using 2, 16, and 256 colors. Note that the
> > default logos are 80x80, which is larger than your display, so no logo
> > is drawn.
> > Fbtest has only the full color logo, so it will look bad on a monochrom=
e
> > display.
>
> I see. Should the test check for minimum num_colors and skip that test th=
en?

The test still works (you did see an ugly black-and-white penguin), doesn't=
 it?

> When you post v2, feel free to add:
>
> Tested-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!

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
