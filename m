Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BE7867785
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5029310F1F2;
	Mon, 26 Feb 2024 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ubgqa9DS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B36010F1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:27 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-412a38e2adaso8268555e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956145; x=1709560945;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SzteyAfQmYgd04c3xIbcEszPYVc0e3vP5LLdlStO4ro=;
 b=Ubgqa9DS6nq4fDhRbokZxksgM7qDGUrreA01WWHO+sl9XOMIElNJA2/tzqpFi7EK7y
 wJKs6jGO0biftrE0qWVF8WImnLicOYtKTglSpKaMufSMtL3J8WQlyZhfbQegah6bJ5lL
 g3A5CDfpwU0v3jowl4CdLczpYb9LlGdfhLLMpCEx+hM/yqnJkx5mrMc9Ok0AwRP0h2nY
 jYeoj6GI7F+UYgwCs+ErC9y/WkDD+LIdR0Fcl/hqSOG3mR2Fw7mbh5U2NIUTknXIsLTB
 1+8Yn84Rc4d4vA2NF1a/XYftCIVg5sH1MZsLMMffkrii0Pbilu3FS6rWyx0KVB6VthZ6
 5dfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956145; x=1709560945;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzteyAfQmYgd04c3xIbcEszPYVc0e3vP5LLdlStO4ro=;
 b=u7mS53OyXQXNgEcYF6KlvwSyABWLL6jYApfErVS4GymzWNY4iyScMFi61HcEYTEWi0
 BiaYXWbuZYHiHY80yPFGc1HGGN5HK8bhjDhDBffzfOWlYDITWUzfu52TCl9UooJEkipV
 ZUTPY8/y5vJ2tV1XUbqsBcrcIkZyoP9PShbnOmNnLx5Gly6w2vMqVcl6q1I3A6QC1s5u
 vmd1YW479VeWnGjASVf3m7slTPfH1diES/s83ZcjLYsIz0hC5j1Dc+C5xLBvlXEtEhiD
 cA9zYsAZJWhgw1ZRJM+Se/P3fI51VqxZ89clh6H4D/uGRE4CrjuTJcrDZ/rgyFvHPyeu
 W8GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1PNG06Rg7TCONDyNNPc5HteubCg3LecL/bb5nt+/25FGJA6cw6nDWrpAn8lHrkkiuFec54PpkOwEsgLvK/8aG4h5Ef43FaeUReRO00ojV
X-Gm-Message-State: AOJu0YymlDwFtrd3UrH6B4dtujghhCOCG41i7GeSXemvu9TsrvZIN2EL
 nAi1OIJB3ft+2lb6UsrRDHQtaEyqabsFfgfk8crVfhUl4nXG/8Y5/RX/7g4KPZ0=
X-Google-Smtp-Source: AGHT+IFc3ZtCNmpbpEYAJHKn2ZQ9YqyPoGmBc4eBeC0117sAQ472ltXWjc/Xa516gqcnqMw1sOOt8w==
X-Received: by 2002:a05:600c:a001:b0:412:a47d:1fb2 with SMTP id
 jg1-20020a05600ca00100b00412a47d1fb2mr2070382wmb.19.1708956145474; 
 Mon, 26 Feb 2024 06:02:25 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:25 -0800 (PST)
From: amergnat@baylibre.com
Date: Mon, 26 Feb 2024 15:01:51 +0100
Subject: [PATCH 13/18] mfd: mt6397-core: register mt6357 sound codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-13-4fa1cea1667f@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=Z2yJ/oBlNczeCIJzQKH6oIlg8xoLP0FDW9ftHO97UdY=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncCWphAeGutpqeyL4/OPzJoTjMSUOe7sBai3g6
 KqqPwIGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURT3eD/
 oDk2BfGI180002+laCNdSwG+8z26O11oUe+X/vcITvLRl8uMowpsX2Oia6rHtaeJPd49fFMgyUOtDs
 0uSjOeVUMe45iYIOiO+dGqIn59SpKw13K0I31SEsg8661CYSTrUJkpKX3DsLbcDAu6wkg/t7BY3TPT
 ELDPQZlEUPun5D8HIIiNND00hiLwznLngaPPr9ju83cpvSrmsKngPH5uUEDFQ8aRL8jB6E2ue+5ePA
 tN/9r+yw/ID3Z42bTGjN1DumsEKB7hEqM3+dn82SOwsYK9e3G16spC7a2f3xwUkbNEDVAtkOT+N+9j
 e3loRcMxyTqSh1PWd3ByYdW9aV98q0rIcvxlkJNINdHhglQgWgGRNQJTXHUfyj4eEAbYLSlX27tPnv
 X3LJQ7qBhetlZcd/OR4YUcgWxF2L7AXwytkKKpv74Cv1kfNvrUNZG3TVO7C/DJzItl9yJqbTRdNkSV
 Vnlb+Zjcl75QjgM5OsgAZ0rdR5fvOEEmXEEJrthVt7qTY/0ozZVmricnmd4Dktxjg41iHqFF/7E4WZ
 FscF9yqDi1c0990MlHE/WcHu0TBepjrpd6XHKE+1l8D3fetAhFuGgNrD7RKBWgUb/E55GPU1bVl4rZ
 Lijf6U8oITrWDehsCRAyvjTtqEximqHMFOv0UsiSeSUKtNkIyoy7FmYMhdZQ==
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

From: Fabien Parent <fparent@baylibre.com>

Add MT6357 codec entry in the MFD driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 4449dde05021..4fd4a2da5ad7 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -141,6 +141,9 @@ static const struct mfd_cell mt6357_devs[] = {
 		.num_resources = ARRAY_SIZE(mt6357_rtc_resources),
 		.resources = mt6357_rtc_resources,
 		.of_compatible = "mediatek,mt6357-rtc",
+	}, {
+		.name = "mt6357-sound",
+		.of_compatible = "mediatek,mt6357-sound"
 	}, {
 		.name = "mtk-pmic-keys",
 		.num_resources = ARRAY_SIZE(mt6357_keys_resources),

-- 
2.25.1

