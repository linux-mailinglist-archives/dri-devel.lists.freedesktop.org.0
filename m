Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7E45F8791
	for <lists+dri-devel@lfdr.de>; Sat,  8 Oct 2022 23:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F49C10E402;
	Sat,  8 Oct 2022 21:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08E110E402
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 21:42:32 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id x25so1196656qki.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Oct 2022 14:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XB90Z1qj3kPK5TTwJuNvzg1Gu7i5Rnz3wWrq9Xc3CzQ=;
 b=EumsjgKwMc2Jw8Mczz4R6dcA2SGR+dlJiih8Ckk15eXQbl1ssNNcUUrPo+6xLg3PJJ
 ACJZlZtsMQ8qHF+g94jmQvqwnd0JN02OtmaV0630S04pQ33UTiRtB3d/9RZxV3IEWRUS
 2r7jZGZp8PRabENWrLu/RcNXt+h8W/EQbCXY+rIwGHkU8CMyznzvzkw9HGkZzTxMPx8w
 xr6afYXFnKmA95gCiWV/Ff4HwGyaoBIjl31rvLZlakhTDvtM9Lwa0DyWxf0sryHaK1o0
 LvM2pyhtabu/3Ucoe1BChll32HfoeeOvRbBxpmidXxDJ1YSjQ/R5moFvf8yAnsYhmD4z
 nBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XB90Z1qj3kPK5TTwJuNvzg1Gu7i5Rnz3wWrq9Xc3CzQ=;
 b=mmUbTyOoCc86itKpUQ+yy4iprwFfkV9ksQe+vtXG1jM0TM4ywCqCMEJ83+ShSM4GAK
 yVZ787mNdKm4SYXoEErh/dhShN5vMZf7u/BlEEdG5nN4ykdO7le4Uv2i204b/auxulCU
 dMmOtlu4RrJwNb0tSLMFdDw4D9Tn+vSUo9oqknUkydDZHsErIojrU571Yj9IzD5J05Sc
 nn+9NNpKx57ubBhDEmhAo7RsQXSQCH86Zh8VzBhKfGYk8AaYUCWvPavBez6He0vucxRK
 iRqJnrpdGGQssdFBnPyC4nanb9IXzP74X+lNCMF4/aZEbph+kGef06jhTxQh18PVhdX/
 tOYg==
X-Gm-Message-State: ACrzQf0t0pSqTNDLyc3/I8FPYh084Zp91rlFWbK8WSFXeAkaSjWN14mF
 vppnaux0ZTQ0+YcBjfiSxb4=
X-Google-Smtp-Source: AMsMyM7nAvlv/cx8tIjuG0BzVtQBP7E1oOPDn/AxmQr3oNkBQsYkcM4WMSw6/AtojLZMWFu7HL2rZw==
X-Received: by 2002:a05:620a:46a4:b0:6ce:c4af:5a54 with SMTP id
 bq36-20020a05620a46a400b006cec4af5a54mr8239989qkb.377.1665265351668; 
 Sat, 08 Oct 2022 14:42:31 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:2270:4fea:6b67:9485:addd])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05620a410100b006cfaee39ccesm5821626qko.114.2022.10.08.14.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 14:42:31 -0700 (PDT)
Date: Sat, 8 Oct 2022 14:42:30 -0700
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v5 0/7] treewide cleanup of random integer usage
Message-ID: <Y0HuxsLysThhsaTl@yury-laptop>
References: <20221008055359.286426-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221008055359.286426-1-Jason@zx2c4.com>
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
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 x86@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org,
 KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com,
 "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>,
 linux-nvme@lists.infradead.org, loongarch@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>,
 Thomas Graf <tgraf@suug.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 07, 2022 at 11:53:52PM -0600, Jason A. Donenfeld wrote:
> Changes v4->v5:
> - Coccinelle is now used for as much mechanical aspects as possible,
>   with mechanical parts split off from non-mechanical parts. This should
>   drastically reduce the amount of code that needs to be reviewed
>   carefully. Each commit mentions now if it was done by hand or is
>   mechanical.
> 
> Hi folks,
> 
> This is a five part treewide cleanup of random integer handling. The
> rules for random integers are:
> 
> - If you want a secure or an insecure random u64, use get_random_u64().
> - If you want a secure or an insecure random u32, use get_random_u32().
>   * The old function prandom_u32() has been deprecated for a while now
>     and is just a wrapper around get_random_u32(). Same for
>     get_random_int().
> - If you want a secure or an insecure random u16, use get_random_u16().
> - If you want a secure or an insecure random u8, use get_random_u8().
> - If you want secure or insecure random bytes, use get_random_bytes().
>   * The old function prandom_bytes() has been deprecated for a while now
>     and has long been a wrapper around get_random_bytes().
> - If you want a non-uniform random u32, u16, or u8 bounded by a certain
>   open interval maximum, use prandom_u32_max().
>   * I say "non-uniform", because it doesn't do any rejection sampling or
>     divisions. Hence, it stays within the prandom_* namespace.
> 
> These rules ought to be applied uniformly, so that we can clean up the
> deprecated functions, and earn the benefits of using the modern
> functions. In particular, in addition to the boring substitutions, this
> patchset accomplishes a few nice effects:
> 
> - By using prandom_u32_max() with an upper-bound that the compiler can
>   prove at compile-time is ≤65536 or ≤256, internally get_random_u16()
>   or get_random_u8() is used, which wastes fewer batched random bytes,
>   and hence has higher throughput.
> 
> - By using prandom_u32_max() instead of %, when the upper-bound is not a
>   constant, division is still avoided, because prandom_u32_max() uses
>   a faster multiplication-based trick instead.
> 
> - By using get_random_u16() or get_random_u8() in cases where the return
>   value is intended to indeed be a u16 or a u8, we waste fewer batched
>   random bytes, and hence have higher throughput.
> 
> So, based on those rules and benefits from following them, this patchset
> breaks down into the following five steps:
> 
> 1) Replace `prandom_u32() % max` and variants thereof with
>    prandom_u32_max(max).
> 
>    * Part 1 is done with Coccinelle. Part 2 is done by hand.
> 
> 2) Replace `(type)get_random_u32()` and variants thereof with
>    get_random_u16() or get_random_u8(). I took the pains to actually
>    look and see what every lvalue type was across the entire tree.
> 
>    * Part 1 is done with Coccinelle. Part 2 is done by hand.
> 
> 3) Replace remaining deprecated uses of prandom_u32() and
>    get_random_int() with get_random_u32(). 
> 
>    * A boring search and replace operation.
> 
> 4) Replace remaining deprecated uses of prandom_bytes() with
>    get_random_bytes().
> 
>    * A boring search and replace operation.
> 
> 5) Remove the deprecated and now-unused prandom_u32() and
>    prandom_bytes() inline wrapper functions.
> 
>    * Just deleting code and updating comments.
> 
> I was thinking of taking this through my random.git tree (on which this
> series is currently based) and submitting it near the end of the merge
> window, or waiting for the very end of the 6.1 cycle when there will be
> the fewest new patches brewing. If somebody with some treewide-cleanup
> experience might share some wisdom about what the best timing usually
> winds up being, I'm all ears.
> 
> Please take a look! The number of lines touched is quite small, so this
> should be reviewable, and as much as is possible has been pushed into
> Coccinelle scripts.

For the series:
Reviewed-by: Yury Norov <yury.norov@gmail.com>

Although, looking at it, I have a feeling that kernel needs to drop all
fixed-size random APIs like get_random_uXX() or get_random_int(), because
people will continue using the 'get_random_int() % num' carelessly.

Thanks,
Yury
