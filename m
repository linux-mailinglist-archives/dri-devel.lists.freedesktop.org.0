Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F42B4DCE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CB66E9F1;
	Mon, 16 Nov 2020 17:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE3B6E9FA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l1so19648524wrb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kwAPsdpVMxl/zDOaEKrvh3eBbThND3Sgn5s6wfB0Uyk=;
 b=DKTVoYhLDkbUjmiKBiSxqN0EkzBLYyzyrkoqtuN6VulUimxRpI6QLv0OIHxkKaQQgU
 KYLrGD874Ber7KTt6OJaUpi2vEOqawPyVBFY0niR1SkoQpbH0FGG2WodY9fl8grPOC7q
 RqSW3DTkKBPSp1/YLd9RcWADeSJl8AGqcerHF/73w3pZyGN4NPmJ0ha5qJWTublG4eVP
 FvWuTMIgTQVlzi1mJLNQgc+aO/NoIPqjaxzq3VlsC2bSDchoZBkqoBcDmPKQ3X5z4eXv
 XWJrBqmGzKAQIh2YZjXrnie9qVgHj6SkltfZVcvXgBg7Cmg7I8oXBfuMB0NnR4ltofjK
 +9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kwAPsdpVMxl/zDOaEKrvh3eBbThND3Sgn5s6wfB0Uyk=;
 b=B1Qmo/1r7qL7QFyC1d6FFuINvYAS1si9qT4+00lxSh+SeY59/geYvFA6LSn+5/AXH8
 8J/hJueAmWPAWPbuDJBV3AuSOJv4bkXMGqqbSuGkL5fZ2zCbCOa9ze8ecn7mAeFj3HJL
 KfbBZfgGox0aFpVqrxdp6u6ysLDPssQhcynkuMMySOfQn9jAMxH4obk/6oAV/6+E25Er
 +UQ1LxAvSN/qwwEgKPBJWKSIOcSgI1Hv5hyJ8XxXnITY1HP2PCL52tIRbuU7KxcbKDPJ
 n/E/AOlEjz4qCNI9WRSKm5JItm1RF8jnjUYgO/5EddbRtkxozC8hSJAn2TUkx59SMm2x
 jiBg==
X-Gm-Message-State: AOAM530msMmsdtw1CumKm/2dAl6ygjTPvwhggJ2PFlcWI8yRVk9I0NE7
 O/OEirtulbTw68tUKLgjTPvBzQ==
X-Google-Smtp-Source: ABdhPJxBcXflNnhznga0qA/1qGlXLsbwa73sxSXQZeI2NdqkAJACA5ixV1bOC5dXLeCi3pwSiE6mqA==
X-Received: by 2002:a5d:4802:: with SMTP id l2mr19918921wrq.424.1605548536828; 
 Mon, 16 Nov 2020 09:42:16 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:16 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 40/42] drm/vc4/vc4_debugfs: Demote non-conformant kernel-doc
 headers
Date: Mon, 16 Nov 2020 17:41:10 +0000
Message-Id: <20201116174112.1833368-41-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vc4/vc4_debugfs.c:25: warning: Function parameter or member 'minor' not described in 'vc4_debugfs_init'
 drivers/gpu/drm/vc4/vc4_debugfs.c:62: warning: Function parameter or member 'dev' not described in 'vc4_debugfs_add_file'
 drivers/gpu/drm/vc4/vc4_debugfs.c:62: warning: Function parameter or member 'name' not described in 'vc4_debugfs_add_file'
 drivers/gpu/drm/vc4/vc4_debugfs.c:62: warning: Function parameter or member 'show' not described in 'vc4_debugfs_add_file'
 drivers/gpu/drm/vc4/vc4_debugfs.c:62: warning: Function parameter or member 'data' not described in 'vc4_debugfs_add_file'

Cc: Eric Anholt <eric@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 4fbbf980a299f..6da22af4ee911 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -16,7 +16,7 @@ struct vc4_debugfs_info_entry {
 	struct drm_info_list info;
 };
 
-/**
+/*
  * Called at drm_dev_register() time on each of the minors registered
  * by the DRM device, to attach the debugfs files.
  */
@@ -46,7 +46,7 @@ static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
 	return 0;
 }
 
-/**
+/*
  * Registers a debugfs file with a callback function for a vc4 component.
  *
  * This is like drm_debugfs_create_files(), but that can only be
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
