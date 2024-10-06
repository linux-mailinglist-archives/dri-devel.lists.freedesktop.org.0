Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405E9992142
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 22:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B401E10E2E3;
	Sun,  6 Oct 2024 20:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.b="J1tEoALs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from st43p00im-ztbu10073701.me.com (st43p00im-ztbu10073701.me.com
 [17.58.63.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1D610E2E3
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 20:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1728247410; bh=xvq7xi7e69Ri9g5ozfmwagjAfSogeiQRw985VAu4la8=;
 h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To;
 b=J1tEoALshDlqIHnbuzklg7BNWt/GurAKESHaED9kpND6j1W+u24PcpuTNnsa64C+8
 KADL0cFQBiZoFM+ZHMQKNqkn+49M03WPgbfMBxNYt/CLdagT2cAfXw0VevRRtHEK5F
 moudiHk4nhEti6nR+Y0A8qM8KhBHhhYzgQrmpUqYmgdqP2rJ+5AHfRltz0Z+WwGIhD
 P/yAEg0uVZQMUdkQgJtKOaTm3IX3MeL2Vt+M/+7O9DCQmT0RpxuuC36YL4XSMU+dYc
 e9cN9ZSYWWJypikzsg48kKQZvzeYeJCSsLdoo4hN1sqODAN7FasN1cOGBaRWQxd6b5
 1fA/Vwy9Wg5dQ==
Received: from localhost (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
 by st43p00im-ztbu10073701.me.com (Postfix) with ESMTPSA id
 6D4541C021F; Sun,  6 Oct 2024 20:43:27 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
Date: Sun, 06 Oct 2024 20:42:50 +0000
Subject: [PATCH v2 2/3] ARM: dts: st: add node for the MALI gpu on stih410.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241006-sti-gpu-v2-2-c6bb408d6903@me.com>
References: <20241006-sti-gpu-v2-0-c6bb408d6903@me.com>
In-Reply-To: <20241006-sti-gpu-v2-0-c6bb408d6903@me.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alain Volmat <avolmat@me.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: McR6wj_dioSVIM3FiabDJEyMI6kGf5og
X-Proofpoint-ORIG-GUID: McR6wj_dioSVIM3FiabDJEyMI6kGf5og
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-06_19,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 mlxlogscore=588 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410060149
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
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

Add the entry for the GPU (Mali400) on the stih410.dtsi

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 arch/arm/boot/dts/st/stih410.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/st/stih410.dtsi b/arch/arm/boot/dts/st/stih410.dtsi
index a69231854f783b1b9fd685ba2822eb406e0ffdf5..d56343f44fda4e9e1de2e5efc86e2d984bad14b4 100644
--- a/arch/arm/boot/dts/st/stih410.dtsi
+++ b/arch/arm/boot/dts/st/stih410.dtsi
@@ -285,5 +285,39 @@ cec@94a087c {
 			resets = <&softreset STIH407_LPM_SOFTRESET>;
 			hdmi-phandle = <&sti_hdmi>;
 		};
+
+		gpu: gpu@9f00000 {
+			compatible = "st,stih410-mali", "arm,mali-400";
+			reg = <0x9f00000 0x10000>;
+			/* LIMA driver needs 2 clocks, use the same for both */
+			clocks = <&clk_s_c0_flexgen CLK_ICN_GPU>,
+				 <&clk_s_c0_flexgen CLK_ICN_GPU>;
+			clock-names = "bus", "core";
+			assigned-clocks = <&clk_s_c0_flexgen CLK_ICN_GPU>;
+			assigned-clock-rates = <400000000>;
+			resets = <&softreset STIH407_GPU_SOFTRESET>;
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gp",
+					  "gpmmu",
+					  "pp0",
+					  "ppmmu0",
+					  "pp1",
+					  "ppmmu1",
+					  "pp2",
+					  "ppmmu2",
+					  "pp3",
+					  "ppmmu3";
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.43.0

