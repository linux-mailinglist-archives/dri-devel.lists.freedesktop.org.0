Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC62C4C7245
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A83810E6C9;
	Mon, 28 Feb 2022 17:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Mon, 28 Feb 2022 17:13:05 UTC
Received: from condef-03.nifty.com (condef-03.nifty.com [202.248.20.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E2410E6C9;
 Mon, 28 Feb 2022 17:13:05 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-03.nifty.com
 with ESMTP id 21SH3qSB026338; Tue, 1 Mar 2022 02:03:52 +0900
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 21SH3bBO019500;
 Tue, 1 Mar 2022 02:03:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 21SH3bBO019500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1646067818;
 bh=sryAZLDXD/t7zVmI+J82zVk8l2yloq/oD0nvYGiN984=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DFAl9D3d5SV7l8OlblFtkdudyppXM87TTXLJkKaFiDrnHYA5wFLCqpf/bi6XW+/lL
 Wxcxf4DRuPeQzgRVRD0ZLZqGJVyV92OkIiBQSKCRD0fkbmGaM77V1X8/io54DfJJE1
 WHjVeTmICFjHCNQFMP84l0KM6p9KeusZdxBvunEoZ/3O0KaCmfcm9xJcBOxDBliQLy
 v2hLNwthpmWXp3NyaQ3wZjDjgPQxfdr5sC/vbH+pTH2mOrDULVuZBpmLb5vfOGA989
 Xl28AGykKx2Snuz0kqy9XcABSVfqA/+0wAkzfvVhA8SShTSlLQBtapcr4hUau+8ujK
 GQtrmak7eUByg==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id t14so9160163pgr.3;
 Mon, 28 Feb 2022 09:03:37 -0800 (PST)
X-Gm-Message-State: AOAM532CC/JIVynKr3x/3rpbR2AFPnYrBrTpWBDi7i0B1S1w3aF+Tpkm
 KiNH8HKuE52kE9DTv6c7/IMAOJOMEGz/g1/Nibk=
X-Google-Smtp-Source: ABdhPJxISxDkNdxsVTKDDV2g7ZIxBL9oz/LlNlGrxEOGwup5cilO+xLo89K+cDWbGEDhDHUjyYzEiShtkCuCLkVGAaU=
X-Received: by 2002:a05:6a02:182:b0:374:5a57:cbf9 with SMTP id
 bj2-20020a056a02018200b003745a57cbf9mr18072494pgb.616.1646067817034; Mon, 28
 Feb 2022 09:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Mar 2022 02:02:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATVs-yRX4PnURkLv3fz3gAnuzG2GxZ2gdvmJX2g+0P-_w@mail.gmail.com>
Message-ID: <CAK7LNATVs-yRX4PnURkLv3fz3gAnuzG2GxZ2gdvmJX2g+0P-_w@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, linux-doc-tw-discuss@lists.sourceforge.net,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org,
 Alex Shi <alexs@kernel.org>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <src.res@email.cn>, linux-btrfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 7:32 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> During a patch discussion, Linus brought up the option of changing
> the C standard version from gnu89 to gnu99, which allows using variable
> declaration inside of a for() loop. While the C99, C11 and later standards
> introduce many other features, most of these are already available in
> gnu89 as GNU extensions as well.
>
> An earlier attempt to do this when gcc-5 started defaulting to
> -std=gnu11 failed because at the time that caused warnings about
> designated initializers with older compilers. Now that gcc-5.1 is the
> minimum compiler version used for building kernels, that is no longer a
> concern. Similarly, the behavior of 'inline' functions changes between
> gnu89 and gnu11, but this was taken care of by defining 'inline' to
> include __attribute__((gnu_inline)) in order to allow building with
> clang a while ago.
>
> One minor issue that remains is an added gcc warning for shifts of
> negative integers when building with -Werror, which happens with the

Is this a typo?

   building with -Werror, ...
->
   building with -Wextra, ...




> 'make W=1' option, as well as for three drivers in the kernel that always
> enable -Werror, but it was only observed with the i915 driver so far.

Same here.

   enable -Werror, but ...
->
  enable -Wextra, but ...




Otherwise,

Acked-by: Masahiro Yamada <masahiroy@kernel.org>


Please let me know if you want me to pick up this.









--
Best Regards

Masahiro Yamada
