Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C616A916A3D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30CD10E679;
	Tue, 25 Jun 2024 14:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H9FL1lyK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B50110E673
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:26:20 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4248ea53493so18428835e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719325578; x=1719930378;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xAD3098J3EzQuO5AqXKA8113KZcxKdLVMyyReKa0K3o=;
 b=H9FL1lyKVJOfgiVogI0WpX1GZ99gb5GF6Qwe2zCoYVPcmPYYiqcQb9D4mPZMcfCcnh
 bXibcJDgTFNkj6jZpC2iYQ9BQu7o8sOmJZXpGHsGAM+iadEVirks2keCsQ6GBlMpB9cZ
 uWbPfNShOAYq+eCgazvmxlhkoUH1ctIX7PXFYvtogZjgH0rLyzbLHf7lmRqJ3D11x2an
 yFwPm3fAAWXDcYTS1x9Qr19i7vsNAPgYk0Vyg73q7TQH6qlBSVO0b4NVtKs3pKcInPqz
 NVHEWS17tHGQq+1UibKHD+JFMdn2vLiLMt5JujTj8X2cg0tVAoiXjV44GR/aPqWelggs
 53Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719325578; x=1719930378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xAD3098J3EzQuO5AqXKA8113KZcxKdLVMyyReKa0K3o=;
 b=n40CviOgGCgIN9BMWjQ8EIHTfUW7cD4cQOGmpgNo31CHpgLjrOMQCHd5K6Wd+sANpK
 kp1ycWcOOyiD3m/D4U8qqQ2YXlt8yLfX9qBLuuiKCliVvPBLdGLe0cX2ebrpat3SqrAo
 LzAUSV4tz0zSqDwph457Wk6Y7n1s1kQYYft7GUFeyp7Fglpf0uVNAjG7nXdEzJiotP16
 Xf9lZYB594WEGHmvAz9/gbsGWDvS5xOdbf0a8DKca5qcYiE6Hfcr0k2yy8xog63ac5IK
 hdFSsKfOw45bGXT6fB8dWpPF+c8MRUY3HynY9k5tXAzXEOJUWeAep4WCOFfiS/C2f2ok
 /zVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8pcPwublLOzxMayKBZIBsTMVNApLcDsSt3u1q66y+tbuvrydVWSW6iBDmCZoVdACw3x13AefDndTBdBa9rTz5SNeo+frO1mWcA7SrjzPQ
X-Gm-Message-State: AOJu0YzwN+4VdqK42f0hwcn7/PDCr72Mdn+XZz4mnX2de1h6E6NdYu26
 aNETR0EpnDn0Ij99XAwnMV085VOPDLiS08abUCNUfemW8i45I2BuV4khyxIv5vY=
X-Google-Smtp-Source: AGHT+IG1q4iSygl5TwD5tzeuhb2bcowzEjKMap1C16ElCtkJc9TyfhLNJ/t2ktFHMWB8CX1cWxHEjA==
X-Received: by 2002:a05:600c:1c1f:b0:424:8e3a:d02e with SMTP id
 5b1f17b1804b1-4248e3ad244mr57788745e9.3.1719325578527; 
 Tue, 25 Jun 2024 07:26:18 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4247d211881sm213770685e9.46.2024.06.25.07.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:26:18 -0700 (PDT)
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
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dt-bindings: panel-simple-dsi: add lincoln LCD197 panel
 bindings
Date: Tue, 25 Jun 2024 16:25:49 +0200
Message-ID: <20240625142552.1000988-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625142552.1000988-1-jbrunet@baylibre.com>
References: <20240625142552.1000988-1-jbrunet@baylibre.com>
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

This adds the bindings for the 1080x1920 Licoln LCD197 DSI panel to
panel-simple-dsi.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index db5acd2807ed..49e663dd267d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -46,6 +46,8 @@ properties:
       - lg,ld070wx3-sl01
         # LG Corporation 5" HD TFT LCD panel
       - lg,lh500wx1-sd03
+        # Lincoln LCD197 5" 1080x1920 LCD panel
+      - lincoln,lcd197
         # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
       - osddisplays,osd101t2587-53ts
         # Panasonic 10" WUXGA TFT LCD panel
-- 
2.43.0

