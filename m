Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A624632B84A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CC16E97D;
	Wed,  3 Mar 2021 13:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255056E97D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id f12so19933381wrx.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sz9Cp9ck6lJ+tMgVjEzPh2tJa07UDmiPup+Dgs8FC3o=;
 b=iRy5BujrVB9UEC5KMSnntpLfMBSYx0sVYaWNWZtKRMbnfDlkW/xumxxReE2x6f5B+j
 C0YnAMlW/JaMuXcrib4m8rvnxbyOZ36xtoSET7LYyASMvRURQhfJ7pf8bl+g61GAK/np
 twPqCvB89X+kHDseXK0/0AcK3ZFQREgadEuf4s6F5u7rpsa9yGgbVByv8gCdVwye7pZR
 eW4VH77/+ncFbnovCOdTWhN12gKBWETnnMn3yqNib52JMaMAjMggvud4liml0Oznjr6H
 NUrXh02BQETuPOpXgl6++cFz53olwrsHgUlUBbSl/5PfOJnaoV20ZB2d0nKg42s3n9Mg
 3MGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sz9Cp9ck6lJ+tMgVjEzPh2tJa07UDmiPup+Dgs8FC3o=;
 b=emsSEX0E3OSxX04nE5AILzdCQv1/9ee1JXY5rmQPOuKg4FmXVBrFWQSTso7QKgySCU
 Ilr2MIHQY/cbKey1sdabhDIt6xDga8eZrkPbJwesS7hl9IWBdfpCdpsHXN5F5GA++faR
 sCAJzH4Iixv4+BVQaLAzP8dKA/4S5lDOqSgjl3zHifW4NNSvMQW+5giazdRSxmt6TLFV
 ii6ev6B+iSi5+REyI1YuXb7kS3oA/bbXra/fwFym/fSD9ycvD9eP20irFAsbTHmOuHFA
 FYQf22IEfEiv93xM7MxJ1ykqaRxdC6waTGTVrKIqz+177I4tLDw9/MoQPUgTA4jnm6kt
 eN6Q==
X-Gm-Message-State: AOAM5327HPHS9URjQyioD+Po3kef0/UsxEbtnkTBOLM7tIUbgVBSIOJ/
 n0ZMQr+RGdDnMGzEcYNaTkRjrg==
X-Google-Smtp-Source: ABdhPJxZtKJwNy4AEa9+LfCn/Kqgk+fd8Wxe16REP0b9PL7P3uOVtkPWy2CEDF6SiwDSEhPhb5aGQQ==
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr27897680wrx.166.1614779066850; 
 Wed, 03 Mar 2021 05:44:26 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 50/53] drm/vmwgfx/vmwgfx_validation: Add some missing struct
 member/function param descriptions
Date: Wed,  3 Mar 2021 13:43:16 +0000
Message-Id: <20210303134319.3160762-51-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c:85: warning: Function parameter or member 'dirty' not described in 'vmw_validation_res_node'
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c:85: warning: Function parameter or member 'dirty_set' not described in 'vmw_validation_res_node'
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c:216: warning: Function parameter or member 'res' not described in 'vmw_validation_find_res_dup'
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c:216: warning: Excess function parameter 'vbo' description in 'vmw_validation_find_res_dup'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181601.3432599-9-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index f2e2bf6d1421f..e7570f422400d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -48,7 +48,6 @@ struct vmw_validation_bo_node {
 	u32 as_mob : 1;
 	u32 cpu_blit : 1;
 };
-
 /**
  * struct vmw_validation_res_node - Resource validation metadata.
  * @head: List head for the resource validation list.
@@ -64,6 +63,8 @@ struct vmw_validation_bo_node {
  * @first_usage: True iff the resource has been seen only once in the current
  * validation batch.
  * @reserved: Whether the resource is currently reserved by this process.
+ * @dirty_set: Change dirty status of the resource.
+ * @dirty: Dirty information VMW_RES_DIRTY_XX.
  * @private: Optionally additional memory for caller-private data.
  *
  * Bit fields are used since these structures are allocated and freed in
@@ -205,7 +206,7 @@ vmw_validation_find_bo_dup(struct vmw_validation_context *ctx,
  * vmw_validation_find_res_dup - Find a duplicate resource entry in the
  * validation context's lists.
  * @ctx: The validation context to search.
- * @vbo: The buffer object to search for.
+ * @res: Reference counted resource pointer.
  *
  * Return: Pointer to the struct vmw_validation_bo_node referencing the
  * duplicate, or NULL if none found.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
