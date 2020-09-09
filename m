Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E8263E9A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BE46E241;
	Thu, 10 Sep 2020 07:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A266EDA3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 09:28:33 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u4so2568194ljd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 02:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTyfCsTaDrOHACqOceFvOnNFS4vgFYT28JXZt0L83HA=;
 b=ycidf9eWNxxWUgW1fKGQNdPXYwseYW4xi4HSzwn/rr/KbgqHAgIu8ILcbUzrsMTVCQ
 kKNqefAx6mzw6drvw7f62Iit5oOpMdB5TX7h2HtmpYQrVPcxT3mzI3qGVWzxYR8laybB
 apdHFhBh+XSkwF0E5LBYwNd2nePpg0kjPoWJiisLoIEUIswTiXYbGKZAQT+NwONLQ2by
 pds1zmJ2CxCqTekV1IUZ88xrly7GjQ9JOTUEOjucl9YQk9s1JVZtgiJoKHjCSRe5jfSY
 uFE0puOvAzW0vcAe4/exK4YushaqIcMWNjEfe49f4MOihKHO9pnzeivteYvqsOA1fxfV
 U47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTyfCsTaDrOHACqOceFvOnNFS4vgFYT28JXZt0L83HA=;
 b=TSKx4/Q0P0OpfVjDLCz/0ahnRpFJRSWh+KVARtFn0kB+icJ+1rhsx476I9z58xdNvc
 gcmB7v19DJxHa9hlqy0jBgcgiBHmF1UgN1jAs+KRcPjUcujxBTN/hWqulZ0naQYyQK+s
 0AMG/kvhPnPgtVXjUhLgrFiDSAVThB+iUuXBX+mL6/qJwFb80YjOFMFAO2/KhEFoS+rP
 mlz+tr1QIe02ddttDApKVYIlSEjqjfgtFe0kib/Iy53JLAEB8FRA2x86Pg/qvsk581hW
 5NcXaLD1TANfwz0L9aS0fFT4SeZ7OnmSlV/G80qqcai3FENwtI4cuXXp5TB2ACRjETHp
 sVGw==
X-Gm-Message-State: AOAM530gOjUbYPBzFAGbaehKogFCh1n5PK96OmKRpLokaNONeZFr7cm4
 HAny27ZSnfcFGt8XwVn2MIiBSw==
X-Google-Smtp-Source: ABdhPJwmdxMqZFi68OkqjC4L+d0jC3/H/ejGfsllvbJVbXfrxbcqyw6U40F4PEkv1PpGabRW8RVwjw==
X-Received: by 2002:a2e:8907:: with SMTP id d7mr1419781lji.206.1599643711528; 
 Wed, 09 Sep 2020 02:28:31 -0700 (PDT)
Received: from eriador.lan ([188.162.64.180])
 by smtp.gmail.com with ESMTPSA id s8sm595870ljo.11.2020.09.09.02.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 02:28:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: Add documentation for
 LT9611UXC
Date: Wed,  9 Sep 2020 12:28:22 +0300
Message-Id: <20200909092823.64810-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
References: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
