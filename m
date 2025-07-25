Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB6BB11B91
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 12:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6800510E18B;
	Fri, 25 Jul 2025 10:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="udZY+Iv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61C610E1B4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 10:07:07 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8fPi4001331;
 Fri, 25 Jul 2025 12:06:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 EX6rxtdAs/to6XTiWeXFKYzusiCnxWSZcT/XtlJzybk=; b=udZY+Iv2Cvjzd8et
 d4nRw5vI2Xa8F4oHabOI/wAuowvq/5lVlc+FsEs2YxfcoYsrrNrf0EPP+ZSx5Vj6
 7YPXWzSZYlPYmbKeFYbtSQtfjUu1zZu21FOXLVZHJiq+ZMiaSU1PWK9E+eV2XY5H
 m50jalfoHib2wvA80cuHG448Fiet8JouLaX5FYsQi1x7zrR+2n1xCVSllf6EJPSV
 M8KwT2uEBMF1XJ4IlnZVJbZcc/Xfpn+ZLpcfgxBZRWDKBfSPvTLac5ZeiXW9WyXU
 W22W0MpKDh9Qjqc+0XZNFfsq3KpKdK/DuRWA3vfL8kn3h+QDG8vs5pJUgpybNGuU
 1JaxRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3m2hcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jul 2025 12:06:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8299640052;
 Fri, 25 Jul 2025 12:05:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF6A57A19C4;
 Fri, 25 Jul 2025 12:04:28 +0200 (CEST)
Received: from localhost (10.252.19.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 12:04:28 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 25 Jul 2025 12:03:55 +0200
Subject: [PATCH 03/12] dt-bindings: display: st,stm32mp25-lvds: add
 access-controllers property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250725-drm-misc-next-v1-3-a59848e62cf9@foss.st.com>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
In-Reply-To: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.19.90]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
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

access-controllers is an optional property that allows a peripheral to
refer to one or more domain access controller(s).

This property is added when the peripheral is under the STM32 firewall
controller.  It allows an accurate representation of the hardware, where
the peripheral is connected to a firewall bus.  The firewall can then
check the peripheral accesses before allowing its device to probe.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
index 6736f93256b5cebb558cda5250369ec4b1b3033c..e046c0a4fdb7f13ca5a31b14ae0ab19f2bc486fa 100644
--- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
@@ -54,6 +54,9 @@ properties:
   resets:
     maxItems: 1
 
+  access-controllers:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.25.1

