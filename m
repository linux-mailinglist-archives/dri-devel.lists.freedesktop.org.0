Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DE2B16AA5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 05:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F49810E1BC;
	Thu, 31 Jul 2025 03:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gI3ao576";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2864310E1BC
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:05:35 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-af0dc229478so70788166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753931134; x=1754535934;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HAYf5bawKOAi9UbMFDlw0TMRVyadJUpjLn1RTvakHDI=;
 b=gI3ao576wR05RpuphRRj5bO8u5Ylkl/zcx0bIgCQDk09QOPO0+KDocHCaIdI0nFwMl
 nsCpQN7q6ByAhpApjAzwNuqFEb33oSbaKY/YZj3mTyi8ftpzRzFw3DzYUunzLWTOIejh
 gBA0ZsAhpiqimZgbgoFJA2S3BQroZe8bVN59o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753931134; x=1754535934;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HAYf5bawKOAi9UbMFDlw0TMRVyadJUpjLn1RTvakHDI=;
 b=AiaeHLyDNDIDML0qX1YENePnilcbQ4lHIM4UErPZuTGBVfNgW+GqSTk5RHkfn+P4IZ
 +BTSn78FUiR5HXoaYm04FiCcMRM27cBe8z13YS/86IgplxoNr+H8sRr16ArrTIbi8Fo2
 mTtv8uX41S+y/Ypg6ajf07+Y+56ls91hjmskSJxF1cywcTvLldCkU1TiRkMwCPqfQB3E
 1WwFzUNucFPK1m0YThLd9J+DnNprGfvJaBygDBw5LnskbGv6QHjYJMKHf3UUmoFVLFxa
 wEci+dIuMLn2UUPu0FowDKfq+WUtlSb3HjVqmPZh645MAQK0TzpbAl8OAmt+9ziBBFsC
 y4bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1qZ9JoFpN5ELGDxxLb4BWKZLSbN3qG9inqCdEqPiZ/N80vA5qBpqUNdUnwOeeFZ2DGtCz5P5jPl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUNG6XUzfIjoZogRk0AvdTGYMQgud98Ho0Bo6+szbi8PZeTRME
 z5zmeHnzZGXufFTtYwCtrtNUonymh5mxHrXsR0JDLNrLCoPyh9Hb+4yvw2jf+TTCxj8bwwIClJ8
 ALY0/L0s=
X-Gm-Gg: ASbGncs6at1jN8bEsyBq/4BUyvc2XDsjlB21OZUxAMVwud16vpuxWcgK3fcnxN6yyvm
 4+yYvpKEfywJ2dfRjhxNduy36mgrElsdFTLrr6CRKXiDv5rawUC0aaFT3qsIEYvY48pMPjI82MY
 pKdAKrr8airqcmx4OR4DZqV8gaHyRZf35m/OTq6/dIRcxNb03fa0g0u2EJeSz/RFQTAd4BJd3RE
 vnKCb2Vz0Uz2GXR77aLaI2O2WfiGB19Uyl28oYOb5o8kZxqfoEKk2CqkM9C2KQXTsQvD/mAhyAW
 pdcGlJhE5vqci8ta+QYa/rtuDyxKHxyqsoFYIiifZU2QXVtuiS0PZU7J2Di4UQEl/I861/eFSa1
 ZMojm7XJS3bT0HIgSLH9gu00R3UBfnEC7jBp/XZ4d9VckLZLXWkz/K+zhkuAuVFNSvSORrlTi
X-Google-Smtp-Source: AGHT+IFKNLxK92unFnMNW7kW01+XjkypoivTrT9jF8G72NLRDGrsWdYod9lpwUVqhYd7k/SPRvYHVw==
X-Received: by 2002:a17:907:d27:b0:aec:76c6:6ef6 with SMTP id
 a640c23a62f3a-af8fda40036mr587849566b.50.1753931134184; 
 Wed, 30 Jul 2025 20:05:34 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e820asm35309266b.90.2025.07.30.20.05.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 20:05:33 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-61568fbed16so607295a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXD9yn3O9N+jg5s3rDgFP02fF7Mq6fjVsCWSvvYxwP6fzHbGiFF1AoWfBcbxq+JuxVupw9zpD/t0Is=@lists.freedesktop.org
X-Received: by 2002:a05:6402:358c:b0:615:adc4:1e66 with SMTP id
 4fb4d7f45d1cf-615adc425aamr633902a12.25.1753931132919; Wed, 30 Jul 2025
 20:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
In-Reply-To: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 20:05:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
X-Gm-Features: Ac12FXyGI4908rAYUaEIQ05Ez7SZKZXC1fcfCug1m7LIGtr9OB56lWZC4UF5C8Q
Message-ID: <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Dave Airlie <airlied@gmail.com>
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

,

On Tue, 29 Jul 2025 at 14:06, Dave Airlie <airlied@gmail.com> wrote:
>
> I've done a pass at merging mostly taking from drm-tip:
> https://github.com/airlied/linux/tree/drm-next-6.17-rc1-merged

Hmm. My resolution is pretty different, but part of it is that your
test-merge has a different top-of-tree than the tree you actually sent
me. I think you added commits

  b213eb34f857 ("drm/tidss: oldi: convert to devm_drm_bridge_alloc() API")
  66cdf05f8548 ("drm/tidss: encoder: convert to devm_drm_bridge_alloc()")

to the drm tree after you did your test merge.

That said, ignoring those differences, the other ones I'm pretty sure
your merge is wrong. For example, you left a duplicate

        err = xe_gt_pagefault_init(gt);
        if (err)
                return err;

in xe_gt_init().

Also, you didn't undo the dma_buf addition to 'struct
virtio_gpu_object', that was added by commit 44b6535d8ace
("drm/virtio: Fix NULL pointer deref in virtgpu_dma_buf_free_obj()"),
but that commit was a fix for the problems that were reverted by
0ecfb8ddb953 ("Revert "drm/virtio: Use dma_buf from GEM object
instance"").

In etnaviv_sched.c, you seem to have missed the "Rename
DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RESET" in commit
0a5dc1b67ef5.

And you have missing MEDIA_VERSION / GRAPHICS_VERSION entries in
xe_wa_oob.rules from commits c96e0df4e9f5f and b1c37a0030b27.

ANYWAY.

My point isn't so much that I think your merge is wrong - it's very
possible that I have made other mistakes to make up for yours. But my
point really is that these drm merges are rather messy and
error-prone.

And yes, I'm pretty good at sorting merges out, and this was by no
means the messiest merge I've ever seen.

But I do think that the drm people are doing actively wrong things
with the random cherry-picks back and forth: they cause these
conflicts, and I *really* think you should look at maybe using stable
fixes branches instead.

Would that require more care and cleaner trees? Yes. And that's kind
of the point. You are being messy, and it's affecting the quality of
the end result.

And maybe I did get the merge perfectly right. And maybe I didn't.

But the fact that you have *so* many conflicts, and that I'm pretty
damn sure that your example merge was not correct, makes me really go
"your development model is messy and leads to problems".

Again: I'm not going to guarantee that I got it right. I *think* I did
- I'm not feeling particularly unhappy with my merge end result. The
merge was annoying but largely straightforward. And it builds ok for
me ("ship it, it's perfect!"), although I do see an objtool warning:

    drivers/gpu/drm/msm/msm.o: warning: objtool:
submit_lock_objects+0x44d: sibling call from callable instruction with
modified stack frame

that makes me go "Hmm".

But that one looks like gcc doing some very strange things with
coverage tracing, so I am currently inclined to blame it on odd
compiler output and objtool rather than the drm tree itself.

But I really wish you had a better model for "backport fixes" than the
mess you have now.

Because it clearly is causing potential problem spots.

            Linus
