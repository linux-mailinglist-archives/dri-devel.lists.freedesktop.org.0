Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8A29084D1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1AD10EC6C;
	Fri, 14 Jun 2024 07:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g62N3ESY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCAD10EC68
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:28:27 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-35f1a7386d5so1812988f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 00:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350106; x=1718954906;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=;
 b=g62N3ESY4mlfaCWhRyFbVwuRTCDa3HFjve0UtTq7eIDPuyTTeJLRGDMLeMUnjG1o4I
 AKrEwzbANeaTxInUckvGfQfmUMCajuvDd339WLNYGKb+TUtoTIqFpDSeYelQYc5tqkGW
 vI/mh/ruVJRqPtgx7pwoLsisWhFKo9trQmCEOq5PAbq6La/tC/EG4T/rXp7bJemYvlP/
 n1iFXpDnsTAk47a8lJcdjPjlrtwWVAZkoiv2kq4VyhsQAZe/aZNc4Dmn9HCendOyoimr
 GR/3/A5qx2+NlWmHu3Gdu4lhFmGYOkb/fmpajwF1dZLxbszgVw1+Akqv0mmYXHbSaL10
 Qrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718350106; x=1718954906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=;
 b=K50qyyYAhB5iT+LR1yfOKsdz/Nmo2kNdTGurZlxJ1g/NoLI30BBObVIuHhaYLdrzhj
 mBRed7tZ5hiZRMSgsYKDmUfAjdv88s7jWncgoSsLjuxF5A/6A/zA0gbRoRSrqmPUyAEz
 qUET2cLjMWqw3H75dYzKWzo6c//KN3JO+DDTC8vhFYBua50SZbvOcbem/kuHUOpJsIZW
 tC9X61YqacbGdkaMpSvNgPYMkGe6pmc/eJACk0c6HSfmGfMbJK7p6rj1hMp61NATamhc
 qZOzhc/q/XWJCsFkKac1uBMR1jLgai4DHnY2c5YYFAzmxsVqVppkWQDh5JFdSKStDVqA
 sigQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQKJjp92a/xgoxlvZ9yoitFU/yGlIVym4qojsbDp6ehNPNSkYv/BV0T5oQE4Swj+5vVTBCUWK5BwuUGll2X/yGvIq+bj/hJQ9BAXTcnssj
X-Gm-Message-State: AOJu0YwAb30L81tJLTtp4/FVukSpduxmlBwctdqcjV9AYlThZ+dFAcsL
 VQFyKJnXkll8JFryGXeCQbyjWw+NVP59yLrBiCrb/xJcqzuYddMRZNUmwO7G9Vs=
X-Google-Smtp-Source: AGHT+IH1sau9xgdmWet8z49jHSmkMTTRejgofw6/ooSXhPGDtc47ElNp4Kb4O4tkJqcFbLYVG+36Xg==
X-Received: by 2002:a5d:458a:0:b0:360:861f:b7d1 with SMTP id
 ffacd0b85a97d-360861fb8cdmr69680f8f.65.1718350105904; 
 Fri, 14 Jun 2024 00:28:25 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 00:28:25 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:59 +0200
Subject: [PATCH RESEND v5 16/16] arm64: dts: mediatek: add audio support
 for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v5-16-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=UuxD5pLm61p5B/k8KPZWLUQ0/L/5Kc/UQPpFC3tu7EE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/EAEfODnnPkRsdd11u7PQ8F+DYOn/214x3OG4/P
 dgywbJeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvxAAAKCRArRkmdfjHURSTgD/
 9WpD0NJGEfi+cnsDUMbr7XRL72nxkXLtxsW9HyxixY20WGfs40QUu6OB4Goz91wTndbMDaiyjhTh38
 cKt48+pCpGFd5DA1RE8R94l4xxAbStT1gJtN+VLDzvnbz/ASZgZt/pSW7LlF7ce5fb5lBcvLLnlJ8J
 VN8A+/iTg3LdDcp5+vI1NhrbxNrg1L6mAnc7fJiExDcWumNzbH+kjPhHlXOiZezbPWOgH0QmzU29gp
 XaSA9B9egE0nhUpkrSR5lb68O/fFrtqYnErY1Uogmy3Gp11zRBoPl06rC+yvdNOewYxr8cVlYqF5z6
 O8KSlYwinzzBqLsx31eVUzHwH1+T+QarOiwfAyM1/BAGhjlfrXnPGaRB/3VeMliPQtoM90B34Y12ZA
 C/ErsI0t/LDJDE7MP2DpXmKI5GsDo+lwan+94XdGGf2U3/jgh8Ba5CIx5/vUCfNMJ3C/gw+HTw2Dov
 purJinwm0+7HsrG4Ky/LA2qFhaEHRNrmUcBAjUefjoeVzVT+J3ReRLJc2fzZRsKeENH6YN6QEW3VAA
 peArTUI2/QRsG6m4CATcXqZ1vBzS4KpkbmAxkRn87lBsT43rsUROWDZS28P58FEzmWXtAJC6V95x00
 zGSB718brYCPeugLXWEZmYITE6GCAOQ3mDwRcFLZHUfdCbbYf9biZPuyrcxg==
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
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 89 +++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..1d5457f9a4c2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -4,6 +4,7 @@
  * Authors:
  * Fabien Parent <fparent@baylibre.com>
  * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Alexandre Mergnat <amergnat@baylibre.com>
  */
 
 /dts-v1/;
@@ -86,6 +87,28 @@ optee_reserved: optee@43200000 {
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
+	};
+};
+
+&afe {
+	mediatek,dmic-mode = <1>;
+	status = "okay";
 };
 
 &cpu0 {
@@ -178,9 +201,75 @@ &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
 	#interrupt-cells = <2>;
+	vaud28-supply = <&mt6357_vaud28_reg>;
+	audio-codec {
+		mediatek,micbias0-microvolt = <1900000>;
+		mediatek,micbias1-microvolt = <1700000>;
+	};
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		pins {
+			pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+				 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+				 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+				 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		pins {
+			pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+				 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+				 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+			drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+			drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;

-- 
2.25.1

