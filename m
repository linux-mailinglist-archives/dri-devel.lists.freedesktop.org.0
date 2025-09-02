Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DCB4781E
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D1C10E417;
	Sat,  6 Sep 2025 22:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJldD/NW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557A010E5BC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:53:28 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so4133302b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756796008; x=1757400808; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uRHfTX+kYTYjP2RHGnNhmFCowVq0YDH1m7zbAtVriMs=;
 b=PJldD/NWdEOMM4gO+vQ82m6XUqY+j/qRfficsUfAoOj6PyZO0OKDimLhT8ebumsudH
 riyZAv7aWKYbLxoKbwNQTYpjsi9SqAgBFBt5O8xnr8G2gmVhq5tu6O5LUz2dSU8JXI4U
 Mv079TIdCz3B16t1CHjFb5eWK+0poEWvF9q+4YN0hTyJIsLY0Uw6ZJIkIwzNxxvL7T0k
 KIOkojj6xvdvsvflmfUv4VR0Z4zmKW4MG2up8AuEW6iRwhvN49pDuLffVajx0EpBUmWn
 K6aynXawQPUcUbEvStqDwncodxMb+Uaw4Ti75Ev8CXAk5oUarMHcIt7Nmdgzy0sCwwgI
 aa7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756796008; x=1757400808;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uRHfTX+kYTYjP2RHGnNhmFCowVq0YDH1m7zbAtVriMs=;
 b=UaKEtOOb5Rm8jyW5PuHzx50YAm6B2nIny38EKQhTU8Fz1v3W7+EX7IQg9Cowjd39/e
 fRVVeDmBxTJhRQbKOwvsDcoFIhbcGhW+ZRNKOsjiAd4KRymrknLHC9D6RyKl9Cba21HT
 ZT8hg5fVCNtf0LrsV25rRL7XUQQEmQ1T3sDesKSf5pyhAs2Qg4LEjRXI4gwjSbnNMyOT
 5u26HcIvE+RG5N/EV8F8pDPswd0Efb8HI2U+czSK9WQ/Rs+WzUpDgSRTI/Y/0/eKz3q5
 FkiR9nlX4IiNL8vOyy0QLbog8HSd/roujbzL0owOg7aOtd8Itl2QgS3m5DnKT1FKeZ2/
 9r6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPNIfmO6RTSOk/qTZi1eq4uMokpCpFkC4qjawTZpzbDw79j5yioguCa+814G+mY16L+HtxdbdtPFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1ff/FNX6OgzGvG2lEoZDrkWrbAKdjIQ4C2jmMftW8tjvTQLvK
 Yj/p/XwqBP5MrXMgQ2gNPZxawxJKupFc5azZ2lVt2R7SzlmKsEo348vg
X-Gm-Gg: ASbGncsCI3dXrNgUloqxNRR5hW329oBREKzdRukoFAAkenyRQ+AsfczYc6upg3uJQAW
 z3qhBarT7p7P2Eph+4SqFVjEc7cEe30l23kzxnDU2JZW2fqqBliYsEoBbl9TN9Vvqr6Zovc86KG
 94YYC5TLxHGYcVVhfAYokcfqM3wPKfUELusU/8+waAzGeAvDeLV0Vck83KGO1irhExfcexLeTlw
 UU3W4GxC6cPwMxo/krejvUnkkMtc80g0wu0/c0St3U8lcy1IiCTPM68eXQDIPDN+5ddsx4wiK1Q
 EtmU3lzaX3PoEufga3cYhUFm5OFwG6oe7IUlGs22WiqH4y2m6Z44bYyOfcgFLTlrxKBIgT95JxV
 /ERpXp1DMxgsxlbnysA9JkN9c8Z7yJb8Es+XHjURtqo4fqf8fXIHSS8bI+BNnMQ==
X-Google-Smtp-Source: AGHT+IEhN0B4GC+kdm9Yy56XzpwiEmGdwfOWMYn3JUHap8TXHaxkD6x9MJCrMNUJMHJVPvPmquyUYw==
X-Received: by 2002:a05:6a21:32a8:b0:243:cb50:2532 with SMTP id
 adf61e73a8af0-243d6f031e8mr16693596637.18.1756796007795; 
 Mon, 01 Sep 2025 23:53:27 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327e8d3d635sm12312558a91.1.2025.09.01.23.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 23:53:27 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 02 Sep 2025 14:53:18 +0800
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-v5-1-d77c678c4ae3@gmail.com>
References: <20250902-drm-v5-0-d77c678c4ae3@gmail.com>
In-Reply-To: <20250902-drm-v5-0-d77c678c4ae3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756796000; l=1022;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=zO+xQYgQHKduVzVEwU4i5+zjoqCBC41ZcTRsqWeaDbQ=;
 b=D4/FW7QVwITiIGRQel+3ljOk0gynDr43yTY+btyqyZlw0k+68Ed5hfvK9h4CqhmA36yA+lzn8
 TwHc+XWWlGhDXxEeXx5U36HCK8mL80yQ1WI9i9tYzBqtkeCVKsdMbn8
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

From: Wig Cheng <onlywig@gmail.com>

Mayqueen is a Taiwan-based company primarily focused on the development
of arm64 development boards and e-paper displays.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad2fa53b2dca2ca06a63710771a600..300de3ea055b49449e45705f3613fccf2c29d4bf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -933,6 +933,8 @@ patternProperties:
     description: Maxim Integrated Products
   "^maxlinear,.*":
     description: MaxLinear Inc.
+  "^mayqueen,.*":
+    description: Mayqueen Technologies Ltd.
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":

-- 
2.34.1

