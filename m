Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A117570DF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 02:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF3B10E2BE;
	Tue, 18 Jul 2023 00:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39CC10E2BB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 00:28:04 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bb119be881so34098015ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 17:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689640084; x=1692232084;
 h=content-disposition:mime-version:subject:to:date:from:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gsybScX3TAasEPJeiUR0GnmS4s7meRN3K9Y2WCrLayY=;
 b=GYPcZnb4RnvOvNBuxEiXWOH2d4Wdug96h8EVX+GOEAgH8Z2WuqXUnvTdvjg8INdLVK
 DBM6NmczPdhvkoEVgE66kquSab4fELL0UgX9eLK3jBDLcso9kc0kfbYSI3rTcAEJ3QUy
 SmCoO6rPHbwElTJ7wYlf3BAZrK3VhWaiMlcQYwMtHivHPgIZXc/XTyoNeDOsyH5GOnxQ
 sjCP1eAzutGHf8lN59Yz1O/JG9GRHP9SnMMYsSu1sdnwHcK+XZl2DsZ31qXrtxnuXZxz
 /t2hKkm+PnqrDgAoZ+yd+9HBftSE5GVA5rMczzXFjjGU8WsoQTDmwLcGW8AvRgsfSYfg
 j/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689640084; x=1692232084;
 h=content-disposition:mime-version:subject:to:date:from:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gsybScX3TAasEPJeiUR0GnmS4s7meRN3K9Y2WCrLayY=;
 b=Cp++3de8I5ALoghNlhPNNAQME5KJHQrhEgmIVw3z1uEJSOVuSoBwYEDjYO5ZGfx6ok
 ri7q54GL81YQx84ropgLOYdR684Voyuk71p6OzPc1ZB4k65ro7IKrhG+yTHk9x/NrUPY
 lO5J47z2af2H9noZ0+HmQ3QKXsdYSwoH3FVgtgoJDVpRJqDFbgdSRakSv504WLn8R4PI
 88etY/oE5gP+4h2gtqZTpBemTRwN7Gbv0DCU/U5h+ifLAOunKN4wly87y5hCGTyRHLJ/
 zV7c35Ah07Qy+5s1U84d5SkzQaaOYeq5r521lteT9e4DhvMX22QcoNv2+J8/VR/M8QSS
 HGfg==
X-Gm-Message-State: ABy/qLY0K4MIjfVoWg6aqqO1zpzteoKyR1MrMs6kwEox623WwRq3/FU6
 KaA+qh9da+lOSLLOqDvKUw8=
X-Google-Smtp-Source: APBJJlGcs3hJOrf1f/Cd0vMFz6Oee0pgYh+6JNHCOG9asryiPrdQHqTUaqPDEil1JR7+YBoerQtMgg==
X-Received: by 2002:a17:902:e805:b0:1ab:11c8:777a with SMTP id
 u5-20020a170902e80500b001ab11c8777amr16225639plg.13.1689640083776; 
 Mon, 17 Jul 2023 17:28:03 -0700 (PDT)
Received: from sie-luc. ([1.85.36.133]) by smtp.gmail.com with ESMTPSA id
 n10-20020a170902e54a00b001b86e17ecacsm452089plf.131.2023.07.17.17.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 17:28:03 -0700 (PDT)
Message-ID: <64b5dc93.170a0220.243d5.1d63@mx.google.com>
X-Google-Original-Message-ID: <20230718002756.GA2558@sie-luc.>
From: Luc Ma <onion0709@gmail.com>
X-Google-Original-From: Luc Ma <luc@sietium.com>
Date: Tue, 18 Jul 2023 08:27:56 +0800
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 onion0709@gmail.com
Subject: [PATCH] dma-buf: remove unintended hyphen in the sysfs path
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

From: Luc Ma <luc@sietium.com>

Signed-off-by: Luc Ma <luc@sietium.com>
---
 drivers/dma-buf/dma-buf-sysfs-stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
index 6cfbbf0720bd..b5b62e40ccc1 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -33,7 +33,7 @@
  * into their address space. This necessitated the creation of the DMA-BUF sysfs
  * statistics interface to provide per-buffer information on production systems.
  *
- * The interface at ``/sys/kernel/dma-buf/buffers`` exposes information about
+ * The interface at ``/sys/kernel/dmabuf/buffers`` exposes information about
  * every DMA-BUF when ``CONFIG_DMABUF_SYSFS_STATS`` is enabled.
  *
  * The following stats are exposed by the interface:
-- 
2.25.1

