Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6573B16AED
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 05:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F63910E10A;
	Thu, 31 Jul 2025 03:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KMhnpinZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A123110E10A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:39:45 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ae0dffaa8b2so85538866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753933184; x=1754537984; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3DOMuVqCG6ucS2KyeUvGWMWEYcfdslld5Co+amobArU=;
 b=KMhnpinZ328q+4G11T1oFpnfBAhCSWyBGNJ5EWKiieR/eVuhzqTb1lGlo9+l7M3aUK
 gSHxSD9hYABhIPH3JTQyGILvN6FZNHquQPPj/AHAu6mwH7F6FBKBcpnWPnY8XnJc1qZu
 V/Q5HeY2wwuj8v7L5OxaqOja9by/PEGV6SiPOWHnr9MBhQXiHZGJNnE72SyWFTNcFgxH
 UxtJFp8jvgoqY62GA0epfBLN6OfSV/tIOrrGulzSNSAiwMdXTfTl1vPrBE5vhAINqIGO
 sukCecZm6tIf3E0AowNdRPQs/jy5VnjyZRXAduKbU+2AcqwIQ+aW+UOD40xzaV+HePXo
 Jfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753933184; x=1754537984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3DOMuVqCG6ucS2KyeUvGWMWEYcfdslld5Co+amobArU=;
 b=r3QYDqzS+XNuKHDSuOZQMRHSO8+X2T+7FlBvWd+fmzJekK3XYDIB9Ix4ZokmjYylAS
 NKXcry0LnnK2u1Y0UxGinoCvmYsu3FGN1EQ+nwKktz5StKoRiR3FCjPBmX6GCbn6ZGuQ
 XcpfHHR2YULhRR02AEGjqmZhzU5lbSGBZxYX1WJtWlB+lhfsvz3pdKWwdLFsfwuEjTXn
 eiwmiZXaDKxsQL+2SdyKe9sOZxqpzQyECDvvtSVxrDnjjQXIPl9UzoI6IuPxjWfLNX2T
 nxWH9dj///KVXaD+fW1cYWFme6vqg1vo2jW8WIjB25FjmHp+tC9kswWGBzsskMS0fgRJ
 1IUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRl12Kednz5yxbDr9+FrzX5BtY0iC9PQFl2qfndoXLv6hiizb0ArIFHRovrae+L2981Pwhn+/Ywiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmMIo9THRdarxDXneiP5Y3GBAgIlVaKEx406uEZ2P4nC5SYIWQ
 Rrq1/kU0VNK7rsiTUgFqUJz3Q6VTkDSL/c8Y+XCsq88Q8xfvBtJOEKtPW2CkVoJwMFCKQuXAmzm
 cnwVIpEo51R8nMzFF7/qYuKhTyvLCoI8=
X-Gm-Gg: ASbGnctBei2JYY1B0WBbG0DQbbSPtPHRTVeJxCXTGcHecI+MwG+eH+SO6QYlQZ4ebBy
 LLkBXrm2dl/Re7vkj+SSOClYX/lKp+//aSkyfUtAB8F6SfjuwcAUat7SDKO/9+T20cKTBUvZGW5
 i28YA2GnkCbXltwZE7WVUVFKCcFfJq4MxK/5ntHwP9VLdEwNT9mvZzUOkRmuSF+xOZ4iX8RgW4o
 YyOGg==
X-Google-Smtp-Source: AGHT+IE1FJta3Kf+qHXYmgbBxStOpuBJWiwQe8W/T0eWdzr/4FgGfyRAGqUML7nI01THeh00KeaK1tpiRV/GV09Dvr4=
X-Received: by 2002:a17:907:3f0c:b0:ad5:7bc4:84b5 with SMTP id
 a640c23a62f3a-af8fda8bebfmr736738666b.57.1753933183917; Wed, 30 Jul 2025
 20:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
In-Reply-To: <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 31 Jul 2025 13:39:32 +1000
X-Gm-Features: Ac12FXyFcrYEVB54oZoJqoDectz4Jjvkrj1zJCKaLa3O4xleVd9ylaAKXtYeJpU
Message-ID: <CAPM=9twG7By95nYrkoyLtAT5YPV9WdMUgVPwjuZ9kiZFuse+Fg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
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

On Thu, 31 Jul 2025 at 13:05, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> ,
>
> On Tue, 29 Jul 2025 at 14:06, Dave Airlie <airlied@gmail.com> wrote:
> >
> > I've done a pass at merging mostly taking from drm-tip:
> > https://github.com/airlied/linux/tree/drm-next-6.17-rc1-merged
>
> Hmm. My resolution is pretty different, but part of it is that your
> test-merge has a different top-of-tree than the tree you actually sent
> me. I think you added commits
>
>   b213eb34f857 ("drm/tidss: oldi: convert to devm_drm_bridge_alloc() API")
>   66cdf05f8548 ("drm/tidss: encoder: convert to devm_drm_bridge_alloc()")
>
> to the drm tree after you did your test merge.
>
> That said, ignoring those differences, the other ones I'm pretty sure
> your merge is wrong. For example, you left a duplicate
>
>         err = xe_gt_pagefault_init(gt);
>         if (err)
>                 return err;
>
> in xe_gt_init().
>
> Also, you didn't undo the dma_buf addition to 'struct
> virtio_gpu_object', that was added by commit 44b6535d8ace
> ("drm/virtio: Fix NULL pointer deref in virtgpu_dma_buf_free_obj()"),
> but that commit was a fix for the problems that were reverted by
> 0ecfb8ddb953 ("Revert "drm/virtio: Use dma_buf from GEM object
> instance"").
>
> In etnaviv_sched.c, you seem to have missed the "Rename
> DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RESET" in commit
> 0a5dc1b67ef5.
>
> And you have missing MEDIA_VERSION / GRAPHICS_VERSION entries in
> xe_wa_oob.rules from commits c96e0df4e9f5f and b1c37a0030b27.
>
> ANYWAY.

I also need to check if the Intel folks who did drm-tip merges dropped
some things wrong, since I mostly copy from those. The etnaviv one I'd
screwed up definitely, I didn't do an arm build on the merged tree,
and I probably should ensure I do that in the future.

>
> My point isn't so much that I think your merge is wrong - it's very
> possible that I have made other mistakes to make up for yours. But my
> point really is that these drm merges are rather messy and
> error-prone.

Agreed, the error-proneness of them is my main worry, in our internal
tip dev we try and get the knowledgeable people to do the merges, so
my trial merges are definitely not something I practice often, so I'm
happier that you are better at them than me.

>
> But I do think that the drm people are doing actively wrong things
> with the random cherry-picks back and forth: they cause these
> conflicts, and I *really* think you should look at maybe using stable
> fixes branches instead.
>
> Would that require more care and cleaner trees? Yes. And that's kind
> of the point. You are being messy, and it's affecting the quality of
> the end result.

I'm not sure how to parse, stable fixes branch, do you mean stable as
in a special branch for stable tree? or a fixes tree we don't rebase
every rc?

Currently all the base (drm, intel, xe, amdgpu) fixes branches are
stable, we backmerge into them after rc1, and very occasionally
afterwards if a backmerge from rc5/6 is needed.
I pull those stable branches into your latest rc each week and send it to you.

We should only cherry-pick one direction, things that go into -next
and are recognised as fixes are cherry-picked into -fixes. The people
doing the cherry-picking are not always the original developers, and
the patches for fixes are often part of larger refactors.
Because of that, things that end up in -fixes are often refactors and
not clean cherry-picks. Then we get the fun of having a revert in
fixes, and a fix in next and shit starts to get messy, (though in this
case only one or two of the conflicts are revert related problems).

I'm happy with mostly correct, since the downstream devs will
eventually pull this into CI and fix it up anyways, but this time it
was very ugly, and I'll make sure everyone tries to review the merge.

> But that one looks like gcc doing some very strange things with
> coverage tracing, so I am currently inclined to blame it on odd
> compiler output and objtool rather than the drm tree itself.
>
> But I really wish you had a better model for "backport fixes" than the
> mess you have now.
>
> Because it clearly is causing potential problem spots.

It is, I just can't figure out a better plan, myself and Simona have
gone over this multiple times, and the answers we get from others is
just have your developers know in advance that the thing they are
fixing in next should go into fixes first, but then we have to forward
merge fixes into next more often, and large teams of developers have
to be aware of the rc cycle and rules around what is acceptable when.
Scaling sucks here and these are large teams, who are often working
far ahead of the rc cycle.

Dave.
