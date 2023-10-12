Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00027C6316
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 04:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C9F10E3EA;
	Thu, 12 Oct 2023 02:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3262B10E3EA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qwKAK
 Yj+at97vp/dZZhMcvfPdPnSJotWH98ffVHtzrU=; b=KCAr9DDmD2M7ECl7v71A0
 Ruz1OO2T3xclKVkj2CpfJL1QhHwPy46IVFDm1eownQlq0JiJ/KR7C1URaBYMoQTg
 ZJwk8aWXFjCTtIIhNT8JQMy24z+PH0Wm9qHAXkDnzZp5VSTCEp88tgwgqTAeLclr
 xjTNw+OVoDBvYPoDkDuCqc=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wDHL8mvWydlY0ZDAQ--.59239S2;
 Thu, 12 Oct 2023 10:36:34 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de
Subject: [PATCH 2/3] drm/rockchip: remove NR_LAYERS macro on vop2
Date: Thu, 12 Oct 2023 10:36:30 +0800
Message-Id: <20231012023630.1497499-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012023439.1497304-1-andyshrk@163.com>
References: <20231012023439.1497304-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHL8mvWydlY0ZDAQ--.59239S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF45CryfAr4fAr47JF17GFg_yoWDuFbEk3
 W7Wrn8GF4kurn5Aw4DCrWfJF9rKanruF1kZa10qa45ZF1kJw1xt3s2q3y7WFy5AF1xWFnF
 93WYqry3CFn3GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU058n5UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiTBkHXmI0beLBsgAAsm
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

There are 8 layers on rk3588, so a fix defined macro is
not appropriate.
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 3c524ca23d53..57c05c6b246c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2251,8 +2251,6 @@ static struct vop2_video_port *find_vp_without_primary(struct vop2 *vop2)
 	return NULL;
 }
 
-#define NR_LAYERS 6
-
 static int vop2_create_crtcs(struct vop2 *vop2)
 {
 	const struct vop2_data *vop2_data = vop2->data;
@@ -2371,7 +2369,7 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 		struct vop2_video_port *vp = &vop2->vps[i];
 
 		if (vp->crtc.port)
-			vp->nlayers = NR_LAYERS / nvps;
+			vp->nlayers = vop2_data->win_size / nvps;
 	}
 
 	return 0;
-- 
2.34.1

