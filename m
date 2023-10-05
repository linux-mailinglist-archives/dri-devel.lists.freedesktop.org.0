Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C567B9ECB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 16:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3233A10E166;
	Thu,  5 Oct 2023 14:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542E610E3E0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 14:12:48 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 99D026607328;
 Thu,  5 Oct 2023 15:12:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696515166;
 bh=hYTUtJ91m8XhfmVfROlVN0LtUovJ3Zomdz4P3xGJLPc=;
 h=From:To:Cc:Subject:Date:From;
 b=J5csQFjxk3PaPfrvQOK42s8QmYosEYOhd8kF4OjtfhkbVydWs58zUSl3q+/6QJNoX
 X5thRMsEI0apbSNtVEZuqNhTpmI5ZM2fnFwbXazz/oNasA6YNaXoBA4lk9Vs4NNQvg
 PrOi/vdd+u7GNpThXDqXUMXBCpuFVpaBNDXQnPurSR0qfkdonXeIsoBXAFx3hUutnf
 rQ1eYpyG0qlqIw/ok6Aa2zEYkYoN+CXcOfNndaYIPmD8K0vTynct1wwJ81cRVwW6mP
 PrMnZ6xDIgh1bkkLLuTTHMXulzTv7Z+m5FDdsTisoe3Tzc41w0BH08nElwelKke90L
 Nze9RiUARq0iw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] Documentation/gpu: fix Panfrost documentation build warnings
Date: Thu,  5 Oct 2023 15:12:35 +0100
Message-ID: <20231005141239.132783-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix issues revealed by `make htmldocs` after adding Panfrost DRM
documentation file.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: d124dac2089c ("drm/panfrost: Add fdinfo support GPU load metrics")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310030917.Txzlpoeq-lkp@intel.com
---
 Documentation/gpu/drivers.rst  | 1 +
 Documentation/gpu/panfrost.rst | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 3a52f48215a3..45a12e552091 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -18,6 +18,7 @@ GPU Driver Documentation
    xen-front
    afbc
    komeda-kms
+   panfrost
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/panfrost.rst b/Documentation/gpu/panfrost.rst
index ecc48ba5ac11..a07f6821e994 100644
--- a/Documentation/gpu/panfrost.rst
+++ b/Documentation/gpu/panfrost.rst
@@ -5,7 +5,7 @@
 .. _panfrost-usage-stats:
 
 Panfrost DRM client usage stats implementation
-==========================================
+==============================================
 
 The drm/Panfrost driver implements the DRM client usage stats specification as
 documented in :ref:`drm-client-usage-stats`.
-- 
2.42.0

