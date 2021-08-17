Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D591E3EE417
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 04:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E50D6E0A2;
	Tue, 17 Aug 2021 02:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2AE6E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 02:02:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i9so17557744lfg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 19:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y5ZuXhMpGL5msVn45H7bewBOf3GHABZ4uowOQcIc1Ws=;
 b=Aumw+GHX0XJrGdGoDrraDp+6mv0Ob0Y0mxmRSD1XjfiAv8dK+HJYTq412kzRQZzv7M
 j58GPZ163iczCL2dk8ucYqJ59XJ+b14AGoE6O59TiUR/4ddYbpd/cZxEGtq5hk2AMKo3
 EtjKxNk/QfLOGO/07q1lqdbJbVTaTcSAKK7ydTkuRh/6hmDY5IlvnTxhSILF1p6V9aKE
 M4eDrlEje7FfPtslh+EwywLICfXCJ0baD1QD3pI3GDfKJVS7uUcE4w+dsVgohVRnyFS5
 VkRZoX0IKetrVs9vZfIzkyi15lkWYONrNbm2v34gCjU5HBTqNKvzS4kteFeRSKfCOX6K
 vWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y5ZuXhMpGL5msVn45H7bewBOf3GHABZ4uowOQcIc1Ws=;
 b=qRboByY4s2advkhPMeVaq+MuczjKUSzEjYbU9Maoup7sA6JL51qiB3GdtZRZwwQBqW
 QB5Ydeup87yC9RykgzINW5vkz492MjO3N+lhC5jqfPiLYsP/xvqe5oaZpJXT9ttHJg2i
 ck7lEjl79Qntxlb9yDnuyVXzP2Zv7RnPqjfbln9DurZpWDMSTqti4MyD0EE/QYJOt8Zh
 kVjI9FROYzuJJDuuzCtr7S2WoL0AygcpRhRdsrnl3m/wlCru7dbqWjcHdxY2blEIGqeU
 AIVTw8TWBUSUdkEVO/bAykMO9A6lEFpDHIZWpp/ll0H0G1TaIWodFsjN8TvlJQDRp0Lg
 3I+Q==
X-Gm-Message-State: AOAM532gpAV0KSYe5NkpstwnAG7IlRj+NJjMvSJJjcmriqhzZ04xUZI0
 jmjzVN3WihUlpyfd7t6UMHQ=
X-Google-Smtp-Source: ABdhPJybESbQjTKxFyl1+w7D6SkRS6QDSYZ4mztgQ10m8fpWo0YOWq5IW13UJwyDtlGg6fZd7XOZFg==
X-Received: by 2002:a19:500e:: with SMTP id e14mr541782lfb.487.1629165732749; 
 Mon, 16 Aug 2021 19:02:12 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id i24sm51729lfc.293.2021.08.16.19.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 19:02:12 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/3] Tegra DRM and Host1x driver fixes
Date: Tue, 17 Aug 2021 05:01:50 +0300
Message-Id: <20210817020153.25378-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
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

Fix troubles introduced by recent commits.

Dmitry Osipenko (3):
  drm/tegra: dc: Remove unused variables
  drm/tegra: uapi: Fix wrong mapping end address in case of disabled
    IOMMU
  gpu/host1x: fence: Make spinlock static

 drivers/gpu/drm/tegra/dc.c   | 3 ---
 drivers/gpu/drm/tegra/dc.h   | 6 ------
 drivers/gpu/drm/tegra/uapi.c | 2 +-
 drivers/gpu/host1x/fence.c   | 2 +-
 4 files changed, 2 insertions(+), 11 deletions(-)

-- 
2.32.0

