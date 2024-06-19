Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CDA90F115
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2B010ECF0;
	Wed, 19 Jun 2024 14:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fgu/rggO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B70E10ECEA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:47:15 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso788211866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808433; x=1719413233;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/7n2AkJl0fgGMf2VEe6AhFr9U06FnNgwEKVPhxtEQpY=;
 b=fgu/rggOvpWREjYmIOwpVUQDYsBMjpDEUFWKfnwEyOmUAi2qdqYsCHYcieVqb6SwYd
 F+Phoyx7xWdx3TuSUnEMMv2auLaWS4fZpefOkqyCvt9QRLIYKU6xO8dGTYp1+TcKcUII
 SL8tvkJszLNT5fapkuk8mp/yDX+oIfNOMeIzkAMU2PF8GywbW4r3UpfXp3QVZ0Wdn2hO
 0Yeaje7gIZmIPBRLAu6jDXHZAVFNw6LxWYxjT+EZjj4H4PtbcF83563OWL7CsE1aQnL7
 rwDQtmCZNaGJk2MnPu7pnk6RKk65cUGkf2TMAjubrROE+cJEKrCA9gleXyjHx21mMBEr
 +PUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718808433; x=1719413233;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7n2AkJl0fgGMf2VEe6AhFr9U06FnNgwEKVPhxtEQpY=;
 b=Y4pANh6oggjNVEQQBMlQzVuTWoNocf9JM6VeWswOdMCk2wKCfvgszTtA+hr9i3U0js
 o7JLJf75jXoAic58jL5n38q96GSQEzvfrqnwhx6djsWfdEpeIsnSRIureyoq19dihhqL
 y97ycotwkwFtQ0BV0zZg8+WhVMqZNWjUYCiBT2Age6DgwFfQAvHNRVH3xYBj8W2ll+47
 GhkfnxB9bZXC+emih8knj1yylSakMCCWv7FIQky7uU6GFkyDAfRrynYvHx8xG6bm1qnI
 bRKt1r0oAFfbP6qAjfnYSBtlpAsdhXEXOoA8U4qOSYpxTEi7pwNneVBXAPBbofy1BPxP
 Sz5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/bto6sQLfv2axtm2/EnQV6p3Twzxup7tQSHOZSORSpvtZ/jQvNuwWS1dPmsb7HMPYY5/ApAL/gePBjq4DQmoAuH0wWwu4E/6VDRFTQw3Q
X-Gm-Message-State: AOJu0YyneD9LwZxmE/6hkB5KC0UOjqN8bkH2VV/mS4bhkKfDk+F2AtKb
 gGdBUUlpb6mwfze9CrsByFVhRK8L6Ozj4PwMjESXt9JNpNTPNjs6elLmVKGlwck=
X-Google-Smtp-Source: AGHT+IFejjmBbR+O7NOilDUucTHeY4c4aDqAu2lRXv8q4ZHn25X/QRNZIhLDZJ8tRMuEdemHgCMIog==
X-Received: by 2002:a17:907:c708:b0:a6f:9ded:3200 with SMTP id
 a640c23a62f3a-a6fab602dcamr173816566b.3.1718808433651; 
 Wed, 19 Jun 2024 07:47:13 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:47:12 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:52 +0200
Subject: [PATCH v6 16/16] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v6-16-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
 bh=AvMEH8+KihB+RCqkEHdbuY3XBZvm9qmhSI5bau/Z8bo=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9RgD0cIrV6/lCH0NYdwIPSFjZgfo8uICKgdRMK
 BiUeAheJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUQAKCRArRkmdfjHURX5xEA
 CVAxYmx20YDtVP5oFfSpgCktC+zv920AeENrb2JQxRdR02ezp1MasNc5UuKYalU+fXHwpgGjDaCEIf
 YqYAbCgFcT0QS/gij2R5R0zpORXf8quGhlpQx+5VqnF0lKCCG4U2PelntPOgKGMnZNlV2gEZodL/9n
 +0WiTS0FUzaTzQrC0vSh1CArExbmcxeg+JE6N+k3NCx1bEzRFX6yI3+F6bu40xUADNIrUNBzHkJtBr
 HSdVO4wWMXxuLM7EOZ+NWD3A4KdaToDG6T6gek5a1tVW5XQDUqMSxclIPtaF8Oyk0O9Cd8GCxKnkzC
 0wc8qSbhEVnOpMFt8ONEHPQVdaDF3Gndv2J3j/bnG5yQ9Zgo/g2Ezz33cHu0loW9J2ca6SY9BRfRo+
 E+JwpPhCxNLh+L288kzF6n9CBP+/O54C0LupdysRSxzDd/WBtbvZQMDCwIqpm5m+xJ41kOBe4eIPQr
 JnTj16T/X+Vb8FYvXw0mn1lv+K5VVh+uWTrcQZ52W1MsfpbU3HojZbfS4WzDawiPmc7YRa9/OOP45R
 sGmzx8awEwD38ybbIcpGx8lUo0lGI0w0vr/VlzSGrYXgl02FrsYjgu+F21jvflA+8QfY9ujx2B1zpU
 BKrnHGupCmTswsKViw1AnCcl4JFje0yKrx2j9WC0Fole5dwv41uEJaRkHfQg==
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
index 50cbaefa1a99..f8e9bd732668 100644
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

