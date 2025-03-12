Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F33A5DE33
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 14:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7974710E249;
	Wed, 12 Mar 2025 13:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tKNIpzcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862D810E249
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 13:39:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 34BA25C5BA0;
 Wed, 12 Mar 2025 13:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72817C4CEEC;
 Wed, 12 Mar 2025 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741786765;
 bh=9fO76bprPjWuuL9pZdTAwx8iTUWcSZCDN3mx1NcNL5E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tKNIpzcOOumLoGAVuaYpPS0KEku5QgI/ZVkIL4S7B+3amOVlX3rDHK/8nReq+zsKS
 9ZfFYt5rxbYOGHDMSjxq1SlREbasLhutSapLVAZumMcGuDrTdvhbjbfSq+1dGuh9EW
 3QEyHT3OYXO1hQ4ENIzaWRAeMMR6sYNrm8E2Mx/xt6dXR8gy0AHjN6i1KbubqE271Y
 XEwDNggo1vCD0R6KG5TOG5REj+z6xEiQyo8K2VxztYuubXLThVaWH3yJAXy5KnYaHq
 hd9Ip8lAH2CWEeu+IqZnCdJ+Isr//GiD488udtXQZxGKdgMWSsZnZAiGgj/rY/xj7c
 +qMeMd6L3Brxg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 12 Mar 2025 14:39:16 +0100
Subject: [PATCH v2 1/2] drm/display: hdmi: Create documentation section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-drm-hdmi-state-docs-v2-1-6352a5d68d5b@kernel.org>
References: <20250312-drm-hdmi-state-docs-v2-0-6352a5d68d5b@kernel.org>
In-Reply-To: <20250312-drm-hdmi-state-docs-v2-0-6352a5d68d5b@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2555; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9fO76bprPjWuuL9pZdTAwx8iTUWcSZCDN3mx1NcNL5E=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOkX+9paZgZZlN1sMO78Yfk/cs+EjwbHChn/f/u0Ml7oR
 mSrwK+7HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIfhHDX9HVnPolwizvuo9x
 71W4H2miwn/q/rR8tyu/3Rz/TLyyXpThn0H2w8MfHhUfnq/XsqrMy8y5d6/lbyUbxxgnt2q9T1m
 TWAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

We have had documentation for the public functions in the HDMI helpers,
but those were never referenced anywhere and thus not compiled as part
of the doc.

Let's add a section.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drm-kms-helpers.rst           | 15 +++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 21 +++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index b4ee25af1702b0019e0de5f9ee66d2dbdac2c664..5139705089f200b189876a5a61bf2a935cec433a 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -231,10 +231,25 @@ Panel Self Refresh Helper Reference
    :doc: overview
 
 .. kernel-doc:: drivers/gpu/drm/drm_self_refresh_helper.c
    :export:
 
+HDMI Atomic State Helpers
+=========================
+
+Overview
+--------
+
+.. kernel-doc:: drivers/gpu/drm/display/drm_hdmi_state_helper.c
+   :doc: hdmi helpers
+
+Functions Reference
+-------------------
+
+.. kernel-doc:: drivers/gpu/drm/display/drm_hdmi_state_helper.c
+   :export:
+
 HDCP Helper Functions Reference
 ===============================
 
 .. kernel-doc:: drivers/gpu/drm/display/drm_hdcp_helper.c
    :export:
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 9b2ee2385634303ab84bdd3a457770cfe32647cf..24bfc82bf9b02bf3201d97432e3c239ccc8714b4 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -7,10 +7,31 @@
 
 #include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+/**
+ * DOC: hdmi helpers
+ *
+ * These functions contain an implementation of the HDMI specification
+ * in the form of KMS helpers.
+ *
+ * It contains TMDS character rate computation, automatic selection of
+ * output formats, infoframes generation, etc.
+ *
+ * Testing
+ * ~~~~~~~
+ *
+ * The helpers have unit testing and can be tested using kunit with:
+ *
+ * .. code-block:: bash
+ *
+ *	$ ./tools/testing/kunit/kunit.py run \
+ *		--kunitconfig=drivers/gpu/drm/tests \
+ *		drm_atomic_helper_connector_hdmi_*
+ */
+
 /**
  * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
  * @connector: DRM connector
  * @new_conn_state: connector state to reset
  *

-- 
2.48.1

