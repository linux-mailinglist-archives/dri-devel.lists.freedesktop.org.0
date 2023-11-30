Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C907FEF0A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 13:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A28410E6F4;
	Thu, 30 Nov 2023 12:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B0D310E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 12:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/4Iua
 fg2hhPzAVvzMsQQEyFbtwMDIUlEC3dLvK0EF3M=; b=jRnlGiYG/xmMAfrj6CeQr
 TN3MsHGd7q+lhtHmN4wCJlSSIJUctjk+IdxdkEH5SV+acJmhIiIJiqmlOAB0L7m6
 5TsaXzItfujHJz2tc+Rtu2aar/fxNZnET88VqGBFkhN2Un0z9q3o+uSFK5RjG5ZZ
 TduBK0UHpYx5zyl8zOWXKY=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g1-1 (Coremail) with SMTP id _____wD3_7Ydf2hl0M6qCQ--.51188S2;
 Thu, 30 Nov 2023 20:25:04 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v3 13/14] dt-bindings: iommu: rockchip: Add Rockchip RK3588
Date: Thu, 30 Nov 2023 20:25:00 +0800
Message-Id: <20231130122500.13491-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130122001.12474-1-andyshrk@163.com>
References: <20231130122001.12474-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_7Ydf2hl0M6qCQ--.51188S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4rZFW3KryxGr15GrWDtwb_yoW3XFb_u3
 WxXa15XF48tF4F9w1DZw4xGr98G3W2krn3ZFs8CF1kC3WUZrykt3s3Jw1rAr4xWr47uFyS
 9F1vgry3WF9xGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8KFAPUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAU4XmVOAquXMgAAss
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

Add a Rockchip RK3588 compatible

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index ba9124f721f1..3febf0c3c404 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -22,6 +22,7 @@ properties:
     enum:
       - rockchip,iommu
       - rockchip,rk3568-iommu
+      - rockchip,rk3588-iommu
 
   reg:
     items:
-- 
2.34.1

