Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E88B54F3B5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 10:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627C711ABA0;
	Fri, 17 Jun 2022 08:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADF411ABA0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 08:57:20 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d14so5275265eda.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9FbtKPklDAzYqBxI9midbYskvWSeku8VgHM4QUv4J+g=;
 b=RIKHRpM0wUlv8lDPilrhaOhSpY747adTj7jmL+FXxXSdcmIjxhX0Lkw1pm+H4jCe6Y
 ml/nDp0R8WSzIO6Y4+TMTO5T+EgaW0Fv65fbBlvLBQg7AKwVHrPEL5DnYmCVnK1Gz6CE
 ahp0XJk1jYPqPxK/YnubRBwE3gDKZOrd9NCQjYVA17cJqqI2isHsGzRSlO1OKg9m3EF7
 O9vntabP/uW+nTYRnpc4lSoNe2QEGelbtCCRpXBOeQqC5xRl195yUEgU4gVtA5roGtjC
 nlOXbhZgLE4nRdhbQgP0LfrWe+MSYg+hvmj5oZg7JYMMtRzpjHmzqAscNrQ/uewV496K
 GvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9FbtKPklDAzYqBxI9midbYskvWSeku8VgHM4QUv4J+g=;
 b=cgILgyuXPo7cFrx/5e0qrE2YFDSGfHJirE23kDT2h7JZciHb50+NOlVB3esKo0a3ko
 ic5Ty93NT3WlmANoFoWZoZEalBDElUalEDMO/lGnsykl9g1/6glN4INqZIPg2niUGrdR
 wRtCxmOod0WjNr7lKcIddsCYQNit71qk2ioXMYXV0Dg5MV8L2pceI3DZyTKmLwVrJbAA
 gi1Ik53Rv4E8Peq5U7VjMxF6P9APaRfqOsyjUvx4V3BL+xF7nl7pOLcCo6exepyr6UKI
 fcpb828s9T1zB8CBiQDr1wonN3vcpfdxdX1K+0G9Lqj9gFEKKjCvRsWk+v5RCBU9iO4B
 6jgg==
X-Gm-Message-State: AJIora8Y4KyeuaSw1pjZGaG0+MuG/u/p1MQp3maQv+07z5+fHAc0H3UL
 GGVPUDO7y/MlJP8HVmyw+po=
X-Google-Smtp-Source: AGRyM1uLOxptLIvHstxzriWtY/q4UBxlt3fidCgVPZqCtQXF7jzPX8mLudscCl/W3SvwTk6vu2FBBQ==
X-Received: by 2002:a50:d097:0:b0:42d:d158:4e61 with SMTP id
 v23-20020a50d097000000b0042dd1584e61mr11144467edd.42.1655456239177; 
 Fri, 17 Jun 2022 01:57:19 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05640251cd00b0042ab4e20543sm3388788edd.48.2022.06.17.01.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 01:57:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 kernel-team@android.com
Subject: [PATCH] dma-buf: deprecate DMABUF_SYSFS_STATS
Date: Fri, 17 Jun 2022 10:57:02 +0200
Message-Id: <20220617085702.4298-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: daniel.vetter@ffwll.ch,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 gregkh@google.com, tjmercier@google.com, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a warning that this UAPI wasn't such a good idea and shouldn't be
used by anybody.

That should give us a better chance to remove it at some point and
prevents others from running into the same issues.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 541efe01abc7..e4dc53a36428 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -75,7 +75,7 @@ menuconfig DMABUF_HEAPS
 	  between drivers.
 
 menuconfig DMABUF_SYSFS_STATS
-	bool "DMA-BUF sysfs statistics"
+	bool "DMA-BUF sysfs statistics (DEPRECATED)"
 	depends on DMA_SHARED_BUFFER
 	help
 	   Choose this option to enable DMA-BUF sysfs statistics
@@ -85,6 +85,10 @@ menuconfig DMABUF_SYSFS_STATS
 	   statistics for the DMA-BUF with the unique inode number
 	   <inode_number>.
 
+	   This option is deprecated and should sooner or later be removed.
+	   Android is the only user of this and it turned out that this resulted
+	   in quite some performance problems.
+
 source "drivers/dma-buf/heaps/Kconfig"
 
 endmenu
-- 
2.25.1

