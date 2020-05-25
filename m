Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A201E1091
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 16:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6181989E3F;
	Mon, 25 May 2020 14:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D1D89E3F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 14:30:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c3so12989935wru.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ULuR+VDWWAUxdZJj1woUbpgYUX9tOrdUKOtR2YKAMJI=;
 b=UJUgRcTXOgQwVkkwq45OOOFQGGNY1ELwWn/We9VlfQUCFz+8l85jh6Ex9hxrOTYrRf
 aEKiV362p+AK1n/yOpWAMb7PBPRnM2VipldF2L3YuIz4S34cnl37WuGDsbvRaLekhC+i
 xxhBnF+BQwbsrYWXb4f4QwHhOE8j9dGeA2qnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ULuR+VDWWAUxdZJj1woUbpgYUX9tOrdUKOtR2YKAMJI=;
 b=XTpsp8iT1mgg/MgItVsKqM+APSS3zTvKa+63DmajP10XUq+A0w6vTIsLvEFy7oAJhp
 TUvDAB6n9A8CSF2ieo4usIjIqkp7TszBanaLqJasWU8vFldDK48ZrAb4icyrs37QwmWC
 fM+Vnm/KBf8vdslpEjbiCPSkdw5ZU+0q4/YItYdXbmc2VaqeB6urZ7/R9MEZu9wQhpLc
 AeV1UkweijcOuVgmhU8Gm4CIUuyyCUdLfavYNkNuBEvLR4mK/A8N69FnkJcCN1Tx6tqO
 tMDj1fUY9O8wBIDEvmAd1rA5pvBbtP7two0pr53Ln9G5MFLF0yJBxGA/ewEvPftpHZEQ
 3hKw==
X-Gm-Message-State: AOAM531EjOKVWRMNhnWIYJEjjrpi9bujxULuVSK0//iXD4R9CqfREI1u
 BsyKsG/sr/qNz+2t2+GgWyGJag==
X-Google-Smtp-Source: ABdhPJxOYeIkrLMKjRd+nb0Z1VfzCC43Fe6RUubr7EZpGKQzt0vMSIRMohqaJrBdBlbsGvp7pGoqQg==
X-Received: by 2002:a5d:6943:: with SMTP id r3mr15115526wrw.113.1590417020430; 
 Mon, 25 May 2020 07:30:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a16sm3685689wrx.8.2020.05.25.07.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:30:19 -0700 (PDT)
Date: Mon, 25 May 2020 16:30:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2] drm/doc: device hot-unplug for userspace
Message-ID: <20200525143017.GF206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200525124614.16339-1-ppaalanen@gmail.com>
 <d2acce4d-8e5f-a335-24e6-e454a7fc2436@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2acce4d-8e5f-a335-24e6-e454a7fc2436@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 25, 2020 at 09:51:30AM -0400, Andrey Grodzovsky wrote:
> On 5/25/20 8:46 AM, Pekka Paalanen wrote:
> 
> > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > 
> > Set up the expectations on how hot-unplugging a DRM device should look like to
> > userspace.
> > 
> > Written by Daniel Vetter's request and largely based on his comments in IRC and
> > from https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.html&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Cc9676f35bbdf4d5a052808d800a9b517%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637260076178891269&amp;sdata=tbOTr7TfESohEgWspomM1sbMq4U4n7bOvdS6JlYifmM%3D&amp;reserved=0 .
> > 
> > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Simon Ser <contact@emersion.fr>
> > 
> > ---
> > 
> > v2:
> > - mmap reads/writes undefined (danvet)
> > - make render ioctl behaviour driver-specific (danvet)
> > - restructure the mmap paragraphs (danvet)
> > - chardev minor notes (Simon)
> > - open behaviour (danvet)
> > - DRM leasing behaviour (danvet)
> > - added links
> > 
> > Disclaimer: I am a userspace developer writing for other userspace developers.
> > I took some liberties in defining what should happen without knowing what is
> > actually possible or what existing drivers already implement.
> > ---
> >   Documentation/gpu/drm-uapi.rst | 102 +++++++++++++++++++++++++++++++++
> >   1 file changed, 102 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index 56fec6ed1ad8..520b8e640ad1 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -1,3 +1,5 @@
> > +.. Copyright 2020 DisplayLink (UK) Ltd.
> > +
> >   ===================
> >   Userland interfaces
> >   ===================
> > @@ -162,6 +164,106 @@ other hand, a driver requires shared state between clients which is
> >   visible to user-space and accessible beyond open-file boundaries, they
> >   cannot support render nodes.
> > +Device Hot-Unplug
> > +=================
> > +
> > +.. note::
> > +   The following is the plan. Implementation is not there yet
> > +   (2020 May).
> > +
> > +Graphics devices (display and/or render) may be connected via USB (e.g.
> > +display adapters or docking stations) or Thunderbolt (e.g. eGPU). An end
> > +user is able to hot-unplug this kind of devices while they are being
> > +used, and expects that the very least the machine does not crash. Any
> > +damage from hot-unplugging a DRM device needs to be limited as much as
> > +possible and userspace must be given the chance to handle it if it wants
> > +to. Ideally, unplugging a DRM device still lets a desktop to continue
> > +running, but that is going to need explicit support throughout the whole
> > +graphics stack: from kernel and userspace drivers, through display
> > +servers, via window system protocols, and in applications and libraries.
> 
> So to support all the requirements in this document only kernel changes
> should be enough and no changes are required from user mode part of the
> stack ?
> 
> > +
> > +Other scenarios that should lead to the same are: unrecoverable GPU
> > +crash, PCI device disappearing off the bus, or forced unbind of a driver
> > +from the physical device.
> > +
> > +In other words, from userspace perspective everything needs to keep on
> > +working more or less, until userspace stops using the disappeared DRM
> > +device and closes it completely. Userspace will learn of the device
> > +disappearance from the device removed uevent
> 
> 
> Is this uevent already implemented ? Can you point me to the code ?
> 
> 
> > or in some cases
> > +driver-specific ioctls returning EIO.
> > +
> > +Only after userspace has closed all relevant DRM device and dmabuf file
> > +descriptors and removed all mmaps, the DRM driver can tear down its
> > +instance for the device that no longer exists. If the same physical
> > +device somehow comes back in the mean time, it shall be a new DRM
> > +device.
> > +
> > +Similar to PIDs, chardev minor numbers are not recycled immediately. A
> > +new DRM device always picks the next free minor number compared to the
> > +previous one allocated, and wraps around when minor numbers are
> > +exhausted.
> > +
> > +Requirements for UAPI
> > +---------------------
> > +
> > +The goal raises at least the following requirements for the kernel and
> > +drivers:
> > +
> > +- The kernel must not hang, crash or oops, no matter what userspace was
> > +  in the middle of doing when the device disappeared.
> > +
> > +- All GPU jobs that can no longer run must have their fences
> > +  force-signalled to avoid inflicting hangs to userspace.
> > +
> > +- KMS connectors must change their status to disconnected.
> > +
> > +- Legacy modesets and pageflips fake success.
> > +
> > +- Atomic commits, both real and TEST_ONLY, fake success.
> > +
> > +- Pending non-blocking KMS operations deliver the DRM events userspace
> > +  is expecting.
> 
> 
> The 4 points above refer to mode setting/display attached card and are
> irrelevant for secondary GPU (e.g. DRI-PRIME scenario) or no display system
> in general. Maybe we can somehow highlight this in the document and I on the
> implementing side can then decide as a first step to concentrate on
> implementing the non display case as a first step or the only step. In
> general and correct me if I am wrong, render only GPUs (or compute only) are
> the majority of cases where you would want to be able to detach/attach GPU
> on the fly (e.g attach stronger secondary graphic card to a laptop to get
> high performance in a game or add/remove a GPU to/from a compute cluster)

Yeah maybe splitting this up into kms section, and rendering/cross driver
section (the dma-buf/fence stuff is relevant for both display and
rendering) would make some sense.
-Daniel

> 
> Andrey
> 
> 
> > +
> > +- dmabuf which point to memory that has disappeared will continue to
> > +  be successfully imported if it would have succeeded before the
> > +  disappearance.
> > +
> > +- Attempting to import a dmabuf to a disappeared device will succeed if
> > +  it would have succeeded without the disappearance.
> > +
> > +- Some userspace APIs already define what should happen when the device
> > +  disappears (OpenGL, GL ES: `GL_KHR_robustness`_; `Vulkan`_:
> > +  VK_ERROR_DEVICE_LOST; etc.). DRM drivers are free to implement this
> > +  behaviour the way they see best, e.g. returning failures in
> > +  driver-specific ioctls and handling those in userspace drivers, or
> > +  rely on uevents, and so on.
> > +
> > +- open() on a device node whose underlying device has disappeared will
> > +  fail.
> > +
> > +- Attempting to create a DRM lease on a disappeared DRM device will
> > +  fail. Existing DRM leases remain.
> > +
> > +.. _GL_KHR_robustness: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.khronos.org%2Fregistry%2FOpenGL%2Fextensions%2FKHR%2FKHR_robustness.txt&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Cc9676f35bbdf4d5a052808d800a9b517%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637260076178891269&amp;sdata=m%2FneRusoe6qGVU8Edk%2FncaD7eSJZXtPnA1IqLr7k%2Bos%3D&amp;reserved=0
> > +.. _Vulkan: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.khronos.org%2Fvulkan%2F&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Cc9676f35bbdf4d5a052808d800a9b517%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637260076178901265&amp;sdata=WsfLduUBzRKlybOJb5PQViBWYu5DgleEeycmf76l3UU%3D&amp;reserved=0
> > +
> > +Requirements for memory maps
> > +----------------------------
> > +
> > +Memory maps have further requirements. If the underlying memory
> > +disappears, the mmap is modified such that reads and writes will still
> > +complete successfully but the result is undefined. This applies to both
> > +userspace mmap()'d memory and memory pointed to by dmabuf which might be
> > +mapped to other devices.
> > +
> > +Raising SIGBUS is not an option, because userspace cannot realistically
> > +handle it.  Signal handlers are global, which makes them extremely
> > +difficult to use correctly from libraries like those that Mesa produces.
> > +Signal handlers are not composable, you can't have different handlers
> > +for GPU1 and GPU2 from different vendors, and a third handler for
> > +mmapped regular files.  Threads cause additional pain with signal
> > +handling as well.
> > +
> >   .. _drm_driver_ioctl:
> >   IOCTL Support on Device Nodes

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
