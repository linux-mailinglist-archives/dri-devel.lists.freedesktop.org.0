Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0171CD548
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E616E3F4;
	Mon, 11 May 2020 09:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421536E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 09:36:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h4so17292756wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 02:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ybrbg0JBvmSsxSdOqYafvuumHr3GvaS92qxFWGltEmg=;
 b=IIxOdAKBgoLkrJPqpMhSiG2E2TY3IoBYdrMWUnUUtc55aeo8Tuo3biByZK/x7tXsFv
 ioOqQ4jqCfoJhtXsqfk5yrRTr1yWYTIg3Ub9z3HdUczGwWG010Kek7h8UwuEXD/j82bL
 Y0WhiOZdXPFopQcbqf2R7+zQj2BohwhsE6iuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ybrbg0JBvmSsxSdOqYafvuumHr3GvaS92qxFWGltEmg=;
 b=YKykMf/Wrxfk3YoTPlCkOYOU7S0emzBVsR0uoW3dbtiLr+3ctVTam7iE+QPdvY2R24
 lhqrb3cl8+tPseoCdZg53KAxj+ULPu82dLV9+qUv+mouiEpHJo+29uSU9ybQtuW0KyDy
 +cmJG7xTMRQNOcqWx8eXw+7QgkwRabKuW/qew/iY9ocM+WWJzNqm7XYQNvnyp0s6WOfa
 GKk7O0KiP+APuINjkH+hHi4cAQZ6N7Xy4OCHx+J9Prqur6SJkZ7ydFb2oDQ8MTRKGtdO
 u20EkcAUQS2uD2ng5rquUs8rhSU3HPlHnp52mGlrYejf39QvRLriprjuEZAZuD+x1Wjv
 PFnA==
X-Gm-Message-State: AGi0PubYrrQ3SImOkbVVSLkMhwBjV88EjeBpTUdnWyswnf44COk//6TM
 d3X2OT5xYZ/zarVTAZjkLuLzcOkc+wk=
X-Google-Smtp-Source: APiQypJmuI4Sb10g6vskiMUjv3WP6njot0AydnSHOMVLm9yqD9JXl72SN7CGX93e9vPt2A++mblhQg==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr32497704wmb.56.1589189759570; 
 Mon, 11 May 2020 02:35:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm9013945wmk.36.2020.05.11.02.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:35:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/9] shmem helper untangling
Date: Mon, 11 May 2020 11:35:45 +0200
Message-Id: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I've started this a while ago, with the idea to move shmem helpers over
to dma_resv_lock. Big prep work for that was to untangle the layering
between functions called by drivers, and functions used to implement
drm_gem_object_funcs.

I didn't ever get to the locking part, but I think the cleanup here are
worth it stand-alone still.

Comments, review and testing very much welcome.

Cheers, Daniel

Daniel Vetter (9):
  drm/msm: Don't call dma_buf_vunmap without _vmap
  drm/gem: WARN if drm_gem_get_pages is called on a private obj
  drm/doc: Some polish for shmem helpers
  drm/virtio: Call the right shmem helpers
  drm/udl: Don't call get/put_pages on imported dma-buf
  drm/shmem-helpers: Don't call get/put_pages on imported dma-buf in
    vmap
  drm/shmem-helpers: Redirect mmap for imported dma-buf
  drm/shmem-helpers: Ensure get_pages is not called on imported dma-buf
  drm/shmem-helpers: Simplify dma-buf importing

 Documentation/gpu/drm-kms-helpers.rst   |  12 ---
 Documentation/gpu/drm-mm.rst            |  12 +++
 drivers/gpu/drm/drm_gem.c               |   8 ++
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 128 ++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem.c           |   3 +-
 drivers/gpu/drm/udl/udl_gem.c           |  22 ++--
 drivers/gpu/drm/virtio/virtgpu_object.c |   2 +-
 7 files changed, 111 insertions(+), 76 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
