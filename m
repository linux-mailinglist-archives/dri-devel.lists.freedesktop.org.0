Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462631C9D5C
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 23:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6616EA6C;
	Thu,  7 May 2020 21:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD306EA6B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 21:35:29 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 18so3646026pfv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 14:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XfNEDCRiXjCC8oOylpb9JNhfA9+c9hrQufk7O01EutI=;
 b=JEPOGcmwFBfW5QCKms1+maouE+hSH796fyxNeSs6NafNDFXUhutuNYMqtyu+Cz4ftE
 smDDleCiYarIBTBNcvs9qhyaX4KxL7re6xdgs706c6CBvnOPokM8Q5Hjxqfd+u70iMzN
 L4Nfj73BfoYxzl3kVdWZnth1x62n3HdcVf5uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XfNEDCRiXjCC8oOylpb9JNhfA9+c9hrQufk7O01EutI=;
 b=aeXQNZi/olpmy1rNl7JhuTzviFMz9IChEP9f8VOPsDCRoSqKpyjS33GiPuegb1N4nf
 rkMxaPuKWQlBrYpiXUWJdrY/MvYmcj+R2sjVciNrNkGujJMMFevyvzI34V/Edym/Z3Op
 fbtssOyUOWtROC81++d1sJ/k2+wp8AFAWVyRkys8lFTAsqdeMdQN4Y1bUZ1gcJ9kuzCg
 +PfHF8BsrZkwIbffwnbxHY9zG2xRzQ3w4YaeSPG7WI/hEQfBr1M0NcLtiethkcB2X2tx
 gb3RL3pWU+gJ9WUTo2lP862fwZPCmUz2FGTvFmfnqDUPBp9pS45VePL1XWQHli8MKun1
 KusA==
X-Gm-Message-State: AGi0PuZXfHfRXqYaftdjNjhMCxNHmj4W5AgYLt4yrq+8fR6kAxicgcJn
 X6F0EWPJYU4BL0256/FvDBIMZQ==
X-Google-Smtp-Source: APiQypIN4LGb4WwjVAsqDkdk6/Lm8XZyQnvUfoNsrt2XHG4HD0F4xJ4m0Ae8nle3ctmT2+GxbHwNUA==
X-Received: by 2002:a63:741e:: with SMTP id p30mr13075429pgc.433.1588887329409; 
 Thu, 07 May 2020 14:35:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i10sm5884860pfa.166.2020.05.07.14.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 14:35:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v5 2/6] dt-bindings: display: Add hpd-gpios to panel-common
 bindings
Date: Thu,  7 May 2020 14:34:56 -0700
Message-Id: <20200507143354.v5.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507213500.241695-1-dianders@chromium.org>
References: <20200507213500.241695-1-dianders@chromium.org>
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
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 bjorn.andersson@linaro.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v5: None
Changes in v4: None
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
2.26.2.645.ge9eca65c58-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
