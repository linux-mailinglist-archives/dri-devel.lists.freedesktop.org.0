Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF00A4C6470
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653C510E1E3;
	Mon, 28 Feb 2022 08:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94F210E1E3;
 Mon, 28 Feb 2022 08:11:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC3C56112D;
 Mon, 28 Feb 2022 08:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639D2C36AE3;
 Mon, 28 Feb 2022 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646035894;
 bh=DljB/ws5J9Owyl5yds3GZxgK+VN9CcGAOjBMjtsvHLY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lUHl1zVGtsG7blAH/F0UTToBcop4tD/U31a16Z8iFIbr3Yz3NZyMMruEmqnjff4ZV
 sOXR4ep1bZSZFP0thZxfJu86f2z6+1scEBxEdmX2MzzbIbTJIcJ58A29zDedh4boJZ
 xAOME5veJRutesYxFUwWk5sQ+QrLNYM/TVXnCtonVD/qOrj4pXJn2RS2GVaVmp52BQ
 5iwZQ45A8fmgwsj70jPmE+MF5yxYndWMbRpKn6LVhUyC6bqg4uPpX27ECqsMIMGs2u
 XUwEuPOV78DTReq/jMwlT/mX0z/iDJpT5zge+xiLD8/j5HMuuicA5nzcXCsD/SOF5J
 RTmRglaDYVWmw==
Received: by mail-wm1-f54.google.com with SMTP id
 o62-20020a1ca541000000b00380e3cc26b7so5506138wme.0; 
 Mon, 28 Feb 2022 00:11:34 -0800 (PST)
X-Gm-Message-State: AOAM533kXPwmqrXziFlroa1dTNJqkg2vUHlnyHVWL2CILw+jWpXD8elk
 dDLBDEc1KxhbOl5HoFtwAsBFkdeqLGq9lKw2ZY4=
X-Google-Smtp-Source: ABdhPJwcMEK5ybaUtjnn+nhdYBsBMcvPLAK49eN6lkpL2rzIto/bB9bCpNQVYXjU55YpRRxY6tLnPO6gmy6I0G+qdwc=
X-Received: by 2002:a05:600c:3b87:b0:381:428c:24c1 with SMTP id
 n7-20020a05600c3b8700b00381428c24c1mr8612916wms.1.1646035892684; Mon, 28 Feb
 2022 00:11:32 -0800 (PST)
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org>
 <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
In-Reply-To: <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 09:11:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a05aLS1sgQdeUDN6LD3oS0khZh07pyEO9LhUC5CJHN-Kg@mail.gmail.com>
Message-ID: <CAK8P3a05aLS1sgQdeUDN6LD3oS0khZh07pyEO9LhUC5CJHN-Kg@mail.gmail.com>
Subject: Re: [greybus-dev] [PATCH] Kbuild: remove -std=gnu89 from compiler
 arguments
To: Alex Elder <elder@linaro.org>
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

On Mon, Feb 28, 2022 at 12:04 AM Alex Elder <elder@linaro.org> wrote:
> On 2/27/22 3:52 PM, Arnd Bergmann wrote: From: Arnd Bergmann <arnd@arndb.de>

> > I put the suggestion into patch form, based on what we discussed
> > in the thread.  I only gave it minimal testing, but it would
> > be good to have it in linux-next if we want to do this in the
> > merge window.
>
> Did you determine what needed the new compiler flag based on
> compilation results?
>
> Glancing at the Greybus code, I don't believe there's any
> reason it needs to shift a negative value.  Such warnings
> could be fixed by making certain variables unsigned, for
> example.
>
> I have no objection, I'll just make a note of it.

I've clarified in the changelog that I'm adding the -Wno-shift-negative-value
everywhere that -Wextra is used, not because I saw actual warnings
for greybus and btrfs. The -Wextra is copied from scripts/Makefile.extrawarn,
so this keeps it in sync. Ideally we should have an easier way for a
subdirectory to get the W=1 flags without copying the list, but the
patch I started to do this never got close to getting integrated.

         Arnd
