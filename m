Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565011C1D4F
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 20:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289686ED34;
	Fri,  1 May 2020 18:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC746ED2E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 18:40:28 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id b13so3297904oti.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 11:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K/pyc9ZSgvlCPxWaLAF7Dj+DR/uYkULUKmz0lI2apjM=;
 b=i4V/eLGRRDB/t5gS34y6x6FmiullhpKMPXQe+E4ih2swc8cRlFluseSUU+ZBlGBsVx
 61I7Slgf9kEu2+57x9aRxp2pbshiXeln7PzqLgZ8StlqgrETFcszmRQc2uLXVEMteQ6K
 WsYkV5FgsGL/gaiLMtLVGEpi+XxrbCiGTar5uBAafBCi4QpOfA9Ni7juUOMrqIhbSw7o
 dZS3eNr/bYB9rwBwJ2jIOGXujjaVcW3kUbQSmah72Fi3rxxcPKtEKdeb09cydPN0RUkH
 fI/cGT05sjeH8Cg+EjNafozZoyY1nh057jxvYMba1UKDryTI5OjZu/ptlgnjY6feBp+0
 805A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K/pyc9ZSgvlCPxWaLAF7Dj+DR/uYkULUKmz0lI2apjM=;
 b=sYkcC7S/BTGThQynsUY0zO5FzZOnCnZB5/581ELAZ/IgyWr4QOniGUUTGFOfMU2Tzi
 VVO+TKYGQ4rCsTkb923l7RXzCKfa51byeAGu7XebUCXqd67kJnFjsON/vKbsuuYMCUPF
 kSOr+u67GDaRJoR+JpkLTDfu+9yJNuCZbEn6K/w3UVIZXpx8xQtre6/XOSC/7sX+npk5
 ZxEXHrqXSNQrkUsiJtwQCh+a1/RZq4fejPxMC5MVppFfVHd5NDhmBfYot7BCon4Xk9CU
 DOs0mSRxpsQh7v923vK2lyuZClCLrqtEfrsv7YChQpSBzWs30iC0qDJ3DznxaAIRTFAu
 yHHg==
X-Gm-Message-State: AGi0Pua2CAGN1/fXeETVFd5VUeIToMk0WIzltOh54Hr/uFL7hEn2RnmX
 l5x4+LoAy6dHihRNm2I1lYyWWpAcOFo2/d9k7qXP8g==
X-Google-Smtp-Source: APiQypL4ruHab7XImHLBHWXSGsuiDyI+02igUD+AFcOYMG/0olXknNi2MzN7TA4/gZzBZl34o0E6oBDOCG/6nNaBtVo=
X-Received: by 2002:a05:6830:1589:: with SMTP id
 i9mr4941206otr.102.1588358427674; 
 Fri, 01 May 2020 11:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-2-john.stultz@linaro.org>
 <20200501104216.4f226c2a7bzval5o@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20200501104216.4f226c2a7bzval5o@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 1 May 2020 11:40:16 -0700
Message-ID: <CALAqxLVScV1j-zxw=cwpE0+eDoaubchXx6SJgu=1Zvh8HnE-Tg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/4] devicetree: bindings: Add linux, cma-heap tag for
 reserved memory
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

On Fri, May 1, 2020 at 3:42 AM Brian Starkey <brian.starkey@arm.com> wrote:
>
> Hi,
>
> On Fri, May 01, 2020 at 07:39:46AM +0000, John Stultz wrote:
> > This patch adds a linux,cma-heap property for CMA reserved memory
> > regions, which will be used to allow the region to be exposed via
> > the DMA-BUF Heaps interface
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Andrew F. Davis" <afd@ti.com>
> > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > Cc: Liam Mark <lmark@codeaurora.org>
> > Cc: Pratik Patel <pratikp@codeaurora.org>
> > Cc: Laura Abbott <labbott@redhat.com>
> > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > Cc: Chenbo Feng <fengc@google.com>
> > Cc: Alistair Strachan <astrachan@google.com>
> > Cc: Sandeep Patil <sspatil@google.com>
> > Cc: Hridya Valsaraju <hridya@google.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-mm@kvack.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  .../devicetree/bindings/reserved-memory/reserved-memory.txt    | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > index bac4afa3b197..e97b6a4c3bc0 100644
> > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > @@ -68,6 +68,9 @@ Linux implementation note:
> >  - If a "linux,cma-default" property is present, then Linux will use the
> >    region for the default pool of the contiguous memory allocator.
> >
> > +- If a "linux,cma-heap" property is present, then Linux will expose the
> > +  the CMA region via the DMA-BUF Heaps interface.
> > +
>
> Would it be useful or even possible to give some indication of what
> the heap will end up being called? I'm afraid I don't remember what if
> any conclusions came out of previous discussions on UAPI for heap
> enumeration.

So the name we expose is the CMA name itself. So with dt it will be
the name of the reserved memory node that the flag property is added
to.

> I suppose CMA names haven't been relevant to userspace before, but
> they perhaps would be with this change.
>
> Alternatively, leaving it effectively undefined doesn't tie us down,
> and something like links in sysfs can be added as a richer API in the
> future.

Hrm. Mind expanding on what you're thinking here?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
