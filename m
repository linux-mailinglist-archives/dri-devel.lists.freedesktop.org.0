Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E127B1C7646
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 18:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48816E8A9;
	Wed,  6 May 2020 16:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8376E8A9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 16:30:28 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id i13so2269091oie.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EvHPxE7L1Cb6oif98tDAWFYOvy9QzwI+EVnlaf1jpTo=;
 b=xGbq/nBkeNTeQkh8TeQ07h15oTGAYHX6j5LFfR/RI3sHIvBIymNOSSXRcu+wHZ1aVW
 Bi9WC0jgv9B5Kp+7cwBmKtfn1QjRyVdEkInImfKuIlVtWGUJmKfhJrI1QWyRGwCX0yJD
 ZWlgp81bR5ws/479qoQiUXdTQKezTywlxfTMxQqtDA8i2bG+9sntoecsCgJ9HLEPbqvg
 G34LbxJQDBp7Gtl0+VsmxjLGveZyAEy3fCO4pbX5afZwwEcYRPCDhYIDmwlFwhGzmFcG
 Lqdq+jCKkXA8vZnRXREVS+dR1h3wiY7f35aHnymxitA672W5CrNu0RAOCSEsoG6c/aHS
 oveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EvHPxE7L1Cb6oif98tDAWFYOvy9QzwI+EVnlaf1jpTo=;
 b=hqU6ldapNlFZNdlrFDQQVYd3dtcNA8OXgvqk1FX5Ib7pneq1EmrGesvs8MJ2TAa/vg
 v/gGhbMQmwco2UoOFynXyxNFJVsMXGRvG+9eBRJEZmELw6TFNnMe8OFJ0UmcIRNrzHiz
 UHmBibUVIIYD+LPfzy/kioZaeA3nztZpQmtHFkUt1riXMQx505ArKXdLIxJjsH3yi7DX
 li+mWk+LUc/QmLU6Ci1eq+u9tjKcwp1+SuP7n0PQl0IARcxEWJEkmXXvOqd6kR8mCIj0
 Dnr/UuE7kq9PtpCylxZ2K2QaB53pAGYeB+YSf+ULfRlYkMCDJMuDVMRpLsBz1e1gzFa1
 xH+Q==
X-Gm-Message-State: AGi0PuZK20a4d01tvjjanl6c29l16RJLa+RoOFbtibPUjErK8ekktGW1
 KZ5D9qkzznRhKi9E1WmDhZglP1yFqjNDfHRMSdIIvw==
X-Google-Smtp-Source: APiQypJOjwli0ENiyI3cl299qwfEK7rVXtgNZRAGsYZ2j/Qgmpsi7m4V2zQHdFeurrc2zQ1jwMe1nfOg2GrAWKcKGNo=
X-Received: by 2002:aca:cf83:: with SMTP id f125mr3336594oig.97.1588782627545; 
 Wed, 06 May 2020 09:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-2-john.stultz@linaro.org>
 <20200501104216.4f226c2a7bzval5o@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLVScV1j-zxw=cwpE0+eDoaubchXx6SJgu=1Zvh8HnE-Tg@mail.gmail.com>
 <20200504085007.5yrjhknkg6ugbqwk@DESKTOP-E1NTVVP.localdomain>
 <1bddb721-d4d9-f113-bacc-0a0ca2d57753@ti.com>
In-Reply-To: <1bddb721-d4d9-f113-bacc-0a0ca2d57753@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 6 May 2020 09:30:16 -0700
Message-ID: <CALAqxLWnEj-c3CYGC6p23cwMqce-MV6pJOzGbp+ptWFB0NQoog@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/4] devicetree: bindings: Add linux, cma-heap tag for
 reserved memory
To: "Andrew F. Davis" <afd@ti.com>
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
 linux-mm <linux-mm@kvack.org>, Rob Herring <robh+dt@kernel.org>,
 Christoph Hellwig <hch@lst.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 6, 2020 at 9:04 AM Andrew F. Davis <afd@ti.com> wrote:
> On 5/4/20 4:50 AM, Brian Starkey wrote:
> > On Fri, May 01, 2020 at 11:40:16AM -0700, John Stultz wrote:
> >> So the name we expose is the CMA name itself. So with dt it will be
> >> the name of the reserved memory node that the flag property is added
> >> to.
> >>
> >
> > Yeah I'm just wondering if that's "stable" so we can say "the heap
> > will use the node name", or if saying that would cause us a headache
> > in the future.
>
>
> The issue is going to be this causes the node name in DT to become a
> kind of ABI. Right now until we have some userspace lib that enumerates
> the heaps in a stable way programs will hard-code the full heap name,
> which right now would look like:
>
> char *heap = "/dev/dma_heap/dma_heap_mem@89000000";
>

If that's what the device chose to export.

> Yuk.. we might want to look into exporting heap properties to make them
> searchable based on something other than name here soon. Or this will be
> a mess to cleanup in the future.

Eh. I don't see this as such an issue. On different systems we have
different device nodes. Some boards have more or fewer NICs, or
various partitions, etc. There has to be some device specific userland
config that determines which partitions are mounted where (this is my
"gralloc is fstab" thesis :)

I think with the heaps, qualities other than name are going to be
poorly specified or unenumerable, so any generic query interface is
going to fall down there (and be awful to use).

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
