Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782283D26ED
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 17:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3476EC9F;
	Thu, 22 Jul 2021 15:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9106F412;
 Thu, 22 Jul 2021 15:42:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id f9so6400473wrq.11;
 Thu, 22 Jul 2021 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xwujliw37i4nL4NHiavWRXrnZYwru6cdneVGoRJHvdk=;
 b=vONwjOWAnqwZPgVHnWoc25b8Wj1QfXGXii/0g9L8XSGIqdlNvW1l2ps1Mhs+5TOrBU
 fCcyh9cgdUFo2ztUUsPeXaAv7Eu1z+04In4U9T8GxgjkXSxWKt/9eNACufrCSl3qRohZ
 uwHCxAAIjIr3IZHqh43Nm3MVxSR0+Q2DgRTuqORJDOjKA/AAdgew3wFgwLFF9gz00FAq
 8EQS4GNCSowzaFD5B0qzWSKSkeAd77OYjbitQW8GJtHPPmI4x/RutgtfQHcBYY1iLw1N
 WBE86hNGRIqqV5ttxbhLWidcQoSbBib/xY2Kr5IQR/G9r/ndov7S24VlRtHLWXarito7
 4Vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xwujliw37i4nL4NHiavWRXrnZYwru6cdneVGoRJHvdk=;
 b=t5cLZLhtyKtwwllARAQD0YL4PyHbwCxI0mwSWvZVG78+ZrhuWAwVgbKpqv9dk7Ha8E
 N80LfvYbb1Yx/wxbOlLZCCin5BTZgkFi/wvh9bo9tBycnOahL7j3P4xsD96KaazhabtN
 zAPH6jvH1+M1DTkJtrOJ9Vr9Q/ibVwkaMcC4TR7vcn2LfVt0GT2oolARo8Xd6j6Y936q
 Xb+CRnQczpNvX2OEim2hM2NVkx0yv6ksxfLihxSDklo9XEzGPI6YrFYMwiqduSsL8V/j
 XCj7MpaEJHW666gSVfvF+Wwhd6agQTXghG3gpzjVsrqEwhcaA5rfdperLDcTLNtoDfd9
 zMFg==
X-Gm-Message-State: AOAM531OqNNft/Y9OeOoT/Qpkdqf5p/HD1Tvd3gbDlXO2GwU5JSIRZXL
 kYBPHRAijXBgzugULn/XJ7ETrTlBaluEMIu5pVU=
X-Google-Smtp-Source: ABdhPJwDJ6g1ZzXe281PvcjiwofPNPXNvT1fjPlHUsBiLkV88ymkjK6u/j0w4wiQy9QGguzSTEKkEgrjIKZJ4Yo751E=
X-Received: by 2002:a5d:488a:: with SMTP id g10mr561619wrq.327.1626968552928; 
 Thu, 22 Jul 2021 08:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210720150716.1213775-1-robdclark@gmail.com>
 <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local>
 <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
 <YPk1izQFR+tRV8js@phenom.ffwll.local>
 <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
In-Reply-To: <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 Jul 2021 08:46:41 -0700
Message-ID: <CAF6AEGuHLPtJ99VOSaJEFqbSum_yWHn3cMPrwcNfRn2RU3ZB5g@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 2:28 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 22.07.21 um 11:08 schrieb Daniel Vetter:
> > [SNIP]
> >> As far as I know wake_up_state() tries to run the thread on the CPU it=
 was
> >> scheduled last, while wait_event_* makes the thread run on the CPU who
> >> issues the wake by default.
> >>
> >> And yes I've also noticed this already and it was one of the reason wh=
y I
> >> suggested to use a wait_queue instead of the hand wired dma_fence_wait
> >> implementation.
> > The first versions had used wait_queue, but iirc we had some issues wit=
h
> > the callbacks and stuff and that was the reasons for hand-rolling. Or
> > maybe it was the integration of the lockless fastpath for
> > dma_fence_is_signalled().
> >
> >> [SNIP]
> >> Well it would have been nicer if we used the existing infrastructure i=
nstead
> >> of re-inventing stuff for dma_fence, but that chance is long gone.
> >>
> >> And you don't need a dma_fence_context base class, but rather just a f=
lag in
> >> the dma_fence_ops if you want to change the behavior.
> > If there's something broken we should just fix it, not force everyone t=
o
> > set a random flag. dma_fence work like special wait_queues, so if we
> > differ then we should go back to that.
>
> Wait a second with that, this is not broken. It's just different
> behavior and there are good arguments for both sides.
>
> If a wait is short you can have situations where you want to start the
> thread on the original CPU.
>      This is because you can assume that the caches on that CPU are
> still hot and heating up the caches on the local CPU would take longer
> than an inter CPU interrupt.
>
> But if the wait is long it makes more sense to run the thread on the CPU
> where you noticed the wake up event.
>      This is because you can assume that the caches are cold anyway and
> starting the thread on the current CPU (most likely from an interrupt
> handler) gives you the absolutely best latency.
>      In other words you usually return from the interrupt handler and
> just directly switch to the now running thread.
>
> I'm not sure if all drivers want the same behavior. Rob here seems to
> prefer number 2, but we have used 1 for dma_fence for a rather long time
> now and it could be that some people start to complain when we switch
> unconditionally.
>

Hmm, I wonder if it would make sense to have a dma_wait_fence() flag
to control the behavior, since it is maybe more about the waiter (and
perhaps how long the waiter expects to wait) than the signaler..

BR,
-R
