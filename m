Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0617C8592
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 14:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F3810E5F3;
	Fri, 13 Oct 2023 12:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF92310E5EF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yhEQj
 W9QxKi+Z9UeIXry2hAaUPbAMdnPcufJwdhVnYo=; b=mkzEbJAYSW5e7+Seot+34
 lud88N3qjpkP7YZ//djX8VpF0bN7QvnWQDe6FeQCzBz4ynhY74cAbutVGvUKpEGR
 K25N+L2yqPGsDHeM87HyrNgiCy9ZylC8B/CxGqPavnB8hQR8KmBD/n24ywLLCN7e
 JLCqUixU0FSL3pRlH0tu5Y=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wDnj9YkNill4B2_AQ--.8050S2; 
 Fri, 13 Oct 2023 20:20:55 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de
Subject: [PATCH v2 2/4] drm/rockchip: remove NR_LAYERS macro on vop2
Date: Fri, 13 Oct 2023 20:20:51 +0800
Message-Id: <20231013122051.1594164-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013122001.1594009-1-andyshrk@163.com>
References: <20231013122001.1594009-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnj9YkNill4B2_AQ--.8050S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF45CryfWw43WryDJw18Krg_yoWkWwcE93
 W7urnxGr4kWrn5Aw4DCrWfGF97KanF9F18Za10qas8ZF1kJ347t3s2q3y7WFy5AFnrWFnF
 g3Wqgry3CFn3GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU058n5UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiOwkIXmC5n1jCzAAAs0
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
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
---

(no changes since v1)

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

