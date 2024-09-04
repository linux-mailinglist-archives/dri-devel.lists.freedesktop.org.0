Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8396BB7D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACE010E386;
	Wed,  4 Sep 2024 12:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="lHwQJHG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66A5F10E77D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=N/7uy
 jrB7KGGQTklpL1mV9iDvL5KrMqFqDQRAvh4XYM=; b=lHwQJHG1UBk4qFhgJ2PyF
 WGfy5bAlcr6mEF8JLqo2YISbqqDyNddWLAGiGbO9ZICh4DO2d/ocMwLlb7juwQeU
 RvuB5wv1IIbuhUz2P4lTHS2nfBvAUSsY1jdl50sYd4OTVKYAFOUt623xrOBsFYkp
 byjVP3Ik23xQ0SAcDg8RlU=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g3-0 (Coremail) with SMTP id
 _____wA3HxFgTNhmiRMZCA--.50872S11; 
 Wed, 04 Sep 2024 20:02:53 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: detlev.casanova@collabora.com
Cc: sjoerd@collabora.com, sebastian.reichel@collabora.com, heiko@sntech.de,
 hjc@rock-chips.com, cristian.ciocaltea@collabora.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 09/11] dt-bindings: display: vop2: Add rk3576 support
Date: Wed,  4 Sep 2024 20:02:36 +0800
Message-Id: <20240904120238.3856782-10-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904120238.3856782-1-andyshrk@163.com>
References: <20240904120238.3856782-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3HxFgTNhmiRMZCA--.50872S11
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyrWrWUKFy7ZF1DAw48Crg_yoW3trbEqa
 yxZwn8XF4kXr1Yqw1DJ3yxGw15Xa12kF1kCa1jyF4qya4kG348tF95Jw15Gr1UuF47uF4f
 uFnYqrW7WanxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU873ktUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRJQXmVOCpvz-gAAsC
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

Add vop found on rk3576.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- Add dt bindings

 .../devicetree/bindings/display/rockchip/rockchip-vop2.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..23b2371aea46 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk3566-vop
       - rockchip,rk3568-vop
       - rockchip,rk3588-vop
+      - rockchip,rk3576-vop
 
   reg:
     items:
-- 
2.34.1

