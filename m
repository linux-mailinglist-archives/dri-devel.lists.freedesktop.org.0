Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D425B59A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E0A6E503;
	Wed,  2 Sep 2020 21:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756D56E503
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:08:51 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id u20so402670pfn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y86rbl5pkdRcGMw35pQn30AmKkGT1UWsKWIkd++//ac=;
 b=Oox9t9Bdq+XjfOav3IJX+kNvFq3vzDOMLBLC2PISnR7/10I6r2Qrm9rM1KvhIoCke9
 uTPlHpJjP34buxI9piW7ajA1YmvLA8c9KGC0IvgVsJ0qVCglc5Bh12fnBG2E0KXLBh2W
 aI8G45pnQO6PEyWfr1mjJ4OpE2s6upIhJQfcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y86rbl5pkdRcGMw35pQn30AmKkGT1UWsKWIkd++//ac=;
 b=O3r1PUqdo2shfk9ttxa9nE5CFKV79DJcZr2tPeU8joOC/1hjW560/jYp6e/TYF6jpm
 i17DdvBsVuCRyxW9y6aAlmmObxcmCSTxrQc08Fl4DXjWRCOftADfM76iDqcKkezaeSVE
 r+pAaLVZhwELAYQ/hAi3+AFsy9WqU1kfHppLGx9Gjm1m9r10ghI/0bUHw9YTY8+w3ywu
 FNnVq7IE2DFMvOMizZkamjuRcml4JegrWsWVQ48sA4kQd859VKCmkEIr/TuCONJ89YHN
 fHolHMvArUljmQLhIcG6NOAKjA9AU2kZr3SHqsPrvagc/rsyLDla/0jJElp67E8jVc03
 ujHw==
X-Gm-Message-State: AOAM533S4XHATmuSaF3pUDEnUHti0wh2V1dMURMKIrJHH86Z0bOiYw5T
 V1Dblp0jxwXDs32Q3p1CmdOTxwhc8gw1MQ==
X-Google-Smtp-Source: ABdhPJyZNjNWBkZnaBmz23zhocAnbya0QQWm+S68yaHx2WrOWUKotpH2IRRyBuz+9MZgYF63dLXGUA==
X-Received: by 2002:a63:4b10:: with SMTP id y16mr3311981pga.93.1599080930632; 
 Wed, 02 Sep 2020 14:08:50 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:08:50 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 00/23] Blob prerequisites + blob resources
Date: Wed,  2 Sep 2020 14:08:24 -0700
Message-Id: <20200902210847.2689-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the latest iteration of the blob series.  Changes since last time
include:

* RESOURCE_ASSIGN_UUID now merged (thanks kraxel@ and stevensd@!).

* some additional virtgpu prep patches -- not completely related to blob
  but not completely unrelated either.

* v3 of shm region series that Vivek sent out, with mst@'s acks.
  I think the plan is to merge this in 5.10.  After reading up on Linux
  kernel flow, I think merging to drm-misc-next now will accomplish the
  same effect ;-) ??

* applied checkpatch --strict fixes.  Ignored some messages that
  conflicted with existing code or didn't make sense.

* fixed some issues raised by the kbuildbot.

For further details on blob resources and links to open-source userspaces,
please refer to the original description [1].  The entire tree is
available at [2].

[1] https://lists.freedesktop.org/archives/dri-devel/2020-August/275972.html
[2] https://gitlab.freedesktop.org/virgl/drm-misc-next/-/commits/resource-blob

Doug Horn (1):
  Fix use after free in get_capset_info callback.

Gerd Hoffmann (6):
  virtio-gpu api: blob resources
  virtio-gpu api: host visible feature
  drm/virtio: implement blob resources: probe for the feature.
  drm/virtio: implement blob resources: probe for host visible region
  drm/virtio: implement blob resources: implement vram object
  drm/virtio: implement blob resources: resource create blob ioctl

Gurchetan Singh (13):
  drm/virtio: fix uninitialized variable
  drm/virtio: report uuid in debugfs
  drm/virtio: blob prep: refactor getting pages and attaching backing
  drm/virtio: blob prep: make CPU responses more generic
  virtio-gpu api: cross-device feature
  drm/virtio: implement blob resources: expose
    virtio_gpu_resource_id_get
  drm/virtio: implement blob resources: add new fields to internal
    structs
  drm/virtio: implement blob resources: hypercall interface
  drm/virtio: implement blob resources: blob display integration
  drm/virtio: implement blob resources: refactor UUID code somewhat
  drm/virtio: implement blob resources: fix stride discrepancy
  drm/virtio: implement blob resources: report blob mem to userspace
  drm/virtio: advertise features to userspace

Sebastien Boeuf (3):
  virtio: Add get_shm_region method
  virtio: Implement get_shm_region for PCI transport
  virtio: Implement get_shm_region for MMIO transport

 drivers/gpu/drm/virtio/Makefile          |   2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  27 +++-
 drivers/gpu/drm/virtio/virtgpu_drv.c     |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  79 ++++++++--
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   | 185 ++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  45 +++++-
 drivers/gpu/drm/virtio/virtgpu_object.c  |  36 +++--
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  23 ++-
 drivers/gpu/drm/virtio/virtgpu_prime.c   |  46 ++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 165 ++++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vram.c    | 164 ++++++++++++++++++++
 drivers/virtio/virtio_mmio.c             |  31 ++++
 drivers/virtio/virtio_pci_modern.c       |  95 ++++++++++++
 include/linux/virtio_config.h            |  17 +++
 include/uapi/drm/virtgpu_drm.h           |  39 ++++-
 include/uapi/linux/virtio_gpu.h          |  78 ++++++++++
 include/uapi/linux/virtio_mmio.h         |  11 ++
 include/uapi/linux/virtio_pci.h          |  11 +-
 18 files changed, 991 insertions(+), 64 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_vram.c

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
