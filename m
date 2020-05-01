Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FAD1C1D52
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 20:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D9A6E973;
	Fri,  1 May 2020 18:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635736E973
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 18:42:40 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id e26so3314482otr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 11:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yq7Ibs47iQ7Lo5VGMp7gRZ6yUxyqVA2i9kts0jwiLrg=;
 b=Sqk3ZNvO90q24WbyfeYjeqHXxER0SZRc5xSI5RM5Nuv9B3ZrYEi33jQuT1hGlipWhW
 hvfe10Z7MjuWVqIgFIGCh1vX61lDdIWshuPxlhpxYvSGgIykaDH4wYq9CcG9PYvJCxnG
 Qod+n3wh9PZsgmkcNsHVm4KLG8FyyBIFO8o+o+M0pbZrNFM0eWtfAF6okflgipvcQ1k0
 ZpKOab+w3go1VnlFI2C/NWHJFgBePuy+8oTNmaHzdoaXKkj+5vcaptuIxg4ethg4nCCg
 oe12HiqThde5msD1xr4IG5FgmGjSqY+lbxjSPwdLZoqN9ONczywqxt+3yssPl4cyaexa
 9RFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yq7Ibs47iQ7Lo5VGMp7gRZ6yUxyqVA2i9kts0jwiLrg=;
 b=bAKSAcfN1zZowZ1HcuwoqmwUf6iOvvPecSpuLK/HofrOM1qyVBOFLuyeoeBY9lQaZa
 6rqAdbr5EDOPMugN6wjVMX4J8SP5DQutoXwEB8UGrnHGoSxGQNlbBgzcNJNwYKXLNmnd
 TtelGdC+k1B1N6F0w53W8oeQQdtlQo295NNVH9zranhtYrzZ5Zw2IPsg9UNQkoAPIbpm
 zUfZcXoHIoIMzPVQcc6jjOjTMo7lIsJrtbDs2jWDpHls5lhg+hgJyQWy568/oftCg5G+
 s1ntcUFGrMk3iYwFW01DmGo8wteEDNaIj2oW75abXk0iUUSkPDbcpbI550LDAjbhODaT
 bGSg==
X-Gm-Message-State: AGi0Pub3yYYUghTbncc/6BvELKEOuNDO/2urmskcd8u2IQrgglZOky2h
 bv4p+Z6YEGp3JtQcoxhNlFu/Np0aDUT7z8Fh+pXL4w==
X-Google-Smtp-Source: APiQypL+VkyGnMilOhi+kaL79AKLY56zEToU7HIKl+3eFaVpJsUVoYecvtEHrqDQsSqZiNr1DTrBBFivrPw2tyNZtok=
X-Received: by 2002:a05:6830:1589:: with SMTP id
 i9mr4948265otr.102.1588358559590; 
 Fri, 01 May 2020 11:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-3-john.stultz@linaro.org>
 <20200501104810.v6oa2yhawr4iki67@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20200501104810.v6oa2yhawr4iki67@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 1 May 2020 11:42:28 -0700
Message-ID: <CALAqxLVt0HJH5_2BvO7fRGZ_Vp9kKzj+j2=BZu_cbw=75dNoYQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/4] mm: cma: Add dma_heap flag to cma structure
To: Brian Starkey <brian.starkey@arm.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, nd <nd@arm.com>,
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, linux-mm <linux-mm@kvack.org>,
 Rob Herring <robh+dt@kernel.org>, Christoph Hellwig <hch@lst.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 1, 2020 at 3:48 AM Brian Starkey <brian.starkey@arm.com> wrote:
> On Fri, May 01, 2020 at 07:39:47AM +0000, John Stultz wrote:
> > +bool cma_dma_heap_enabled(struct cma *cma)
> > +{
> > +     return !!cma->dma_heap;
>
> Stylistic thing, but I don't think the !! is really necessary. It's
> already a bool anyway.

Yea, I was using a bit field earlier and then moved to a bool for
simplicity and left this. I saw it as soon as I sent the patch, so
it's already fixed up.

> > @@ -157,6 +167,7 @@ static int __init cma_init_reserved_areas(void)
> >  }
> >  core_initcall(cma_init_reserved_areas);
> >
> > +
>
> nit: spurious newline

Yep. Same. The things you only see once the mail is sent. :)

Thanks so much for the review though!
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
