Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0789D67D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43BF112C70;
	Tue,  9 Apr 2024 10:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="N9u32Y0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C767112C65
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:14:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-415515178ceso35238885e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657644; x=1713262444;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VFrY1D6xCh71cm7XNWVZx8QqBmaav+xzWA830Kc6M7k=;
 b=N9u32Y0VvPkOveIwEGPqapE6wBEWVsWcRw43wgEnWNw4MknzZUHeXB4a5Y1KgpuMxL
 6vo22kS/fzb1ZLsLYo3M/O1JG8+kpR9tLdzTNB8GQMKfxbNq4jaEeOk8xwhbhYzsCx6p
 kIEw27og+spgB9wbkBzoY65+zY4mZttg0iT9X7neThVjq6V4/8VRXqHLxQFzSOhS3ziq
 oUBBEd80FNCLHlFvV5xsJQsfi7KkGrg3hski7girudqODZmjWbaRorkY0dZQAk4ep8Yk
 i2awB+kIF/bWQTnr2ETczFqbR+Vt271CQHxRVaflguc6XOiTmmup9aP4EbQxxltWjMqd
 p7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712657644; x=1713262444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFrY1D6xCh71cm7XNWVZx8QqBmaav+xzWA830Kc6M7k=;
 b=ROV7PslUowRLqrxc4573EvZnMTA2haNfgwQSyVCcTej0cm0jC5tO5xFPy8R3WWp/Hl
 41NaZZhEWIWpnk0BTCJRC81BycdXug3OzllCT80ma03RTnU4NCNisNTdRht4ITdviWyA
 j7fWc3J/0j3td6ZnIo7+RsPcQB5GiELYEYSiIKEd+qljDwY/EVlUSOGw2F97gaoCmopX
 //bCi2bKyUTUWLTB8shYczKt5CLT2tX8yLuTh/JbKcqSsNHEoLI9ADhMFZPwSsu9rcaw
 tk9CUpwS8aITQm0yqlMRyZnwumEwwStOXz6CbFKp5mqOT5y4sROgFpdIdBMqSS6RUkSL
 u1mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKnGGEcDhS5MlfXXtJ7aZpTcK969XDimKh3t/wybzNtk9g1yE51Xae1igeRRijl542D9ao0ZAWyIzoPeb9HiUZeMqjN2VFjLtTPGj28nWQ
X-Gm-Message-State: AOJu0YxhntXAqdOZZsYuFF89IzWCElnfxWw5CLtzLFQEiBkIZcYih5vc
 zuoA5NuwyZS35+qkZPoaN6BoGK3lt+yFwM81Kr9JpdUKytYD6WCp0DFdjvlGRmc=
X-Google-Smtp-Source: AGHT+IGto5A0cajSMQfWBoUsnHL/bjGErC62X6jy9DY5wuOhWozfx6Hc90y3B4gZlxuozIjpOi/DbA==
X-Received: by 2002:a05:600c:4ece:b0:416:3383:227a with SMTP id
 g14-20020a05600c4ece00b004163383227amr7019406wmq.0.1712657643955; 
 Tue, 09 Apr 2024 03:14:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:14:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:36 +0200
Subject: [PATCH v2 15/18] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-15-3043d483de0d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=xiXcG5GEfrvSIF0BlBGjwdfWPuvXXb+gIEE1G1bDPqE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTT9bjW/zxLnXdKojc8YmUYjz4Xj8GvfHQ4mR/K
 qdeBVmiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURbaXD/
 9qEhFdaTc6VeTRp830IrIzI59VW84lMyd4klwB3ysqotwcoiTfhdtKkSJYESy42RJP+s7XlsyHaKNC
 6DMcV517X8o9HasZ+qeqXuU/S6AQorT2SMu2LhRAYpW2ZHAlbx8uNmgq8zdKA0NxsrhB70obL5tMsc
 4i2B5m4mJ8Gx/uUFolJO/0aUN+GWHvEdc5uHNzZx3dUOEfq5TIuwO6GpeT9S68NX/by2O6HJ1SLE3A
 x4P+CY7bcB0z8MFq3So3eImUegjRZRdcHf/nY/kgqzQKuggSgr6u43fimgPtztuak9XxElmFZX+vRW
 plK0XS1uoWpEa0qQakXjOaQX+Lj/rbkkz6+V6vw2bRRsUKkvSjPMk52/+5oWwhzi4uZ1OQ7d4MfxFn
 bPzZnKclzE2DPdlLcVa8ZgkaCNGxg0gxbrCICRvnbq2SBGUafPRNbVvBwapxJr2dh1mWPedzs4dtb+
 g91qwCY+CufuR83GhjAMrC/tLHN6SCtmd14Sa3csER+YUm8ex7Wr3m9ZYCU0vACh3ifBw10Zj26Bjb
 KP3tyqCpSzPxlTRsmqtDLD35rgxdUwzcr2s98VNOrj2bmpaJA+dAgPYV67G3B/fiPVSyDzmgC/Q3GK
 Ixi66Dihvw0FcEd+RIrMbZ77RSNBjdv/OApkKgJtvbfXud9EWNVdxL1E12eQ==
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

Enable the MediaTek MT8365-EVK sound support.

The audio feature is handled by the MT8365 SoC and
the MT6357 PMIC codec audio.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2c30d617e180..40e88cdafa3a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -939,6 +939,8 @@ CONFIG_SND_SOC_MT8192=m
 CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m
 CONFIG_SND_SOC_MT8195=m
 CONFIG_SND_SOC_MT8195_MT6359=m
+CONFIG_SND_SOC_MT8365=m
+CONFIG_SND_SOC_MT8365_MT6357=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m

-- 
2.25.1

