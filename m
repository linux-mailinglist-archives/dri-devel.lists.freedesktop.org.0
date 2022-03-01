Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF74C8E25
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7827C10E588;
	Tue,  1 Mar 2022 14:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B6310E588;
 Tue,  1 Mar 2022 14:46:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 409F361520;
 Tue,  1 Mar 2022 14:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A403BC36AE3;
 Tue,  1 Mar 2022 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646145969;
 bh=O7PMjYoyVgpMGjTVJdUqo4vjOgkMH6zVD28CMdfxejY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ScbK0J6pozv/c2GDJYHlIZpbvfONFwSIK/2j9QTvGy0h6OxUAoFSJS7ACLBifahWv
 DcEHKw3lZtb+uu9XBfWLbqlt4501Amp6VUN+Dzs96ZiZLJ0WrXZIhbPfc31qIWMyNy
 ATq4x+Oqa8aCq2GW5gs+Y/j2lbHCJQUV8G4qbfbhkoke2or1lVhj8owINILXGePjRZ
 R7WocAjuMhKmJQAgH9JZzvEWwPneWdjxvB9/qREXxhHUchmngRvsvQS8MYiNKoAhTS
 lRIGGo0c7PSqmvXlDIU+2nV4tRgWSUE8CyjB1CiW2iruBEJHgJWl3+5y31XDNWkEo7
 0CfBGfIlQclkw==
Received: by mail-wm1-f44.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so1125809wmj.1; 
 Tue, 01 Mar 2022 06:46:09 -0800 (PST)
X-Gm-Message-State: AOAM5339YuVfddwoXv8HOO/Q/VnPwTmUhSbv1XR37SyQoXGyA5ElLI+1
 DgbcJBWcWC64jiUfc0IgZrzI8hsZ6on+lfpoJXw=
X-Google-Smtp-Source: ABdhPJxXTbyRPUGWO5ZqEHYDoeKGRHcrrv5eZPJqecMQqdHX7hdx2ouYJfmaJG1ZffheKZ5NWAXaiF6wK5E6lkn8a4k=
X-Received: by 2002:a7b:c001:0:b0:381:1afd:5caa with SMTP id
 c1-20020a7bc001000000b003811afd5caamr17359158wmb.35.1646145967920; Tue, 01
 Mar 2022 06:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
 <CAKwvOdkLUx1td+qgUYy3w2ojtBG-mJTzpJg3BV8Xv56YHTxHCw@mail.gmail.com>
 <20220228214145.o37bgp3zl3rxpeo4@google.com>
In-Reply-To: <20220228214145.o37bgp3zl3rxpeo4@google.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 1 Mar 2022 15:45:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ZBOdEWTB1K9wA0v657VTZc-BC4LkDoQ0uw8Hw8FfSyg@mail.gmail.com>
Message-ID: <CAK8P3a2ZBOdEWTB1K9wA0v657VTZc-BC4LkDoQ0uw8Hw8FfSyg@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Fangrui Song <maskray@google.com>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Hu Haowen <src.res@email.cn>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net, Alex Shi <alexs@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 10:41 PM Fangrui Song <maskray@google.com> wrote:
> >
> >More precisely, the semantics of "extern inline" functions changed
> >between ISO C90 and ISO C99.
>
> Perhaps a clearer explanation to readers is: "extern inline" and "inline" swap
> semantics with gnu_inline (-fgnu89-inline or __attribute__((__gnu_inline__))).
>
> >That's the only concern I have, which I doubt is an issue. The kernel
> >is already covered by the function attribute as you note.
> >
> >Just to have some measure:
> >$ git grep -rn "extern inline" | wc -l
> >116
>
> "^inline" behaves like C99+ "extern inline"
>
> Agree this is handled by
>
>      #define inline inline __gnu_inline __inline_maybe_unused notrace
>

Ok, I've reworded it again, but kept it a bit shorter, I don't think we
need the full explanation in this patch description in the end.

Thanks,

      Arnd
