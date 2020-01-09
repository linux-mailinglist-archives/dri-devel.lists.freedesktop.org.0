Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8F135FD0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0432E6E949;
	Thu,  9 Jan 2020 17:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F40E6E3C1;
 Thu,  9 Jan 2020 09:07:07 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so1937112wmb.0;
 Thu, 09 Jan 2020 01:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=srJzvMMQdpxyH00NoNIv1SdEKNzlKV0X21LyZXL6/tY=;
 b=eeOkVav3QtkOQrSyAYP34ttKjtKRxUKJhIuZS0/TC1uLiiy5EpnkIUgVGpyXGCiKPt
 y0rwRvQFOx9fIYvgn7CmD5L54YaTt/zNKp5DfCABveJgki3N46zSurPNPLaXPOHLX8VF
 CH9uC3bE5Ty8npPc4AyAkwYkN84BJzhmq/1cnwn6Z04aqzSH/9c4AZauXO1E4lrkm/dQ
 BFwFDS0W9DbkoQMGul67giCNYsI0hidenVfSl8/2ZeLQ2I/AM/x8Jo3qaT4JvTYrb0fO
 SSx0G6KQzB7gBHDVz0w1SsBk8hOc81svJhFYAQS/DACCT92W6KpJXM3a2AFjKQgrSQTb
 lsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=srJzvMMQdpxyH00NoNIv1SdEKNzlKV0X21LyZXL6/tY=;
 b=rjg857y1hZsKQqmW4j/K+hNOePAGu5fzy1gTUJfLhdC9PEpOG4/oXMXV74VtWzzTt7
 whqFHA/6WtL9yQNvX5yrf+aM8n+wiPV6JsIVU5nJYBeZPW4o2hwtGmSlBpT7GUGHa3DU
 ELNvmS/txT0vTjFgRnC/K//l3Z2TBmN3RI6upS5S+ehlGpvjC+Cs6AXn0IxMXs0Pc+Bz
 smvFnrbf0zHOE+HdtIhjgWlIj5D5qHSjZr5OjhDJz8If1d/hUln1fGgHc9U/uldaconX
 kFOfjyiSKuS+RV9QbSX2VbVdtXdDl84fcwZhX7vkBFyl57vVjoa5vyQcjVLUq+SUeqqX
 ZmAw==
X-Gm-Message-State: APjAAAWQta+BX0yTeIzeaamueJRgo9XlO9JJaxi6Fezvt+uoMD0GiDek
 cJUpDiHHBN+tCUvwDF0cbNzwjNt05QE=
X-Google-Smtp-Source: APXvYqw3p1tNZvJ6wGQcHlYj+kueCXToKBOgAY9fxM9CWd7N+g8KXeUHmFyiTOoSrXAf60CTyuKZYw==
X-Received: by 2002:a05:600c:2c50:: with SMTP id
 r16mr3398556wmg.74.1578560826373; 
 Thu, 09 Jan 2020 01:07:06 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i8sm8004734wro.47.2020.01.09.01.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 01:07:05 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 5/5] drm/i915: convert to new logging macros in
 i915/intel_memory_region.c
Date: Thu,  9 Jan 2020 12:06:46 +0300
Message-Id: <1bf4d362e72c619843d44aac96c3561f54e4b23a.1578560355.git.wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578560355.git.wambui.karugax@gmail.com>
References: <cover.1578560355.git.wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of printk based logging macros with the new struct
drm_device based logging macro in i915/intel_memory_region.c.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index d0d038b3cd79..6b5e9d88646d 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -265,7 +265,9 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 
 		if (IS_ERR(mem)) {
 			err = PTR_ERR(mem);
-			DRM_ERROR("Failed to setup region(%d) type=%d\n", err, type);
+			drm_err(&i915->drm,
+				"Failed to setup region(%d) type=%d\n",
+				err, type);
 			goto out_cleanup;
 		}
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
