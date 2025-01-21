Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9589EA17BDF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E6810E54F;
	Tue, 21 Jan 2025 10:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="M2ZGcCIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B30510E54F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=rIdeV
 1+pXq0QaKtzBsI6ANLMHSHhAqjh7JQhiSF7JzM=; b=M2ZGcCIgxmuY+dOCZstHE
 iEv6LegmSeOgJ4xguxvbAPFnG+Qc2hPNxnzZNkK3S4nbQkUzQc0HMCoG6K2jUeVQ
 6HEbcIRL04L/0FnBYnwbdRUPhSJxpMVxrQNBv5orjkR9nYODeb9pVv1FKWkUwWpZ
 fMDooB+Cs4/pfYFWV63yXE=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgDHVyxIeI9nfog_LQ--.31266S2;
 Tue, 21 Jan 2025 18:34:51 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v12 11/13] dt-bindings: display: vop2: Add missing rockchip,
 grf propertie for rk3566/8
Date: Tue, 21 Jan 2025 18:34:44 +0800
Message-ID: <20250121103446.2528212-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121103254.2528004-1-andyshrk@163.com>
References: <20250121103254.2528004-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgDHVyxIeI9nfog_LQ--.31266S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWxtw43Zr4UGrWxXF1kKrg_yoWDZFXEq3
 yxuF1Y9rs5Xrn8Kw1DA3yxCrs8Za1Ikr4DCayqyF4qy3Z5A34v9F95Jw15CF18CF43uF4S
 krs5urZrWanxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8RRRtUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gDbXmePdPdBiAAAs1
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

Propertie "rockchip,grf" is required for rk3566/8.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v12:
- Split from patch 10/13

 .../devicetree/bindings/display/rockchip/rockchip-vop2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index f23939e67fd0..157a37ed84da 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -145,6 +145,9 @@ allOf:
         rockchip,vop-grf: false
         rockchip,pmu: false
 
+      required:
+        - rockchip,grf
+
   - if:
       properties:
         compatible:
@@ -200,6 +203,7 @@ examples:
                               "dclk_vp1",
                               "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
+                rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;
                 vop_out: ports {
                     #address-cells = <1>;
-- 
2.34.1

