Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D331F57FC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 17:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5216E5CF;
	Wed, 10 Jun 2020 15:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E649E6E5CF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 15:40:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r9so2247585wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mhJoZlLbM7m2J7JuYmzfaPRAeR2DECuSLV6DjE0p7vM=;
 b=U2NFhiwIJZnhIyrUvLQYbOCMsQGMqJe/CfD4ryovW782pARIPMQMXjzf4osoGMkFEz
 rvIqz1GsZudv2JO0uzn+McisYiMpjAQmYDxH0RSgaFwRmW5Yrv5LBwnYpBvuQe0j2TNE
 XJ59LO+mpHpxOT4dmvceimJdQXvXNnROdXeLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mhJoZlLbM7m2J7JuYmzfaPRAeR2DECuSLV6DjE0p7vM=;
 b=q6WJ/zFr64T0jyK84YmHEeJFb1paNSrLdDswB1+aCXEX0kvTazahssJKNvfsGvaDQz
 x0pOBBsa7PtZNmEIAKu8MYP2BWQkzZF3yD+496mFyDTSnCQ/l/grHI+A6SSoE80DHDin
 raTfSwTTQ3Z/dK4mu1D+MWSuhz9w92dt4UeK2SZZz3mZElZlOYmQ+QOlnp9llMayT73v
 5gQFo71nZLd2uE6kC5/CrJkS+zvtHZ7wPGoFcUsUKYYq/o9U1gyj+OQcnaCTwIxWGcTW
 ZbZ5ib0DVJDQRZBD0kIzsmJfH5P3mOBf+vniuN/Fccdyq55EWZZGKkqqHm8a5LzjzsnY
 giqQ==
X-Gm-Message-State: AOAM533ibug2BlzFybRsARkZ3swYHKU9vgz9/Q2J4jQ41E94GC2LiVMw
 i6vkHakreMhCORLx1zQ5X6DLxw==
X-Google-Smtp-Source: ABdhPJx2DaE4J322635bLGDfedfn6aRMA8A05oMHy3mJ3OACTRsg8YBJHt+YxaHzDE4FMjhAqhG/ug==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr3874353wmb.61.1591803651434; 
 Wed, 10 Jun 2020 08:40:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 138sm139464wma.23.2020.06.10.08.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 08:40:50 -0700 (PDT)
Date: Wed, 10 Jun 2020 17:40:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v3] drm/doc: device hot-unplug for userspace
Message-ID: <20200610154048.GB20149@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200601143203.14666-1-ppaalanen@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601143203.14666-1-ppaalanen@gmail.com>
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

On Mon, Jun 01, 2020 at 05:32:03PM +0300, Pekka Paalanen wrote:
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> Set up the expectations on how hot-unplugging a DRM device should look like to
> userspace.
> 
> Written by Daniel Vetter's request and largely based on his comments in IRC and
> from https://lists.freedesktop.org/archives/dri-devel/2020-May/265484.html .
> 
> A related Wayland protocol change proposal is at
> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/35
> 
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Simon Ser <contact@emersion.fr>
> 
> ---
> 
> v3:
> - update ENODEV doc (Daniel)
> - clarify existing vs. new mmaps (Andrey)
> - split into KMS and render/cross sections (Andrey, Daniel)
> - open() returns ENXIO (open(2) man page)
> - ioctls may return ENODEV (Andrey, Daniel)
> - new wayland-protocols MR
> 
> v2:
> - mmap reads/writes undefined (Daniel)
> - make render ioctl behaviour driver-specific (Daniel)
> - restructure the mmap paragraphs (Daniel)
> - chardev minor notes (Simon)
> - open behaviour (Daniel)
> - DRM leasing behaviour (Daniel)
> - added links
> 
> Disclaimer: I am a userspace developer writing for other userspace developers.
> I took some liberties in defining what should happen without knowing what is
> actually possible or what existing drivers already implement.
> ---
>  Documentation/gpu/drm-uapi.rst | 114 ++++++++++++++++++++++++++++++++-
>  1 file changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 56fec6ed1ad8..db56c681b648 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -1,3 +1,5 @@
> +.. Copyright 2020 DisplayLink (UK) Ltd.
> +
>  ===================
>  Userland interfaces
>  ===================
> @@ -162,6 +164,116 @@ other hand, a driver requires shared state between clients which is
>  visible to user-space and accessible beyond open-file boundaries, they
>  cannot support render nodes.
>  
> +Device Hot-Unplug
> +=================
> +
> +.. note::
> +   The following is the plan. Implementation is not there yet
> +   (2020 May).
> +
> +Graphics devices (display and/or render) may be connected via USB (e.g.
> +display adapters or docking stations) or Thunderbolt (e.g. eGPU). An end
> +user is able to hot-unplug this kind of devices while they are being
> +used, and expects that the very least the machine does not crash. Any
> +damage from hot-unplugging a DRM device needs to be limited as much as
> +possible and userspace must be given the chance to handle it if it wants
> +to. Ideally, unplugging a DRM device still lets a desktop to continue

I think it's "continue to run" not "to continue running". But not native
speaker either.

> +running, but that is going to need explicit support throughout the whole
> +graphics stack: from kernel and userspace drivers, through display
> +servers, via window system protocols, and in applications and libraries.
> +
> +Other scenarios that should lead to the same are: unrecoverable GPU
> +crash, PCI device disappearing off the bus, or forced unbind of a driver
> +from the physical device.
> +
> +In other words, from userspace perspective everything needs to keep on
> +working more or less, until userspace stops using the disappeared DRM
> +device and closes it completely. Userspace will learn of the device
> +disappearance from the device removed uevent, ioctls returning ENODEV
> +(or driver-specific ioctls returning driver-specific things), or open()
> +returning ENXIO.
> +
> +Only after userspace has closed all relevant DRM device and dmabuf file
> +descriptors and removed all mmaps, the DRM driver can tear down its
> +instance for the device that no longer exists. If the same physical
> +device somehow comes back in the mean time, it shall be a new DRM
> +device.
> +
> +Similar to PIDs, chardev minor numbers are not recycled immediately. A
> +new DRM device always picks the next free minor number compared to the
> +previous one allocated, and wraps around when minor numbers are
> +exhausted.
> +
> +The goal raises at least the following requirements for the kernel and
> +drivers.
> +
> +Requirements for KMS UAPI
> +-------------------------
> +
> +- KMS connectors must change their status to disconnected.
> +
> +- Legacy modesets and pageflips, and atomic commits, both real and
> +  TEST_ONLY, and any other ioctls either fail with ENODEV or fake
> +  success.
> +
> +- Pending non-blocking KMS operations deliver the DRM events userspace
> +  is expecting. This applies also to ioctls that faked success.
> +
> +- open() on a device node whose underlying device has disappeared will
> +  fail with ENXIO.
> +
> +- Attempting to create a DRM lease on a disappeared DRM device will
> +  fail with ENODEV. Existing DRM leases remain and work as listed
> +  above.
> +
> +Requirements for Render and Cross-Device UAPI
> +---------------------------------------------
> +
> +- All GPU jobs that can no longer run must have their fences
> +  force-signalled to avoid inflicting hangs to userspace.

I think "on userspace" not "to userspace"

> +  The associated error code is ENODEV.
> +
> +- Some userspace APIs already define what should happen when the device
> +  disappears (OpenGL, GL ES: `GL_KHR_robustness`_; `Vulkan`_:
> +  VK_ERROR_DEVICE_LOST; etc.). DRM drivers are free to implement this
> +  behaviour the way they see best, e.g. returning failures in
> +  driver-specific ioctls and handling those in userspace drivers, or
> +  rely on uevents, and so on.
> +
> +- dmabuf which point to memory that has disappeared will either fail to
> +  import with ENODEV or continue to be successfully imported if it would
> +  have succeeded before the disappearance. See also about memory maps
> +  below for already imported dmabufs.
> +
> +- Attempting to import a dmabuf to a disappeared device will either fail
> +  with ENODEV or succeed if it would have succeeded without the
> +  disappearance.
> +
> +- open() on a device node whose underlying device has disappeared will
> +  fail with ENXIO.
> +
> +.. _GL_KHR_robustness: https://www.khronos.org/registry/OpenGL/extensions/KHR/KHR_robustness.txt
> +.. _Vulkan: https://www.khronos.org/vulkan/
> +
> +Requirements for Memory Maps
> +----------------------------
> +
> +Memory maps have further requirements that apply to both existing maps
> +and maps created after the device has disappeared. If the underlying
> +memory disappeared, the map is created or modified such that reads and
> +writes will still complete successfully but the result is undefined.
> +This applies to both userspace mmap()'d memory and memory pointed to by
> +dmabuf which might be mapped to other devices (cross-device dmabuf
> +imports).
> +
> +Raising SIGBUS is not an option, because userspace cannot realistically
> +handle it. Signal handlers are global, which makes them extremely
> +difficult to use correctly from libraries like those that Mesa produces.
> +Signal handlers are not composable, you can't have different handlers
> +for GPU1 and GPU2 from different vendors, and a third handler for
> +mmapped regular files. Threads cause additional pain with signal
> +handling as well.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Only gap I could spot is additional other fd that float around, like
dma-buf, sync_file, drm_syncobj and stuff like that. I guess we can figure
these out as we go, which shouldn't be a big problem since this entire
document is very much work in progres.

Thanks for pushing this forward.
-Daniel


> +
>  .. _drm_driver_ioctl:
>  
>  IOCTL Support on Device Nodes
> @@ -199,7 +311,7 @@ EPERM/EACCES:
>          difference between EACCES and EPERM.
>  
>  ENODEV:
> -        The device is not (yet) present or fully initialized.
> +        The device is not anymore present or is not yet fully initialized.
>  
>  EOPNOTSUPP:
>          Feature (like PRIME, modesetting, GEM) is not supported by the driver.
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
