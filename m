Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA4D1C06BB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 21:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFAA6E94E;
	Thu, 30 Apr 2020 19:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36006E94E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 19:46:29 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id f8so2694358plt.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 12:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69Vg9U3gBVUlkizCg48EDMT0ufV71AxAgwY37Mxv9RI=;
 b=Z+bKIp4ValF2xpimna9+2Wvkg/u4DEsTSNrLlwT6aivVRbhKKdgzGabovsdyTlg/69
 NmTZI1zkc/MfM85OdYnHp+oJxY9qD1946qXdgtwPHVuo9zs/v6RSG3B9Lux6QsKAsRh3
 8nQIkhHi7qaoCP6AUaiPJNszq2B3CrY2EfYVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69Vg9U3gBVUlkizCg48EDMT0ufV71AxAgwY37Mxv9RI=;
 b=IGEwwBU26itEcZuIix2HnVQO+fd4/yISZ8SyvaPZ6UrZ289C/W9IPOhSqvi+pUEYqW
 1NNB+oMjakWOGioUM8XzHQumoDEZ/7rNV/9BrXCIyHQyf2QKJylk7Jfv6TeRoK707Cbz
 SFMl/WgSfkdP/lDuDLPkiotOph0k+QGXLYumJ95pGvJmx7yhFaSWUR5GGPUVofJq0ix5
 GoOSWV5QaHYWDMlf646Jt2bNbH34gC9NJ5hwETQv7WmFnHdsb+xfBfL3VHo3MRxRPN1c
 V/4c713frHd1GpX7J4JrrJrXwEpRpYbnggLPAUrWhLUcEXVYScl18tF8gEG6x9q5LgSV
 dS3g==
X-Gm-Message-State: AGi0PuYozvLAhxwNodmWgXHOndu5LrlD+CfNx2azI0z0V3bKTmSc1/Vw
 /g8EWSPhhy/iYYZ1DFjfXVRnHQ==
X-Google-Smtp-Source: APiQypLMm8BMm2i3v9zIi6LLFN1yz2hNg4Ay0PXQeF0bd8feavJN2Yy5iy7PQdAFV+JeZvO0jSoW7g==
X-Received: by 2002:a17:90a:cb0b:: with SMTP id
 z11mr500642pjt.62.1588275989203; 
 Thu, 30 Apr 2020 12:46:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id u3sm495993pfb.105.2020.04.30.12.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:46:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v4 2/6] dt-bindings: display: Add hpd-gpios to panel-common
 bindings
Date: Thu, 30 Apr 2020 12:46:13 -0700
Message-Id: <20200430124442.v4.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200430194617.197510-1-dianders@chromium.org>
References: <20200430194617.197510-1-dianders@chromium.org>
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
 bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, swboyd@chromium.org,
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

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
2.26.2.526.g744177e7f7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
