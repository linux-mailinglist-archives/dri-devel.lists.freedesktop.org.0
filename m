Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE3165FFB1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 12:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E2810E869;
	Fri,  6 Jan 2023 11:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D83610E869
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 11:44:13 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id l139so1529705ybl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 03:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yB29pfil3ZJ/tnu/y5zP5zuvTun+wewSgKoDLpCPfyQ=;
 b=XBdcFpm2+O+uOJZ9OCd2RviooHef3gmC5E4HEWjOG7D/fKnyJRV0fLi06BnSmY9HqP
 JzFwdvF4qXQICwxwcgY4L9dmWFyrKlqb96glGav5lQ86SpS/4rrXlERPZNTYfMRJIXiJ
 omBeAWRBstCnF+FiJROXc+Ja8OuAdCq5DxqXMkWv42BDLhgkdw1a1q9IUXGEswyFsy5L
 nXwt4iCMxgmfTeuIhotBmPNhYKtDO/yZf35TnkGtRGan+kpifWGjZXhpcBs1Se9K4FUc
 elNpWSn4YgCRQTAzY2QpcDRt2JsxK3V8vQSePnRYkdDLFHVIqmDRY68cXQA+8zgoo6BZ
 PHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yB29pfil3ZJ/tnu/y5zP5zuvTun+wewSgKoDLpCPfyQ=;
 b=R+awRmY327QLCtwGJwKxFm267gUGmJH4s4DTBO5ZhXWXtLiBD0WJFpsWOgenslAYU9
 pT5MqW8zzPj+6JiDsnLjlcATkD3e7uwpJYfHkF2L4gH2JgXm54iebqb7JgttYPspy+IT
 ryZfQd1oT73jESyfFDObBtR9733DioN1SQzCF6ziYlyf/z5FjsA4skBtGMy5gnVZPJCi
 1Qxhl8Yl/SSdF7153aT1N3r5U9kuZKHdTTxJeX99op4fgzgWDTWIEoNyw43OvJLKZF9c
 NWxaWEviQujZJspD40WeMQG+asl+KQ/DQEbAcudsYKnhyg108XYJUW+3fUOk9nXThlAV
 ZohA==
X-Gm-Message-State: AFqh2kpygcKKLVE00ewsOfUyZYHvPf3YAhZoF8+AhYhSZVbVupv96R1j
 h4oxa9Jts037QrSXd/7IawTOQXusStvQsEd1Q+Y=
X-Google-Smtp-Source: AMrXdXvFrc8jsAPVKGJSKIExQc0sRUSSV5swYROYEtwlB2DAaeX3xLEz5jjC/6Xtw2YhLeDvalcJs1f96vhO+przv5I=
X-Received: by 2002:a25:c843:0:b0:754:e501:8b51 with SMTP id
 y64-20020a25c843000000b00754e5018b51mr6231075ybf.197.1673005452122; Fri, 06
 Jan 2023 03:44:12 -0800 (PST)
MIME-Version: 1.0
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <Y7bJLkXF7xFYX4Qe@phenom.ffwll.local>
 <ff231f90-9b67-7f47-b543-e8194f3cdec6@quicinc.com>
 <CAFCwf13uupxNxc+Ru3zEa_Wn1asJ9UgpnyDgyFQKhEPC8qVtbQ@mail.gmail.com>
 <Y7fpr69AXYYo2O25@phenom.ffwll.local>
 <20230106095634.GB1586324@linux.intel.com>
 <CAKMK7uEu=aKCVgNfzqVE-NKX9O6HyNmYKORuHcK4Y=j=kmRDMw@mail.gmail.com>
In-Reply-To: <CAKMK7uEu=aKCVgNfzqVE-NKX9O6HyNmYKORuHcK4Y=j=kmRDMw@mail.gmail.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Fri, 6 Jan 2023 13:43:45 +0200
Message-ID: <CAFCwf11csP1YqG6e-EGzpttAPbvhXsZ9PTiUFK6pbFYHPqqZng@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 6, 2023 at 12:45 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, 6 Jan 2023 at 10:56, Stanislaw Gruszka
> <stanislaw.gruszka@linux.intel.com> wrote:
> >
> > On Fri, Jan 06, 2023 at 10:28:15AM +0100, Daniel Vetter wrote:
> > > On Thu, Jan 05, 2023 at 07:38:26PM +0200, Oded Gabbay wrote:
> > > > On Thu, Jan 5, 2023 at 6:25 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
> > > > >
> > > > > On 1/5/2023 5:57 AM, Daniel Vetter wrote:
> > > > > > On Thu, Dec 08, 2022 at 12:07:27PM +0100, Jacek Lawrynowicz wrote:
> > > > > >> +static const struct drm_driver driver = {
> > > > > >> +    .driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> > > > > >
> > > > > > So I was wondering whether this is a bright idea, and whether we shouldn't
> > > > > > just go ahead and infuse more meaning into accel vs render nodes.
> > > > > >
> > > > > > The uapi relevant part of render nodes is that they're multi-user safe, at
> > > > > > least as much as feasible. Every new open() gives you a new private
> > > > > > accelerator. This also has implications on how userspace drivers iterate
> > > > > > them, they just open them all in turn and check whether it's the right
> > > > > > one - because userspace apis allow applications to enumerate them all.
> > > > > > Which also means that any devicie initialization at open() time is a
> > > > > > really bad idea.
> > > > > >
> > > > > > A lot of the compute accelerators otoh (well habanalabs) are single user,
> > > > > > init can be done at open() time because you only open this when you
> > > > > > actually know you're going to use it.
> > > > > >
> > > > > > So given this, shouldn't multi-user inference engines be more like render
> > > > > > drivers, and less like accel? So DRIVER_RENDER, but still under
> > > > > > drivers/accel.
> > > > > >
> > > > > > This way that entire separate /dev node would actually become meaningful
> > > > > > beyond just the basic bikeshed:
> > > > > > - render nodes are multi user, safe to iterate and open() just for
> > > > > >    iteration
> > > > > > - accel nodes are single user, you really should not ever open them unless
> > > > > >    you want to use them
> > > > > >
> > > > > > Of course would need a doc patch :-)
> > > > > >
> > > > > > Thoughts?
> > > > > > -Daniel
> > > > >
> > > > > Hmm.
> > > > >
> > > > > I admit, I thought DRIVER_ACCEL was the same as DRIVER_RENDER, except
> > > > > that DRIVER_ACCEL dropped the "legacy" dual node setup and also avoided
> > > > > "legacy" userspace.
> > > > >
> > > > > qaic is multi-user.  I thought habana was the same, at-least for
> > > > > inference.  Oded, am I wrong?
> > > > Habana's devices support a single user at a time acquiring the device
> > > > and working on it.
> > > > Both for training and inference.
> > > > >
> > > > > So, if DRIVER_ACCEL is for single-user (training?), and multi-user ends
> > > > > up in DRIVER_RENDER, that would seem to mean qaic ends up using
> > > > > DRIVER_RENDER and not DRIVER_ACCEL.  Then qaic ends up over under
> > > > > /dev/dri with both a card node (never used) and a render node.  That
> > > > > would seem to mean that the "legacy" userspace would open qaic nodes by
> > > > > default - something I understood Oded was trying to avoid.
> > > > >
> > > > > If there really a usecase for DRIVER_ACCEL to support single-user?  I
> > > > > wonder why we can't default to multi-user, and if a particular
> > > > > user/driver has a single-user usecase, it enforces that in a driver
> > > > > specific manner?
> > > > >
> > > > > -Jeff
> > > >
> > > > Honestly, Daniel, I don't like this suggestion. I don't understand why
> > > > you make a connection between render/accel to single/multi user.
> > > >
> > > > As Jeff has said, one of the goals was to expose accelerator devices
> > > > to userspace with new device char nodes so we won't be bothered by
> > > > legacy userspace graphics software. This is something we all agreed on
> > > > and I don't see why we should change it now, even if you think it's
> > > > bike-shedding (which I disagree with).
> > > >
> > > > But in any case, creating a new device char nodes had nothing to do
> > > > with whether the device supports single or multi user. I can
> > > > definitely see in the future training devices that support multiple
> > > > users.
> > > >
> > > > The common drm/accel ioctls should of course not be limited to a
> > > > single user, and I agree with Jeff here, if a specific driver has such
> > > > a limitation (e.g. Habana), then that driver should handle it on its
> > > > own.
> > > > Maybe if there will be multiple drivers with such a limitation, we can
> > > > make that "handling" to be common code.
> > > >
> > > > Bottom line, I prefer we keep things as we all agreed upon in LPC.
> > >
> > > The problem is going to happen as soon as you have cross-vendor userspace.
> > > Which I'm kinda hoping is at least still the aspiration. Because with
> > > cross-vendor userspace you generally iterate & open all devices before you
> > > select the one you're going to use. And so we do kinda need a distinction,
> > > or we need that the single-user drivers also guarantee that open() is
> > > cheap.
> >
> > FWIW we had good support in ivpu for probe open's in form of lazy context
> > allocation. It was removed recently due to review feedback that this is
> > unnecessary, but we can add it back.
>
> Yeah once you have more than 1 multi-user accel chip in the system you
> need to do that. Which is really the reason why I think smashing
> multi-user client accel things into render is good, it forces drivers
> to suck less.
I still don't think it is a good idea, nor that it was the original
intention of this endeavour.
I don't want to repeat my previous email, so I'll just say again I
don't agree with the connection you make between accel devices and
single users.
Today Habana supports single-user, tomorrow it might change. But that
doesn't mean I will want to present my device as a GPU because I don't
want some app to try and render stuff on my device.

Moreover, accel devices can actually be specific IPs inside a more
general ASIC (e.g. GPU) which supports multi-user. In that case, one
might want to have an accel driver that supports multi-user on those
IPs but exposes /dev/accel and not render nodes.

Oded

>
> On that topic, does your userspace still do the drmIoctl() wrapper?
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
