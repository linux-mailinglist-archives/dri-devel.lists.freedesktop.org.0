Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC502DD972
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 20:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4164898A4;
	Thu, 17 Dec 2020 19:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A072A898A4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 19:40:49 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id o19so35000373lfo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 11:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q8co+g7fqtv1R652W4I2zAoCxF1rMu+SazXF7/blE/U=;
 b=lzm25lfu8A9lVmaAyBbIOBWJ8Tvv7cGOCF5jF3olsIEHnfbSvmLawXeSOIjV7tAt3A
 PaDGhDOA8egVr6Opm3LeXG8IGLh/yvvdOZ7OczqcqqgsTQf7V2RWmkIANJlEo05uHiSh
 o/35BNZtoaSRjejmRFxV/1997Uq3BIzVefTK35yMwUkRjOdvEby1rZ6csXwIo9L9LgAS
 8NiwImIyVHoHicSrvPN9GSfKcPzXQ0t++eBLRRvaRrpnmG73ryORqUEckMRC8n6WF4mi
 sh8hh8BZ+LK9dX0PDiNQ/Vrhneba1Pd3AbfqusoTLjIB3zWRgblXZxaQudfExqYnI2gT
 NLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q8co+g7fqtv1R652W4I2zAoCxF1rMu+SazXF7/blE/U=;
 b=XX34j+e24GYzPInsAzqTcEO26aIFfv6vUyfxH5ADc9RjACswiGLZzCyySQIwcSQPxP
 Vt1Ae6jSDbickDL/04c1IbURThydAkakagPihabYvw+gnDqM7uI31gG5cvtltEYzfrQq
 U6qpcVCCaas4UwM8lU1cfdcJ/3bimELH8iDGyKRAipjCJn158i4nQHg2HpqOjFo48pih
 om64DBilfyfXXOiz0pd3So/kFitMBaTmFkSblixqJ9ffWP9Qt4sq6kYRrN1JHtLxWUXv
 E2Jv8G5gx2GlfZYvQJd1RzlRCWO6vJoDRfqCwJo9M4+WS2wQvAw8FeA26NYHfl5V0dSh
 ae6w==
X-Gm-Message-State: AOAM530QU7iqpuEoWUTpx8Ka7d9GF6G+4eMMBfgHksgAvqQg2crdTaC+
 PjKzi36gI5IKqjfT0kIpUPQ6f6BR680yepXbSzjBlw==
X-Google-Smtp-Source: ABdhPJyoxlYF6cA7yW0ADQXLLbDXp4SbBvfrxe+y5InSW7WfeoagGLAqOVcdA6uvNnjcrreaKO7zIKYkZ32rMSlVSlI=
X-Received: by 2002:a2e:3506:: with SMTP id z6mr391593ljz.257.1608234048140;
 Thu, 17 Dec 2020 11:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20201217123053.2166511-1-siyanteng01@gmail.com>
In-Reply-To: <20201217123053.2166511-1-siyanteng01@gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 17 Dec 2020 11:40:37 -0800
Message-ID: <CALAqxLW_zQZi=x9PXb9Uf+gPntm=5Q8vDWa_Gs+TjHbyqu_dZQ@mail.gmail.com>
Subject: Re: [PATCH] cma_heap: fix implicit function declaration
To: siyanteng01@gmail.com
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
Cc: lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Laura Abbott <labbott@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 4:31 AM <siyanteng01@gmail.com> wrote:
>
> From: siyanteng <siyanteng01@gmail.com>
>
> When building cma_heap the following error shows up:
>
> drivers/dma-buf/heaps/cma_heap.c:195:10: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
> 195 |  vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
>     |          ^~~~
>     |          kmap
>
> Use this include: linux-next/include/linux/vmalloc.h
>
> Signed-off-by: siyanteng <siyanteng01@gmail.com>

Thanks for submitting this! My apologies for the trouble!

We already have a similar patch queued here:
  https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-next-fixes&id=8075c3005e4b1efa12dbbf6e84bc412a713de92c
so hopefully that will land upstream soon.

thanks again!
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
