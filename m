Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAA7290BAA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 20:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477F86E038;
	Fri, 16 Oct 2020 18:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5571A6E038
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 18:47:58 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id t15so3383070otk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 11:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/6ZPAavAgIBaIj1gBG4jv7Gu9L4sN03UOtnPoYPnkGM=;
 b=lP4NOv51TEXmx39salQG6uTSU8gkLmkF8p4KPDm1dBqsQhZGdByHYty0AxeWaPaWU8
 IMBNfFJZEqSvFcX/JetY+udEH2E82sSSdgfZuuppOCDvedBZJjGbifYxGHw+S7eNMkl7
 Q4yPOvK7BXm8r1/s/BzGQMn0sLvwN7kWFqYfrHSd+w3n665ToypEQlxLHvd/d1PUW4vB
 lOcigsbdkdaso/ojnZ9YEwwCJDkWy14nmMFgohf3GDceQCc+WNSA+0TELgk0n2HJ8reg
 s0X2GbNw/6VhfYupl1ci+c1/LDuzgv37IEaqsXpF4sHnYq/fMeKyFnBOZQamOHM/6axz
 243Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/6ZPAavAgIBaIj1gBG4jv7Gu9L4sN03UOtnPoYPnkGM=;
 b=KR9KT6aKO8Req6VmJ4VAaVTnI5QhzgH3RsRXGqpgzDZUs10G8fOZc9o4Iv3JdmZsik
 EqI1+SP7cUPR/Xb6tJzhhavhM+V1H3igmCD0uaGp4ilDj0rqCK8dhN39FLl+CkpXFk+O
 Ctyv1xiofodGYWTvZGF4jfZFFLmaoh+AO6C8jsPOgnx/jER0MR4rcxe4QHxoBskKeZN8
 wQtps7rlhEikGirSE8hGeWJY2cqIuRyiy9F8MHdhJLTQ+PiErbRdZQgR9ddRDr+ax92F
 FQ8hGt6zbnMQC0SLxT5UDkIu2qMtHnbTq/8waHXEPD6as03EQdf8YiZ93opYCqV7j5lM
 mMbA==
X-Gm-Message-State: AOAM530Xt4SSqYSa9hkFILmOnN7a67SK0HYgDrT3JjndofDGT/+ufwem
 fYmbYzg8k2uf3z90vfhi4R1HIAUui8J565RTKh5scA==
X-Google-Smtp-Source: ABdhPJwH6XcBKPJDC1Mm7DKnG5P/EL1ztBMF0+cVOUi9cs5EKrO3sGguh+sEF+ZQIE3ke+UzdUEAW/qfG0BqWAz8nWs=
X-Received: by 2002:a9d:2d81:: with SMTP id g1mr3546671otb.352.1602874077645; 
 Fri, 16 Oct 2020 11:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201008113602.n7ju2hu3j6qsaxve@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20201008113602.n7ju2hu3j6qsaxve@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 16 Oct 2020 11:47:44 -0700
Message-ID: <CALAqxLUbL4ci4Vnwe6UM1OEFfLyirsQOr57nmx5NSe8Bb_yAwg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
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
Cc: nd <nd@arm.com>, Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 8, 2020 at 4:36 AM Brian Starkey <brian.starkey@arm.com> wrote:
>
> Hi John,
>
> On Sat, Oct 03, 2020 at 04:02:50AM +0000, John Stultz wrote:
> > Hey All,
>
> ...
>
> >
> > I did add to this series a reworked version of my uncached
> > system heap implementation I was submitting a few weeks back.
> > Since it duplicated a lot of the now reworked system heap code,
> > I realized it would be much simpler to add the functionality to
> > the system_heap implementaiton itself.
>
> That looks like a neat approach to me. Referencing your previous
> thread, I like the separate heap (as you have done), rather than a
> generic "cached"/"noncached" flag on all heaps.
>

Sounds good! I really appreciate the feedback on this.

> > While not improving the core allocation performance, the
> > uncached heap allocations do result in *much* improved
> > performance on HiKey960 as it avoids a lot of flushing and
> > invalidating buffers that the cpu doesn't touch often.
> >
> > Feedback on these would be great!
>
> Minor nit: s/detatch/detach/ on both heaps, but other than that
> you can add my r-b to patches 1-5.

Doh! Thanks for the spelling catch! Thanks again!

> As you've said, it does feel like there's some room for
> de-duplication, but that will be easier to work out once the
> implementations settle.
>
> I've a couple of comments for the uncached heap, but I'm not confident
> I understand the implications of having the non-cached alias enough to
> say if it looks OK or not.

Thanks so much!
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
