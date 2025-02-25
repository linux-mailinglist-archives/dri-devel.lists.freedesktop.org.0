Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585FDA437B4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AD310E183;
	Tue, 25 Feb 2025 08:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kxZ96H3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E7410E183
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 08:34:13 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-abbec6a0bfeso834567666b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 00:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740472452; x=1741077252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q34w3RqR0dtKEGKyYXofcB2jlNCM2LrnhrF1NCKpgfo=;
 b=kxZ96H3B+Tq/p2xKlchb7IrGpj2hdeGE+LeqSVVn5QHF7yE7apM2wm/g28jcFwUDty
 SH6PEldXCnETZ84jTWz4wkmT2HHfoI55DzAxx+DtvpeIwyV0v6jWEQpDQ/qXRhrI8K3I
 ti2RXh17KNvnUyPH312acwl/Vnzti10siuNnWKSKlgkm8RkaURF92yU6mjqBVbHv6mGN
 VjwH591bYZiSQ6tRT7oR4QGrYiWPQWUW/uGcBvLlQYaT2hLSsk0NeuFNUDjZ6cB1REIy
 UvZzGvuRHaG/V4WDtLTZwsbwQ0rXX+TNRFApjmscu/mq5Ng4VnZwMQJgi5hw+VbVTsNX
 Y89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740472452; x=1741077252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q34w3RqR0dtKEGKyYXofcB2jlNCM2LrnhrF1NCKpgfo=;
 b=C6MBDbAV9iTDLrthmjLuHRrRRgtaTxTDE3RQ1CxxmAqwSfdmGaBdsThKJFcEyZ/JW1
 T66vBSvBNg9WRNqgkWyV1l34vM0uvPJwvjeekLW5ksEo9JKVb94hvmRH0cex64vcrHby
 WmiFKWz5uxBJeAMuvBqgAw7I53wbOanP4+LcqLl2/Lb8/Hxw9uKa5guGUISpBo4pAQMS
 wcQ17E1iMq6IgngmNqNRm0u8N42uKpEm0WJR5ScHb9//dPS7qldwB4nuSu4buSLz4QzW
 B8RaI28CKB3RxkvRvFu/c0ENcuhRKSJGWyUbIV17B5YNbCOlTtN9EvcYa1YSDJk6bfJ/
 AvQA==
X-Gm-Message-State: AOJu0YwBSbDLtA4/akr8tIeMD6bd3f2Zo4VVBct6iR2ZYi38UWmISIw+
 2cBbE/SLSVQIjpwURzW1PQ4VGEMqbco8sfmmi98jMzrmHrDn2xrf
X-Gm-Gg: ASbGncvpYkEcVwCID72nU0/UnLgmYAGDhZ7EeVIFdEZIW9Ydd/OuN8HQrmqtYjSh1qv
 RnXciXaApXHu15QQcm2KBSrJPAo+Dnco2HPJ412G6p5NyNIGhY/SM1Zr5tT8bZbyJnkBwQDcGh1
 U2A69ZiUdiu3yDSohhFke26oLXj6Wi2ocnqWhG8LS+A4ys/hF1Qx9v8GBG7tDsTioqrTlQHVwZ6
 s6ARJXwu/1L33TlPBajA3UzS3PqN2GLqjjv8k2Hhm04bGAeHy8Vm8dqkA6UQG7zrEC0Bm6r/oy5
 IdIcyfAfjML1qDKpsQ==
X-Google-Smtp-Source: AGHT+IGM/ptCrD2L+foIgR/sI8mwv+UTIQrXbkp7n42BdtHJzaV1GcZ5GgCB3g5Ien9AH9WgFu5RTw==
X-Received: by 2002:a17:907:9c05:b0:ab7:bf2f:422e with SMTP id
 a640c23a62f3a-abc09a80912mr1903767466b.27.1740472452313; 
 Tue, 25 Feb 2025 00:34:12 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1cdbe0asm102660766b.36.2025.02.25.00.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 00:34:12 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindigs: display: extend the simple bridge with
 MStar TSUMU88ADT3-LF-1
Date: Tue, 25 Feb 2025 10:33:43 +0200
Message-ID: <20250225083344.13195-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225083344.13195-1-clamor95@gmail.com>
References: <20250225083344.13195-1-clamor95@gmail.com>
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

A simple bridge used in ASUS Transformer AiO P1801-T.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 43cf4df9811a..441e5e5b27c8 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - adi,adv7123
           - dumb-vga-dac
+          - mstar,tsumu88adt3-lf-1
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
-- 
2.43.0

