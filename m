Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652DC89D67A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F0A112C6A;
	Tue,  9 Apr 2024 10:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xOw6HIYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DECD112C68
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:14:07 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d8863d8a6eso36196931fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657645; x=1713262445;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=;
 b=xOw6HIYraLpy09Ry3FarHjs2/JFe/LY3DXQ/Pajo+oOaswIMVEbtWZ6JIGaGqb68MA
 cKYkI/4+ViGIno0vKT2/sQA9k9hlDuk/srETrUWgwbZk32PYIv9ahY8Z3XcHmqZzv7g0
 pBJ4v1MSi4hOfWlydtFJZRjFTng7YZwLBUUucvmNiNDT0O9q1z5JV47A8qOor7VxNs1I
 3c4SSzAeG1y/bsGTJGDxHhwAPNyD26oIKbWJ8stnPlvA1/aRcy+MX1Po2OV7OeZaMXMc
 bKlIctZ6LZ91iTnJngMN0u5vmKzMrV0sZvQhNXesJWFwqImm1WqwFEhH2vAhlcJXRihd
 gGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712657645; x=1713262445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=;
 b=M2Eg//aWDxADbsiocEUE0KSXPmoC6oYAngaBfDrh5GDrzHFZAJQ45+8X4NILAoXCPS
 8GY06/WiK8fnCpJcpNdlcngtuQqiUiuZO5qmgsHWXNPv/YlE+9byozuCaoO/F1tusOSy
 Jdg1gmsQwSr8Bgx8GjJ+DXpSo+t8zpxZfjKor1ku56lK2LyPGGiZ8kWVE8ep2/wV/xyB
 CeASMru42x5HLVK9rNHVPOqPo6yac7qtAVla0QbAF4/hxGrnGIt4BaGgXkHGaZy0VXlB
 bbXzpLPzusd29PXNq2FuAao6QOZs/uJCcATScGkmQGyzervb4JP0D/6jDMg4FtW//LgP
 YrLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA6A2nqkbup0Csr2rB8mQkyZJFdmo2lBENX2YmiVFHvzcFIcKulqc47wZJs/BGhcboqQkOvkvTP7L6rVzrYHYE1peGDad/XVmMSSqnm47S
X-Gm-Message-State: AOJu0Yx63kvIQP0v96BXewQAu64bw5Mk0E3JVVj1mGb5DFK+DQPjAhez
 UnmLr1uJhfBtUEpdqyNGZ5FohcTS0tc/BqzJawnnIYafAKV3hIvmb1hXn6Rwltk=
X-Google-Smtp-Source: AGHT+IENdUOHrGfs5r6bs+Wha4bn9SDjds7qLVwOQAcnUYwqRAeg46DX9D+xFYcRM1j81YaRR1bsjQ==
X-Received: by 2002:a2e:9891:0:b0:2d8:6e0b:8166 with SMTP id
 b17-20020a2e9891000000b002d86e0b8166mr7274355ljj.53.1712657645405; 
 Tue, 09 Apr 2024 03:14:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:14:05 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:37 +0200
Subject: [PATCH v2 16/18] arm64: dts: mediatek: add mt6357 audio codec support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-16-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=9JiWubCt7cv90b13bkV2NJN74YeswiFHCbXLjZUbZs4=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTG2fTNzUli3ntNCZsXBAHw4VMKqQOmZ8HnVyz
 451K1leJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURXv8D/
 4swIhESlxC/0lqHODwrAjRgviVRfhgvqxo+Th3OJ5EqCuB6mgn07DpwhYr39z6xFPQuZ8ACs5cVxq8
 0kiFqDuyuSy2SoPq1Q4Edcn/UxpUJsta1MghQ9tIrj90OMjJs2xIMXVhvOzwSz+DDwafKaTy+stV4T
 uxaKBpicLjp+mXYe4rF+wTkPCmsUJmEktncgNswuJ8o3WhLCNOTkv86LVKKLglyOPqocDKf5eOcwjX
 RjJZ6r7ctGH3SZp7eAbkR6vNdpW4uRh8UD9XREPqie93DW6HeSA+Ck87bNhY+wuDGbyKthzZiRp1J5
 hTlQ3TzYYgCl5muwUARI/jKr7PEefR9ebBfioTXeEqlAQKhIXyuA0qJxjCZUBW1ldstdI423VgezL9
 Uof0r7nHT1zTFI/Usd2NnJfZkqSgzQmRkmsVo+RAJ1zonBtJMghqJmLh4XwVB9YLvwqvSP4XMs6Qrt
 T1cPlTkMDyN344xkkYaEognTPRD8TnDrWyI4jXM8MUTypzDfM51S+kIjpUtPwcek4LD/22YjWZ87Wb
 esb5AjAp7WqMQ8c+BmYo906y9L6zAbCjk64FX61FpkTvl2aQksD8BSgYMVtEf8fad+82F/WpIGsSng
 7hxh43JcVhRMdEzpBrHIN5rEwic+qjEkWM+Y4gXlZELArf7DKwXVkjVXq+6A==
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

Add audio codec support of MT6357 PMIC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 3330a03c2f74..ade410851524 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (c) 2020 MediaTek Inc.
- * Copyright (c) 2023 BayLibre Inc.
+ * Copyright (c) 2024 BayLibre Inc.
  */
 
 #include <dt-bindings/input/input.h>
@@ -10,6 +10,9 @@ &pwrap {
 	mt6357_pmic: pmic {
 		compatible = "mediatek,mt6357";
 
+		mt6357_codec: codec {
+		};
+
 		regulators {
 			mt6357_vproc_reg: buck-vproc {
 				regulator-name = "vproc";

-- 
2.25.1

