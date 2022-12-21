Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99671653618
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 19:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E0810E14D;
	Wed, 21 Dec 2022 18:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DF910E14D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 18:22:24 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id kw15so38741048ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W4nOKqhNPXfITegWM0HPaQGxnW8/92aWSrG5eL1mdYs=;
 b=WS7DOe9L1ApSdC1ztqO0WTPbyxOZiwOS3jhJaizn9q35gbYYipyGyQaN3Xjwbqa6gX
 gLxxRvYXGffVsfpTSZ47mY8bjzVvO4IL42t25g9Tb7l+/TSu9qystwjIf/PIY2nwAGuA
 i4bFKkjZts8Jeq3K0amomR8Z/wtRX+iwEoR5/70rsGd4UirlBH3cTD/QddhkrydF4qdb
 uMS6tOZTYm4GNfO3JE4myOYafJX/mYvpR2NchMnV/yUdsgyopxkwCyI20lj6/xWWC6l/
 RpL9jGxQWojGjB4b1FiZLxlR6weI4J+w2SPmL/NR4aJ6ml8mTDGLwJxieSi2SLpAX1fC
 OmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W4nOKqhNPXfITegWM0HPaQGxnW8/92aWSrG5eL1mdYs=;
 b=QutFwehLKS4iQAjiJ/vuXDuYMJZgltuOF8Pp3AC4/bwb/QKCEQV2HST8YKb3VMH4P4
 NnLNZ1WUe9yAEIpntOcU49XJGgFUAOGIYuyTEcVG8H0WEpdKL2FqJX1vWwfZcNoVNqMo
 BHOMgUuKHd85C7t9Yv8C0Hg8GtR/G6z4H1LuOwRzd8YPdr+ZeYIEIjPPX8NsX7hmcVQq
 tu63rufnrLpQvqoMT9b4ssda6v3n+xMw+ShcvRXeXpyrnISAGC6pVjRZLK/l0g5n4kbD
 F4USoaK/hX+pzz4/EUTH0hpBwU5+naw155f6SO8o9oxalBABzg+AkHKCGEIP7jBSRj52
 Te0g==
X-Gm-Message-State: AFqh2kpBCHupEUtYUYjPs4+Uww+4iVGJhlc90UT+yyiuMFKpCPU6kqrJ
 uMXAdzoP8ueeFDzWadco6O0=
X-Google-Smtp-Source: AMrXdXuMRe3FeX5W6S5TKc7LVJDAVywrUoyC2qybAwz+q/HlkbXkjDrO0bxeEuUsOC6ZkOqLRGjNXg==
X-Received: by 2002:a17:906:d052:b0:7be:e26a:6104 with SMTP id
 bo18-20020a170906d05200b007bee26a6104mr2006728ejb.52.1671646942588; 
 Wed, 21 Dec 2022 10:22:22 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 kv20-20020a17090778d400b0082535e2da13sm4302105ejc.6.2022.12.21.10.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:22:22 -0800 (PST)
Message-ID: <899d3a39-19bf-519d-a863-bd7ca1e7c033@gmail.com>
Date: Wed, 21 Dec 2022 19:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 03/12] dt-bindings: display: bridge: snps, dw-mipi-dsi: fix
 clock properties
To: heiko@sntech.de
References: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
Content-Language: en-US
In-Reply-To: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, hjc@rock-chips.com, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 andrzej.hajda@intel.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 devicetree@vger.kernel.org, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix clock properties from the common snps,dw-mipi-dsi.yaml file,
as they don't match with what is used on the SoCs.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
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

