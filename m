Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 022721365D0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 04:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17436E08E;
	Fri, 10 Jan 2020 03:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87A66E08E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 03:30:36 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c16so676415qko.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 19:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fQSajeOAQfVGeFbN5aHcCZ8GjF58hqwqXqYUY48IJUk=;
 b=YtagBkPGR/UTlV1mAAOaFxHMOljHsjjiS2wQLirMR2Fzgxv6EW7TTC4r9B+TL9B1yq
 NWaVFRmAza0aOTXho3BLgyNMOaEUD5rAO+3dadDuLCze91GP2O/xAblQ4Bar8WbQ9n5I
 VHRd0aIuhya384Fv6ydYl7ih39paziVR+/mn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQSajeOAQfVGeFbN5aHcCZ8GjF58hqwqXqYUY48IJUk=;
 b=j2L2M+tKhEwdAZqOI+N4MDYOMY9ZN5wGO6fvc08haUNaUkcnWuLOyKsW7n1840PU0p
 zqCZLyiaIUOK0MQS1V6njkGY7COJUQrVpoui8pX/Vru14YPBVzBrjwaJQQWx4wYUpzKp
 l6TDslvA5ZfWgxmPJNRS2cU3bEI0SxcpGzflC9fQVz902A/rmJCUhbU6fwp+vaJzlmqW
 2sU5rYAgfYvGodGXddffqAy+1fSS650JHTEgjf+UeB4JUai88briUk6YZaCGYRM7Bwsk
 8sR5vI/uHMKaQoGh/dCoRA0DWx/LRnd9vSsjEnmfJ5gCBQY0PsI5QVOyG6Gm0Wmr1K9c
 hm+Q==
X-Gm-Message-State: APjAAAXGt/Vb2lQtXGN4egA5P0Pj0lR69okRYeLNQdVqLIj0/6ubrcXe
 yfeT2FsGoV+cXPWnLqBKMElN0YFFmk8b1vj358+CSw==
X-Google-Smtp-Source: APXvYqyqYae4Ty6/L3KiMnTOZde/4YuvyLf3n5AY0yto3QcHInG86cTI8HzNsXZrvYXKhV3etEXZdfnWPOf1RinGOSs=
X-Received: by 2002:a37:4bc6:: with SMTP id y189mr1174229qka.18.1578627035990; 
 Thu, 09 Jan 2020 19:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20200109133104.11661-1-steven.price@arm.com>
 <20200109134351.GA3053@kevin>
In-Reply-To: <20200109134351.GA3053@kevin>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 10 Jan 2020 11:30:25 +0800
Message-ID: <CANMq1KBHu6CWsF0hhhxjWK81B+K0BbrVzbKvuwVgcDGO8SBUVg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Remove core stack power management
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 9, 2020 at 9:44 PM Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
>
> A-b
>
> On Thu, Jan 09, 2020 at 01:31:04PM +0000, Steven Price wrote:
> > Explict management of the GPU's core stacks is only necessary in the
> > case of a broken integration with the PDC. Since there are no known
> > platforms which have such a broken integration let's remove the explict
> > control from the driver since this apparently causes problems on other
> > platforms and will have a small performance penality.
> >
> > The out of tree mali_kbase driver contains this text regarding
> > controlling the core stack (CONFIGMALI_CORESTACK):
> >
> >   Enabling this feature on supported GPUs will let the driver powering
> >   on/off the GPU core stack independently without involving the Power
> >   Domain Controller. This should only be enabled on platforms which
> >   integration of the PDC to the Mali GPU is known to be problematic.
> >   This feature is currently only supported on t-Six and t-HEx GPUs.
> >
> >   If unsure, say N.
> >

Work on my G-72 Bifrost, no more errors on power on!

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
Tested-by: Nicolas Boichat <drinkcat@chromium.org>

> > Signed-off-by: Steven Price <steven.price@arm.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_gpu.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> > index 8822ec13a0d6..460fc190de6e 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> > @@ -309,10 +309,6 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
> >       ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
> >               val, val == pfdev->features.l2_present, 100, 1000);
> >
> > -     gpu_write(pfdev, STACK_PWRON_LO, pfdev->features.stack_present);
> > -     ret |= readl_relaxed_poll_timeout(pfdev->iomem + STACK_READY_LO,
> > -             val, val == pfdev->features.stack_present, 100, 1000);
> > -
> >       gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
> >       ret |= readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
> >               val, val == pfdev->features.shader_present, 100, 1000);
> > @@ -329,7 +325,6 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
> >  {
> >       gpu_write(pfdev, TILER_PWROFF_LO, 0);
> >       gpu_write(pfdev, SHADER_PWROFF_LO, 0);
> > -     gpu_write(pfdev, STACK_PWROFF_LO, 0);
> >       gpu_write(pfdev, L2_PWROFF_LO, 0);
> >  }
> >
> > --
> > 2.20.1
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
