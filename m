Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2693C3A0B
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 05:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A706EB88;
	Sun, 11 Jul 2021 03:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EDB6EB84
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 03:53:48 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so13644165otf.9
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 20:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2FQMBGV61rbu++SPWaqNiaNrPnCGp0kK7/eBveDCfXg=;
 b=qnBxPTOn/9HKKMAJFy/aV6f4a/9EGTpHNLOHYLMKKhjf19oJNcgkuGa8cn4g1potGs
 /Gec8L8rwYekl+gn4T4i7o1NUz5h1vwI31yq5EYYp9OEOHCg27oYkrg+BakI+QsEKQSA
 2BkUNnSroe7vBe/umWN/esXDPS2hXRTbQvw3Gx/dx5Rvy+HFz8G13cYfbzpbSgGo5nA6
 xtETMpJCTdQgwfQPoyB+KQ+KvWH0EUx7z9ppdJ19SgWiS4FxcOvb/2SXU2+fhxOHt+A+
 pb0tPf5vjF4iIbLWGJ8a0c6V3HLTMn5tXXsJsBcLA2AR/2bLUcmjdBzPqWYSgYecu5k8
 JBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2FQMBGV61rbu++SPWaqNiaNrPnCGp0kK7/eBveDCfXg=;
 b=tUdvgMhf0HO1I+O6eBZPetkR6bbH/MrpIDPBdPUjxFJC6vrsMqsebfdV6vvF1k5reD
 ugU5dhv00Wfpw+F++PF4m5d4sEamsTvl0+3s2n112jiPrqqmbWZXi8lAgwbHL/UpIFtd
 6vfq1KmHsmanJJ5zjvjXZBCJTAloUOgE7aAF3wsfadJ/P275Wr6ISx2NyD13tgUKFlQ6
 Ify/UOUPinX/VAm5lyHID4WiS9P8BrNkpXMCDNZ69ESbDueXv/DS1/Ff8PzdKfx83sC5
 NDwvnzLhruDc5NVUGwL4397Gr2pMs/QaMXS2bsXP3I/DH9zHLL3/XCDNd1yIIIULYNl6
 ynaQ==
X-Gm-Message-State: AOAM533IxoJU/82ig0Ta3+8TsFdAeaLCxr4gCONhx0CLOm6dqw0wO/Y4
 ylVx2ou9b2gMQ19UFNOOIJZBcQ==
X-Google-Smtp-Source: ABdhPJzhp5cd61Tar6mHgPey5Ar4kcXsywGdP6Lj135bvrmuHCXUzQlZAZ258wP78ZcghP95FjNe2Q==
X-Received: by 2002:a05:6830:11d0:: with SMTP id
 v16mr25831133otq.273.1625975627064; 
 Sat, 10 Jul 2021 20:53:47 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id a11sm2310188otr.48.2021.07.10.20.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 20:53:46 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] Revert "drm/i915: Skip over MI_NOOP when parsing"
Date: Sat, 10 Jul 2021 22:53:36 -0500
Message-Id: <20210711035336.803025-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711035336.803025-1-jason@jlekstrand.net>
References: <20210711035336.803025-1-jason@jlekstrand.net>
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

