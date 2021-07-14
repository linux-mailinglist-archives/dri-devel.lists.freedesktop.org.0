Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692713C8BC9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 21:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2036E4F1;
	Wed, 14 Jul 2021 19:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58156E4E3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 19:34:36 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso2428097pjp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2FQMBGV61rbu++SPWaqNiaNrPnCGp0kK7/eBveDCfXg=;
 b=WnP4AMYz4dlcwjMnM0kaiuCYj6PURwLmrD0NVTAHEGInPY8ngeLDYSk1hJwd4JZOng
 pVRRL+l/lyTmpVlLZZlFY/FfJ/YJnN90aNaIyCjp0irvwvi937toxfVDt1o5K+PPLCUN
 WMxgsWRZZO/cuGrT2yZ6t9Qh8V5OnJTKGhnnOBbsA9EtdHwKB+LqYPJgkDkx6mCgSEHX
 IR0HR9DPy4y8Au4A5bvQs0ZmeZJ8awdgn+I3DDIDNiMdD8RRlogc7kvk1Vuz3ccEeYIG
 RhCownIKn/IqEiMxKVASYtvM8CId1+AWePsYDRZF0N5xVCb1SCISC0HvOb202b5DvL4M
 bMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2FQMBGV61rbu++SPWaqNiaNrPnCGp0kK7/eBveDCfXg=;
 b=I0NgRiRYSlGMHjAPv9vuEVJ0BMfcGeDUAhZeUSzXM7Hv/VFG2ls185eqw30RCMZYob
 DaP2pgIaKH/1jvrThDNjKvyZGKuIYWHbXnd97+MUtkhZUC9ver7P7m6g9/ty8TfTIhW4
 UII7RiI9A8per5Ul8xGW2G0uOp50DU0Xtj7oc8a6qEnm8fvI3ECuNS3haEMCHU+lbAjH
 ig6FBAyYCukv5hXtMWfrH3XLy0usX+QDVLtzzEa/pkW5KnrYe09+wiM4qtKd3PY4ORF9
 rFU72qD/nyewDIJQNDRtY/C0wA7Dp5OcXjAZfH7lgTk2KE3IAviTkWbqLJSJdDxOp08k
 Ix8g==
X-Gm-Message-State: AOAM531D/IaAnKR6DbzxJBbSoDXrICkFcrZHrTyRfeuPKOBflWJNMNJz
 DUv4e2NWHUFDOwFoUz4RszuU/Q==
X-Google-Smtp-Source: ABdhPJzSshXVrsovgWhPa9IqmjXRxlW1px/c8NNFX8t3HI5epwU5A+uBmbdK8hKJSPqZiAt9wxi8wA==
X-Received: by 2002:a17:90a:7e0a:: with SMTP id
 i10mr5048837pjl.113.1626291276401; 
 Wed, 14 Jul 2021 12:34:36 -0700 (PDT)
Received: from omlet.com ([134.134.139.71])
 by smtp.gmail.com with ESMTPSA id i1sm3679740pfo.37.2021.07.14.12.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 12:34:36 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] Revert "drm/i915: Skip over MI_NOOP when parsing"
Date: Wed, 14 Jul 2021 14:34:19 -0500
Message-Id: <20210714193419.1459723-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714193419.1459723-1-jason@jlekstrand.net>
References: <20210714193419.1459723-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts a6c5e2aea704 ("drm/i915: Skip over MI_NOOP when parsing").
It complicates the batch parsing code a bit and increases indentation
for no reason other than fast-skipping a command that userspace uses
only rarely.  Sure, there may be IGT tests that fill batches with NOOPs
but that's not a case we should optimize for in the kernel.  We should
optimize for code clarity instead.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jon Bloomfield <jon.bloomfield@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_cmd_parser.c | 67 +++++++++++++-------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index 00ec618d01590..322f4d5955a4f 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -1470,42 +1470,43 @@ int intel_engine_cmd_parser(struct intel_engine_cs *engine,
 	 * space. Parsing should be faster in some cases this way.
 	 */
 	batch_end = cmd + batch_length / sizeof(*batch_end);
-	while (*cmd != MI_BATCH_BUFFER_END) {
-		u32 length = 1;
-
-		if (*cmd != MI_NOOP) { /* MI_NOOP == 0 */
-			desc = find_cmd(engine, *cmd, desc, &default_desc);
-			if (!desc) {
-				DRM_DEBUG("CMD: Unrecognized command: 0x%08X\n", *cmd);
-				ret = -EINVAL;
-				break;
-			}
+	do {
+		u32 length;
 
-			if (desc->flags & CMD_DESC_FIXED)
-				length = desc->length.fixed;
-			else
-				length = (*cmd & desc->length.mask) + LENGTH_BIAS;
+		if (*cmd == MI_BATCH_BUFFER_END)
+			break;
 
-			if ((batch_end - cmd) < length) {
-				DRM_DEBUG("CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",
-					  *cmd,
-					  length,
-					  batch_end - cmd);
-				ret = -EINVAL;
-				break;
-			}
+		desc = find_cmd(engine, *cmd, desc, &default_desc);
+		if (!desc) {
+			DRM_DEBUG("CMD: Unrecognized command: 0x%08X\n", *cmd);
+			ret = -EINVAL;
+			break;
+		}
 
-			if (!check_cmd(engine, desc, cmd, length)) {
-				ret = -EACCES;
-				break;
-			}
+		if (desc->flags & CMD_DESC_FIXED)
+			length = desc->length.fixed;
+		else
+			length = (*cmd & desc->length.mask) + LENGTH_BIAS;
 
-			if (cmd_desc_is(desc, MI_BATCH_BUFFER_START)) {
-				ret = check_bbstart(cmd, offset, length, batch_length,
-						    batch_addr, shadow_addr,
-						    jump_whitelist);
-				break;
-			}
+		if ((batch_end - cmd) < length) {
+			DRM_DEBUG("CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",
+				  *cmd,
+				  length,
+				  batch_end - cmd);
+			ret = -EINVAL;
+			break;
+		}
+
+		if (!check_cmd(engine, desc, cmd, length)) {
+			ret = -EACCES;
+			break;
+		}
+
+		if (cmd_desc_is(desc, MI_BATCH_BUFFER_START)) {
+			ret = check_bbstart(cmd, offset, length, batch_length,
+					    batch_addr, shadow_addr,
+					    jump_whitelist);
+			break;
 		}
 
 		if (!IS_ERR_OR_NULL(jump_whitelist))
@@ -1518,7 +1519,7 @@ int intel_engine_cmd_parser(struct intel_engine_cs *engine,
 			ret = -EINVAL;
 			break;
 		}
-	}
+	} while (1);
 
 	if (trampoline) {
 		/*
-- 
2.31.1

