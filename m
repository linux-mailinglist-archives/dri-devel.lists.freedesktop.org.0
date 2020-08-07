Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8E23E56D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 03:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4FB6E049;
	Fri,  7 Aug 2020 01:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A316A6E044;
 Fri,  7 Aug 2020 01:13:35 +0000 (UTC)
IronPort-SDR: K38iD6cSngb+4FqH7mxOK679CqWqSQaeMnhtpAjSzqbxdtyOd42S29i0gSAmvWro/2ivB0YIy6
 WR2LlizIXpmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="150423459"
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; d="scan'208";a="150423459"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 18:13:34 -0700
IronPort-SDR: GoDjqrfDLy8IuIjkEi8u6cdXURNtRZZLD60gtMZPPVrZTRQyEqFrrBeGIE5yZoLafjgRQRMjbe
 +4YZ3GaoAvcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; d="scan'208";a="293501400"
Received: from rdvivi-losangeles.jf.intel.com ([10.165.21.201])
 by orsmga006.jf.intel.com with ESMTP; 06 Aug 2020 18:13:34 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: missing cases of rename ttm_mem_reg to
 ttm_resource.
Date: Thu,  6 Aug 2020 21:15:17 -0400
Message-Id: <20200807011517.2814096-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.26.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@gmail.com>

These are missed cases that I just identified with allyesconfig build.

Fixes: 2966141ad2dd ("drm/ttm: rename ttm_mem_reg to ttm_resource.")
Cc: Dave Airlie <airlied@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.h     | 14 +++++++-------
 drivers/gpu/drm/nouveau/nouveau_bo0039.c |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo5039.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo9039.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c |  2 +-
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 52489ce7d029c..aecb7481df0da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -139,28 +139,28 @@ nouveau_bo_new_pin_map(struct nouveau_cli *cli, u64 size, int align, u32 flags,
 
 int nv04_bo_move_init(struct nouveau_channel *, u32);
 int nv04_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nv50_bo_move_init(struct nouveau_channel *, u32);
 int nv50_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nv84_bo_move_exec(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nva3_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nvc0_bo_move_init(struct nouveau_channel *, u32);
 int nvc0_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nvc0_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nve0_bo_move_init(struct nouveau_channel *, u32);
 int nve0_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 #define NVBO_WR32_(b,o,dr,f) nouveau_bo_wr32((b), (o)/4 + (dr), (f))
 #define NVBO_RD32_(b,o,dr)   nouveau_bo_rd32((b), (o)/4 + (dr))
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
index bf7ae2cecaf68..7390132129fe7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
@@ -36,7 +36,7 @@
 
 static inline uint32_t
 nouveau_bo_mem_ctxdma(struct ttm_buffer_object *bo,
-		      struct nouveau_channel *chan, struct ttm_mem_reg *reg)
+		      struct nouveau_channel *chan, struct ttm_resource *reg)
 {
 	if (reg->mem_type == TTM_PL_TT)
 		return NvDmaTT;
@@ -45,7 +45,7 @@ nouveau_bo_mem_ctxdma(struct ttm_buffer_object *bo,
 
 int
 nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nvif_push *push = chan->chan.push;
 	u32 src_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, old_reg);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
index f9b9b85abe444..4c75c7b3804ca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
@@ -37,7 +37,7 @@
 
 int
 nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
index 1b5fd78ddcba9..ed6c09d678407 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
@@ -34,7 +34,7 @@
 
 int
 nv84_bo_move_exec(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
index f0df172b029e0..dec29b2d8bb22 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
@@ -38,7 +38,7 @@
 
 int
 nva3_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo9039.c b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
index 52fefb37064c8..776b04976cdfa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo9039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
@@ -36,7 +36,7 @@
 
 int
 nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nvif_push *push = chan->chan.push;
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
index 34b79d561c7f4..8499f58213e3c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
@@ -31,7 +31,7 @@
 
 int
 nvc0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
index 394e29012e504..575212472e7a8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
@@ -36,7 +36,7 @@
 
 int
 nve0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
