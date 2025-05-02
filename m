Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3EAA7733
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 18:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD6610E955;
	Fri,  2 May 2025 16:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MGHhqQdn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768C210E91F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 16:25:45 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso21015055e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 09:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746203144; x=1746807944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ypXhiXFKasOWjLnzpie9p05fyvGjmZ0NHkZ8L97MCI=;
 b=MGHhqQdnl6dItKcvcMMJTMw2KyRodQWkDQobHjjiYpI7BvPfFJxXcZbW210d2K/OZj
 koXqOAubH5eauJYjvQUXBtsIJJ1ho7ThPkp46wH4RrSZ8r8SyWRjJT/apK2Z55p7O1XW
 6feUrriedxhL8aQzXYWaeJr94MYhY4AhDxl6gJ9UmjjY30m25426M1SH8Kw5WUqttoQl
 GAD10pzdMwZy3CxBNllRch5uLtY26ZczyEGhoWGEpqWGLehm/C55896hAbxXPvEPz+Kv
 iwpSom23GYlpBjXExtaNoQY7a7YHGqwQ89r6o1dkcVnyWXeSnC6anH2t6vUj6JdeZkyS
 q8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746203144; x=1746807944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ypXhiXFKasOWjLnzpie9p05fyvGjmZ0NHkZ8L97MCI=;
 b=JgOp+Dypu4FZtbuz4Ot5Js0zcxbuBdtGmqoop3ngKHsdymws5H0HRSmbMNALhIqE9E
 74N141yhPzzVhJSyH7jumyE/q45PfcB8Vxg+BBS8YQRap2Zx1UIyuIwSOYqXBPzJ9gmt
 mC19MuXgGbzoamcab767c1F0OwPfh3fVErPWRtvKg+futzGsX9JOK2upHdPQ5Q1r0h01
 vXfobygYGIyMcPPNXtcPl4KhCd0+Qgg7lvcS0XYumhF7MnJpyaOlJbkCRlpy1wHMVnRA
 6aldn7Amp4tXOgADb7OESDwL0beBgIGuxwkZpLHn9+82qV8dze9gzwHLUIBR+Nqv2MyP
 ofzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhsO7wrTEiFpTxL+mixBe6vMkXy3cdPT019cjkEwCm4CHlf/CP6HrAvWtUUrdDCgrqdPCZTaZQzOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxtum/RAOOYIiTTVREEyNnIGDb3Tox7s7yHk3qIP3fpAao7uKfy
 9MHKN62HAfuvvFRKYq/iQwxF5gsos/o1dYu0tcvM5K72ToUV3r2t
X-Gm-Gg: ASbGnctMiBOaQm6VAbRtsOAvb2IJD+anDEGJswecpvB6daVbwU4UCEZ6B6t1T7twjem
 HAkrEiZpN0JXRru7tmxu+y19X5pK/RK5K62q97oh8ftW2oEnV6PHvhTD6caa0RRo3AeFv2LWcJC
 2NeNjTwxzEf2IKECgTLK0J/fz5n+pVCFAQdOw3JHsWOsjI+yfuGRR23+FCETzFlDXyk067p/t1S
 4ugWGIxQRrdnVSlWN9mV4Xpj5t9MthSZR+mf3/cvDGiKIQOZgQILIojsZtAiUV7LnGEXjs+YSlW
 Ii8ds9QpmbgId1EN+nZyCOO4uKi+IIA49jUW8fXVUAkm1IvUfElWLGqXyHMDUEdV03v3McO2O5Y
 =
X-Google-Smtp-Source: AGHT+IFFsOh+qCz1DNQRSPc2jp6Jl7hwz2Aj4ZvAdyl2rsdrq6cb6FbqWgbdu3F6VxLaspCW/NR+IQ==
X-Received: by 2002:a05:600c:1d95:b0:43c:ec97:75db with SMTP id
 5b1f17b1804b1-441bbec2288mr29723645e9.11.1746203143605; 
 Fri, 02 May 2025 09:25:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b8a2874asm48584405e9.26.2025.05.02.09.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 09:25:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2N SoC
Date: Fri,  2 May 2025 17:25:40 +0100
Message-ID: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a compatible string for the Renesas RZ/V2N SoC variants that include a
Mali-G31 GPU. These variants share the same restrictions on interrupts,
clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
validation accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 019bd28a29f1..3297ed160ebc 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -25,6 +25,7 @@ properties:
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
               - rockchip,px30-mali
               - rockchip,rk3562-mali
@@ -145,6 +146,7 @@ allOf:
             enum:
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
     then:
       properties:
-- 
2.49.0

