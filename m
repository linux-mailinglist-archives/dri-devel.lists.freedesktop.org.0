Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F80A552BD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5313210EA3B;
	Thu,  6 Mar 2025 17:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SBfuHdzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08ED10EA34
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:17:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AA435A44FA5;
 Thu,  6 Mar 2025 17:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAF7C4CEE9;
 Thu,  6 Mar 2025 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741281452;
 bh=9fO76bprPjWuuL9pZdTAwx8iTUWcSZCDN3mx1NcNL5E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SBfuHdzUdYUucdQq7c27ee46MEDjJyDC3Fe8rSiAvuBKtomZrH4yO6KdHupbItUo7
 LQAz8BMp52y/FalT9UKZAW51gNpJHKofTUaMZeEwf2AxLgsRFkeFfgLAUF9XbFANqN
 Oa1rGvSyMvKA4s2qfsbJ5ZNAQNxyfOShXrjc7OwBScx+7wYN0eNuIe62UHuZZGot0L
 uWmFdz449BxQ9VbfGcFkXejkO96I9OpMVBRJHjdSR+6C9FfR21cPbzEZptFigqtjTe
 498jl68B45L1/DeCkoIKjb3YMNYisDFLvVDkvR74KUwprN9TpKxGAEJtIfo2YlH8Bh
 WftsJ5H+CcH8A==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 06 Mar 2025 18:17:23 +0100
Subject: [PATCH 1/2] drm/display: hdmi: Create documentation section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-drm-hdmi-state-docs-v1-1-56a19d3805a1@kernel.org>
References: <20250306-drm-hdmi-state-docs-v1-0-56a19d3805a1@kernel.org>
In-Reply-To: <20250306-drm-hdmi-state-docs-v1-0-56a19d3805a1@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2555; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9fO76bprPjWuuL9pZdTAwx8iTUWcSZCDN3mx1NcNL5E=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOknbyzln+7At1nMN7OzzMGi79SNqN6Zs95ckP9q/uHiT
 5+MBb87O0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRBacYGU7ddzlXz6xt3V16
 VnPG6v4unqpSPaMT+6ZcS1yt/kpW5ikjw5s2X9XI08YuM1ZUXI5OO9See+/h0z9rOD5r51pM+7k
 ogR0A
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

