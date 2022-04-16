Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C64D5037B4
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 19:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77CC10E3D8;
	Sat, 16 Apr 2022 17:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4466610E3D8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 17:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650129819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xZJdeEB7LRc/tdjD5XNMXjOZKOVeiea7oToBzOvG+54=;
 b=UnrU5u/btCYw5FZNi9V+YJ6IGdce7hqUTj3Ow/eQAv+gac4z0QYpttzKLIwxXiOkXlf8XO
 GfNKAQLt4p0F+KN6iMaZoFsH5SOTW4AY+iF4MVJ4tYlQrwG0mnRgG3d/5V7d8v+jq8h/Fj
 SHahKlVExYGYi4uG5mXkFpTbjbyaHWM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-jd6WC18hOuei5m132dpfVA-1; Sat, 16 Apr 2022 13:23:37 -0400
X-MC-Unique: jd6WC18hOuei5m132dpfVA-1
Received: by mail-qv1-f70.google.com with SMTP id
 z12-20020a0ce60c000000b0044632eb79b3so4574673qvm.7
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 10:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xZJdeEB7LRc/tdjD5XNMXjOZKOVeiea7oToBzOvG+54=;
 b=MU+wrUPYcEx5dq8D7pPoGX6B2BytE7D0cN+BG+V5XpHJr8k8L1aF2p8ErtMImzhRL1
 q+m50WaCfnQmddrikwZ/n4U1hQW9cvQAQlxotMsqznXu8DakB89dd5+dWmJzwKj0NkGF
 s3A81i5DHMUw55q07+2QsRWSO8dGLGorVjlwMw0gp4781xUQuIHOAhQDYgNmAGytLLWd
 qI0JQo6pv+QLNH+FwCpUfN3a0DtK8FXwP6tyovoEatVDRVExaKZL6r9Ci10qTMcLsq7h
 JvWDaEdwtN6d8rT4SLu9FyR+CtV0mkelhmPrdR7Ei9v061fXrM7YYXo0sM/NPGKmjzFE
 TCRw==
X-Gm-Message-State: AOAM533JTMyd878i/d1Jv8lfKy9oHhqqBiUknhS6mIpJ6HS+jg/+Uio+
 eNg362d6RPdTRS6P8vgfysTjTD1kzUjTd+4b95Vy2z6ftCuZV87zirh9LC4PM5L+SlP6RMDduK/
 LqEOXd1rn5nr+MNd/okIdgvZd+1gS
X-Received: by 2002:ac8:59d4:0:b0:2e1:f86d:b38c with SMTP id
 f20-20020ac859d4000000b002e1f86db38cmr2760716qtf.285.1650129817258; 
 Sat, 16 Apr 2022 10:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAEeXarJj7i8MC2Tcj5mB+1+LrS7bjnC2aeIcVvjZ6kbGfJHZPt0VaVk2XcNDtSL6OwKTS1g==
X-Received: by 2002:ac8:59d4:0:b0:2e1:f86d:b38c with SMTP id
 f20-20020ac859d4000000b002e1f86db38cmr2760702qtf.285.1650129817011; 
 Sat, 16 Apr 2022 10:23:37 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 n186-20020a37bdc3000000b0069c218173e8sm4079598qkf.112.2022.04.16.10.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 10:23:36 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/i915: change node clearing from memset to initialization
Date: Sat, 16 Apr 2022 13:23:25 -0400
Message-Id: <20220416172325.1039795-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In insert_mappable_node(), the parameter node is
cleared late in node's use with memset.
insert_mappable_node() is a singleton, called only
from i915_gem_gtt_prepare() which itself is only
called by i915_gem_gtt_pread() and
i915_gem_gtt_pwrite_fast() where the definition of
node originates.

Instead of using memset, initialize node to 0 at it's
definitions.  And remove unneeded clearing of the flags
element.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/i915/i915_gem.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 2e10187cd0a0..7dbd0b325c43 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -69,7 +69,6 @@ insert_mappable_node(struct i915_ggtt *ggtt, struct drm_mm_node *node, u32 size)
 	if (err)
 		return err;
 
-	memset(node, 0, sizeof(*node));
 	err = drm_mm_insert_node_in_range(&ggtt->vm.mm, node,
 					  size, 0, I915_COLOR_UNEVICTABLE,
 					  0, ggtt->mappable_end,
@@ -328,7 +327,6 @@ static struct i915_vma *i915_gem_gtt_prepare(struct drm_i915_gem_object *obj,
 		goto err_ww;
 	} else if (!IS_ERR(vma)) {
 		node->start = i915_ggtt_offset(vma);
-		node->flags = 0;
 	} else {
 		ret = insert_mappable_node(ggtt, node, PAGE_SIZE);
 		if (ret)
@@ -381,7 +379,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	intel_wakeref_t wakeref;
-	struct drm_mm_node node;
+	struct drm_mm_node node = {};
 	void __user *user_data;
 	struct i915_vma *vma;
 	u64 remain, offset;
@@ -538,7 +536,7 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct intel_runtime_pm *rpm = &i915->runtime_pm;
 	intel_wakeref_t wakeref;
-	struct drm_mm_node node;
+	struct drm_mm_node node = {};
 	struct i915_vma *vma;
 	u64 remain, offset;
 	void __user *user_data;
-- 
2.27.0

