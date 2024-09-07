Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A668596FFDE
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 05:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D095810E9A3;
	Sat,  7 Sep 2024 03:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gqvO1yn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD26210E9A3
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 03:37:10 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5e1b50fea4bso576105eaf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 20:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725680230; x=1726285030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bdn1vzRRTAxkrY+XEO+BGgWLg/pK8pUQR7KL2TxVAiA=;
 b=gqvO1yn7a0pz1NvkZHgk8Z3POaeHoc5W4Lrk1Rd+ju4pRLdSb4pW17ihqFXhat6+61
 jTPHTSed+PenDgfw46e/3ThjpY25JJJGoJiEm23pLdbmh45uX5N2/C9GsXZPjJYccSKn
 nYwMqzmVZv8CpMs3GIbP1AJIuZtK7iJeoxF+Wow7IJkF8Kz7LtKabbDSVa4FScX68NnF
 qUSxkqsfreMQQccYpYvGkNKWXju4rrnUfGySiHsS8lwHHUk9D3pJNslVbekjduuQZS7z
 HWoViSkswASOhcP3vV5rWq+A233nxwqYL+9rrVZAqmJQdS7AEu7YZ4pG8kS29Ny0qAHA
 BY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725680230; x=1726285030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bdn1vzRRTAxkrY+XEO+BGgWLg/pK8pUQR7KL2TxVAiA=;
 b=Y8fvYNGz0JJc+7ObusYQwDc86V/g33MUaUxJrbUjT02MmnWsoQ6EDSSpOIokZPCLDA
 lXYFibsLQaQF6QSs929Le8F0xULoQM7x9SPx5Zte3U3Ctjw22554cu88TUD2hknGTGc4
 X8UhgYHQkTYl2MsTQAP1WfXQ0SUa/NVudaUMEDH402qvLnV2GVUF6XmFBgvW9Wec9Vig
 /r5ZQV5+AsCbLzoJja69KDJIeXmbAPX9ETHa4uzz678zVw4ZT01biMgC9k6fWfMa1RG3
 4EEojP7H3Leus52l71rRn0jC//8HleCvyIUW+sxSouf+ULWJrZSYffo38vMXQCsirku3
 1eJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXizmj8y4fj5l4wimyscT6Vzn2u5uQktjK1NzYOw0+XAXKUACGCXXYFUFQX1UGCHdx2/2B16s2Ls3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxOl2Vcb0dqYJZ4uvGrnVfjgRkakF3QQdtt7APVjhbtYHSOtOn
 Hd3kLnlLHYbr7rKkuEao3vWg/yqfZ8oOOBKOhSjE+p8lA4dIHbzO
X-Google-Smtp-Source: AGHT+IG4gOsQ09yMILSjZI04blubJ9v01hUa3KPBH71rWt2ry/eeQM6gjBxX9uOR2G0GPYSV5n6ALg==
X-Received: by 2002:a05:6870:b294:b0:268:a79a:be0d with SMTP id
 586e51a60fabf-27b8302d7f6mr4854143fac.47.1725680229766; 
 Fri, 06 Sep 2024 20:37:09 -0700 (PDT)
Received: from localhost.localdomain (111-240-109-89.dynamic-ip.hinet.net.
 [111.240.109.89]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-718e59841fbsm217637b3a.167.2024.09.06.20.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 20:37:09 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH for-next] drm/ttm: make ttm_swap_ops static
Date: Sat,  7 Sep 2024 11:36:41 +0800
Message-ID: <20240907033643.1513301-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.43.0
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

make ttm_swap_ops static to fix the following sparse warning:

drivers/gpu/drm/ttm/ttm_bo.c:1142:31: sparse: warning: symbol
'ttm_swap_ops' was not declared. Should it be static?

Fixes: 10efe34dae79 ("drm/ttm: Use the LRU walker helper for swapping")
Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 320592435252..1aab30767e41 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1139,7 +1139,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 	return ret;
 }
 
-const struct ttm_lru_walk_ops ttm_swap_ops = {
+static const struct ttm_lru_walk_ops ttm_swap_ops = {
 	.process_bo = ttm_bo_swapout_cb,
 };
 
-- 
2.43.0

