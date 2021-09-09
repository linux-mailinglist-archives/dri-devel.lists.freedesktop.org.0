Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 067D2405BB6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 19:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FA56E8CB;
	Thu,  9 Sep 2021 17:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099F96E5BD;
 Thu,  9 Sep 2021 17:03:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i28so3562457wrb.2;
 Thu, 09 Sep 2021 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IbPPNqobPmWZ9MF50JtcVBJ+K5zUi+K+HgQrnexV6is=;
 b=BE/y2bL/mHyRfUxGmarxT/nWkFdJyoDiJQtSLvbtElf2UESCirtPhVWa0xURMyE5tF
 rYTmwmayvMNAV77nMn8OnSbsQBXKaho0Mf7sx1UJRiNp/0zyvd2vEvD1ZcsOP6Idyh8I
 nJMdkiJveWXI8MXP3/S+LHsYohhkLiI5HAvtYoDeM1SJxY7AIldHjSqxxEhtIkYmYB84
 5QNzYwGK3ubwMbqUocdIOoNCwQeHafOucLmkD0NJibGsl58DOIzZPkxc1wHSjsdtDsMX
 7FbfsGNMPGgQl1HAh6ggsseaIz9cj2Sa7YnMJe1vCa6t0dT04seBaMEuTQ7jh5W87Jol
 XAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IbPPNqobPmWZ9MF50JtcVBJ+K5zUi+K+HgQrnexV6is=;
 b=6y/vaw5FS5YXwH40Gttrb1xpRX0ZFPiQAmlDPm3THkVXFa+9Acc2dk792ue/BPFjG0
 RqzJFX5SByVjdvq0D4BjgIFF8jvCvldtAX50QpgynVIqwCNb7Uitdys22UQppwH3Qkx1
 22+AXK+XaS1Dj0iG0C8ArSP5d1T924lXykGapX2P4HB2FbDkLa60il3XZsPeNUcYSozy
 v3iJbmc8dfe/CxY1kJoIj6dWVBut9AtpdFCn59mCaI3BtifTcRccIzAEKITBgn9NCw1L
 BywH5y43w4OEp/Tt53lgrx/GngHCFchov/aaRCG1PJKrkrJ4Bp/5I3t/UBIithDcgZXO
 JlEA==
X-Gm-Message-State: AOAM531U6tdDZ2Hy+zvBjCysW3E7gk+9X7afBMJzfjobrawe5J6hde8J
 ZcHiV6QNINFI6aPBNcxkLnl63kWVRTbl6t8seSo=
X-Google-Smtp-Source: ABdhPJxhkpYn5lOEWS5HH3Rm8m0d/wuvw1EtxFJjV07j/rVitgQQ8dAircwjT8ySc+dDGJd0RC694oWjtFnG4vZItxk=
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr4750688wrg.151.1631207035454; 
 Thu, 09 Sep 2021 10:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <i-XmBd_5J3_d8cdm-IT6Ery2kHN0FPZCX968aU5idvxQxNlvDJguLLThtF2NF15LF8gGsH4uI2w0s0CL_39KGpzoGpuCgcz2_-4Wjf3AYEM=@emersion.fr>
 <CAF6AEGuD2bnFpmSWtGxU5+AFj1HVKtnOZmLKRr-pDVbLn0nPVw@mail.gmail.com>
 <CZ2qg4SOe8RnrJpAfZtag_GZTFRt6wAdspKbP4RqpFQCE9Wiuf4xyHTUyKIkaXGu6LfKpSALrmOC3jxgfPdMRjgIAkrkvTnNd9stjXqnPNI=@emersion.fr>
In-Reply-To: <CZ2qg4SOe8RnrJpAfZtag_GZTFRt6wAdspKbP4RqpFQCE9Wiuf4xyHTUyKIkaXGu6LfKpSALrmOC3jxgfPdMRjgIAkrkvTnNd9stjXqnPNI=@emersion.fr>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 9 Sep 2021 10:08:22 -0700
Message-ID: <CAF6AEGseoCzbYXUjsJNo7q-_g3FBmn0+BPMKf=QX5gunhOeKKA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] dma-fence: Deadline awareness
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Gustavo Padovan <gustavo@padovan.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Steven Price <steven.price@arm.com>, 
 Tian Tao <tiantao6@hisilicon.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 9, 2021 at 9:42 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, September 9th, 2021 at 18:31, Rob Clark <robdclark@gmail.com> wrote:
>
> > Yes, I think it would.. and "dma-buf/sync_file: Add SET_DEADLINE
> > ioctl" adds such an ioctl.. just for the benefit of igt tests at this
> > point, but the thought was it would be also used by compositors that
> > are doing such frame scheduling. Ofc danvet is a bit grumpy that
> > there isn't a more real (than igt) userspace for the ioctl yet ;-)
>
> Ah, very nice, I somehow missed it.
>
> I guess one issue is that explicit sync isn't quite plumbed through
> compositors yet, so without Jason's DMA-BUF to sync_file IOCTL it'd be
> a bit difficult to use.
>
> Can anybody set the deadline? I wonder if clients should be allowed to.

In its current form, anyone who has the fd can.. I'm not sure how (or
even if) we could limit it beyond that.  I suppose hypothetically you
could use this for completely non-compositor related things, like
compute jobs where you want the result by some deadline.  (OTOH, it
could be the driver using this internally when the app is stalling on
a result)

> What happens if the deadline is exceeded? I'd assume nothing in
> particular, the deadline being just a hint?

Nothing in particular, it is just a hint.  The main intention is to
provide a feedback hint to the drivers in scenarios like vblank
deadlines, where being 1ms late is just as bad as being
$frame_duration-1ms late.  From my experiments and profiling it is
useful in a couple scenarios:

1) input latency, ie. go from idle to fullscreen animation, where GPU
has been idle for a while and not busy enough *yet* for devfreq to
kick in and start ramping up the freq before we miss the first vblank
2) double buffering, for ex. if you are 1ms late you end up stalling
15ms before the gpu can start rendering the next frame.. in the
absence of feedback, devfreq would ramp down in this scenario instead
of up

BR,
-R
