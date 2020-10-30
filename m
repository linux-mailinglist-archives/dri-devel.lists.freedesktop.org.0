Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0207B2A0E7D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 20:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFE46E1DE;
	Fri, 30 Oct 2020 19:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6A56E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 19:21:31 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id x203so7708869oia.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 12:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nB/MV5GLyjNu8UDfEZUP2zhFQAq8WaUlOhnxP+WLczo=;
 b=Db7ytI3QoTKyC/bdolNU5gUWVNc46g31IGOBQ+DmMtde88iG8cUlKjZYe/983DcDhn
 qWnPuTHZ07E448vG3lG+8TfAGGOQd/Jm+diYaoq9lWNhWlQTZDObhaVr11DeKQPSRu3W
 1IzJaZ+F4GaDe5nt4o+U+ipzq/tCk5aVUlkQ1hQ9GbzA75QiCnd1NtwKBpjDeP1LXYu7
 6zyALkTqMti7sDAEJd9kNDwzPsAHerX6lJAKeHIa/BiD8rOEEL+QaRtbibbexyRGctUK
 s5lYr7r+FNoH2J9GqIvX/vZjg6fd5Jqy+Z9MJKi30pPMjpI1mcCXIa4RAqk66i/gDyNa
 2WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nB/MV5GLyjNu8UDfEZUP2zhFQAq8WaUlOhnxP+WLczo=;
 b=I4o3CDHKTzlvlS116bALb+uURezn7WVlbRDl8NkP95QQf1rUWlFLWC3RjGr4p/CQ8K
 hI7KosOwxIr3qyPcp2ASbCWObAT5c/Z0TJ7p7f3A8ODaUStoOg5MqyjFDRBWSklbovtz
 mKv1nBLpX9ulnuFHpY4by04DFRpTIEJynsF9FDyTqzVypSxJwMt6jDH3xljhh3dC9FRw
 Fq2A8ZVdNOzzxEeETbndjyu8FUgAkmUcg9T3JA69AlzxwS19G/jdmiUqMi/hNwv+3FvZ
 g3UbIXYYGuz/aGz//iVm9b/Mtb9IeyCp1kHL+UtkKeIFE3iU8B98obE0tfpWYXdTNjPb
 FHLQ==
X-Gm-Message-State: AOAM5315JIBFQb8pHPkFjcippWUIjwhzVQyw1FN4mbtxOtN7bp/u0MUw
 faIOk1FJKhixyGhHlQ/n1QT9YMOKJXEqkX8KHsOR2g==
X-Google-Smtp-Source: ABdhPJyJXImIHpK83wwAip/CxzfDZ/jrYC8xy+ZEw+XNXk7wfku+ojOsZNj7E08ou2/Gb2qDLKqgTDw+df7YmNTNNJE=
X-Received: by 2002:a05:6808:578:: with SMTP id
 j24mr2827168oig.10.1604085690947; 
 Fri, 30 Oct 2020 12:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201030075023.3250-1-hdanton@sina.com>
In-Reply-To: <20201030075023.3250-1-hdanton@sina.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 30 Oct 2020 12:21:18 -0700
Message-ID: <CALAqxLXVMnnoRDt8=_qD=ipipC69u35fqDv+vmJ2JWnZtxCG7g@mail.gmail.com>
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

On Fri, Oct 30, 2020 at 12:51 AM Hillf Danton <hdanton@sina.com> wrote:
> On Thu, 29 Oct 2020 21:04:30 -0700 John Stultz wrote:
> >
> > But I'll try to share my thoughts:
> >
> > So the system heap allows for allocation of non-contiguous buffers
> > (currently allocated from page_alloc), which we keep track using
> > sglists.
> > Since the resulting dmabufs are shared between multiple devices, we
> > want to provide a *specific type of memory* (in this case
> > non-contiguous system memory), rather than what the underlying
> > dma_alloc_attr() allocates for a specific device.
>
> If the memory slice(just a page for simple case) from
> dma_alloc_attr(for device-A) does not work for device-B, nor can
> page_alloc do the job imho.

Right. That's why userland chooses which heap to allocate from, as
it's the only one that knows the path the buffer will take.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
