Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB2F66AD7F
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 20:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3970510E26E;
	Sat, 14 Jan 2023 19:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9349810E261
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jan 2023 19:47:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB6EF60C11;
 Sat, 14 Jan 2023 19:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1236C433D2;
 Sat, 14 Jan 2023 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673725670;
 bh=h5oj8uz2mcobJK2H+Hm87QzyJogghFxebdxYASXr6cM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KiDrcBr9xYYjYZegA2r59TFavCdH1lJzSKxoSZ6AnPCL95MfbvVcN/2vpGfdMQsPS
 cEQ2xGXQikIXt/oa7BuEOV6UUTZwitOmkFZ/IQb+AHojukxeVTNXd7gT4AN+4AE5TF
 xNB1KvHvAWsJJQiJjtrAHEfQ7gL3a2YeYtcoQ+/mKfhDWWwOGZOAOFuWdRRkKcBSR0
 1oLifEXl8Pf53b4bHvQbdXl5r9PY9o9nUOziEzSMP57fwtK63MPFONd5i1qND5Tz2V
 HfKNpJPuqhUU/n0FFCruuQnRLZajl/DjGHd0wL593NZ07RyNMpUnjrPASGFfUoszoq
 wt6ROkuSivsgA==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/2] Docs: Add some missing SPDX license identifiers of
 subsystem docs
Date: Sat, 14 Jan 2023 19:47:41 +0000
Message-Id: <20230114194741.115855-2-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230114194741.115855-1-sj@kernel.org>
References: <20230114194741.115855-1-sj@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 SeongJae Park <sj@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Jean Delvare <jdelvare@suse.com>, linux-crypto@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some subsystem documents are missing SPDX license identifiers.  Add
those.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/crypto/index.rst     | 2 ++
 Documentation/driver-api/index.rst | 2 ++
 Documentation/gpu/index.rst        | 2 ++
 Documentation/hwmon/index.rst      | 2 ++
 Documentation/input/index.rst      | 2 ++
 Documentation/mm/index.rst         | 2 ++
 Documentation/scheduler/index.rst  | 2 ++
 Documentation/sound/index.rst      | 2 ++
 8 files changed, 16 insertions(+)

diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index da5d5ad2bdf3..95b0870e09b8 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==========
 Crypto API
 ==========
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index b208e0dac3a0..7a2584ab63c4 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==============================
 Driver implementer's API guide
 ==============================
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index eee5996acf2c..ff06a6b12c5e 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ============================
 GPU Driver Developer's Guide
 ============================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c2b3c1a822dd..2186d732654f 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===================
 Hardware Monitoring
 ===================
diff --git a/Documentation/input/index.rst b/Documentation/input/index.rst
index 35581cd18e91..d60bf9cfe005 100644
--- a/Documentation/input/index.rst
+++ b/Documentation/input/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===================
 Input Documentation
 ===================
diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 5a94a921ea40..c4e9fbacaf38 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===============================
 Memory Management Documentation
 ===============================
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 1aac972a652f..ae0229f5a9cf 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========
 Scheduler
 =========
diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
index 5abed5fc6485..7e67e12730d3 100644
--- a/Documentation/sound/index.rst
+++ b/Documentation/sound/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =============================
 Sound Subsystem Documentation
 =============================
-- 
2.25.1

