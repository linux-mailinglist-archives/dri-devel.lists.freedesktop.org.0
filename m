Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CA8450982
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 17:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E476E0C9;
	Mon, 15 Nov 2021 16:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EAC6E0C9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 16:20:41 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id v3so35916621uam.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 08:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efm7nTUMt8rzsLA3IdyOYKyQXeHPPTB88YQ7l3tEZPU=;
 b=3q/FIVy+Km0HjEc4oakXt1aMJI8dsQD2yrWTmjJXCg/HxbacPR920WJ6lSuJTIkoJj
 Xvd6WC4GWnlJ0cT8pzR/vUNrfrH73Q23MYkQatSLsxx7/I8cWTAes8J/6xtPZi+otsF/
 qtJaAtWWE14PuR81EwrTxBMrPwZ6wBhu7yBXqrqKuk6dtY01FcUGIp5ey/4guMjM1Ff9
 HO59mxs714ZpEQtn2Q8Tcf2jJ7/ftpENEbCdxIqpErtbglI8TQ75vAw4Ok18Yo2/kvIR
 Y1kneLSSWJe7QLyYK/7rA32L2vfoJIU1E/iBOf/NqA3lpV2w2QaSGHmrRbctYkk0iznh
 8tQA==
X-Gm-Message-State: AOAM5330aqD/RJkMKE97+FIRIb+BuhoP6W0xgOXeTplWMBBbKjs/+cNr
 TV5hP3pZmIzm2VdXS9Y54O30cneF7xq1Tg==
X-Google-Smtp-Source: ABdhPJxzu/bZVNbtN5Ax24AQUvwutgZlTDrmfwE4EPk8jHKffaz2ALMJYKTKfZk21N8jJxuUqZXEgw==
X-Received: by 2002:a05:6102:c06:: with SMTP id
 x6mr45132572vss.23.1636993240382; 
 Mon, 15 Nov 2021 08:20:40 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id w11sm8539819vkm.14.2021.11.15.08.20.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 08:20:40 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id v3so35916462uam.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 08:20:40 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr60850690vkh.11.1636992782095; 
 Mon, 15 Nov 2021 08:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20211115155105.3797527-1-geert@linux-m68k.org>
In-Reply-To: <20211115155105.3797527-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Nov 2021 17:12:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
Message-ID: <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.16-rc1
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stan Skowronek <stan@corellium.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Helge Deller <deller@gmx.de>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Nick Terrell <terrelln@fb.com>, Joey Gouly <joey.gouly@arm.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-ntfs-dev@lists.sourceforge.net, Hector Martin <marcan@marcan.st>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.16-rc1[1] compared to v5.15[2].
>
> Summarized:
>   - build errors: +20/-13
>   - build warnings: +3/-28
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf/ (all 90 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8bb7eca972ad531c9b149c0a51ab43a417385813/ (all 90 configs)
>
>
> *** ERRORS ***
>
> 20 error regressions:
>   + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: expected ':' before '__stringify':  => 33:4, 18:4
>   + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: label 'l_yes' defined but not used [-Werror=unused-label]:  => 38:1, 23:1

    due to static_branch_likely() in crypto/api.c

parisc-allmodconfig

>   + /kisskb/src/drivers/gpu/drm/msm/msm_drv.h: error: "COND" redefined [-Werror]:  => 531
>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 3252 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 47:1
>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 3360 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 499:1
>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 5344 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 334:1
>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 5380 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 354:1
>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of 1824 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 372:1
>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of 2224 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 204:1
>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of 3800 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 476:1

parisc-allmodconfig

>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2240 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1311:1
>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2304 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1311:1
>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2320 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1311:1

powerpc-allmodconfig

>   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_366' declared with attribute error: FIELD_PREP: value too large for the field:  => 335:38

    in drivers/pinctrl/pinctrl-apple-gpio.c

arm64-allmodconfig (gcc8)

>   + /kisskb/src/include/linux/fortify-string.h: error: call to '__read_overflow' declared with attribute error: detected read beyond size of object (1st parameter):  => 263:25, 277:17

    in lib/test_kasan.c

s390-all{mod,yes}config
arm64-allmodconfig (gcc11)

>   + error: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!:  => N/A
>   + error: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!:  => N/A
>   + error: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!:  => N/A
>   + error: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!:  => N/A
>   + error: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!:  => N/A

mips-allmodconfig

> 3 warning regressions:
>   + <stdin>: warning: #warning syscall futex_waitv not implemented [-Wcpp]:  => 1559:2

powerpc, m68k, mips, s390, parisc (and probably more)

>   + arch/m68k/configs/multi_defconfig: warning: symbol value 'm' invalid for MCTP:  => 322
>   + arch/m68k/configs/sun3_defconfig: warning: symbol value 'm' invalid for MCTP:  => 295

Yeah, that happens when symbols are changed from tristate to bool...
Will be fixed in 5.17-rc1, with the next defconfig refresh.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
