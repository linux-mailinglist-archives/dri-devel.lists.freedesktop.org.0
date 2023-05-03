Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 264726F4F1E
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 05:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B7810E19C;
	Wed,  3 May 2023 03:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A7610E199
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 03:19:47 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so6711982a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 20:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683083984; x=1685675984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OvdbKE2Dtsq8U1gEyTyqa6w0OBoKW/W9/QwTfH31tG8=;
 b=lR1n8LVn7cbEUHS0RkbnFkMML7LFiYXr+rd0ZDQ4CF++Z2ENHMMnSazaD7yIky39/y
 gGdltxDz2oecFDPSOS84N8vqQM4jHO8FIdGWvvRPr071t4tnbegSPl98LpAY4eERWY0+
 TsHPMdCH2LFJItSc/LsuFGxhr33Jwb9bU3RFQZDD7m1ACJCIzOdUjMrC6bhkBC0FeGl3
 C/YeLk+6Lp/IhN0jgBcDgbEpSM0FKQJfjwI8bcDF/o775NhOjNUIkFJi+QlUekEH6tIB
 ip316TjsBUicdIpx8z7f5jjj49i95Mp02WWu9hg/CR6LDpgH0FdBLzRVzNFpcnGTTU55
 8Kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683083984; x=1685675984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OvdbKE2Dtsq8U1gEyTyqa6w0OBoKW/W9/QwTfH31tG8=;
 b=NBkoz45ZKf7hFAlzEgUqsOKYxd9PDWAwz6uv/Z2GQ/2ki33vI7mQbFqywhdNBW8sW4
 Y3fPgDnci1oUGbcD/hf2jZP3Ymzi5n+1EF3PzUZyEiilfNq4q6NLTl95S7JDfcYBPeqF
 N7tv6BmbddBV2xH1D66JYA6ACa3kICgMmOKKyhIikCUuZgKBiibEbvts8FNHXJ/FVpLv
 rcWd/+yzSwyfaQOqp+1VeDxNy3As00VdFmajUKRxolZ5SqWno4rC1RW+FDAzVABeke3O
 f1NP5drJPoUUzsc1C3IoD0f7O4VFQlKiLdBi1fLLYm2VmRvLWJ3YOepWwy+/kQRkOVWQ
 ggFA==
X-Gm-Message-State: AC+VfDyNbjpiTa3B2Sh+AklPC85v4XNUKcIxrOXr5CGUzpcH4jtRb+RR
 kvqod23CUbXkwUDduTHac9CxhnmkuKWGlBl0OKE=
X-Google-Smtp-Source: ACHHUZ5lJAQu0znDrqojW97LLqgoHhayF3QoCCbg3NBoJzKPAqZCsZxuNLNiVUPisbgVkXRc0R9b4NytCHdTwy4CQIs=
X-Received: by 2002:a17:907:7b8f:b0:965:5d54:496d with SMTP id
 ne15-20020a1709077b8f00b009655d54496dmr762960ejc.45.1683083983880; Tue, 02
 May 2023 20:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230419043652.1773413-1-airlied@gmail.com>
 <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
 <CAPM=9tw0Y2A4DvuTHT_yd58Eit+tUmo63pbEOHwRJ66LeqznEQ@mail.gmail.com>
 <fsleccud43leoioli6bj4xoydwbdcjb5qr4denuf6morhgtqki@t6xya2mygon5>
 <ZEcJNcz+ArLfUSJ1@bombadil.infradead.org>
 <n6gwizwt26ucpuva2kt35rprth6iqeibi3inq2qrn5qhs3aa3b@4hjbhgnskutq>
In-Reply-To: <n6gwizwt26ucpuva2kt35rprth6iqeibi3inq2qrn5qhs3aa3b@4hjbhgnskutq>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 3 May 2023 13:19:31 +1000
Message-ID: <CAPM=9txLf2NbuZSM5CLYT4wA5mbQ=+ssm9tdzh6JJ=gtEBeqAA@mail.gmail.com>
Subject: Re: [PATCH] modules/firmware: add a new option to denote a firmware
 group to choose one.
To: Lucas De Marchi <lucas.demarchi@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> >
> >> > the GROUP until after the FIRMWARE, so this can't work, as it already
> >> > will have included all the ones below, hence why I bracketed top and
> >> > bottom with a group.
> >>
> >> well... that is something that can be adapted easily by using a 2 pass
> >> approach, filtering out the list based on the groups.
> >>
> >> I agree that yours is simpler though.  If we can rely on the
> >> order produced by the compiler and we document the expectations of
> >> MODULE_FIRMWARE_GROUP_ONLY_ONE, then I believe we can stay with the
> >> simpler approach.
> >>
> >> Luis, any thoughts here?
> >
> >I see the Dracut code indicates that the order says now that you should
> >put the preferred firmware last, and that seems to match most coding
> >conventions, ie, new firmwares likely get added last, so it's a nice
>
> not all. i915 for example keeps it newest first so when attempting
> multiple firmware versions it starts from the preferred version.  It
> will be harder to convert since it also uses a x-macro to make sure the
> MODULE_FIRMWARE() and the the platform mapping are actually using the same
> firmware.
>
> >coincidence. Will this always work? I don't know. But if you like to
>
> short answer: it depends if your compiler is gcc *and* -O2 is used
> Longer debug ahead. Simple test with the expansion of MODULE_FIRMWARE
> baked in:
>
>         $ cat /tmp/a.c
>         static const __attribute__((section("__modinfo_manual"), used, aligned(1))) char foo[] = "modinfo_manual_foo";
>         static const __attribute__((section("__modinfo_manual"), used, aligned(1))) char bar[] = "modinfo_manual_bar";
>         $ gcc -c -o /tmp/a.o /tmp/a.c
>         $ objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual
>         $ strings /tmp/modinfo_manual
>         modinfo_manual_foo
>         modinfo_manual_bar
>
> However that doesn't match when building modules. In kmod:
>
> diff --git a/testsuite/module-playground/mod-simple.c b/testsuite/module-playground/mod-simple.c
> index 503e4d8..6dd5771 100644
> --- a/testsuite/module-playground/mod-simple.c
> +++ b/testsuite/module-playground/mod-simple.c
> @@ -30,3 +30,9 @@ module_exit(test_module_exit);
>
>   MODULE_AUTHOR("Lucas De Marchi <lucas.demarchi@intel.com>");
>   MODULE_LICENSE("GPL");
> +
> +
> +static const char __UNIQUE_ID_firmware404[] __attribute__((__used__)) __attribute__((__section__("__modinfo_cpp"))) __attribute__((__aligned__(1))) = "modinfo_cpp_foo";
> +static const char __UNIQUE_ID_firmware405[] __attribute__((__used__)) __attribute__((__section__("__modinfo_cpp"))) __attribute__((__aligned__(1))) = "modinfo_cpp_bar";
>
>         $ make ....
>         $ objcopy -O binary --only-section=__modinfo_cpp testsuite/module-playground/mod-simple.ko /tmp/modinfo_cpp
>         $ strings /tmp/modinfo_cpp
>         modinfo_cpp_bar
>         modinfo_cpp_foo
>
> It doesn't seem to be ./scripts/Makefile.modfinal neither as it's also
> inverted in testsuite/module-playground/mod-simple.o
>
> After checking the options passed to gcc, here is the "culprit": -O2
>
>         $ gcc -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
>         modinfo_manual_foo
>         modinfo_manual_bar
>         $ gcc -O2 -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
>         modinfo_manual_bar
>         modinfo_manual_foo
>
> It seems anything but -O0 inverts the section.
>
>         $ gcc --version
>         gcc (GCC) 12.2.1 20230201
>
> It doesn't match the behavior described in its man page though. Manually
> specifying all the options that -O1 turns on doesn't invert it.
>
>         $ gcc -fauto-inc-dec -fbranch-count-reg -fcombine-stack-adjustments \
>                 -fcompare-elim -fcprop-registers -fdce -fdefer-pop -fdelayed-branch
>                 -fdse -fforward-propagate -fguess-branch-probability -fif-conversion \
>                 -fif-conversion2 -finline-functions-called-once -fipa-modref \
>                 -fipa-profile -fipa-pure-const -fipa-reference -fipa-reference-addressable \
>                 -fmerge-constants -fmove-loop-stores -fomit-frame-pointer -freorder-blocks \
>                 -fshrink-wrap -fshrink-wrap-separate -fsplit-wide-types -fssa-backprop \
>                 -fssa-phiopt -ftree-bit-ccp -ftree-ccp -ftree-ch -ftree-coalesce-vars \
>                 -ftree-copy-prop -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop \
>                 -ftree-fre -ftree-phiprop -ftree-pta -ftree-scev-cprop -ftree-sink -ftree-slsr \
>                 -ftree-sra -ftree-ter -funit-at-a-time -c -o /tmp/a.o /tmp/a.c \
>                 && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
>         cc1: warning: this target machine does not have delayed branches
>         modinfo_manual_foo
>         modinfo_manual_bar
>

Thanks Lucas,

-ftoplevel-reorder is the one that does it, now that does mean how
I've done it isn't going to be robust.

I will reconsider but in order to keep backwards compat, it might be
easier to add firmware groups as an explicit list, but also spit out
the individual names, but not sure how clean this will end up on
dracut side.

I'll take a look at the other options, but it does seem like reworking
dracut is going to be the harder end of this, esp if I still want to
keep compat with older ones.

Dave.
