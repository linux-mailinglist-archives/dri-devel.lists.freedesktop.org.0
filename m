Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884381B623
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 13:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE3010E68C;
	Thu, 21 Dec 2023 12:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D345710E0C5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 12:44:11 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BLAdZ6g025826; Thu, 21 Dec 2023 13:43:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=wAIVUm7V9taORVR8870mPd+pd5ISYdF2B1dtf5GRRcM=; b=y3
 K+6euPfK7azugWDU6Ih4R0UqJhZucMNX9f/c3ZFWaM4jpZrLVpLeAhsJVfzadQcq
 2uyETEohBpdPpKxr9b0xwHssTlqlhDcmODMmI/eRdAkm1IizRejxSjqP1a8E0qSR
 PFYo6j02GGb5hN2UcYp2B7J9TKeclBo2L2FLcgPqDoXIoWTQDKSi+kCmpaYOJX/f
 X0Yrd0ht3FF/c0yFL7bI1ul1SXSYSvDgLBzS3dsB18ZQ4herW272HKRAlWxpLB6h
 96hmt0ldDWJ9Gc7j7/g/6eNzgH0Wqqd27RPWMrhRNAiwoFd0+gii/GJYTgm46+5M
 iMGlpp3Ec7amuijskZGQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v3q810q1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Dec 2023 13:43:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E33810005F;
 Thu, 21 Dec 2023 13:43:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 155A7280A11;
 Thu, 21 Dec 2023 13:43:53 +0100 (CET)
Received: from localhost (10.252.25.159) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 21 Dec
 2023 13:43:52 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>
Subject: [PATCH RESEND v1 1/8] dt-bindings: panel: lvds: Append edt,
 etml0700z9ndha in panel-lvds
Date: Thu, 21 Dec 2023 13:43:32 +0100
Message-ID: <20231221124339.420119-2-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.25.159]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-21_06,2023-12-20_01,2023-05-22_02
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

List EDT ETML0700Z9NDHA in the LVDS panel enumeration.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 9f1016551e0b..3fb24393529c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -42,6 +42,8 @@ properties:
           - auo,b101ew05
           # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
           - chunghwa,claa070wp03xg
+          # EDT ETML0700Z9NDHA 7.0" WSVGA (1024x600) color TFT LCD LVDS panel
+          - edt,etml0700z9ndha
           # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
           - hannstar,hsd101pww2
           # Hydis Technologies 7" WXGA (800x1280) TFT LCD LVDS panel
-- 
2.25.1

