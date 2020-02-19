Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 086AB163ED6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86A76EB23;
	Wed, 19 Feb 2020 08:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF266E450
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 08:08:16 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id r67so2240724pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 00:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eDEEn06gGe3wz7Pt5Sy7Iqux/1AIKbtlqlkTn71Oy4k=;
 b=Nb0J2Xyp5yfAHRANQeHIM9Bhe1mDPndS/8VRCMtVIO7WP2mPoXO7nq0sWc55gXRTfK
 faA/psEl79dEmvXeFu/v0EqEL7MiOU0dNsB+D97gDKuHmJhxcDJ4lXeJb/HjVRFWehHy
 ADEkYgAsVtcvH2QNrCYYERUN/CgxqKAr88vWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eDEEn06gGe3wz7Pt5Sy7Iqux/1AIKbtlqlkTn71Oy4k=;
 b=MdHufvigHQAX3tmtZxnOizEr5G3Kc+sqcSWXGx8v0MdPDv+tserJeJEj9alLpNdBE/
 rEk5OJ9BmwgUe6BlaMis9ZfRBWC+bABxptBdFi/1oS/Fnu7HgOgVVsqOGWBX+X4kzfJ6
 hHKdcqcORiXhdQwyC8mh1KX/zOavFHf4/oIM1umwpYrCUOh09VE1N+EtfF9lBkjAJlvK
 dTatgdLzhWWuaABj3vI8acwVrBrko5OClLDyQ5hAhoo+2A6CgBCR0gWG5q79y3Ivn9RK
 so1p5P0f4Zrd8sUUhI3Kuzlz+Gtfdy6tMuTF3w5x3i7uifvtuszgQpz9lmSWLcTZkznh
 FwCg==
X-Gm-Message-State: APjAAAUM59I3gOp9dJmAAa/5nWs/WQ+/WWXDLvHAi7AHo0oLhPtnl8lx
 aLGwsnYHnyj2bRtQ2wFI3MaF6A==
X-Google-Smtp-Source: APXvYqzOZKpamAABfdMJ/fDZQ0VlsPGfT9UmaFnev4sLY13+z4pxoduWq15xXgZAbVThF3gN2BNn5g==
X-Received: by 2002:a17:902:7406:: with SMTP id
 g6mr25130286pll.103.1582099696282; 
 Wed, 19 Feb 2020 00:08:16 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:1f16:51f4:8631:68b2])
 by smtp.gmail.com with ESMTPSA id ci5sm1484267pjb.5.2020.02.19.00.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 00:08:15 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 0/2] Support virtio cross-device resources
Date: Wed, 19 Feb 2020 17:06:35 +0900
Message-Id: <20200219080637.61312-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, David Stevens <stevensd@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset implements the current proposal for virtio cross-device
resource sharing [1], with minor changes based on recent comments (i.e.
renumbering the new virtio gpu command and adding a feature flag).

The patchset adds a new flavor of dma-bufs that supports querying the
underlying virtio object UUID, as well as adding support for exporting
resources from virtgpu. It is expected that this will be used to import
virtgpu resources into the virtio-video driver currently under
discussion [2].

[1] https://markmail.org/thread/jsaoqy7phrqdcpqu
[2] https://markmail.org/thread/p5d3k566srtdtute

David Stevens (2):
  virtio: add dma-buf support for exported objects
  drm/virtio: Support virtgpu exported resources

 drivers/gpu/drm/virtio/virtgpu_drv.c   |   3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  21 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |   4 +
 drivers/gpu/drm/virtio/virtgpu_prime.c | 109 ++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    |  58 +++++++++++++
 drivers/virtio/Makefile                |   2 +-
 drivers/virtio/virtio.c                |   6 ++
 drivers/virtio/virtio_dma_buf.c        |  97 ++++++++++++++++++++++
 include/linux/virtio.h                 |   1 +
 include/linux/virtio_dma_buf.h         |  62 ++++++++++++++
 include/uapi/linux/virtio_gpu.h        |  19 +++++
 11 files changed, 378 insertions(+), 4 deletions(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
