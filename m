Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C98858EE8
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 12:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E11B10E077;
	Sat, 17 Feb 2024 11:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="Rs25/BLc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5118010E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 11:04:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41H4iBek028987; Sat, 17 Feb 2024 12:04:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=selector1; bh=RnhRbd/hclbstXd7Q3NPDVDNjfAippsXAKSovZiaCJg
 =; b=Rs25/BLctHvzsAXjDLDQ6PuOhH0RPprK6ImbHWKJB4ggXElnwrey2IMElUE
 DFZ2yxK5VKcduqooM2Bl0wcuslxrmT6r9M3yDfEa9Rnc/tvveM1iuLz0t1ZOpAH8
 8AAhLeAxqL1RIL196lQhbZjy7hPeZIVA08yfc7rCGOMX0RTeL86ZWyYpsCM+gcZl
 K+xXCph+LtfXysAKv8Vg9lovwj9yQ4QQOdTOllJJnx/lXcItJCLTcmtFA5+DyQ7U
 AbX5P5RTubdacf3cn6XqESP6BBcWkfNA31N/VhjX14d2E/4tIhK595xCX+W2ppn/
 s3oK59BK7PDkRs1Bcw55C/u0SWQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wamjh0tbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Feb 2024 12:04:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C72F840046;
 Sat, 17 Feb 2024 12:03:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8345F253B49;
 Sat, 17 Feb 2024 12:03:12 +0100 (CET)
Received: from localhost (10.252.12.210) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 17 Feb
 2024 12:03:12 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Sat, 17 Feb 2024 12:02:58 +0100
Subject: [PATCH v2 4/4] dt-bindings: display: simple: hardware can use
 several properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240217-ltdc_mp13-v2-4-50881f1b394e@foss.st.com>
References: <20240217-ltdc_mp13-v2-0-50881f1b394e@foss.st.com>
In-Reply-To: <20240217-ltdc_mp13-v2-0-50881f1b394e@foss.st.com>
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
X-Originating-IP: [10.252.12.210]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-17_07,2024-02-16_01,2023-05-22_02
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

Setting a panel-timing in the device-tree overwrite the one specified in
the driver and set it as preferred.  In that case 'height-mm',
'width-mm' and 'panel-timing' are properties that can be use for simple
panels, according to panel-common.yaml

Fixes following warnings:
arch/arm/boot/dts/st/stm32mp135f-dk.dtb: panel-rgb: 'height-mm', 'panel-timing', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 634a10c6f2dd..c02cbbc7a100 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -352,6 +352,9 @@ properties:
   no-hpd: true
   hpd-gpios: true
   data-mapping: true
+  height-mm: true
+  width-mm: true
+  panel-timing: true
 
 if:
   not:

-- 
2.25.1

