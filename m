Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0F44E6874
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 19:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3351910E204;
	Thu, 24 Mar 2022 18:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42B710E193
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 18:13:57 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id i11so5616003plr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 11:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HHPqncxkqirx9UajzpUXlOLkpGtduK2UPDvTzwuMyCs=;
 b=iOtzSX+H9de688dVz/qNPuCWiXSV1D4QI1YkVp7rX5G38Jzz3geU3YB9dCZe/FpLqJ
 zKEU5m8vdHwXvx+Ns0LzB5WzUJgIHmwybUdgFyB3SM/biVNEYi2xmOUy5x1R3+e5bepU
 Brk9DElK3dy4e6ZO2mzmOJl3nYzF8D/3yF35M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HHPqncxkqirx9UajzpUXlOLkpGtduK2UPDvTzwuMyCs=;
 b=kMNBfTyKO24vvSf3+7E4lErpJ2+fZRepe3JBoNIxdeODarI0WY9K4YgMQFErOHYQX2
 ZZ4AHFUxNZvm+Kxu0VXAkOwE4HOYLFRftmHt3tx0+t5JXjX7ZdJaUW1+JIsOKkCZeeoY
 fAl9jnv3LxuBfboha9fG8pqmtMcTCy960FXPRDGALDScNCSVc9bHk2Bmjc/RqyQVGMct
 futVDvHaipHsEUhlkLzV6f5nLu9ZNz8jtFzr3TPb78ItenoDo773RImB1N0eGSD+M3gV
 uFUKyGN1JTdRG4mytefIX7xiqtPReowiLeLg2buIAFmN1LLUO4SBCVtcztNmWZFvvOBX
 3XCQ==
X-Gm-Message-State: AOAM530lBCG5hHRtPCkI33TCs7BMwodzrxC/SdsuNyGdpKtkdrGq+X9b
 LH049t34rdBeStdLlTdUbSlB+g==
X-Google-Smtp-Source: ABdhPJxewwppL8AGwnT6G0Q+WCq1TVWp2U7l0C+hU5Wl0eQUF98UycSVVL480aPn/bAE4kIdTdySnA==
X-Received: by 2002:a17:90a:9294:b0:1b9:48e9:a030 with SMTP id
 n20-20020a17090a929400b001b948e9a030mr19671566pjo.200.1648145637432; 
 Thu, 24 Mar 2022 11:13:57 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:690f:642:3ebe:c89d])
 by smtp.gmail.com with UTF8SMTPSA id
 w6-20020a17090a460600b001bf355e964fsm9913554pjg.0.2022.03.24.11.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 11:13:57 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: display: simple: Add AUO B133UAN01 panel
Date: Thu, 24 Mar 2022 11:13:51 -0700
Message-Id: <20220324111335.1.I1131d63cbefbfa9ff107a284e2e51f880c5bf7c8@changeid>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
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
Cc: devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding for the AUO B133UAN01 panel. It is 13.3" TFT LCD panel
with WUXGA (1920x1200) resolution.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1eb9dd4f8f58..e5cd45c81d02 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -49,6 +49,8 @@ properties:
       - auo,b133han05
         # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
       - auo,b133htn01
+        # AU Optronics Corporation 13.3" WUXGA (1920x1200) color TFT-LCD panel
+      - auo,b133uan01
         # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
       - auo,b133xtn01
         # AU Optronics Corporation 14.0" FHD (1920x1080) color TFT-LCD panel
-- 
2.35.1.1021.g381101b075-goog

