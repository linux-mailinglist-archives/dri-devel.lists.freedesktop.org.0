Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCADDBB50E5
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 21:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECDF10E021;
	Thu,  2 Oct 2025 19:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cHAVyPdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CA110E021
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 19:54:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-62ecd3c21d3so2562292a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 12:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1759434845; x=1760039645;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I37SSLi2qetMQx6IBceAm8uDQMzW3KruHoh0XNcQuVw=;
 b=cHAVyPdrPRTxT9C35pUPV68lEYaFQQ7jYIaJlQEofRy8UuwR9SYnBdPVn7vvDWL5UW
 MFZNlKWi6IuCrJkczml0A92wZ8q9s/TykRG0ARW4b2OfZmkO8gWWmj4oT5JOJ7EDe0tp
 au4cePNq5/bRy+QS0Jof8n/645vkJCTgx65KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759434845; x=1760039645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I37SSLi2qetMQx6IBceAm8uDQMzW3KruHoh0XNcQuVw=;
 b=WAdWOHDGUskyNLOMPjbBbN+m+3fPOGyxhsA2teqtaonJ6x1LkZ72LUqdtUorHEyBDS
 P2pN4YKy5E5EMFyFuFISS1Igr/PYU2oBzsR23TBCgCmX6W+rbiOtaEZoxlCdLkFAq01q
 kwibU1NTNxrcBAMrmJxJeJJHPWLMZ1sj6mcurkfzFILulWFmbO3to3oE2DVtl7oKVsZx
 AC81eXHaO0+c7IDqI/Zrbbk6bo89W+lotThq/opXPSSv1b1ZU/pw7AiSGiQFOLQARHdV
 jhUcaMI+JMFBTBg82JOFruUiOg6JR8xmHbE3OBDMh6Qk20SLMxR/lqkqQ0SESi0qWBaU
 qq0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+0UXXK1M03DAXimttgafyjRsiJrR5MYXx9U1WAIPN+sI9g6NamegMnh4y7EyDmfUxCzPGx7pe93c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEpX5e7GdjvYykvwvPAHx7QuvC1xgq8DtPGPWnf2zJiuGtk5w7
 SKWa9sC0ks1FUfJDeW3TAcczJNJsX+lrnfBysZiZj3SjVl3FyWirx5sHghusRFxygPOVtNdZ7LG
 JFT93K/c=
X-Gm-Gg: ASbGncsWqLLqCuFXnHk7c6Pj9J4O756rdUdZLjB1q2NU7bPzo1W1F/v8nFuOOccm3ru
 g7qNjdE9C0oJseu0bDCeNFYBr442uy+iouYv/3/akVR1Y7AwDEZvx6eR2ACug7Ub1Zd11o0TRd+
 GHVooYflcp7HZ53nkqgWb5m0rns/V8HIYZacxW9SezsOEH3Q/fC/c313FRzZuw7KtJ79+xghb5h
 jGVBwGNKcpTJrxkQndFyYqyri6dhIHeOpG7A/OnEkip0NcZSIQ7J/3IKYi3pu7OLN5uPYHo+aIx
 aVS1uWAlRD1NSu4GhjUEV0V0GJ1t82u1FHnmVMELXu5YXv0YdkI0cWYLscV9AIuvQ8LEuyPmD4m
 YUurLj7GtzQjLzHs2aDMGJ7EGLI0IvT89qLh1dBVGYw3nTeLJCa4UyxVm+eh0AM6Aczd0SEOpyg
 uybuMWfMNAkYM3d9Y2my+xHACIBHmCgic=
X-Google-Smtp-Source: AGHT+IE7g5IybUjI3D2R0nvi5k8YAhWNL8DdXfRDkteZDmoYtdbns9Vw6bKD2E+GUQiAnGbrE0Y/yw==
X-Received: by 2002:a17:907:9409:b0:b3e:8252:cd53 with SMTP id
 a640c23a62f3a-b49c1f53601mr68120466b.27.1759434844631; 
 Thu, 02 Oct 2025 12:54:04 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652a9e66sm269055566b.14.2025.10.02.12.54.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 12:54:03 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-62fa062a1abso2524227a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 12:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU84Oh/CHCBd/3qMRYiFHB0ozn+BZMO8olYvrodelu0QpjMhdvQL2Ac7Jg+GpUav5HeSEYyT4+47Mk=@lists.freedesktop.org
X-Received: by 2002:a17:907:3d91:b0:b2a:10a3:7113 with SMTP id
 a640c23a62f3a-b49c1f54862mr76088066b.29.1759434843265; Thu, 02 Oct 2025
 12:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
In-Reply-To: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 2 Oct 2025 12:53:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
X-Gm-Features: AS18NWDXy-JXhX78nkhLH5FtPzyaZrdPMLmE90_MFn-_upbdYrA-tUUT0FXOA4I
Message-ID: <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Dave Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ Miguel: Rust conflict resolution question at the end ]

On Tue, 30 Sept 2025 at 21:06, Dave Airlie <airlied@gmail.com> wrote:
>
> As usual, let me know if there are any problems.

You are still corrupting indentation in your explanations.

I don't know *what* you are doing wrong, but it's wrong. You seem to
have lost all indentation.

Look here as an example:

> rust:
> - drop Opaque<> from ioctl args
> - Alloc:
> - BorrowedPage type and AsPageIter traits
> - Implement Vmalloc::to_page() and VmallocPageIter
> - DMA/Scatterlist:
> - Add dma::DataDirection and type alias for dma_addr_t
> - Abstraction for struct scatterlist and sg_table
> - DRM:
> - simplify use of generics
> - add DriverFile type alias
> - drop Object::SIZE
> - Rust:
> - pin-init tree merge
> - Various methods for AsBytes and FromBytes traits

Notice how there are multiple sub-areas: Alloc, DMA/Scatterlist, DRM and Rust.

But it's all just a random jumble, because you have apparently pasted
it into your editor or MUA or whatever and dropped the indentation in
the process.

Or something.

What kind of *broken* editor are you using? I'm not trying to start an
emacs or vi war here, but you seem to be using something truly broken.

EDLIN?

And similar thing here:

> msm:
> - GPU and Core:
> - in DT bindings describe clocks per GPU type
> - GMU bandwidth voting for x1-85
> - a623/a663 speedbins
> - cleanup some remaining no-iommu leftovers after VM_BIND conversion
> - fix GEM obj 32b size truncation
> - add missing VM_BIND param validation
> - IFPC for x1-85 and a750
> - register xml and gen_header.py sync from mesa
> - Display:
> - add missing bindings for display on SC8180X
> - added DisplayPort MST bindings
> - conversion from round_rate() to determine_rate()

Look, again, no logic and you've completely corrupted any multi-level
indentation that presumably existed at some point judging by the
organization.

WTH?

I try to make this all legible as I walk through it myself.

So I regularly fix up peoples language skills etc, because I
understand that English isn't always the native language (and that
even if it is, some people just aren't very good at writing
explanations).

But these kinds of "I'm pretty sure you've just corrupted the
formatting that was there in some original message" is just
_annoying_.

Please make the explanations *readable*, not just a random jumble of words.

And on a more technical side: I absolutely detest the mindless and
completely crazy Rust format checking.

I noticed that people added multiple

  use crate::xyz;

next to each other, so I turned them into

  use crate::{
     xyz,
    abc,
  };

instead to make it easy to just add another crate without messing crap
up. The use statements around it had that format too, so it all seemed
sensible and visually consistent.

But then I run rustfmtcheck, and that thing is all bass-ackwards
garbage. Instead of making it clean and clear to add new rules, it
suggests

  use crate::{xyz, abc};

but I have no idea what the heuristics for when to use multiple lines
and when to use that compressed format are.

This is just ANNOYING. It's automated tooling that is literally making
bad decisions for the maintainability. This is the kind of thing that
makes future conflicts harder for me to deal with.

Miguel, I know you asked me to run rustfmtcheck, but that thing is
just WRONG. It may be right "in the moment", but it is

 (a) really annoying when merging and not knowing what the heck the rules are

 (b) it's bad long term when you don't have clean lists of "add one
line for a new use"

Is there some *sane* solution to this? Because I left my resolution
alone and ignored the horrible rustfmtcheck results.

I tried to google the rust format rules, and apparently it's this:

    https://doc.rust-lang.org/style-guide/index.html#small-items

can we please fix up whatever random heuristics? That small items
thing may make sense when we're talking things that really are one
common data structure, but the "use" directive is literally about
*independent* things that get used, and smushing them all together
seems entirely wrong.

I realize that a number of users seem to just leave the repeated

   use kernel::xyz;
   use kernel::abc;

as separate lines, possibly *becasue* of this horrendous rustfmt
random heuristic behavior.

              Linus
