Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40106C515A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 17:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B143310E3C2;
	Wed, 22 Mar 2023 16:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E9610E3C2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 16:56:18 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id o12so75625561edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1679504177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObydWNcsN+yJjQR232+qhKPgXiEW95d36vBjFwkTd3w=;
 b=IoYIuv0c74xAIGn1TWP8KV8wy2ZYjqP4mF3RLvlNIIbOTqOjdOkmYyjwsZnaGRbg4A
 m19AquLYmi1k8VkbzLpHZBZ+ljhlWVTj0tZD2HlmTsvzdLy5BM1XHLNfxXqEzmPYOrDR
 eOSJCYmb9Pun6t3MCm3bnoGxKDwy8dLuPyrOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679504177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ObydWNcsN+yJjQR232+qhKPgXiEW95d36vBjFwkTd3w=;
 b=DbvAWTgB7E2Wj9Ioq9nsUeg76sZTBpz+ls5BG6rr/BYkdiWqlpfXYzH/5Oh7ALfXQd
 3k1S9YOnhe/ptkIuMQfg2Wn2yuGzkpNUXcWEwXsKqOP2yNJFGAaeHCnOZJU/Cm0Ds2M1
 jZBqGBaM9jDaLALRWInSXzn+hRTghtTo3wkIPxpD3vzxnyHK1+4voUp17ganfB3yHmH7
 Xyy0bNX2y3UaL6cKoBenvIYiC8ljVtSf+Z1pL2iCZaaLHt0oybnAc7YQFoWGhkSYYery
 EvzTUBXt4CYuWnkZ7R7miF6p4t+sCwGOMMzIwyTkey6cBgBzlyr1+qZjsObu95nXSVk4
 n0Ew==
X-Gm-Message-State: AO0yUKWIKRYzbp+3vDOc+IL0jlcP2oDIgiJtoBKtVNi7oQu6HfKw3ESt
 giv0/wNV+KkOkZhEl3MNPFRTmE7RQ+OKdCNGGadaJxsH
X-Google-Smtp-Source: AK7set9Dc7KSTB/KHXiDbyPQwjDDQG0EbP7oeANZ5koUqnnmoPFBpXhx6co8tVyU1n310hZhLSoD9g==
X-Received: by 2002:a17:906:46d0:b0:933:3a65:67ed with SMTP id
 k16-20020a17090646d000b009333a6567edmr8854474ejs.75.1679504176902; 
 Wed, 22 Mar 2023 09:56:16 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 g1-20020a1709061c8100b0092669fb4ba1sm7443455ejh.130.2023.03.22.09.56.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 09:56:16 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id cy23so75539199edb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:56:15 -0700 (PDT)
X-Received: by 2002:a17:906:6d6:b0:933:f6e8:26d9 with SMTP id
 v22-20020a17090606d600b00933f6e826d9mr3542731ejb.15.1679504175429; Wed, 22
 Mar 2023 09:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X> <87pm91uf9c.fsf@kernel.org>
 <CA+icZUUYyqhV2HFzVtpi_KjBoYxjk7OB0UBVd2mX6abjmYhDjg@mail.gmail.com>
In-Reply-To: <CA+icZUUYyqhV2HFzVtpi_KjBoYxjk7OB0UBVd2mX6abjmYhDjg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Mar 2023 09:55:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=whdrvCkSWh=BRrwZwNo3=yLBXXM88NGx8VEpP1VTgmkyQ@mail.gmail.com>
Message-ID: <CAHk-=whdrvCkSWh=BRrwZwNo3=yLBXXM88NGx8VEpP1VTgmkyQ@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: sedat.dilek@gmail.com
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
Cc: linux-toolchains@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 llvm@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 9:40=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> You have to pass `make LLVM=3D1` in any case... to `oldconfig` or when
> adding any MAKEFLAGS like -j${number-of-available-cpus}.

I actually think we should look (again) at just making the compiler
choice (and the prefix) be a Kconfig option.

That would simplify *so* many use cases.

It used to be that gcc was "THE compiler" and anything else was just
an odd toy special case, but that's clearly not true any more.

So it would be lovely to make the kernel choice a Kconfig choice - so
you'd set it only at config time, and then after that a kernel build
wouldn't need special flags any more, and you'd never need to play
games with GNUmakefile or anything like that.

Yes, you'd still use environment variables (or make arguments) for
that initial Kconfig, but that's no different from the other
environment variables we already have, like KCONFIG_SEED that kconfig
uses internally, but also things like "$(ARCH)" that we already use
*inside* the Kconfig files themselves.

I really dislike how you have to set ARCH and CROSS_COMPILE etc
externally, and can't just have them *in* the config file.

So when you do cross-compiles, right now you have to do something like

    make ARCH=3Di386 allmodconfig

to build the .config file, but then you have to *repeat* that
ARCH=3Di386 when you actually build things:

    make ARCH=3Di386

because the ARCH choice ends up being in the .config file, but the
makefiles themselves always take it from the environment.

There are good historical reasons for our behavior (and probably a
number of extant practical reasons too), but it's a bit annoying, and
it would be lovely if we could start moving away from this model.

            Linus
