Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F6D803BDC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 18:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E3110E219;
	Mon,  4 Dec 2023 17:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B5B10E219
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 17:41:01 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54cff638658so388772a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 09:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701711660; x=1702316460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0YoXgk1fmeGz9Ml7hlpE/8h2Sivb7FXL2iIYJZqnuHo=;
 b=Xw0pu0Wucx+9tZ8CsESH/CRDUPtJ9eY93ZMEknZmn2nIRXNP5xmW6fQBTJkCbx+Gmy
 b3GOzoTggSD4z9yrHAOGvGlK6F3JWXdoQA3J4sZSLMEL+1qsZDGJHGzr3aIElljzdvdq
 /C64IOc2o5kLoIzIqzPxrI2x9jR3aMN68O8wPbdr8mT8G6Qc1FX2cIG/KpfkEKF712BO
 jd/+1WuZqHwJeXCxVeXD/tukhCsulb4nKbf3Dtf9LVyzoSm/MJJ2/MHbOwGlFhKCbc8J
 KIcs7Z3CIPdLTe/F1dbbsXstJ/GyZAWPdKXJh5ac40WhvBZ6S3TLwMwU12ZblsNEWRW4
 uEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701711660; x=1702316460;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0YoXgk1fmeGz9Ml7hlpE/8h2Sivb7FXL2iIYJZqnuHo=;
 b=CfxwK00gLyino17HBekJRbubUSUBdNzrDR5AkPNDP8a3er+M5Fr89EBiSKXZszxBzk
 CIzWAXFQNkaTZmpaKdQSlW2189qGeyFDffa2XBRayxRXzZ25Li0HFEuqCgzGDlLqBXpv
 5QDIHcKKJscoOHWoXNvwyuPlspm+hCdo5YZAGrd/cp7JHNIjSe++oJACBpfEDszs3Jel
 9GZ5CEOsj4fk2/GUE5ilU5ibgxdWqFISly/3GCYYd26tLTBQ6dcIzb54cUZG9QPUEf/9
 R6iLKvkcjSqgFoju8hoSChM5LeIMuPIvMbf2yVagAA4+yBecvmSLHlx/DF/2oZCnDAWa
 44rQ==
X-Gm-Message-State: AOJu0Yzbd/u5BzZejrLPFfMM+7dpMeTB7R+dltesWJYA5VXUrJ+kzYW2
 i26WKjapHu4VzhkyKyf4/+k=
X-Google-Smtp-Source: AGHT+IH5CahfTiqAKyTJCwE1ddGA7CrKLTxjhTR6LznurnRE9jPGXs+oBd55rb4exBi9MUScKfvJ5w==
X-Received: by 2002:a17:906:6d52:b0:a19:a19b:55ce with SMTP id
 a18-20020a1709066d5200b00a19a19b55cemr3477124ejt.94.1701711659945; 
 Mon, 04 Dec 2023 09:40:59 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 ub12-20020a170907c80c00b009d268e3b801sm4350577ejc.37.2023.12.04.09.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 09:40:59 -0800 (PST)
Message-ID: <f5bc182b-f9b6-26a8-8649-19ce33e3c0e1@gmail.com>
Date: Mon, 4 Dec 2023 18:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 3/3] ARM: dts: rockchip: rk3036-kylin: add hdmi-connector
 node
To: heiko@sntech.de, hjc@rock-chips.com
References: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
Content-Language: en-US
In-Reply-To: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add hdmi-connector node to comply with the inno_hdmi binding.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
index 67e1e04139e7..a213333be011 100644
--- a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
@@ -13,6 +13,17 @@ memory@60000000 {
 		reg = <0x60000000 0x20000000>;
 	};

+	hdmi_con: hdmi-con {
+		compatible = "hdmi-connector";
+		type = "c";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	leds: gpio-leds {
 		compatible = "gpio-leds";

@@ -110,6 +121,12 @@ &hdmi {
 	status = "okay";
 };

+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &i2c1 {
 	clock-frequency = <400000>;

--
2.39.2

