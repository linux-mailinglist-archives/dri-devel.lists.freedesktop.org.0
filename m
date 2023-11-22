Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DBA7F4724
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C4510E62B;
	Wed, 22 Nov 2023 12:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9C0A10E62B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1/yeg
 zhg493SHTeZi5h3nk3lTbPGINQCkIZUbQHUeVA=; b=fKSsXRd8y86+tjM+RTSH9
 TGaEuGovJ8wiDGh0cMEug4IHZwwkgstMvTydI8x5kVzWUeU55thdrEkxXzIBh7z6
 OuHa8qOb47GZZfWLkvS9GHMWHSeIQ214NacjAFHPjUwNXqz+OPD1Dh0BsT05XXvO
 Ua4kIokobf5qFABxM0MEik=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g5-3 (Coremail) with SMTP id _____wC3nxBE+l1lQijtDg--.51444S2;
 Wed, 22 Nov 2023 20:55:35 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v2 09/12] dt-bindings: soc: vop2: Add more endpoint definition
Date: Wed, 22 Nov 2023 20:55:31 +0800
Message-Id: <20231122125531.3454857-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122125316.3454268-1-andyshrk@163.com>
References: <20231122125316.3454268-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3nxBE+l1lQijtDg--.51444S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF48Aw1fJFW3tFyfKF17KFg_yoWfCFc_A3
 ZrXF4kWF4fuFWfJrZ5Ar48Wr15u3Z7CF1xXFn0yrZxAF1F9rWkA3Z7JF13J3Wruay5J3Wv
 qay0gasxu3Z8GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnUKItUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBnAgwXlghlh7-EgABsn
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

There are 2 HDMI, 2 DP, 2 eDP on rk3588, so add
corresponding endpoint definition for it.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- split form vop driver patch

 include/dt-bindings/soc/rockchip,vop2.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/soc/rockchip,vop2.h b/include/dt-bindings/soc/rockchip,vop2.h
index 6e66a802b96a..668f199df9f0 100644
--- a/include/dt-bindings/soc/rockchip,vop2.h
+++ b/include/dt-bindings/soc/rockchip,vop2.h
@@ -10,5 +10,9 @@
 #define ROCKCHIP_VOP2_EP_LVDS0	5
 #define ROCKCHIP_VOP2_EP_MIPI1	6
 #define ROCKCHIP_VOP2_EP_LVDS1	7
+#define ROCKCHIP_VOP2_EP_HDMI1	8
+#define ROCKCHIP_VOP2_EP_EDP1	9
+#define ROCKCHIP_VOP2_EP_DP0	10
+#define ROCKCHIP_VOP2_EP_DP1	11
 
 #endif /* __DT_BINDINGS_ROCKCHIP_VOP2_H */
-- 
2.34.1

