Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F92861197
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 13:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF3910EBF0;
	Fri, 23 Feb 2024 12:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="KLgrMamb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6989710EBF0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 12:38:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N8GlAX022193; Fri, 23 Feb 2024 13:38:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=selector1; bh=F8zN5Yz0CWcU425g4AE37w9LRhYp8Zn5uSxrL8yHXMQ
 =; b=KLgrMambOr1HfgvJtNKE7rQUf6tvKRDf6amCBEY4a+YxJLQ2vW9rBQpmOWB
 mcPSA/SY3aBdumAM0cZqIUgqAYTHizi52XjhPq9axXa6/yRcGy0LiJVPuKxBJrLn
 TxSl0Ms0KDygiNyBkwj8b3668ZBS0U6PRKlorg0T3uC1yj2EttYL1IZmMZ5b1TUj
 r2JqlSdJqLxHmVYKIbIKeBEHCVi+lLucpCvAL4IgI0lBUpz8Oya9Sf50DiINKP07
 dp08Vb1O4Lq72eaGhLCX6cTaHCZ7rWyTa0hwv0osL0AdPrrY51nV4LwZ7SgeWdg3
 LVUCVnxahCO4nOcUpXvvHGdBC4g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wd2034kjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 13:38:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 64DDC40046;
 Fri, 23 Feb 2024 13:38:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7BC428DDC3;
 Fri, 23 Feb 2024 13:36:54 +0100 (CET)
Received: from localhost (10.129.178.151) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 23 Feb
 2024 13:36:54 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 23 Feb 2024 13:36:51 +0100
Subject: [PATCH v3 4/4] dt-bindings: display: simple: allow panel-common
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240223-ltdc_mp13-v3-4-7f92a59ca11f@foss.st.com>
References: <20240223-ltdc_mp13-v3-0-7f92a59ca11f@foss.st.com>
In-Reply-To: <20240223-ltdc_mp13-v3-0-7f92a59ca11f@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.129.178.151]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
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

This device inherits properties from panel-common. Those should be allowed
to use, instead of specifying properties to true for each specific use.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Changes in v3:
  - Allow every properties instead of adding each properties to true as
    Rob suggested
  - Rewrite commit log to match changes

Changes in v2:
  - Added this patch

Fixes following warnings:
arch/arm/boot/dts/st/stm32mp135f-dk.dtb: panel-rgb: 'height-mm', 'panel-timing', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
---
 .../devicetree/bindings/display/panel/panel-simple.yaml       | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 634a10c6f2dd..01c9153da3d3 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -344,15 +344,6 @@ properties:
         # Yes Optoelectronics YTC700TLAG-05-201C 7" TFT LCD panel
       - yes-optoelectronics,ytc700tlag-05-201c
 
-  backlight: true
-  ddc-i2c-bus: true
-  enable-gpios: true
-  port: true
-  power-supply: true
-  no-hpd: true
-  hpd-gpios: true
-  data-mapping: true
-
 if:
   not:
     properties:
@@ -363,7 +354,7 @@ then:
   properties:
     data-mapping: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible

-- 
2.25.1

