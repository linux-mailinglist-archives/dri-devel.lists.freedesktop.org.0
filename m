Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FD494690F
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2024 12:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A147610E02E;
	Sat,  3 Aug 2024 10:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QnFKHeTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8090A10E00E
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2024 00:18:23 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc56fd4de1so28310165ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 17:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722644303; x=1723249103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QAWRuSmJKjlpvA4QhYPB4hwoTefNcdDnXSOAB90DYYc=;
 b=QnFKHeTnN0EBKtHkGVX8nKkSs26sojMnl5I1mL1kWHIgoQdo1KcIn0b3faEUbNb2s4
 hjGCXZGoEDxLHkMnJTUKknGYZeUXl06atU9KgLEaVerG/PQyrDLBqx6iYLntWXnITMMw
 0TzGeCCfnKY/t4GZ5zN9sFIu0g92mK3RC7BjX6f7cs0XDOra6q0a47y7vmDor4JuYNOp
 kEXbM5qHrQA3eJvtGcQjSqWEl8DEWgeI36SBlWDVimZHIrbDWTXYNEIBtDVwJHnQy7Xo
 cd3wGVidCyOrjxoReyOOe/najcTmpUtT5oSxDNwQiKruLNKeeJWLxH9mri9A5pjLQKmQ
 WJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722644303; x=1723249103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QAWRuSmJKjlpvA4QhYPB4hwoTefNcdDnXSOAB90DYYc=;
 b=Kc3Vp1G5be519TJJhlB+dtzC2XquzbGeZbuqiwHjWV0ON+yrEHa8SdR2soQyCE2IdI
 9RY/SImrPDVEM0sgBBYts1W+Et0jsjKXEwvdCh721iKWHCky4TXFFGbgq5i3PwoXf9xP
 SodeKy/nZTmxN1gzxQzM830/s6wDM5BqzQMe3ygGqk7roPFfqUBcv4ve1zUJR+ShzOwQ
 Ck+wBirmYN9P5BpbX0TPeFP70K9TQ6b/mvLEzp855LCq+Ffcy00ZCceSMF/qlHppGZUi
 xGu3nf9t/l+gpPINcge0aVo/i8I8gxT/1bAFGt8YFbm6XrK4dsbaT6DMeeO2L0N7SCQr
 NMlQ==
X-Gm-Message-State: AOJu0YyyECgbV/bs0ItnSn+QmS/Yg1BUa+qMl1bfx2OYJ405yuUGsD2B
 NUNjtbhKH3wp5Pq2gYVlrCMUCxwCAUmjQWFStAqiJivPlyq9yitF
X-Google-Smtp-Source: AGHT+IEXMJ/xDGW0/TPd6BplXEHx1lumggDv01n9rtt4EZzLr+h7VIsu0WAr2fg3YtCCKSnHroS3ZA==
X-Received: by 2002:a17:903:41c8:b0:1fd:6ca4:f987 with SMTP id
 d9443c01a7336-1ff57bc504emr73575585ad.15.1722644302627; 
 Fri, 02 Aug 2024 17:18:22 -0700 (PDT)
Received: from Riyan.inspiron ([122.176.204.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm23542255ad.202.2024.08.02.17.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 17:18:22 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: vme_bridge.h: Document mutex in
 vme_dma_resource structure
Date: Sat,  3 Aug 2024 05:48:14 +0530
Message-Id: <20240803001814.7752-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 03 Aug 2024 10:32:58 +0000
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

Adhere to Linux kernel coding style

Reported by checkpatch:

CHECK: mutex definition without comment

Proof for comment:

1. The mutex is used to protect access to the 'running' list
(line 1798 tsi148_dma_list_exec function)
	mutex_lock(&ctrlrl->mtx);
	if (!list_empty(&ctrlr->running)) {
		mutex_unlock(&ctrlr->mtx);
		return -EBUSY;
	}
  This prevents race conditions when multiple threads attempt to start DMA
  operations simultaneously.

2. It's also used when removing DMA list from running list:
(line 1862 tsi148_dma_list_exec function)
	mutex_lock(&ctrlr->mtx);
	list_del(&list->list);
	mutex_unlock(&ctrlr->mtx);
  Ensuring thread-safe modification of the controller's state.

Without this mutex, concurrent access to the DMA controller's state could
lead to data corruption or inconsistant state.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme_bridge.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 9bdc41bb6602..bb3750b40eb1 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -61,6 +61,7 @@ struct vme_dma_list {
 struct vme_dma_resource {
 	struct list_head list;
 	struct vme_bridge *parent;
+	/* Mutex to protect DMA controller resources and ensure thread-safe operations */
 	struct mutex mtx;
 	int locked;
 	int number;
-- 
2.39.2

