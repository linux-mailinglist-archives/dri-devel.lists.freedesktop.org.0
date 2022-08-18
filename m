Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D425983B1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 15:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB8DB9C5E;
	Thu, 18 Aug 2022 13:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 908 seconds by postgrey-1.36 at gabe;
 Thu, 18 Aug 2022 13:01:03 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE64A0473
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1660826751; x=1663418751;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iAMEvbw5T/Bs1a3zPt+5a8wXpubuP4oO3wVffBPc+jE=;
 b=m39noKJ3VTUqmBK3TJJl7oJmI3aI6wutYEvbulXnTPKvUj+7Gw55fF4BsFlAG2/r
 aFAKE+FU1okcPr2Zrld4petjVUsRbWPIJLzLOdjMOh+DcmucO/hZRwSaWqQrSdEB
 BdgNdsnloYH990c+1FRcmRDt0zjnhU/V3/s65sqtpXw=;
X-AuditID: ac14000a-833f270000003940-0d-62fe347ff26c
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 64.B6.14656.F743EF26;
 Thu, 18 Aug 2022 14:45:51 +0200 (CEST)
Received: from lws-dhaller.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 18 Aug
 2022 14:45:49 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <robh+dt@kernel.org>, <sam@ravnborg.org>, <thierry.reding@gmail.com>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display: simple: Add EDT ETML1010G0DKA panel
Date: Thu, 18 Aug 2022 14:45:17 +0200
Message-ID: <20220818124518.42080-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWyRpKBV7fe5F+SwYI2FYv5R86xWlz5+p7N
 ou/FQ2aL1r1H2C1W/NzKaPFz1zwWBzaPnbPusntsWtXJ5nHn2h42j/vdx5k8lky7yubxeZNc
 AFsUl01Kak5mWWqRvl0CV8aF80tZC85zVDy/9IO5gbGFvYuRk0NCwERi65tZzF2MXBxCAkuY
 JI5MPMoO4TxllDj4by4jSBWbgKbE9ElbwWwRgXyJ9m8XWLsYOTiYBaIlek+EgYSFBfwkml8t
 BhvKIqAq0dH9hRnE5hUwl5h65xnUMnmJmZe+s0PEBSVOznzCAmIzA8Wbt85mhrAlJA6+eAFm
 C4HUr+lmhemddu41M4QdKjF/zXf2CYwCs5CMmoVk1CwkoxYwMq9iFMrNTM5OLcrM1ivIqCxJ
 TdZLSd3ECApvEQauHYx9czwOMTJxMB5ilOBgVhLhvXHnT5IQb0piZVVqUX58UWlOavEhRmkO
 FiVx3vs9TIlCAumJJanZqakFqUUwWSYOTqkGxsDH6gu+P3drm9H4+XHwCv8Hkpqnr8/9rn6r
 XvvKyxVTHBtfyGuvWXz10EnFPZ6XvOKyn2ctfr00zf7UXXHbJXrvbfcUX3A29+Z4mn00/4DZ
 Mq/qF4+MH0v8N9m37I79x5nFe5b6Ox01ubW6tMTMZ+YCCd3NB+/Wnpqdo73SMovdLpyh+e+j
 45eVWIozEg21mIuKEwHGec2KXQIAAA==
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 upstream@phytec.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding for the Emerging Display Technology ETML1010G0DKA panel.
It's a 10.1" WXGA (1280 x 800) LVDS panel with backlight and capacitive
touch.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 18241f4051d2..bd8a7c77e90f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -143,6 +143,8 @@ properties:
       - edt,etm0700g0edh6
         # Emerging Display Technology Corp. LVDS WSVGA TFT Display with capacitive touch
       - edt,etml0700y5dha
+        # Emerging Display Technology Corp. 10.1" LVDS WXGA TFT Display with capacitive touch
+      - edt,etml1010g0dka
         # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel with
         # capacitive touch
       - edt,etmv570g2dhu
-- 
2.25.1

