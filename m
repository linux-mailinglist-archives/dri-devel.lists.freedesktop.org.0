Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FCEA5EE0D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 09:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249CB10E7FC;
	Thu, 13 Mar 2025 08:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="dGE+CHhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 438 seconds by postgrey-1.36 at gabe;
 Thu, 13 Mar 2025 04:25:04 UTC
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6192A10E7F3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 04:25:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.101.200.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 35E6B3F942; 
 Thu, 13 Mar 2025 04:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1741839463;
 bh=c+lwiNEeZKR7bI4cisdbs6du9vDi2xjExAwAe2kT2pU=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=dGE+CHhX76Bjsezh7k3+mUoKnaOtigHVK8ZgjC3t+JdL598zHcLvL+cEbBWMBVhrC
 I9hqbl5AxOeN6xgdOr5eERdLUfCZwNgbx+tKBQs/DS49ye20oc9jK421R2BxxxjfEN
 /t/GDbo4f2Ev77VWm4OhNH432h+XFEYMYF4JEyNVLqXSrx7+f6Usgeg2RX98otPtU5
 FxnRl4iGXKzD7NGj1logg0lXeZ9D/9SvxDS9dAD+B2HiPOZG+2ynkgPvwV4OpuOMYy
 FMjkRcw5KwG2KXErJxXLJcz/mEeVm83d+XR3pEQeaSN5pWOFwcIRGedFYXP09hPrVv
 VWMPFSEveZHsQ==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
To: 
Cc: leo.lin@canonical.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: add .hdrtest to .gitignore under drm directories
Date: Thu, 13 Mar 2025 12:16:56 +0800
Message-ID: <20250313041711.872378-1-leo.lin@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Mar 2025 08:30:32 +0000
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

The header self-contained tests in drm may leave .hdrtest files in
include/drm/ and drivers/gpu/drm/. Omit them by adding .gitignore

Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
---
 drivers/gpu/drm/.gitignore | 1 +
 include/drm/.gitignore     | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 drivers/gpu/drm/.gitignore
 create mode 100644 include/drm/.gitignore

diff --git a/drivers/gpu/drm/.gitignore b/drivers/gpu/drm/.gitignore
new file mode 100644
index 000000000000..d9a77f3b59b2
--- /dev/null
+++ b/drivers/gpu/drm/.gitignore
@@ -0,0 +1 @@
+*.hdrtest
diff --git a/include/drm/.gitignore b/include/drm/.gitignore
new file mode 100644
index 000000000000..d9a77f3b59b2
--- /dev/null
+++ b/include/drm/.gitignore
@@ -0,0 +1 @@
+*.hdrtest
-- 
2.43.0

