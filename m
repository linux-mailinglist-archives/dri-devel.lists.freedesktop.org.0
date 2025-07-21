Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21952B0C187
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 12:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F92910E4CC;
	Mon, 21 Jul 2025 10:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Akic2lWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D359210E4D1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 10:44:16 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54b10594812so4041622e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753094655; x=1753699455; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VxAdZWe4deFkVw4HveAlQFq3r8kE1/6molhjhEtjNCc=;
 b=Akic2lWsI6YL1j9WtqjZLywfXSz0MVOxPph9Sj6UuPg5R0r5xtY/uQylajMLG06Qes
 BMNeizDIPYqE9WxaxffsG8bhBGDgwMQ4GXIksvt4Sl+9J52aPZfo6JltbgBWwRvIC2kC
 abArbCpDamEq0Zp4BcN0kVZYWnXCtBigzSa6EffY56xKwOfdLVG1J5kjgtlladyxUGdF
 Dc9I71R56wLLjyO5K9naisGJRfByUadJwT278iBt32FL4dJJtL2TYg/Fm8hzwHW6gjBq
 DcQKnkLYv1B2NhKDzGCHpN3OtrpJrmNxMswkQ5dZ0LxV1tBCz2HIrTkwA6/yLXQ4GwwT
 p7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753094655; x=1753699455;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VxAdZWe4deFkVw4HveAlQFq3r8kE1/6molhjhEtjNCc=;
 b=a+qw8t8cwySSsv3hLfUVbotuT1THnM36P2JgKacpFutiPI98YuWKq+2G2S95zK7Vgj
 rsITx1igBjrZRPaK9o/h6oYsWGNlP9GrcMxb2ZiVBMxaCmj9JJtpkc3hWXjOLE0SLJLx
 qTuQkG+mOPsYcaRjC8m7B/tnMNpaLw+J1/IruFZ+JfEzAnWdNtLHamXPZ9UycKgByVzk
 gPyURCoYWZujvD8aqFc4+cgpERB8T7yv/u+AjRedy9CK8+L8dBKBJrDbCl5xzjVjcbZg
 oYhKdoguF9D261ewDmuFQ65IfuJWnLk6oK35Rq3BwBYJrtZsw8WWs5lia6zilbceiZ0m
 idLw==
X-Gm-Message-State: AOJu0YzK2vfvXYYGlPE+xcQ58IQSVJvr+wdTczMeMO4XaN3+WR+sIJgf
 2sWjjH9bpfjpNWgmv0a055iT8fqi5haQzj0/HKXa1Sx/ZzEaxC1pUZWq
X-Gm-Gg: ASbGncvui5CB64CQ4W2Nm3AaA91+ObwZwG4K/xd21BzQJj5DZ3YmrChm9yZuCLccUTi
 +0UROkuye/9qS45i95Gmr6N/odsyc+37to9QLXuykHFERmpP2OdxCS9uipAdyXRTr9bqScGH8kI
 VMLvkHVdBIz0GgnsXtCOzP5ZSjEj7tjYJnkSkyevkDyfql1II7bgbXNSc/qRAhay2PKMn6SgTpr
 FEu3T5f7L9sgDkM4NKujhyrMzYh2mur9iBlfVLLDbzwBSVR2Ct0/bP5UX5jM/hdaW6USvNrStGY
 zCoNWb4YaJ1ZWLEcTWRtr2bxx0OTig4mwL1AVmmb47NAjhYpE/2EYYfyr3alduSGD8ZT1QxPOO6
 u/mmqxBItn8suChDZPPFiI6wZxz/irBZKfFe6cYIlOFEHYJNvwyvYTlbw2ITQiM1GhwHE/GXNak
 zsdw==
X-Google-Smtp-Source: AGHT+IGYWaCFL8xA5EyMa434EWfdLSheJ3rDLZChUay5GLugk1edqdQ6zS2UsVz48U3bLv0JPWIcIQ==
X-Received: by 2002:a05:6512:1387:b0:553:cab0:37f6 with SMTP id
 2adb3069b0e04-55a23f06ca5mr5166596e87.20.1753094654822; 
 Mon, 21 Jul 2025 03:44:14 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31db89bbsm1505164e87.237.2025.07.21.03.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 03:44:14 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 21 Jul 2025 12:43:33 +0200
Subject: [PATCH v2 3/6] dt-bindings: display: sitronix,st7567: add optional
 inverted property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-st7571-format-v2-3-159f4134098c@gmail.com>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
In-Reply-To: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=pofdZO+wzv4XwsWqba5LTe4zsUx4ThM2T3T7ftsOpsk=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBofhnjRBHsrqsSV2/fq/jzKaw5WsrLQutrj7Ebn
 19MT6dUgMyJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaH4Z4wAKCRCIgE5vWV1S
 MkKfEAC+ZSML1KYLh3tZHsiCOqR1W2O3/mHSafftlzqaA14RiJnPYhJvXz5qVVWNAuRq1/v9LSe
 yT6nYzzDECSCpoaGtBEMjk1CiOoyy+6O0Hn9mdi+kO/93E/PDBc5sPgeqbKWxLFgvNRd8eHhw++
 S2rOZZKE4vQ45RH0DIPK+pe4o2ZCRjGmC5SmE0OyGUM63cg6Yk2IN2S3aDuHhQZyrv5cxhNTlmV
 cLqB7st8fondSA/XsvDbB8ocDnGCfmycS0Jtg9TUUjZo0ZhKV/DoSRbxVL76jzsTBfhl172DNM0
 hDBfSVm9O3Ll4D2iyrzvGfnGxYExP/akGr3zw8DTRuRH/54I/IYulAtwFJuUK3wYMqeNeSVXj7W
 JNvp2lRUhvGzceRhJVf4pbtBFrtOIlfH+DRCizq8IMig/99BCjlSMukEUoOGnI1ZJxbQLICsdT1
 ZRgYGxNqokdFj3BunFvdfa1/TAWoXqH/QeexWnCZUQFuUjtsjdCcNL1J7aOtn3qsY/2HDF2IESP
 5VIAVR443VJwoEXsSjaE9rGhHNGMabpcif546yvD6ipORAsv4KlrrI3TZTLIgfYtpilvrcwMrPO
 7rgrJIEv6xZO5/0vdFAQ0Ox9xp4k+89m1NCjte3wRPRJ9qWYNtYnT0ivlO6xOVPBB8rgQsMVypW
 PQFH2GN0k2tFiYw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Depending on which display that is connected to the controller, an "1"
means either a black or a white pixel.

The supported format (R1) expects the pixels to map against:
    0 => Black
    1 => White

If this is not what the display map against, the controller has support
to invert these values.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/devicetree/bindings/display/sitronix,st7567.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7567.yaml b/Documentation/devicetree/bindings/display/sitronix,st7567.yaml
index e8a5b8ad18fe01429146b20a0b8237a164a7dd47..2eb6d00b5a25632a1ce121c1b43a92b2a4010fde 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7567.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7567.yaml
@@ -23,6 +23,11 @@ properties:
   reg:
     maxItems: 1
 
+  sitronix,inverted:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
   width-mm: true
   height-mm: true
   panel-timing: true

-- 
2.49.0

