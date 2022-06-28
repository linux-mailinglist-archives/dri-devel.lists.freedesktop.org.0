Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E11955BFAC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 11:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E98812A9E9;
	Tue, 28 Jun 2022 09:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A20F12A9EB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 09:01:42 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 i8-20020a17090aee8800b001ecc929d14dso11935822pjz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WC8mCwxcFPmaNTe2dlW1gLIl9Or1Z5lRzz4HZt059cU=;
 b=cHOv2tnOzN5DjBKRhNofHljKi7umJ5Xm/g76iK9eSCTRrXh7h9QUV4ZpaSQIy4iHMK
 gFauxi1NO/RZ/dqrZc0/7BXp2I4fI0FaxBcI4y0ixI74MDF8ooboITcKkadRq9sdUJaN
 SYJBcK4flKPKxECgN0jMIcz3BRODURWZVmF+eZBzHQSF3vMAn4jxIxVDtV5MPs3lhBlo
 /a0ZrY57Bl0+7gnWoQOK00/dlcNvCisyHckyR6/13P5V+VrXn/GEE2K0CyINlA86oImM
 jElfY+wwNCz+fuK9kCWtHz8IFiYuDmYJq1IguwhS0ItGdqaww3ZnvoF6zOlhFrBa8BFk
 Ttgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WC8mCwxcFPmaNTe2dlW1gLIl9Or1Z5lRzz4HZt059cU=;
 b=p6egip69cn1hjLrUMeMqP96mredd0DQtlVAim0l/TqnrLlS8duNYobS0gMlO5z716+
 EiHp+x0iH2ZljEmfaEmCY2NX537bgd8g0FnyUo0kGRyH3RKPAqbpVfGlnIMGT3KApUGl
 y4l6tklmWjtkZw1426N98hmky+lUgcDALaMXcfnEduxs4PdCv3B3nDKe+zmC6XCinoVK
 fjRvXZI69kDeOsPK8wH0kHiCnLOKZvei2hedwWV9mq/x0VzEHtNHrLQJU50apc+pp2me
 wbsjp3Irl6zm2570lwi3N+NlG0UbsHyASs0XV1n8+V6moY/ymsRIkb2moXgq5hI/QlA8
 cOqA==
X-Gm-Message-State: AJIora9ZsbdwhJAeUcFSptwFUzNVTyNsxtEs8YdJNOLEZeSNJBywVor2
 bQ28ZpJOLrtBOW/k4rRtCHI=
X-Google-Smtp-Source: AGRyM1uu7K7ZqUZpUVxaDaTHYPHo2j0dvxZYfU0UvSOI3CXJaRDKIP0kRZiYgo66dZ/5mvWwJIsEXA==
X-Received: by 2002:a17:902:ea04:b0:16a:1f33:cb0d with SMTP id
 s4-20020a170902ea0400b0016a1f33cb0dmr3985871plg.103.1656406902005; 
 Tue, 28 Jun 2022 02:01:42 -0700 (PDT)
Received: from chrome.huaqin.com ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a17090aaf8600b001eee7950428sm3163530pjq.44.2022.06.28.02.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 02:01:41 -0700 (PDT)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] dt-bindings: display: simple: Add InnoLux n140hca-eac
 panel
Date: Tue, 28 Jun 2022 17:01:17 +0800
Message-Id: <20220628090117.2148016-1-rexnie3@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, spanda@codeaurora.org, robh+dt@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Rex Nie <rexnie3@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for InnoLux n140hca-eac display panel. It is a 14" eDP panel
with 1920x1080 display resolution.

Signed-off-by: Rex Nie <rexnie3@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index a5568d1dc272..51e573615aab 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -186,6 +186,8 @@ properties:
       - innolux,n116bge
         # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel
       - innolux,n125hce-gn1
+        # InnoLux 14" FHD (1920x1080) eDP TFT LCD panel
+      - innolux,n140hca-eac
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
-- 
2.25.1

