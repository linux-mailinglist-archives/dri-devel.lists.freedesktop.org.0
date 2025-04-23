Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03B8A985B7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 11:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2A810E427;
	Wed, 23 Apr 2025 09:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="oTQLFuLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395AE10E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 09:36:59 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b12b984e791so1733321a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 02:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745401019; x=1746005819; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+xSVSEjLLoJeTGf00+7NUDFSajI19htlW6OjqQ08dg=;
 b=oTQLFuLU08bs/TNrhDFggXnk7OPOFsZFJ+Nlo9EMAEf4vDyATewcTrGxpihR59pwOI
 MM4eFCslcJz0LHAdH6FgYHaFHRRltsHF/WANhC9YCOWar7GdhLgX5pkKvtm60TkScbjH
 YegO5iFfP1Ati352MZIh4UATrRaqX9/NrtG0zGW4G9R7EhY86FQ88Eu5H4xEHPPwjflV
 A9k6T4NlDpglCioUWxxv68OtNPYSu5evsCF9uVESPrpl6qFLr7yAmVxf2jWEjLabilhp
 ERtGvFY0/AgqzSW+tKLpg/g0JUhTk+8UkWMUIhmU7N2V6SZdmtQHx5qMn8rdgrFciBU9
 KQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745401019; x=1746005819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K+xSVSEjLLoJeTGf00+7NUDFSajI19htlW6OjqQ08dg=;
 b=KYv2QA6dMh+52IQ2eeAbKmPb23sTPk9nB7qEjpjmvucIjXWrFl+Yl3VJsvyKxb98Ef
 5e+FhUw1NFhCFvVka4DDSoBF+XJ2z1FRFrQ7lyjK/VWZ6TIfwSKnqyrIKJ0awVJTV/8Y
 EALQxwnaM5yeoZfknamXLQkwyJrok/5RRFtQORpxiq/45RxklKbqjpGxs9/7b5GKmcpn
 /liJatHI2ZRwM4jpx8FhM+5MQlUwHTt6KWW/f5UnhdjXEB50OUzZkPl6fz7ytLd+x1t4
 EmX72p77fKrgzEBgTqhmymQRo/43m6mGIF2F8kkDpimhG+tS8t9UpFZdeZOQupPRdwDP
 llKw==
X-Gm-Message-State: AOJu0YzHnXMMC6VwghP83XauMvxb1+NlRvAoolXIliN2WylFNSjWjtUG
 Jt3Iz9NheUcGcVVKRl2lXyA3mqc6hre5LN1GbwEttX1mGz8yaNmKiREuz2tc0Po=
X-Gm-Gg: ASbGncuwKhTda9ZSkp79ZNNhY+7gonuQROw6Zj2otpnUhIy3wuSEqcKPparUUSwcFvS
 S2f5WN4DSxWHQceHs0YWXYlZ0HJflfIojdLGCqrjvUU2QQEP2oVcPcm7hF2OpO75BncQU9BKGM3
 9NxaejN7vONcRUODhNjKQcmCdLxl+TIrs0WliLVxSbs5pIGVQ0v0/aGCi7mE/cibu+lHT7u7Iru
 VCKWL1P2QbYw1XlOu1fjShT/OtqSKUvQt5nCClv9hwACx7jiQ1Qw177lBbSXFRqQLVPgwKoeMTD
 V7uQVXH0UB4y3g+Pc1CzSICzIM74kWDmvkfJOM/VtXzQ4JZohiHMc1AoRsnrhQ6abpHSLBlu5Ys
 =
X-Google-Smtp-Source: AGHT+IH4Modu/E8d48v1FsMHRhmok4QGpGU7FQB895A2U+1zbGEhQvVtdj5vu+Io3DYOEd0DRLMUeg==
X-Received: by 2002:a17:90b:1f90:b0:2ee:45fd:34f2 with SMTP id
 98e67ed59e1d1-3087bb3c7eemr23304008a91.6.1745401018662; 
 Wed, 23 Apr 2025 02:36:58 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50ecec54sm99557885ad.168.2025.04.23.02.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 02:36:58 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v10 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Wed, 23 Apr 2025 17:36:46 +0800
Message-Id: <20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ponyta is a custom label Chromebook based on MT8186. It is a
self-developed project of Huaqin and has no fixed OEM.

Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v10:
- PATCH 1/2: Add enum for ponyta sku.
- Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/

Chage in V9:
- No change.

Changes in v8:
- PATCH 1/2: Remove custom label.
- Link to v7:https://lore.kernel.org/all/01020191ea98a643-2d0be5d1-e00b-48e0-b823-bfe2c65b0d00-000000@eu-west-1.amazonses.com/

Chage since V6:
- No change.

Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..bfa38e7fd0f7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -285,6 +285,19 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - enum:
+              - google,ponyta-sku0
+              - google,ponyta-sku1
+          - const: google,ponyta-sku0
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1

