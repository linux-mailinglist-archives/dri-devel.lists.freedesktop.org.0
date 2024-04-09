Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7969289DAC1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6718112DB8;
	Tue,  9 Apr 2024 13:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CNnoG4yA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FA0112DC1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:42:41 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-416923f05faso9840565e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670160; x=1713274960;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IGsqJQWF1Ucte73TGgl0P2Cl+B2DHbp3lE/2oPwQwY0=;
 b=CNnoG4yAanPJ5Nv0hjUTh0IB1lbC6UNTYot0yLobjVKK7TerCK4ENNelwJXzJZp5wF
 uGMhPmBjnyaoow9AaYEr4nXaBtmC69estGxBO6Fny7tpb2LReUsunp5G5SF3GZRmgMsb
 9uZ8MZjSGEwn6UwqmR8TrYbPYRwjoHVv3xncxLhcOd+gMwcgFrpC9H2bFZ4UgdwTMFB2
 mbQFqAqE2ist3CVGI9bPtd5qnGmF3yN80RPTC4LKMP5w9nJfiU95ThPu/ehH5v2YOc0t
 /MH6KDI5D7anxkFoGFKDYtXL2OWzaQ+5K/ole7f81IDXx2300BDzH38RdTmqtrWIYg7K
 E5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670160; x=1713274960;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IGsqJQWF1Ucte73TGgl0P2Cl+B2DHbp3lE/2oPwQwY0=;
 b=btdJWnpYDvYkbFW10gU9nZ+FpJTKGrT+JUFtJCfcjuIa7QLtvDUDPFmgSQYg6jFvSd
 94w11Zg0nTbGNawNNvGUO6iWDPSihzmMQEmSJB5JKYdH9ddH080b6Ghua6MxCMOuw1zO
 XPEcNM03n0IURQGEu6J22jxp59nUeNSFcELH+f5/jbk8ygHvh552iZ0MaSqSSaUp7PeG
 JdA/8AVSz72V/lsHA0VIsv6l6NQxpWBjWRxITIeVZalYZMNi/Ff9MCKMpdgzaSLPvABW
 iR8g8U8chhR+v0eby98gFcgp46TgXlLepYc+zQNCx62M0d5sUD/VIXfPi8R1QZ61pJjJ
 m0Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs3pzn2rlbQm/Fd/pSdCDmhVyX5HSrqz+ZU/duZx87vUawaBa/RU0oj6kfKvzATFGhR1bMJrtBng6ScnGcx4MotmQ0OzC0bKm6m7iTFc1H
X-Gm-Message-State: AOJu0YyrJonImgrsX8Nh1NSqwoUnMOA62ZRZMKCFy5TNC7nwJC7utXLq
 Ry5JUrM2G0b/68peyPLY+hxDun+XUHp2BMpc/Up3sBtRSRFqG5bhdtvFZ/2Cz7w=
X-Google-Smtp-Source: AGHT+IG/iRx5ir5/ovsIbMfS8mk5u5aphffFDwTLsfaRoOPMCr5c7spDQQ+GP6mftM7G0850xXAw/w==
X-Received: by 2002:a05:600c:4e0f:b0:416:7b2c:def5 with SMTP id
 b15-20020a05600c4e0f00b004167b2cdef5mr3740530wmq.2.1712670160253; 
 Tue, 09 Apr 2024 06:42:40 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 06:42:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:16 +0200
Subject: [PATCH v3 18/18] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v3-18-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3971; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=rmUU5KQQDjsuNrCnoS100FfCSVwtHEsMKsd4Yeoncng=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWs/X4+9lZbZVVrgUXvJF36fOR5nf9HCXtFKmub
 Eojk7WmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURc0wD/
 45bfDP54YfMymdYp1DrRTulxgf6GxTPMlbsmaYC/6cJOUqee8t+L9WtVMsNrp7t8LfGDU3lDY7DoRr
 6vNEioghcUnEv+Mc+SYl7wFoedQoAppu/BpfM70howwkJ2UVm+SUAzqgTjvtOwwEC4VY2h8X56zN2a
 LfJm6Zfjo5fE8H7XpUOf7F5E7EUR+eDKbDRrgA96OEuRy99jQrKasVCr+2ZDGx06J2yHrMAItWA7lb
 sR4Hy+3BRmHw710Xr0eta3e+SAHhqmDqcg9GQz8edgyqoFrmfhDzrsKuaRgVJksRLvo0/fyJhh8BWm
 ggJ6j0JO/EvFhhPG8VtKzyOpEtPw87GXwpdiBAHKbfVAGFgbK5oX6uA0oP78kar8WPv1YAloDpEsx+
 oT+0QUuFzIu5TZjr2P00CZGUA+c1VVw7I5E1v7M1a0OwqRmjxd2H52CWPX0pxnkYQ+ZWfJOWqaZEfP
 JXM3aiqQLbew/R2iwVrMQlh0VkmWg0D5y+oSaN/yZFTY6Z12MNzp+ylKx34w6s4Nuw8dpsS1At7YxO
 Y3NzNjq61mtNk2oI6AIFWkeDyXsCWAYYySPd52T6MeQ79lwvWkBgUBURjyZQ0LiXHZomCM5OOEkckg
 92hqaIi3kf8aFt6cxW2WzEKL1eAKxDEaYjMgHhcYn6CjpygtttRwko/+RTGw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Add the sound node which is linked to the MT8365 SoC AFE and
the MT6357 audio codec.

Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 98 +++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..eb0c5f076dd4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2021-2022 BayLibre, SAS.
- * Authors:
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
 
 /dts-v1/;
@@ -86,6 +86,29 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	sound: sound {
+		compatible = "mediatek,mt8365-mt6357";
+		pinctrl-names = "default",
+				"dmic",
+				"miso_off",
+				"miso_on",
+				"mosi_off",
+				"mosi_on";
+		pinctrl-0 = <&aud_default_pins>;
+		pinctrl-1 = <&aud_dmic_pins>;
+		pinctrl-2 = <&aud_miso_off_pins>;
+		pinctrl-3 = <&aud_miso_on_pins>;
+		pinctrl-4 = <&aud_mosi_off_pins>;
+		pinctrl-5 = <&aud_mosi_on_pins>;
+		mediatek,platform = <&afe>;
+		status = "okay";
+	};
+};
+
+&afe {
+	mediatek,dmic-mode = <1>;
+	status = "okay";
 };
 
 &cpu0 {
@@ -174,6 +197,12 @@ &mmc1 {
 	status = "okay";
 };
 
+&mt6357_codec {
+	mediatek,micbias0-microvolt = <1900000>;
+	mediatek,micbias1-microvolt = <1700000>;
+	mediatek,vaud28-supply = <&mt6357_vaud28_reg>;
+};
+
 &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
@@ -181,6 +210,67 @@ &mt6357_pmic {
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		pins {
+		pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+			 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+			 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+			 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		pins {
+		pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+			 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+			 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		pins {
+		pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+			 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+			 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+			 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+		input-enable;
+		bias-pull-down;
+		drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		pins {
+		pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+			 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+			 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+			 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+		drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		pins {
+		pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+			 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+			 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+			 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+		input-enable;
+		bias-pull-down;
+		drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		pins {
+		pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+			 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+			 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+			 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+		drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;

-- 
2.25.1

