Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C9D938942
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 08:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9993510E38A;
	Mon, 22 Jul 2024 06:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="juryWTxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD31910E391
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 06:54:13 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5a10835480bso2840155a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 23:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631252; x=1722236052;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dqkMPJOSzbja9rCDv1W+aq1XxPAw4w/o+YYYBlTqJb0=;
 b=juryWTxhsB780QnKGnBHl6K4wU4MMqCtUkoa1JktXlRaLPMyNpmn+0dOhVTBCfBBpp
 6iMqKHSMn2TPk94eLLxnImCgseV7reLNfiRdhN4iLeN9IR4/KDvW1S6SzYEZ72kSBCRO
 h4BjNnbfzEfM7BUAZraUAqdZDJEgXkTtAOeJAnnBKbwVyg0azhxNRv/TXjj801QfeSoG
 ZeWSDKokuU3Rjd4dzFWCRT2H93YI9r4Zvn4PKBp8v25UK2Xyv/QrCN25vTDM4Cjc2MkS
 w8PpkbgyKSnHkkw+dCGqU4T34+2d6/Ja6rz+/OuE52790A/Lbx5us78LvbHZo2JXueP3
 ZiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721631252; x=1722236052;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dqkMPJOSzbja9rCDv1W+aq1XxPAw4w/o+YYYBlTqJb0=;
 b=ZQEYbodNfVobqB3khRq5BSWpbIsvsVQMOFUMoOK2SPfmY5QGLP2Nk2jEkyPwGSYFXG
 teekxn2vWL5c5XINij/vbR44VgDrHQyWkx9HEhaDmsIaYIkqOaa95NBKp1rMfZ2DoWbv
 rsSFl+F6bmZ6CbJiEMa4Z/6ridmF2zYPtF8DcAw/HWISp3wgxlVOVC/A/4kfsx1P+dKw
 6u/739JgY5Pga2WO3X2ClFLNXIhbXfTB/Rlid8rh9pdCxbbKpPo+rctadxjstTPQlX20
 2h1ozK0hulaGOGpbIjJyBhRXRE0MxyP+m7FurZN0sUQ+Bclc2JMdYo0wsT5XPmgouPhB
 Suug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfIJ5xhVSKRu1HiQ7hZ/OOEfQc5+Kzb+1H6EClJZh/FALMs7qOAtaD/7L4LmdeJe7JXCfsC/XjDVlZ9JnBTVV2Dq+Iibuk7ZGNA0NuVh/k
X-Gm-Message-State: AOJu0YzWb2zceHkw2476F1YcZ4ov+iwFaA3ui7f4dEuVN6F25c56bMHK
 fWW2NIIRUUpuaoTnPyaHX6pCLfrr+kWL3qD5qAL3X6dI2Lk0IbEfi1GMeHqT9l0=
X-Google-Smtp-Source: AGHT+IHEChH+y+Y9XHfXiJcOJtbcMIXSn76WcXLtLzJTBXBNmK3LPl3PbBmPLI53uuEd/e8+kC1KLw==
X-Received: by 2002:a05:6402:3482:b0:5a0:f8a2:9cf4 with SMTP id
 4fb4d7f45d1cf-5a47bc87334mr3553300a12.25.1721631252131; 
 Sun, 21 Jul 2024 23:54:12 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 23:54:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:45 +0200
Subject: [PATCH v7 16/16] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v7-16-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=qUIeCtFecA8nmqn0H3dpPJSUWwNz+5gepp/PnumnSJE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHxbH6X4/4QzRgM+QgRXmm3F99YLaY9HWnsQS4a
 /UFBkXmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8QAKCRArRkmdfjHURaajD/
 9qc9SiPZ6f/ido8YKEvVNpxPUjppH67+Y/FT8IyHS4jCG8xQaHbhoIxbK4aao5qYB8VbDyENZ/xeVd
 DaO53tHrc5jaZ4Ys93ylidN7ahgJIAjCE43g/loQSWFuydofSJxoGmj5xHeNoiR25S+6cZO0TzY2F1
 r6dplliF/3H7/PNZJ9yOJpDQKNvVW2doY5alyuS3jKbZjg27V+3WW6jyK1aqCoP4FGP87YcW+46hLN
 U028Og4XEpIwKe+Y+ttGlGr+ytMWKnP+kuEeHrfJlf7H8DooPHvdnTlrW2AUCDy8FN1frDm1F/1xL6
 1RxeAUEA4orOsS5z3MULiDbAhFiZvHJWk7lu+SnAaC3aRwrzEf1QFe5Me5C2e5eSQeVFSsa7g8X+//
 Y+NWAtVvzuEzwOU88v9c9GVJmhlqSPm6FmoYgqcYohaR3/KlSSNN9ETgMdDJhRUCRW3Vcf33Dp7cLT
 wedVj/reYhgnxQNix2dYCEUo9Caf1fSDDPe5BzxjkgtVb2PP4fQi6KcWfQiUi7BvAWTi3CUSJY/8i/
 3D9XCIgtpbk/5ayjOEvsnfblaPiWfYj3tc4C1rpvto9zueYprgjJMHFY3wYikBKE8TJyw8YRabNU8J
 ogwDyFATJ2Ehk9X2o5nhFKXc0ZrGGvLgWKo9eiIrLW9iHQlqKWi2lnhz2MCw==
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 86 +++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..6288bcbef241 100644
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
@@ -178,9 +201,72 @@ &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
 	#interrupt-cells = <2>;
+	mediatek,micbias0-microvolt = <1900000>;
+	mediatek,micbias1-microvolt = <1700000>;
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+				 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+				 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+				 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+				 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+				 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+			drive-strength = <6>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+			drive-strength = <6>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;

-- 
2.25.1

