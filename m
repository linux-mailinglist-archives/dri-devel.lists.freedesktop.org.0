Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13588ACA6A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 12:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0AF10F4D2;
	Mon, 22 Apr 2024 10:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="gk8bVHbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2729010F4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 10:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=p2ORg
 ZDzSKVifuuO/4694cN5BzMQozrvf4hgWYIQay0=; b=gk8bVHbCll4il7G5c+K8e
 fPSYPWXboelLycremu9396QGozJZywTHOj/3HbM+w4Aozz1KqdgHL1BB0elDGegP
 NlUmgQ19uM1Tu6KK+VUsBKoW1N9fxb+gnoCoBmruvhVIp9zNWIZpf3MRZJolpJGD
 lp22RovFMEWP5UwpcclMW8=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g1-3 (Coremail) with SMTP id _____wB3fymbOSZmRwO9Bw--.23790S3;
 Mon, 22 Apr 2024 18:19:10 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/1] drm/rockchip: vop2: Fix the port mux of VP2
Date: Mon, 22 Apr 2024 18:19:05 +0800
Message-Id: <20240422101905.32703-2-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422101905.32703-1-andyshrk@163.com>
References: <20240422101905.32703-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3fymbOSZmRwO9Bw--.23790S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw13Gw1fWF4fZF4rXFW8JFb_yoWDCFc_Ga
 y7XrnxWa1kuwnxAw1UCw4fGrW2y3ZFkF4vya10vF9IvanxJ3Wvqa4Sv3y7XF1UAF13Wr1D
 Was0gr1xZFnxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeb6pDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEAPIXmVODidz9QAAsB
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

From: Andy Yan <andy.yan@rock-chips.com>

The port mux of VP2 should be RK3568_OVL_PORT_SET__PORT2_MUX.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 97b0ab4b6db8..1f4250de570f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2377,7 +2377,7 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT2_MUX,
 			(vp2->nlayers + vp1->nlayers + vp0->nlayers - 1));
 	else
-		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT1_MUX, 8);
+		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT2_MUX, 8);
 
 	layer_sel = vop2_readl(vop2, RK3568_OVL_LAYER_SEL);
 
-- 
2.34.1

