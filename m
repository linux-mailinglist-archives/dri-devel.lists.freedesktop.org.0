Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C5123C1F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E91C6E1F8;
	Wed, 18 Dec 2019 00:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6927D6E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:59:42 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id az3so167941plb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qf3kclSJQ/lunmiJGEukLulZdtIcqg/M3VzakI2Eq9A=;
 b=EvHVkvjFwrATg57dJCKKgVGGWT5+efhrEaWj6coGlXUbs7E0bxhu8by7ciUnZ5CHmp
 7jHzuxZR8B5D0VXbFRSE/Bt3wQxdTSJedxTCMSaWcoio8VdgMjQj4GpGQwr0ENy3E3h1
 XyBiuzsSWwUYeIhCOwe3PmJ9EgLKCJhuZ48rI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qf3kclSJQ/lunmiJGEukLulZdtIcqg/M3VzakI2Eq9A=;
 b=KdkTwp+svW1QVudpYBYqY+4R0ANJfHs5CqkN9SojB/lKC/2M+YVMKl5YCgTI/Bpsxj
 2XB7dE2AwwdDT3urhlYAl1bJH0dMLJC41TCJhlwUDd1syxLSMBgEi3KRIJ6bSS3PIrQ4
 8mYYf0EZQhv8M1WdAXSM8QdX6uulZ0c23sxuoTTLaElnqoSPQU7nZpBkyxECuzPQk9n3
 3T28Pr4sk4V0MRvoVVfnfEBNYc2Mg6KevUHqGntAoayHv/Q8XW1k3pCliN7dDMxurFli
 GLIrIAF3Fmp5rCnFqWWgE8qs6VUvtSVPqiMhAPOSgtq8AWfoqS5IntCK58bJjda4QNya
 omXQ==
X-Gm-Message-State: APjAAAUXM8wmnhXiUvqdwHUydhGpavTWx3Aa9E9zn5aIPm8XfzOebm9x
 A+XF2BpXJk7pwIIsJCyuw2pKWKj2OBY=
X-Google-Smtp-Source: APXvYqx3W29f9+17Qu+C62ophKXWaDmK7N1KeCEcqY2MuSbMcQeHoKVbtqlluKlXwGf1oGcCnofERA==
X-Received: by 2002:a17:902:8d96:: with SMTP id
 v22mr1105411plo.262.1576630781280; 
 Tue, 17 Dec 2019 16:59:41 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm240802pgp.15.2019.12.17.16.59.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 16:59:40 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] *** virtgpu cleanups ***
Date: Tue, 17 Dec 2019 16:59:20 -0800
Message-Id: <20191218005929.6709-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With so many new features on the horizon, perhaps it's
time to do a little "winter cleaning" beforehand. Enjoy!

Gurchetan Singh (9):
  drm/virtio: static-ify virtio_fence_signaled
  drm/virtio: static-ify virtio_gpu_framebuffer_init
  drm/virtio: get rid of drm_encoder_to_virtio_gpu_output
  drm/virtio: simplify getting fake offset
  drm/virtio: remove virtgpu_gem_prime_import_sg_table
  drm/virtio: move to_virtio_fence inside virtgpu_fence
  drm/virtio: move drm_connector_to_virtio_gpu_output to virtgpu_display
  drm/virtio: split out vq functions from virtgpu_drv.h
  drm/virtio: split out gem functions from virtgpu_drv.h

 drivers/gpu/drm/virtio/Makefile          |   2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c |   6 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c     |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 137 +----------------------
 drivers/gpu/drm/virtio/virtgpu_fence.c   |   5 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c     |   6 +-
 drivers/gpu/drm/virtio/virtgpu_gem.h     |  52 +++++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |   2 +
 drivers/gpu/drm/virtio/virtgpu_kms.c     |   2 +
 drivers/gpu/drm/virtio/virtgpu_object.c  |   2 +
 drivers/gpu/drm/virtio/virtgpu_plane.c   |   2 +
 drivers/gpu/drm/virtio/virtgpu_prime.c   |  38 -------
 drivers/gpu/drm/virtio/virtgpu_vq.c      |   2 +
 drivers/gpu/drm/virtio/virtgpu_vq.h      | 100 +++++++++++++++++
 14 files changed, 178 insertions(+), 182 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_gem.h
 delete mode 100644 drivers/gpu/drm/virtio/virtgpu_prime.c
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_vq.h

-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
