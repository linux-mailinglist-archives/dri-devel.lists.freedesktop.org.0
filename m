Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F97F256661
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCD06EC1D;
	Sat, 29 Aug 2020 09:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117226E4CB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 15:49:17 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t23so1840627ljc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 08:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzO/u82bhYkbGzYXqTgJ4HBSdRoIsJl4r3uZiLJLve4=;
 b=ObOhJQlcC2wrUZvz/Sa5WdH6CBtF1FirWagTSTjFA478ShCAfENPUBhWqBwSJsc7ph
 IBfCh4/UZVho2Zy0Z3a1Ww1HT3KpaWJU3MEY4WqznZRbdzfWbICAeWy+KNWiHrRHPx1l
 YBjp6QEYudGlvTQA9AibpmhCWGp4MqDic+eza712jiI5N1uvoL7ailsyn3MzRDNP7M8i
 SqxIJmTrT2GFx/o612QaG180NBIlYD9O1g7C/5+1gOwkIFi12ZHsYnmPQRB3aMHbEYcf
 MoGwDAmqwtpRS0kMdgka8hW2RReAgMVkokjZH3spi6HxzxoQPdQHJd+Nqgeg7dvyQhQw
 TEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RzO/u82bhYkbGzYXqTgJ4HBSdRoIsJl4r3uZiLJLve4=;
 b=SjIhbtcHnWOmcPr7UoQBoXrFLJFaGIoL/NGOjcULB0bWoExgKwok2wbM/FNytH+BgC
 MTHW7SRpO1Vg5vxa2rSkG61KG6+18V7LePK3+ek6QYZgUs/u88adaTBn3VCk9zKZ2xbz
 fhtxG5h+Js6eAO3cQuqBTDsVDjZH+fQFYfSBlejvlL/lFNSkxtDGcgbGr+EBWtN3QHxe
 GWuRSDKZrBNS+yvlYIDV9I58XWnTVTpCHTSneVSf0L7Ayh2Uzvnz1QZaferI0bbfV4G+
 bL4Ox5hjnfl0XfZlRW8QuGq3wASiDQkBviYSBd2mv9OvQ7TGEOWPaUL5X2oaKTwq5FQk
 lU8Q==
X-Gm-Message-State: AOAM531RxdtKHcJ8/sp8umyrTQeZ8CMZwTUXhwGbXv7CRaQ1tl5m7898
 sBZ9EA8JagokwfgaGxQlPKDq/Q==
X-Google-Smtp-Source: ABdhPJxzFZT3xAeu/O5lodHhBa/sAIGF7iAxnNo9eQnh4WtgUBokeiPOTTMFNBe7D17Jmxr/83YieA==
X-Received: by 2002:a2e:910d:: with SMTP id m13mr1266060ljg.240.1598629755378; 
 Fri, 28 Aug 2020 08:49:15 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
 by smtp.gmail.com with ESMTPSA id r16sm270215ljd.71.2020.08.28.08.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 08:49:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] dt-bindings: display: bridge: Add documentation for
 LT9611UXC
Date: Fri, 28 Aug 2020 18:49:04 +0300
Message-Id: <20200828154906.1662611-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
References: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lontium LT9611UXC is a DSI to HDMI bridge which supports 2 DSI ports
and I2S port as input and one HDMI port as output. The LT9611UXC chip is
handled by a separate driver, but the bindings used are fully compatible
with the LT9611 chip, so let's reuse the lt9611.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/display/bridge/lontium,lt9611.yaml   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index d60208359234..7a1c89b995e2 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9611 2 Port MIPI to HDMI Bridge
+title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
 
 maintainers:
   - Vinod Koul <vkoul@kernel.org>
 
 description: |
-  The LT9611 is a bridge device which converts DSI to HDMI
+  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
 
 properties:
   compatible:
     enum:
       - lontium,lt9611
+      - lontium,lt9611uxc
 
   reg:
     maxItems: 1
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
