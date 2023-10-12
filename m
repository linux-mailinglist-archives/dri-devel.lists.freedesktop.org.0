Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B957C6319
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 04:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F6510E3EB;
	Thu, 12 Oct 2023 02:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 920 seconds by postgrey-1.36 at gabe;
 Thu, 12 Oct 2023 02:52:29 UTC
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
 by gabe.freedesktop.org (Postfix) with ESMTP id DB41410E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KJQPI
 JNNz5TybaQPkseB57wueWUVNWfwhY7sgUvbTGk=; b=CXeSv8bRwE0J8BJiFk/RO
 EnLkPgJmpfI5PhgjRbKv7snEdubdMnYZWz9nKn4vAfzbHlCp1TeXs3cL79Meol/Z
 jIWrcEjl0NspzRz1mi0KlZZvYay3cOzuXNe/dVHoz/VUdE21xfYaPlvfkz4KdUvi
 dTLTDGq6oxIXUf9EsGa79c=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g4-2 (Coremail) with SMTP id _____wD3_+XGWydlPrpMAQ--.22452S2;
 Thu, 12 Oct 2023 10:36:57 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de
Subject: [PATCH 1/3] drm/rockchip: remove unused struct in vop2
Date: Thu, 12 Oct 2023 10:36:53 +0800
Message-Id: <20231012023653.1497576-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012023439.1497304-1-andyshrk@163.com>
References: <20231012023439.1497304-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_+XGWydlPrpMAQ--.22452S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWUKrW3Kw4fArWDWrWrAFb_yoW8CF1Dpa
 yDA34jqrWxKFWjgr1DJF4Dur1SywnFkay2kFs7G3ZIqFyIgr1DA3W5Kr1rArsxZF129rW7
 tFnFq34UXF429r7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jk18PUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiTBkHXmI0beLBsgACsk
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
Cc: Andy Yan <andy.yan@rock-chips.com>, s.hauer@pengutronix.de,
 sjoerd.simons@collabora.com, hjc@rock-chips.com,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

These structs are undefined and un used.
Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 --
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 583df4d22f7e..3c524ca23d53 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -160,7 +160,6 @@ struct vop2_video_port {
 	struct vop2 *vop2;
 	struct clk *dclk;
 	unsigned int id;
-	const struct vop2_video_port_regs *regs;
 	const struct vop2_video_port_data *data;
 
 	struct completion dsp_hold_completion;
@@ -2274,7 +2273,6 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 		vp = &vop2->vps[i];
 		vp->vop2 = vop2;
 		vp->id = vp_data->id;
-		vp->regs = vp_data->regs;
 		vp->data = vp_data;
 
 		snprintf(dclk_name, sizeof(dclk_name), "dclk_vp%d", vp->id);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index f1234a151130..56fd31e05238 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -134,16 +134,13 @@ struct vop2_video_port_data {
 	u16 cubic_lut_len;
 	struct vop_rect max_output;
 	const u8 pre_scan_max_dly[4];
-	const struct vop2_video_port_regs *regs;
 	unsigned int offset;
 };
 
 struct vop2_data {
 	u8 nr_vps;
-	const struct vop2_ctrl *ctrl;
 	const struct vop2_win_data *win;
 	const struct vop2_video_port_data *vp;
-	const struct vop_csc_table *csc_table;
 	struct vop_rect max_input;
 	struct vop_rect max_output;
 
-- 
2.34.1

