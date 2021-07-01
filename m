Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26DD3B9712
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7686E06E;
	Thu,  1 Jul 2021 20:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EAA6E06E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 20:15:27 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id n14so13995232lfu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jul 2021 13:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2iNcNOPlfT+qWPK+b3Uy11X2JBFYAgrqY9VVeV4ulS8=;
 b=H8D4sU0qi8I8AexpK1PssC7DU2czpDwmWVt+gaksX9V0+4qrhKVDeAU4WC8yrVExYC
 M4yjFLQXLHVEUWOJxmw4kTbvDus+9qR26Lidx/Zsz9UWn9KtkLtY1eQ68x/nntopJt5V
 MkXIhnFBYxdh8Ujqznp+zti9Rs1/SumlGyZC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2iNcNOPlfT+qWPK+b3Uy11X2JBFYAgrqY9VVeV4ulS8=;
 b=TGKPOeNPuor5LTBnBlHB2ogGCJqQBLou5Lt8DNQGNM3R0jQzHmbJEMICd7dJwTn9FW
 3Awp5Za6WaV5nkPQu+WMhmFCz/p3ntVfuBhWaNzDxIvPkNL0CqxAaOMJqYWiIHj1nXOi
 rpa3td5icg0opICtIRZWpYkSUBklWQB28xflXmECLZfEoL66Dom/bX7++iJQY3g8F06r
 lRLXWkFwnd001gaPRYJPxlAmDkdypr+JydVdm9xGU88Lx3Iv0WpPcYuKxmZ/GflvBmOs
 wkgA0wm9ahnYMe0u+vdzVEA9p82xkwosv+NHvNClYDxAMoXw7GGgd8UKE52JupfnyzQb
 rx5Q==
X-Gm-Message-State: AOAM533bsEDkliUklztPBMGT91qCJ/wPjkpTOF3xt2cdKhTuUY4LkM80
 LNdN5ZLQ0wP9FX/FjHoD0q+4XaKVY70b9lLjh80=
X-Google-Smtp-Source: ABdhPJzeMObDU47q+tC/SZ0m/Qkit3KNsephdmhRYt9VyFR5C08wFqnXG4/On8zNRc6Nvd3TP+9nVw==
X-Received: by 2002:a19:4c54:: with SMTP id z81mr1024750lfa.28.1625170525303; 
 Thu, 01 Jul 2021 13:15:25 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id i5sm114288ljm.120.2021.07.01.13.15.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 13:15:24 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id h6so10157300ljl.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jul 2021 13:15:24 -0700 (PDT)
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr965880ljp.251.1625170523672; 
 Thu, 01 Jul 2021 13:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
In-Reply-To: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 Jul 2021 13:15:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
Message-ID: <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Dave Airlie <airlied@gmail.com>, Philip Yang <Philip.Yang@amd.com>, 
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 30, 2021 at 9:34 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Hi Linus,
>
> This is the main drm pull request for 5.14-rc1.
>
> I've done a test pull into your current tree, and hit two conflicts
> (one in vc4, one in amdgpu), both seem pretty trivial, the amdgpu one
> is recent and sfr sent out a resolution for it today.

Well, the resolutions may be trivial, but the conflict made me look at
the code, and it's buggy.

Commit 04d8d73dbcbe ("drm/amdgpu: add common HMM get pages function")
is broken. It made the code do

        mmap_read_lock(mm);
        vma = find_vma(mm, start);
        mmap_read_unlock(mm);

and then it *uses* that "vma" after it has dropped the lock.

That's a big no-no - once you've dropped the lock, the vma contents
simply aren't reliable any more. That mapping could now be unmapped
and removed at any time.

Now, the conflict actually made one of the uses go away (switching to
vma_lookup() means that the subsequent code no longer needs to look at
"vm_start" to verify we're actually _inside_ the vma), but it still
checks for vma->vm_file afterwards.

So those locking changes in commit 04d8d73dbcbe are completely bogus.

I tried to fix up that bug while handling the conflict, but who knows
what else similar is going on elsewhere.

So I would ask people to

 (a) verify that I didn't make things worse as I fixed things up (note
how I had to change the last argument to amdgpu_hmm_range_get_pages()
from false to true etc).

 (b) go and look at their vma lookup code: you can't just look up a
vma under the lock, and then drop the lock, and then think things stay
stable.

In particular for that (b) case: it is *NOT* enough to look up
vma->vm_file inside the lock and cache that. No - if the test is about
"no backing file before looking up pages", then you have to *keep*
holding the lock until after you've actually looked up the pages!

Because otherwise any test for "vma->vm_file" is entirely pointless,
for the same reason it's buggy to even look at it after dropping the
lock: because once you've dropped the lock, the thing you just tested
for might not be true any more.

So no, it's not valid to do

    bool has_file = vma && vma->vm_file;

and then drop the lock, because you don't use 'vma' any more as a
pointer, and then use 'has_file' outside the lock. Because after
you've dropped the lock, 'has_file' is now meaningless.

So it's not just about "you can't look at vma->vm_file after dropping
the lock". It's more fundamental than that. Any *decision* you make
based on the vma is entirely pointless and moot after the lock is
dropped!

Did I fix it up correctly? Who knows. The code makes more sense to me
now and seems valid. But I really *really* want to stress how locking
is important.

You also can't just unlock in the middle of an operation - even if you
then take the lock *again* later (as amdgpu_hmm_range_get_pages() then
did), the fact that you unlocked in the middle means that all the
earlier tests you did are simply no longer valid when you re-take the
lock.

                 Linus
