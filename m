Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA5B48E8A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7648610E522;
	Mon,  8 Sep 2025 13:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lAOvUEo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B33510E521
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:04:27 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45dd5e24d16so29228455e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 06:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757336666; x=1757941466; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2GDdn26faX8+Rd19RRlHwI66hY8ZBEzdxwGwtCXn4n8=;
 b=lAOvUEo+3gLw8/Y/3CE0TWPGOnPJK4H3dVcayikc43EjonHcgKLUCE0h/XABY1ea/p
 jzSi5GCZxQ8a/YsS5KpWRObFBG0M7H7dt4dXYyjKWu3Wo+pOzoK5++nwviPlUp1dzotg
 r/utOqjul0s2LV6eGci8zimkZYog2Qh54J8+FXP0ObSuOsYlvimDP5z96IVRKC53qE6R
 q274D8QFs1cbNqM01RE0MmgAOQPlsRVBHg8E3OTfZlIwalVkveP99qOI0/pikbPTk7Fb
 cIJgyoZK4uC/FopBvo2UD7OBuoIO6QrVkJHhvQpsgz6avHJD23lTf/+QSoCyVpEg9ukO
 8x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757336666; x=1757941466;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2GDdn26faX8+Rd19RRlHwI66hY8ZBEzdxwGwtCXn4n8=;
 b=L/72KAR4Se7qxPyGDoZ4g7eGKJQqf+UCTwfq/VYrygWJR2XmIbQpeYzGX7lp672FH1
 fPbkdPvv4JD/R1b4QhlCirqxiq8BYIpH3f5rvrN6mKBzqnsW4LgrG8wfQ2b47DVxlaIO
 9BpFXSYxSWtQGyoQ/71Naaa0J0VVapWN9ujQZna0fRBhddqajfu/feTqUp0dvEtVgkl5
 mdZYtZWVHHPO8LBXckIMZ/UDAGLHmV7AUOm3EE7dxLLzKHiyLwG1/oiiY/rhix7yr0Es
 GD5vd3ibCGyetmcWTKcbfaRlrwcfGk4Adl7H4Ti09vQ3xSoKVy+Q8IO2SCFWPgQnDzHl
 icgQ==
X-Gm-Message-State: AOJu0YxSUVCELlcm0gqe9mFAT8qUQwzixzdKDItZkeov10YM2lKWbqc1
 Q1a+xXXNsHj2P1nQ5TvzY5HKQy1BC36ez8IZRgvZUayVk0yOY3A2t/nZGtxyGYy/Mzo=
X-Gm-Gg: ASbGncsW1ybYM2pIwLW8F745Ex/Xs1h+LuEy5hkJ0rrzeDsmrcHXM9wHloWA3sssmhY
 l3uxuUJhSdlxEk4lLzMnevlHA+PJ5qME2RJPd5jWjdxNHhDP0c94xR5xY99XAWM/YqjI7/gDWmH
 rc0PtcBIvNBtzs1IV/3siDoGkeeiu6yaHFehhIUf3StGLXF1+qEi6FXJ1VSLF2EDQ3M6MfIDo2r
 uKJWkR5g4XPrTYOIPCRYuTuAHuh0tVyYveiXUpNhw9zJhO4WPbymqoJd47Z8Xpkqcm43WZrF4OJ
 kp9ofgrFlGQMDZtKnirNG1RdzfwN3r+9B/JHYj5Fd6JiK4+1dy44BwcU+2Y6Ie6OkjCWQ71nnq3
 ORSWxTYMN4CSovDDW9Kmzpk2VhdzGajYPKyaHOGk2o3RaS1xHKF/KNg==
X-Google-Smtp-Source: AGHT+IE+QQMsvXfniwarXtFZkCcmmT2rZk6Fee10DBHIU433hV2b4Xz5UNo3Gvh1D6s/nDMeM1UWiQ==
X-Received: by 2002:a05:600c:4f03:b0:45d:e54b:fa29 with SMTP id
 5b1f17b1804b1-45de8e21be6mr18156375e9.14.1757336665980; 
 Mon, 08 Sep 2025 06:04:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 06:04:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 08 Sep 2025 15:04:18 +0200
Subject: [PATCH v3 1/5] dt-bindings: display: bridge: simple: document the
 Realtek RTD2171 DP-to-HDMI bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-topic-x1e80100-hdmi-v3-1-c53b0f2bc2fb@linaro.org>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=z7PAuGtYNvNlORz36aPmSnF79TimixozQax/x4u5xJA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRV0EWZ3GTngV+VZoqNOfxTMbRfZ7L5uMzyt+BQ
 Gcxw7xWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVQAKCRB33NvayMhJ0bWGD/
 9FmFWdexA2fU+CtWIWKbFIwMNtPEpiwf9clzEvPTLk1asoldTXFdDdKzIqNt2UImqiqUFDoOcmXw9t
 gIsk4GdSeV+bFCJgNSDKS+ThVbkQ27MBqv1iG8vZLattjMV4QG6Gc3XTPr5CDWOzg1p4BcXzKz5m5T
 Z73ct5hdeSi9ZQEaoehnuS3RC2+0P1MwQtKOR9mvUb/Nv6PcNjr6QR7ITS6hNczvmuPJQlF7iWuW5p
 Wu+KIBDIiMOwtM9ShXzTLo5gRbY9Q3VsC/LXusa6s2qolctz4pQLoiE61Gn8RxbMpQA2Gl5DPwrloU
 0Nu1bbUVlgKrGwSEQ7YN/MqzWV0nN/8su7VChcF26g6yhxcTfibRYw7O3+bOzob6IAQz2JMco8dLTS
 knda27GBDE3ODLhBmsMBvfdPcDIVrdunRQzXUY0wbp0lPiI2FguqNxUUQHEEIu+vWyC4uEEYjDhw0W
 3deHkxjR5FZdpZNuKxBCkVSMhXGiZ7NBe/eY4LP62g6fuCjtLqkMA9F/CCq3RlV1scYO9UMI/a1RMW
 0JaH5uUXxE91HoAeVxZAv+v85t7ibs02J9/7oR+FAcLYp51VBgFuhV4TEEn+4jHhKJLKU/pKJaa9jj
 4Ozwu1O+JQcG7aMdmLl9jqU/yt1XqxL0uKfgeLrHYxygloky0Zp2auM7SE1A==
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

The Realtek RTD2171 chipset is a transparent DisplayPort 1.4 to
HDMI 2.0 bridge.

This chipset is usually found in USB-C To HDMI Adapters and Docks,
or laptops to provide HDMI display output.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 421f99ca42d9b75ba1963493d36fc89fa9d8252c..9ef587d4650602699efac634c5466eb2e8aafecd 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -29,6 +29,7 @@ properties:
           - adi,adv7123
           - dumb-vga-dac
           - radxa,ra620
+          - realtek,rtd2171
           - ti,opa362
           - ti,ths8134
           - ti,ths8135

-- 
2.34.1

