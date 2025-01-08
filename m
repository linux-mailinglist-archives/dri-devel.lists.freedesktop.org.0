Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BEAA061BC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F88610EC05;
	Wed,  8 Jan 2025 16:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xiiuJnfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A2A10E8FA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:23:52 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5d932eac638so8190986a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736353371; x=1736958171;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EIN3+R/E8p4a1D64k2o8LyTex7GHx1foOgh0nVt0L10=;
 b=xiiuJnfko1tVNqZGFd7ArP+1KDvz7tLCrE+D7/UoMUgI0TvZoCS/TeYyFbrpXpA8Z1
 dH9YhOn0vV3sL5FpIQ2cbdVGsEP1TyRrX9lU1YczT8WHM237HBM4txyHMrOokYTmrsk2
 qJGh8SZ227qnTGR8hTaDtVWEqar0mmXltY95Sb08BLNNO0ZYVLdABvVTPf+Whb6hK3LY
 gs8IMXLKDIK9ziY0ZWcTBXmPq+M+dBRolpdr9OLX9z6MXB1CU9rbCEY9m9hvu12UEZfP
 MmAC7GMvOMBEOHBZlnb4nKbPrVI69NegWgAduPTjMGMCxM9rED8soY1bASqq5zv+HcHw
 z6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736353371; x=1736958171;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EIN3+R/E8p4a1D64k2o8LyTex7GHx1foOgh0nVt0L10=;
 b=XS9iLy8dmOhs3y3F2z8TBEEyjsoRDHIWO/1YhP2jv0vVEurQf0elEPh6DlZAmqdWgi
 gfP9tCDyTgsNlKrURgGaEKb6SYxqOB88cgalpcXP5LVVLKNt70Q942TcMMNBbHecmOPa
 tE3tAGpnKVevJNlmtCjIuqHACMjiTES6exEA3NrKE3c0KnuQWasohqZQ4wgnCmhJu9jP
 VreFKI7FPw9NJJ0AdJW1stJ4QIzBST8i7Buz5yTAfBkmJ0W4LnoxdFtcqjHMH3v0Tn8T
 0q5kK/68SX5SxwGCN7VzWeQrOIi+Fcf6a28tA/LfUNNH9F/nWgNt7WcGVoAvL1GexBbL
 snfw==
X-Gm-Message-State: AOJu0Yy/JbYjK5p4xlLwA8qG4qqqqierwMaKOIBxQe+q+Jw36TvVRH8n
 dmhFaXvE6Qs7Lai7WDk/a7PS8drvUf3QrTElB+/phApJCBheSavF7Z7duXArSRRL4GVlPEEFAoA
 2h8E=
X-Gm-Gg: ASbGnctqY62NVVfR5H3Yex+dF+J32YcD+9IKpH+wrskoY4lKmVAn0+bzI6AJkqygNcV
 gpI4Moy3QUHXJToXsRgmylfA9F7M6DNjtdBD2/u6vQNmVXPiNT2ueFS1MKnSnboD3wgaaovYVZz
 lYU2b7Wc0KbJgzeqAMH1SiroOpAO0JNwo22YGEAOuItYIzMq5/xxkvkE7/23zG57dAxeArFAYYX
 kDYUkUyGtycs4NFleFDwAeTnFH6KA8ThNK9WJ1Son4yPqZgjRI9I5e2Joei
X-Google-Smtp-Source: AGHT+IEosujTc3WZYpXQT40YfA80yrGf731lKmLgaCb0a9KQqnzVjj8O3xm82vCLoJawvZiZZYjb4w==
X-Received: by 2002:a05:600c:35c1:b0:42f:7e87:3438 with SMTP id
 5b1f17b1804b1-436e255ebb9mr33197665e9.0.1736352952087; 
 Wed, 08 Jan 2025 08:15:52 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 08:15:51 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 08 Jan 2025 17:15:46 +0100
Subject: [PATCH v5 4/7] arm64: defconfig: enable display connector support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-4-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=687; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=z5v/37P5GAIdDLJPdviMCJVcm6R2ZLfW0o63bhtsj3k=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSyJp38Z4BVjerOBBWOKbJ1Lv9thI8YXcWeAwmO
 81RFWKWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksgAKCRArRkmdfjHURdS1EA
 CCAaOP4XUm/YJjD/FhPHZoz0GAp6Do0Jzcpqb39fjQf06aIytMLTKp7uIzjiLlvQrlpzW08KdneV3C
 Xge4Aw71aWaUII3nxuZC1I1ea/Ic3onBXuk2/vowGapquz6prNOTeqSv3dwJGtZRPT9RJlxPJjMWaR
 GUuFRfNEFtC9VU3wu695kAbau/zXGpWdQD3iKVxO6rQCVqOpShFNxSgc6yzkZd31K/gOWcS4aC/jeJ
 EyG5CDTrw75sHwlCLr1fwGiMqeTvqZP0OJF6pcg3vH6hoezfjKD40rSOHFq0N76BuFG/FVGTnNrYmM
 nvP4B04usjbOVqH7ObzhOTGthKNf9X44fgWBk6xJhtgPyAftkCbyWEXpJUtqGpXlIquxVJeNeplRJ7
 RQqcWC+RJFjLMNqeyqBuBaDd4MFftMEa3TnfetzylAG+RxJ8rVarswdVmWBzl3c7kCmaQO2VY9KhnE
 z83X7zmZDv0fZ8ZEKHbqvWbMLW4rOq14YJuu/MuUuCMd/op68zsHD/o2MFWXjGzqpc4EUb6ULU1roa
 3KBIvljq9+WIQ14j8pSzbZfcpBwTlxXuAqJLAn9E0lxYkE2fDo0dkt1Lu7uv+j5V8QMev18XJPk90C
 lbNvmR+AJE2HPeQJ5UnDntTJ5fkXjqedj7dc+LZ4Ti4kNTFXMAIapcsA/k4Q==
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

Enable this feature for the i350-evk HDMI connector support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..b2db31e010ff 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -900,6 +900,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1

