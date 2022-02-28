Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601224C6D58
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 14:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AB410E6FA;
	Mon, 28 Feb 2022 13:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE9910E660;
 Mon, 28 Feb 2022 13:01:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 62228612C6;
 Mon, 28 Feb 2022 13:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED96C340FB;
 Mon, 28 Feb 2022 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646053284;
 bh=UiMZXTZJMibeG1EW/yB31l1nItCSfnX4i5UKaUmqYi4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aUSaKk/THutssyZeRam8Ln1InKtmbtGYGpY3YWvcJayXLqxXdTg953ErM2MJCtBtt
 uScw14Tbo5bg0ZHcC8cU7sgK10lL8TIQKSzKXfK2pkZyGxYCp1liVDXA1C4GiuJ7SO
 oKHEAWYavKs1p4i7M729QMm1NwF5516rRrjec/lz5dGWlP1/n5JNj3ETeEYxIsNPJb
 BRWAhjZu7qFxrmpdGKWHJpcfMZ8eeq5JB03Rgt3ARIfPBC1Fwk7KFtLPaICIK7TX3F
 4jMGPC4qPpWyyrTwafEVFhjGRcTqgwWsXE9jDdjsorkbn/AQNdVuR7OlQvIUmEXRhX
 usy66MwlSEfkA==
Received: by mail-wr1-f48.google.com with SMTP id j17so15397637wrc.0;
 Mon, 28 Feb 2022 05:01:24 -0800 (PST)
X-Gm-Message-State: AOAM5320XlH54ZcGM1jsGnAnabmys8ou0MxAz5sAwKlKu4Y/+LFWsIik
 8rN4mc4LPFmlfJleNfIgmuVFscdwoFINFmJrgG0=
X-Google-Smtp-Source: ABdhPJwJZ+uje/xKx7oLYKDj2bjjjypvvR3EipOurSGA++FmSYe2fJ0pQQWQ1o2kkZufMewj6tiI/1i+DeR+CamQFLs=
X-Received: by 2002:a5d:63c2:0:b0:1ef:840e:e139 with SMTP id
 c2-20020a5d63c2000000b001ef840ee139mr8331744wrw.192.1646053282413; Mon, 28
 Feb 2022 05:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
 <87v8wz5frv.fsf@intel.com>
In-Reply-To: <87v8wz5frv.fsf@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 14:01:06 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1YUR4BNu8Nrc5XW+sFjL7-hWTHh7kstV27wmj1aqc4vA@mail.gmail.com>
Message-ID: <CAK8P3a1YUR4BNu8Nrc5XW+sFjL7-hWTHh7kstV27wmj1aqc4vA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org,
 Alex Shi <alexs@kernel.org>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <src.res@email.cn>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 1:36 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > One minor issue that remains is an added gcc warning for shifts of
> > negative integers when building with -Werror, which happens with the
> > 'make W=1' option, as well as for three drivers in the kernel that always
> > enable -Werror, but it was only observed with the i915 driver so far.
> > To be on the safe side, add -Wno-shift-negative-value to any -Wextra
> > in a Makefile.
>
> Do you mean always enable -Wall and/or -Wextra instead of -Werror?
>
> We do use -Werror for our CI and development too, but it's hidden behind
> a config option that depends on COMPILE_TEST=n to avoid any problems
> with allmodconfig/allyesconfig.

What I meant here is that I'm adding -Wno-shift-negative-value to all
four places in the kernel that already use -Wextra.

> For the future, makes me wonder if we couldn't have a way for drivers to
> locally enable -Wall/-Wextra in a way that incorporates the exceptions
> from kbuild instead of having to duplicate them.

I have an older patch series that does this, but it also does a few other
things that I couldn't quite get right in the end with all combinations of
compiler versions and warning levels, so I did not submit that.

What this allows is to have per-directory statements like

KBUILD_WARN1=1
KBUILD_ERROR0=1

to force all the default warnings (-Wall etc) to be errors, while
making the W=1 type warnings (-Wextra etc) normal warnings.

> Anyway, for the i915 changes,
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Thanks,

       Arnd
