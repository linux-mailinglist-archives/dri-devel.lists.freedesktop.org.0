Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24E759BBBA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 10:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49D611ACC4;
	Mon, 22 Aug 2022 08:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C1811AB4D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 08:34:31 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-335624d1e26so273233767b3.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=zzEOCXoR8z7enUA2+rK3jahKOr6h0Ep6/eos4wf1jAA=;
 b=SiY93PDX5m21vMHnBkrzEQwcKPr1hwy8OfqydKFgZNUew9CnYtZ0W3WVTNG7UKGkFo
 WiMckjA3WhbgLZhjOvU2fTa0JURX+5MnQWaWFnmMgQ8B0X3dDvAnX4SxDo47e3KpKb9I
 DRaBt0k5CCNKGz+UynA9a0MlRmilf5m9n7+2+s26eDekMTmtwEgCoJ5ue6uyIJzpqiU7
 Y7mzBoxe9c0XFSSEhaaS1aflF92LTdEtR/oTfHQYAPCHq/GIGAW0hrDb7pkmGhNmoaG2
 evLh2Bw4z3+fDSqYE+ITH36QalO1SFzuYCzFx5u7uJsst+8c7MTwN/8kIbm9jvR/UDwu
 bjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=zzEOCXoR8z7enUA2+rK3jahKOr6h0Ep6/eos4wf1jAA=;
 b=i5/nUSm3thkWKrbUP5/GYoeJ7ZnFfaYx3KZhFy0fAdOZqlmdamo5KXCwq8OO/XYQ8B
 wC1iDt+BMVIhPavb1SVEL9V8MNJZV/G+UAuvew1Vk4l47QuSnfX/9CAxJIFMcUJrEEtQ
 c0n74q0LiQJ13HHk0r/O/Ys3heRQCn32Uo2CQydmX1b+xcODAebAcm0vbgNPqtCf8LpV
 MEhkIT1/31yvfkwE46N4xdQHgW9QawSWG0pQrHVVu+5pqun2eqfZUKkZO3p8c4Awio77
 daqFLv7onvrYK0Wli1hSQ2ZiTFyDx27Imgm7e1WNjN91OMaBC/zz/N+yZDRNJ8RJCVOD
 PxEQ==
X-Gm-Message-State: ACgBeo39Km5Vsxvlmh7q0EtXIgQsK9ko6II10bJecrfAe4PB5s+ITSbg
 PYFd2TZvqFFBXFfRhlONgOVFYn6uDwfzDhw0n9rZ4g==
X-Google-Smtp-Source: AA6agR5BOagBRlV9jCRxdgZ3lex4E4Fkt3v8Q7XLN5rfKcH58fLKgMm0x4mDDX/e8Y8c77K3AHpxRTsR8o2SubnTY1s=
X-Received: by 2002:a25:c806:0:b0:67e:e3c:1cbc with SMTP id
 y6-20020a25c806000000b0067e0e3c1cbcmr18094869ybf.321.1661157270877; Mon, 22
 Aug 2022 01:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzo4n7xKnU+2=gesdLqDJUQ7kBAVCQND6yu5_CTiKo7Cg@mail.gmail.com>
 <CAPM=9twwdeybb_hwvtqbyic3CHYe3+s1LLnT0t_DJAVi9cno4g@mail.gmail.com>
In-Reply-To: <CAPM=9twwdeybb_hwvtqbyic3CHYe3+s1LLnT0t_DJAVi9cno4g@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Mon, 22 Aug 2022 10:34:23 +0200
Message-ID: <CAP+8YyEqdzp3t1ErmpsF_8U1HPRQXoRBd++TjzWCvA5EqbynQA@mail.gmail.com>
Subject: Re: vm binding interfaces and parallel with mmap
To: Dave Airlie <airlied@gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Ben Skeggs <skeggsb@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 22, 2022 at 9:28 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 22 Aug 2022 at 17:05, Dave Airlie <airlied@gmail.com> wrote:
> >
> > Hey,
> >
> > I've just been looking at the vm bind type interfaces and wanted to at
> > least document how we think the unmapping API should work. I know I've
> > talked on irc before about this, but wanted to solidify things a bit
> > more around what is required vs what is a nice to have.
> >
> > My main concerns/thoughts are around the unbind interfaces and how
> > close to munmap they should be.
> >
> > I think the mapping operation is mostly consistent
> > MAP(bo handle, offset into bo, range, VM offset, VM flags)
> > which puts the range inside to bo at the offset in the current VM
> > (maybe take an optional vm_id).
> >
> > now the simplest unmap I can see if one that parallel munmap
> > UNMAP(vmaddr, range);
> >
> > But it begs the question on then how much the kernel needs to deal
> > with here, if we support random vmaddr,range then we really need to be
> > able to do everything munmap does for CPU VMA, which means splitting
> > ranges, joining ranges etc.
> >
> > like
> > MAP(1, 0, 0x8000, 0xc0000)
> > UNMAP(0xc1000, 0x1000)
> > should that be possible?
> >
> > Do we have any API usage (across Vulkan/CL/CUDA/ROCm etc) that
> > requires this sort of control, or should we be fine with only
> > unmapping objects exactly like how they were mapped in the first
> > place, and not have any splitting/joining?

Vulkan allows for this, though I haven't checked to what extent apps use it.

We could technically split all mapping/unmapping to be per single tile
in the userspace driver, which avoids the need for splitting/merging,
but that could very much be a pessimization.


>
> I suppose it also asks the question around paralleling
>
> fd = open()
> ptr = mmap(fd,)
> close(fd)
> the mapping is still valid.
>
> I suppose our equiv is
> handle = bo_alloc()
> gpu_addr = vm_bind(handle,)
> gem_close(handle)
> is the gpu_addr still valid does the VM hold a reference on the kernel
> bo internally.

For Vulkan it looks like this is undefined and the above is not necessary:

"It is important to note that freeing a VkDeviceMemory object with
vkFreeMemory will not cause resources (or resource regions) bound to
the memory object to become unbound. Applications must not access
resources bound to memory that has been freed."
(32.7.6)


>
> Dave.
> >
> > Dave.
