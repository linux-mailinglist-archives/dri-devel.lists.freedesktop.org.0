Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F38A3D80
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 17:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1733210FCF3;
	Sat, 13 Apr 2024 15:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EDvxaWPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F397110FCF3
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Apr 2024 15:39:12 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-516d2600569so2270534e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Apr 2024 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713022751; x=1713627551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f0oNO6mfFQuvlHpMk4G/znEiHbjMhsBrBQyKFqCxSZQ=;
 b=EDvxaWPyuWizs1nc12GcXvOk19EHCJa7AhxdIhzUJQCaPepr6RaMXsNtZYrjFmIyCo
 oe3yukVAxvKFA6H7jRFuoPLkC1Nk2Jj/fDPuDNSIhvpKS7Di+iC+ZGO0j/V5CQRQiJNq
 F1i4PpeqjmcBXZeBhbchhNnZn0cA3z14VhqP26uEuTk/Yc/HTpjxpBmGZ3UwI6xnaPMG
 BkHo2sFzVZNRl2u6xnrsVrLg0SotxlksTAKyPp1PfQn2B2J/HonTlwAJRTbs+4WBPgV4
 X7+DDaaGv3FBk171o5yUOkg/SmPc5qBU10NDoOvTR3AA8r1pbCSqLLmfIJ9NKYiO8SH2
 kuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713022751; x=1713627551;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f0oNO6mfFQuvlHpMk4G/znEiHbjMhsBrBQyKFqCxSZQ=;
 b=ieZYaBaDrt187sKdGDE9BlQWdippzWdRiN9Rjrrr3b7sJnl3sR4C2kt4YlJl4XwvKG
 Su+UM9djfdfAwglph30HciHwHsv+R/HjTlSTp4y/LRFq7iQ5Wp1TiXNaxXi3ZE3WAYH8
 sxT70Pvh4Wta36oL/+s31Ch9HS5n5wPtbXQGL+c6e/OSJqA5sbJfq0RGxIHDK2msoAbp
 ZqvRSh0eax2S32pr6uwHvnTEZt84XUfKWpg3vWVCqXt9lDXu8F7hnBFgXfYLcpb+ukeT
 4Y58dzplR+dxjV23ezmKH2VWkwwOyg3KWNalbrecgKJ7NhOIyoAfgY7mCWzA7eHPruFU
 6U8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjIgF0XyXNvEt1S4bcXgrDJ1sU+kp23iv8hCGrEMxkME3BkWmx6kFv+ReEoNgif818l6kkzkehlQVITprxvU9UlAIBVAygXZKOoluip6ma
X-Gm-Message-State: AOJu0YyMoo1CwMOHTYMRHew5SDKY9BX0oQQpyx7JxsavZqVbvikmPsOH
 JuoxZ6gdZkxT71NXUXQj/2UurormfAoJ149xo5csvQp2Jr+IQRLu
X-Google-Smtp-Source: AGHT+IGZgdHHvUfwKJqy8JDTyxqVid7fQ63n4t17VeuS+OeS1rzrTs5iqeQLOHcedJp/MKxDaD9YEA==
X-Received: by 2002:a19:7609:0:b0:516:d04f:b58e with SMTP id
 c9-20020a197609000000b00516d04fb58emr4324330lff.30.1713022750586; 
 Sat, 13 Apr 2024 08:39:10 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 cx10-20020a170906c80a00b00a51b5282837sm3131680ejb.15.2024.04.13.08.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Apr 2024 08:39:10 -0700 (PDT)
Message-ID: <b9864655-7c60-4066-8305-f291a3551872@gmail.com>
Date: Sat, 13 Apr 2024 17:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 2/3] dt-bindings: display: add #sound-dai-cells property to
 rockchip rk3066 hdmi
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

The Rockchip rk3066 HDMI controller can take one I2S input and transmit it
over the HDMI output. Add #sound-dai-cells (= 0) to the binding for it.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../bindings/display/rockchip/rockchip,rk3066-hdmi.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
index 1a68a940d165..6d4b78a36576 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Sandy Huang <hjc@rock-chips.com>
   - Heiko Stuebner <heiko@sntech.de>

+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
 properties:
   compatible:
     const: rockchip,rk3066-hdmi
@@ -34,6 +37,9 @@ properties:
     description:
       This soc uses GRF regs to switch the HDMI TX input between vop0 and vop1.

+  "#sound-dai-cells":
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

@@ -83,6 +89,7 @@ examples:
       pinctrl-names = "default";
       power-domains = <&power RK3066_PD_VIO>;
       rockchip,grf = <&grf>;
+      #sound-dai-cells = <0>;

       ports {
         #address-cells = <1>;
--
2.39.2

