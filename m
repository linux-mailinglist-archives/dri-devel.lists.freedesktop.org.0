Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8254042BE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DA36E408;
	Thu,  9 Sep 2021 01:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BE36E3F2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:20 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id j16so339954pfc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GNmySw4shAb2lrXbxm8pa7zgjEZcnRQT9YeNz3m4ru0=;
 b=jdNGTFsvdtrlvCKIKo47GVvEpT/HQ470dmDmLNBGQywN2cmzIVNbSCQitxlgXmNwQN
 YnAyCW4AsAgx+iDer8sHMWMmymuqePqfauqdaToX59EnrZGsjMlUg1/aYqyB5m93Sr+3
 7O1RFfr6XtbcSeiP8mN87E2oZdgpKaGEwAzyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GNmySw4shAb2lrXbxm8pa7zgjEZcnRQT9YeNz3m4ru0=;
 b=eW32yarPF5mmyU7D6UhoHE2WrE7fxL/oxVXRrbmjJQ1eEN4G4mWRpMk4m8TowyHdS8
 cksvf34ygH0VmgzWwZDaQTnfJWuCB+Svcf6U4R4rPIluYQhgaUPzYjvwIzMGWynAJULZ
 wM2YWQoeJUq0S0kML7LiS9f4eMR9d/Ha6hKl7+OZyh2cqXHpjXPE3lV3jRa5u7ngIrXn
 dcW3AJO/XQffkCoPyecSosXZwRlCZMu17VezmKfJJN3R0BT4rxjTvLGbXBdZPEpcgmw9
 XGPGeVT0JMVewsr74I6oe9wu9/+lR3p5wwi1pW5TmFuxqKOW0EgSW6w9pAo7wIZQ1zz4
 vZdA==
X-Gm-Message-State: AOAM532CXdHGfP4AXd24F1ebNu/1axG1JtbGQ7cvnVCJKoGLE8IPBqp5
 yBUNa+XWy7rIL5TV8393cM/C7UylOiuBdpUw
X-Google-Smtp-Source: ABdhPJzcParYV4QKdn3QRprcAMLyK869lNeOfInYlZeaMPNB6v5L+3Ae+0Bx+PkLZ/R+zoGZcSi1tQ==
X-Received: by 2002:a62:7c05:0:b0:40b:5d8f:6a56 with SMTP id
 x5-20020a627c05000000b0040b5d8f6a56mr375382pfc.74.1631151440055; 
 Wed, 08 Sep 2021 18:37:20 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:19 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 00/12] Context types
Date: Wed,  8 Sep 2021 18:37:05 -0700
Message-Id: <20210909013717.861-1-gurchetansingh@chromium.org>
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

Version 1 of context types:

https://lists.oasis-open.org/archives/virtio-dev/202108/msg00141.html

Changes since RFC:
   * le32 info --> {u8 ring_idx + u8 padding[3]).
   * Max rings is now 64.

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
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   | 195 +++++++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  26 ++-
 drivers/gpu/drm/virtio/virtgpu_plane.c   |   3 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c      |  19 +--
 include/uapi/drm/virtgpu_drm.h           |  27 ++++
 include/uapi/linux/virtio_gpu.h          |  18 ++-
 10 files changed, 355 insertions(+), 36 deletions(-)

-- 
2.33.0.153.gba50c8fa24-goog

