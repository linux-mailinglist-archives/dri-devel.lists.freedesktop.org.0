Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E275C39A4DF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5E16F4C0;
	Thu,  3 Jun 2021 15:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CCC6F4C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:40:43 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso4142632pji.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y6IAgUJZtt2gJKrtPdNwj98Pb9Ilc+au0f+PZyMn5qo=;
 b=koVMqgEXYZa2b0VKhXDmuH71Zum0jhVACJfkIHo2TYnkskWYJCyVOx/0i8P1wWWgl7
 3DmrKKpIlRTh1MF+i1xLBetge+HHbdAPUUleqmCEZ3YrPT0R2J83YmOlh48rEOC8KRmh
 f1My3G23CGwRwCFQGKprl66xd4+ylLVeEHvho8dHtBHlliejGyikFybjG3st2jOGcqhc
 VT9Qy0yxFTqiOFggvAEJn4jwOZq0YXKnIALzH4KMyFZG1quHhFtN3T7RRZC6vdqvHDC0
 SL3kkrHKma5XeRGsTobAEA+0HfRW4urIjkk9EgJBhOXs3RlVFvSDgEK8dFzhH7rv7EZ2
 41Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y6IAgUJZtt2gJKrtPdNwj98Pb9Ilc+au0f+PZyMn5qo=;
 b=PQn2ndldPLg6hedd6bPZxNyl9m9yW4CmlttaDlksh9665pKvHj0dskR2LDS8ku8c+5
 c2j1l7RLAyc5Hw7W2IPPKEFvz6i5+2emUdrsENv41OanZTL2l9Fc/HIWkcc0umDtKgBQ
 frgb40bLvarbK96j3JoLNwJJfh3OJnW1V+pQ8b+7PCnl+OkAKJ/E8MFDcVohl8xOusgF
 glkwcI50I88r9C7sdNDm22Mo3p+VXCvk3s5KGL91Gmpp5jRR5hAPntl9CXfPb+9FPQov
 Vmz4VHfys9V7FzJG8DW2a4pWRU3oFIxCBff/gbU2niamajlhOSpRAaR3lVbuFni1XFJe
 GKrg==
X-Gm-Message-State: AOAM533pncvrLJsUSKxKApUXwyZcJEkxpNWgIrVemA3xgs50lpOg4bKw
 M2SJKgis8XjvEwcuD4yQAJNDDw==
X-Google-Smtp-Source: ABdhPJwjcbHINZXX1ZHBBEvCVnk/uxXjJZD8NNQeBjSCFEYqT/mBXznXZaX5IZY9uA48haTCpakykg==
X-Received: by 2002:a17:90a:117:: with SMTP id
 b23mr552629pjb.183.1622734843523; 
 Thu, 03 Jun 2021 08:40:43 -0700 (PDT)
Received: from omlet.lan ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id mp21sm2681789pjb.50.2021.06.03.08.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:40:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] Revert "drm/i915: Skip over MI_NOOP when parsing"
Date: Thu,  3 Jun 2021 10:40:27 -0500
Message-Id: <20210603154027.594906-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154027.594906-1-jason@jlekstrand.net>
References: <20210603154027.594906-1-jason@jlekstrand.net>
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
index 056a233f443b4..8d34f05d22b75 100644
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

