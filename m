Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F66035461C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 19:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D43F89E2A;
	Mon,  5 Apr 2021 17:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCD689E2A;
 Mon,  5 Apr 2021 17:42:04 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id z16so1173400pga.1;
 Mon, 05 Apr 2021 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XHO0wyjY+FEn213Oc9Rxdq+fE2tksXvgBm7Zhcmxqbc=;
 b=cHsdt3+3qTwnn66SUZ4zRx2PP97lFo9OEygRMaGT/sQhOjxfKSgBK+2B0VMAF1K1gM
 CrjdyzcL+ZUu8sZf9npZmVmrhodCJCvf46eBhg6S6FJ4QEMgzr0o51IrApqdkaZwMdMl
 5rcwyszN5+TyTDxRHDRRxVpzS5HjtlZYaxalyIQvIDk+JT2Rz7igDO60Furec1gQ6dzU
 be0G2yu+6xrnn94cZ0KsPyL2DV4DfILcKIeb+B/W0YM2qlCX1N99yS4kdaKZf0vck0+h
 8SQB1kK+KGoOnsY4w8VPZ04cOAKfQi/XZOONUjoLMNizau7QfcoSY76E5r1RGcrSNHSo
 hiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XHO0wyjY+FEn213Oc9Rxdq+fE2tksXvgBm7Zhcmxqbc=;
 b=LGwGhiP5dFfSsBi5fHgXoudyYybf/cc2aKHNZlbmyYkIsqUqEJ6gBleoziE5irTYB2
 tzuXQWztdzoSusWTEfSjnJUIal6KSgVrBGB6XTFiwqL3zdt209/ftvo+a5Xs8kJzWaPE
 xquWf3NTg2muQ7KcR+QTEv3ctsL8d5qvwn2PqfHH17IQfMPq8AQPWa9WiXa36GCW4FQB
 Xo7sJ5m+H1oLjPPTOlhxBgvtTUKeMT8N3CvjlcWIrMSZEX+sJ5D8wW4nXX0bLlFU9ELl
 F0N5XbbVh9oYE8c+wm1ItD9qaMm0NO+J/u52vkaHzdrRWBuLBQoiwj0+y1J70nGpP/me
 rXQA==
X-Gm-Message-State: AOAM532qQnqfL95yz0EB1WimGK+5D8RdCkUMKRHv3abx/c3yCoeCsd1A
 kyuHYtBkrY/+jQUHbumqMqYd/HEZuqyRqQ==
X-Google-Smtp-Source: ABdhPJx1gyT8RHAnDJ9nm8PplSyEEAsnMs61ssxEYWIO86VFsIQv4AJ//yvpO2XaqD6VidV/Qvr+lQ==
X-Received: by 2002:a63:1316:: with SMTP id i22mr23372774pgl.419.1617644523140; 
 Mon, 05 Apr 2021 10:42:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 h68sm16859533pfe.111.2021.04.05.10.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 10:42:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm/msm: Swappable GEM objects
Date: Mon,  5 Apr 2021 10:45:23 -0700
Message-Id: <20210405174532.1441497-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

One would normally hope not to be under enough memory pressure to need
to swap GEM objects to disk backed swap.  But memory backed zram swap
(as enabled on chromebooks, for example) can actually be quite fast
and useful on devices with less RAM.  On a 4GB device, opening up ~4
memory intensive web pages (in separate windows rather than tabs, to try
and prevent tab discard), I see ~500MB worth of GEM objects, of which
maybe only 10% are active at any time, and with unpin/evict enabled,
only about half resident (which is a number that gets much lower if you
simulate extreme memory pressure).  Assuming a 2:1 compression ratio (I
see a bit higher in practice, but cannot isolate swapped out GEM pages
vs other), that is like having an extra 100+MB of RAM, or more under
higher memory pressure.

Rob Clark (8):
  drm/msm: ratelimit GEM related WARN_ON()s
  drm/msm: Reorganize msm_gem_shrinker_scan()
  drm/msm: Clear msm_obj->sgt in put_pages()
  drm/msm: Split iova purge and close
  drm/msm: Add $debugfs/gem stats on resident objects
  drm/msm: Track potentially evictable objects
  drm/msm: Small msm_gem_purge() fix
  drm/msm: Support evicting GEM objects to swap

 drivers/gpu/drm/msm/msm_drv.c          |   2 +-
 drivers/gpu/drm/msm/msm_drv.h          |  13 ++-
 drivers/gpu/drm/msm/msm_gem.c          | 155 +++++++++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h          |  68 +++++++++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 129 ++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu_trace.h    |  13 +++
 6 files changed, 272 insertions(+), 108 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
