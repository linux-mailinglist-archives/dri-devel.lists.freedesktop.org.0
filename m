Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7756F8C71ED
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 09:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FAD10E656;
	Thu, 16 May 2024 07:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="LRhBr3wy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5175710E71B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:21:17 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6f6765226d0so1455152b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715844077; x=1716448877; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5g5tP1D+SIYc5SRjdnjEEwEC1xRLYHryw0XEezpzds8=;
 b=LRhBr3wyeDDhhgcPZAOvGlnF77stXx0Ix22nAr2dmamPNMR0yiBNCm9hg3UAZSRHfA
 vFIpt+n3GUgvSc6o3yyj/h+hPkd86cTGs/5K91E6JEQSHcBRD9kWXubOq2F2GMx5B/nF
 dnwcnEMfTY8wmao47N2f9DRENaRb6nW/KWaA9E3tGjuNRTGHqmVe76yo8yYVfJyT9G1j
 PBJO7zdkDdKLE9h5roe+4HdojtYM4VenycyfJZVcXMox6ScEGGBKH+MgE0wXRNqTMlef
 llgW5vxEHwYZlqGoLRzOSB5RoXg4bhoXd0kV8O75BlDh+pXgU1OJwPx7XCJhEjRwGohG
 7xRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715844077; x=1716448877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5g5tP1D+SIYc5SRjdnjEEwEC1xRLYHryw0XEezpzds8=;
 b=numdTmU/7eTipa7c0pTV1k7wE+ZTS3B/3BXO2CNvnAjcFNtTCRXjcstdlonhS2tAxa
 z/bvjVAUfKVgIhmHym4sMASc1BE0XS4DYvFTS7AgRVIVv6vaCfSkIbbSuVVzcQiAZ+OY
 +qlmYvR5EvjDxH5cvdTKVxilBUh+fGnwkPV56eabMmRgwueZsKrRMcc+SJh8TOqpqJhD
 m0b5CfX1FQ8ZCZ8e7KvvQtVjT6D02sofg2MtJ+efftDOBa4HV3r2NcMT/6nOOhwEBvsl
 gqBrIbWVpYJcWgmZCjvR7Rzo/eFa9Sl9BF0dOcUY9RP9UPajzwPoXmasEjA7sxHI2ioj
 vi+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg4CIGBF+2YZYHcTbiEGWUn8+YsA3yxEVJ04/Ex0cYU+dHxHe4TAZxlI062kVTku6IqEVy1kXgWV+o2EborpTavu4cKfKPwLx/pFfHmZ8Q
X-Gm-Message-State: AOJu0Yy6ecFYhUHof9dPSQs0b7yowHjdOvtOFgm4gM8hKWCjeqNbjT0T
 U5J9XAhRoyb6kBuK7wHWBvKk5SqZD994QIAqLpBOYsLTTPeoTxT1rIOP8lgqM5w=
X-Google-Smtp-Source: AGHT+IHO0Ddngi87fvP6nYg6LzuIKcusAeKF4y/vtQNG4co+mekbmo3BMqBJm/kGqfjv37tCDkT3vw==
X-Received: by 2002:a05:6a00:17a0:b0:6ed:d5f5:869 with SMTP id
 d2e1a72fcca58-6f4e02a7744mr23110373b3a.3.1715844076663; 
 Thu, 16 May 2024 00:21:16 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a663a3sm12318724b3a.41.2024.05.16.00.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 00:21:16 -0700 (PDT)
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
Subject: [PATCH v8 3/6] dt-bindings: display: panel: Add compatible for BOE
 nv110wum-l60
Date: Thu, 16 May 2024 15:20:36 +0800
Message-Id: <20240516072039.1287065-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
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
Chage since V8:

- No change.

V7: https://lore.kernel.org/all/20240515014643.2715010-5-yangcong5@huaqin.corp-partner.google.com

Chage since V7:

- No change.

V6: https://lore.kernel.org/all/20240511021326.288728-5-yangcong5@huaqin.corp-partner.google.com

Chage since V6:

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

