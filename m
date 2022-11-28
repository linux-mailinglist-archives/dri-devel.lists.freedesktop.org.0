Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE69F63ABAD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A0E10E1FC;
	Mon, 28 Nov 2022 14:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2D010E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:56:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 064892B05E69;
 Mon, 28 Nov 2022 09:56:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 28 Nov 2022 09:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647397; x=
 1669654597; bh=S78jOQV9WsqrkxlVICLV/EyYHpBBw13qWCsvR+g/ztg=; b=S
 wGRjbtZfDVkHp8MWjSZtLlnsPErF+YAW59FnFLoOxD933YWzuz05aWefzVDeOPUz
 Ke8Oifhcc7/p6Gz+ZnGW9kaZ5V4bB2TXgRkjhqspm/cwPQPwu/t5tdGNecHKX+wC
 LiZ0eTzSdYaZWN/SBTu++Jp5gqCSFWXbcgdrDGISyuwa2/3AWQkQEj1hRKmASaS7
 knZDnlapIL7wUpdGyv34M4Qum2LqWI5SV/qN1SZrN7zzopPrCgMzTXOExEJR2cgo
 3anbMZDIxGu/f2HOKxI7MCXRyA18ZNTjFNU36e585Ds9tm1Vu5sSxHWbFZHLpzYh
 D48K5z9uZOq2loUJfGTLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647397; x=
 1669654597; bh=S78jOQV9WsqrkxlVICLV/EyYHpBBw13qWCsvR+g/ztg=; b=o
 4qwdUoU9s2Mv4zvFyIfmLRaT8ZQyaR8ZEl1ol5/XHkiO1kEU98BsLtTYlSiS6OEn
 1zgs3XAuFZ1np54mtqjKgSHhlwcNNEfuPG6c7cBpNLXa2Ex640PuBKWCjpTx8L5+
 rgx1G6UUVmya4aSjgQdz90p2SvB+vO3OW7OEmjAB1pdiQGf4ZGZ0pFkXyZetNAkz
 Ks00OWd2l8KmzmgKTBDbG1XGTZHQ1zjDQKcPmlFTA6L7UX2JBWh7bo0vWQzu4TJn
 NRnQj4FzWjYjGQ1P5B918xxf/1hpaB85PPrIVEXcUOB1vacJ3BDnZJxpy4uT+X/e
 jxHC5COykKALt+xMzopSw==
X-ME-Sender: <xms:JMyEY9c0pU8r0fMx1BUEynq-MN2IGH0buAGbneCl1CEpFI9uNV7Evg>
 <xme:JMyEY7PF-sbQazOGFjUXXiZENxQxc1g8dSgcVkCXtIeD3cg0M_L4QLMUB2-zNvuJG
 wky7zcrs7Qf1d-EAok>
X-ME-Received: <xmr:JMyEY2hXyXiYpFyC950-3MHD4O0YQf1jwaVPfuFCyP4ucG8KxvjIboA07_kRJb74T30-HqwxUfHJtwk5RWDDgZXiBZIZ2Q_bgrxyrX6dFUrFDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JMyEY28TBVtmLtW1FG0G2OsQLta0Ne_lNQOA1P4nComIJ2-A9mSUNA>
 <xmx:JMyEY5vENrlHrLUe8DLSFLIjO29tbP6pJZHlRmo-ssOe29wbDqR16A>
 <xmx:JMyEY1GUvzphuPZK0owXOrRXw7thx4iH1Yeg7ryWLB5vB8j5FCnN9g>
 <xmx:JcyEYwNvIOSBY1nFNV0fv40T7OjcTjhS3ozagVvSrHCYgSj-HfS5lyQ9V_Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:56:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:30 +0100
Subject: [PATCH v2 01/17] drm/tests: helpers: Move the helper header to
 include/drm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-1-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3201; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=oYfT3D+9G5EPwfPTDx+xWrqrfECImzcEIa8QkMrylkg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp0uTuo+u4XPZrHaiu3lDWfO2dTfrFR99KY65a/BAi0PF
 7PKGjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzEwIzhv4vlG3sGk9aXrcl7RPT7F7
 F4uVsaLKqTXpma9i388ZljvAz/PT9rTO//89P+27HmRRFHBBes5G26vXctC6MHU+v1H6kCnAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
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
Cc: David Gow <davidgow@google.com>, Maíra Canal <mairacanal@riseup.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to use those helpers from drivers too, so let's move it to a
more visible location.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c            | 3 +--
 drivers/gpu/drm/tests/drm_kunit_helpers.c                  | 3 +--
 drivers/gpu/drm/tests/drm_modes_test.c                     | 3 +--
 drivers/gpu/drm/tests/drm_probe_helper_test.c              | 3 +--
 {drivers/gpu/drm/tests => include/drm}/drm_kunit_helpers.h | 0
 5 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 52929536a158..ed2f62e92fea 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -8,12 +8,11 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 
-#include "drm_kunit_helpers.h"
-
 struct drm_client_modeset_test_priv {
 	struct drm_device *drm;
 	struct drm_connector connector;
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 8c738384a992..6600a4db3158 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -1,14 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
 #include <drm/drm_managed.h>
 
 #include <kunit/resource.h>
 
 #include <linux/device.h>
 
-#include "drm_kunit_helpers.h"
-
 struct kunit_dev {
 	struct drm_device base;
 };
diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index 9358a885c58b..3953e478c4d0 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -4,14 +4,13 @@
  */
 
 #include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
 #include <drm/drm_modes.h>
 
 #include <kunit/test.h>
 
 #include <linux/units.h>
 
-#include "drm_kunit_helpers.h"
-
 struct drm_test_modes_priv {
 	struct drm_device *drm;
 };
diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
index 7e938258c742..1f3941c150ae 100644
--- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -7,6 +7,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_modeset_helper_vtables.h>
@@ -14,8 +15,6 @@
 
 #include <kunit/test.h>
 
-#include "drm_kunit_helpers.h"
-
 struct drm_probe_helper_test_priv {
 	struct drm_device *drm;
 	struct drm_connector connector;
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
similarity index 100%
rename from drivers/gpu/drm/tests/drm_kunit_helpers.h
rename to include/drm/drm_kunit_helpers.h

-- 
2.38.1-b4-0.11.0-dev-d416f
