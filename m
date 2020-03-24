Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E0190879
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 10:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BFC89C97;
	Tue, 24 Mar 2020 09:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36092894D4;
 Tue, 24 Mar 2020 09:06:42 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 02O96O86019224;
 Tue, 24 Mar 2020 18:06:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 02O96O86019224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585040786;
 bh=qOMGdUkveaVDXO2a8tz7KDZMeyMjPwlo2zkk9aWn2yk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r6sgZBXRwNKgjNc3gp3VrRJ8BGpD3C4AIYDGSQ7QzrS7CMakC2dMZ+A9dMeXGVOY8
 +zO1qesO1TVSqk5RtQRrllqSvP08LfxaHcsNWIAy/EeCzBxyB1l+RVQ9gqXSxM3J4F
 CLf7E1kL5ZVLmzhI5FGcG1Dqe2s+9p0qATXeWcKwyrlXVYdOabnOnYEa8prbNDwaP9
 jLyLwxNikwYkNWnQBQWl+aWr40Y0wc2WJ1tqMa+5NksFPu03Wbaz0u0zYCIqUxTNJ3
 PpJTQMnKcIANxzo6B7ghOPqjaLclXBmS/b/bUOMk8kUMkqrFmBMXLkc0wZdek7B+1W
 i8auYJP/RYfmQ==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id t20so6028762uao.7;
 Tue, 24 Mar 2020 02:06:25 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1HaPc8unyQRXZz1/kJaLWZh8RDnxmI3UUjoAqKD4bDMBFbkxU9
 JQQSwOw5s/TbAfWYp5yS6rAejfr4Ro2X/V8OpfM=
X-Google-Smtp-Source: ADFU+vtTr9ggPn7FesvFuHnglv5MtvnxnuDVGKuKqUPW04U7K+2TYBqG5kpqPNh3Go/OGTDteyzcCatZgbB4q1/WETc=
X-Received: by 2002:ab0:3485:: with SMTP id c5mr16446308uar.109.1585040784226; 
 Tue, 24 Mar 2020 02:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200323021053.17319-1-masahiroy@kernel.org>
In-Reply-To: <20200323021053.17319-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Mar 2020 18:05:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNARf0VwM309LsT_HaoF1Jq4Dx0XuFCAOOSr6yHXw50bR9g@mail.gmail.com>
Message-ID: <CAK7LNARf0VwM309LsT_HaoF1Jq4Dx0XuFCAOOSr6yHXw50bR9g@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: remove always-defined CONFIG_AS_MOVNTDQA
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi i915 maintainers,


On Mon, Mar 23, 2020 at 11:12 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> CONFIG_AS_MOVNTDQA was introduced by commit 0b1de5d58e19 ("drm/i915:
> Use SSE4.1 movntdqa to accelerate reads from WC memory").
>
> We raise the minimal supported binutils version from time to time.
> The last bump was commit 1fb12b35e5ff ("kbuild: Raise the minimum
> required binutils version to 2.21").
>
> I confirmed the code in $(call as-instr,...) can be assembled by the
> binutils 2.21 assembler and also by Clang's integrated assembler.
>
> Remove CONFIG_AS_MOVNTDQA, which is always defined.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Please discard this.

I decided to fold this (10/16) into the following big series
because I was suggested to do so.

https://lore.kernel.org/patchwork/project/lkml/list/?series=435391





-- 
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
