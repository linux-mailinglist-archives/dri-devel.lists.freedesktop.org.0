Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2538B9713
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 11:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94FF10EF58;
	Thu,  2 May 2024 09:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IBHown23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD4A10EF58
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 09:03:43 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1ecc23e6c9dso7652625ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 02:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714640622; x=1715245422;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I9jftfW39bbIeQUfZAK90lWrNeaGnmPoobdnKBYyOfs=;
 b=IBHown23rvbZMK9r3JQZj/t5Z2TETgVdRyTtuzUBs0W3n7AiaO+ZXBmgJPaus4oyt/
 ApJxxqjBHqVfKhqMLumzOuRDgA3ssGrmm8AXQFHxrR56/m3WMmS34n/rTOCMzHR+/rkV
 D8e8LEV0PdaRiy8e00anC6N0bxwT+/sBSUxOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714640622; x=1715245422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9jftfW39bbIeQUfZAK90lWrNeaGnmPoobdnKBYyOfs=;
 b=f4aaNlpuyehdUxVPYg19WGwIldWe7tKdGKV0Owi9HgVc4A+spNeJQoORzL4qAl6aJE
 bnKVBiKCVpw1Ze4mWmwPOIxAZCs1tHccnlhgnxgnGBgemZ0pODXIljrKq5PDZ6iOyASx
 zmX8uoBuN236SuhcKE5Gxo5E4NEUKzU5EzMj0drTjP1XK+9HlWc25dhUsyzXunz+6ma9
 ATdj9lS1bI5xAH0gzXeonBiiXEQjOZ8tBrq/GttAliZQV4ppiZUkys0Z3Qy26/NNYD6B
 QYDlIR3aKfENTLdmME1XzMO/fvURUv2VDzg+JEcAzVs5xXV0u6tdGyzycqJ6Y0HyBNtQ
 QYfw==
X-Gm-Message-State: AOJu0YzbzScB9a/ek6IrAsQdUluX/509ooS2JIiLy6NhnoDN39RjVfd/
 Z+D/UWQUSrIL0KJ1nOU1EAx+bLBf1M3T4xbccuAuiIsqKd+ZXigOT4HjidVP9yyhLBZ4qcq6//l
 xWQ==
X-Google-Smtp-Source: AGHT+IHkk47f/oaNwBy+tqBFBgyeA5BhGR8Bu0LMaWx3ZnBeZ9jL9N9vElMhu4nySP7qHeAXoZ246Q==
X-Received: by 2002:a17:902:bb17:b0:1e5:8769:aadc with SMTP id
 im23-20020a170902bb1700b001e58769aadcmr4864021plb.22.1714640622119; 
 Thu, 02 May 2024 02:03:42 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com
 (150.221.124.34.bc.googleusercontent.com. [34.124.221.150])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170902d49100b001ebd73f61fcsm764983plg.121.2024.05.02.02.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 02:03:41 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Thu, 02 May 2024 09:03:31 +0000
Subject: [PATCH 1/2] dt-bindings: drm/bridge: anx7625: Add a perporty to
 change TDM setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-anx-tdm-v1-1-894a9f634f44@chromium.org>
References: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
In-Reply-To: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
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

Add a perporty to indicate whether anx7625 should shift the first audio
data bit. The default TDM setting is to shift the first audio data bit.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 .../devicetree/bindings/display/bridge/analogix,anx7625.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index a1ed1004651b9..915d5d54a2160 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -82,6 +82,10 @@ properties:
     type: boolean
     description: let the driver enable audio HDMI codec function or not.
 
+  no-shift-audio-data:
+    type: boolean
+    description: Disable the first audio data bit shift in the TDM settings.
+
   aux-bus:
     $ref: /schemas/display/dp-aux-bus.yaml#
 

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

