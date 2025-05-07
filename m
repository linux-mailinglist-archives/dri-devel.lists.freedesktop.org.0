Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFD6AADBC0
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 11:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A1610E77F;
	Wed,  7 May 2025 09:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="goIYNMfU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5F810E77F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 09:43:44 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso58905585e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746611023; x=1747215823; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T3uAu3A4YUWMgeScFXrknXczo0EYOFrNx11xrsJM7O0=;
 b=goIYNMfUbm8NbOSBKayh5DsBPutfnZFV4ZEb3trqEeiVNliZTCmx0EB/oFaDHJRgVY
 DiR5nYRKi2Z4i8b9jFKmXaMLvBcrybAQ7h+Ht7aypl6dRjpnM7UQdVLlsHa6uHXcMVSI
 LtkcivXwmQhCTzXM0v1PKjXw2uK5giHMq8FUVa9CsSNoAAJEscUnQVqU757yVHb1Pj0q
 nLgxJu+zgpIXmJ2jERJMSiFGvHPh/H7Gn2Fkt2E2zUTkRO75lEDRUMKrAYYSzoIJe7yQ
 pim+aoRFiFkXPmo2Y3Id2uUsUDRmwSHUdq0JFGZmUrvYmcoSNqEvHMdD8Vjk3DJlopOX
 ABkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746611023; x=1747215823;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3uAu3A4YUWMgeScFXrknXczo0EYOFrNx11xrsJM7O0=;
 b=S6CEkeBQ+CDKygPHqOWhlW+Tq7I+hlUNjMz1n1G+RzQIz9tIoU96N7ga+90uDwLXVV
 HCPty7XdA0sqIA5cL8P8nqG8piaCD9q4YlSF2EOaJ+UkkmN0Dw1WSx6H2+Jx7NtYDz0F
 kWfYM5HXwhvU/1di7haR+d+VZIimulLXGVP/RVmZLdLFDlZ9AfsfLxm3/GH7LQ3zCcfA
 hQK6dYG+IEd0jgSdxF1cjK4WlYqTh9amZje309nIWNDNoeU+cDN3gTcJwsFWcf6deUvW
 G1WB/zeJfZN0urg0VbNdAHXcaPBSdLnz8co3GMit0KlWk8YJbo2nnNpUcJ2t3QbRnygo
 Q9eg==
X-Gm-Message-State: AOJu0Yyl2BA4fephG3piw6UHrR3sh5LCmLRzeSc0Zep1/SZeAyg7VaHQ
 nMR0Dvpf9U2BpbXdpcggN46SYmBy60vsMZ7tZM0gCHAlKfk1aa5Hjp4bsOCrb54=
X-Gm-Gg: ASbGncsiWYrvpZO7shzcR0rfKj1EBh3QqiJqplDZUNrNHRdQCrj1exKcA/Pbp4ziM9M
 YG4++/WNVP3r0DsdxCXuSxn4OClERTUhDGtU7c3ZZK9xCH7gNPFt1IKwrMISMHfnIEjnvUWeExa
 C8lcvMSodJNGezlCjQScBiPlyou2SkwhNNo6LA8qWV92dNeJhebquulXEnPyn8GAvSVR5JsSong
 JhrOn0xn2KvhK35ff1P41hOMp0kfzi3w/aR4Nr1Rmy6gTK5DxwdH/yLkJ79uQgTnWFh4IQrxvLy
 dXGGQKQRdvJ1yjLBSvo5oHBimVeUjppOqDNG2FQC7QpGurkdw2T9rbvjP6Pc/kSpWWVl79Lm
X-Google-Smtp-Source: AGHT+IHt+sBETV7AcQ5ySJc+/4bO8iXnJ5nEH5DDXoH0tDCQC0XyTyRIpVj5JbqDYI8TkrtgXdjG7w==
X-Received: by 2002:a05:600c:871b:b0:43c:f629:66f3 with SMTP id
 5b1f17b1804b1-441d44c0777mr23958755e9.18.1746611022563; 
 Wed, 07 May 2025 02:43:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d434670csm25360095e9.15.2025.05.07.02.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:43:42 -0700 (PDT)
From: neil.armstrong@linaro.org
Date: Wed, 07 May 2025 11:43:38 +0200
Subject: [PATCH 1/2] dt-bindings: display: visionox-rm69299: document new
 compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-topic-misc-shift6-panel-v1-1-64e8e98ff285@linaro.org>
References: <20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org>
In-Reply-To: <20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RZnJ7ALArB3S7wde3YqyxUd7RDqI3oA1G2B1Dr/Q+do=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoGytMfrICmXcZpVLyNNF1LWs5ATDo8J//hPClitGB
 mHXtpFCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaBsrTAAKCRB33NvayMhJ0UrKD/
 9uFikz4Cx5FmB5ZYZEfJ6npPS2W1zrA3S/+SRlRbwm3f18jGaw6S9RcdZpTPnnlfOAicY58Jy/R6Zu
 EZdzKqTnm9RNt3UoPl/u+l79YT8vSuGES6MCyF9Ltqsv4NZG/RFseAXblvGAvpNvHeaXkBFEltCYX7
 kOhHNLRfJFwW1LINdKGP/pp2jSye8bnxszQlY9jN4OL/ocGqcV09LJGxr9MXVkOQ4ZwSUWcfCGE/oq
 GbUgpGlCQI/qvOwBjtfmYzWA2Q65UQ5Z6v3a4PWjBoubHy1h1VJm6inI6sZZRkGTw+qugSk/kwlWc+
 BZMqztvkXK5sZQwTYa4mTWnA063UYWEVfjYNmtt2QEYDjUSbWH2m+ur3gBb2FJzBDSVYdYo6lubZSP
 UUwUTxD8HS9y3n0A4KoMikCn0EOot8w9aeft1i81TPwiym8fTewVanPU67J0ivbMLk0ATyZ0Jv41Vi
 vlZX83cCZPQQkn+a8ZuwMHmcnIP8uu2WW0oRcS+MaK6En/Q1UZORYIrqJ4k2AmSQJMfmzUdZVeM9Tk
 J4Iv5kxd2JHvRtJWXQe0lVdMtJCIEIwm8yMZvyTvF7S5D9iYU/04ELjqf6o2qawQcp7n+jToX5fzcR
 mwkh+kO2KrGUQcv9C222i4iM6uus6X24ewDl6SKrvoB0lg3DCYWMZDE2ANEw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

From: Caleb Connolly <caleb@connolly.tech>

Document a new compatible string for the second panel variant.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
index 30047a62fc111ff63cbbc275914ef8bb7cb4ffd6..f0a82f0ff79099cdccfd5c5001de0d319e94410f 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: visionox,rm69299-1080p-display
+    enum:
+      - visionox,rm69299-1080p-display
+      - visionox,rm69299-shift
 
   reg:
     maxItems: 1

-- 
2.34.1

