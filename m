Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F324867795
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295A610F204;
	Mon, 26 Feb 2024 14:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yaXmHbP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E46710F1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:31 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso49832011fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956149; x=1709560949;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zRzHz2xswbllHIIRa+KrVi40UoddaC27mYKCsGC8B5M=;
 b=yaXmHbP+DABS/ELVDrvx1QcAcplV2J4ts6tnMr/0Lnrz82hG3THaLWmruNL6wcKksx
 S/6Hq9fpY2QFhb9M8LyBPMQAM2SWssMG8g67Owe+dEQfWmLxJB20aHGJO4HQMxA+N8/A
 RRJ8KI1nGdiIg3q+DJiC7prcYm5nx2I1y+a6lNybaJ6SQHIGG6gtjQKC6dm+/b3L9jXE
 oyliHxC/8+bvgKYVBa05x8UWUApNuiKsWSL3ShZC4JnAACH6ik1C8pAtCa3NYDKvuNxd
 6BILLofZMK7+vbBWpE5yMsWwK/ybEIvAgnEOH9sCi3gMD0Tb2cJpTKiRuiV61smnh88P
 ZoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956149; x=1709560949;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRzHz2xswbllHIIRa+KrVi40UoddaC27mYKCsGC8B5M=;
 b=QbZ3u+7/dS6c1wBjZUlm9go+S5pZpIi7913urdFGw4uDA6DJy2bER+AgmMXHX9BbQa
 iO3Y1mmri9v4JMZ2HsSLj1zUvueVQHq5owlm/EoEBTsIzghl4bGUcTmtLhxOmGQW1wE1
 yGva1hoC9KPvXuFPyufP2h8tQbF//fblXCDw9Noq9h0RdDNeilVkq3zHOX5VYdGXQrCw
 +X/MT9ZIXPH5iazmwssHANc4cOMpf8nmaRoRZbp5pk6JvcO9i+LgXHWhapisI9012xEC
 GxormdKIy20NWWEws1iPr8EX5LQ5AAie6KIii68pAHXnRUlz4WTWEZJwNZ/mP0Vz26iX
 37wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE5/VSA6DMrce3lDY08mSlLfAlS2H9V+UojUGtrKewsNY2xP+ZCRbhFAg4fRAlikwLmw03lsADqjwuq3/Jbd7n0OzpjSW7rJK5cqV6Fkn2
X-Gm-Message-State: AOJu0YyMfeN+nq/Jlv1Bw030fb9Ums8gjss1ucNOD38/r9FO9kJTs78R
 2A+wowZz/KX2QrFKqiPokJNHDfY00ETwJkIPSNFEhZCDSq3q7nG5liWo9OVxKbw=
X-Google-Smtp-Source: AGHT+IF3qwR9Gc+h1O6WyIDdP7kIsfb8il8xKzj6tOQtu9QhZUg+J5sdQ8PPlj87e4Oz8wu+C95RXg==
X-Received: by 2002:a2e:9247:0:b0:2d2:9185:2017 with SMTP id
 v7-20020a2e9247000000b002d291852017mr550055ljg.17.1708956149131; 
 Mon, 26 Feb 2024 06:02:29 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:28 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:54 +0100
Subject: [PATCH 16/18] arm64: dts: mediatek: add mt6357 audio codec support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-16-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=wXzcoZ01ca5dM7JiP+jpbdH0FdMDFiDQ13DjfVwqVVs=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JndPcSE5JSY3z1YtT9jmziw95lzTv7FpKPgFmzb
 WqBD0pyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURQ4gD/
 45DtjX8QtQ9BlpoeQoUHYlLB65IVbXtkjFBMq1f3miUNgR/FSQpZ71R4jQLQ9TUUy/X6lsq1+5i0+m
 xbD5HeTgN/G7posNpd1nPboTHB/+/7edI6JQwqTfaOOh1ihqQUOk0e+FSQHEb00SBIubf/1gPzKWJ8
 pGBTnVMV55xcvqL0QuVarAxPho9t9JKKGENCNytIoPk+Ufd21qFJ4H/w6sbta/F5XQyrj2UmQcPUhH
 wyP/DFzz0c8/f0Xx/BLOpuO+/9HjIpv2bxvLLEfgaXD6ap8ZqhuAUP1VgXHWdoPY/k/WE/zutLBILv
 k0R59zI+yJZA9JTJuHF2RJ33LtLQn6YaiKoHjD7PCO0PvdrvnRRzBB+udbHUAj9sIPLjb1JovChRhM
 SFGQIhRV76UfeL7wiVwUdh/jgsW57n78DhFBsc4ckarEvb6C9u5fgiHCCxc+Hg2q3XxZTvRKy9M4ox
 3VMUdtp8ownC1VrR/sQxlHByUgvK8TzwKMwQ0SKRBqhduIs4nF23/tVX7Jo/tRge/28AhdBSHFOe1p
 ALtfws/Gzp0JaH1zGHdJGLwb2JvAf5ugK56diBaEvIMfQsWGFazGdJBtfzKNT6D3UhbTeofnTuSn62
 3boyWxQP16ra4yZJ6OJxzL65SIXw1oLRwvNl57L7wmG/3u/EIp3AdGKmD+iQ==
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
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 3330a03c2f74..64b693049930 100644
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
@@ -10,6 +10,10 @@ &pwrap {
 	mt6357_pmic: pmic {
 		compatible = "mediatek,mt6357";
 
+		codec {
+			compatible = "mediatek,mt6357-sound";
+		};
+
 		regulators {
 			mt6357_vproc_reg: buck-vproc {
 				regulator-name = "vproc";

-- 
2.25.1

