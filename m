Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B9EB0C185
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 12:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6292710E4D0;
	Mon, 21 Jul 2025 10:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jr4u3UJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B250A10E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 10:44:14 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-555024588b1so4441368e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753094653; x=1753699453; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gCPC3/B/40jAlTbemOzcO7vBZCF5L9R92GLtIRc3FkI=;
 b=jr4u3UJrrWLcbU+G3gfLqJxRd5H0HJXI+U6JbaIkNTrItobiKdzD17EKD6SXg0hThF
 y3RrLiYBhe2/TX3JvXqgMd9MvRttNzze2DIR1R31SClvC5u1x0qavtUACH3Jh73ln29i
 bgAdl9hAzH2d4MYeqo3WGBZ6cr0ZTidPD2IXkGRbAeVNyPsVCO3HP/5iNKMjcTWy3GKP
 azGP/TK8FhxdCtOaBxupRe3SJgVonmAJiJkaF+lu1ovuLPTjRk5Eipc9tyB+jGRsOA5a
 qhYiV6vJO9oejfsrUapInHm5alkjxyWI/YU9opiqf9z2h2ol/D9EiZB0SNrWJWFNtMwF
 OJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753094653; x=1753699453;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCPC3/B/40jAlTbemOzcO7vBZCF5L9R92GLtIRc3FkI=;
 b=D3/u0VurCAcc/WKBVH5M76WO0u8CfFj9FJ5pknB6XU2+gEdQiSBOsBCCF1AF4Yn/8s
 auLePXPS48q2pgMawgUyl5WC2vmBIBwngWrJwW9+gjuHdvNjcLKy6uRPUf63tBpkoQdD
 MJn0jfLg4eO64+bIGuAaDwka3AqEOPF54tEQo57G2pYHNcy9qhAZTn4J5hXoFkUoZhMj
 xQyhwoX9d2dLQFSwYBN1jlYqsTRZTGo0sbIC7t7DgqVccqugYCgsESYKfODbm1rwww0n
 SwojWJwbk18htiFd44+gD9PNlPsyz8Fb5fpMQkeU36ezy5qVMFoXpBL0i5E6IPpzWBJF
 /joQ==
X-Gm-Message-State: AOJu0Yx0gXJirtxMxVW0ja2PGOpjHGSCuv7htR0ExojQ1U2eauZ493OK
 FwsxLp6/fks8/iiKWLAQwz1QO55ybu/ZjX554FxC6PUe28g5W7oI1q6+
X-Gm-Gg: ASbGncuvnryAAXzSzm3PtqQZusH+6EYxygRyfNEh3WyfycseLYsAu4+qrQNK51Aks8z
 kUjd0lUzXju0tUgg6r/K2IkIyntMpbzlNKX/a68+Q2F+kLdL3bTxr//V+R2SSPX8p4+Cqng5xwC
 D+DqBgq0fOhvhF8/oroA3qKEsoiRxpy4ndcs4C8qX98uX+r0XWhUn8ofn39etvZ+wdRa6/VFeeI
 lPPY1qBnVaEoIdWYBSF+OukqYfv+ibrSgNeYnaA6WOaEZ34bHc5KWXKSbYS+kVipwrqHSNpEAIS
 hRTQ0F55mTiezXueb5zO1QMl/ryRzlTeQckzmbQsfKR7I7Llw28e6xOZKdjQY6+phOcLOVBRqnw
 cdvT4unzXSZT22j1l+My0yAllTvU/DdwzWOPIR+hmjb728v2IHmONP5CmJHoQbp3KwhU=
X-Google-Smtp-Source: AGHT+IGyeZybIXRYBG+59fD7/AqqBR7UHXGER0tn9h2axe8m3o//fUdJoCEozITZqAu2nxMPNux1wA==
X-Received: by 2002:a05:6512:618b:b0:553:3770:c907 with SMTP id
 2adb3069b0e04-55a23ee7fedmr5751878e87.10.1753094652675; 
 Mon, 21 Jul 2025 03:44:12 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31db89bbsm1505164e87.237.2025.07.21.03.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 03:44:12 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 21 Jul 2025 12:43:32 +0200
Subject: [PATCH v2 2/6] dt-bindings: display: sitronix,st7571: add optional
 inverted property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-st7571-format-v2-2-159f4134098c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=XIXfugSBmQKeH6uIwZx9ckJkpPo+fuu6lofaI3f2ies=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBofhnew7GMv2NT+v3oyNgCh5g4eMNJigShe13GT
 gvspkzM0BaJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaH4Z3gAKCRCIgE5vWV1S
 Mth8D/9/skTcbCDfamLf/A6lQPq0n1R3ljI2JNRzOoSpcuZ46YCMGSLOqXbQydXwPmMkcUFhVD0
 KuEnzkAbo+Kos4wnWfFsJH9dOElrGwH+vZqxX2D2tNPdao+SxkL1sIY6Mb6pBUmY/ISjZF89PTn
 yoInDREznwj0erBhPs2DBxJAcyhBnE8ysmqwcSFdrtp+m1/x04mmh8fB45wRsawOc2iQqwjIDpm
 jo2r6Jx9XkYWGPjrNZvu/lgtc002gQ+kCeqYh5D9d/yYwBgyvlDA6BeZRBD27M1krPjVP6aZ/S6
 fyoIRk+Hwk5D3nT4d7wB7vJe79Xf3TVbZhI23lsW+VRecDKkg48tQHAM0ozw/vRPFyuB+/0uk6O
 /aBgPrhIV9YdNw765oHxHIfcbWqsgByeLEcJ8wpCHhchYcJMZgLRk+sGUtNt4cxjdHU3qUBRqUe
 lwyi7vD4obav4HdLl1b5GhlEB19YeGrmABTVdRZ0ZHhfJlKTbuYQ/Fkk7k/jub1ZNFqmPCQEM/9
 fq7hP4RxoiintnwxAi0GKnwn08xfUQZF/orx+oEfKwuPAryWluG/lxE5erV8pr0F5WvmVBSc7th
 zDaX+gy8G+izen9G012TC3Kn2W/TSWW87pQyrlWAMtifDvT46qms85VxPokg/kwMz0KOACTBwkL
 qjVfxbV49T8xHqw==
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

The supported formats (R1/R2/XRGB8888) expects the pixels
to map against (4bit):
00 => Black
01 => Dark Gray
10 => Light Gray
11 => White

If this is not what the display map against, the controller has support
to invert these values.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/devicetree/bindings/display/sitronix,st7571.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
index 4fea782fccd701f5095a08290c13722a12a58b52..b83721eb4b7f8d258b4e845f107b056696b8d4a8 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
@@ -28,6 +28,11 @@ properties:
     description:
       Display supports 4-level grayscale.
 
+  sitronix,inverted:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
   reset-gpios: true
   width-mm: true
   height-mm: true

-- 
2.49.0

