Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E799256650
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AAD6EBF6;
	Sat, 29 Aug 2020 09:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD8F6E48C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 12:04:50 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c15so581835lfi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnJkpVlnhMxAh71Cjf8d2Unww6T02tO0K+kvU2U1wWY=;
 b=mede1u5UxI1HNiOfFL/BVB94+AYOMFwIOI6fO1xrbxyc/qa0Ayjul1tQ8xjVz2MaGa
 ig0b+3CfVUtV6tVUDb5joNAknIIqHarNZKkXfY6GZvp46E4zb7k+m3MBKLV4mcmld5+I
 HuoF2YTTBt26TMiHqcJl9Iq/DTOwMNjQz70cHXxhxoz0DAsu7BJK81VnytmUSSlqajaQ
 8J68I/LOi/+r2tnjTr2pUzBVDZXPECkKF0pJGw+VVlO6pXWTrgl861ng72jcn5tgnBXP
 Q1+vG8GkCUJvhgk6vzMA1NVL86ofA2eU+7BJqCJBnCDI1iLWRmdqZEqG4QUcOLIWhHTv
 IW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jnJkpVlnhMxAh71Cjf8d2Unww6T02tO0K+kvU2U1wWY=;
 b=TWj/c8RadbqTcDppA7UvPaLUcyyja2Mml5P45kC5hWsKxcZjPs4akyH/mNEEWbN/dO
 nGS7Zb2Bx0o4LH1mn0eJKR7ES/QZf1HDJ/xYy32Y3VvApKBjyvf9D9vhAewKMl9bmdGN
 EWw27jg2B14o6RZkgjkB4mnrmC7fE9n8Y2I7hvyE4la2W8k2VlSfvJOB90hbv2P/N8km
 cnLZNndD8XDRru70dFxBOFzj15fKgptq7U3i3b/4Z13dt6LlMJuboIGggWqkBHb2sqO7
 b/eGfnSteKScOBjtWMQm0TdKNh7iHwyQ7e3nuIixambztI3dhrJMVSm8VPLLUucmN7Nv
 XLig==
X-Gm-Message-State: AOAM533LJfGNadhV9lljZkAq3WIsyyR1d5mD3EGLtf/lQXab4hQMGnfV
 WjmahsvBQPK5cVkjhsRCwf1/zw==
X-Google-Smtp-Source: ABdhPJwIKC38BfPDipaxUw6YQZ6nAyVWAtvuVrVRdbMqEL8Nj5f2g3NlCtb3AHylHCEaJUHyePNqwA==
X-Received: by 2002:a19:c189:: with SMTP id r131mr644898lff.186.1598616288851; 
 Fri, 28 Aug 2020 05:04:48 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
 by smtp.gmail.com with ESMTPSA id c4sm163340ljk.70.2020.08.28.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 05:04:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/2] dt-bindings: display: bridge: Add documentation for
 LT9611UXC
Date: Fri, 28 Aug 2020 15:04:30 +0300
Message-Id: <20200828120431.1636402-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lontium LT9611UXC is a DSI to HDMI bridge which supports 2 DSI ports
and I2S port as input and one HDMI port as output. The LT9611UXC chip is
handled by a separate driver, but the bindings used are fully compatible
with the LT9611 chip, so let's reuse the lt9611.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
