Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837696F530D
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 10:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EA210E0CC;
	Wed,  3 May 2023 08:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351B210E0CC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 08:22:05 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-55a8019379fso24760077b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683102123; x=1685694123;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yf0nQOOKHL0GEtmAgACXt9/1DKDkHK6ft7tmYSYGTKo=;
 b=KiLJas+V/GPDp74vzTso7RPeBFgunRTmz1eqc+1na4mgkW2VUZBzeM8lLILhgb5cW9
 YdRnFUyBxGDyBdwDJLW2FlaA5BztQn4z//ygZ8hy3CSjSb2oLFg6qlPvVqtv+tLvH5yd
 HtZcVp7amh7jOz9ONI3mjohJ2WDohK5nOW7F620hIRaExOw8J0KIAiBf9Db17TiEUSqq
 eg0o2mlcHC3DlqHNPnMi1yw3HB2wPNMYr5imjBYOA+/hL/qax0gaZQiAcD56jSM74CBa
 dw7wxRiC+llRwXBb38pAoR7v1EHuoemc4Fu/oIfzGoicSkTHrgbdQFKZw1lifH9+jpcP
 9hiw==
X-Gm-Message-State: AC+VfDxYpW+ujWR/LemX5jAaUhwESSukEa2AAtGQn0koGS/ep49BWkta
 lYmuS893izB6h+Fscg8MJI6010wM1Y6Cmg==
X-Google-Smtp-Source: ACHHUZ7L74WZrFfOenQFTHEuskjJbT9wVTvhKmKB9npqCGke+nI6RE2aCnu6QKFv5I1yxaF/UgNuCQ==
X-Received: by 2002:a25:ad48:0:b0:b9d:dde8:2a5a with SMTP id
 l8-20020a25ad48000000b00b9ddde82a5amr12146863ybe.49.1683102123366; 
 Wed, 03 May 2023 01:22:03 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 i63-20020a252242000000b00b99768e3b83sm215343ybi.25.2023.05.03.01.22.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 01:22:02 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-55a5a830238so29720217b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 01:22:02 -0700 (PDT)
X-Received: by 2002:a25:240f:0:b0:b9d:d5dc:596c with SMTP id
 k15-20020a25240f000000b00b9dd5dc596cmr11998230ybk.12.1683102122353; Wed, 03
 May 2023 01:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230502130223.14719-1-tzimmermann@suse.de>
In-Reply-To: <20230502130223.14719-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 10:21:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV06LN17KzOh42vjyF504myT=D=a-zz3MduOmQPEmv5SA@mail.gmail.com>
Message-ID: <CAMuHMdV06LN17KzOh42vjyF504myT=D=a-zz3MduOmQPEmv5SA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 linux-parisc@vger.kernel.org, vgupta@kernel.org, sparclinux@vger.kernel.org,
 kernel@xen0n.name, linux-snps-arc@lists.infradead.org, sam@ravnborg.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, May 2, 2023 at 3:02=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> (was: fbdev: Use regular I/O function for framebuffers)
>
> Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
> fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
> depends on the architecture, but they are all equivalent to regular
> I/O functions of similar names. So use regular functions instead and
> move all helpers into <asm-generic/fb.h>
>
> The first patch a simple whitespace cleanup.
>
> Until now, <linux/fb.h> contained an include of <asm/io.h>. As this
> will go away patches 2 to 4 prepare include statements in the various
> drivers. Source files that use regular I/O helpers, such as readl(),
> now include <linux/io.h>. Source files that use framebuffer I/O
> helpers, such as fb_readl(), also include <asm/fb.h>.
>
> Patch 5 replaces the architecture-based if-else branching in
> <linux/fb.h> by helpers in <asm-generic/fb.h>. All helpers use Linux'
> existing I/O functions.
>
> Patch 6 harmonizes naming among fbdev and existing I/O functions.
>
> The patchset has been built for a variety of platforms, such as x86-64,
> arm, aarch64, ppc64, parisc, m64k, mips and sparc.
>
> v3:
>         * add the new helpers in <asm-generic/fb.h>
>         * support reordering and native byte order (Geert, Arnd)

Thanks, this fixes the mangled display I was seeing on ARAnyM
with bpp=3D16.

BTW, this series seems to have mixed dependencies: the change
to include/asm-generic/fb.h depends on "[PATCH v3 00/19] arch:
Consolidate <asm/fb.h>"[1], but with that applied, I had to manually
fixup drivers/video/fbdev/core/fb_cfb_fops.c.

[1] https://lore.kernel.org/all/20230417125651.25126-1-tzimmermann@suse.de,

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
