Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306C0B35E73
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 13:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FFF10E0CD;
	Tue, 26 Aug 2025 11:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="iwW+Zxdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8052210E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 11:57:42 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QAh1cg003615;
 Tue, 26 Aug 2025 13:57:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=DPoFd6YrsP1taRoO8mNWFQ
 0/gf5CfIZX1LZobHyFZWI=; b=iwW+ZxdmpvYkeWnR7/M1tbFbXFtCt2+cHk/XbT
 v6Pxnt1DynuR/IJHO1W/IMXmU3mlehUiSSjk8Q2BQpIDsg/kz9uSVQ0n4Al2jeAn
 GIoXrCsYpnGUC0H5/B8Fbd8N44eugP+UNzZN0JbNNnWklsNLpcw0USqR0ZZPgosy
 YJINTkXlk4+PlYdJv9KYDXVzN3UKza+KfmZDd4cNAyTgCl8jPXsQu44TxUF+a0zn
 7KmiuEbguTGAZ7raoVWH0OlC3Q2mPGjHF1YabHA1bQTgUP1UqmLDVd8LzdbAJg6r
 KJDQrHo/51AEfXsuZePkCKMIU890aZvZYK5dWZy6RT+MR78w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qrkmgmwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Aug 2025 13:57:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4DC6F40044;
 Tue, 26 Aug 2025 13:55:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE91D6C6463;
 Tue, 26 Aug 2025 13:54:59 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 13:54:59 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 26 Aug 2025 13:54:27 +0200
Subject: [PATCH] dt-bindings: panel: lvds: Append
 ampire,amp19201200b5tzqw-t03 in panel-lvds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250826-drm-misc-next-v1-1-980d0a0592b9@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAHKgrWgC/x3MQQqAIBBA0avIrBvQgaS6SrQQnWoWWmhEIN09a
 fkW/1conIULTKpC5luKHKnBdAr87tLGKKEZSFOvB7IYcsQoxWPi50IybO3IZJy20Joz8yrP/5u
 X9/0A7nlnUl8AAAA=
X-Change-ID: 20250826-drm-misc-next-21e669e21a06
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
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

List Ampire AMP19201200B5TZQW-T03 in the LVDS panel enumeration.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index fcb5834f799a8afd00dbb6a053d206d689b3f932..f8f95e772778f54c1c3cb9975b4c0571654c817c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -41,6 +41,8 @@ properties:
       - enum:
           # Admatec 9904379 10.1" 1024x600 LVDS panel
           - admatec,9904379
+          # Ampire AMP19201200B5TZQW-T03 10.1" WUXGA (1920x1200) color TFT LCD panel
+          - ampire,amp19201200b5tzqw-t03
           - auo,b101ew05
           # AUO G084SN05 V9 8.4" 800x600 LVDS panel
           - auo,g084sn05

---
base-commit: 7399c13f619f33dc8bdce838f3c83e88a18765ee
change-id: 20250826-drm-misc-next-21e669e21a06

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

