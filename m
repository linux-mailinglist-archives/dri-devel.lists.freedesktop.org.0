Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5E8C45903
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AC010E365;
	Mon, 10 Nov 2025 09:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lyie5RBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFDB10E360
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:15:32 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5942e61f001so2502129e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762766131; x=1763370931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
 b=lyie5RBdX+Ab8tsDJvGvT69/ebrvrWoCUSrvaA6yHf90TyYbbqbFF+0/LLmTkKJPRn
 C8mvQeX0gRMDTHHVfW1OzMt904zwZpjnGZZZ9RfS1dTG0QJXTAB5iW4nFyQ6SukdsqW7
 4W5jWtrOWCCDYaXCKPMWd3RqHE6foBf7/brVwBPiRvBJ2FX1vEEen78Szop4z2pX4fA0
 SnhmXBJh2KSCtH7TwyOeKc2YyM2Ve0/h4jBipe5eAvOzuCn2r9vkb0Gt08CQ6rKV8M8x
 QfS0PlBiqmZuLsbJBZ7ELe++7hlHv+LJlm4X5Xf/mdj0jL3KRwr0xvNHIBdsfRc8kBsE
 w+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762766131; x=1763370931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
 b=R3pOTsONyG4BD7uUoUIIaW3OKG9zPS+3uPUEShWwCAjYthLaxPkAB9KHOaLxXx7H+6
 bWpS+pBffP3oLXEHWcE8avwJWZ8d3KA+qmdptBSSAjqo4z3ZZMeZP/X+7gUcoKX7Fudy
 QAxnDiZJPcRPjCnNQVQewl/Ni5aBlN1yMDbiN5KdaJRiDvMftM+z2wXx7O8cNtLKbJ13
 gHlKpiDJN+M3Xjuek47zduChbSyAnU9vhmLqY9HnHKwXyGwoH98aZMr9qPGUiwoFuBFl
 4BVgbsg7MWsbDxqUz1m8O3penJ2XgM6eZnCM4/pVczZx+Ygm3qTCHiH0u+UZAG2zlMSH
 7DuA==
X-Gm-Message-State: AOJu0YxsSigb0AOnS683aNbCZRRxHCW1dQ0pSISctz9nYCEExW7P7s87
 5OPfbbTAJBhlPlO3QVpPNIKXnURstMQkY5bLErbN43uEWVi8ibtYIy73
X-Gm-Gg: ASbGncvx5A6UBs4LNvru4fUuIRMxc7eiZctueBnS4OcrPGOXWravBlbZccEaOoHZvxj
 +wjueRx2nJ7x1QnOnz4tYNFZISFkkdSsYp6KPa1YMXVx7yfTLVl69hztbYKhvH/hDiFvJuC3Ykx
 9K6XSrnkKro1ts/1McNXOHnzIvA5rKvEKcOxwoWI/CclRhwBFjB01aBLFdJ4cA+8NepjsQvgZxe
 7flnuFjeNDVaZYyKAYoMx3il1vueXEpT+mBlZTHpWea9GDj5R0Tvya0VHfOFirRD7DIZhiUkbLj
 BrOdcf7tO4E2mwezFpG0GNUB4ohzPaf2PMm4ETPU24gWI3PiX4w/ELzLnpZnUM89xv331ASrY92
 zbdlCqsCi0WeuuBnQY6k0MyTZ/waAdhj2ksHC76cFICB1cHedj2XjgwVcIK/cSG+k
X-Google-Smtp-Source: AGHT+IGz/i0ncWwddIJ+2HVNMQhgm/XQg8Srr9UXcEYDpRdQ63zZfLAICmPWS4NS9Y2VhpYWQE8GAw==
X-Received: by 2002:a05:6512:158c:b0:594:341a:ab1e with SMTP id
 2adb3069b0e04-5945f1b74afmr2232518e87.31.1762766130847; 
 Mon, 10 Nov 2025 01:15:30 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:15:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 6/7 RESEND] dt-bindings: display: panel: document Samsung
 LTL106HL02 MIPI DSI panel
Date: Mon, 10 Nov 2025 11:14:36 +0200
Message-ID: <20251110091440.5251-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
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

Samsung LTL106HL02 is a simple DSI which requires only a power supply and
an optional reset gpio.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index f9f1e76a810c..01ac0af0e299 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -52,6 +52,8 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Samsung ltl106hl02 10.6" Full HD TFT LCD panel
+      - samsung,ltl106hl02-001
         # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
       - samsung,s6e3fa7-ams559nk06
         # Samsung s6e3fc2x01 1080x2340 AMOLED panel
-- 
2.48.1

