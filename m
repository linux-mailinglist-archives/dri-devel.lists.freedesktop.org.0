Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07FA654285
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB35F10E161;
	Thu, 22 Dec 2022 14:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9190B10E161;
 Thu, 22 Dec 2022 14:12:34 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id i20so1387009qtw.9;
 Thu, 22 Dec 2022 06:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DaSeJ7b4XoTWS2Tt6rTxmu6n/STTyq8+F8PwIAXlFPg=;
 b=EFjKPbO8+/hBZXe1C7wJoUZfvdGCkgB6+Oo4UJOJ8/Z06BpGoHFlq9xeZoAf7/R9Sb
 PVOBRdiDUWs8BNLEACeD4dCvUW+WIrmlJQnOojhOuPazL+W5SNUCi5kBfnMsR6nNaQbU
 +lPCimCHzF4j2oQMvdR2OyAw6fG7JrPkQ+qLJPdphP4nWmCfyzrGXe9UICdxO+eVgb2F
 IJ7h0qsu1g4jbHXR4UGxQH++a4AF7jWJoiTyf0QHcgrlaIRrsHb9Lx4e2bDkYN0IuYvw
 vS7hZ0QvMhpNmHAy4APgqm/A4DyPklRpKsaA/4vAP+BYd4QA48XxQDc8Vn3JRZ4b1hjg
 T64Q==
X-Gm-Message-State: AFqh2krFkaCWueblcCXqYBZgJctaurvStW7iZLp2gL4kQlK4uAlrq5pS
 KxuZDtQApmIzTv+OfkHa3VqoWXNJnVdx9A==
X-Google-Smtp-Source: AMrXdXuSt4wQoIAlpY67kDkjyZ77x5S+mp6+EGCa29zGqn1cLLyM44j544n/cSls45zokmgszBoY0g==
X-Received: by 2002:a05:622a:1ccd:b0:3a8:dce9:84d1 with SMTP id
 bc13-20020a05622a1ccd00b003a8dce984d1mr6283723qtb.42.1671718353244; 
 Thu, 22 Dec 2022 06:12:33 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 h25-20020ac87159000000b003a82562c90fsm392299qtp.62.2022.12.22.06.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:12:31 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id n78so2047857yba.12;
 Thu, 22 Dec 2022 06:12:31 -0800 (PST)
X-Received: by 2002:a25:d243:0:b0:702:90b4:2e24 with SMTP id
 j64-20020a25d243000000b0070290b42e24mr417369ybg.365.1671718351056; Thu, 22
 Dec 2022 06:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Dec 2022 15:12:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
Message-ID: <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, loongarch@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

Thanks for your series!

On Thu, Dec 22, 2022 at 12:49 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> I hope there will be place for such tiny helper in kernel.
> Quick cocci analyze shows there is probably few thousands places
> where it could be useful.
> I am not sure who is good person to review/ack such patches,
> so I've used my intuition to construct to/cc lists, sorry for mistakes.
> This is the 2nd approach of the same idea, with comments addressed[0].
>
> The helper is tiny and there are advices we can leave without it, so
> I want to present few arguments why it would be good to have it:
>
> 1. Code readability/simplification/number of lines:
>
> Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
> -       previous_min_rate = evport->qos.min_rate;
> -       evport->qos.min_rate = min_rate;
> +       previous_min_rate = __xchg(evport->qos.min_rate, min_rate);

Upon closer look, shouldn't that be

    previous_min_rate = __xchg(&evport->qos.min_rate, min_rate);

?

> For sure the code is more compact, and IMHO more readable.
>
> 2. Presence of similar helpers in other somehow related languages/libs:
>
> a) Rust[1]: 'replace' from std::mem module, there is also 'take'
>     helper (__xchg(&x, 0)), which is the same as private helper in
>     i915 - fetch_and_zero, see latest patch.
> b) C++ [2]: 'exchange' from utility header.
>
> If the idea is OK there are still 2 qestions to answer:
>
> 1. Name of the helper, __xchg follows kernel conventions,
>     but for me Rust names are also OK.

Before I realized the missing "&", I wondered how this is different
from swap(), so naming is important.
https://elixir.bootlin.com/linux/latest/source/include/linux/minmax.h#L139

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
