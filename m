Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF06440EE93
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BAA6EA5D;
	Fri, 17 Sep 2021 01:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC686EA5D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:08:45 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so6170168pjn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+hDt9SS9+Ivp60C/yPZnAk2pdjFBXPm8T5e37pTLA0=;
 b=ViYkmRoDM1nJ4ntJj2cXhxlIedvC3kvFVuPdWU5xT4lv91xnuHkCNd9F3+EjXw/ACk
 2BJYwJpeWRf/6GVW1HRonkGqx/cSUpkbwgfrIxjR18OFprC8Mktb6JG6cgW6V4JkJM7H
 y2OqdnFaqorEI1BSZ8S/b8Y72qvjuBqc1crgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+hDt9SS9+Ivp60C/yPZnAk2pdjFBXPm8T5e37pTLA0=;
 b=rboilOKOgXrwKVcV6SfOI68eb4DMwaezSArgSC+07GleOqKE6FNv7KpmcyDVbY4CQC
 IyFswBnjyd+GbYdTXGJzTUCGNkp7kd64ChbnqpdRz4xyuiUkGQL32EjRAewki8xNsAf8
 oEg0UtJ2nIdd4r8840WLZcTJe7t1u0UZ+qYB3WPKQAUlbrVqy8Z1zvlS9a61S7vuULk2
 BHA+UDlxat3ZUJj+3m8yXIBX2krcLi8SaIiM9oZmpYYgWfwfBb8svahG2jUMB7cK/oe+
 bpv67nI+AmoE36WxF+T1urBEd6QQI/fT4HKu5+CHBgTYpyfVyDdr32ytP9mw/p+7/9qU
 d4lQ==
X-Gm-Message-State: AOAM533FkpDI0Mx7bIF6t3C9zAfvEj3U5uXMGzbt5FaJmbekcHFLFC8N
 EVjGM+kIDSERwf64+YfWYf8C7jtXT0WvtVhj
X-Google-Smtp-Source: ABdhPJyuvU/s0CN/VXf0FgTa0fcHqpv8yxDBXfGyTelyb4Cw/n62gFxe8bAQqt+okqhBBBgiX6M+mA==
X-Received: by 2002:a17:90a:2a8d:: with SMTP id
 j13mr9215642pjd.24.1631840925267; 
 Thu, 16 Sep 2021 18:08:45 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:dc20:9a88:c41:f0dd])
 by smtp.gmail.com with ESMTPSA id v4sm4215812pff.11.2021.09.16.18.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:08:44 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 00/12] Context types
Date: Thu, 16 Sep 2021 18:08:30 -0700
Message-Id: <20210917010842.503-1-gurchetansingh@chromium.org>
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

Version 2 of context types:

https://lists.oasis-open.org/archives/virtio-dev/202108/msg00141.html

Changes since RFC:
   * le32 info --> {u8 ring_idx + u8 padding[3]).
   * Max rings is now 64.

Changes since v1:
   * Document plan regarding context types + display combinations that
     need implicit sync in patch 9 commit message.

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
2.33.0.464.g1972c5931b-goog

