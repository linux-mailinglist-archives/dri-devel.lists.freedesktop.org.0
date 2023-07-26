Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 529B9763EE5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 20:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2537610E053;
	Wed, 26 Jul 2023 18:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165D710E053
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 18:49:03 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99bcc0adab4so3609266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690397341; x=1691002141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/oLV7w7SIF+Bv+zH3Qb2ls3MvE0jKohS7No6ukAqg6A=;
 b=AbH/YwBF91CiamzcW+WTjw3r6jdIk6nPsizJ/9atOPv2rQ17BuN2k+KO2mSAgVAdQB
 xR8RF+BPH6J/DhSHO6pm5OtQLuh9qqVkd1LuQ/PaSamwKLMtfRe0rJqkLe7Lw3qFR8ry
 sIhGfUvwL80Zj0ZahuTBRSTlh9zIbH1QoQQ6vx3oWKtiTYKt8qNy3OvtBvHdWTRG8bC9
 W/1e8MfHZxwnE51JMOaXoGkVu2Pu3tF3M3EU9JfB/g7ER1Mr5LKw9Ld4Fbe+m7JkaCC2
 9NyYc64+I5SgeRRYM5/D4aYVvdsYlLzU6gJQwObM8wB6UUyyiTSuKD2AtTDFmdLtUQxi
 Ap9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690397341; x=1691002141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/oLV7w7SIF+Bv+zH3Qb2ls3MvE0jKohS7No6ukAqg6A=;
 b=DVOla/o/Wz94eNz759gDnShC5g8Ppw1To6+Ap2NaLLyemeRg5EfOFcaq4B74+KCKWe
 PVGsfZc+GCoRXGGq1eev15yUVs3hlneHanPPMKuMhNyjmVLJIgcjt3YxqcTh9z21ar7v
 6AM8+6elXuvDFhXGyrf1CFnCymrXzFzEpZExAeiFsxkPk97Erfkq8dEJ4dHQv29AC2uI
 T5X/I/URuin0bdCcULdtoQMvllgHDJDMSpY77unbqRdTISEB2+T4wdTtkKvE/Q9s/TQI
 L/J956jLr+LvpbhdHK6aLBSI73y07h5pWlsD/hbG+GhJBgWPyAkcwPkbNOXYDpP06qZQ
 tCGg==
X-Gm-Message-State: ABy/qLaeUOk4oRKXitRlPpuA/MwbR5IpIjBpXuPOwXuFl8NdgyqsaG8J
 8b56+Pu/WYN6C1dAtLrd3G8=
X-Google-Smtp-Source: APBJJlGvUn5xoPOVC5T6TZHAsC/4CEhjmryknm7tSeNAaIc94kXuXSDB5odtY3hKreXXYe1hxCJnZw==
X-Received: by 2002:a17:906:84:b0:994:539d:f97f with SMTP id
 4-20020a170906008400b00994539df97fmr36098ejc.37.1690397341172; 
 Wed, 26 Jul 2023 11:49:01 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a170906849a00b00982a352f078sm9734357ejx.124.2023.07.26.11.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 11:49:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/3] dt-bindings: display: panel: Move HannStar HSD101PWW2 to
 LVDS
Date: Wed, 26 Jul 2023 20:48:55 +0200
Message-ID: <20230726184857.2294570-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The HannStar HSD101PWW2 is an LVDS panel, so move it to the correct
bindings file.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 929fe046d1e7..344e5df40c2f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -40,6 +40,8 @@ properties:
     items:
       - enum:
           - auo,b101ew05
+          # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
+          - hannstar,hsd101pww2
           - tbs,a711-panel
 
       - const: panel-lvds
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index df1cec8fd21b..f4d9da4afefd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -168,8 +168,6 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
-        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
-      - hannstar,hsd101pww2
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-- 
2.41.0

