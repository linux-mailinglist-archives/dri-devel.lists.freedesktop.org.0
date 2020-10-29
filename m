Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E029F7F6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 23:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD9C6E918;
	Thu, 29 Oct 2020 22:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0EC6E918
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 22:28:47 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id s21so4756844oij.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 15:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pORN0SH7QqUY2pgx+SZRHw+Mnitatq+9tw1I93zAlH4=;
 b=wh9YQtv6zPoV31qgT+D3UcESNbQz/2y1481tB+ajPENkhIBeDrlQi+hzlb3S90JtxZ
 4dlKOB321wDEyTTtW8E6nLVswj8tk8US8rxyQ1Dta+FQqkadP2fp4Y0XWauBkkl7FNVl
 XmNr1W1V5C5Ix8byi+0EOeuvdvA35WLmDjMSk5je59wRPdfQ8WTqafaD6bg1sk/puJ9B
 sAbm+hf9d8wYImZquo0ieS/2pLQ4yLME3Vt3THAhclLSgMt9Ypk+57UAPsrM6rzBUe6o
 mCB9Yq+i+9gtx6VpNDuQxGuOX8prdAtGQcwwT0y6Bopesy2rf4bgI72vVtjQZxm7GfG5
 ReTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pORN0SH7QqUY2pgx+SZRHw+Mnitatq+9tw1I93zAlH4=;
 b=BsJrEkRRsjzIU4aMF6bsNncc6GphjmPACYfhejCAkpetEkk5n6qCk2CLhrDpxyux6p
 8lF79OvwIY+mG4VWQAnjH+t0Vmsv0V7viqVJ7gA734CBlSOjhxvUhtko4MWPLzXMul4h
 L1kbYAQ85OIUSkXcSgOFB+QD270Ha21IZDKnQsPGmu0sjhiZK89uNV/LlMWqgaQWtRGw
 SjvL5APOuTdpBGooUHV0QgyD97PKG2S3Fb6nQ1JNcBWtPzlnOIK0Nee7uskboP8/aN/4
 t8k7bxSQiVVnrmQE8czACbXVkCtMCwFPfhx/b/Kxh/99TpWCq1q9F2GQbdln2zlij7hx
 MKAg==
X-Gm-Message-State: AOAM5338aT8hoY+DdG/oWTIJcg3bIQNtn6sGvf4oRwdQuriyqGLRpY3r
 ulFHy8NdqYVSBOszyQQo47l9WwIuD4RSeOJl2Isf4g==
X-Google-Smtp-Source: ABdhPJzsdV1oz4gvSBDqVBieGnuJjbIML/oDST4HPTwI72RnBseK/ArAlpSmIcJVKJ5xxatPFTwiTSkDIwrFG/oucIA=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr983142oia.169.1604010526631;
 Thu, 29 Oct 2020 15:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201029001624.17513-1-john.stultz@linaro.org>
 <20201029001624.17513-8-john.stultz@linaro.org>
 <20201029071037.2913-1-hdanton@sina.com>
In-Reply-To: <20201029071037.2913-1-hdanton@sina.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 29 Oct 2020 15:28:34 -0700
Message-ID: <CALAqxLWUhugbjOGMnSciUN+nSR48u+ph07BRp7US7w+ix6fT+A@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To: Hillf Danton <hdanton@sina.com>
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
Cc: James Jones <jajones@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Liam Mark <lmark@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 12:10 AM Hillf Danton <hdanton@sina.com> wrote:
> On Thu, 29 Oct 2020 00:16:24 +0000 John Stultz wrote:
> > @@ -194,6 +210,9 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> >       struct sg_page_iter piter;
> >       int ret;
> >
> > +     if (buffer->uncached)
> > +             vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> > +
>
> Wonder why you turn back to dma_mmap_wc() and friends?

Sorry, can you expand on what you are proposing here instead?  I'm not
sure I see how dma_alloc/mmap/*_wc() quite fits here.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
