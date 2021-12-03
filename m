Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F7467A7D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4366EE1A;
	Fri,  3 Dec 2021 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EFA6EE1A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 15:43:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso5179715wmr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 07:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFb5QjcjkkvOWqOmEGkrbQXfQxx1NzWXe9zva7YzoKg=;
 b=UFBq+mbwH5xajiKeeTuUMTrYFQuelJMKLfetPhEeNM1Ekdx7RqvGyt6pHsqD/vnjkm
 QzyulTtrf4tWMB1Sf3OSDCBhPB7ptS06OISrmv2EQHVFNi5CH/OckSu7eX6ri3if1LEG
 qFfHv0/l0t0Z6AhPrntJFOwjTNKaLoFARIVtLhl17EqCJcV3p+Vd+VVNp7xqniXoltlo
 VEsnad7IsWhiFhWfaGADF+PiVaC8rGp5XFrK1Gzr+cujk7e3NyGwEwjghgHZVOj3TMYD
 Wx/MzwTvD3T4AY9PeIthiNoSnOLwxMgMFXU1eKpDlJVLneaZUHLK0u10Bd8L8Eyk+PfC
 1tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFb5QjcjkkvOWqOmEGkrbQXfQxx1NzWXe9zva7YzoKg=;
 b=jT/penNj+eBlyfPgY5TsXb/wNRJTxtRFuY1MH4jxo53JMR8Q0EsNiLIegvcp5etj4c
 fuzvTvpe7t9838F0pzYl1+0TCrgxezVWpMPJeeVjTC2dykEF/AhFyzF8bZ6sGlU/khLh
 c1HcWU2UyP0JKvxz55TkbzJTO1YYiKZwPpxIxQtcQ/lC4xN4CjjFi8Z9e62mLea0BYcI
 2T92/z0CLRlxsGbqOR1QpJNez4XiN/gr7jtNRWzBNC/b/+hSMRKrU0b7G818jyyLpHsD
 IxK9sYekD4wU0wSXfsBPri3LYnOSjZlhaohtBit08Yx1WXfoX+7wBbFhhXTTVBW9WtpL
 brcQ==
X-Gm-Message-State: AOAM530p1X+RfgcGDT9U+WPPx4+aCOcut8MIiQ6S2pjl4EiwaJ37Pd3S
 sLuh4FYBVa7kX5VQsXTrTGQ=
X-Google-Smtp-Source: ABdhPJz8oyzdiJ1afHc29W42NqaYCJVvTXmq1L8sBKkQt1BuT6MeDPgPJs2EJZ2qjEEGLknLm+4E/g==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr15647700wmq.70.1638546235721; 
 Fri, 03 Dec 2021 07:43:55 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id h18sm3367289wre.46.2021.12.03.07.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 07:43:54 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] dt-bindings: panel: Include SPI peripheral properties
Date: Fri,  3 Dec 2021 16:43:50 +0100
Message-Id: <20211203154350.179112-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

SPI panels need to reference the SPI peripheral properties so that they
can be properly validated.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/panel/lgphilips,lb035q02.yaml    | 1 +
 .../devicetree/bindings/display/panel/sony,acx565akm.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
index 830e335ddb53..240a884b7fa7 100644
--- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
@@ -14,6 +14,7 @@ maintainers:
   - Tomi Valkeinen <tomi.valkeinen@ti.com>
 
 allOf:
+  - $ref: ../../spi/spi-peripheral-props.yaml
   - $ref: panel-common.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
index 95d053c548ab..4459d746592f 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
@@ -14,6 +14,7 @@ maintainers:
   - Tomi Valkeinen <tomi.valkeinen@ti.com>
 
 allOf:
+  - $ref: ../../spi/spi-peripheral-props.yaml
   - $ref: panel-common.yaml#
 
 properties:
-- 
2.33.1

