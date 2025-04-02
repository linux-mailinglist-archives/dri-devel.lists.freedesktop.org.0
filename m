Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A5A78E70
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAC110E773;
	Wed,  2 Apr 2025 12:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="k5MNf0c0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id C3CD010E777
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=g3jx9
 mZP84zW4GKnneObG67nUX/ojN2RZWPwZ8uHvVk=; b=k5MNf0c0yOQ3sb37A0N3O
 v5SekZwbRQDWEyzuVS8p8n/70pO3xrDjvdOBJOIKUjwqu4DCQ5KJDsTFDi5JBDgz
 wOck6gWjtbCpBzXqGkjTW+25I5SRYSXy9LXF4UgBf3GCVY3EA9PKZTcrftg9JxW6
 08pn4WtwXXq+o0QUga2UqU=
Received: from ProDesk.. (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgDnd405Lu1nJwOJBA--.36321S8;
 Wed, 02 Apr 2025 20:32:03 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 6/7] Revert "ARM: dts: rockchip: drop grf reference from
 rk3036 hdmi"
Date: Wed,  2 Apr 2025 20:31:40 +0800
Message-ID: <20250402123150.238234-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402123150.238234-1-andyshrk@163.com>
References: <20250402123150.238234-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDnd405Lu1nJwOJBA--.36321S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5Kr43uFW8Ary3Kw15Arb_yoWkWFX_tF
 yIg3W5Ka1FkrWYqry8tw4UGwsFywn5GFWrJw1rJr4UGwnYqF4DuFs5GayxAr15Gay2grZ3
 WFZ5Xa1Yyw13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0aYLDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gUjXmftK+o5lQABsM
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

This reverts commit 1580ccb6ed9dc76b8ff3e2d8912e8215c8b0fa6d.

The HSYNC/VSYNC polarity of rk3036 HDMI are controlled by GRF.
Without the polarity configuration in GRF, it can be observed from
the HDMI protocol analyzer that the H/V front/back timing output
by RK3036 HDMI are currently not in line with the specifications.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v2)

Changes in v2:
- First included in this series

 arch/arm/boot/dts/rockchip/rk3036.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
index 22685cd23a708..95ae815ba56d3 100644
--- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
@@ -405,6 +405,7 @@ hdmi: hdmi@20034000 {
 		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_HDMI>, <&cru SCLK_LCDC>;
 		clock-names = "pclk", "ref";
+		rockchip,grf = <&grf>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hdmi_ctl>;
 		#sound-dai-cells = <0>;
-- 
2.43.0

