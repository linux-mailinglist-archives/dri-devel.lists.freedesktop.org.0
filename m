Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B4F46936C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5978D73EE0;
	Mon,  6 Dec 2021 10:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162B76E8A0;
 Sat,  4 Dec 2021 10:55:45 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id r26so12809125lfn.8;
 Sat, 04 Dec 2021 02:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ZsaCGjkX57VU37ZwPgn6ut1UEGl/i4rIkhwzK9YXBM=;
 b=VbjZssCqahnEymdQXcugkZM7CINrIXO5t9jSAm+Eh1GBeOrM029IZ7lisGsN2PjAAr
 GAtNyIdsfkAv3UL58N7abxCO+OfvpgnJ74wF4M/7t1xV1yFH3QfACbyE9A5Qy2bq8eX5
 mnDtxBPIOKugY0cN7RXl9Of+xgZPnk9JtTOmBtqzGRvAPnkFmN/0GmOlQLhy5fQzeKhV
 TviY0fd40sOg/8Np4s+rmVC2GVPDWvpjjRVkadRz27Eo6bWinsXoRCjSRyIZURsqbm3X
 c6jPzBhz2S3o37CaQtbVCXcJy6bEIUyZvzJX3QMvVykNijnjBCfg3DW3Ao+Pz04+NlyG
 K07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ZsaCGjkX57VU37ZwPgn6ut1UEGl/i4rIkhwzK9YXBM=;
 b=19oBFNGvdmdtX+/omz8ekNzOoiKlyvTTpl+EfoBZ+LyCOotkzD1amSLMkOmSJLxl/6
 A/0BQj59xRybTR0vFsHvlUvloSlS1jR08LIVy5LSF8C6tbKYjqkNomiRBM6IO5tNrrxB
 DM0aoG8v/3Rr+Mt6HZnQvYkfGznWM/OpAH0uBDZLbhXd8O7sJQ/HGwHoV1ym7WFL/VTV
 tfE22/j2L2QwOOaZrkgc72rZXcd7oZ0wxVCAA6nFCvreaZ/8j2ms8r/+fAI1uKY9F9ej
 q5+pcehFYLYnuFgP2q5xULavi0q98DMK1wpJQDey4gA50tBHyRIFag6feXBKJE4YWQ5q
 NPgA==
X-Gm-Message-State: AOAM530P020bnJGFeZk4S/BT7WYO1q7Pw6uV+INgecyCTY7hyUgWPw2G
 56AoMTBvKTtPNda4BOsIkws=
X-Google-Smtp-Source: ABdhPJzrSS7wNoxNyAhHl4z41bEtVkFVwiO6lKZhMVCjLQSo3N3FFW3/Lz5atIf67FXVDwU2xT4v+g==
X-Received: by 2002:a05:6512:13aa:: with SMTP id
 p42mr22646580lfa.474.1638615343479; 
 Sat, 04 Dec 2021 02:55:43 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d23sm723918lfm.107.2021.12.04.02.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 02:55:43 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 9/9] drm/i915/gvt: Constify vgpu_types
Date: Sat,  4 Dec 2021 11:55:27 +0100
Message-Id: <20211204105527.15741-10-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
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
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is never modified, so make it const to allow the compiler to put it
in read-only memory. While at it, make name a const char*.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index fa6b92615799..8dddd0a940a1 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -77,7 +77,7 @@ void populate_pvinfo_page(struct intel_vgpu *vgpu)
 #define VGPU_WEIGHT(vgpu_num)	\
 	(VGPU_MAX_WEIGHT / (vgpu_num))
 
-static struct {
+static const struct {
 	unsigned int low_mm;
 	unsigned int high_mm;
 	unsigned int fence;
@@ -88,7 +88,7 @@ static struct {
 	 */
 	unsigned int weight;
 	enum intel_vgpu_edid edid;
-	char *name;
+	const char *name;
 } vgpu_types[] = {
 /* Fixed vGPU type table */
 	{ MB_TO_BYTES(64), MB_TO_BYTES(384), 4, VGPU_WEIGHT(8), GVT_EDID_1024_768, "8" },
-- 
2.34.1

