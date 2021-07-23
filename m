Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D99B33D3A4B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 14:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057626E969;
	Fri, 23 Jul 2021 12:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116066E969
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=tm/g4yLwI/CcSbytKeDBqt0ry2zni6MykvJqfVCY84c=; 
 b=hKb9zhsuGkGyT5WhOJb60uNujyN5jH57Tji//4FQmmgjHsKQz+d8WQYzTk8u8D4ea+EQxW4DM6/jepyCCwD2Oj+bmopNmJWrQfrJhYkuMUeRzk16nW9wIPHw7JpeJ4wQyK/XFoA8iaM/yrHG4m2GonDz34Ye5FNPG0omkTz6GTSaL77ptxS2DXtZSvL0Zq5z90BKGUmFiLV48uZArDUvRvCbyAvJjbFC/HBpeBVpMkORDHa7qZ9ebwzlrPVUMtB+YAEQcAUzEH6McYjQ7B1BtRNTWGJT8DvTdGVZk9BcLLzxykHUBen3mmCnoKfpxYGucETqYdAq4ttFqs0ID698ng==;
Received: from 91.34.165.83.dynamic.reverse-mundo-r.com ([83.165.34.91]
 helo=lorien.jupiter) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1m6uN3-0005od-3N; Fri, 23 Jul 2021 14:33:41 +0200
From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/prime: fix comment on PRIME Helpers
Date: Fri, 23 Jul 2021 14:33:07 +0200
Message-Id: <20210723123307.31064-1-jmcasanova@igalia.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/Exporting/Importing

Fixes: 805dc614d58a8 ("drm/prime: Update docs")
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 2a54f86856af..178e18c28cab 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -549,7 +549,7 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
  *
  * FIXME: The underlying helper functions are named rather inconsistently.
  *
- * Exporting buffers
+ * Importing buffers
  * ~~~~~~~~~~~~~~~~~
  *
  * Importing dma-bufs using drm_gem_prime_import() relies on
-- 
2.20.1

