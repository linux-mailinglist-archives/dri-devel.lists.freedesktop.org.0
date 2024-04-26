Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851578B3DDB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7337011266B;
	Fri, 26 Apr 2024 17:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zfbEzkln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6972310ECC4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:23:03 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a5200202c1bso311623466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152182; x=1714756982;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xcpfNzgF4Pxbm0LNn8/0bg6Ray8UkamWuHdRS27GJF4=;
 b=zfbEzklnVSGXw0sD/8OCMEJsr/KW/hU8aLy4kmVc9VnPrjQ8mqJKMHFhWKr/CeO2m1
 9RA+FiB+JHsgLwTUdFvSyEnhjez3xvmhGqBAtW6gRLNFtaX0kGF9RwH7thKKwCKndqT4
 z4fFHfmYvRiig2i3ELrnn5OE5d1KNSBisrXcynNhnLJp+zPcH2gSaRdlpbSzOyTTF0pA
 8Ij0x/jq6a14kDaCC9ofv8ERhCSwq1lpbnyT8GL/UjghuGsi8pxIxFpG1gyI0s4tg01s
 FWJO4Q6TIx4Az1UnUMzOgaIfsV6G/bisvKRm7l7C2GnuGvQe409kntLeic7cGwfePVsI
 M5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152182; x=1714756982;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcpfNzgF4Pxbm0LNn8/0bg6Ray8UkamWuHdRS27GJF4=;
 b=dsrmRIOiEF8NOmdDavh2fTshRMuLq5Qun9tF95zNj8DvqCUcDZQB+XRBCloK2BYo0/
 Z321zlJrgQT2zrHuS3240bAuYdG0m7WQMLlyz6c7GA/jUql2CEDf+c1Eu8s+dCxy8G73
 qfozfkeaOmriJBaVN3/WPIOVCCZuuB7Yi82RimNr/Y1xMHwGVnT3yK9LmE3+3Roc7A9n
 N91YTbex8bQm/wBQhhrx47a0ZnFkumbQKHZY7n2d4lNek8loEJZNA+OtbdeUYFjs6D5h
 43sZLa8QP6g/1V9EJrPk9mU0i2q3SqwWZ1FDLYWSdMGn09Yg4X7K59V5LpqBwaEixcZZ
 D+gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC5j4Ap7bRjRHgEKurioCirM+ybnstKvGQ7gy1+Oltwp7e0hc1t0lb9is0i18kQORJiXq10qxAhrkXOq9615ArZP3NASkIu1VEH003d1Ch
X-Gm-Message-State: AOJu0YxYWNHC7yVAkNdRWmGzXFpK+/8Bfn7rYINDLP6lsJDWPRF+JH1C
 t2q6hO2nrWx4ubzaubAxq2ooMB2qzn0HjXDy/0FXBwkw1irDdGor0YxQ5Xh43pA=
X-Google-Smtp-Source: AGHT+IGmV772pWcBFFswx8n1IxjhIJ0x0YA21t+MT9LToWGyNEPcTNukKiSKMrBp3S1NfSOajrN0ng==
X-Received: by 2002:a17:906:a891:b0:a52:6159:5064 with SMTP id
 ha17-20020a170906a89100b00a5261595064mr3051872ejb.52.1714152181727; 
 Fri, 26 Apr 2024 10:23:01 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:23:01 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:43 +0200
Subject: [PATCH v4 14/16] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-14-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=rklTeGdgjcr8HpkwnLXFeP3xtFTG5m2BfNOFT4tOLv8=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaCp9ZVTItyYTqXVHXkRe07IHi+GgD/LNAxSnV
 VoN96EmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURXNkD/
 9u5HUKfktWXA52P/DVWjf9SNrUwcHyS+3vetaBi7qI27CfzXCbQDJnpz3/PL3n0C79B6A+sX1jkGKM
 60cKtdXeibqQo+DbAVJnZhxN7ijZz+xCslh96h8NwTXPDIJzXg/GrP0LOT8j6YzTyDD2akcTG8Nq5k
 ynO+FcnNN3kk1Trt+Fqq/nlY6IS9FqMiYj68Ch3zQzv5galw8rzUGmwK1ytAk1mf+GffJeauLZjIWz
 PnS7NB2gzhbf/4NlURVM6EKl0qLWeQfHhQY07nstES4z1CfygEoGrTpb0+9Z0D0d3gqk9FPNyKF3rt
 IXF6DiuXwJY/P7yVqHSU0po05JBpT+ghWfZcdRe7a/NqzqAWPsgY1Y+Ug6UGVpef5v23LEttxXBzfe
 WlFRJz6TQT5O93zSsmp/p/Ccds+tq9smGidiQ6DFPjo1v9YtGcm8MmdmyXQjozN1UiElk5LYl/kSiy
 IOe88WsQ0dTYG/BVomOdUsrpMZrOsZ2DYhYHdDsE2bziUj/cngmXdlb9vJ9nPZclz5mecfo5AlsdBQ
 ZeAMfQKMVO1NY1Ad5qR78yXmyzKTtkr0Qnw9m0flAeyf79Zcv1OP7/SngMLkOvUQcORd5Jaa4hDDVo
 wl1VU0X6TjlmCfEzejZsMNIHMrgmGvnc5dkIqrenbp/4WcHgE5xdWjOQCDWQ==
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
index 998b71d5789e..faf39d837674 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -948,6 +948,8 @@ CONFIG_SND_SOC_MT8192=m
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

