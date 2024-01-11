Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D155182A97C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293FA10E842;
	Thu, 11 Jan 2024 08:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7051B10E7C8;
 Thu, 11 Jan 2024 07:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=wKzGz4voE5HPmSK469
 UfyON0mOrKN5XeFNIaTs52KKs=; b=MS8cWZvqLviEE+4uKQFLyqLWU6ysLLO5GB
 fxmxeP+WCGQy+cIlqvYF3JRytvT0ofRg5o1V1sAjxt2Fiqe4mpd6Tzilhl3xzjK0
 bZzqKND90KVoZJLQyQYHrPhSpP4IfqawvmHcTeK6x4cUw2+ZMR/ayaEM2LTpnaOl
 ZOw4DagE8=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wD33+WNmp9lnmGSAA--.15450S2;
 Thu, 11 Jan 2024 15:36:45 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, airlied@gmail.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in radeon_atpx_handler.c
Date: Thu, 11 Jan 2024 07:36:44 +0000
Message-Id: <20240111073644.10491-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD33+WNmp9lnmGSAA--.15450S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Jw1kur45Gr4UZw48KFWDXFb_yoW8JF15pr
 W2kr92yr9a93Wqkas7ZFWxtFy3Aa1kJayUWFsrG34rur45JryDGr9Iga45JF18Jry8Zr1Y
 qFnxWa4avr1xA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UwFxUUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEBpi1mVOBk6DhgABsZ
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following function definitions go on the next line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/radeon_atpx_handler.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_atpx_handler.c b/drivers/gpu/drm/radeon/radeon_atpx_handler.c
index 595354e3ce0b..f557535c1d7b 100644
--- a/drivers/gpu/drm/radeon/radeon_atpx_handler.c
+++ b/drivers/gpu/drm/radeon/radeon_atpx_handler.c
@@ -61,19 +61,23 @@ struct atpx_mux {
 	u16 mux;
 } __packed;
 
-bool radeon_has_atpx(void) {
+bool radeon_has_atpx(void)
+{
 	return radeon_atpx_priv.atpx_detected;
 }
 
-bool radeon_has_atpx_dgpu_power_cntl(void) {
+bool radeon_has_atpx_dgpu_power_cntl(void)
+{
 	return radeon_atpx_priv.atpx.functions.power_cntl;
 }
 
-bool radeon_is_atpx_hybrid(void) {
+bool radeon_is_atpx_hybrid(void)
+{
 	return radeon_atpx_priv.atpx.is_hybrid;
 }
 
-bool radeon_atpx_dgpu_req_power_for_displays(void) {
+bool radeon_atpx_dgpu_req_power_for_displays(void)
+{
 	return radeon_atpx_priv.atpx.dgpu_req_power_for_displays;
 }
 
-- 
2.17.1

