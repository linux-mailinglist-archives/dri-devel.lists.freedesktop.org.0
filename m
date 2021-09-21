Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F47413DEA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8E46E5A4;
	Tue, 21 Sep 2021 23:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C086E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:27 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id me1so700534pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nb2betxaLVN0cBw2CxNyEC7UlfrqgC+s8LRd7PfOYJM=;
 b=lAwYA2rRP4jS8cTooAI1PieyA9NXPQDHekOgQYil9Rnq0xsxBkhO/PIc/tPy0wfqtx
 xkBzNF7pawW1vs6nHOqP97ogmaf64AAkX2WZfg4Z41S1SSYNOe6pTyJrvbF/F0GsfDOg
 69sDXLJdblab+kP1G9jXLHPOKGeZE+BUrO8LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nb2betxaLVN0cBw2CxNyEC7UlfrqgC+s8LRd7PfOYJM=;
 b=0lXbBdvwJ0ZuCAwwgx9BQx+6drYvH3+7wAHeAV1mTzIVWBhQz7dygHyTbSiZ1XpXJl
 6MH77n37AxpxTawto4opeTYZ7cDQrImtpxw+z8+HGIskzU47W6CgbEz2Vigt9cFEt15F
 jarZBTGXi25IqcwzZkLSKgYV2ifo+Ml9EKBQH7cz7X1pjnG0BNqrBz8pr4oFd2VevVfo
 DWdaVAYpvbvrUj7R5Wy+CcEaZKnwQjxCBTNigBvX63XpADctWJlNlqAufYay6j8s/dUV
 YGnfFOXn9wU4qn4KWApUO/9a9WMqv7W9KMegBwmaTSOinSr5ACx4vmf+xjyIWGz1ic3l
 kO+w==
X-Gm-Message-State: AOAM5304ROzLPlRc1oGUkSYi/e7tMbJXb93Oc1ysh6eNbuEtrGXDs6ps
 PYiDFkqtRWGLvwup2VyBl8d6mweewQVmvw==
X-Google-Smtp-Source: ABdhPJzpANLI9q3I7OJm9+AEBBPKIRE8gnzHuHxl+Sjv72i+OkOM0gBZL1qy60ZukTgVBkxLn+GIOg==
X-Received: by 2002:a17:90a:1009:: with SMTP id
 b9mr7941871pja.184.1632266426868; 
 Tue, 21 Sep 2021 16:20:26 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:26 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 00/12] Context types, v3
Date: Tue, 21 Sep 2021 16:20:12 -0700
Message-Id: <20210921232024.817-1-gurchetansingh@chromium.org>
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
     need implicit sync in patch 9.

Changes since v2:
   * u8 ring_idx --> __u8 ring_idx to fix buildbot issues

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

