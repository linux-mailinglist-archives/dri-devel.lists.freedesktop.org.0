Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5139244F17
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 22:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B466EC12;
	Fri, 14 Aug 2020 20:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC086EC12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 20:15:06 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id u63so9192258oie.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 13:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K1VjQolyfnnNVHHYuPIt8KNCctqJMTa9sGgTeUR70Ro=;
 b=DZ5myydxcvkGbm+IsJi3gh56/Bx0I9UaNCaJ/ja2SMZKO1klTplQvWE6mNbZhrGgv/
 UF99xSMV81q7h9YWU718ve0oCTci6YlEkeVIgBIl9rUO1DHkOKOkkBQFqnrtqVoFnicG
 4khUMVOXYg0QltxHVsuE+SOlJtDagL5LrMwEFeOG59n3JY92s+7oxtRSGfxB0VBeSIO+
 JwC4EnIwyEOh6Towkp8VMDKmTtvInhnauublH668LYzQWCOBwh0YFwelJM688XPUQFCX
 B5wqPD15o5+/D+tCHj5tTucdfC1n3qt2hRdNi79xBh/2bZTC3cBgEmROvyrkCxKk+NV9
 wxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K1VjQolyfnnNVHHYuPIt8KNCctqJMTa9sGgTeUR70Ro=;
 b=sSJKsL0CTnBgu8OlJH3oimMku4IS/vgS2uLKmrzn+rvzKNpTux8BHVzs/so26517Ms
 fedgIZNGWCqd/KFnIC2ME/KwfJfbbmUAMQ4pCYYtqAU6cjzjrstULxC+gdd2+0cWDzSu
 hNIsaFUlqybyHtf3Qy+xQt/sQV/zuqadPKINpBnfAixRLacqoqSL/k1PT4LHn/aAcX8v
 4+fHg8csZngnqNmNO4EDUvB08PSrR7e1DL8jKB0gAzTMvLzmkmO6V8XteFrQe20h2JYT
 fEOR0DAoBPb/YTIJD5XnW+5DRb+KEKCkcRPFOg0vzQlrEBdR+7GIWPUOZZaWRNNKF5Hs
 jikQ==
X-Gm-Message-State: AOAM530b6JgdeIV/sx9sJzvRCc+GqnEmVFdkOezRCIMRdy6N6dCsLlAt
 8oR3+I/flaXcAaU6GYChxu06pFGZD+b4C1ngpVgV4g==
X-Google-Smtp-Source: ABdhPJw4UOC9yfUWvWUG9o2FjojXvLZmJIXbbxjYgl69mSx9NHERCd5aVLqvrPbeoCFTLDdWCdN9atd5Igcy//QirKc=
X-Received: by 2002:aca:dc85:: with SMTP id t127mr2517949oig.169.1597436106306; 
 Fri, 14 Aug 2020 13:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200814062458.53049-1-john.stultz@linaro.org>
 <20200814062458.53049-2-john.stultz@linaro.org>
 <CAAEAJfDy7V9thc4-dfkwkiRAqqG=D1_qWTv7_gOkN9dcaM6mkw@mail.gmail.com>
In-Reply-To: <CAAEAJfDy7V9thc4-dfkwkiRAqqG=D1_qWTv7_gOkN9dcaM6mkw@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 14 Aug 2020 13:14:55 -0700
Message-ID: <CALAqxLUKkAubGMPYKZC6ufjaepkHw21Cit4h=nnOJGjYnO7GUA@mail.gmail.com>
Subject: Re: [RFC][PATCH v2 2/2] dma-heap: Add a system-uncached heap
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 9:15 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> Thanks for the patch.
>
> On Fri, 14 Aug 2020 at 03:25, John Stultz <john.stultz@linaro.org> wrote:
> >
> > This adds a heap that allocates non-contiguous buffers that are
> > marked as writecombined, so they are not cached by the CPU.
> >
>
> What's the rationale for exposing the memory
> attribute as a new heap, instead of just introducing flags?
>
> I guess this calls for some guidelines on what situations
> call for a separate heap, and when it's just a modifier flag.

YES! :) A big part of this patch is to start a discussion and feel out
what properties of heaps are generic enough to be flags, and what
aspects are unique enough to deserve having their own heap
implementation.

ION used the ION_FLAG_CACHED bit for this and considered it a generic
property (though by default all buffers were uncached). This seemed to
cause enough friction in reviews that we dropped it and used cachable
buffers for the initial DMA BUF heaps.

Further, I want to make sure we avoid the custom flag abuse that ION
saw, especially with vendor heaps. So I think having each unique
behavior being a separate heap is a reasonable stance.

That said, we added the (currently unused) heap-flags field to the
interface as there may be some attributes or modalities that are truly
generic across heaps. So if we want to add an UNCACHED flag instead,
I'm open to that.. however I want to make sure it has clear general
meaning so that its behavior is consistent across all heaps and
architectures (or produces an error if it's not supported).

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
