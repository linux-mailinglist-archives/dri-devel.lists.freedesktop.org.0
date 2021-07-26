Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A93D65D6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 19:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E68B6E85C;
	Mon, 26 Jul 2021 17:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DDF6E85C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 17:34:49 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 l12-20020a4a94cc0000b02902618ad2ea55so2429787ooi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOyJ8Rc1+7t0YsnzVklU5b9F37l3+jW4OcgT5rziuFU=;
 b=fAZlxhQdyRp5zRb1mi25f/B4kL5ZXX0mCPnFX4I0238WwihNK21ztCUO6TrexvvPiv
 2Er0F4JfnIP/P/GHgqmWn6aY2p8ImlWACu77OPYMAWk8CieAem+/B/iCMMuo5ITOPjin
 wvRJO1ER91VkDbE7rjs4gbOdz1ZJxqor+khnQ+BjxYBHShEokP840+yIEdRXIdbKtKtl
 70EXAr2LOoomFXw7miMn+qgh4/rJiukxnfFuRkVATGWGGNqXjSAc+mQrZY+DlCAsnPwL
 7V2bpD0b3uLRIn4Z4QyPaMrKQly0Mdd/oGU7fmaYbyMpLHLaEEFPd+Wx2ORAqfL7vnW/
 KKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOyJ8Rc1+7t0YsnzVklU5b9F37l3+jW4OcgT5rziuFU=;
 b=RJIYaodpaYB2VsUUSdzQcCKrigjQmK+1qi29EPVs39X+4rawRAQ1njvfG79NrZ5/QZ
 gtkpISq3DA/fLC2xt+xMZ30cveh6fxsHq2C/cBP/jQP920dHwi91AsIziKDWZUJWEBvj
 9XNnjXo56ciRek3uOFCmWZrTV93ALtfMTo6ueNWrHfadw4C/Srlg8EohCN1fzdexxyGT
 C1eGCHUQ9jDQaRuGI4lzPslWF90QzHvdHKOG7fUwMQS2+mrw1nz0cTPgJ+dq7q9OUM6R
 erEKtVaVbH8/m3E6BCA85kWEQZAwlINu+MeBWkjp7nuET9WyRTRgl4m/nt8096/NAb5j
 I1oQ==
X-Gm-Message-State: AOAM530VjiUL4XX/de4eyKF6R2NFMKHZ8XMBK2Me5IgB8N68pmjZAftT
 lPz4V3BvHc7aP9VgnKhtNYOQPA==
X-Google-Smtp-Source: ABdhPJzj9GSyzOgaXvC/6u+xBmxl/5r2hXaqVyqoa7pDzveUYNhuECB19AieW7EB2CyiizlnCMCAiw==
X-Received: by 2002:a4a:b98c:: with SMTP id e12mr11209038oop.67.1627320889238; 
 Mon, 26 Jul 2021 10:34:49 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id s24sm69328ooq.37.2021.07.26.10.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 10:34:48 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: display: simple: Add AUO B133HAN05 &
 B140HAN06
Date: Mon, 26 Jul 2021 10:32:59 -0700
Message-Id: <20210726173300.432039-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the two AUO panels B133HAN05 and B140HAN06, both
1920x1080 panels with 16.7M colors, first being 13.3" and the latter
14.0".

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index b3797ba2698b..7f624cb1199a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -46,9 +46,13 @@ properties:
         # AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
       - auo,b116xw03
         # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
+      - auo,b133han05
+        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
       - auo,b133htn01
         # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
       - auo,b133xtn01
+        # AU Optronics Corporation 14.0" FHD (1920x1080) color TFT-LCD panel
+      - auo,b140han06
         # AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
       - auo,g070vvn01
         # AU Optronics Corporation 10.1" (1280x800) color TFT LCD panel
-- 
2.29.2

