Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE99084D9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8587710EC6B;
	Fri, 14 Jun 2024 07:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YikzSQSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B3210EC63
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:28:24 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-57a30dbdb7fso2681496a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350103; x=1718954903;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
 b=YikzSQSs/qvD9T9jfsJksXgxmHwyKgPDPLXER80yXB+nLbymd+V2vrIBn3iW+7gsYX
 QnSHTlFdUYuMuem/d6dv8Ji/ZaMo7MIdCMczLvFElAG1uOFpoP1aFp1d+0Mmiol3jHiB
 cnG4ipJf237AzRZ1qHU3Y8ImIFI0O9PXTdiwtRtySssevXg0v3YNiiciKp4RCpwMUoqQ
 yHhrG4JrYQ/G9EeK1szWAnS+c3JzGssLTc2GcLkG9NBoMMF2fIdvpGZ6HZc6ZxFW21xV
 z0G8hQzVUwT0WDCbtZtOcbR4GpE6hadBdL+ai8ytI0YMQ3bqFHcjBEqfMt9gbEVugmJ5
 nCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718350103; x=1718954903;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
 b=ahSm5M6zj+gUk+uctvLADHWlojoT4NLKhooehV4pglgvqVVCIRqvD5oz/Vy9Wsd/Lv
 rASSYPTRo7SQ3aC/uCkP2qfYMqixg5Td364mAeH1p2oeQ7O3cUS3C3p0FvaoFEdtAxWP
 evUAaOW4RC+hEfSki7UeEGQ/A+k2NcYVo+ybeHRDvlmKISOlu+SwiqtZpxWBxGQGRTT0
 aSfIjJZk57Vju26FNI8nXFM/e4Tq9JrJ/D5OxdFIIb6PHppmXlTJjpHhINNYUMJmxci0
 u8HypiCKkxUQpE8CYxzYDGZ3xPWecfe19PDtHvvkhUwBAYSAlynR6uSxbMIM8QfXiMQq
 VIIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaIDUhoVlEwrgkPs0Ey4GRDJCev8ZeSDN89GBEq0H4KPpj8zpP3JVp5hwDaEv8GLJnt1FCSe/UJm05Zs1qAEBZMAtACPQQJ/+gyaMNIZ2W
X-Gm-Message-State: AOJu0YylSoncyMvOy4omr7q4b58bfmBud14EjUJ0oYba0CqptR5uFGK7
 GeFx2NSfqOIwctx3tdAoFt0qgTSfue1aIuyJEHxhMBfhM+s4bQ9mnl0AdwZyGRE=
X-Google-Smtp-Source: AGHT+IFF7UZbnKl3+wQb9W5FOXo2sWA/u52xRAvSHAyIN/89/MqgXnj2NWjofDEb78+kItH4lzx7Tw==
X-Received: by 2002:a17:906:3187:b0:a6f:1c81:e220 with SMTP id
 a640c23a62f3a-a6f60cf1dd6mr133571366b.13.1718350102791; 
 Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:57 +0200
Subject: [PATCH RESEND v5 14/16] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-14-54827318b453@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=cO45G3J6A2HCrNyifwgmbquTtW1hXtTIuXDjiQ9kiyk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D/bQ5cx0nOIhVEbANGr3El/UNuim3DeFvhVPKb
 JFG8LC6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/wAKCRArRkmdfjHURa3yEA
 CDE32G0UGXLh/zCKtDKPzFr8/qWc7jvkSuEWfcIKQwkkbJuN5PINlE3ttay+6s/8WyuhQ7yLjgYE+w
 ka/1r5I9VojODP5FQbafq/d2z1PgmEwlVM/DPZgJISbx95T2LXz70P1OAXy3qn1OFCURZz08Pc130t
 EZ0EUVTVD25KKj9sFO4yqZQkkCxontUtvWjKKT8IUqMvWVx2zcWiZBtPN0uDeuih+Klja88jWdyM9E
 ZEAAQdzwymlsVepAAeZCRAQlpq2DAqkKspALDJ82T/MEto3A/QEe7saTsVrIIVJHxT6kGx3xjOeiyQ
 Ez4T8CSIdgH7aWYe+Ae/PUq8VTHPBObS97Lc1wojdo6hkdRu4zMhAzu9gw6L2mbCkJXRwsOk8Rx2xK
 YiHPG7qzGlRsa+9p0J99BwttZkWUeIMPcQnl49bQKiucIPiaFo78hGeQe0DhXjYJiHwzBAqRshnL2T
 P/oJ1hck6i8j/oCoAdC6VM5yANe/18HHCq31zxuzKKk6IsMBHx5tG5wcOXpZR5pJZgCA6k8czo08oi
 QbY0Cu+y9bTgfKS5TVc5XgVi5VdsKwfb9VN35EIsw8TBvRicZmAWiWzEDN71DhjrWcPFoeEW3eMNyl
 vum3H/uX6pWwfl3EHe18p2uY0M2kYQcAkdAXOx8Dr5rD1dnDwb3/u87UCiDQ==
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 57a9abe78ee4..24b4d1a4992f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -950,6 +950,8 @@ CONFIG_SND_SOC_MT8192=m
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

