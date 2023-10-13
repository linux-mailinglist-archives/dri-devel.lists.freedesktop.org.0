Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A337C8D23
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 20:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FD410E630;
	Fri, 13 Oct 2023 18:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304B610E62D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 18:39:27 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3af5fda8f6fso1475553b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697222366; x=1697827166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1wTDexLYvM5LHX90F6rxGOJ9LXZcSYzdsLh84YqciA=;
 b=YowubsORr/PK5gY/LtB1VtLpv7DuryfWWBv5bPfXNuc7Cc5oRfV7K+/yNAK1eMXYxL
 mg0F6oxBzx51RQ/TTabCuWEbq3ekHjsLg8gR+YIpRc9kwABX5SPNJOBKsbbWetgfdDsQ
 +j6Xwt40m5NLgbNys5V4a9PvJZ3oKdPFuY2D3sPfaI1h2zmgV9yt0vB2tZhnrqUwAFIT
 7+6KN48thdjFkdD6bULtXeJkzhkIgEwXysSADIL5HuJfp225ocBmN7ov4+NaFbZAwDqQ
 /2nXJVAsO7WSkkmfcw17W1lXNMs/zvD0yugCdNCbivhSmFrUAouFh0CYJv678srgFN3X
 0+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697222366; x=1697827166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1wTDexLYvM5LHX90F6rxGOJ9LXZcSYzdsLh84YqciA=;
 b=EQCYFeuPH79HDz4f9Z3A7tUoH2yyvz0rxty/DlvSIZT2SeomGh5nef0No5AddwJga+
 pZqKRfssnscBwhM0r3D+TynHpHG9yjLMgJB0hAxTTRAnHgmuDvunEoKrqB12bdgNsuLe
 c9XCvpDF3o1TNOEpOc+maViIsiWuqeqYfzQwDqe0VySPzcLEnp29hXSf1PwhCbrQ2c37
 eqmPoC9yEXLthsAwBxWbCqNRXkS+FLBD5GKzSopUoC8yfSXJ5P8W984NkyPQjw+0iAnS
 spy6Xd8Nbn/z/HRGAHnd6hC9WwuGAcZy3yS8ROYuRn/PlY/X0X/yU70aBAqHWv2H4TjM
 3KQg==
X-Gm-Message-State: AOJu0Yz5ZN4J6zkwGJt+z+JGUeRIRDjYiBeGU3Rcu1dKMTjrAr+Y8s7Z
 6uMjClIpYhUwymRV8rbt3v4=
X-Google-Smtp-Source: AGHT+IHdkztdQit8wuetjEnY18VnhEAH1GKxj23Osp/28dvXk64uW/pxMEBq7iAjlCbL8hSHMTdQhw==
X-Received: by 2002:a05:6808:1994:b0:3a7:366f:3b01 with SMTP id
 bj20-20020a056808199400b003a7366f3b01mr37101888oib.33.1697222366461; 
 Fri, 13 Oct 2023 11:39:26 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 bx19-20020a0568081b1300b003afe584ed4fsm842159oib.42.2023.10.13.11.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 11:39:26 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 2/5] dt-bindings: panel: Add Powkiddy RGB30 panel compatible
Date: Fri, 13 Oct 2023 13:39:15 -0500
Message-Id: <20231013183918.225666-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013183918.225666-1-macroalpha82@gmail.com>
References: <20231013183918.225666-1-macroalpha82@gmail.com>
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
Cc: megous@megous.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kernel@puri.sm, sam@ravnborg.org,
 neil.armstrong@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, jagan@edgeble.ai, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RGB30 panel is a 4 inch 720x720 MIPI-DSI LCD panel. It
appears to be based on the ST7703 LCD controller (this is assumed from
the init sequence similarity between this and other displays). Powkiddy
would not share the part number or name for the display from the bill
of materials and there were no obvious external markings, so name the
panel for the device (Powkiddy RGB30).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
index 5ea74426b1d5..97cccd8a8479 100644
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
@@ -22,6 +22,8 @@ properties:
     enum:
       # Anberic RG353V-V2 5.0" 640x480 TFT LCD panel
       - anbernic,rg353v-panel-v2
+      # Powkiddy RGB30 3.0" 720x720 TFT LCD panel
+      - powkiddy,rgb30-panel
       # Rocktech JH057N00900 5.5" 720x1440 TFT LCD panel
       - rocktech,jh057n00900
       # Xingbangda XBD599 5.99" 720x1440 TFT LCD panel
-- 
2.34.1

