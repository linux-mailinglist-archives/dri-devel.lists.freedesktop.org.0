Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D63873AE3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6067810EE62;
	Wed,  6 Mar 2024 15:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Is0ev5lA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F130910EE4D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:38:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F022E61A3E;
 Wed,  6 Mar 2024 15:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EC7C433C7;
 Wed,  6 Mar 2024 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709739528;
 bh=IsLYhWVQV0GMdAzWZDmZTmuu5o5Qt4tAVdETblbZRvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Is0ev5lABajBbga/g57itUrWpmXstRVow4/suB1aarZgvs6bs2Q8nWscTu8DZAyKJ
 LCjWjoPbU+/a/40qMLRlqPYpvoZLvZ11vKvQ205jWFNbHyMEKaCwfvmQZrZlKirNsA
 T3jmEMEoR2hGPAB5+19dZZFtD4JuyuceuHiARNC/ifoki9pkgkYPs+pXQY0dF+pNVw
 sug/67Fx+ZTlf13/r8VQ+fS9owocWRXvsO1LvRx1aeNcWrdTZWb4LMxptPH51q8ZYg
 zTmlHFZvlA9J36ML2D5TUbtCVtKbuHJPAnoYf9sb0jCQQhtI6mvJPwfYhV2mhQuV3w
 6cQQ9EJDNXHsA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH v2 2/2] MAINTAINERS: Update drm-misc web page
Date: Wed,  6 Mar 2024 16:38:39 +0100
Message-ID: <20240306153841.698693-2-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240306153841.698693-1-mripard@kernel.org>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <20240306153841.698693-1-mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This URL gets redirected to the Intel landing page now. Let's switch the
webpage to freedesktop.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4e33b3a3bc0..cdd3ddd6efb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7019,11 +7019,11 @@ F:	include/uapi/drm/
 DRM DRIVERS AND MISC GPU PATCHES
 M:	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
 M:	Maxime Ripard <mripard@kernel.org>
 M:	Thomas Zimmermann <tzimmermann@suse.de>
 S:	Maintained
-W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
+W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
 F:	drivers/gpu/drm/
-- 
2.43.2

