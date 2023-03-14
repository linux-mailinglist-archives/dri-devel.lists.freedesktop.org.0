Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312F46B8CEA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 09:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67CD10E72D;
	Tue, 14 Mar 2023 08:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1F410E72D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:18:16 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v16so13513142wrn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 01:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678781894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2214dcZRNnFFU9/Etuq7BnZaeDVA1LLzT7N7JzpJVnM=;
 b=A5j3q9dJ2yC101SHzOx+ouKXXw2OXhxVZbUgszPQ0lwmy6tvtDFY7fsvg6bmpfVvK0
 ewiepno8BqXtp+uqpPKC4jFD6gAyinz4sKNMjmA59+bJ5C0SfChfpgHfS/0Vpfl7oj7d
 4Y4xeBXQTU78clGG8QD9xOwHlqNGPsLNTCyZOfZz/Xbf5hn0F0xD+NBLW8yR5AL6fkNj
 yhQOSsSWOLBx99YrD8tB4vTDc/Q04vtcDCtQIcKsCUNd4s7qgH+r2rz/NNBIMR5RpoT/
 ZfTymqsA8qB4Ca07KVX8Tw2/mI6mqq5e3GVUovSnoZEbPOutOHmO0b+OPbu8n0Sr+dkY
 xFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678781894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2214dcZRNnFFU9/Etuq7BnZaeDVA1LLzT7N7JzpJVnM=;
 b=kSwQo1me20KgS8ofN7ibFNVon7S+yDm6fXz41iww/dXRKFHXUqcJ5GRxPs5jinkVcg
 PZvBr7hl8LhcV97lDPKhAJLNmIuABoIPC1mDbLUDzoy/5XmR4UgQo478eOEtLTLch3N4
 nlAhNsR3JadGy9MhvF7Wja/jG82iT58UlQqY2QEBzltAk3eRU+n1HcczuB2vJ8hroTsl
 53j1cIRb10b9qNZpJJJ/beKHmTyg/j+AOsjrj4Viq4h0krEgjevbZ+zn2g0xdRESlsqi
 N/jal1Qd3RzttRlEHKMimxUJhc2YaO5OD0vXbq8uAgGtH6vdWRp9EGRa/IBUeog3q16W
 NTZg==
X-Gm-Message-State: AO0yUKXty5grN5YZIZ+2bQz4Ew5anDJ0zLsjmfUSYkA5vVcfjKpTIcPJ
 t7LqzXYar+oY3eCTIcbrPSI=
X-Google-Smtp-Source: AK7set9iRHCKWKPm+mnreWBZ1a1d7cE4kIhCrdrICssPEdiPtuBsjjhazUr3f1fAUw3y2IGFlhP5iw==
X-Received: by 2002:a05:6000:1004:b0:2cf:e517:c138 with SMTP id
 a4-20020a056000100400b002cfe517c138mr2828443wrx.66.1678781894551; 
 Tue, 14 Mar 2023 01:18:14 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 t2-20020a5d49c2000000b002ce72cff2ecsm1416846wrs.72.2023.03.14.01.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 01:18:13 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 Yuri Nudelman <ynudelman@habana.ai>
Subject: [PATCH][next] habanalabs: Fix spelling mistake "maped" -> "mapped"
Date: Tue, 14 Mar 2023 08:18:12 +0000
Message-Id: <20230314081812.26065-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/accel/habanalabs/common/memory_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/memory_mgr.c b/drivers/accel/habanalabs/common/memory_mgr.c
index 30f8059f28c2..c4d84df355b0 100644
--- a/drivers/accel/habanalabs/common/memory_mgr.c
+++ b/drivers/accel/habanalabs/common/memory_mgr.c
@@ -275,7 +275,7 @@ int hl_mem_mgr_mmap(struct hl_mem_mgr *mmg, struct vm_area_struct *vma,
 
 	if (atomic_cmpxchg(&buf->mmap, 0, 1)) {
 		dev_err(mmg->dev,
-			"%s, Memory mmap failed, already maped to user\n",
+			"%s, Memory mmap failed, already mapped to user\n",
 			buf->behavior->topic);
 		rc = -EINVAL;
 		goto put_mem;
-- 
2.30.2

