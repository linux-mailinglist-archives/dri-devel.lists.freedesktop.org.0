Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FC4938941
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 08:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDCA10E382;
	Mon, 22 Jul 2024 06:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K1pDWXHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7F310E38B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 06:54:10 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5a10bb7b237so3095651a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631249; x=1722236049;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f+u7W92havYZUIlpwYblhqqwSvlNhEzQdYNsq1VBwl0=;
 b=K1pDWXHW8x2FkIXU44anHA8FkMM6RLGzLpaMUErIFxe1maCL6Hubn9OtMiOJ8JDc4x
 QHMiI4wZH47dKAZcPHd9r4UDwcTQg8QavlihRkMXmxVdvAjgvh0k80DgsnrAKGWv6u8o
 6Ff5gjJIpB6BiCSbKLz+kTTTayb9//T2Xs/CaTi72o55yO3XpegDxs9F6UKNQGTHiXUe
 nhdfo1Ynfv4Z9ir2rU/3LhK/9btbmiKrhFNo5TQ9WxL5vCC0j1shzEzqZH9bwg6v6+lQ
 V2ZENlpb3RsS0ZqjfcvIvTujTtmieIj3vuQPNLsFn70QFgudoJVy6szKRiqngvuEYS6f
 MA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721631249; x=1722236049;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+u7W92havYZUIlpwYblhqqwSvlNhEzQdYNsq1VBwl0=;
 b=fiDcXyauKcHWepwY0BkkNUfhTHJ0+e4q5kIf4/89F2b4hIJu4dbCQ1rkESJmLoRvIr
 6zFXLatnlf2W62vFrSbETIkPxe3RwY8/9BaZhC8aV/vEPMdYuZ4iiZ+D1IXRXpVexvgn
 Nh1SrBtvMhH8hYiICgkbuY/MTy1kAx7Xcz8scKjxdopx8hBRh7GcC24BqwE7HKv015wD
 HkV86wvXfZkRyYWRiahrEC5HdDFhE/z046Xes5jU7EB8QkoUwO/iR9fXpdncSp5fOThy
 1l9j1cj+Adh2FTdfmcmHGn3pXSvxzoPK8J8qokfWaGeSsmmoIdlTkm5AVuhoOv9sR0fs
 DgHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1REZMO9gAr8lmDDS87yhtitg5sFWsuQdnsJNutIE+OXfdPHOsDVcL9e1RWyTMzG2lWt8u0FFxg1Z7wIKpKu19h8bZiG3qzAKvWmbG4VO/
X-Gm-Message-State: AOJu0YxN3uNJIVv5gT7a0HoDj5G0PEIBCh6INGQp9MeKo6I8nGvpufBj
 5k4/qGyu7y/4ug5XGAZrVg6vAP3lK7kkU2mphabqnsNOSTs74dcppeAk2cCDGzg=
X-Google-Smtp-Source: AGHT+IFujFs1sGJ63tkG3t7eMu1L5vDcioENHIjwLFIzn8k7Yeds1uPgGTvzxdZX7AvLMdrnfahf2Q==
X-Received: by 2002:a05:6402:11cb:b0:5a1:225b:4233 with SMTP id
 4fb4d7f45d1cf-5a47ab11d7cmr4605872a12.23.1721631249220; 
 Sun, 21 Jul 2024 23:54:09 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 23:54:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:43 +0200
Subject: [PATCH v7 14/16] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-14-6518d953a141@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=Bna7lGeZ34+vVkeOzBYfhldONP25svJS8tOELxKnAgI=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHxfVG6iGXjQ3z31grSqs43cXnJ8FDoaVpwi344
 ojLOAjiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8QAKCRArRkmdfjHURb7yD/
 wLghhgERwAWzgSENdpf8qwjr9EiINrnkjpHshQg2NvDsSIy1UW/NMQy6Myi//74u8oHK5pJO+TaH4c
 Ed2SXiuRRDhe7S3zuA21M76Jr4Iv4f0UuDj80IzZJBTGlRYOLfNqTVHae/d1gh9im520TqF7TP0aXZ
 wukLxf3ne058bpAR6fEbjyur714glk8JJCjTruN7K8RctI2aPazvPLGS66ANsZ/dF2zR1dGCUiGRaQ
 XXLxBDpMtK9fZvAbk+QP2oH182xD1cZGK5KlwqbjNk3yf5YOBANZgXeJyrANpV1Dyym69dHJfaxzzy
 czFDKbl35fJqiehFpoPmTZN8O+S5A3a9WIJf8KAleXeralPjD0/EkyVg8HPr0U2PxlY/TYQX2ikeHw
 M1pXop4pqlmZTXGBcAiJW+CzmVmDASqyVkg/eBvs7503s/NxC0qWBbVgYu64nTmAeafjD4R8PKGV4R
 GohN9mo7c6ZUDz4uI6LkA6qr8IcaGawsEPiuPdnXzUWYPS0NRQYmZzogAoXz4af0U4fVf5u1ECsxPc
 r1ERZ8jJ7bkO+Wsrx0+sRsdf0RDr8IdCOqQ+Y1QJfiirrIwq4ue8xqTl+Usbw3+gN6erRmvhftYUng
 /DTVMBN6rV4SgL6SEwU7MLGsshxHkqWfqNooLzCys81e6/o112VdofNKAnew==
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
index a6c9688fee0e..f16ac6a0fd46 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -949,6 +949,8 @@ CONFIG_SND_SOC_MT8192=m
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

