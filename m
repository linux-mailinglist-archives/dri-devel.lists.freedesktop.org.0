Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5822EF86D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 20:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D775D6E8BD;
	Fri,  8 Jan 2021 19:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508706E8BD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 19:55:47 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m12so25726443lfo.7
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 11:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJMq4objzVNcUblV8NE/DuldZCBKwJF/PtAQRpfJPNc=;
 b=vrBhrVXkMEbApDOfPouVo3hQgeMClLDDFTrQJuG42kKnLbo4UQvyEmnpXNVNMFotwC
 ndG6SVmWvpz1z2eiJmqH68y4K1/FZGQAdrZbDWLyWd47B7Oc0ty8OKSFmNiWl31EHMoD
 xAOfpJ1UbzfW2NnPJ0565Fqxjf8CLMH1bbI9QMDi54+CvunHBzvshWLRUPiRW+mMcy7+
 PwKs2pMhwxRvQSj4xkPHasXVtQnWrOQnhYal5iGmFa83CxIvJ2pmCtU1Mo0hbNQTgtJ2
 MBJc8C/3f609xACEZU8d0oVj0cxZHV77L1zBK/2XC6zJkoYOHa8YOdvH3JWni4Z8Dn07
 dtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJMq4objzVNcUblV8NE/DuldZCBKwJF/PtAQRpfJPNc=;
 b=ckNlebF/Kv+rhGErQc3QT5ySFAhlCX7oagAke6Bl5i623K+WTwaq0DD28FViXhiLo4
 99gBcAT46Tw09UWLJJFRO2k0ojjgoArpwlvlelKtdYqcVdU6/uSH5aW2IOEAHnUYscJQ
 /vMSAqRH6PlJWfbZh6CwmiLBlRu7H9lYHnXEJiBGJ9Awf4toNMGwD7fCkp2T9oEABJtp
 woRQzbuwybnmI6Lmi9z8HKDBOqs++c1JWrBEedl3OfVh9jljxBqHvDje7645yalhCjvZ
 2kVrw0TX+kBZd9BUCin10JGaIWtl6J8YDSIpNlMmdiqXk1lwOdzEEQM7qA6u0LTenrgF
 DZcQ==
X-Gm-Message-State: AOAM531u9MN9FpcMfTArBuZg9iLBP201xt7RFCPoNeVfjpJZowXZyZNn
 G0PcKyrMpGE3w1pysxuhzTKnWVUXM9DKGpRtkeujJsQYcOk=
X-Google-Smtp-Source: ABdhPJxTt/pq9Ctby6LYdcBcM6+wiAiQOmcWinms2iB1gVmjDc1A/yv94xhmvmRI7G2lqD56lARAFOaf9ejrNHPsLnM=
X-Received: by 2002:ac2:50cc:: with SMTP id h12mr2121481lfm.508.1610135745778; 
 Fri, 08 Jan 2021 11:55:45 -0800 (PST)
MIME-Version: 1.0
References: <1609962554-13872-1-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1609962554-13872-1-git-send-email-veeras@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 8 Jan 2021 11:55:34 -0800
Message-ID: <CALAqxLVyCuQmEKYh+TBo7k5igP8piz8mAsFt4cChF9q=qmh8XQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] dma-fence: allow signaling drivers to set
 fence timestamp
To: Veera Sundaram Sankaran <veeras@codeaurora.org>
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
Cc: David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, pdhaval@codeaurora.org,
 abhinavk@codeaurora.org, Sean Paul <sean@poorly.run>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 7, 2021 at 12:53 AM Veera Sundaram Sankaran
<veeras@codeaurora.org> wrote:
>
> Some drivers have hardware capability to get the precise timestamp of
> certain events based on which the fences are triggered. This allows it to
> set accurate timestamp factoring out any software and IRQ latencies. Add
> a timestamp variant of fence signal function, dma_fence_signal_timestamp
> to allow drivers to update the precise timestamp for fences.
>

So, on quick review, this seems mostly sane. Though, it might be good
to add some more detail about how the hardware timestamping fits into
the kernel's CLOCK_MONOTONIC time domain.

I just want to make sure this interface isn't abused to jam raw
hardware-domain timestamps into the fence->timestamp, causing the
meaning or time-domain of the fence->timestamp to be unclear or
inconsistent.

It may be useful to add an additional patch to the documentation
around the dma_fence structure to make the timestamp field semantics
more explicit and avoid confusion?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
