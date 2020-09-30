Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7B27FB40
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BFF6E859;
	Thu,  1 Oct 2020 08:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE96E6E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 22:40:16 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id u25so3488626otq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 15:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y1w+MKbf5xKkMTSCbjMZtxGQzOFrk3MRoVomMxqemDQ=;
 b=mfhnP7rY3Cqvb7FdLurV8Judix8H0TrQ+qLke0CGeNDvGpSr9Nm8xNpXD5DKy5NfVG
 wprQt/8sLiORDd0XUza4IKkwlJqsQwZBkHdLQ3YSzUKlUc8y4F17BKmiKeP/FAI6/OvE
 0JTt7vMqSRXIrBxPAD55IEK+zERvqnFySEBS/+jyK91el91dtx263kzJAonx+IfB/UKN
 ZPvmfZgxbvxpNCZLJjX9QlNiEvrjdZEQChxAiGr2xEKcNj6u+tQlgXHzuR870U3mb/Wf
 Lt7sQ60cAohM6aZEN37x7zlKFC1EBI+dImg2hF7XXznxC5iR8x+RkzjGeyzUkb7ORPf1
 9QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y1w+MKbf5xKkMTSCbjMZtxGQzOFrk3MRoVomMxqemDQ=;
 b=IvIbV3112Qm5HeyYdGgcg5+rYouFbX3+egUrLjghkWXSLD9HZW8nMh7pIR7qLt7Gj2
 jnR+zb5+Seg2dUUBJEucli5bOpFG8/exljr44fXPo5u1n8KvEzz+1JV6Ayi4sMCMgt9x
 KqmF46Ogu7OdLvCDcFZkA4RlcK7qQ7J+ZiQKCKTDrjPMCalRjurF4r24jTDwQbXqhrMp
 oEZVSoSt+CqbgT4HwS6c36iKzpmE3VExtuRMdnP8YCBfqxK50hrh+gQQ7EnE4kTz/tTH
 kWH8aKHdvDUDmnEVfzTlMkpkQobegYTjZhAD4fgfDlSPERpVB/hjITTkdSvXGCLyTb0v
 reuA==
X-Gm-Message-State: AOAM532A4+C+XgevmbZNn3oRa7g/RKC65gzlu93SghY7rSEluAvysy1o
 yqiOSRimaeCiKtrNbxFMmvAgZA==
X-Google-Smtp-Source: ABdhPJyS4plT+kSdTLIEL/+JsM+p99cBBaXa6h7EWWFDUgIsPbm72YXl0zSvjttynHIL88oTS4LBVg==
X-Received: by 2002:a05:6830:1e39:: with SMTP id
 t25mr2967510otr.8.1601505615931; 
 Wed, 30 Sep 2020 15:40:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p8sm781364oot.29.2020.09.30.15.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 15:40:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi86: Replace #pwm-cells
Date: Wed, 30 Sep 2020 17:35:31 -0500
Message-Id: <20200930223532.77755-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930223532.77755-1-bjorn.andersson@linaro.org>
References: <20200930223532.77755-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the signal on GPIO4 to drive the backlight controller indeed is
pulse width modulated its purpose is specifically to control the
brightness of a backlight.

Drop the #pwm-cells and instead expose a new property to configure the
granularity of the backlight PWM signal.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index f8622bd0f61e..e380218b4646 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -66,9 +66,12 @@ properties:
       1-based to match the datasheet.  See ../../gpio/gpio.txt for more
       information.
 
-  '#pwm-cells':
-    const: 1
-    description: See ../../pwm/pwm.yaml for description of the cell formats.
+  ti,backlight-scale:
+    description:
+      The granularity of brightness for the PWM signal provided on GPIO4, if
+      this property is specified.
+    minimum: 0
+    maximum: 65535
 
   ports:
     type: object
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
