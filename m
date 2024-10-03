Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443A998F098
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 15:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC2910E839;
	Thu,  3 Oct 2024 13:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="beZSA5GA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6387A10E35E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 13:39:09 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42cb0d0311fso1272125e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727962748; x=1728567548; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vhlVBKUdIP9ICp6zlxH3C4G3zUM+gAWbktY0hHBXtCs=;
 b=beZSA5GAgYCxCqgL080LRRkN5F/LTxvlyNvkFg1bi/0til9C4fQWBbVEA4mUfaHUn6
 4Jg/JrxFdYisl46OwkYs2VZpcgGr0reayGN32l1JtFjEq2fiFt49z/bddg8avx98PGOu
 HlKygE0IGhkL56ELRc5+JTQI3msg5aH9TbI3Or25Gt4esVI3VHd82Ce+EnfSF0hXjzAj
 t1/a8o4ZZroi/8p2qKe3+tGjcZ/aLldzMmAv0qHa0p1fP0kh2DSQWws1a+MmJbp2skJ/
 L56BQik/bbgibtd/ROgyEmzFP4JsOjx32CF2pHHNUTUGVxTOh4bboVoi6GX17tEhQeNo
 qdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727962748; x=1728567548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vhlVBKUdIP9ICp6zlxH3C4G3zUM+gAWbktY0hHBXtCs=;
 b=rkwIZDnN1s886gKVg5FP60P43m5PbtIKLgpEChdjgqoLY/x4MdYXbgYkNb6e/ty8xr
 eViJ9VUTfOhg/bJ9kgZZjpCBt3UJwCcRt96KYIYmiNx2AdO2SJW0t1gM4s69pmmNOupx
 /3Fo+u4RIQbx/XR2/vc+7xhkoyIaVP8V2WvoVtNEjBu8X9m7GUn4/AldikFDcQW9U5z4
 q2+2UOUNKP9xQp7oEzEx6kfKKJQlsrjx8BXjg6HhJQGy6zfzsbr2jh5QcUQja9bMos8x
 VdXLd7kLEUVqygSC7Z3UiDVhlAYTTbQaHOvZD2ErCU3fTVoiOvMnpaSvoWwPP6aAoG5f
 Q3Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt4VVhtKidzDyIsToHYQAk6paQLu+5RduVbdPiaGYVyGAcUbSx5alyDjOQEDMCajf6p5KhQ8nqF7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGMhFeADkzbbe0F5SJY5E01rfM4QpouBUv0Qfxh4vqtDdDOhqb
 SpUF5kO+HQMId1GqD3oJQkoM9/u7mJRUx6Spy0UV/x+uBU7sAjbkdj2ZemHLPLI=
X-Google-Smtp-Source: AGHT+IGAi9GFf0ajjL2VRkR+8z2/+wjuWbQka9q8tmXJJBQqwW2SfzfdMkNW5bz+Pq96QWct/VT+nA==
X-Received: by 2002:a05:600c:35d6:b0:42c:b55f:f4f with SMTP id
 5b1f17b1804b1-42f778f336cmr25665035e9.6.1727962747636; 
 Thu, 03 Oct 2024 06:39:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f8025b583sm15906875e9.12.2024.10.03.06.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 06:39:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display: bridge: tc358768: switch to
 bus-width
Date: Thu,  3 Oct 2024 15:39:03 +0200
Message-ID: <20241003133904.69244-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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

"data-lines" property is way too similar to "data-lanes".  It is also
duplicating "bus-width" from video-interfaces.yaml schema.  Deprecate
"data-lines" and use the common property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/bridge/toshiba,tc358768.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
index 779d8c57f854..bb5d3b543800 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
@@ -60,6 +60,10 @@ properties:
               data-lines:
                 $ref: /schemas/types.yaml#/definitions/uint32
                 enum: [ 16, 18, 24 ]
+                deprecated: true
+
+              bus-width:
+                enum: [ 16, 18, 24 ]
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
-- 
2.43.0

