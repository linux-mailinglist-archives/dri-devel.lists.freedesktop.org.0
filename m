Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A828D74D7
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 13:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924D210E03C;
	Sun,  2 Jun 2024 11:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=freemail.hu header.i=@freemail.hu header.b="JDlDB9yO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at gabe;
 Sat, 01 Jun 2024 21:33:04 UTC
Received: from smtp-out.freemail.hu (fmfe12.freemail.hu [46.107.16.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C2610E044;
 Sat,  1 Jun 2024 21:33:04 +0000 (UTC)
Received: from fizweb.elte.hu (fizweb.elte.hu [157.181.183.248])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.freemail.hu (Postfix) with ESMTPSA id 4VsCdP0FrDz1mp;
 Sat,  1 Jun 2024 23:23:05 +0200 (CEST)
From: egyszeregy@freemail.hu
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [PATCH] drm/nouveau/i2c: rename aux.c and aux.h to nvkm_i2c_aux.c and
 nvkm_i2c_aux.h
Date: Sat,  1 Jun 2024 23:22:47 +0200
Message-ID: <20240601212247.54786-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1717276985; 
 s=20181004; d=freemail.hu;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 l=6462; bh=CnHSqkRX34kqCWN2/oPtvm9wm8HJCe8QhPwQypdpi3w=;
 b=JDlDB9yOQDBY7EDnRMrt8qYnWfH8J/LKYKb90434FH1tuOL04za+3TXXSbU0uvs0
 hWYDYjpbob4XGgUcd1s+lCkerOgDwkpWJWKFW8N5j6WENAKdR/hWJgcma2JEDDotXZ0
 cisYRrLsQBfjyKkBWw0qv/5PDe7vliytix5oP2piBPJC+uR3pN8OKck/+zLBGlJY4za
 qywwOiMNzHAdyOJT5kCg0yd+k186Oa1jX93iCpiRk5mxJQqJJcAxfW8rYbKRXi5QQTl
 SymDGdZ72wK5PkHxGgpZ9qXZtFV3eH4+95xNzpoPowMkXFkBy1uMClZzxv1oBmRo8o6
 CXPcfsWUsQ==
X-Mailman-Approved-At: Sun, 02 Jun 2024 11:08:14 +0000
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

From: Benjamin Szőke <egyszeregy@freemail.hu>

The goal is to clean-up Linux repository from AUX file names, because
the use of such file names is prohibited on other operating systems
such as Windows, so the Linux repository cannot be cloned and
edited on them.

Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild                  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c               | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c                | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c              | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c              | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c                  | 2 +-
 .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => nvkm_i2c_aux.c}   | 2 +-
 .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => nvkm_i2c_aux.h}   | 0
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c                | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c              | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c              | 2 +-
 11 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => nvkm_i2c_aux.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => nvkm_i2c_aux.h} (100%)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
index 819703913a00..c488dfce4392 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
@@ -25,7 +25,7 @@ nvkm-y += nvkm/subdev/i2c/busnv50.o
 nvkm-y += nvkm/subdev/i2c/busgf119.o
 nvkm-y += nvkm/subdev/i2c/bit.o
 
-nvkm-y += nvkm/subdev/i2c/aux.o
+nvkm-y += nvkm/subdev/i2c/nvkm_i2c_aux.o
 nvkm-y += nvkm/subdev/i2c/auxg94.o
 nvkm-y += nvkm/subdev/i2c/auxgf119.o
 nvkm-y += nvkm/subdev/i2c/auxgm200.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
index dd391809fef7..30bf84e77db9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
@@ -24,7 +24,7 @@
 #define anx9805_pad(p) container_of((p), struct anx9805_pad, base)
 #define anx9805_bus(p) container_of((p), struct anx9805_bus, base)
 #define anx9805_aux(p) container_of((p), struct anx9805_aux, base)
-#include "aux.h"
+#include "nvkm_i2c_aux.h"
 #include "bus.h"
 
 struct anx9805_pad {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
index 47068f6f9c55..9e07ba444ca8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
@@ -22,7 +22,7 @@
  * Authors: Ben Skeggs <bskeggs@redhat.com>
  */
 #define g94_i2c_aux(p) container_of((p), struct g94_i2c_aux, base)
-#include "aux.h"
+#include "nvkm_i2c_aux.h"
 
 struct g94_i2c_aux {
 	struct nvkm_i2c_aux base;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
index dab40cd8fe3a..8709b728c38b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "aux.h"
+#include "nvkm_i2c_aux.h"
 
 static const struct nvkm_i2c_aux_func
 gf119_i2c_aux = {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
index 8bd1d442e465..f40c5709d217 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
@@ -22,7 +22,7 @@
  * Authors: Ben Skeggs <bskeggs@redhat.com>
  */
 #define gm200_i2c_aux(p) container_of((p), struct gm200_i2c_aux, base)
-#include "aux.h"
+#include "nvkm_i2c_aux.h"
 
 struct gm200_i2c_aux {
 	struct nvkm_i2c_aux base;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
index 976539de4220..736275f0c774 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
@@ -22,7 +22,7 @@
  * Authors: Ben Skeggs
  */
 #include "priv.h"
-#include "aux.h"
+#include "nvkm_i2c_aux.h"
 #include "bus.h"
 #include "pad.h"
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
index d063d0dc13c5..6b76df02c63a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
@@ -24,7 +24,7 @@
 
 #include <linux/string_helpers.h>
 
-#include "aux.h"
+#include "nvkm_i2c_aux.h"
 #include "pad.h"
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h
rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
index 5904bc5f2d2a..e9c55a57c878 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
@@ -22,7 +22,7 @@
  * Authors: Ben Skeggs
  */
 #include "pad.h"
-#include "aux.h"
+#include "nvkm_i2c_aux.h"
 #include "bus.h"
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
index 3bc4d0310076..1af64e25d838 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
@@ -22,7 +22,7 @@
  * Authors: Ben Skeggs
  */
 #include "pad.h"
-#include "aux.h"
+#include "nvkm_i2c_aux.h"
 #include "bus.h"
 
 static const struct nvkm_i2c_pad_func
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
index 7d417f6a816e..997a5a2146c4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
@@ -22,7 +22,7 @@
  * Authors: Ben Skeggs
  */
 #include "pad.h"
-#include "aux.h"
+#include "nvkm_i2c_aux.h"
 #include "bus.h"
 
 static void
-- 
2.43.0

