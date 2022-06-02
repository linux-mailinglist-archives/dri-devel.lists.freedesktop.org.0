Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A852853B3D5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 08:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2160010FAD2;
	Thu,  2 Jun 2022 06:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F5810FAD2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 06:48:08 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 g13-20020a9d6b0d000000b0060b13026e0dso2818497otp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 23:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9MTxukV/K3C0MlgiTjfIamenE2H5Jp9btuHvg3HMzBI=;
 b=gKgf0T+2Vhbukih6Euuve7q8cF4hGKz+4q1jJ3dq7sXeaLd/E+1e+yDmDFpd/ITxDk
 /Chuk6YKN7EPpxVjJ1ntnvuh0oNamFQSkuIFVQHqnwYM41PuFLWlMyUSH4uFi48cp6rw
 5Rob0E/tmZhFvx1ZwPclRDdVZpW/h26OebgGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9MTxukV/K3C0MlgiTjfIamenE2H5Jp9btuHvg3HMzBI=;
 b=HjllFCNOeGljjiLJdwoQsRt46hr4TyXEumDD/nqTZ2vxywoFbkYZfkOodfXnz36iwG
 zRf6X75Ay/Wk7Lx6m8l8Q0NCMZEwHi8YOvSqX9GLsNL2ZH4xmzLYvs1b+VkSqK8rfY6m
 hbvBhmu0mQOh55IqB+tC1pedBPGjIiqpLA3x6KLAdFUMY5rqlZLAsKwUXnZUlWgc8MK9
 YKHw27f1uYArytvkMUKtiFlgpGtAgfshbNtQXYa8wQn3W5ZXW+n/Z3bqwoI1iKHOyqGS
 S9M3qpssy9Vle8St4004bZ8aI+qjmB5uaK2nWOlOU5gCSuYDSnFGYwQbuWSMoVjXimUu
 jiGw==
X-Gm-Message-State: AOAM53149spwOJPudZGeVedIkROdR9AjRJsus6giqblnY5BHCzLqObLL
 hMnFVRH69NL5YHIoHpzsCk9+NMFXT4FZQuiGx1CvXA==
X-Google-Smtp-Source: ABdhPJyY2QTqePf9xWLQk2Re2eAG0zLXv0Jem0CiProjoR+UhtAWqw0aY09YbIvhgukeRDmEqA88qsx0s8QUCtwkids=
X-Received: by 2002:a9d:470e:0:b0:60b:127a:9512 with SMTP id
 a14-20020a9d470e000000b0060b127a9512mr1431187otf.301.1654152487514; Wed, 01
 Jun 2022 23:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
 <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
 <YphX2erQp3e4mUba@kroah.com>
 <CtTIPo68VAvDRUp7-QFc0m-2SnikPFd0QpdogNj2xueFfyQKa3DQqiw3Meqtsu8vQgEuKX_-MPKbe7jQdf49-Y3z2TAYbajUrC5GKF0Dolk=@emersion.fr>
In-Reply-To: <CtTIPo68VAvDRUp7-QFc0m-2SnikPFd0QpdogNj2xueFfyQKa3DQqiw3Meqtsu8vQgEuKX_-MPKbe7jQdf49-Y3z2TAYbajUrC5GKF0Dolk=@emersion.fr>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 2 Jun 2022 08:47:56 +0200
Message-ID: <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
To: Simon Ser <contact@emersion.fr>
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
Cc: Greg KH <greg@kroah.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Jason Ekstrand <jason.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Jun 2022 at 08:34, Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, June 2nd, 2022 at 08:25, Greg KH <greg@kroah.com> wrote:
>
> > On Thu, Jun 02, 2022 at 06:17:31AM +0000, Simon Ser wrote:
> >
> > > On Thursday, June 2nd, 2022 at 07:40, Greg KH greg@kroah.com wrote:
> > >
> > > > On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
> > > >
> > > > > To discover support for new DMA-BUF IOCTLs, user-space has no
> > > > > choice but to try to perform the IOCTL on an existing DMA-BUF.
> > > >
> > > > Which is correct and how all kernel features work (sorry I missed the
> > > > main goal of this patch earlier and focused only on the sysfs stuff).
> > > >
> > > > > However, user-space may want to figure out whether or not the
> > > > > IOCTL is available before it has a DMA-BUF at hand, e.g. at
> > > > > initialization time in a Wayland compositor.
> > > >
> > > > Why not just do the ioctl in a test way? That's how we determine kernel
> > > > features, we do not poke around in sysfs to determine what is, or is
> > > > not, present at runtime.
> > > >
> > > > > Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> > > > > subsystem to advertise supported features. Add a
> > > > > sync_file_import_export entry which indicates that importing and
> > > > > exporting sync_files from/to DMA-BUFs is supported.
> > > >
> > > > No, sorry, this is not a sustainable thing to do for all kernel features
> > > > over time. Please just do the ioctl and go from there. sysfs is not
> > > > for advertising what is and is not enabled/present in a kernel with
> > > > regards to functionality or capabilities of the system.
> > > >
> > > > If sysfs were to export this type of thing, it would have to do it for
> > > > everything, not just some random tiny thing of one kernel driver.
> > >
> > > I'd argue that DMA-BUF is a special case here.
> >
> > So this is special and unique just like everything else? :)
> >
> > > To check whether the import/export IOCTLs are available, user-space
> > > needs a DMA-BUF to try to perform the IOCTL. To get a DMA-BUF,
> > > user-space needs to enumerate GPUs, pick one at random, load GBM or
> > > Vulkan, use that heavy-weight API to allocate a "fake" buffer on the
> > > GPU, export that buffer into a DMA-BUF, try the IOCTL, then teardown
> > > all of this. There is no other way.
> > >
> > > This sounds like a roundabout way to answer the simple question "is the
> > > IOCTL available?". Do you have another suggestion to address this
> > > problem?
> >
> > What does userspace do differently if the ioctl is present or not?
>
> Globally enable a synchronization API for Wayland clients, for instance
> in the case of a Wayland compositor.
>
> > And why is this somehow more special than of the tens of thousands of
> > other ioctl calls where you have to do exactly the same thing you list
> > above to determine if it is present or not?
>
> For other IOCTLs it's not as complicated to obtain a FD to do the test
> with.

Two expand on this:

- compositor opens the drm render /dev node
- compositor initializes the opengl or vulkan userspace driver on top of that
- compositor asks that userspace driver to allocate some buffer, which
can be pretty expensive
- compositor asks the userspace driver to export that buffer into a dma-buf
- compositor can finally do the test ioctl, realizes support isn't
there and tosses the entire thing

read() on a sysfs file is so much more reasonable it's not even funny.

Plan B we discussed is to add a getparam to signify this to the drm
ioctl interface, but that has the design problem that a feature in the
dma-buf subsystem is announced in a totally different subsystem (ok
same maintainers), and if that ever gets out of sync your userspace
breaks. So really no good.

So if sysfs also isn't the right approach, and the getparam ioctl on
drm is defo worse, what is the right approach? Ideally without setting
up the entire userspace render driver and doing some expensive-ish
(depending upon driver at least) buffer allocations just to check for
a feature.

Note that some compositors want to gate their "should I use vk for
rendering and expose some additional features to client" decision on
this, so setting up the wrong renderer just to test whether that would
work is not a very great approach.

Also the last time we added a feature to dma-buf was in 3.17, so I
guess everyone just hardcodes nowadays that all dma-buf features are
present. Which isn't great, and that's why we're trying to fix here.

> > And how have you specifically tied this sysfs to the ioctl so that if it
> > changes or is ported elsewhere, that sysfs attribute will also know to
> > be added?
>
> What do you mean by "ported elsewhere"?
>
> > You already have shipping kernels today without this attribute, you
> > can't go back in time and add the attribute to those kernels just to
> > reflect the ioctl being present or not, so you have to handle this case
> > in userspace today, making this not needed at all. Do you want to have
> > two test cases in your userspace code, one that does "is the sysfs file
> > there? No, ok, let's see if we are on an older kernel without it, yet
> > the ioctl is present..." When really you can just do "let's see if the
> > ioctl is present" logic as you already do that today.
>
> The IOCTL has not been shipped yet.

To expand, Jason Ekstrand wrote the ioctl itself and Simon here the
better discovery code. It should probably have been sent out as a
joint patch series or something, but neither has been merged yet so
there is no problem.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
