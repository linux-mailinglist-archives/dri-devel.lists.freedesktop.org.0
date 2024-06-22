Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82809136E2
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 01:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C94010E518;
	Sat, 22 Jun 2024 23:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j75eXl17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AF810E504;
 Sat, 22 Jun 2024 23:25:58 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4247f36f689so21939435e9.1; 
 Sat, 22 Jun 2024 16:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719098756; x=1719703556; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MWHAXFFmaSZgvBXZR/Mxp9Pkz4SLmkvmM+jATo6r8UE=;
 b=j75eXl17FykEXjETtteaB4eku97TbZ7yElQfDhFmgPoer79mypAHmrS7oiZ9n8NoLC
 HKmmFMLcGn14OR4DF6AZeq8IixOXRYFPsX6IdwIfJcs+OqsS5INAdtz96/Xfx/1un+vW
 9IZ8Uu/9TN6STdCqLCZo93D/5xWqXKKGUtmI6yVCOcja3a1Z8Tj7kMPGCYuPUhm+k3G0
 6rB8aiEvdp1OC3pOYkHuRZ2F28F9JXZ7kDq+mKD4ei5H429f5/mZ7IGOkZaRMk0I2qjS
 gFqrK4sjmLrlSC84rXAkHM4BTaSuO9XpZ+m7YXSAC/N6UhLxRtcGHfq4ll9h/oJtJ6i/
 AVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719098756; x=1719703556;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MWHAXFFmaSZgvBXZR/Mxp9Pkz4SLmkvmM+jATo6r8UE=;
 b=JnO57E4iyl3MLIr81tt3V/IaukbSlMP4MeZ4UER3ID2LNtLuVsWqbCeh4mY6Ljovqs
 yMiQxeW40BQe5TmNybmLXH546tRN6tmj318BesnI7D9kYsUO3WLAVwes6L95KQNo+ZDr
 8IBKBT6l53dfJae76mFcbUr0adKM53yXEUql8cU3Xf/d/WdiOIRWlA+5gfA9YCmwzvwj
 i4AcZGjQ0Ao2lTwUN2Uk3zzMkAPx+1iMFg0pavIyqQtd+c+1aKxxcBqpdOZIqQv272DF
 WI5PwRPMJfkgmOkx67BU410MtiGqHXqRDtEmVHcMs0YhESqOm4nocC+kriwY1qKUx4Vm
 14CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTbRHJnrvNASsS+7t6USgkPvsjtr2P51eUDk5est1/FqlRybX2ziOuE9a+jLJ+jeyiHOhItlAsF5DthgqBRGcZ+TQQe2WrKtSNWfQCQ1DFGWcfBJytMcTFD0Z2uyVM8wHpVoKfi3dkJ62ASKJ6jNeA
X-Gm-Message-State: AOJu0YzW6dLnw7ahTI9ekuTO6aHrTw6w+zBSx8WOad30f+5N4ssSuFgi
 AliPV6EjmmJ3NWRGUQ9F4Wv1PC/dnneyoTWisHEnGYUQrQHXQ6FF
X-Google-Smtp-Source: AGHT+IFhTw2K1zlg7CzOin7QPXHZw+j792pc9HEAWcyNu9FkjvzuZaBZouhfEhzH1nRepX8KYSZ8Ag==
X-Received: by 2002:a05:600c:56cc:b0:421:7bed:5274 with SMTP id
 5b1f17b1804b1-4248b95d0edmr11914775e9.10.1719098756419; 
 Sat, 22 Jun 2024 16:25:56 -0700 (PDT)
Received: from [192.168.1.90]
 (20014C4E18129200DEAEE2020304A5A2.dsl.pool.telekom.hu.
 [2001:4c4e:1812:9200:deae:e202:304:a5a2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d2190desm120301875e9.48.2024.06.22.16.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 16:25:55 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 01:25:51 +0200
Subject: [PATCH 1/4] dt-bindings: display/msm: qcom, mdp5: Add msm8937
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v1-1-4ab560eb5bd9@gmail.com>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
In-Reply-To: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.14.0
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

Add the compatible for the MDP5 found on MSM8937.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index 91c774f106ce..e153f8d26e7a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,msm8226-mdp5
               - qcom,msm8916-mdp5
               - qcom,msm8917-mdp5
+              - qcom,msm8937-mdp5
               - qcom,msm8953-mdp5
               - qcom,msm8974-mdp5
               - qcom,msm8976-mdp5

-- 
2.45.2

