Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA38A3D82
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 17:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8474D10FCF4;
	Sat, 13 Apr 2024 15:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dcsBvO/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9A310FCF4
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Apr 2024 15:39:27 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a523524e5baso198628966b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Apr 2024 08:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713022766; x=1713627566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HNEWJOBlR0y7Hhtt6axRN9X/exAZdSvN2lHOcVrlbOk=;
 b=dcsBvO/Dkus3R9iIKM3DOxR71zKEhY0O4a5vnwwQgH5c3eu1D7zIYTdbuq2dAZUdeb
 +MzrGV+ypebND2KOiCGqD2JijGRts0WXhNX6ryaGrCeWKykTEgrNLrU+AZJg6RckQhna
 L7uFn65EFghUJAvYenH6wN9/99zBlSU5bxOG9+Q0NgpjzUSe7wHFdz/eHJX1mYpzN/rb
 mv4ulHaQOP3HOFhkRYGQG8V2zNgJxfUxzlicQSYe8FhPPsLcdJ4fMFCBXdN3PTXz73nJ
 e3B0XeywB6zjeRmtyi8J4X4dd1XhR5VA6WHBgBfYpnMLOZro6JbxDi6ih6OaiZzZFbqO
 rotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713022766; x=1713627566;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HNEWJOBlR0y7Hhtt6axRN9X/exAZdSvN2lHOcVrlbOk=;
 b=J4BM0uIsRKhKPVm74rwrkci44sVh3L2FuG3wSLthj2kxY8ciEOt7xk2xa3RKamGy0y
 Uv6QVrulZKSI9GJ5w69QAvtzBmoC7L/VMzAPFvuadsH5xxHl4LU/1gGqWRdrDqD6U+ra
 hlVNUV+BEXB18ONFX+y42TFQGjvS4g4IUVorXWQ3n+6NFC07MBRXYU9iWd68i82a9Iw+
 W7uo+1ev6M3xwxqpQfzHqlE3BnDcMjGgbGquNlYb8Xc+gt3JM2PEqL7qkmHWsatq350F
 zOLgIn3HI9BcB2RyI7kjxiVdmAu2CUShXSPJ6VvKeoU/ICFRShuh/mLXENcIU/otA5tA
 mqDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXptqfqzfgix1HoGcubsiqwEwlPMgVBtUaAdKg6oe/Ue3pODLCWSHkJrZe7Xt9UbZRUxeyrs5XlpVVCUgjwOSGNnYwo5EAAPFZDRavh60mZ
X-Gm-Message-State: AOJu0YxeVEiAsHoz+Z6Av3zSku70C8YaoYMbf5b3y6m9r1VWNVQb0AsA
 WOfcSAnd5zIMiRjCILn94tnOaFuj2bJk+ODL2tjbSBFguNC1K3+5
X-Google-Smtp-Source: AGHT+IHqgFh+uk15K0EwlCSK5KyFNaBttoC/3mMIKlGeivBdJuPR/0PC//p06HrA73var6K2Mhrrtg==
X-Received: by 2002:a17:906:34d1:b0:a52:2e08:207e with SMTP id
 h17-20020a17090634d100b00a522e08207emr3722414ejb.77.1713022765539; 
 Sat, 13 Apr 2024 08:39:25 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 cx10-20020a170906c80a00b00a51b5282837sm3131680ejb.15.2024.04.13.08.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Apr 2024 08:39:25 -0700 (PDT)
Message-ID: <521d4229-7490-4494-8191-cd5f3119249e@gmail.com>
Date: Sat, 13 Apr 2024 17:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 3/3] dt-bindings: display: add #sound-dai-cells property to
 rockchip inno hdmi
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, markyao0591@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <3a035c16-75b5-471d-aa9d-e91c2bb9f8d0@gmail.com>
Content-Language: en-US
In-Reply-To: <3a035c16-75b5-471d-aa9d-e91c2bb9f8d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

The Rockchip inno HDMI controller can take one I2S input and transmit it
over the HDMI output. Add #sound-dai-cells (= 0) to the binding for it.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../bindings/display/rockchip/rockchip,inno-hdmi.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index be78dcfa1c76..5b87b0f1963e 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -37,6 +37,9 @@ properties:
   power-domains:
     maxItems: 1

+  "#sound-dai-cells":
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

@@ -66,6 +69,7 @@ required:
   - ports

 allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
   - if:
       properties:
         compatible:
@@ -106,6 +110,7 @@ examples:
       clock-names = "pclk";
       pinctrl-names = "default";
       pinctrl-0 = <&hdmi_ctl>;
+      #sound-dai-cells = <0>;

       ports {
         #address-cells = <1>;
--
2.39.2

