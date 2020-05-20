Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147351DB43D
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 14:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1667889E4C;
	Wed, 20 May 2020 12:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE24389E4C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:56:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n5so2764473wmd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P7TrALOTwf4EWx8NpXKCxUrqzxB04hCBQ+FGkGRvE2k=;
 b=F3+g+kLl13+qrnLV//tALuBPez6O/5AJKP7LOAtioXYfwWUHg0UGBH7J21B6RGTWiO
 46OcWyxGmWytGIQimmM6+9i6aErE0kC5bpjsjEVVQv7+xVz9Rs631mkCV7uueqdWVW0O
 RlUIlb4k+W95c6qp85rauR+j2QZ0XWUEA1TuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P7TrALOTwf4EWx8NpXKCxUrqzxB04hCBQ+FGkGRvE2k=;
 b=CcbMaLV9dV4Lm8w87KjOmv9BwzTMGEWTDOQCrRZ6V/cIkAI4YSBhxq5sebjLwletrP
 LurqUY6+AZm6+ChuRMcGoTY5vLf/yLfHBhfWqw76heEOsGqIrNyuhT+Z0uFH3BwW8CSr
 Mvlt0u5nPF5R4vLeh0xw2Coi23fM2xQcvX0wWY88HBic66rccV20bxRshhJVa1dLXHF8
 0C1GHQrVOUxrmkb+8jUOuTwBOeUhCT9MwhhMohkVJBFkoMCb3i/v5lwx5one4Ypgt8Sp
 OwcSE5QsCMG/eKb/feqPGxnq4w/Kj6hZ37uTm2J/FbZ4GoTkbVZqbuPfbvW1ViW5ROjI
 Tc/w==
X-Gm-Message-State: AOAM532E59Ir0sz3nKI+aKtqq9imHuFNbiCZojiiBVwesOan9Tl+oqKU
 KyMU4phIQLAHlogEyiduVuNQ3YjZ0NU=
X-Google-Smtp-Source: ABdhPJzjhauRHQyXGyx9deWXTLHCzdnhAg9FTMZx7JvRsA3bLdYazmzC+SEy4l+DNCGDBv1qdHNlLg==
X-Received: by 2002:a7b:caf1:: with SMTP id t17mr4310783wml.136.1589979359293; 
 Wed, 20 May 2020 05:55:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e21sm2919484wme.34.2020.05.20.05.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 05:55:58 -0700 (PDT)
Date: Wed, 20 May 2020 14:55:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200520125556.GY206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519100649.12053-1-ppaalanen@gmail.com>
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

On Tue, May 19, 2020 at 01:06:49PM +0300, Pekka Paalanen wrote:
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> Set up the expectations on how hot-unplugging a DRM device should look like to
> userspace.
> 
> Written by Daniel Vetter's request and largely based on his comments in IRC and
> from https://lists.freedesktop.org/archives/dri-devel/2020-May/265484.html .
> 
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> 
> ---
> 
> Disclaimer: I am a userspace developer writing for other userspace developers.
> I took some liberties in defining what should happen without knowing what is
> actually possible or what existing drivers already implement.
> ---
>  Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 56fec6ed1ad8..80db4abd2cbd 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -1,3 +1,5 @@
> +.. Copyright 2020 DisplayLink (UK) Ltd.
> +
>  ===================
>  Userland interfaces
>  ===================
> @@ -162,6 +164,79 @@ other hand, a driver requires shared state between clients which is
>  visible to user-space and accessible beyond open-file boundaries, they
>  cannot support render nodes.
>  
> +Device Hot-Unplug
> +=================
> +
> +.. note::
> +   The following is the plan. Implementation is not there yet
> +   (2020 May 13).
> +
> +Graphics devices (display and/or render) may be connected via USB (e.g.
> +display adapters or docking stations) or Thunderbolt (e.g. eGPU). An end
> +user is able to hot-unplug this kind of devices while they are being
> +used, and expects that the very least the machine does not crash. Any
> +damage from hot-unplugging a DRM device needs to be limited as much as
> +possible and userspace must be given the chance to handle it if it wants
> +to. Ideally, unplugging a DRM device still lets a desktop to continue
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
> +disappearance from the device removed uevent or in some cases specific
> +ioctls returning EIO.
> +
> +This goal raises at least the following requirements for the kernel and
> +drivers:
> +
> +- The kernel must not hang, crash or oops, no matter what userspace was
> +  in the middle of doing when the device disappeared.
> +
> +- All GPU jobs that can no longer run must have their fences
> +  force-signalled to avoid inflicting hangs to userspace.
> +
> +- KMS connectors must change their status to disconnected.
> +
> +- Legacy modesets and pageflips fake success.
> +
> +- Atomic commits, both real and TEST_ONLY, fake success.
> +
> +- Pending non-blocking KMS operations deliver the DRM events userspace
> +  is expecting.
> +
> +- If underlying memory disappears, the mmaps are replaced with harmless
> +  zero pages where access does not raise SIGBUS. Reads return zeros,
> +  writes are ignored.

Hm this is going to be expensive to implement, every write access would
cause a minor fault to catch it and throw it away. That's not going to be
fast is someone is caught trying to upload a giant texture at that moment
:-/

Could we go with just "Reads and writes will still completely without
errors, but have otherwise undefined behaviour". Then we could go with a
"single shared page for every drmfd" (to avoid leaks), set up with rw
permissions. That's dirt cheap, should be easy to implement and everything
stays fast.

> +
> +- dmabuf which point to memory that has disappeared are rewritten to
> +  point to harmless zero pages, similar to mmaps. Imports still succeed
> +  both ways: an existing device importing a dmabuf pointing to
> +  disappeared memory, and a disappeared device importing any dmabuf.

Same here about mmaps.

> +
> +- Render ioctls return EIO which is then handled in userspace drivers,
> +  e.g. Mesa, to have the device disappearance handled in the way
> +  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
> +  Vulkan: VK_ERROR_DEVICE_LOST; etc.)

I'd go further and spec that driver-specific render ioctl have driver
specific behaviour, but overall must not result in crashes and failures
expect as specified in the client apis you already list.

Some drivers might just go with an uevent and have no errors from ioctls,
some might only want to have an error on a very specific ioctl, some maybe
on all of them. Since no one except the hw specific userspace drivers will
have to deal with that I think best to only specify the outcome we want.

> +
> +Raising SIGBUS is not an option, because userspace cannot realistically
> +handle it.  Signal handlers are global, which makes them extremely
> +difficult to use correctly from libraries like Mesa produces. Signal
> +handlers are not composable, you can't have different handlers for GPU1
> +and GPU2 from different vendors, and a third handler for mmapped regular
> +files.  Threads cause additional pain with signal handling as well.

Hm maybe move that to the entire mmap discussion and why SIGBUS is a
really bad idea?

> +
> +Only after userspace has closed all relevant DRM device and dmabuf file
> +descriptors and removed all mmaps, the DRM driver can tear down its
> +instance for the device that no longer exists. If the same physical
> +device somehow comes back in the mean time, it shall be a new DRM
> +device.

Maybe we should add an explicit note that there's no guarantee about the
new chardev minor this new device will get, it could both inherit the
existing one (you can't open the old one anymore anyway) or get a new one?

Or does userspace want a guarantee, i.e. as long as there's still a handle
open kernel guarantees to not recycle the chardev minor (which is what we
currently do). In that case better to add that to your list of guarantees
above.

I think overall a good start for documenting the uapi expectations of
hotunplug, we'll definitely have to refine this as we go.

Cheers, Daniel

> +
>  .. _drm_driver_ioctl:
>  
>  IOCTL Support on Device Nodes
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
