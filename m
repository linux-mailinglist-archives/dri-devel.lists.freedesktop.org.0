Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901F63AB14F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 12:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777096E8E1;
	Thu, 17 Jun 2021 10:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B546E8DF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 10:27:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a11so6131867wrt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IoCdCQA/sG+KZXRepcOx6S+KhE+IeuK/vxgWR5/H2BY=;
 b=ZjQC+7Gp0Qif9NWg6mDPWVJjDwxstLhj+2dlx2u6yrxmcpikxMDzkY/aWqbaE+maRf
 YgOnSA9KJpTADHOCEWUAUcWUZMTua/J8TzXqVx1TCO4h2V+ArufeC1U3GedaJi5z2erw
 kNtF3OaK+RpVGEUKYTIHqgwUyE+uAH/Yacl/L3dzTtRaI/rjSycDT4htctAooaQkzI7G
 QeyMjKjzj28g0ZmQMhA1RiOJMgBEp5aXWLPFrHWsZm1AaYpJxONKuWkW/daEbwA9Fe8X
 NgPYzWoHtWNpYv/nOI07Z9KCe4lWyNPgR+fkAq28otLS+nRISDzns5nlTHf+biZPMIJt
 IuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IoCdCQA/sG+KZXRepcOx6S+KhE+IeuK/vxgWR5/H2BY=;
 b=O7amCzZXrxw2m6Wp6hYwoLPC+pOLhitEUXh0CGQrWfgVuanZU7WDW4SVuolntkVHX2
 r+gPA9yywj5Y5K9cfrt8+ynS4AV/M1cKP1LIH7To8UVNbre+UjmQs2VVNTwUff9YmdPg
 Mr7m9/qg8WEe7s/CGWeBfNdLIRH/XrqU345LgGvjEarcTKuQ/yGjE0FN7p1MKXSY+lA6
 4q/w5UF2cA4gTsJCFsngqpDF/JGZOxThfgIya5ZhMGfxfjN+IVtfCtJ1aih1xXrAp14r
 3+lOU8nGrR2F81dZOjYiWJYVxFSFsGAarmqNT4X+2Iv2X/h6MozRdOCs59AtSiNPOI6w
 haFw==
X-Gm-Message-State: AOAM531pkvjb8+sWeTG0irvTqdrn1deGdgWpiLnhEUb5Lll2OSOcBu7p
 3HxyBlRzBdrhgAI4Zk7zsJnVlKeu5wGIkB0mNegmTA==
X-Google-Smtp-Source: ABdhPJx4Y9FsHzNwsX9+3dF5zyu+oQjAl0LCk8yq9yMvtJFRVkSuVVfrGpi93z3rNT37fH1DkP0P33aC7lI5fFYGRiQ=
X-Received: by 2002:a5d:65cc:: with SMTP id e12mr4718452wrw.354.1623925636197; 
 Thu, 17 Jun 2021 03:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <e4374e18-2c81-a743-e387-f2512910314d@i2se.com>
 <6e658588097ef8d864a7347b93a0d2b5d75c18b9.camel@kernel.org>
In-Reply-To: <6e658588097ef8d864a7347b93a0d2b5d75c18b9.camel@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 17 Jun 2021 11:27:04 +0100
Message-ID: <CAPj87rMRDG-xDfN13Jg=DsCVTCAtRqQRNheTuR=AsfESp5e5Og@mail.gmail.com>
Subject: Re: vc4_bo_create: Failed to allocate from CMA
To: nicolas saenz julienne <nsaenz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Maxime Ripard <maxime@cerno.tech>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Jun 2021 at 10:36, nicolas saenz julienne <nsaenz@kernel.org> wrote:
> Frankly I don't know if there is a better way. IIRC opensuse and downstream use
> DT overlays to cater for this limitation. It seems reasonable to bump the
> value. But it'll be in detriment of users that don't care much for graphical
> interfaces. Nonetheless, I'm not familiar with how DRM handles CMA/DMA memory.
> So let me have a look at it. Maybe there is a SW fix. At first glance I'm
> surprised they can't defer to normal page allocations when CMA isn't capable of
> honoring the request (like the dma code does).

DMA transfers can be split into multiple transactions at the cost of
being a bit slower. But there isn't a fallback for graphics buffers;
you can't display a quarter of a screen at a time. If the hardware did
support buffers being backed by multiple discontiguous pages, then it
wouldn't need CMA in the first place ...

Cheers,
Daniel
