Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0E4CDB912
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 08:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E2B10E34E;
	Wed, 24 Dec 2025 07:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtU8emUI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8N+Gwhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A796E10E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:12:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO2SPpe913513
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2YfFfMSB4exFplLupweAVHt/pUfFT0Wd3bKSpsIdM24=; b=WtU8emUIOhpvv+m3
 WeKl1dZWFpzWOEsgc9g3P+wMIZZ/JGxX1ItqIEew+BvBsPT+zxDpdyB+c9dXmYjy
 bl8z7dTIFboe5TPp8TM/gSD47ulMlIcMf+auV7JB/WT742NcpgDiEKkwKwy5Qx6r
 RN9McbkqK/fymZQdhhFUyQVOfSCkXx6ddg+sz/nR0ZlaBkMSD5mCzpPwynDg/N4b
 H/ipfrAgdphL3t9xyLt8fcSP0xVVZXZdMx5SsQTU6KgfyxRoejDOWgl2N35uDGRS
 KbS6GciPmjf5us+CaA8YdwlQ6hBAtU9uyKaTsY118wvcoFjAz1Csmy7gRs0uZS7b
 vSxT4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2jemb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:11:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34c387d3eb6so5463797a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 23:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766560318; x=1767165118;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2YfFfMSB4exFplLupweAVHt/pUfFT0Wd3bKSpsIdM24=;
 b=X8N+GwhjHCFZXYsUhFR/+YJmA8d+14f8Xk3uQtDqCPU3CZU4FwXLGc0ypzL8KuT9EN
 VhlIHtkVE/abDRkCF9oWevWmU1pUPhCZH20YBQnYY44uuGvtp7UitPWiKGKp2Ykb9wy4
 GgE3tG4Qwrqmdly1d+WbRGUW2E1m5eoT9wG4ZLS6EVmeI6r+ldm8vEFl7SYyWke18Wjt
 2W7dLG7AtjqoVMGnae9pK7zYC6OtUZ56sA65SDwlggizhRhIav7sj2/efJezteStSkau
 rPZZbSTJQNYobgal63pwX4LNXlCRApi4TBnhdQIlFvyyVMwCiQfrn3/hd8DL+PUno44Z
 yC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766560318; x=1767165118;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2YfFfMSB4exFplLupweAVHt/pUfFT0Wd3bKSpsIdM24=;
 b=NhpEpouHoB+XPSMeXWoyjvGsdOE3gKhBoCeUdL6MW1emqz3TlxoCEqb9liM1DBjxDY
 yRyw31kZ8CdCzzNW5hi5fj/0G9wWxU3orpPQBTQsHwoZMz2nves4/IBlkmGbdYhgKWJs
 omPLeu4zJxjb3bU+bUqbPlj+jqFMgdq/XrV/3RtDjFE2qnEVOjP3hbbWGLt0GDe7yNpb
 msAxw48S6d118elcgzv1lZ1fEA7KZ6kluqM5PFlYVsD7GeKuyrBBHjjuVDLK2lxhiu+t
 ERyhKYk4FRM3A468Ta49RYcOrQZYIf2iTbMTT3J3YgHi28K6eY9NuSmU2FtLXDkP2KXG
 r35w==
X-Gm-Message-State: AOJu0Yzv+zgeCW/VRIMNtsKTie0vK/dYOTRyC0IkXExxecpsz15wfTzU
 oMFwbUCFP7dYd1L6oIqZnj2GfW2vlPVLQECIu2x+jFnmR+7Wd4DBAddS36kcwgst/eJgeOLctmQ
 MXfisZh5kkKg5Z363LpZlPRutZ3kN0wzmyso1bXy9zl/Xu+/GO7Xp4C5f3Zc7d/2vOW4S/jU=
X-Gm-Gg: AY/fxX472tgkUGWJo8yLUfVYecNoVW4hXEpd69DlaxIkC6P8JEE4Y1ReEbUEwbNdTDx
 6kq23uv8Vf4MUXF2Wz8XqZiz+wvYoikVZFjHRi0U5chKa9If5GgvgymtlJFzotBzZ7alSQdlC64
 dPdgDS5s/xogSxlcANVYNp2CSeTxrykko14O26VofcBp0v6/nfHhLG0wHKI2mg4u+o+ZppX7XvP
 zgdFw6lBs6dfzpiNJV1JF/jVg7Vkq9AKxT+gf5YV7p5BRvjqu4syghlPckVdjoX1bmiybFOe8+N
 32SX6GevQ3iD3onx/n7ffsDrL8BW+O6gyqxK7xF4vuAJ5qEL9MRsLNIidais1rXt9IsJch1KLJD
 y3AacqmwJZ6q9eABnrPjAl36BXfv+NxPcP5XV83TGH1NUpCeMyw==
X-Received: by 2002:a17:90b:2248:b0:340:7b2e:64cc with SMTP id
 98e67ed59e1d1-34e921353d3mr15053984a91.15.1766560318518; 
 Tue, 23 Dec 2025 23:11:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExx/RAYAffGknp8W9r275ggkrkV7HXP1HEd06LyL1fEDWRjxE4J83htW2R0rnM8BM/TmyhiA==
X-Received: by 2002:a17:90b:2248:b0:340:7b2e:64cc with SMTP id
 98e67ed59e1d1-34e921353d3mr15053955a91.15.1766560317860; 
 Tue, 23 Dec 2025 23:11:57 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e769c347asm8977146a91.0.2025.12.23.23.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 23:11:57 -0800 (PST)
From: Venkata Gopi Nagaraju Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:41:40 +0530
Subject: [PATCH v4 1/2] dt-bindings: bridge: lt9211c: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-add-lt9211c-bridge-v4-1-406e73ec28c5@oss.qualcomm.com>
References: <20251224-add-lt9211c-bridge-v4-0-406e73ec28c5@oss.qualcomm.com>
In-Reply-To: <20251224-add-lt9211c-bridge-v4-0-406e73ec28c5@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766560305; l=2323;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id; 
 bh=d7nkcVTQqp03kvoFSTF6KcENWWENfBKsBJBvo2yMm9c=;
 b=/ZOd6I6G0zKL8vJQa0CP3RYCfnKVVXNUAwUmgWyR4V0PpM5w2oU8YnZVyk2PcWX6bJsCR7tTB
 j9jeE4nJoRxCv7fOhRvwRjn5wk7mMroAEFIemxB3ht8cCPesPrZJUvX
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA2MCBTYWx0ZWRfX55iCFtFUU8+n
 CT5y6N8Z/t9sBaU7VZyevuRJj4hsmbkJdX9VQI3uB4UZm0132wFEjVgAboxiGoKNVyWPVqPbAj+
 EyWQ0oKLV3m0xQ/7YFjkL5jQMUTNVQKZdbXncMgKspbpcsnHn8GLRXKwkkZZ3FAM9ow1RunLHIx
 7KcjNWawXMLx0eiTUCXxypVokDgqSrjg9IKhuAEla2lzvUlezuKf5WR6KvKIDDRBziOHN23uC6o
 83OxH+IFRULJ6mO1gyMDGq9CH92ovEepwzat86e3F6B8GC6U3AZ9Y+Sg4zA6NbqTbg4xwrSMrVJ
 g8MXuUHzlOmQz0jgH25mKBbyvQlBtTr9Xy8BR59YbuvZiaG9WkLF7ytIFPmlG+Jz8BHAI5Ym5L7
 Lop4cwlN7ypRIzPdHknXsrvsQ5F44ZNzcAzocQZIO7738fg0m+PZ48+o7WOhr9vIeyAUJh4yqf1
 FCJklG/eqG94FRtEQQA==
X-Proofpoint-GUID: YRn7_Qo5FvvNvzxIPRpOG2pOhXaO7pJ9
X-Proofpoint-ORIG-GUID: YRn7_Qo5FvvNvzxIPRpOG2pOhXaO7pJ9
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694b923f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=GNq8Cu9_-0EbQeekDTwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240060
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

From: Yi Zhang <zhanyi@qti.qualcomm.com>

Add bindings for lt9211c.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
---
 .../bindings/display/bridge/lontium,lt9211.yaml    | 42 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
index 9a6e9b25d14a..98079df61cbb 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
@@ -4,19 +4,20 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
+title: Lontium LT9211/LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
 
 maintainers:
   - Marek Vasut <marex@denx.de>
 
 description: |
-  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
+  The LT9211 and LT9211C are bridge devices which convert Single/Dual-Link DSI/LVDS
   or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
 
 properties:
   compatible:
     enum:
       - lontium,lt9211
+      - lontium,lt9211c
 
   reg:
     maxItems: 1
@@ -91,6 +92,43 @@ examples:
 
         vccio-supply = <&lt9211_1v8>;
 
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+
+            endpoint {
+              remote-endpoint = <&panel_in_lvds>;
+            };
+          };
+        };
+      };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      lvds-bridge@3b {
+        compatible = "lontium,lt9211c";
+        reg = <0x3b>;
+
+        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+
+        vccio-supply = <&lt9211c_1v8>;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;

-- 
2.34.1

