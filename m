Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C6D7FD180
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 09:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB2610E19B;
	Wed, 29 Nov 2023 08:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2CE10E195
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 08:58:26 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5cd3c4457a0so63126017b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701248305; x=1701853105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7R/KGp93btDjGWFKKu/IcOnp8F5jcJhWKyHePUJieV4=;
 b=R/mGy/z4/RmGdUiDXadki/syxMV2+V55wUwnpr4HeNy/i52FQSuDB638GZ6CSyiRmX
 h51NCnDdHXCuxORuC1Bhz9UZTWk3W5Zgz+lDLJAFeRG0Wi/NfFbnZZe7k8tZhElPw/2a
 KWDET9/71ipQd1JCpd6KmSmHyaHcXW3jsr5lIawiSQXBz1L+QASdFsCmKkGlzFEKZTgA
 Ddg0XrZ+voYXGo5l60H9Lhu7NzdyuIpQgUNpaDRDRRNR4q3vT6Bq59JpDX5MWl5dU2u+
 k8ypvm3APPE/gvrqyDzFSyi1m+3VMU2zYFNjMkW+Gm4UzzbBJHSRcRKWOYuZ/DZmtW2L
 7JXA==
X-Gm-Message-State: AOJu0Yy7vaXNKr4MEm21Ecwmc0spBz9gNsChbtFRbawpiY3uKdshrV2q
 VBZIB4fu2eKJ/el/F4O1oAe1Y7O6AdCCCA==
X-Google-Smtp-Source: AGHT+IFotqrDVLdOrrb1gZJ7jW6TwMUXWV4RCEN1Re4q7T7mtjVNhSLolC3i2wiacsv+Vx0FAnEOCQ==
X-Received: by 2002:a81:7c83:0:b0:5ca:9ca4:f412 with SMTP id
 x125-20020a817c83000000b005ca9ca4f412mr14362688ywc.43.1701248304997; 
 Wed, 29 Nov 2023 00:58:24 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 ex5-20020a05690c2fc500b005d25be5c7f4sm267264ywb.73.2023.11.29.00.58.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 00:58:24 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-5cca00db7f0so65486067b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:58:24 -0800 (PST)
X-Received: by 2002:a81:9a97:0:b0:5d2:b29a:5e08 with SMTP id
 r145-20020a819a97000000b005d2b29a5e08mr135066ywg.17.1701248304126; Wed, 29
 Nov 2023 00:58:24 -0800 (PST)
MIME-Version: 1.0
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
 <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
In-Reply-To: <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 09:58:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTZ8LT1yU3e1bbJODecy96TaMX1hq_swqmT6L+mbH3aQ@mail.gmail.com>
Message-ID: <CAMuHMdVTZ8LT1yU3e1bbJODecy96TaMX1hq_swqmT6L+mbH3aQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Nishanth Menon <nm@ti.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Tero Kristo <kristo@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Wed, Nov 29, 2023 at 9:35=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Tue, Nov 28, 2023 at 08:16:18PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> > > Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > > > The Imagination Technologies PowerVR Series 6 GPU is currently only
> > > > supported on Texas Instruments K3 AM62x SoCs.  Hence add a dependen=
cy on
> > > > ARCH_K3, to prevent asking the user about this driver when configur=
ing a
> > > > kernel without Texas Instruments K3 Multicore SoC support.
> > > >
> > > > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR dri=
ver")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > > In any case, I agree with you that restricting to only K3 makes sense=
.
> >
> > I am looking forward to adding || SOC_AM33XX || ARCH_RENESAS || ...,
> > eventually ;-)
>
> I disagree. This is to handle a generic IP, just like panfrost, lima, or
> etnaviv, and we certaintly don't want to maintain the Kconfig list of
> every possible architecture and SoC family it might or might not be
> found.

While PowerVR is a generic IP, I believe it needs a non-generic
firmware, which is currently only available for AM62x SoCs.
Once it becomes truly generic, I'm happy to drop all platform
dependencies.  Until then, there is no point in asking everyone who
configures an arm64 kernel about this driver, unless they also enabled
K3 support.

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
