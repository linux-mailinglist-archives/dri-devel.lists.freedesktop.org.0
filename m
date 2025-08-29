Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7EB3B6D3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 11:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5DF10E085;
	Fri, 29 Aug 2025 09:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="wxPPHdGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683B210E085
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 09:16:02 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T8wKLF020899;
 Fri, 29 Aug 2025 11:15:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=Hw0EdPE3qQoSXFpnBVMg26
 9/A+GuHbRwyn9EvX4XOUg=; b=wxPPHdGZA0QWXX5o728xL/J/L5dYA1yiDhmvHK
 MZ/ZVbddZ7XNUiPo6jvWphJJo1OXxhr+UpQC7kAxSqxqPn1g6v0FMNhjB4DjHeAl
 Jv3ZpI3JgUTAm3656+UYZjzzBersWw0NoOL6qedmBXU9K+IPa0q3UTvsA0cB2TIM
 RD5GPQiky9VUGdVvvHvviar/iJTLhawxORik1YxBhuPuvn7SMJwjlM4VqUG+cCq/
 xuFSwW4Z5QwF5WCt0PscOa6BMYTtMIv9roasGK4hMEmVTbAPQzHhstH1tCWw+Lud
 gH0VsgyvWtVLqcTXVZ4sJA8RCU7k/kKy7D2SsKNC9SwnZoeg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q5v0gr1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Aug 2025 11:15:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BFDC340046;
 Fri, 29 Aug 2025 11:14:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 41E5679CCAC;
 Fri, 29 Aug 2025 11:13:27 +0200 (CEST)
Received: from localhost (10.252.3.130) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Aug
 2025 11:13:26 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 29 Aug 2025 11:13:25 +0200
Subject: [PATCH] dt-bindings: panel: lvds: Append edt,etml0700z8dha in
 panel-lvds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250829-drm-misc-next-v1-1-fedb48cf50dd@foss.st.com>
X-B4-Tracking: v=1; b=H4sIADRvsWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNL3ZSiXN3czOJk3bzUihJdE1OzVBNLA5MU06QkJaCegqLUtMwKsHn
 RsbW1APY9uyxfAAAA
X-Change-ID: 20250829-drm-misc-next-456e4904d5bb
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.3.130]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
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

List EDT ETML0700Z8DHA in the LVDS panel enumeration.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index f8f95e772778f54c1c3cb9975b4c0571654c817c..4388d5375851a215f005dc38171dd7a307588b85 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -48,6 +48,8 @@ properties:
           - auo,g084sn05
           # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
           - chunghwa,claa070wp03xg
+          # EDT ETML0700Z8DHA 7.0" Full HD (1920x1080) color TFT LCD LVDS panel
+          - edt,etml0700z8dha
           # EDT ETML0700Z9NDHA 7.0" WSVGA (1024x600) color TFT LCD LVDS panel
           - edt,etml0700z9ndha
           # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel

---
base-commit: b7243862f82a088d6fb7e22a25c7c024818e631d
change-id: 20250829-drm-misc-next-456e4904d5bb

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

