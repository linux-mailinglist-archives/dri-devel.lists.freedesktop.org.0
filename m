Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F216F673
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 05:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3A26E0E8;
	Wed, 26 Feb 2020 04:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110E96E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 04:29:18 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id p8so1723407oth.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 20:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gOC8DpWiH0j9iNghIrQNnZTh9j5bGMcjUGYt8SCdFTA=;
 b=HWH01uwOOOImzmS+M/Az1nOPRtxNoMHwRmXqWQCATSb81iTCoVNG8mzlwu9uAgXpUG
 I9ZSXzimx5y3xfnrk4k8HRmmzc420wkpXx9UloaKNjv94iUG6eO9MufOua5wB59cPNG6
 QkRHG4odHPitkMx2A23QdWYzWibMXOLE9GzBWrvsFWHJ84MyhYRUIPqEP2TJr3Lv7qLh
 x0wdXKkA0gXGZtZV5JgvpDfrm1R5V7gC4tJn9uvTJ5U+rxxw8uN6rxh33NvAZ77dcdLj
 DUXneQv2C4EKJpgIW805wiyvdd5kX58Ba7IZ0s71s0gaFw9TT/2X6a4tPqtlyUs9qlwF
 B3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gOC8DpWiH0j9iNghIrQNnZTh9j5bGMcjUGYt8SCdFTA=;
 b=AZ0/SOsx26pw0xrZ7uyTAl3qI1XrhRuMHe/zqc0m+Y3c5TimjlIXDDKCVwY2yZK7jZ
 VQqMro9ssVK7be6lEeabWGb9xuiLd9ldJiOnxx820yQWaiyexrJVIBq8CccWhEG4JfC3
 qad8JaTj0tdVGP0PSmduNyBaW3PeVOkgU6AuuemVWzN/nPWO9yJCJzY1h85kxKmABc0o
 DdfyRLs85IxlfucknE8JGr8Tjl59izA0xWaSUuU7JlaQxxZ7lotxGVnz+wJhb7t0kjH1
 xPnWAC4lBWvlE9Bz+Dz8sISc6Q33WJdcJtRfvXRbj+MAefAcyRFdmC29FElaEDYWMg4l
 pTpg==
X-Gm-Message-State: APjAAAU8/+Aw35xdqHkyC6E1kJ+Yhzc1kWT6wZji2XDwOIGDzCaL0tz/
 /sN7HDbC+/s2SP7U+fzcd7EsH/4jgzXsOQOXZmnJgA==
X-Google-Smtp-Source: APXvYqy1wy1oEzfz9uQI8ZP6nsZkzbMoKjDIkDSSocjkFUZXQfjBCHycp7ljNh6ZJS1Fj9r+cix0x4himyW0FknMDQ0=
X-Received: by 2002:a9d:5786:: with SMTP id q6mr1472845oth.164.1582691357103; 
 Tue, 25 Feb 2020 20:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20200203173311.6269a8be06a05e5a4aa08a93@linux-foundation.org>
 <20200226015504.7GW9ptoIA%akpm@linux-foundation.org>
In-Reply-To: <20200226015504.7GW9ptoIA%akpm@linux-foundation.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 26 Feb 2020 09:59:05 +0530
Message-ID: <CAO_48GFr9-aY4=kRqWB=UkEzPj5fQDip+G1tNZMsT0XoQpBC7Q@mail.gmail.com>
Subject: Re: + dma-buf-free-dmabuf-name-in-dma_buf_release.patch added to -mm
 tree
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: mm-commits@vger.kernel.org, Chenbo Feng <fengc@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Greg Hackmann <ghackmann@google.com>, xiyou.wangcong@gmail.com,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andrew,


On Wed, 26 Feb 2020 at 07:25, Andrew Morton <akpm@linux-foundation.org> wrote:
>
>
> The patch titled
>      Subject: dma-buf: free dmabuf->name in dma_buf_release()
> has been added to the -mm tree.  Its filename is
>      dma-buf-free-dmabuf-name-in-dma_buf_release.patch

Thanks for taking this patch via -mm during my absence (I'm just
returning from a bit of an illness). If there are other dma-buf
patches on your radar that you'd like to take via the mm tree, please
let me know and I can provide the necessary Acks.
Else I will take them in via drm-misc as usual.


>
> This patch should soon appear at
>     http://ozlabs.org/~akpm/mmots/broken-out/dma-buf-free-dmabuf-name-in-dma_buf_release.patch
> and later at
>     http://ozlabs.org/~akpm/mmotm/broken-out/dma-buf-free-dmabuf-name-in-dma_buf_release.patch
>
> Before you just go and hit "reply", please:
>    a) Consider who else should be cc'ed
>    b) Prefer to cc a suitable mailing list as well
>    c) Ideally: find the original patch on the mailing list and do a
>       reply-to-all to that, adding suitable additional cc's
>
> *** Remember to use Documentation/process/submit-checklist.rst when testing your code ***
>
> The -mm tree is included into linux-next and is updated
> there every 3-4 working days
>
> ------------------------------------------------------
> From: Cong Wang <xiyou.wangcong@gmail.com>
> Subject: dma-buf: free dmabuf->name in dma_buf_release()
>
> dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> it never gets freed.
>
> Free it in dma_buf_release().
>
> Link: http://lkml.kernel.org/r/20200225204446.11378-1-xiyou.wangcong@gmail.com
> Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
> Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
> Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> Acked-by: Chenbo Feng <fengc@google.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Greg Hackmann <ghackmann@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>
>  drivers/dma-buf/dma-buf.c |    1 +
>  1 file changed, 1 insertion(+)
>
> --- a/drivers/dma-buf/dma-buf.c~dma-buf-free-dmabuf-name-in-dma_buf_release
> +++ a/drivers/dma-buf/dma-buf.c
> @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode
>                 dma_resv_fini(dmabuf->resv);
>
>         module_put(dmabuf->owner);
> +       kfree(dmabuf->name);
>         kfree(dmabuf);
>         return 0;
>  }
> _
>
> Patches currently in -mm which might be from xiyou.wangcong@gmail.com are
>
> dma-buf-free-dmabuf-name-in-dma_buf_release.patch
>
Thanks and best regards,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
