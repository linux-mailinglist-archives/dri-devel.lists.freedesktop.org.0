Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4B79C309A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 03:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA97210E3B9;
	Sun, 10 Nov 2024 02:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gMkR2Pee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBC510EA34
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 20:05:24 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-71e8235f0b6so2204916b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 12:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731096323; x=1731701123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TnroM0S8Xny+JCi9Lai+ZOcGXjw5KQQTXaY0agxtWM=;
 b=gMkR2PeeD7JLVb3N/LaOGyPJwX5vEbKTVgMKnOQvSw+v5zExl4RPFly3j0zD9MVPJi
 aHE7OLi+T1sCENSEg6XBtoP/3YzYD9D3GRBS8b+WYF04DCyRr8DGBJViIh1ntcCshYQE
 C+nbbgo/C3NGGZqFGEn3XXqXQJCfEEXZZp1YVJ9I4OOfUW27kXAmRkaMA+stFo8pzDum
 zmV9ZL7cmglI4FuuWqcXy2J/WaonB4fdyVdcZpc4kff92bQnGtQHihKG+lyfoAb+xR32
 jQY631HjWxYywYmd+XIztlLt+xOUNpT9p/lpu/7cU7bEoDsUX7eD8iakRQiGPfVCogqA
 g38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731096323; x=1731701123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TnroM0S8Xny+JCi9Lai+ZOcGXjw5KQQTXaY0agxtWM=;
 b=Wg5EF710wgeeGv2xHz3t96pO8iWQgPpMsZAyfGwCAKGQJoY0ryB2M/71Efj+gvCFMp
 vu7nSMkK8F25+TQFFq36l0NsvqOJYwA/t8CRIbByTs0jbEdK9zjLM++2G/aZhSj71kK1
 spzaj+WJtG1aDAtT5UCiOjHNdK2ttX2liARAg7c2x++TlX4L8sNY1R7gAegmCVi7xCbI
 uBVW0F86I7zGVPE55OWzaA4IXC9eqfSLRDihJxM1NSAgsbD/TB5R0ZiIOKKffG9f7G6l
 1nPVoG+l7urxnHOM4k5F1TEBl22l2yVwDy8jjkbYKkBdRZzbG715M/FGA0KwBZuykd/3
 CCUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIKch6iRU33usJQcwsWcyPKGJ/BGssNGitqqQPgxIuNfDrZrXp/84wP+gcNNRvGf3HZi28EuyrJXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywjc8ivK70ZfW93lb6Rxv7zmYS9DchQ0THPTImPo+yLWZtKdSVo
 QKcG3AReaWdJlfXYKf00KXKot9zjvE4avxoJOSEn5L/EpJTdTrO+
X-Google-Smtp-Source: AGHT+IGtm+j88SKyyeHLrp0K+VgKUxdy2Xk1X1xe8FR0CLG5s8B/59rD4gPB4WgDi7CTlBNjoQVZmw==
X-Received: by 2002:a05:6a21:3b4a:b0:1dc:2360:17ec with SMTP id
 adf61e73a8af0-1dc23601829mr5582468637.18.1731096323574; 
 Fri, 08 Nov 2024 12:05:23 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:05:23 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mithil Bavishi <bavishimithil@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v3 04/10] dt-bindings: display: panel-lvds: Add compatible for
 Samsung LTN070NL01 Panel
Date: Fri,  8 Nov 2024 20:04:33 +0000
Message-ID: <20241108200440.7562-5-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 10 Nov 2024 02:30:58 +0000
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

The LTN070NL01 is a 7.0 inch 1024x600, 24 bit, VESA Compatible, TFT display panel

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 155d8ffa8..0cdd05d10 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -50,6 +50,8 @@ properties:
           - hannstar,hsd101pww2
           # Hydis Technologies 7" WXGA (800x1280) TFT LCD LVDS panel
           - hydis,hv070wx2-1e0
+          # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - samsung,ltn070nl01
           - tbs,a711-panel
 
       - const: panel-lvds
-- 
2.43.0

