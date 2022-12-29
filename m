Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFEA65A4F5
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 15:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7FB10E04E;
	Sat, 31 Dec 2022 14:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from luna (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 [86.15.83.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0846A10E3F7;
 Thu, 29 Dec 2022 16:13:24 +0000 (UTC)
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1pAv84-002nyB-1E;
 Thu, 29 Dec 2022 15:47:36 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/acr/ga102: make ga102_gsps static (not exported)
Date: Thu, 29 Dec 2022 15:47:35 +0000
Message-Id: <20221229154735.668730-1-ben-linux@fluff.org>
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

The ga102_gsps is not exported, so make it static to avoid the
following sparse warning:

drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c:49:1: warning: symbol 'ga102_gsps' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 525267412c3e..a3996ceca995 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -45,7 +45,7 @@ ga102_gsp_nofw(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 	return 0;
 }
 
-struct nvkm_gsp_fwif
+static struct nvkm_gsp_fwif
 ga102_gsps[] = {
 	{ -1, ga102_gsp_nofw, &ga102_gsp },
 	{}
-- 
2.39.0

