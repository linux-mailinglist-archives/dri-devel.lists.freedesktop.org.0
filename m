Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF290F117
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BFF10ECF2;
	Wed, 19 Jun 2024 14:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GJvvjd+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E2310ECEA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:47:11 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so83558541fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808430; x=1719413230;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
 b=GJvvjd+6GqtCH0iNYMPImM1csNV/XqfuIFkeGX0Bzwyaia26Tlfww4EBYFbS/2YI0c
 kKkFoNx0+1IwUU13kmobT/v6cOFXX4NQjp+Tz2W1+zM4aPzs2DXx6B0j97oLnBnEL+D8
 1UTeraDtM57zn6CifVHIPuN3UU84EE1u0Hc5Vo0pMA6o2M+tjZeYQKYvYBQV79SEd8wR
 xQUJr4W5ktkj4K2rkDyWKkI263tE/rlO0KnNRVASBsW97C4mkcNGU0/92kksI2aJzA6O
 WykOeYQWnhsyIVK2iPZNa5XBoGyRj2chPgaLu6CdykmAb4qeytkbkHE19/aIRZOj9xeR
 vP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718808430; x=1719413230;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
 b=q6pukyhaJAu72gtw8MMhVusoowQNOTZeXRRsb2owCtTuOJrt5eziOaAi0iVAjGXAlk
 BvTQUs3U0wC9Z5paLZfbXXxLv/Zb/8fYa9ErclUHA4+4cQcbpPqp76nv+/YyveUfAom0
 +tTIltUxdHNaHPzVMZ/XVHEeDoXwt06Ypp80xxcYtr97vhfV4ME0iU4iXuGUvMoPB/yp
 wrBvlD6mnWc55+z2QmCUB5clCmTaeW6a5+oimfWJEp0fQeNLRynT4PCH9/d/WTTF7ab8
 4084kFDNV8WCBd5kGTs5hzVYBgSqPtpgBVGeQkCnr2+Rhfvb7i/zVwryri4NfpaR92+4
 EoCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAmkNb9V7yo/9q3q7lVtWoNb4rMwmX+ySLGmOh4QwGHFpbyXEU19GRkGXYE6iLqhkKK6Ky8cNRPyR7pCuQAruQSoAnm/rUJzs4MJKvb0ZJ
X-Gm-Message-State: AOJu0Yzbfr1T8I7K4p2jgjsWq+MHOfjymQgBs4eY3h3j4wu8aeCqDGT+
 lZoBHIHTynBE4nr7d5D1M3PLHVLfaDwvCQilfrieRRdzzr4XDGcq4fV3s4QBiQw=
X-Google-Smtp-Source: AGHT+IHZjLCp6uoXlXfqQ0RKu5pWr8gxWPkxcPzzjLNo0AhaIUbrnCYVVlqUcTfIBz485mlGmWKOGQ==
X-Received: by 2002:a2e:2e0c:0:b0:2ea:e2d2:6231 with SMTP id
 38308e7fff4ca-2ec3cfe9213mr23132561fa.33.1718808429743; 
 Wed, 19 Jun 2024 07:47:09 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:47:09 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:50 +0200
Subject: [PATCH v6 14/16] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-14-f754ec1a7634@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=cO45G3J6A2HCrNyifwgmbquTtW1hXtTIuXDjiQ9kiyk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9Rr31FcrlNuhRLXo8LEdu75PcCTBqW0u596FYF
 k5UOpl+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUQAKCRArRkmdfjHURSe5EA
 DBeGdSSHpPMzGpeI7wNiG5y2VIzwe/IbVqGnCja84KdFBZP60REsnzx06exUV1LY0J0aEVp+sMhom1
 YR0dWD9pSUFYaJ1MieeF+nhaXBAnabOgoVj0YbdL+QP9oLoGBXPYGkxHH5OQE7ARC88nziL+5IjPpg
 F1eCcUCVDfNzlUqAzVZW0mKPDwsqepJWsZc4IwPyPn+AMdNwCcGi95SWV3ZloRUZMsPNCPo62v3dEj
 TluHhrArRuR0DM4rHGp/+FVGYnzvwzYYmTDkAtEKAtUVTXrTUbnmAgTm8iBONqSjmNxyigDMZqOW/G
 xhWA2aObi+dPX5iBDnzzhvSg94lJhQqs4qkE0D/6i4eDZsxw1AjWtpg7w1TXANsbwIon8nZwf2I5eo
 KaqTTsXIyO3eM3s/m5RIscP0UxdM9uV3c0OVe+FhN9QmpUzKs1f9Ncsx10WXBM4f0XNlPfH4V4Czab
 GhH9t9ehABinDvKvUULzLJM7o3OQ1VStF2S1FRkM7piYcYNhscWQsgwyE/0UbNC7YTIEw50G8IX9Wj
 Achaw7Dp8flH8t/Q0+auOQOjQPszi7eCZtAK8CxXrX2ur5u+7O4O8jUAyfITPt/sIogKMEGF94EW71
 cPBz2Spj7AJZW4378p6XZDWDoziFyqixN6TaLC1d/20pIrKQl6S+zpxGRGgQ==
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

