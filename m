Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0341530D4E2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759756E9F4;
	Wed,  3 Feb 2021 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B056E0F0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 18:24:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id w4so2083264wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 10:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MgieW2mFRkLjVmzEdO+rCy5IuyzB9BYZea1yZZDisDU=;
 b=ThwOimmnlbRD7ClelZlSvTTMvrt4/HBr3aKX0vqL4pluYtd4RcmqyXdbjWm3rmmvfO
 XaDBvZZesrQSJj0dn68mkh+pkniH4hIco+w5W/cj0fyIu3v2ZKHgIQiwJ0UWRvpEDB+0
 4gDej/5zHg+ssFLGrlXUpoo8MD2YiPyjPXHRsUYDAJknZASEzx3DA6dAw05cbHWK/09m
 AmXlZbqcBmp9fLBzac3W3VL6rNZfAcUyp/FkgcwxvWR5tJ+DOkphAmx5i80lVINqt2e3
 WzXD5H5PIsTrl6s9CmK99hscu3ecC8QiG4oKiZdFWOqznB+xrTj9bvVPgAIYpI37oTGQ
 DpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MgieW2mFRkLjVmzEdO+rCy5IuyzB9BYZea1yZZDisDU=;
 b=nCf5b0B+QUsctIZdsGpKxCFZYQdBkRGIdVPyjDMCRBBnos35Fw5zqocTZl9DhUoUzO
 1WrFy7pfeliQ+2h2fBf6RcisOPqLO7mUyYNzU/7u4Vuzp1URQzmhozAyLgA7EiNaneME
 o506hetTlpD+bUSzrvk0LDDXFGPzOyuj9qRspfRfC5mZz4iU+7laIL7kzC6aNPQ7cfmg
 zmjzKWDxBfJG/IPJ132WP/a9y7CSm5zcNKr61wodzDlUx+rAKe0v1H2Nw5e7B59dQj1o
 p3hU7w+vDNnvuomK7CpJsrUQzxSTivnQ+q3xEv6e6/a0750pRGbwU1lqU6tlrZI7MGGF
 lhQw==
X-Gm-Message-State: AOAM530QHk6d2RrLbp7Y4t12S3pI5aRLOFRf+IVowB/j1fiR/OoQwGto
 dD+3Mijq/imEYBQwdjyDFHpWJAtmpelxztHGMtbOCQ==
X-Google-Smtp-Source: ABdhPJxyWbsmgA9sTq5DVu4oskgnl1milGSq73HSrJ4cKCCbs2f7IWzxeKS8co+5qhzF2K7w7UV8O69zhWPTCyWzYw8=
X-Received: by 2002:a05:600c:4e92:: with SMTP id
 f18mr4736926wmq.126.1612290243428; 
 Tue, 02 Feb 2021 10:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20210128083817.314315-1-surenb@google.com>
 <20210128091348.GA1962975@infradead.org>
 <CAJuCfpFUhJozS98WJpH0KQKBzyGXvqS1fitu-mgSyhaJ1xL8SQ@mail.gmail.com>
 <YBMAGRIwcbPF17cU@google.com>
 <CAJuCfpF78RYedBoAgkDdgMdfSmNwC2AQk-zZxAqkhCdtBB9gtQ@mail.gmail.com>
 <CAJuCfpH5nwvtMR+32G0-xa_hY-b_Hnw=Figqq9xcsTGgJhOiww@mail.gmail.com>
 <20210202070336.GA3535861@infradead.org>
 <CAJuCfpHWVcL1Cw=nm4THf0EzEan0jyVgLRNOdKr2ZbXex3DUcg@mail.gmail.com>
 <20210202085114.GA3562876@infradead.org>
In-Reply-To: <20210202085114.GA3562876@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Feb 2021 10:23:52 -0800
Message-ID: <CAJuCfpEfJEnzzr6dKZGTyVmQGZMmZBVTR+M4RsbZXjeGzFe8Gw@mail.gmail.com>
Subject: Re: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by
 linux vm
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Christian K??nig <christian.koenig@amd.com>,
 kernel-team <kernel-team@android.com>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Minchan Kim <minchan@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, ??rjan Eide <orjan.eide@arm.com>,
 labbott@redhat.com, Robin Murphy <robin.murphy@arm.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 2, 2021 at 12:51 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Feb 02, 2021 at 12:44:44AM -0800, Suren Baghdasaryan wrote:
> > On Mon, Feb 1, 2021 at 11:03 PM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > IMHO the
> > >
> > >         BUG_ON(vma->vm_flags & VM_PFNMAP);
> > >
> > > in vm_insert_page should just become a WARN_ON_ONCE with an error
> > > return, and then we just need to gradually fix up the callers that
> > > trigger it instead of coming up with workarounds like this.
> >
> > For the existing vm_insert_page users this should be fine since
> > BUG_ON() guarantees that none of them sets VM_PFNMAP.
>
> Even for them WARN_ON_ONCE plus an actual error return is a way
> better assert that is much developer friendly.

Agree.

>
> > However, for the
> > system_heap_mmap I have one concern. When vm_insert_page returns an
> > error due to VM_PFNMAP flag, the whole mmap operation should fail
> > (system_heap_mmap returning an error leading to dma_buf_mmap failure).
> > Could there be cases when a heap user (DRM driver for example) would
> > be expected to work with a heap which requires VM_PFNMAP and at the
> > same time with another heap which requires !VM_PFNMAP? IOW, this
> > introduces a dependency between the heap and its
> > user. The user would have to know expectations of the heap it uses and
> > can't work with another heap that has the opposite expectation. This
> > usecase is purely theoretical and maybe I should not worry about it
> > for now?
>
> If such a case ever arises we can look into it.

Sounds good. I'll prepare a new patch and will post it later today. Thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
