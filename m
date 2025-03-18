Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B3A677BE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 16:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E5E10E4AA;
	Tue, 18 Mar 2025 15:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bG9qHL2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B72110E4AA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 15:28:59 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2232aead377so131571875ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742311739; x=1742916539; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3GIoY6hZd8z2MO+gbh2+3E+yi4866iekF90s7ppxoV8=;
 b=bG9qHL2aw2EtBCDxkSqEL2ytQ2+vTXo6ju8fOlMxBQ7A5Sgwy09DTUVGbwsPJPcGQ8
 np6PEvDTmbhSAYxd6HzVXWvi/nb76VM671FuWco8rH327sOcBL/Y3KUizMyZDmt9+s48
 8N2grWk4fTbPLILBNu0gex8b6L+Jiws8h19tThcFX3EYGUfPg8Y00SUKMN5ZXVO3LznT
 YGPU4g6Yqv6S4LnLP4jkFnoxk/l/s7Q98Wal3rQIkmNwktdpq1Xy+N3A0zfnFnT3yZsH
 +o7mXnywOEMBtH3zDnsUHribA80r8VPHmwSytcQz+Sm6yj6sWvP/WMfMm0AHn5b/W+TP
 jFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742311739; x=1742916539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3GIoY6hZd8z2MO+gbh2+3E+yi4866iekF90s7ppxoV8=;
 b=Kvo91BJcT7kTFEsVJHlI6Rc2WP670/SAPkDQcF4mu6PBuIa2PZZOwEqdjJqmaUN9Zu
 LN7XPR6nkDD/WsoWaGsmCF5Y8L66GLSgwBkD/P4ueaA5lhdgY2+PdLBpXoszssJH1r+K
 wvhvracVnjoi61gCj1Q4RpzQ5CAkd2z1lG3HmD0nEp4h+3clEdSncf78JqaTJAJ4iWRs
 dWMi1hraVyXHfTv8o0luKNqYPQoFOHxQNITI3ghhKNaNxUuHmzU+kKmXvxh29xDiz3KM
 gL15YVv0ueKHeyeSCuwsmuiAk5QfZ6MqDlXmMRIFLLnZmO+20RNlHG34QCRGC09eUpVk
 BKaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUeenP53Z4tvhTOxLr3TG6iWhcBtMY9fL+5KTGdiW0kZYhaUsEkyX0GQLVkKBHkgxUjwh8agC06fw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8LyQ0A2sHXn07JmDxgV7FC8GJXUEs8Ef0LQuVb8VKdVgleSYK
 JYU3yvVd4FB/XVf9kFr1C1jtLGnGkf1ZW83Eu9qtTnFpqaa8p7gh
X-Gm-Gg: ASbGnctL1QXRpJM0FbM+7Y95L9dQ31YXBpk2jFCq2b22AyYFrRtXCCmDaQjJ4CXoVtV
 EtHCqNw3YBW98e4ZGbTfml5QOGEfv0q8DkvaUHnhCl27c0dF6HjylH+4kTkTHKYzmFWPkZaIfmp
 8s/i4VW6nAE5eOpezoTB6ms/Cyo0lG1ECdLAl9xna8SCTUk/nrLchPRiYH2wb8naFhxs5oaip/i
 QM2Rrwdlx2HzVFl5LU5cC8I1N1gxPp0MApmELk30m1S+otKUR/H35aywozYmQAbc0QTbpe2xoj+
 n/WAyGOcxF5YKS9JP4VZwv3iHnlLNqcl9qmT9fPV67h+GEWcLnoCsG6py7duANOElZYo
X-Google-Smtp-Source: AGHT+IGm8xA0NnVzynAsWM0O5Q7/Bnh0NImG4nypFjz6JgDaGn4zEGVo6frikkIaETlzSTvVl0nHzQ==
X-Received: by 2002:a17:903:19ed:b0:223:2aab:4626 with SMTP id
 d9443c01a7336-225e0a15b42mr242532475ad.11.1742311738697; 
 Tue, 18 Mar 2025 08:28:58 -0700 (PDT)
Received: from localhost.localdomain ([183.242.254.176])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-225c6bbfdb2sm95680465ad.168.2025.03.18.08.28.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Mar 2025 08:28:58 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] dma-buf/sw_sync: Fix refcount leak in
 sw_sync_ioctl_get_deadline
Date: Tue, 18 Mar 2025 23:28:47 +0800
Message-Id: <20250318152847.30380-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

Fix reference count leak in by adding dma_fence_put() when
dma_fence_to_sync_pt() fails after the call to sync_file_get_fence().

Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/dma-buf/sw_sync.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..b7615c5c6cac 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,8 +438,10 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
+	if (!pt) {
+		dma_fence_put(fence);
 		return -EINVAL;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
 	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-- 
2.39.5 (Apple Git-154)

