Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDFCA0920E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C6C10F0CD;
	Fri, 10 Jan 2025 13:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zwV/I9Jq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B801A10F0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:32:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso1117917f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515886; x=1737120686;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=czQovKHFJiawW3q43/tzxcBianm24ydViBCbQnMA+dM=;
 b=zwV/I9JqiYA7aJGFAWpgJ17KkFO6Z8xiaINRJIgIdLAIZXgfZMMHy0qO/gBbIETVRg
 x+YIKaVLZ1SyMvSoR4ts9VOee0SANO2bQJfH9KqQHRRlacw0X4gDlHW/BdhtD8wpHZWa
 E8ETCP+I7zIRedTdksUN5m5ojanBFRLHV9KRPZGatJuFuSChZG4lFWApoTBHHkuQl+pT
 6mTycpKjKoDD1xack2jjnjw1lVpdG5y9OiRDPIODU7AYyqOhJF0nCHazDPFFSJzsOaJ0
 e/wQ2hs3S6NG7UqYzJrw5hdk4Yb8bAl0LLrhYPgdgTe4UNZgvt/8J2mUu0uShGp9TQvu
 0sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736515886; x=1737120686;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czQovKHFJiawW3q43/tzxcBianm24ydViBCbQnMA+dM=;
 b=vJdcQq833F8hCh1ReNxfrdtoHvJMQGXMAdEPy2sUrzs3drKuCYwmJuVsEj9h51ek4L
 TFBFT2YlqpLV5TKiqBwRogGd1OUvUpJkQiEI5fQcTytMwdbefZAlTDU+lJf3pJ75G6DH
 kjTfUy04tGSWDIhsTtKSEH5UC3+rnXO05kN/P5QAms+rP8pxi2JfJT0GTwLeIFQLs3Xr
 cCoa7GPl3KVX5QMpc8wrG0h5ykb2TQxQM+c73mDgIio0w33CmCasMd8cyrXf0y2gsw3+
 Pa5xyUZNfUBsqZEUDOHD3iXaJx2V8Jag7PmvwNthxk83Hp922Jri9v73KVikhSXXq2lZ
 TfKQ==
X-Gm-Message-State: AOJu0YwC526qwkJHNgazHJ6TsaY6DFicrsX5s94uP8WJcJTnySMjZtEy
 GuXoJwnj9OkfzkLWGQTD9wih0VRKAD3BS8JSbr00mHn5HHjr8HhG9V5uHL7Svwg=
X-Gm-Gg: ASbGncvMzcv5f44ZsEofdRBzfynRKfnD616k9DG67p3Kkx84CrKAMOEmK/Y01186zJC
 i+649XF1JpFYoTsi0YJUSnPKrCfcjwvLDzWr2d3zEecISid+9sI7At3Y4lZa81hwgvdfNiY/gML
 1kZoPRAWdNqUm7R6YEsAx0ZQxeSNXuQnwIqFkzsqhRzrxeK5P8MV9ruZrpz9tFTEOo1KhBDkLAL
 4FTHsIxLEdYT/ZRYD+tM4MTsv83Tiea2XAJewx/W4WwhbhyjCKuMInDxTot
X-Google-Smtp-Source: AGHT+IGPagTUjFwrYYmmjtjuTfXbN2bDVAsHyXfD27cOpCNW2lmXYAioeDkCa1NDyoNEQON0v8I1+w==
X-Received: by 2002:a05:6000:710:b0:385:f4db:e33b with SMTP id
 ffacd0b85a97d-38a872db2c7mr10663137f8f.21.1736515886322; 
 Fri, 10 Jan 2025 05:31:26 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:31:25 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 10 Jan 2025 14:31:14 +0100
Subject: [PATCH v7 4/6] arm64: defconfig: enable display support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-4-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=/FrM5Q7dkW2P/a4wYWyi5MUyL8Mql8ICFVAZt1ovMlM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEnoSo2eM6ojRqCmld2hpFcaxilavl+I21EUqLr
 Kup6t+SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURQB7D/
 9A/L91PiiGu2rK2SMP9XGcogr6oaqx6UZaDXrDKetU5D8kgdn7C2qhIjPzekgzy5B8ZbekLxqmm7YW
 PMw7IdT778IA30r2Dv3xkkjoe0EZZ39x+QTxTLbhd4xFSQLL08xnf2BExPVCJMrVBA0gI0zjNxw0dB
 UvzNve5p8WDSB3b8EYX7Tcx2r4tnFWRhlv5uaGziE2vIyxMAEVAzO/jwryBD4w9IoU4GIHp2w5rmsd
 i8l+fwpJp+rvhZUIrm86OU282/J5plCcuCG9NdxJjwAf73Q4m5qAhyz3JQtrFWEsv9/a3FY5FjFgLG
 Kp/dJXr4rspqMnXVGnIc+9yfRR6JdtGODsq9d80FoqkPQ8HQ+Qz8bbaHAg63EOTIFx4KX2nAdXqQSJ
 H3POeEMfpRMigfsIDX0mKw3KJzpRVdfwYKk8zOiKvjsIGq+c9HBXz8mQmq92oPyHH17wBN3EFKfTN9
 Q7x5bPl88hrGjH927T7r6sPCPckmUgZ+oooJjucg3R3CbiEClThzYPsswxpict7DcNfnzz0sXGG6wr
 wNIw7x1GPN2cVka5ughYRn4aARpjw1XAlAmKyGN2rQK7ToCTkoNYzW2VBzi22tLfe+hyreHgTB+9MS
 ThR/RoVxRpcIOa3VzZ5G2cb4Fur8bl/CNAQT5uJ0J0LAczK9D9jTqY/jMpjQ==
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

Enable the DRM HDMI connector support and the MIPI-DSI display
Startek KD070FHFID015 panel to have HDMI and DSI display working
on the mt8365-evk board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..1e2963a13500 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1

