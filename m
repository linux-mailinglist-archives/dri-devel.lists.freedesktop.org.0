Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CDFA18DA2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 09:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0FA10E690;
	Wed, 22 Jan 2025 08:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yvmxvy5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3E810E172;
 Tue, 21 Jan 2025 10:43:19 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21670dce0a7so113022605ad.1; 
 Tue, 21 Jan 2025 02:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737456138; x=1738060938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Tl/gGsRPHRlKfMk3m6GA72SRpbhaa2/0Y9Q3kM0kF0=;
 b=Yvmxvy5AtKtog8lwCmzEKkBTnT4f3V8NEFljKi8/CKaVCMocBFod3LkbmQ8VzyOdgs
 3HSv/EgCqkHg5TvM2HMdouU+gvO9VfUQAdpCtq5LgdsT5PNP6sq+BbJV/wSdZDjoktvk
 9o+I0oF3wRJaQaVvY7cBjK8jXbP+aTxUC1aPRXBO91Yg2Zl0rrmPzQSDJonp90OQ70IS
 mLox0HjWvraSB1Kf8F6m/7PMhohs648QHQ0ncg1+3aX3QMI91QPad6AZnhUuZE7Eq418
 o65UVCNwM4zgiNCwYzi9cHDkxP3RiZVzIliwiKvXfR++7AjHJsovZmeD+6kmsbLHBAhN
 yrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737456138; x=1738060938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Tl/gGsRPHRlKfMk3m6GA72SRpbhaa2/0Y9Q3kM0kF0=;
 b=da5fKLmeSVZbY8jIR36Sa9kZumgrWBaEfFcIofr+CZ4L/oujlmdlLe/wLneF2eUTKO
 I+0O6wryHevzeC/PUwsV+aYoX0OghQU48S3Cjs/MezwqecCwhiqXGNQbCiD9tJPtWRuW
 dC81HuT/YzcpxtGIRutUfw/KFwz5FIwnNnKddV2uFlYRgckylXOMNL3MCoiPgY9ABoSb
 6SaNgD1A/fOssO657H6cUkjoJZvyBm476dXCX9kyPzjvr4bWQeuuQrjY3UZ3pDcoPSj7
 5lRe7k+ncQiDhxc47urX5b9SfOk62JIJsjSAmC+/X445gSFNwhXj5EJcnNntAhnBwvwD
 nJxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqMjjfrgR9qkUk4v+TWc/0ODhZ9nj395aMf+LbHjgJsPK/0h85rTs4StChx5MNJwi36PfOspuYDO0=@lists.freedesktop.org,
 AJvYcCUr/unrKVhL2E4GFkuuN8m++aABk8kaPPWjaIBgbUOxVPbEXwkyBeIz0Qi3V/WeqCRo8E2B0l6Ajqk5@lists.freedesktop.org,
 AJvYcCX9chaVztTqQYevJxGO8STD+/9Ci+q7yUilKq39nRU0AVUBHgHnocR39rgEYaoaYyqVyNktC0T6U/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaaKnnCxumVJ3adDclIQXQ3xXhuMQqBW7Gsdm0HTMpFnsXdMis
 /CIMoNJowGeDSmhsj6YYRiGpSTwQf4hiplOFiUuqTgWaIaQhp/9L
X-Gm-Gg: ASbGncttpwaBokdmMy6I+n2t3imuHFI7ZXxoG6MqBqpTzqPaSLdZ1rXaCmOJtNQsLIQ
 I6zNTrSXG53hiOqWq5DbAUTqjQBLMdmS3xeFxeOQ3kcoFrl50EryXcctTAV7vNWBWyOfp0aO0zf
 3EFz1ON7OxB8bItZ33GAIn+8uDIC22UTvGVj2Iy6JbESEO08AIWVsEf9/gF0Bb+F2cIIfIkCvM4
 BkfKEIRJ4fEkYPCejNK42AnBG/Ym0Tmx9Emoyb3sbnYPN2rg5fkMlZecSoj/2gZLKeLd4oC/N9U
 VRgLZyxmkQo2Aw==
X-Google-Smtp-Source: AGHT+IEmzmf6qo4FU3cYsSFHCkv37zpXSq5rQ/sBf1cVkK9FRuF5itxEGPjy+jpxoBb9gzGq+/K0BQ==
X-Received: by 2002:a17:902:f545:b0:215:6e01:ad19 with SMTP id
 d9443c01a7336-21c35587f37mr272882875ad.29.1737456138578; 
 Tue, 21 Jan 2025 02:42:18 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:8899:7ee7:e6fd:4c4f:524d:ebac])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2cea0966sm76063255ad.37.2025.01.21.02.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:42:18 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/fbdev: Discard large BIOS framebuffers
Date: Tue, 21 Jan 2025 16:12:10 +0530
Message-Id: <20250121104210.3159-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jan 2025 08:36:34 +0000
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

On certain 4K panels, the BIOS framebuffer
exceeds the panel's required dimensions,
leading to display corruption.
This patch introduces a validation check to address the issue.

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 00852ff5b247..e8cf06772c31 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -197,10 +197,10 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	ifbdev->fb = NULL;
 
 	if (fb &&
-	    (sizes->fb_width > fb->base.width ||
-	     sizes->fb_height > fb->base.height)) {
+	    (sizes->fb_width != fb->base.width ||
+	     sizes->fb_height != fb->base.height)) {
 		drm_dbg_kms(&dev_priv->drm,
-			    "BIOS fb too small (%dx%d), we require (%dx%d),"
+			    "BIOS fb dimensions mismatch (%dx%d), we require (%dx%d),"
 			    " releasing it\n",
 			    fb->base.width, fb->base.height,
 			    sizes->fb_width, sizes->fb_height);
-- 
2.39.5

