Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFE55BFA0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 10:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBC111B8B3;
	Tue, 28 Jun 2022 08:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6362011B8AE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 08:54:56 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id v126so7399515pgv.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WC8mCwxcFPmaNTe2dlW1gLIl9Or1Z5lRzz4HZt059cU=;
 b=KQaVeMvIK6tuqnHSMdPgFQMzEqe69xzapzWGFSkXXSzGpslkQZiKvpkndmQmbvsQcF
 3eXYDi6vX572wjK1KHg1/m0lgsL0BzcS+4uH0x/bLsxCuBZ0gndhW9kk5MVotcXKys3i
 2883cqdlYnIiUEZAG9lnMss+hKV11KcDexX/q8Ck+9JV6hztDT62MxRvojYqjflEzzhm
 eHcphQSn19g19YEIhpvYD3KwbPVQ6+oOqM+oTYDLgrXk7uYO4/1y81riptgqSYbbFpHX
 0bnzAlRt0K6NiVw/GrbUWMXmhakslOMse/ynaMzUje6+r4G45B6SoUDy7JC+HjB3lEbn
 xIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WC8mCwxcFPmaNTe2dlW1gLIl9Or1Z5lRzz4HZt059cU=;
 b=aBMiIjCUSswKIbu8RDYejnBv/dkz3CTsc/eejFT6ag3vwy+CLD0eK5LryoCFdbH9LW
 t6GDOR6eBdYFWnhyKt07KednWwPhM6jE6pKJsSKKO6TDCY/nkYYV+vY+35Z6CK3H5GMZ
 MbVaqB6ZFBN9cxZ07fzr048orX65xSm+nwXGKN+L7Hyq11uIm7cvozm2mB4diyaHKo+I
 kXqRIkwGB2VpIBVCE2Vn/3zq/jZD/0evGfBwetdNGa9J8xtX6gAQZ0oa6mNy1OdYNrAz
 L7aMuzkD6C2jjcN2inioTBs1J8pruynorUN7W3JIN2hV1fAC5XAmV0rhUY/rZLWUKPQi
 MVAA==
X-Gm-Message-State: AJIora8WM90t05mmq/bfHlWRzG+5vAPlzSWF9v4B18EYgK9kP6tLAn35
 piSTe3fStFd8GhHS5yhrT4k=
X-Google-Smtp-Source: AGRyM1uiulusMvDPUmm/nYRbHm8DSfvspJVNvlbmGIdRAexX4Kc34/cplPHlah8MfxNGVhbXo74LZQ==
X-Received: by 2002:a63:f413:0:b0:40d:ba87:53f8 with SMTP id
 g19-20020a63f413000000b0040dba8753f8mr14812732pgi.193.1656406496018; 
 Tue, 28 Jun 2022 01:54:56 -0700 (PDT)
Received: from chrome.huaqin.com ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a17090a0ac900b001e095a5477bsm11120939pje.33.2022.06.28.01.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 01:54:55 -0700 (PDT)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: display: simple: Add InnoLux n140hca-eac
 panel
Date: Tue, 28 Jun 2022 16:54:48 +0800
Message-Id: <20220628085448.2147440-1-rexnie3@gmail.com>
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

