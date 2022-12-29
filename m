Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F24365A4FB
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 15:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FA210E112;
	Sat, 31 Dec 2022 14:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Thu, 29 Dec 2022 15:52:52 UTC
Received: from luna (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 [86.15.83.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E381A10E3EF;
 Thu, 29 Dec 2022 15:52:52 +0000 (UTC)
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1pAvD8-002o9Z-1T;
 Thu, 29 Dec 2022 15:52:50 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/mc/ga100: make ga100_mc_device static
Date: Thu, 29 Dec 2022 15:52:49 +0000
Message-Id: <20221229155249.669436-1-ben-linux@fluff.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 31 Dec 2022 14:30:00 +0000
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
Cc: Ben Dooks <ben-linux@fluff.org>, kherbst@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make ga100_mc_device static as it isn't exported, to
fix the following sparse warning:

drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c:51:1: warning: symbol 'ga100_mc_device' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
index 1e2eabec1a76..5d28d30d09d5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
@@ -47,7 +47,7 @@ ga100_mc_device_enabled(struct nvkm_mc *mc, u32 mask)
 	return (nvkm_rd32(mc->subdev.device, 0x000600) & mask) == mask;
 }
 
-const struct nvkm_mc_device_func
+static const struct nvkm_mc_device_func
 ga100_mc_device = {
 	.enabled = ga100_mc_device_enabled,
 	.enable = ga100_mc_device_enable,
-- 
2.39.0

