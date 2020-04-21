Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB3B1B1DDB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 07:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2464A6E878;
	Tue, 21 Apr 2020 05:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACE36E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:06:52 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id a5so119983pjh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 22:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eGfBKJpSi90UFqlpYNStz7DM33anWi17Ai2zGXaXMWc=;
 b=mdzRnubwKP7krAS40Ea2KN23CScPHBKO1SR+AS0E+/6i+r66UtFj7LxigBVGbaH03H
 6mOa4r/1UEkt+v0t8swjMLve4coTvqfK3oY1x5oYuCKpxeBZjJ45n/4QyONrWNhCCJr7
 mxx+wneohm5w3rXhblsvBowD0WFWXphhzMzEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eGfBKJpSi90UFqlpYNStz7DM33anWi17Ai2zGXaXMWc=;
 b=eqd83Yx2clMCqfphncIWF8Nq9p5d/nF/aGccNAxr1jXKlgUAKa8+blc1wh5p/jOBhA
 1IvUMALSeh3C5RXIl02uwBf56nj5YPlVxstDCb2dS5i/r3SZHOJpEfJ90pkJtrZ9mlvU
 9WKChIm4h2tMf+pooe3mspOvY5BOf1DyIZ6YrIYnsg3r8Eu8wi1F5v9c74hWAyVz34D1
 +OASoosyciWFztmOP0Z2pgwOscVlhO/72+LDeJPUDINDYm7IdKdCuInNVq5KtlnvXO2f
 BNUJ7HoXYHufZFEacm8ZFtsLwTrleQXalDBst4ZCVKXpNVYF/as4pEbkjKZDE/2zAfdh
 WHhg==
X-Gm-Message-State: AGi0PuZ9OnibbcRXDAP/UPFQqyJhbDYoU1oBCnCW/2pBMipc2DmXNupF
 gGiq/N3MTLGTVxs1LXHyLfcuYw==
X-Google-Smtp-Source: APiQypJQNPdkuPcpRjjTTAYI/poAyKTtArgQxmjjnmtRkUI/zZQTGT50tl4mj8Sv4sxDO7Poue+Axw==
X-Received: by 2002:a17:90a:dc01:: with SMTP id
 i1mr3278786pjv.94.1587445611989; 
 Mon, 20 Apr 2020 22:06:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id p68sm1184780pfb.89.2020.04.20.22.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 22:06:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v2 2/6] dt-bindings: display: Add hpd-gpios to panel-common
 bindings
Date: Mon, 20 Apr 2020 22:06:18 -0700
Message-Id: <20200420220458.v2.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421050622.8113-1-dianders@chromium.org>
References: <20200421050622.8113-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, linux-gpio@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, bjorn.andersson@linaro.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the cases where there is no connector in a system there's no great
place to put "hpd-gpios".  As per discussion [1] the best place to put
it is in the panel.  Add this to the device tree bindings.

[1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2

 .../devicetree/bindings/display/panel/panel-common.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index ed051ba12084..e9a04a3a4f5f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -96,6 +96,12 @@ properties:
       (hot plug detect) signal, but the signal isn't hooked up so we should
       hardcode the max delay from the panel spec when powering up the panel.
 
+  hpd-gpios:
+    maxItems: 1
+    description:
+      If Hot Plug Detect (HPD) is connected to a GPIO in the system rather
+      than a dedicated HPD pin the pin can be specified here.
+
   # Control I/Os
 
   # Many display panels can be controlled through pins driven by GPIOs. The nature
-- 
2.26.1.301.g55bc3eb7cb9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
