Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF732B4DC9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75B66EA0E;
	Mon, 16 Nov 2020 17:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF3C6EA0D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w24so57299wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w5fAxh5tnngNJF2VB/FxBFEjPf9+WnphDOVk5YyhPg4=;
 b=QGRS8dZaH4fBWVeFr/tutZKDHKcWCbSLtvBJ+9LmydZVFOhD7SoaCJwz/AwgWnKNOI
 BtJRrGzbvgoEtzBAzr3h9RoBz0y8vIror5Qqj3f9+6BQuwYmegEcAX8emgB+5Da1twow
 ct2u0AdI9tex8VkIHsjHo/NAuIACwN9gMqK2km3XnTjhr7hGq66KQwWMIW0WChyVgaIV
 tISXrg5wv0aiYg/ONBv0OQwOix0LQfwBpS8KIBBd03tzn/zC4qOzJwuzTGus7dXT4eL1
 nDYHFF1S8jXG02wW0XX9sfC4vRpPRo13z4F/rQ4322u/7rMXIsZmJwxfd6dAXKDoBLeD
 4Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w5fAxh5tnngNJF2VB/FxBFEjPf9+WnphDOVk5YyhPg4=;
 b=shCTUzg2MmKcgpCQ0L2YYfYQ91uXmfEyfr9vHC4QXX4KASxYI0tdDGGCf+OE3VCTbK
 y+QNLYWdn/0nZzkPHby2+I6CPCUlWFSNxb8klmkdL1GzvQyWWms5JYDaZLUWtZdAI8AX
 ugMMnJxVnDHRpfBlrUirOsWbvnt95hn8LBHF7u+ZJrNsMVbeNjsa5r75e+5D/GEoSWXR
 jN95Z3Rd41hRoQwN12miDDRchH9DFKaGRWK13YfvMHWlXcozl2nBtnz1+Xqiw5GCpL1k
 BFgMkgZAo+ee/mFp52Ui9rm1oYgwuFIVQmDJqroXxJGfPARXhJx0eEqgApCruYird5HY
 Kziw==
X-Gm-Message-State: AOAM532JGZk9ovIsjxiK6jAt1Mh20/D9FDGk5wpe82qwOGwq84I+yVeL
 5C8zSFMS+tCLvSupTY0L1ZlflQ==
X-Google-Smtp-Source: ABdhPJyX+vq2jy2gK34lUOqKpajZ7ybNU67R2lMx+cLVP+zfYtJjk9BfCDO9pecgpeu16QDZ3Qry7g==
X-Received: by 2002:a1c:dc43:: with SMTP id t64mr16301052wmg.93.1605548525472; 
 Mon, 16 Nov 2020 09:42:05 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 32/42] drm/ttm/ttm_tt: Demote kernel-doc header format abuses
Date: Mon, 16 Nov 2020 17:41:02 +0000
Message-Id: <20201116174112.1833368-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_tt.c:45: warning: Function parameter or member 'bo' not described in 'ttm_tt_create'
 drivers/gpu/drm/ttm/ttm_tt.c:45: warning: Function parameter or member 'zero_alloc' not described in 'ttm_tt_create'
 drivers/gpu/drm/ttm/ttm_tt.c:83: warning: Function parameter or member 'ttm' not described in 'ttm_tt_alloc_page_directory'

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index cfd633c7e7643..da9eeffe0c6d7 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -38,7 +38,7 @@
 #include <drm/drm_cache.h>
 #include <drm/ttm/ttm_bo_driver.h>
 
-/**
+/*
  * Allocates a ttm structure for the given BO.
  */
 int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
@@ -73,7 +73,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 	return 0;
 }
 
-/**
+/*
  * Allocates storage for pointers to the pages that back the ttm.
  */
 static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
