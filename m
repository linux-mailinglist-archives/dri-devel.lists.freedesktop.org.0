Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 701603DB27D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 06:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D439A6EC62;
	Fri, 30 Jul 2021 04:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA456EC62
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 04:52:32 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a26so15226195lfr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 21:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ngOm50/YMKcUx0bA3+RSYUsPg/JdRRvBdoD4piFXpKk=;
 b=C8Jp7VhFjs0rnaOQ+PhARQZcXBqL3li1M1opg2ctxUM+UW431Xc6w3HRU9jqMEn9J8
 mjRiwwt+tWiXsLMDZKwx5ZLEtcnwodMbSLh35X6Dl8KI5jfLdkHovCiYFvU9yLOXdVzm
 T56dTYyum/xZim2C5bWj64K+N+jV8WY66Rg5/Bwn91Sn/snbwb/x3RlTxcAU29gmNhjl
 KgwS2oOAfASo09QS8QxiHdsYQiVobP5e9jTXOpOAtTaaFBAO8bP4tgRSWo5PZXJaTFyV
 bU5CM0EvtNCO+75RkPo/2Iit3ZJTxAR2kkb3LF3KCQ+AcEjKYyubIAL6gsTqWn2Kh4aO
 Xr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ngOm50/YMKcUx0bA3+RSYUsPg/JdRRvBdoD4piFXpKk=;
 b=aiiNgt7ra6RKrPFLSZsMKiNYrM6E79knjjJIPG8evZL+IGvkNbVO/KO56MsV+aK03O
 6Q+n/x+QSqz6W/5p2SfMjmwR/6UfMFEHTYKjSGNOPvZbQOfIxj4FmxxuWKKURHm+wMaQ
 W0vuMLQangPs4pzmutwIbojxuH21uTPEEIkjWsGiImvE0R3a4xD+eTzLZC5cXFahzg3H
 UFRv9cnuaYx7QaGcdfknRzaforVW5XNznVV3xxWnURtaUdmt7fnsduJVlrBcwJ5K4yU3
 wFfD3fQeWv3/fL4QgZjhW6ecpWpLYhrBy6jfTXqHYPL/O9fw0TBArzIPZNj4NgiOLk7H
 3SrQ==
X-Gm-Message-State: AOAM531QB1ajiE1gwpGiZ+HXBDeINuOVOIwLYBFrm4av937hBe/tNPGs
 w/mxkSp37859JzH5rKElnvK7rOetlkQ5yF1p+wamcA==
X-Google-Smtp-Source: ABdhPJzDU5NmVnsCGCr2QxJh2cy55utwKVijKkr1tTD5MHrq+mqK18bOqc1KLFYSb9qZZ3DlCCOrI4gJHyxXUU4u7Zw=
X-Received: by 2002:ac2:4a8d:: with SMTP id l13mr426511lfp.626.1627620751019; 
 Thu, 29 Jul 2021 21:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210729070330.41443-1-christian.koenig@amd.com>
 <20210729070330.41443-3-christian.koenig@amd.com>
 <YQJXi2JNZdH5DaR2@phenom.ffwll.local>
In-Reply-To: <YQJXi2JNZdH5DaR2@phenom.ffwll.local>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 29 Jul 2021 21:52:19 -0700
Message-ID: <CALAqxLVN7RVz3+z1ZvkRHeb2=Y4KbpbTOw-8St0D+Lzt5U-cFw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dma-buf: nuke SW_SYNC debugfs files
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Alistair Delva <adelva@google.com>, Sandeep Patil <sspatil@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, Hridya Valsaraju <hridya@google.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 12:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jul 29, 2021 at 09:03:30AM +0200, Christian K=C3=B6nig wrote:
> > As we now knew controlling dma_fence synchronization from userspace is
> > extremely dangerous and can not only deadlock drivers but trivially als=
o the
> > whole kernel memory management.
> >
> > Entirely remove this option. We now have in kernel unit tests to exerci=
se the
> > dma_fence framework and it's containers.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> There's also igts for this, and Android heavily uses this. So I'm not sur=
e
> we can just nuke it.

Eeeeh... I don't think that's actually the case anymore. As of
android12-5.10 CONFIG_SW_SYNC is not turned on.
Further, Android is disabling debugfs in their kernels as it exposes
too much to userland.

That said, there still are some references to it:
  https://cs.android.com/android/platform/superproject/+/master:system/core=
/libsync/sync.c;l=3D416

But it looks like the actual users are only kselftest and igt?

Adding Alistair, Hridya and Sandeep in case they have more context.

thanks
-john
