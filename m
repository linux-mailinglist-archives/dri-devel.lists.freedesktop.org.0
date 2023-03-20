Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A216C222B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02A710E313;
	Mon, 20 Mar 2023 20:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBF210E313
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 20:04:59 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id s4so5975689ioj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 13:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679342698;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FuvMmA7tsMzT2IG4AsR61roPXvyHSJm+OtWNjVpvWLM=;
 b=dLZ5qlRDQreian19hx8rEVxM/WrWNleueEiYZPkSpF9IDkH5BMxP4A8uLT4mI1LbWP
 /u6d2u5hN8Aj5n2TIsrHPV+mdAXr08W3wfFmV2do8fP8UGz5j7OL7f19eXyt3QSw9VOf
 xILepYvVO0CRbeHw8aRWUJJf+qt0c58HJZracUBHURCOeqoHwNOZ+nliEFT8mmKx36z8
 vXUFuZb4i8txIM21H/XHbKJ8xeaSWo7RZaw52Ai0JIsIi1L0WAsEJe45UWQrTRv5f0n1
 FSCZpZSM99juFyu60aMzUnvvwfQsTF0aWwbPrYhMPKGWqz9q/uH7d26vzHPF4gL/jmJi
 SDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679342698;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FuvMmA7tsMzT2IG4AsR61roPXvyHSJm+OtWNjVpvWLM=;
 b=MYn9LBtZgH9OiEOYD+NPN5zgn4lnq/hnAYo3NhUr4OQYvThshrysYBnyGP2XHJka0W
 Pi62Uu2MFCqb8XCATIbswAfCTtPXCbX9wzGiuCFotQwDHmMs+qYW8qJWinzqZcT7FzWQ
 t69Ty80o7saN11WAP8EDeC5ERW71VMA+LUUonyOjWuQOFJ3cZeyaRfm8lgCao78BxWd/
 jjNb7lJx0yVNFIvzGzvCFGC4CwpbsilQRjpd0ArpEfSpXnhR57G0f8Nr4HZvchwOBKgO
 ZyGiUMC1p20CYvQ1ezEqfqRqdWgXRsWcwehTtqk6eP+N/YswoYSi1PM94cWQObyxcpTz
 Iheg==
X-Gm-Message-State: AO0yUKVQh7EFZuE4BR4C4WN6nzBVINtxmlSF3ypDKUx7xki9fjRxwDRx
 AJM8XBDKVZ2ZFkcsQsbPhWc=
X-Google-Smtp-Source: AK7set+LO0j8cGdeLIZy/9F7alcIS4BjKOm22OraNqeqo7JFbRLYlOivaTzGObTPkuqSMp0F9f1QBw==
X-Received: by 2002:a6b:fd0c:0:b0:758:1db1:ca99 with SMTP id
 c12-20020a6bfd0c000000b007581db1ca99mr2627ioi.19.1679342698537; 
 Mon, 20 Mar 2023 13:04:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a43-20020a02942e000000b0040617a81e1asm3428014jai.59.2023.03.20.13.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 13:04:58 -0700 (PDT)
Date: Mon, 20 Mar 2023 13:04:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 6.3-rc3
Message-ID: <4adbed5a-6f73-42ac-b7be-e12c764ae808@roeck-us.net>
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
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
Cc: Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 11:26:17AM -0700, Linus Torvalds wrote:
> On Mon, Mar 20, 2023 at 11:05 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On the clang front, I am still seeing the following warning turned error
> > for arm64 allmodconfig at least:
> >
> >   drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
> >           if (syncpt_irq < 0)
> >               ^~~~~~~~~~
> 
> Hmm. I do my arm64 allmodconfig builds with gcc, and I'm surprised
> that gcc doesn't warn about this.
> 
> That syncpt_irq thing isn't written to anywhere, so that's pretty egregious.
> 
> We use -Wno-maybe-uninitialized because gcc gets it so wrong, but
> that's different from the "-Wuninitialized" thing (without the
> "maybe").
> 
> I've seen gcc mess this up when there is one single assignment,
> because then the SSA format makes it *so* easy to just use that
> assignment out-of-order (or unconditionally), but this case looks
> unusually clear-cut.
> 
> So the fact that gcc doesn't warn about it is outright odd.
> 
> > If that does not come to you through other means before -rc4, could you
> > just apply it directly so that I can stop applying it to our CI? :)
> 
> Bah. I took it now, there's no excuse for that thing.
> 
> Do we have any gcc people around that could explain why gcc failed so
> miserably at this trivial case?
> 

I have noticed that gcc doesn't always warn about uninitialized variables
in most architectures. The conditional btrfs build failure (only seen on
sparc and parisc) is similar: gcc is silent even if I on purpose create
and use uninitialized variables. Since the gcc version I use is the
same for all architectures, I thought it must have something to do with
compile options (like maybe the option to always initialize stack
variables, or with some gcc plugin), but I have been unable to track it
down.

Guenter
