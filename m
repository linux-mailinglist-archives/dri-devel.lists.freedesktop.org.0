Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DED32B843
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB336E982;
	Wed,  3 Mar 2021 13:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743A36E979
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w11so23714891wrr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O3gvwy4PeYzRI9ULf7uVbTevm9nR5Ng81aAgPUCWA6Q=;
 b=R5yJXjEroR+aAi5Xo5prsTIr/z57v+n/ht4ttCxnmCgCgDUAoyafUan/HKuwL8hmru
 p6Xj+KOnUCFDgVgm/K+RfNQX0xdutyUZxzVweat79ABuc6H9HUmMKWNIX0GzuUvQEDK/
 o+P1o9sT8ivFFizyKdZ0R/eRtXsqxYfOHVi8YmEB7fe8JaFj+jN+o3HSZVtT8r1Y8IAr
 /PZ8UmBQjMDa61BkBmQMRLCWB/+QCgExg2QROjsbEaxM5ltcy1QwgGgFsuZedmzp0YmQ
 x/3grCp1SksM5OttzERnm8ZwIcuL4Nk4ZzP8uGKYMoqiJIyNQY06zXNtYwBkoo8szfNz
 TFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O3gvwy4PeYzRI9ULf7uVbTevm9nR5Ng81aAgPUCWA6Q=;
 b=dz5IJs3Js7hFmzJsLo94elgDQbWWKiNe7Cn/tz5hVDq1F5FTo9omzERdnoyGs3BVjf
 7ln1wA/uwI5+P7b4agd1jbldO9ytfTSga9eIkVrnBadw5Z2KV8An47FdXuydIibZLBgs
 8LWZurlD9vPoTa02uJ90shtMc7TqWQBzqImmcISMqZ44GnRSRh1TfYcvOtMfnzSgxf2p
 tE5ZCUrikLTRisBB6WUlJ4J2uQSOupeAR6S+Cl1hJ4LpcBYRi0ecXQtTRErl4A4JoikR
 idY8uzmQR/AKwlU9NnPkf0PwKG71zwj+49c5TSdJKgcGpbxoq9HaYgLbW26O38eIxCe4
 5q+Q==
X-Gm-Message-State: AOAM533LUgdnkTFcuCKmymVajb81goifPLUAq6i5fonpXv45613c1YFb
 ABm5sZS6/myjq3NMQFpAb5Z3xg==
X-Google-Smtp-Source: ABdhPJxTgYB4TmAEXy3KphfxYNatkvoStNo1An/KK6I8g+XVkZeTGR0YU5SR4hYQAuv6X3wLQ2J/WQ==
X-Received: by 2002:a5d:404f:: with SMTP id w15mr22820266wrp.106.1614779061148; 
 Wed, 03 Mar 2021 05:44:21 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:20 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 45/53] drm/vmwgfx/vmwgfx_cotable: Fix a couple of simple
 documentation problems
Date: Wed,  3 Mar 2021 13:43:11 +0000
Message-Id: <20210303134319.3160762-46-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c:72: warning: Function parameter or member 'unbind_func' not described in 'vmw_cotable_info'
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c:308: warning: Function parameter or member 'val_buf' not described in 'vmw_cotable_unbind'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181601.3432599-3-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index ba658fa9cf6c6..42321b9c8129f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -63,6 +63,7 @@ struct vmw_cotable {
  * @min_initial_entries: Min number of initial intries at cotable allocation
  * for this cotable type.
  * @size: Size of each entry.
+ * @unbind_func: Unbind call-back function.
  */
 struct vmw_cotable_info {
 	u32 min_initial_entries;
@@ -297,7 +298,7 @@ int vmw_cotable_scrub(struct vmw_resource *res, bool readback)
  *
  * @res: Pointer to the cotable resource.
  * @readback: Whether to read back cotable data to the backup buffer.
- * val_buf: Pointer to a struct ttm_validate_buffer prepared by the caller
+ * @val_buf: Pointer to a struct ttm_validate_buffer prepared by the caller
  * for convenience / fencing.
  *
  * Unbinds the cotable from the device and fences the backup buffer.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
