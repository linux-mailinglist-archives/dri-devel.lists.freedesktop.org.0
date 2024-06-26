Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF119183D9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B179210E8D4;
	Wed, 26 Jun 2024 14:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VufVNKtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A53610E8D7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:22:33 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so86666701fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719411751; x=1720016551;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5oTyiTDE2zoIXFxITRpatG4bTgLxE9dmxO/uASRAFU=;
 b=VufVNKtUzZh8NZMDpqu8FScC0KvXb25NNuE0vTijlQN6Xf07x6ITqIqGxKbZkevwKu
 sGcGNyNa697cDL0F36Q8ay5tWyRCA7AwXEeE91CCQ7dbzT6UPlytmng9g/PjtlWaMyTF
 UVf02Lg+lMdgr/libDYw3FrkIEcBa+vJmQngZMZ2wUE/WLtFZ4S5jSTzLG2lmclY+VAa
 i4wdT0qyQxOKUKhND3A4X6woLXg9+CIzaBOA2uLvCy5JcgLFZDhTaSAegFOvXYoehyxr
 rNDsTwEwLju8NqW9acuZItRN969vTi5L2BA2D1tbS8W1NWYvIAQ1jVH9rpfwhbsUZfBz
 TJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719411751; x=1720016551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q5oTyiTDE2zoIXFxITRpatG4bTgLxE9dmxO/uASRAFU=;
 b=S4KPdLPuhqaSGFs+cupgYW6VW/WVSBZlItIBFiRepumZwt2a+32emnAYRh4A2q+JKA
 8xDpl/ZD2cYFQlWvALMPW9T8/jryPIYHmetPSPQYQxC5P2xigD9gKfO7HvcKigdBC5cn
 P+VhCrOFZB/qDwIMQzL4QsEJwV5aaP7S4mmIv4F2Y3wfzxPD7/A2mWke0CxLyc083N2B
 v88lLUwKLgfq2yktbefI+pQGNnFv0pWqKhEIgOGZYMJukspyNeOb/guW+KiGCzk026OJ
 XpM+lt410p0wq3b++j0d1DUli72RGW+BO6bOJZUp54hviXLhN+02H4oIEyczf40xMkmp
 UF5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkjwhqIDzkhpN+xXLw+xtzDlKxTuC7Zp9rNN4rVy/tF28rYI/aZp/3AD+dcIQhVnanAajUQSLTs52nS8mdcgaJtNW8yQCSQX+VRP3+IyS7
X-Gm-Message-State: AOJu0Yw0Y5lhigRsvDI5QazD+HNnmNrOdCWPpBXB6emU28p3QxnhXyZg
 CyDOpoBPCdqWyH7ZvNt7ZZJnTqUuw7hB9Ti8J/zY5/j6J5RgutE4hZukBG3pDqE=
X-Google-Smtp-Source: AGHT+IGYquuMgMSS+n+tk71AQ/4ysAbKByUybNfZEzAp4mLOcPd1ahbXpUz6gx3baLFJyiijvhFKpg==
X-Received: by 2002:a05:6512:402a:b0:52c:e184:3dd6 with SMTP id
 2adb3069b0e04-52ce1843fe7mr9156435e87.0.1719411751338; 
 Wed, 26 Jun 2024 07:22:31 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7be7:aef1:af9e:fff6])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-424c823c28asm27141105e9.5.2024.06.26.07.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 07:22:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: panel-simple-dsi: add lincoln LCD197
 panel bindings
Date: Wed, 26 Jun 2024 16:22:07 +0200
Message-ID: <20240626142212.1341556-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626142212.1341556-1-jbrunet@baylibre.com>
References: <20240626142212.1341556-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

This adds the bindings for the 1080x1920 Lincoln LCD197 DSI panel to
panel-simple-dsi.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index db5acd2807ed..9b92a05791cc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -46,6 +46,8 @@ properties:
       - lg,ld070wx3-sl01
         # LG Corporation 5" HD TFT LCD panel
       - lg,lh500wx1-sd03
+        # Lincoln LCD197 5" 1080x1920 LCD panel
+      - lincolntech,lcd197
         # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
       - osddisplays,osd101t2587-53ts
         # Panasonic 10" WUXGA TFT LCD panel
-- 
2.43.0

