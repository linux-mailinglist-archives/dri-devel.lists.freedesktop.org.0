Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA141B60C9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 18:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472876E951;
	Thu, 23 Apr 2020 16:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBEB6E951
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 16:26:14 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id o185so3146771pgo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t+az60ThGdIE96zHd3j4C+YFzxV2ee2icRXc48MtdSg=;
 b=e12bR+ZpXLVjEEpan9cAEWHV4kDr8Z7MZkqcd7f2suEPYFg8jvkfNyq70AOvFiT7wa
 4R/XyzA6cL0T1vpLIg314Ii0SKalB98Q4CK9r4ofREWXmfxZDtzOTMdjCYn1ytmbKmiX
 ZkpDOzjkjb2l8hrkAs+QCG1FNUaXWUvOjEhEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t+az60ThGdIE96zHd3j4C+YFzxV2ee2icRXc48MtdSg=;
 b=BllRaOxJPiNi11mG4xclBsPBlNOj3pCfmdyic/kjGO5AtmAdetvC/6+STUT9ZumvGY
 jB2g6pbouNM9XmoiDvdK2DoKHCBQjtRwblQZTSsqh8c3kAsRUgqwq2ifYruliyZxn5Eb
 4X7DvouJP5FX4o8x1K0bwk5KHSayW6prc7DARSGNUEAkr8ddCcCmBY+U/UpEEz++azAO
 +5Qw8X9cun9SruOldDqywZZi3sUf/WRUlQ6w6H4cBkC+frZHf7rKcFYgy/B26d77INry
 sr4e1I7WAKvphRGJ6IU0g/0rMuToen79w3pik/bnd6vBhVjKl8x/pnaUFCuYDOIHQwyH
 FQNA==
X-Gm-Message-State: AGi0PuZPhtEhR17w0z8jmM4re6Nk+Sg/czDjQust0ZT+wZKjmhHD2Lfl
 zzGuKs1EDLcvcv/+GT3LNuvj+A==
X-Google-Smtp-Source: APiQypKjcxU1Aq1NSUI9ytZOpl3JXA96PEo792irFM8Rg9bStYDnDS9zclolWyNi4CYW+A0kSTRQDw==
X-Received: by 2002:aa7:9709:: with SMTP id a9mr4779536pfg.166.1587659173796; 
 Thu, 23 Apr 2020 09:26:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d12sm2841927pfq.36.2020.04.23.09.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 09:26:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v3 2/6] dt-bindings: display: Add hpd-gpios to panel-common
 bindings
Date: Thu, 23 Apr 2020 09:25:44 -0700
Message-Id: <20200423092431.v3.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200423162548.129661-1-dianders@chromium.org>
References: <20200423162548.129661-1-dianders@chromium.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v3: None
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
