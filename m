Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782183086E0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E816EA91;
	Fri, 29 Jan 2021 08:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7B6E2E6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 01:23:25 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id n18so4055403vsa.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 17:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sjkb6yXWtZ9Sxv1/gNdqQbGBoN1+dPLaicMA2ZT6rNM=;
 b=iCLYU3fuPsvJZltkAom5unfVux3qbx/84SoQSmqh5RtsiImcrCdGMT31C6+1ENMBLS
 0+LRiLAsmRhmOFQ5Q3GHbyu5aZ74aQkQRyaA63MegeLEXfmWLspArV+SQzI3/B/1cGxJ
 1rQ42u/3utf0mvm4yEsRiVY+BSTy3WgKy9UUCY1jQR27gxY3lKBZJ2MjQvlH/Y3jc8R5
 O3KBn5Wfuxbpq3cWKoGssSVuk/IPGSipcB70yiVvVwUkdP1OYGYUTRRJlSo87uQH/33A
 B+txLKIct1lZEOxXRo12HH2AlAlcCOCVY8UJXBD8D02HEcysxUof5gYWcOYymjgwUMGv
 a2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjkb6yXWtZ9Sxv1/gNdqQbGBoN1+dPLaicMA2ZT6rNM=;
 b=Ji+1X3BviV3i/edJpRlQX9Swl+PWX2YS65WU7+s2zcHJKs9lFNq0tp+E7d7hfS9MnK
 /icKeLcxlEARZjCAPANZYBvqjLKkogt1zjXmsan32frkY3bJBt0JDfIrqrcvxsA/wk91
 79gGps7yHhBJwzxmVhSRLLpIhfi9Z78oJ4H/z/+O2z15qWUjT7fHfpONvH0c9owteCfg
 ttqJgxWFHfmsZLVFLRzd6CLzDp+kAcRibiuEi6pp5y3X6Y3UpUk6WqhPGV3dr7ecVQ0E
 5RPpyHdCm6u0VFQ3pOyijc8u4sA7JoHQh50hPGqsHFgUUdHBpFFK1xKtj9IMf+2oxv6T
 96wA==
X-Gm-Message-State: AOAM530P9QqZEdfaWit24q3+py2OVgNRiZz8tkIxnvkVnqI8pqFqJbHR
 H/z8nDHzTEYiwnlHfSGmCiIXJhlu/J69c63hBQgBRQ==
X-Google-Smtp-Source: ABdhPJzvSoHd4aqU6Cv8LKu9Sl0lIJ7bapX7TwH6WxQlYBY8b93nG65hR4r/fmD0J1GnGIrVHo0uyX2Ku496O34Z6ik=
X-Received: by 2002:a67:f810:: with SMTP id l16mr1395266vso.41.1611883403850; 
 Thu, 28 Jan 2021 17:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201003040257.62768-8-john.stultz@linaro.org>
 <20201008115101.4qi6wh3hhkb6krg5@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLWrbgHoh=BCnuB4US77AOPMYmgGrE85WT6DYnEV-bad-A@mail.gmail.com>
In-Reply-To: <CALAqxLWrbgHoh=BCnuB4US77AOPMYmgGrE85WT6DYnEV-bad-A@mail.gmail.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Thu, 28 Jan 2021 17:23:12 -0800
Message-ID: <CAE2F3rBSADvPsFYyDAaPbEaFGNVKbgwOuakkD+MLwa0J-09Dcg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Approved-At: Fri, 29 Jan 2021 08:11:32 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>, nd <nd@arm.com>,
 Suren Baghdasaryan <surenb@google.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 12:04 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Oct 8, 2020 at 4:51 AM Brian Starkey <brian.starkey@arm.com> wrote:
> > On Sat, Oct 03, 2020 at 04:02:57AM +0000, John Stultz wrote:
> > > @@ -393,6 +424,16 @@ static int system_heap_allocate(struct dma_heap *heap,
> > >               /* just return, as put will call release and that will free */
> > >               return ret;
> > >       }
> > > +
> > > +     /*
> > > +      * For uncached buffers, we need to initially flush cpu cache, since
> > > +      * the __GFP_ZERO on the allocation means the zeroing was done by the
> > > +      * cpu and thus it is likely cached. Map (and implicitly flush) it out
> > > +      * now so we don't get corruption later on.
> > > +      */
> > > +     if (buffer->uncached)
> > > +             dma_map_sgtable(dma_heap_get_dev(heap), table, DMA_BIDIRECTIONAL, 0);
> >
> > Do we have to keep this mapping around for the entire lifetime of the
> > buffer?
>
> Yea, I guess we can just map and unmap it right there.  It will look a
> little absurd, but that sort of aligns with your next point.
>
> > Also, this problem (and solution) keeps lingering around. It really
> > feels like there should be a better way to solve "clean the linear
> > mapping all the way to DRAM", but I don't know what that should be.
>
> Yea, something better here would be nice...

In ION, we had a little helper function named
ion_buffer_prep_noncached that called arch_dma_prep_coherent() on all
sg entries like so

for_each_sg(table->sgl, sg, table->orig_nents, i)
        arch_dma_prep_coherent(sg_page(sg), sg->length);

Would that help?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
