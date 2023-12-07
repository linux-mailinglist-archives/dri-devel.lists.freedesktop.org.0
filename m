Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0DF808260
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 09:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCC110E810;
	Thu,  7 Dec 2023 08:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E76910E80A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 08:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ivYwG
 0i8GvTy5B3DD4RgxIA/V22tX/s2NpyT/lti0eQ=; b=O/kaVV76yqRNPOoqZBEZV
 9tFJtnuY3BV6mYl5WO9VVdEq/AvJLEjXTNMJLwy1Lhy1roBNFa9CpEUM+NAgERqZ
 rtojhiWyiXSpuSyhTrp+YbyiXA5ZOm2P29nItRatxFqxKZkyZ3xYYSPqJp1+48Sm
 J5OmeHfzojQRcrfIc9GXic=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g5-2 (Coremail) with SMTP id _____wDnT1jHe3FleWCfEw--.42568S2;
 Thu, 07 Dec 2023 16:01:14 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v4 08/17] drm/rockchip: vop2: rename grf to sys_grf
Date: Thu,  7 Dec 2023 16:01:10 +0800
Message-Id: <20231207080110.652296-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207075906.651771-1-andyshrk@163.com>
References: <20231207075906.651771-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnT1jHe3FleWCfEw--.42568S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFW7tFy3Ww1DKw4DurW5trb_yoW8Zr1fpa
 sxAay2gr4xGrZFqF1vkFs8CFWakws7CayIk3WIk3Wa9ry7tr98KFs8Wa45JrW3trnruF4a
 q3yqyry3CFy7Ar7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqWlgUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA4-XmVOA0YHtQAAsb
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
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

The vop2 need to reference more grf(system grf, vop grf, vo0/1 grf,etc)
in the upcoming rk3588.

So we rename the current system grf to sys_grf.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index d52395b6aff7..64155b115744 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -190,7 +190,7 @@ struct vop2 {
 	void __iomem *regs;
 	struct regmap *map;
 
-	struct regmap *grf;
+	struct regmap *sys_grf;
 
 	/* physical map length of vop2 register */
 	u32 len;
@@ -1524,9 +1524,9 @@ static void rk3568_set_intf_mux(struct vop2_video_port *vp, int id,
 		dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
 		dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
 		if (polflags & POLFLAG_DCLK_INV)
-			regmap_write(vop2->grf, RK3568_GRF_VO_CON1, BIT(3 + 16) | BIT(3));
+			regmap_write(vop2->sys_grf, RK3568_GRF_VO_CON1, BIT(3 + 16) | BIT(3));
 		else
-			regmap_write(vop2->grf, RK3568_GRF_VO_CON1, BIT(3 + 16));
+			regmap_write(vop2->sys_grf, RK3568_GRF_VO_CON1, BIT(3 + 16));
 		break;
 	case ROCKCHIP_VOP2_EP_HDMI0:
 		die &= ~RK3568_SYS_DSP_INFACE_EN_HDMI_MUX;
@@ -2768,7 +2768,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 			return PTR_ERR(vop2->lut_regs);
 	}
 
-	vop2->grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
+	vop2->sys_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
 
 	vop2->hclk = devm_clk_get(vop2->dev, "hclk");
 	if (IS_ERR(vop2->hclk)) {
-- 
2.34.1

