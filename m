Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA7A166B75
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 01:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659666EE89;
	Fri, 21 Feb 2020 00:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896A36E1A8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 00:19:59 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l136so312362oig.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 16:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IHr5qo3B7v5uxs0wZA0fZW6J9zqGy3IdsKd+NBLqxdQ=;
 b=Hz3Wvel0TrnLWu2KOGBLM37xIzOel8u9Z3LL3LKWhQ5uDvm2hmCI+8lAaq9dDcnzK0
 mmF29yC6bk6kCEp7Rp8Xphv7SaNuWSCpytm5t0gbTsUTgWYqT1kGf0Uk4snguMx7ktEB
 CUaU4UXvlG8DiQPZ0fLoxZ7q8pzZGa6twCkjkNgfUTBep5MTIzKNPNNZmjXvVmIuajDT
 x1oGn/KBMPVd010kg/4IBE9Z7pYnop4ImXcsjGIsjF1rqOEZh0XzY3XCKZGRIyEUPwgM
 dnOCLimGwLQYnIXwqYXRG3zAdpZoXpkT5LDSWOlqz/mbvst5M1heaxiNSpmi3QJ6N3pL
 qeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IHr5qo3B7v5uxs0wZA0fZW6J9zqGy3IdsKd+NBLqxdQ=;
 b=XRAPFxTGAxcFilmZ4tS7LCavbGdgHIn8v6cs2gSmRqX2SBQySBIRLU65ww/+Fu+n0e
 U049RbYEpiHhZj3IoS/FqIxsaPjY13u6AY8Fjy8mshcYmItQtXTPDVsgUjW2JXKk1+rq
 O2gP5eIRDZNY3Q4TZ/nsP3WpDNaNct9Vl59/oz0CQMT78cQ42/OZd1NnoIk9VpPlnhmP
 aelcqFgfrgkptkRTnqaHMkQtxOkQ953PtaoSPD6dGEa4JssQt7w3mKEKrEl0kKcJEznv
 yY/SJjGU1u/qP8kcKnZtYkCJZcnDA84tIY98Ffa5TFqpIMLHgarXjM/8GrQfbdMJ9/s0
 TuhA==
X-Gm-Message-State: APjAAAXsIEvk66soG1ALvQwJXqvmL/pZr+u0En2CKUOJ2PDWkhqpm/5N
 VtlUIB5odyWnZTW8Q0aGtRQMMFe064FxC66PYafzBQ==
X-Google-Smtp-Source: APXvYqxyLS/9yBWFyxJu7nngbozjCnxStnGWdAIgQ8O7CZoqSKHHSFq255QaoTFU0a3hJMPv5SrYAZQF8EZ/aFXEwgA=
X-Received: by 2002:aca:c0c5:: with SMTP id q188mr3935454oif.169.1582244398771; 
 Thu, 20 Feb 2020 16:19:58 -0800 (PST)
MIME-Version: 1.0
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 20 Feb 2020 16:19:46 -0800
Message-ID: <CALAqxLW3PHtdFY20AStETme7sp-YLMLXBhqRyjOeLkQDSFOeVQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] msm/gpu/a6xx: use the DMA-API for GMU memory
 allocations
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 10:27 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> When CONFIG_INIT_ON_ALLOC_DEFAULT_ON the GMU memory allocator runs afoul of
> cache coherency issues because it is mapped as write-combine without clearing
> the cache after it was zeroed.
>
> Rather than duplicate the hacky workaround we use in the GEM allocator for the
> same reason it turns out that we don't need to have a bespoke memory allocator
> for the GMU anyway. It uses a flat, global address space and there are only
> two relatively minor allocations anyway. In short, this is essentially what the
> DMA API was created for so replace a bunch of memory management code with two
> calls to allocate and free DMA memory and we're fine.
>
> The only wrinkle is that the memory allocations need to be in a very specific
> location in the GMU virtual address space so in order to get the iova allocator
> to do the right thing we need to specify the dma-ranges property in the device
> tree for the GMU node. Since we've not yet converted the GMU bindings over to
> YAML two patches quickly turn into four but at the end of it we have at least
> one bindings file converted to YAML and 99 less lines of code to worry about.
>
> v2: Fix the example bindings for dma-ranges - the third item is the size
> Pass false to of_dma_configure so that it fails probe if the DMA region is not
> set up.

This set still works for me as well. Thanks so much!
Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
