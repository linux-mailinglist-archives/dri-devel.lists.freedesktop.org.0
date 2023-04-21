Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5326EB9B5
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 16:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0856210E2F5;
	Sat, 22 Apr 2023 14:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A667810E252
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 15:43:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso54333875e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682091820; x=1684683820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TSTxzI2UL4iyV0x1qsc6iOOIHOUmxegUBSvF/ZUcYNk=;
 b=i40TYNbdQuSpdWFF00dXQx786i/9MjaamcmD6i7fvKTAN3xxgc2TJNs2u1oep1YUPB
 KzvgUjujGlJKhd6gCCnxGMP3GyH3L8F0lpfgRfzddPiVm+e+EuWXZLuXv2E2zdVJ4L8P
 vM1h1S1JpUDsWTlxclBSN439k8JqgZKD8j5WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682091820; x=1684683820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TSTxzI2UL4iyV0x1qsc6iOOIHOUmxegUBSvF/ZUcYNk=;
 b=Yr/cR1js3g9L1PZzvcbopTIchzvJKtPiesfX0doMD2XdqXEKluEQ1vNuT5lii+sRBg
 IKh5277xFEzFAR/u+eVgfWzXS9srW4Hc/Sd2c2WaRnDkKnB21ne7CoxqoXvwRFQx0OZc
 AjtUcMRRuDuJfKg6wIAFQO6m39J6A9MnIKKpR5+gtwc7nGqptcT2DG5u3o4nku3VvGTm
 Wb+W2MUhxQo953MqztKgtDSmjvHlLEFijpe8XPsHYgdBukRfrngvy1YnoEprO8NIYR0a
 bV7hkbeG2r5BIqh4aUSsbEIhLwDgLx5u1UK8axNMhTq2HPQs21GRwgKWhRwNtblB84o4
 KeFQ==
X-Gm-Message-State: AAQBX9fauKIS+62dQZummVTh8ERtnoMr/Ym87CwKosVw0XyylqvnTayc
 vYReXNJKlCeV6B9NSZIKPImqkQ==
X-Google-Smtp-Source: AKy350Z4srGvgKG10mBjRPzYdYpuxudfGWzNDz/qzD+shoAncKiAblL4cxYi1jVsAyWCzfyuso0tLg==
X-Received: by 2002:adf:e689:0:b0:2f9:805f:eecb with SMTP id
 r9-20020adfe689000000b002f9805feecbmr4493211wrm.3.1682091820245; 
 Fri, 21 Apr 2023 08:43:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.127.129])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5552000000b002e51195a3e2sm4651609wrw.79.2023.04.21.08.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 08:43:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: ili9805: add compatible string for Tianma
 TM041XDHG01
Date: Fri, 21 Apr 2023 17:43:07 +0200
Message-Id: <20230421154308.527128-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
References: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Apr 2023 14:45:29 +0000
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
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Trimarchi <michael@amarulasolutions.com>

Add Tianma TM041XDHG01 that utilizes an Ilitek ILI9805 controller chip,
so its compatible string should be added to ilitek,ili9805 file.

Add the compatible string for it.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../devicetree/bindings/display/panel/ilitek,ili9805.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
index 57c36cf22e4a..6065ef5ec385 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - giantplus,gpm1790a0
+          - tianma,tm041xdhg01
       - const: ilitek,ili9805
 
   avdd-supply: true
-- 
2.32.0

