Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBC6A39B8E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 12:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FF210E699;
	Tue, 18 Feb 2025 11:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HAgEhTbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5294010E3A8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:59:35 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso16533205e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 03:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739879974; x=1740484774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plNt14WfwZSI7Nln3sGs9yH+Yl4xRu49ch9ykH86mJ0=;
 b=HAgEhTbTaelUCGv5lvbdb8yWYVXxfPT3mPf4Xwn5T/rBHu9bl6jgyk8aQZvjmxHDDF
 4dwefaFj5Lql5mw2395jwLZStofxpgUzSpGYdWMf9jTcPNfRNxLIuOZZJy1IagKfgOrO
 EkiNlDrJVMNuuISNQqVGy63mjheR/PYx6EA57Q7xcR2ccSs5MJsi138N8+L//mgH/Cf7
 VWf/+8Q+X2I25EuGZrArgofusN9QabTMuvhuIBBxup0xyGYi9No+ibtHiaakDJzcpbcX
 YCAapJYxbHUyMZ7bCPk9uLw7J48wn7ErjKW7jRm0485xP9bnx6G11ortnD5X0Bgu1xmV
 WdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739879974; x=1740484774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=plNt14WfwZSI7Nln3sGs9yH+Yl4xRu49ch9ykH86mJ0=;
 b=hjdku9fVYENeH85jEnWbN5pBhq2CpS6W1F9SLVwT3z267KqLbUeMW7/UkQxFrNNHww
 SHG3MzIo3uyl5jE077cgTMj4H1BfxV8kBZbefhBCWAbrEp+X6WCVpR5YbJuRtSU0es/q
 sLClXM0fWM65tsDw5BJNzR55O8C2BJXrMRmE5u3TKTTL/GtJ5cLZ7k9AWfpA1sT4iRgY
 utHEL5b4TNZ0gvvDCYN70XmETqoE+USzVaFOFA6HppRXIcHcYiJyaud3g2zsskx4Gbwa
 GD5D1oXkKarQonKSsS0fjBafXIzP+PznH2X6uEgBOyOJVNSRjPlb6CoYiVVDTknzfz/r
 BbPw==
X-Gm-Message-State: AOJu0YxU3nqU+rGJOe34oQAMQ05f2m2OK0Iqmr75+amH2afm6r1XglZ2
 iDLHBBJWMz+kfSuxOOK0fx0SKSUAA7N8Mu3yBwdGvjetu7tpM0z6
X-Gm-Gg: ASbGncuLfG2mG0un4ue4dUXdgkH1otUdSW9g8ibZXRDMkVfgU93Sd8e+HWhCGtviHcK
 TEmcLhOcAYh7lse2a7fNu0QF8w1rZnJR3TFJv7ZeKwSablbjiY5JuBNVd7H+swJi1pCLlUKT0HB
 MQXjrLiYGij+B6+lF81xIhKAoRIO0J/p6lEGsdKDZcvDgK/OHVleCYG2iS5PEzBehGujKgjY5+a
 DvNHHI1Dl2eTa+yGHPdzbtzS+D+TpO4lLFAzeG5Pjie/BMUZOj3PA8RuVQo7Fm6ZhFNhb3fvf78
 jBV3KJGKDfzeN8+2NhU+3Q/PzCT73GBs6tLxApvgwsfm
X-Google-Smtp-Source: AGHT+IGqpvy3pV7tb5l4+0aGMl4HQcPTOYCeNXFe0yeVJw2TNYm0+gCfRUOjhvo8TM1/rvWytw9fOA==
X-Received: by 2002:a05:600c:3ba0:b0:439:93d2:72b4 with SMTP id
 5b1f17b1804b1-43993d2742emr26482955e9.16.1739879973585; 
 Tue, 18 Feb 2025 03:59:33 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395cf084d5sm123873255e9.1.2025.02.18.03.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 03:59:33 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/V2H(P) SoC
Date: Tue, 18 Feb 2025 11:59:20 +0000
Message-ID: <20250218115922.407816-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a compatible string for the Renesas RZ/V2H(P) SoC variants that
include a Mali-G31 GPU. These variants share the same restrictions on
interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
the existing schema validation accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 735c7f06c24e..1c81aea28c51 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -24,6 +24,7 @@ properties:
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g057-mali
               - rockchip,px30-mali
               - rockchip,rk3568-mali
               - rockchip,rk3576-mali
@@ -142,6 +143,7 @@ allOf:
             enum:
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g057-mali
     then:
       properties:
         interrupts:
-- 
2.43.0

