Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C818C2EE1
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 04:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33ECD10E316;
	Sat, 11 May 2024 02:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="j7k51Bi0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A6C10E316
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 02:13:51 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-5e4f79007ffso1811456a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 19:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715393630; x=1715998430; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQEZxsQcXbFNRud/9tqyFt4L75N7/HmoYq1WCcfvWzY=;
 b=j7k51Bi0a1ZcBRJrU+1wjgqIOZ/p/Otz+0unGQj0F4GT8hCk4ukINS8waqTNgXWZTG
 lXHiKPXJ/VdZn63QbRaV5feP/3d73pXcRDxEqHQgKuKptPVlqy7yy35FGv5n/ClOtHrE
 wpgSJTG6o2dbpgZDcMJ+PkeHCUAbyy8oZ3RM0nM0WcOn1RLEqLdxrVAsRsmuwgUFewa+
 1SW1pw6XKgkAY684ggSNp/QL/UHV5G5U0yraDqdUt6wSoi3ofMjfu1hnWbJQSnV2e6XI
 naLYuUMgN/GdDhjB/85I6yxl4qzGV8OdfGBCMWN+H5gE5OFjMFE97/PRcxG8sSA3Sjjb
 WIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715393630; x=1715998430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQEZxsQcXbFNRud/9tqyFt4L75N7/HmoYq1WCcfvWzY=;
 b=eRQSQHvu4AMkr2oUPztsYFEOg7XjZlDXG5P2Wj/h8srKjz1Iq3frEi53a2EA2t9eb7
 pVzOSt+C5GjBEihJh2qSjaTghRqPWk4QJh35XGZagNwL15uXhcPsdrv4jHKewbS6GbIE
 dwCv7q7aSP7cjyQ/MSG8OLYgJSZKJtnMJ52qQ2Vc2y8W1HaOx3DZmZKx73AeQtS9UBsy
 G6DVc34yPKOBrNav90V+T1yqGb61/+jXWd/BpP8UK3LZCs5kK+elvJ/aUuB6Jvvlh+W1
 V+/aSZg/z5qjHRX7irzqOI9FK6TGaGf1uTo6s96hbj0QpuX4bVnZBU0lZzDZXCaR2Iw8
 hb3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGLoCLW1ON1FtO2DwTTvUezmQ1Rcoq2+8FLDC+8nY0uANDPfsIQePf7r/ojdkW0t648UVMaIiqeBGa0NdRF1u6bpUt2GPN4UB5mrKXuX98
X-Gm-Message-State: AOJu0YwoTdMA5qYjuB5a9sWKCD+Esqpk6i9b1OzeZ+6uAwt08SzjcUwh
 6ddZKgwv1TLJQTxhpO01Kw6n+bYqBNQ3Vc4pG+RN3WBEeiu09uRK+mXXt3AgyJM=
X-Google-Smtp-Source: AGHT+IEEE3ACyk/EL6MmyTvESNdeNwSQRq5IWG++U8g1EgwnOiinICb44Nd5g4szui9OS+r/6cpMgQ==
X-Received: by 2002:a05:6a20:7fa5:b0:1ad:6c5:4ea1 with SMTP id
 adf61e73a8af0-1afde1b6fcbmr5902294637.41.1715393630666; 
 Fri, 10 May 2024 19:13:50 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a9d9acsm3680340b3a.90.2024.05.10.19.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 19:13:50 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 4/7] dt-bindings: display: panel: Add compatible for BOE
 nv110wum-l60
Date: Sat, 11 May 2024 10:13:23 +0800
Message-Id: <20240511021326.288728-5-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel with himax-hx83102
controller. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Chage since V5:

- No change.

V5: https://lore.kernel.org/all/20240509015207.3271370-5-yangcong5@huaqin.corp-partner.google.com

Chage since V5:

- No change.

V4: https://lore.kernel.org/all/20240507135234.1356855-5-yangcong5@huaqin.corp-partner.google.com

Chage since V4:

- No change.

V3: https://lore.kernel.org/all/20240424023010.2099949-5-yangcong5@huaqin.corp-partner.google.com

Chage since V3:

- Update commit message.

V2: https://lore.kernel.org/all/20240422090310.3311429-5-yangcong5@huaqin.corp-partner.google.com

---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index fc584b5088ff..baf8b053e375 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -16,6 +16,8 @@ properties:
   compatible:
     items:
       - enum:
+          # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
+          - boe,nv110wum-l60
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
       - const: himax,hx83102
-- 
2.25.1

