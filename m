Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C00BAB6423
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 09:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8869B10E254;
	Wed, 14 May 2025 07:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 409 seconds by postgrey-1.36 at gabe;
 Tue, 13 May 2025 23:39:46 UTC
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E13010E218
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 23:39:46 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
 t=1747179170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iYcQQzN6vnaXT766TJ+cVQWw0N0NG5qRoAhx0ZwZjFY=;
 b=mLR97Mkwj5zSlLnN/mlvCwd7qeWtalgeS4/J/A3+Sxl+eLFdZrt+OTWS3CmKuJjDYISsCn
 2CL4jzCj1ldnYYSHqC+CHKCNvTsxb1S6W7+LTxxKwS5he0SzrwnhUBKD18BmcvdHFqwhyj
 51A6kJmYvqs+h0K6o03t7qf6hxmc1nCewHEkJbFBhN6qDIhmo7mVZmwQUSzpG7sQoIWbU2
 pLJQQqVEvRCAoBTji9ZwD/lOc0M7I+ziOPOxUvcvFGuBBc/ST6JucGO7owcaL5cppkvln+
 GRjhf0rvCs/mlcWCBU5hBpZWsDwIfJm7ca2CVrxM3Rb4lFwF8Bcfx6y1GTa8BA==
From: George Anthony Vernon <contact@gvernon.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org
Cc: George Anthony Vernon <contact@gvernon.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/amdgpu: Fix docs build warning
Date: Wed, 14 May 2025 00:31:55 +0100
Message-ID: <20250513233212.21186-1-contact@gvernon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Wed, 14 May 2025 07:23:32 +0000
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

The kerneldoc comment for HGCP locality check debug mask was missing a
semicolon resulting in a documentation build warning. Correct it.

Signed-off-by: George Anthony Vernon <contact@gvernon.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..c8eccee9b023 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.49.0

