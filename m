Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868343DB71C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 12:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919CA6F425;
	Fri, 30 Jul 2021 10:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD796F425
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 10:25:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g15so10688616wrd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=itLmpCobZx092FnizBv2imB4r/NkDQUsimNwnxJvIKA=;
 b=ZLzjMbnaVho/mrMkzuDjCur44UtP8Iv9Jo90aLReUhHAzACJkpYEBtCz5wWVCMc7Lv
 CjqQPq81oNf4lCCtOAaZWEVp125YwV0gxIUveKFKhQEZ4iEgDlQI7lPTZeBi+xUI87HQ
 TJAihcqaFyGf+Lwf9fxjOk8YIqESH2KHodc4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=itLmpCobZx092FnizBv2imB4r/NkDQUsimNwnxJvIKA=;
 b=Yn61P9XewJvYQuTyoeHqlay0FOhTlNwNyPS7QMV04VTkG7WOYj7VWTUbjlfrf2upQ/
 6QXJlioybi4f6pco6cJAkcrdE/7ZaGgvovfmgUUBCasl2socy324CzpyZRfNOksnmJGC
 XeLh3w6oJV41a7At2RG5jX1hl8XmhGrqZ+rqfn2sZY0bbBdtsBoEQelZFGPmO2ipfWU8
 sBQd68nov81zTOxtSizdFU72vQyr/pFYVI1/ODpGCQYbje27ssg4Q7ebpfnhgNnffZw9
 /pn8ptYJHJbxOGzYZbhswXe+6THYPKNrpntzQJiCO3VTC/Jx2KB2OnmyYCKbgRwv7TQ7
 KGOw==
X-Gm-Message-State: AOAM5327YlqAEjGAt6E0+n28h0zZCuM9r6wJw/ocFZM5lHF4EcUmIb20
 kKc2Hzid4biJvuFXOFmAA8uYRA==
X-Google-Smtp-Source: ABdhPJwzioEhiVA+gGQhmfRhQxftAvhEv+wzFm/SEQPcA3rAVZdvygUC6eEPxjGElmnfLgZ1ZJ5Zdg==
X-Received: by 2002:adf:db07:: with SMTP id s7mr2344331wri.106.1627640742184; 
 Fri, 30 Jul 2021 03:25:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l5sm1290225wrc.90.2021.07.30.03.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:25:41 -0700 (PDT)
Date: Fri, 30 Jul 2021 12:25:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Message-ID: <YQPTo0D5SZfX44dn@phenom.ffwll.local>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Tina Zhang <tina.zhang@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 01:16:55AM -0700, Vivek Kasireddy wrote:
> By separating the OUT_FENCE signalling from pageflip completion allows
> a Guest compositor to start a new repaint cycle with a new buffer
> instead of waiting for the old buffer to be free. 
> 
> This work is based on the idea/suggestion from Simon and Pekka.
> 
> This capability can be a solution for this issue:
> https://gitlab.freedesktop.org/wayland/weston/-/issues/514
> 
> Corresponding Weston MR:
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/668

Uh I kinda wanted to discuss this a bit more before we jump into typing
code, but well I guess not that much work yet.

So maybe I'm not understanding the problem, but I think the fundamental
underlying issue is that with KMS you can have at most 2 buffers
in-flight, due to our queue depth limit of 1 pending flip.

Unfortunately that means for virtual hw where it takes a few more
steps/vblanks until the framebuffer actually shows up on screen and is
scanned out, we suffer deeply. The usual fix for that is to drop the
latency and increase throughput, and have more buffers in-flight. Which
this patch tries to do.

Now I think where we go wrong here is that we're trying to hack this up by
defining different semantics for the out-fence and for the drm-event. Imo
that's wrong, they're both meant to show eactly the same thing:
- when is the new frame actually visible to the user (as in, eyeballs in a
  human head, preferrably, not the time when we've handed the buffer off
  to the virtual hw)
- when is the previous buffer no longer being used by the scanout hw

We do cheat a bit right now in so far that we assume they're both the
same, as in, panel-side latency is currently the compositor's problem to
figure out.

So for virtual hw I think the timestamp and even completion really need to
happen only when the buffer has been pushed through the entire
virtualization chain, i.e. ideally we get the timestamp from the kms
driver from the host side. Currently that's not done, so this is most
likely quite broken already (virtio relies on the no-vblank auto event
sending, which definitely doesn't wait for anything, or I'm completely
missing something).

I think instead of hacking up some ill-defined 1.5 queue depth support,
what we should do is support queue depth > 1 properly. So:

- Change atomic to support queue depth > 1, this needs to be a per-driver
  thing due to a bunch of issues in driver code. Essentially drivers must
  never look at obj->state pointers, and only ever look up state through
  the passed-in drm_atomic_state * update container.

- Aside: virtio should loose all it's empty hooks, there's no point in
  that.

- We fix virtio to send out the completion event at the end of this entire
  pipeline, i.e. virtio code needs to take care of sending out the
  crtc_state->event correctly.

- We probably also want some kind of (maybe per-crtc) recommended queue
  depth property so compositors know how many buffers to keep in flight.
  Not sure about that.

It's a bit more work, but also a lot less hacking around infrastructure in
dubious ways.

Thoughts?

Cheers, Daniel

> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Michel Dänzer <michel@daenzer.net>
> Cc: Tina Zhang <tina.zhang@intel.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> 
> Vivek Kasireddy (4):
>   drm: Add a capability flag to support deferred out_fence signalling
>   virtio-gpu uapi: Add VIRTIO_GPU_F_OUT_FENCE feature
>   drm/virtio: Add VIRTIO_GPU_CMD_RESOURCE_OUT_FENCE cmd
>   drm/virtio: Probe and implement VIRTIO_GPU_F_OUT_FENCE feature
> 
>  drivers/gpu/drm/drm_file.c               | 11 +++---
>  drivers/gpu/drm/drm_ioctl.c              |  3 ++
>  drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
>  drivers/gpu/drm/virtio/virtgpu_drv.c     |  1 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++++
>  drivers/gpu/drm/virtio/virtgpu_fence.c   |  9 +++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c     | 10 ++++--
>  drivers/gpu/drm/virtio/virtgpu_plane.c   | 44 +++++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c      | 17 +++++++++
>  include/drm/drm_mode_config.h            |  9 +++++
>  include/uapi/drm/drm.h                   |  1 +
>  include/uapi/linux/virtio_gpu.h          | 12 +++++++
>  12 files changed, 117 insertions(+), 7 deletions(-)
> 
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
