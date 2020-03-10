Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E376C17EDAC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 02:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8896E5C1;
	Tue, 10 Mar 2020 01:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4A46E5C1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 01:08:24 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id m15so5504885pgv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 18:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=97MB+cumSW9HS9jN+AD+vm0lW2H+YJ2l9yi2EGJEAf0=;
 b=oJkNy0BBD4fb3ryDw2+mxqO9m+qqMRFfLBci1hRq4IuYkKcNbQe9aWZuUAq61G8fzU
 9UBElbcXxZ0yLggcPxb373Opj+PlAreiaeR+szBI9XnErpMLV9W97T3xLcNpaNlC9iLm
 mkbLVa9faZQuQzoT/Goy/pLftpb+ZuD+uDja8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=97MB+cumSW9HS9jN+AD+vm0lW2H+YJ2l9yi2EGJEAf0=;
 b=Jbn3+AGkpXtBetdFy7ifUSjZWHShfC2xJkXxhac5/ngcccuh7fbYJVYSLu/zCui4Xy
 cPvsPj0II6EUOvPTjUFhjhhYmTgxwFCAtH/Ti7Nl1F+xvfKRPW3/SYX1jXhkc1MKHnIC
 k1mThaJQezhf9xiQcPrQAbFMqx4zQhBhHEEVV1ZAW0hfsP51yVhXRzQPIeyn2l+8Yqdc
 pG23ex3zsnRj8Nq9bR6JXcqsaRTlKJkm8x5cvMyzOGCAmf7jPHkKFChSS5VCZe/Jskls
 t/Aeguq3V6JW0Q0+Mi4moZMVzOkVBDZzRq3AxKRBD+Ej6Txm+9JI9cBbisqSJZCGH2bx
 ZmsA==
X-Gm-Message-State: ANhLgQ3NF594EXkFGHSPni4kmzsyREjDkLEiYE0KgAA5UtqTy/1cm0Xa
 JAUz9o70kjxHUQDasYpGaY5mstyWchQ=
X-Google-Smtp-Source: ADFU+vsWvObtm35RUejNi+gRLc3BBXE+BXkndERZgvxS8bavPOa+EfQ1U/kkgq4YAmuPYUWw1VQC2w==
X-Received: by 2002:aa7:8708:: with SMTP id b8mr4795525pfo.209.1583802503788; 
 Mon, 09 Mar 2020 18:08:23 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id s126sm22864070pfb.143.2020.03.09.18.08.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Mar 2020 18:08:23 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/8] *** Per context fencing ***
Date: Mon,  9 Mar 2020 18:08:10 -0700
Message-Id: <20200310010818.569-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
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
Cc: chadversary@chromium.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 kraxel@redhat.com, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't want fences from different 3D contexts/processes (GL, VK) to
be on the same timeline. Sending this out as a RFC to solicit feedback
on the general approach.

Gurchetan Singh (8):
  drm/virtio: use fence_id when processing fences
  drm/virtio: allocate a fence context for every 3D context
  drm/virtio: plumb virtio_gpu_fpriv to virtio_gpu_fence_alloc
  drm/virtio: rename sync_seq and last_seq
  drm/virtio: track fence_id in virtio_gpu_fence
  virtio/drm: rework virtio_fence_signaled
  drm/virtio: check context when signaling
  drm/virtio: enable per context fencing

 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 12 +++--
 drivers/gpu/drm/virtio/virtgpu_fence.c   | 66 ++++++++++++++++--------
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  9 ++--
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c      |  4 +-
 7 files changed, 62 insertions(+), 36 deletions(-)

-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
