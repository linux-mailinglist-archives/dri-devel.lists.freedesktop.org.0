Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28D1B038A1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 10:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748CF10E417;
	Mon, 14 Jul 2025 08:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VVqZq53f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834C110E416
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:04:37 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-558f7472d64so4019447e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 01:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752480276; x=1753085076; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6s29Ts1SkPQDQu7w5HZtIzuTKDuPYqCu0keY+TlHALs=;
 b=VVqZq53f6xmcB7JLu2/qvLQClwZ414W+f/aOhup+Afi+2nh1kjDlszG5Zu32NdrV7G
 T08xF5Janw8j6pF67dhWHk9wfrUq5Pl8ftfE+omZ8Yz+kddvezVxEQxd1VeAeUIT/ZVe
 0UE51q38dtbFYzSNk3Ghl4fbpad6+PHYUupDpVWY0TuCbhTPCMcce8MDu6ElSEvoMM00
 CoHBu78xtxq70G148NmC3a4N7GgJHnAgoKjjx2I8fCBRzAandIpJwV4T0oLPr2LTWi0H
 Rowr3MBoEkL1CotK3RBmXno6EjPaatk3FpRZZxLzg3KmyMrqlm1jR5qRH0sL3S8cZY2Y
 TUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752480276; x=1753085076;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6s29Ts1SkPQDQu7w5HZtIzuTKDuPYqCu0keY+TlHALs=;
 b=DbHRwxqbyac0UmbPSlMu4EO+5fJT5wgenDCkTaUx6Zrj1Q2iimJJvfmBxVfohq6JV3
 KRuT73HsZFe8BvzAP94E4NvEAfj/64WV4sydQWg/vYAybM063Uq5pzk4vFW7NjrmEvZ/
 50t5t+Za2yppQowM1pFiOzS0jpr6P79GK5bfQsTHWSIT4V3A8MoEmGaHbaiY2khODLfw
 y8lY8ocAFiEm7gA4aUwk2CU6ZOx3TV14KNo2U/FApGhXO0f36ues5vg/+0O316qmqONh
 IRS0GWsKzuuXvYY/Sz8SJ2sjn8R/nC2opct37DbVnmXXHZLrdYFK2c2Xx1QhDd/SQTrV
 bkig==
X-Gm-Message-State: AOJu0YzivhwrIczVfhJvCNPz06SncuEwKmt1wQ0nSdMAnbnMYEh0qNUz
 7HA7C1k3S7k06iIC1jAaPM0ghbBkteOc1vRPT4tgpFMJ63Ogt2frRavi
X-Gm-Gg: ASbGncv6Sd+I+h+8bLjZuLyAUp12KoyNjLi5AYse19I2pjr6vPkkuW8AYNHvaPVwCVA
 svI9KO40gbaRWfElo5ImbDaP6iQxg37pT/dFnb2QJPqnC7lkeU3ivc6Ray+fzSUzmkeygXozUpr
 lO6EejYTgOajLrRTHam09jD8FvyX3iWpoegLqiBTss0NPIwOl/fBscosIa0k7KhDUU7F3V3l6fw
 ihnxZjACVdSoNRhkQJ84QJu9Y5BzQgDh7rrS3JssJZHNsVfomqQST0jPBtCzDnYPonBR9p8PWHq
 ScsWT7TpFlp9ooBVQaUUqFEMcOiWhncqvg9ynKp93A0gi8TZgj9b1yAgjOUmBO7K1kI/icLmseK
 OGTgLt3KCMmYD5F3kn13eG0g8AmrFgwMfqOIgb7uvLASkdow99YEOtUQ64Q9Uz0SDJnY=
X-Google-Smtp-Source: AGHT+IGpTrjfqaTHgLcCLsQCtZHA9El8Nls2neMHYylS+9ZWNLkW6HwS5nJKpzuK/j8dl7RkHFN0Hg==
X-Received: by 2002:a05:6512:e9e:b0:553:cf72:45d3 with SMTP id
 2adb3069b0e04-55a038e3f24mr2907357e87.3.1752480275420; 
 Mon, 14 Jul 2025 01:04:35 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b6c08esm1864385e87.187.2025.07.14.01.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 01:04:34 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 14 Jul 2025 10:04:00 +0200
Subject: [PATCH 2/5] dt-bindings: display: sitronix,st7571: add optional
 inverted property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-st7571-format-v1-2-a27e5112baff@gmail.com>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
In-Reply-To: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=9qhFVbTDQlUnWoyhzXl4tt9pDTAcoj21SaN2FI/eQiY=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBodLn7NMEAsj6msiz2IRTvAEkdMP27Gj8qLURkl
 ACWp3Vk2VSJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaHS5+wAKCRCIgE5vWV1S
 MmZ+EACMoSu6V685oHN6Scy6hlmCAkFKaSHbE/4zNrMLDOe0PNepbZKaR20D7gEV2p7fMX270Oi
 PXA+Zj6UEVasO4VzQbJv/eAVjEnM25LD9AsFViFfvP9h37HdKNFF2g8JcCY73HMfCMCMh559/hz
 9sZ3IqB8ulTbg+zci0zcUUJIiFKwVD/e0CII7AfO5ovNafX2GuzomyDnDBaj0Zt8FAAhwAF04wB
 wiEcoHTjS5/WTDnYcEyH8VhrVGvFJWTE/HWiB7ZhYOIfwXT2ky4jpS+W1a7CeO4R1LLwsq0Flux
 qfpivCs+PfsFZhe/KlMZ88/T5Mqz9Y3pc4o2R0buPVXKFDpLQKYMoei8zswKnjUgQ/GsKX1RTVC
 UJh9G5VYW8+8LfUMmANwx5eGWaBkf95qlLcuAgo89fUt6JrvqoGi9pT6M1okrEe803/he27Ertl
 V0JaZssLndLQgMYP5ZdCyP2jbZJsNhIJsL4fQjH0CmlrX7Y7xVqnodGKoGy58Ezva4jLOC/UFZH
 F1Lvy/lnnkIyD0PRQVMWi2iWuRjQmaDOUR1Gi+xAkvdnRQHzv6QfzUxLX5MgY/c97nX012qAwer
 d7WQkgmbbkZQr81mx1cjXLZ/ldBWjQXafEll6jztX9eVhmXhoRIAtf+iaOLFOllqQYRVprrQVn1
 7m0IdCAgyAm6dJg==
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

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/devicetree/bindings/display/sitronix,st7571.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
index 4fea782fccd701f5095a08290c13722a12a58b52..065d61b718dc92e04419056b1e2d73fd0b2cb345 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
@@ -28,6 +28,11 @@ properties:
     description:
       Display supports 4-level grayscale.
 
+  sitronix,inverted:
+    type: boolean
+    description: |
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
   reset-gpios: true
   width-mm: true
   height-mm: true

-- 
2.49.0

