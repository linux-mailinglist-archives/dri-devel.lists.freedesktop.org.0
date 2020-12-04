Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDC12CF53D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 21:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEF46E215;
	Fri,  4 Dec 2020 20:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1616E215
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 20:02:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i2so6476152wrs.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 12:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eC1vWxhQ44MAiz8C5eJYiwX4+qG0LcRWw3zAHbPPJY8=;
 b=Vw9wApQq7432L4BcFmcNNHUZNbWxfI2tGtLOb5MjqIgSQ8dPKYUqOhUndJ4KT7NdFW
 S9o37gKuf4Ey42dwvHXThWdPhp1pTx5fWAeFq/zIbOlac3HwWfJXcJR0wZTARFeDQz//
 aEriwHQv6hOD0N/3j6lvQCwtfBmbiy+kfPttU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eC1vWxhQ44MAiz8C5eJYiwX4+qG0LcRWw3zAHbPPJY8=;
 b=Fycrd6pp3wF6qSI9ds/12Qs3xo647fPppbYR5R+RkN5SQxdTyLvczv2BJB0s1RYkon
 LaKj9dAK6zlxshba9Hisielj/PXHQjGakpBUSDT3JKLHpNQMQ6KgS4nvcNOp6278pWVE
 MGpPjRJWz7Nam1BR0CbVf5s/k+2wCdDcaPjt5a6ptUtc/SfmCh1ZMLZUtFedv0zWL4E4
 WWG39vUZmWwj4kO19MSYzmLZnyiplYUVSEcqKtwMuW1cFsgCij1VZgzyhYlHH/bytpnV
 IOafvJwrs6xJkfZcOeK8slfNlljjvly5/PIZdSq2XfWO4MOWuS6A/b13uisabAnI+3MR
 Is0w==
X-Gm-Message-State: AOAM532N3e7v711KsLNo+0vrXwXACUwjo2QbeEmp32soI9FN3RVpRPzg
 I71XqoAkEW4sTDAT00xNl5/u2dVgyq+wRQ==
X-Google-Smtp-Source: ABdhPJxLhkcc55xHjCLsqnE9mgMnFs9UBcthKRWLZzA6TJzcZqcgJsTrkqVOYvA0ma34OFy6HHQuJA==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr6986858wrv.170.1607112168544; 
 Fri, 04 Dec 2020 12:02:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k6sm4280561wmf.25.2020.12.04.12.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 12:02:47 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dma-buf: Fix kerneldoc formatting
Date: Fri,  4 Dec 2020 21:02:42 +0100
Message-Id: <20201204200242.2671481-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I wanted to look up something and noticed the hyperlink doesn't work.
While fixing that also noticed a trivial kerneldoc comment typo in the
same section, fix that too.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/driver-api/dma-buf.rst | 2 +-
 include/linux/dma-buf-map.h          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index d6b2a195dbed..a2133d69872c 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -190,7 +190,7 @@ DMA Fence uABI/Sync File
 Indefinite DMA Fences
 ~~~~~~~~~~~~~~~~~~~~~
 
-At various times &dma_fence with an indefinite time until dma_fence_wait()
+At various times struct dma_fence with an indefinite time until dma_fence_wait()
 finishes have been proposed. Examples include:
 
 * Future fences, used in HWC1 to signal when a buffer isn't used by the display
diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index 583a3a1f9447..278d489e4bdd 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -122,7 +122,7 @@ struct dma_buf_map {
 
 /**
  * DMA_BUF_MAP_INIT_VADDR - Initializes struct dma_buf_map to an address in system memory
- * @vaddr:	A system-memory address
+ * @vaddr_:	A system-memory address
  */
 #define DMA_BUF_MAP_INIT_VADDR(vaddr_) \
 	{ \
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
