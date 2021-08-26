Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236493F804D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F476E47B;
	Thu, 26 Aug 2021 02:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8416E47B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:04:58 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id e1so774526plt.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ajCOl6yHGho0BEiRDbnOPNHUTJrTamIpc423knAj518=;
 b=lVodEgTZQHvACgxEUa+//0pOf2p5kjhpH1xxymuSJZ73/ivS/PkzABGE2uLASC+FU1
 Yu18dF06MAL8G2a21JbPmqVzPHtRDd+TxCgouOxKsCecDL/LjRRVq073PzVFC9gZJT3k
 71T8WOq12ruZKN1qUHSyPIurH+IpQRGoNUjaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ajCOl6yHGho0BEiRDbnOPNHUTJrTamIpc423knAj518=;
 b=Vgck3icc68LlsnO7uspU1eaUCo2jaL4RmniyEFpouw2+z2bsmyqvHlZ6e1pnMbIwzP
 na+xGI5gAVWDlq2UHnn9uj6tOZO7gWGFz2wbKC6FE122iZSJy7fffXCrsAXkpImZxtng
 UFkx8JlN8pBvpzqQBXJiO4PkNwYMUNx3cusasCXxTGiaFNTwdiFVcwJ8KuZrDQGoO4cp
 UBT/tsaAngl0gAJo85Jv6PbfENu/nUxjLOJoQItggIevn1faCvIfibp/bXezXWzHCxyl
 8BAAqtAib6lAigIHlk8syPYxxK9hmR2YBhxUF6lf6bemvm1ldtUyyNC4cgyIA2cER8xG
 cUtA==
X-Gm-Message-State: AOAM532XP6HeeE74LmjVsW5PRBkZ2U4kqz3HujaJK9pp8uaZ6/QxCyZo
 VagOCCvgQx/089x9GnQEJ1A3v29QEXOo2A==
X-Google-Smtp-Source: ABdhPJxobYO695VB8jb5mnGTCtpGJpQqdCbXjCzpa57v60J4ThRsZCz2y/+Np5xRvnZBPyVEIu2SyQ==
X-Received: by 2002:a17:90a:3e84:: with SMTP id
 k4mr13976916pjc.68.1629943498061; 
 Wed, 25 Aug 2021 19:04:58 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:faed:1e29:6bf7:3354])
 by smtp.gmail.com with ESMTPSA id o10sm704987pjg.34.2021.08.25.19.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:04:57 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [RFC PATCH 00/12] -- 2021: The year of the context type
Date: Wed, 25 Aug 2021 19:04:43 -0700
Message-Id: <20210826020455.1081-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Dear all,

I'm excited to share with you a ground-breaking and dare I say it even
shocking discovery in graphics virtualization.

The critics are raving -- many keen observers of VM graphics are
proclaiming 2021 to be "the year of the context type", eclipsing the
revolutionary blob resource of 2020.

The hype is justified; context types makes virtio-gpu 3D extensible,
opening the door to new designs and APIs.  Traditionally, virtio-gpu
3D is designed around the Gallium Virgl protocol and the host-side
virglrenderer implementation (as reflected with VIRTIO_GPU_F_VIRGL).

With VIRTIO_GPU_F_VIRGL + VIRTIO_GPU_F_CONTEXT_INIT, GPU/display
virtualization defined by the context type is possible.  It's entirely
possible the virglrenderer project isn't available on the host in this
scenario.

For example, the "gfxstream" [a] library is designed around (mostly) 1:1
auto-generated encode/decode of rendering commands.  This is in contrast
to virgl, which has a Gallium intermediate layer that can be complex.
The Address Space Graphics (ASG) ring-buffer is used to stream these APIs
while minimizing syscall and vm-exit overhead (somewhat like io_uring).

The gfxstream library has been supporting GLES virtualization since 2011,
and CTS-compliant Vulkan virtualization since 2018.

gfxstream is used in a wide range of products, from the Cuttlefish [b] to
the Android Studio emulator [c].

With context types, both virglrenderer and gfxstream can formally use
virtio-gpu as the transport [d].

                      GFXSTREAM DESIGN
   _________            __________          __________
  |         |          |          |        |          |
  | RENDER  |          |  GLES    |        | VULKAN   |
  | CONTROL |          |  ENCODER |        | CEREAL   |     GUEST
  | ENCODER |          |          |        | ENCODER  |     ENCODERS
  |_________|          |__________|        |__________|
       ^                    ^                    ^
       |                    |                    | <--------- ASG ring
       |                    |                    |
 - - - | - - - - - - - - -  | - - - - - - - - -  | - - - - - virtio-gpu
       |                    |                    |
   ____v____            ____v_____          _____v____
  |         |          |          |        |          |
  | RENDER  |          |  GLES    |        | VULKAN   |
  | CONTROL |          |  DECODER |        | CEREAL   |     GUEST
  | DECODER |          |          |        | DECODER  |     DECODERS
  |_________|          |__________|        |__________|
  |         |          |          |        |          |     GRAPHICS
  | EGL/GLX |          |  GLES    |        |  Vulkan  |     LIBRARIES
  |_________|          |__________|        |__________|

Indeed, context types are versatile enough to support display
virtualization too [e].  For example, one can passthrough guest Wayland
commands to enable seamless windowing.

1) Weston [guest] -> DRM/KMS virtio-gpu 2d -> VMM virtgpu 2d -> compositor
2) Sommelier [guest] -> virtio-gpu 3d -> VMM virtgpu context -> compositor

(1) is traditionally used, but (2) avoids API translations and has more
features.  Wayland passthrough has been used laptops for many years.  Here
are some videos on the subject:

https://www.youtube.com/watch?v=WwrXqDERFm8
https://www.youtube.com/watch?v=EkNBsBx501Q

With context types, seamless wayland windowing will be available to a wider
audience.

For virglrenderer, context types enable distinction between the virgl [f]
and the auto-generated "Venus" vulkan protocols [g].

In the future, GPU compute APIs or even vendor-specific protocols can use
the context type mechanism too.

Context types have been tested with crosvm and the feature is available on
the main branch.

[a] https://android.googlesource.com/device/generic/vulkan-cereal/
[b] https://source.android.com/setup/create/cuttlefish-ref-gpu
[c] https://developer.android.com/studio/run/emulator
[d] https://android.googlesource.com/device/generic/goldfish-opengl/+/refs/heads/master/system/vulkan_enc/ResourceTracker.cpp#1052
[e] https://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/virtualization/virtgpu_channel.cc#221
[f] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7712
[g] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/virtio/vulkan/vn_renderer_virtgpu.c#L63

Anthoine Bourgeois (2):
  drm/virtio: implement context init: probe for feature
  drm/virtio: implement context init: support init ioctl

Gurchetan Singh (10):
  virtio-gpu api: multiple context types with explicit initialization
  drm/virtgpu api: create context init feature
  drm/virtio: implement context init: track valid capabilities in a mask
  drm/virtio: implement context init: track {ring_idx, emit_fence_info}
    in virtio_gpu_fence
  drm/virtio: implement context init: plumb {base_fence_ctx, ring_idx}
    to virtio_gpu_fence_alloc
  drm/virtio: implement context init: stop using drv->context when
    creating fence
  drm/virtio: implement context init: allocate an array of fence
    contexts
  drm/virtio: implement context init: handle
    VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
  drm/virtio: implement context init: add virtio_gpu_fence_event
  drm/virtio: implement context init: advertise feature to userspace

 drivers/gpu/drm/virtio/virtgpu_debugfs.c |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  44 ++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  28 +++-
 drivers/gpu/drm/virtio/virtgpu_fence.c   |  30 +++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   | 194 +++++++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  26 ++-
 drivers/gpu/drm/virtio/virtgpu_plane.c   |   3 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c      |  19 +--
 include/uapi/drm/virtgpu_drm.h           |  27 ++++
 include/uapi/linux/virtio_gpu.h          |  18 ++-
 10 files changed, 354 insertions(+), 36 deletions(-)

-- 
2.33.0.259.gc128427fd7-goog

