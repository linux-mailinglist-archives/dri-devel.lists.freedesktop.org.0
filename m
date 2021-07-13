Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9FB3C7837
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 22:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEB889A08;
	Tue, 13 Jul 2021 20:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8034189971
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 20:52:00 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u1so411211wrs.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BDyC/DY74z2CjcdPHnrSos5LIYO/A3/gQ+PUHz2jdsY=;
 b=Y/+QHqZsDEZJpQp468v2dxQwhD5KwG5CstxO8j5DtVIOXF9nl0WpbJP/cXO2BPl5rE
 rZDfpudbl5bBqM1KEuz506dfE0xAfwv1weBaoq3ngCHkYRAm6ZVv7057jYvHNlbWeuEO
 mQMjHgNDRiQ1BaiBqxGTL0YDrQgxcdtg0vk/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BDyC/DY74z2CjcdPHnrSos5LIYO/A3/gQ+PUHz2jdsY=;
 b=ZKbp7EVyBzrFJU986hN9Ch+/LjTlY2DIFth5t89s1HFv6zG/ldYptlXCTJwUFWHCkF
 5Vc8JRbVWoS+1lAWIYcnnBpL1I24YKJqk9wk2Ri2D4KIpqsndHHDgbWKCvq0h8m/rbcF
 VLEEuGd3I10hWzSCSoGV5dUDXAUW7IzKZ5W+xdT95LW7Y17fSTRdAvvhRYB8DPElJKFv
 1an2Eh48qHNUthOSANhzO+fB1/1ndhY5Q9+KaZMis/R4RV+m7v8tpHwySdeiahuZ6DS7
 /0T568RK/Q3wbFXLKhF2rVyZBoFZs8nOMqztlEAfAD+D0tLGWPhKFFvAdxD0zUsx/oN0
 q/1Q==
X-Gm-Message-State: AOAM533tD6aV6+t8XntnvO8RgZcLPdvsP4Ur0h6m2xkb8hci699NooCm
 lSh/5jqrEHoe/8EndqdygHDvFUio9eU3dg==
X-Google-Smtp-Source: ABdhPJyQpKWy+9AhVsH+cb+Q+Mm1vvUM/0xOrkdQV4UmvXBxaEyU2Om95gdjp6Hup8Y0EP5SV3Ud8g==
X-Received: by 2002:a05:6000:178a:: with SMTP id
 e10mr8282029wrg.141.1626209519125; 
 Tue, 13 Jul 2021 13:51:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j10sm18642249wrt.35.2021.07.13.13.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 13:51:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 0/4] shmem helpers for vgem
Date: Tue, 13 Jul 2021 22:51:49 +0200
Message-Id: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all

I've found another potential issue, so lets try this again and see what
intel-gfx-ci says. Also Thomas tried to unify vgem more, which motivated
me to dig this all out again.

Test-with: 20210527140732.5762-1-daniel.vetter@ffwll.ch

Review very much welcome, as always!

Cheers, Daniel

Daniel Vetter (4):
  dma-buf: Require VM_PFNMAP vma for mmap
  drm/shmem-helper: Switch to vmf_insert_pfn
  drm/shmem-helpers: Allocate wc pages on x86
  drm/vgem: use shmem helpers

 drivers/dma-buf/dma-buf.c              |  15 +-
 drivers/gpu/drm/Kconfig                |   7 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c |  18 +-
 drivers/gpu/drm/gud/Kconfig            |   2 +-
 drivers/gpu/drm/tiny/Kconfig           |   4 +-
 drivers/gpu/drm/udl/Kconfig            |   1 +
 drivers/gpu/drm/vgem/vgem_drv.c        | 315 +------------------------
 7 files changed, 49 insertions(+), 313 deletions(-)

-- 
2.32.0

