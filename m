Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB0706B47
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 16:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7B410E42E;
	Wed, 17 May 2023 14:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C00D10E42A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 14:36:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HC7EKs028935; Wed, 17 May 2023 16:35:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=00JAgHxEd5yHXSK5+6eDKzTzPcc1GPWJNQgGlh/mhAI=;
 b=cYhaPtI4VU6G40ubezwBBzZplUzPsyrLp+Wi9a13YuLp82T5obHZXblnXl5m5XrGgkl3
 qwdU+E+HOe3pEI4Ok8FhkI9bl5buwdFWpJuGtVCfXA+rWO8sTg5PIyXI89Gx9Rg6JkAo
 lMeXzkUh3+Uog9fCcZZ92V9j8UvJcH586C17yqOxmo2CHP5iRVu9Q2euSLRbjc55FIje
 jEGwVgDYa6eoNQ4rae+UG8k/vvm4WanyuAyuNqU4c1iZGOGowvvlR/xSElc+zS+rt2I1
 NYoNkftBGlSAQsR1TdF7ETZqLw/KVzntX13uiXK/vqjDi4wsWBtDAJNAe2T45GvICiK0 wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qmuhntnew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 16:35:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7490610002A;
 Wed, 17 May 2023 16:35:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6213D23356C;
 Wed, 17 May 2023 16:35:48 +0200 (CEST)
Received: from localhost (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 17 May
 2023 16:35:48 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Marek Vasut <marex@denx.de>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [PATCH v3 0/3] STM32 warning cleanup
Date: Wed, 17 May 2023 16:35:39 +0200
Message-ID: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This serie aims to reduce the number of device-tree warnings of
following boards :

  - STM32F469-DISCO
  - STM32MP15*

Those warnings were appearing either during build or when checking
dt-bindings and concern mostly LTDC and DSI IPs. They were due to the
following cases:

  - 'panel-dsi@0' instead of 'panel@0' according to the YAML
  - unnecessary #address-cells and #size-cells properties
  - residual 'reg' field on single endpoints

First patch fixes stm32f469-disco device-tree.

Second patch fixes st,stm32-dsi.yaml dt-bindings.

Third patch fixes stm32mp15* device-trees.

Changes since v2:
	* Added changelog
	* Enhanced commit descriptions

Changes since v1:
	* Added DSI subnode name change
	* Included stm32f469-disco DT in the cleanup
	* Included YAML fix to prevent regression

Raphael Gallais-Pou (3):
  ARM: dts: stm32: fix warnings on stm32f469-disco board
  dt-bindings: display: st,stm32-dsi: Remove unnecessary fields
  ARM: dts: stm32: fix several DT warnings on stm32mp15

 .../devicetree/bindings/display/st,stm32-dsi.yaml      |  2 --
 arch/arm/boot/dts/stm32f469-disco.dts                  |  4 ++--
 arch/arm/boot/dts/stm32mp151.dtsi                      |  5 -----
 arch/arm/boot/dts/stm32mp157.dtsi                      |  7 -------
 .../dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts    |  6 ++++--
 .../boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  6 ++++--
 .../stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts  |  3 +--
 arch/arm/boot/dts/stm32mp157c-dk2.dts                  |  8 ++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts                  | 10 +++++++---
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts              |  3 +--
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi     |  6 +-----
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                 |  3 +--
 12 files changed, 29 insertions(+), 34 deletions(-)

-- 
2.25.1

