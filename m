Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529108B3DD3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C5310EF8C;
	Fri, 26 Apr 2024 17:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zMSJJ9Ze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9986F10ECC4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:23:06 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-572229f196bso3028960a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152185; x=1714756985;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o8YtHIDpzdHx4sXqMfJFiepO7h+jia5jAgm2xcDtDns=;
 b=zMSJJ9ZehmCm+hRb5fzm2n4k8fYnEy3F0Hz+CmKSo6Brxw/QTpeQTQMSQIyai325Ym
 HrROZwMln/Icca+QYURdGVNVyc9xXzIDqJak6zxkncT8YuUR9znrp/FqvcvDsZ6U2JMj
 Ccz/yPHVQNaTqpRZjCxgld+ozZMdOKktRx9pdaJQ+anvxL8EjH8JMRn4X0GHdEhBLtU4
 ndj/QOeS2wS+u++Af+cVrhKCAKx4Y8dNO3JRtdUiLEDqVue/V2At1oS7basEEw49x0ql
 Z/VTcxSCHQgCSMsKV4iDbD+JNxypbwc4qq/Tez/3nQgD4ETBMDSeNvr0rBxXxWTTFreD
 uXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152185; x=1714756985;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8YtHIDpzdHx4sXqMfJFiepO7h+jia5jAgm2xcDtDns=;
 b=CaClFc4gfAzKkXl4FL9TRi9CXzWot5ngZ5svb42mLVbXyYAB+yK05Lf7OlXmkwonR9
 Z84lOKzNgEjxevkp3aIgPxdyYfXhEJ9gdU+Z9IysOUG3UmMP2OwWqUg7B6lKH0RkXw8/
 7VI3OYfNT/OoPHNz1OaJvA+zgww0ljDPFnuOHOIjeSvmew0sJpNAQz+Jw1SHKmmI7Q2h
 ks+vuR3h7eCVcKA00sj+J+iL2SLBh0QfM25NVjptL3SMOrS0WjDKvxFFaMepqqvY9yEl
 PqE/Snm/8p58NOgvTj8LrHrq1UL7C8bauOCLSiauxzvdsnpkD3ianAqjI1wCShF2922T
 PxcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Js38MzxBka/lTkxUXpHC97KdVfd1SSZOm+eHaXGj+CkDPkLrgjgawNvLT2GaocwGWyBBb1zZBTw7POtVDN3ZlZB/MaKT/aYiBEURJLeL
X-Gm-Message-State: AOJu0Yxu+wMH5vOvfZlwoIgL9d7YbEfmrbFNQzDboHdZFwkLesxycH34
 koZX85tuO3kJAZnELlels+7b5mtnw3yNVIUxRCtPaomqRFaoyzJ6d1ZMTfbN1iI=
X-Google-Smtp-Source: AGHT+IFe8cPyxYKPbB10bsA22HXOnNfS2uZCqL9dCr5CCChCqjSUjXJYhasnPEIlUBFiAuMlS60jng==
X-Received: by 2002:a17:906:2c06:b0:a55:64bd:2544 with SMTP id
 e6-20020a1709062c0600b00a5564bd2544mr2122960ejh.60.1714152185108; 
 Fri, 26 Apr 2024 10:23:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:23:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:45 +0200
Subject: [PATCH v4 16/16] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v4-16-082b22186d4c@baylibre.com>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
In-Reply-To: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3675; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=SJCQ9iTy0gf3MF6NpcJbnv0eqLDS85mr0GL7yiG+BlA=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaAKHbepcmLOlZloUS5NBbwlGYMM92geHkpJU7
 XXa0I1qJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURTMzD/
 9qgSi0I2CHYULuwM1Nav9rRhgAYJZAbLZdgfNHsBQc8L4p0cJrd9BxqKmxruQ4EwPq8BkmZJTpIzWE
 iExHW/L8zCFlE6ksIo7WhitWXf5jkNImBAqiEDrhcImecZMqWJuCrE3+RTKcYi0432KkK8ZP/uxnHB
 pBvGzyTTbbVz3kmVZ3fmAfCsYEgeO0b/tUMVqZGYuBexCYTKHrvDlqOJ4cX7BfJg4v5cGSDnjaqi8E
 TLDGHYHZ18jQYlYrUwmsqQ2w0hpnDwb+1HJ7A8ahgjdwJEf4LEBJVYZR1NL86N8ZMi2zg5QUW5qhZ1
 dZqON3mLt5LIcg8AbAZpwK8oRy/dsHkC+78KqmjleWYhCFwupn4oYUi87ZWNGmpZvOynMhtk+ZTvCz
 2l7DMC/2Q0XF643D8disbp/yiMevYeBnnPg/ayz7A4evpXVmOEBPN4bb/aB2qKYru1vKz5teiWLFAC
 +Av/KPOz3MQwqUcjThylnvpy7+Enhq0WVK4i7bUoC0LlClRV4MblSz4vkmC4/CtX+t3Y3Ipb5t87c2
 Y+oHm6LmIGV4dVLgez38gDWlGSxW6xs71wlTPyYgaxs3QCO6UklKMLcBZwPBhraGMQoYuNElQRpW//
 hTPVT5adtgXdUQQn4Rt/rXB/0zCVw2PoI7W/Kbg7YMrjQfHssQjxtLVyEzQQ==
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
index 50cbaefa1a99..32ae7d599272 100644
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
+	audio-codec {
+		vaud28-supply = <&mt6357_vaud28_reg>;
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

