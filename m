Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3406542DD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97510E169;
	Thu, 22 Dec 2022 14:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0612310E169
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:25:48 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u9so5388537ejo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fOsi2OwSq3xHI7aui3O414Oo1XlE4pBwJtqzcodoVCQ=;
 b=MlKU5KNhffaWl+HI6LQ+w9cQLnvsbNTJVEYK+oItp52FhknzDgvIMJ+/mBcMmMp/nM
 FBpCzLrvZGFUSW739Xqa/Ck0qPPJgnpjK0rQAn5r8CjtHNetqca/BWq7JNQ+kU+FffjZ
 PxKNZj2lsEPu6ozrQke8Yrx6nOyxq8DCQO3+CF6oFs1k2/eMoo41sh1pwJ5vaBD+e3Rm
 QmtU8bNdMMjy7r4ot3LTZwTOv7Y2MR9p6CCO8dRh9pCJX9XeuvS3t3CHNsI6aIZEHN+s
 pUvz8hEIRjXvtwWLkd+UAXxEgwQIC0kvRIJIJL1TlRSDlX85aGeo05gDzYBkQ/jh/xbf
 Rn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fOsi2OwSq3xHI7aui3O414Oo1XlE4pBwJtqzcodoVCQ=;
 b=hC81tPUq+ffV+3JRLD9jAKU8eSqSk3DZxWLChJ++Q3RzFTmKlZbOlWItUAUAUicU+1
 HW9V52A6732S5N2TDJoec30tfXuUFX4GaJS0Vv8XCo4ma266R0p7z84K/0ifFLxizVi5
 itWhvRVgRZUeJ0WLnK12OT7pcjisuvYu+Tlal9HcxbO5LDisHSUxRrFUmu9aEYjGWCRz
 aaeoXoedCHeSgRWVsadR2yVij4OiGOSPHwBf15FORsTB309ZMJbkuSX+dkY8LXpDDZBa
 TYjcJZwOLWGbAG9bsp9lh5Hz4ZE6wueKKWrhGXGSKhLutMUVgTdEvegdZgf8Lq+0ClMa
 mh2Q==
X-Gm-Message-State: AFqh2krrcFdSD/2jDdav+PPjQK3mu8a68lbmMLlzrJ+3ISDrvfWRZ1dK
 4+l/wJXUaUHi867fipgk1nM=
X-Google-Smtp-Source: AMrXdXs2ZIgjx4BwdrZ9OPUxEcwQhQL93aelpNu8ZOBPma6g87PHYtq+N1Mh0lqNtQZcwkk2DClGQQ==
X-Received: by 2002:a17:906:688f:b0:7ae:31a0:571c with SMTP id
 n15-20020a170906688f00b007ae31a0571cmr4818918ejr.57.1671719146475; 
 Thu, 22 Dec 2022 06:25:46 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 cq17-20020a056402221100b00477f0d89e8fsm432158edb.6.2022.12.22.06.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:25:46 -0800 (PST)
Message-ID: <78b4548e-dfe1-d0c6-f96c-5d40f28f8b2e@gmail.com>
Date: Thu, 22 Dec 2022 15:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 04/17] dt-bindings: display: bridge: snps, dw-mipi-dsi: fix
 clock properties
To: heiko@sntech.de
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Language: en-US
In-Reply-To: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix clock properties from the common snps,dw-mipi-dsi.yaml file,
as they don't match with what is used on the SoCs.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/bridge/snps,dw-mipi-dsi.yaml         | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
index 11fd68a70..0b51c64f1 100644
--- a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
@@ -26,19 +26,9 @@ properties:
   reg:
     maxItems: 1

-  clocks:
-    items:
-      - description: Module clock
-      - description: DSI bus clock for either AHB and APB
-      - description: Pixel clock for the DPI/RGB input
-    minItems: 2
-
-  clock-names:
-    items:
-      - const: ref
-      - const: pclk
-      - const: px_clk
-    minItems: 2
+  clocks: true
+
+  clock-names: true

   resets:
     maxItems: 1
--
2.20.1

