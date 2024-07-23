Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D18C93A06D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 14:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E4810E5A5;
	Tue, 23 Jul 2024 12:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QrtNINO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853F810E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:17:58 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ef7fef3ccfso21685801fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721737077; x=1722341877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3wMHum+UoXT63Pe1yg+we/u4h/jc6mtBqyHZk0WA4yk=;
 b=QrtNINO4Gqbhwh2cS/QQ9cOBkRKzmqb+X8WyQ3WJtaCv6j0doBLrdcPODhE2zzcFIN
 UbJNLxWHKP0QkwOYra6q/b1mggSnfZjQdBqdDu+1nPAxCacr732v3b/CjS4cHtpe218u
 MxuDJk98ODwxUAUSe8lvp1scQC4XQMb9IEj7nNw4jqhYXp4IRlDdl2besdBDfnR4hR8H
 r7vvpbriEYBvIuvDo58+th+SYxWMy4NH8V0XoM5u+eR0B60zMl2Ku2pziZOPm+AA9gl2
 azkSXjwxtKLbOYJ5glydS5iHS+PddBOuEJGru9eHSjUHQBtmnk8dZ10/5nd/A1j46wjg
 DnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721737077; x=1722341877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3wMHum+UoXT63Pe1yg+we/u4h/jc6mtBqyHZk0WA4yk=;
 b=s8bZoWBC6JJfRk8vmONX3Rm4bySAaLMlPqQVhRUgNFHYKC2Cbt2s1wDyQHm8BBGtJl
 E7uBLSW4DgvYxIX/Nu1tHmUtezwGUFOjUs5sx/xUFBM+IZhWg5PGKka+JZtVdx7TMkW8
 zmXy7JocgVM8gIFg6ZH8336ajtVCt92jHupfaQGn/OQLQW/9HgBXAYkPUKMh1cjQ8VVZ
 POVZ3ENi2jPben2Oo3mQ3U7T013HP0SLX3S8uj/8PPuJPC/B+qEZEDO+3FyIoZ9/t9yu
 22Qaz/xGcxpUwHz1vU5e8Vv70jEwtl+6mF5H4V4zlqhwZ3+MIKWMcTxRVWEDY/8jLcDm
 3o/g==
X-Gm-Message-State: AOJu0Ywb5KrayQ+rgTrtvsxSYC2YJO5cAkZhp5d67L4v/BW+Vhf1ECo6
 lxkWmp5WSuWxTAn6r+OMbz12BJv3UvD6RFV8dZ6wXWILplrNTLj7
X-Google-Smtp-Source: AGHT+IHQVjHS4xo4fui6GdNgP9z7WAICe74rnRcyk4kJZ1nUz3Z3uD88iD1hMg2yALuyYcVzCXeM4w==
X-Received: by 2002:a05:651c:1a0c:b0:2ef:2dac:9078 with SMTP id
 38308e7fff4ca-2ef2dac92e3mr56102941fa.16.1721737076027; 
 Tue, 23 Jul 2024 05:17:56 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1540:9700:699c:86ac:5633:2a7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427db2a4e3bsm138119595e9.44.2024.07.23.05.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:17:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/vmwgfx: partially revert "Adapt validation code for
 reference-free lookups"
Date: Tue, 23 Jul 2024 14:17:47 +0200
Message-Id: <20240723121750.2086-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723121750.2086-1-christian.koenig@amd.com>
References: <20240723121750.2086-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 64ad2abfe9a628ce79859d072704bd1ef7682044.

To me it looks like this functionality was never actually used. At least
I can't find any protection in vmw_bo_free().

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index e7625b3f71e0..e11837e484aa 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -262,7 +262,8 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
 				bo_node->hash.key);
 		}
 		val_buf = &bo_node->base;
-		val_buf->bo = ttm_bo_get_unless_zero(&vbo->tbo);
+		vmw_bo_reference(vbo);
+		val_buf->bo = &vbo->tbo;
 		if (!val_buf->bo)
 			return -ESRCH;
 		val_buf->num_shared = 0;
@@ -656,7 +657,7 @@ void vmw_validation_unref_lists(struct vmw_validation_context *ctx)
 	struct vmw_validation_res_node *val;
 
 	list_for_each_entry(entry, &ctx->bo_list, base.head) {
-		ttm_bo_put(entry->base.bo);
+		drm_gem_object_put(&entry->base.bo->base);
 		entry->base.bo = NULL;
 	}
 
-- 
2.34.1

