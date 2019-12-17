Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53212332F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 18:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316296E1B3;
	Tue, 17 Dec 2019 17:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0374C6E1B3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 17:08:25 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id p67so1162592oib.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 09:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MX5ryTLyNj1gEJN4sAxITw/PDa3L7q0z0atwMq1Sllw=;
 b=stQ7HrR8NLUsEd/uKcjLTm8K2InQYMIR3k0x+rFPgURFB5KG0yx3arx4y53sIfEArF
 2sW/VixVADH95/PrHcDkWXFVxsxOm1TlwOsRAvpt9JB+6Ksj8iGT/tOhpqyRvBkaYAUY
 2y+TMFjlTYh2vIh8gkkzzsV2PkH3GHk4/YnI0pEKe4uAO2reLYCxjxfPwVqineaigDgA
 PduA30a6IOlQ7RpPm1BvTwcDJTuDHH/xdiRSvKo1KIOo9rWbdqW8lh6D+hTedNl4z0EU
 wJM7b5eSXJRTD8qRAvE8vZFzOiSDUzQ8wMbJFmYzyzNWKozoRIuT2KtNsz0cH2SjVvb+
 I3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MX5ryTLyNj1gEJN4sAxITw/PDa3L7q0z0atwMq1Sllw=;
 b=hIu4qIdIJrZ6FG+J8HAdkjbG+lcWEJKGWQemx+LUEWs8qD9KK6pgUpXqFGbJrdfUQw
 B3Dl9zkFykgiOY3Ju8wLWF4JEIn90os9Rg+KqKvAMXeF/HFwhZpGPooBkCZyou+xo1B/
 oNt/heueRylwhTCLmtYk5QqFZ/F3c942C+22qFq0+70Swet1f+kmZ4mMSS988YiKYnJ/
 97SVAruWxnAVi2ckWWaOQKtvAB90exl4etqUg8jVpJsNalJoQXil9vV+EyPThjD8L4g2
 fSkCnv1DZxLLZukG5gR4IuuH6RrJ151PQS6VEELLBhAcW+SmizGIkIky5S2UNfnnaQzx
 ttGQ==
X-Gm-Message-State: APjAAAVsAm3IRfwJzOEYYXFFWO9CWLppz4b88VITTJnEc3PDUibpVmrE
 8EFsrB5wC1rqUtH1KfJ3dDTglx70dmvmV6Mfs4tPxA==
X-Google-Smtp-Source: APXvYqxLG7bWE9YdSVjIU8t3m/nXCwJvl2pBOamYDowsUPR2xloYjm0CkOITzBgkXp6Y+XU6F55krB3cB8r5tqx42h4=
X-Received: by 2002:aca:5fc6:: with SMTP id t189mr2244612oib.166.1576602505161; 
 Tue, 17 Dec 2019 09:08:25 -0800 (PST)
MIME-Version: 1.0
References: <c1244a5f-b82a-baee-262a-7241531036ad@ti.com>
 <1576503511-27500-1-git-send-email-zhongjiang@huawei.com>
 <CALAqxLWAWc6NZDnixWhmHg6BtGHXTy6pZ6GXM0F=SkoYH8DiQw@mail.gmail.com>
 <5DF83CEC.5060002@huawei.com>
In-Reply-To: <5DF83CEC.5060002@huawei.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 17 Dec 2019 22:38:11 +0530
Message-ID: <CAO_48GFzdM9ZsNYTRc1JVQxUQ77TtVCYdUcCGQzkJDf-Ob=L-Q@mail.gmail.com>
Subject: Re: [PATCH v2] dma-heap: Make the symbol 'dma_heap_ioctl_cmds' static
To: zhong jiang <zhongjiang@huawei.com>
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
Cc: lkml <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 "Andrew F. Davis" <afd@ti.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Zhong Jiang,

On Tue, 17 Dec 2019 at 07:56, zhong jiang <zhongjiang@huawei.com> wrote:
>
> On 2019/12/17 5:13, John Stultz wrote:
> > On Mon, Dec 16, 2019 at 5:43 AM zhong jiang <zhongjiang@huawei.com> wrote:
> >> Fix the following sparse warning.
Thanks for the patch; could I request you to please use
scripts/get_maintainer.pl to get the cc: list for the patches?

+ dri-devel.
> >>
> >> drivers/dma-buf/dma-heap.c:109:14: warning: symbol 'dma_heap_ioctl_cmds' was not declared. Should it be static?
> >>
> >> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
> >> ---
> >>  drivers/dma-buf/dma-heap.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> >> index 4f04d10..da2090e 100644
> >> --- a/drivers/dma-buf/dma-heap.c
> >> +++ b/drivers/dma-buf/dma-heap.c
> >> @@ -106,7 +106,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
> >>         return 0;
> >>  }
> >>
> >> -unsigned int dma_heap_ioctl_cmds[] = {
> >> +static unsigned int dma_heap_ioctl_cmds[] = {
> >>         DMA_HEAP_IOC_ALLOC,
> >>  };
> > Acked-by: John Stultz <john.stultz@linaro.org>
> >
> > This patch will collide with Andrew's _IOCTL_ naming change, but its a
> > fairly simple thing to resolve.
> >
> > Sumit: If you're comfortable resolving the collision, please queue
> > with the rest of the recent changes for drm-misc-next.
> > Otherwise, I'm happy to submit the resolution I tested with here
> > afterwards. Let me know.
Of course, I am sure I can handle collisions, John, or else being a
maintainer might get a tad difficult :)
> As it is an fairly simple patch, I hope you can resolve the issue directly.
>
> Thanks,
> zhong jiang
> > thanks
> > -john
> >
Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
