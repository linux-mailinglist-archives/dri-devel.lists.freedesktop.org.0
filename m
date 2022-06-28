Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B090055BF53
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 10:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2645D11BDCA;
	Tue, 28 Jun 2022 08:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FE711BDC7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 08:03:11 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so15035351pjl.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 01:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hvMf3PepUugPqVKhQRoUgt1ly6hwpig91v9ZXdNJXbs=;
 b=Fjmt0M1UVl7saO28IVQSKUeNq7CVK61mTdx2OLRFjYrnF46LcWL4yT9FNXKBWozPZd
 ipW3hlY0RkuzbxFOkVlj84dyWzAquEl3wE2OsbYQxAB6CBOLjB1aMKKZ+IhoPBbuVDi+
 ZpquvlsEvBTnZtGsVMWTHPsPNp6Hz/U/N7GG6QbeokVzGQZfht5T0yScWeykWC7UJXnX
 NJ7gJuxTy/rY7WfrN97E9TPRXkpZHEUOa38ptMjvQMQTxO0qLwBIF/6UaYSXQPmYtqwH
 GEZsLxh2SYX4QSZBd1/S7N9PCGmvJyYhPHn+qgA13r7ZEvJ+0fRhj5MF50pcLtK/NR/s
 fHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hvMf3PepUugPqVKhQRoUgt1ly6hwpig91v9ZXdNJXbs=;
 b=Fa8nhzTIHQ48xWnUadH+KhVChGEKcuLbmOeuLXeSVIBXz+ie2GLwyARgFZr7TjTU1v
 4Ds8YxcczEYnHugIgGNeCpUyaXxd8GLV+l/+9mFyuXu1b3/dHclg4+LcIKcD8JwoLXgd
 58K+/BWm8S775E1Uj9KKAA4zGSHe5uT/Mv1ZCSGHMXs4kMd6JPSHF+nrC5yjzh6WYToG
 fKwPAXjZ0bz467ABLfHkfl3GPjre0XEVpsY4BAdhUs3npN/zK+hiQdnCLxSH8X93m3Fl
 HDh+K2wC/DW3AkXJf8lXQ9txK46eSTyIqzTO0mE9WnIO/Ln+0Mdw+J2C25UINiLSTSTJ
 643g==
X-Gm-Message-State: AJIora/qKXkRAP8aSkwVf3hCYC1Lh7j3AttyL9WcEqcuZqex4hbT0coL
 n6iuqMIvaH0YmITZp+HzfCyiLLBGN4lYyg==
X-Google-Smtp-Source: AGRyM1vRXYXW+HKwEgrbxihFSnoNxPLYaNicpTq544RfbChi0sKL9blFN20gnk7oKaJwSUGtvmRUNw==
X-Received: by 2002:a17:902:aa8a:b0:16a:1ea5:d417 with SMTP id
 d10-20020a170902aa8a00b0016a1ea5d417mr3880598plr.4.1656403391046; 
 Tue, 28 Jun 2022 01:03:11 -0700 (PDT)
Received: from chrome.huaqin.com ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a170902f7c500b00163bfaf0b17sm5249034plw.233.2022.06.28.01.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 01:03:10 -0700 (PDT)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: display: simple: Add InnoLux n140hca-eac
 panel
Date: Tue, 28 Jun 2022 16:03:03 +0800
Message-Id: <20220628080303.2143291-1-rexnie3@gmail.com>
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

