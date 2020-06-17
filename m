Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ADE1FEC3A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8626EB09;
	Thu, 18 Jun 2020 07:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8C06E95A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:29:42 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id y9so1211418qvs.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 08:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v5BdIMSU0SgDrZuQSRW4xvIrY4rZ7WnbUK5J5TOXFb0=;
 b=X4atcg3QCitKJdCOr5ja2tE2bUBLSFF91J0CzDtXnsV5WejCzsk2eajJzTjXjsFLTA
 5s+gkYE18Kz4f7uWFKMYMARjm17DhKgqFhDle7hMjPDQJSHTF3vHPDJzf/g8gfXm1XCc
 xS0VLL2kkFYRGpHsv6IKsvfpDgxixqoGb1C7eZAdpsByKmZrD/PLYevp7FEa9NQdLxHk
 yZFftabPuFhyEj1G7fMasvfilN4m93P/kXM+Vvvx/r/xyhIpvBM0x0Ha3wX71m2O7A/a
 L0H0SGP2pZKrl4si0m+rtOCOCb+j5CVmE5xryjAmjELn7Uqp0ivvBvKuiMRBNAyyx2kG
 itRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v5BdIMSU0SgDrZuQSRW4xvIrY4rZ7WnbUK5J5TOXFb0=;
 b=aZqhyftdM4s/sHkYHE8pq8CcWVe9TIu6tshoW3z6InAGX+n9oPQ3CI+Uliet3vCs1H
 cAVsWYXi5uYSxoUWwkIkjMurFfS+ImAB63tgXD6clkpilEBxlko77cwNgKNDLEQw1Em3
 XE4y+5Pus7fgjQ6uPx/3zIUgiViJnp0q+UcabcroEzwgwv4zDj/7OISAgsvp7AndY+h8
 3v03U+LP/WToFdk90mwOXdaxz3RtPnrMp7e9TScd5OG8hhKyzsUCGOey5DetFkcT2x67
 ICdJpPXwn3SEc7lKBqIntgyFdCpA3euZG/1cxOzmsztUYhTs0Al8hNcT5M4QW6yKT60t
 J6oA==
X-Gm-Message-State: AOAM530JC1rmE918+ycSpc7lXjAwoof0L5f0oiBIulKtzK2abZDX02RX
 6LTXeiS33rXzUbXAvYvSvG+jVQ==
X-Google-Smtp-Source: ABdhPJyWaY8mWagCAPiiX7EhWCqcjbxUamRd5/mDpg63tRR7xxsYdOaA9ycSUwn3S5FVu3UfHzBj0g==
X-Received: by 2002:a0c:f388:: with SMTP id i8mr8163963qvk.224.1592407781973; 
 Wed, 17 Jun 2020 08:29:41 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id y13sm204954qto.23.2020.06.17.08.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 08:29:41 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jla0S-009d9h-Uc; Wed, 17 Jun 2020 12:29:40 -0300
Date: Wed, 17 Jun 2020 12:29:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200617152940.GG6578@ziepe.ca>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local>
 <20200611141515.GW6578@ziepe.ca>
 <20200616120719.GL20149@phenom.ffwll.local>
 <20200616145312.GC6578@ziepe.ca>
 <CAKMK7uER6ax1zr14xYLKqDfDZp+ycBsY9Yx7JaVkKQ849VfSPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uER6ax1zr14xYLKqDfDZp+ycBsY9Yx7JaVkKQ849VfSPg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 09:57:54AM +0200, Daniel Vetter wrote:

> > At the very least I think there should be some big warning that
> > dma_fence in notifiers should be avoided.
> 
> Yeah I'm working on documentation, and also the notifiers here
> hopefully make it clear it's massive pain. I think we could even make
> a hard rule that dma_fence in mmu notifier outside of drivers/gpu is a
> bug/misfeature.

Yep!
 
> Might be a good idea to add a MAINTAINERS entry with a K: regex
> pattern, so that you can catch such modifiers. We do already have such
> a pattern for dma-fence, to catch abuse. So if you want I could type
> up a documentation patch for this, get your and others acks and the
> dri-devel folks would enforce that the dma_fence_wait madness doesn't
> leak beyond drivers/gpu

It seems like the best thing
 
> Oded has agreed to remove the dma-fence usage, since they really don't
> need it (and all the baggage that comes with it), plain old completion
> is enough for their use. This use is also why I added the regex to
> MAINTAINERS, so that in the future we can catch people who try to use
> dma_fence because it looks cute and useful, and are completely
> oblivious to all the pain and headaches involved.

This is good!

Thanks,
Jason 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
