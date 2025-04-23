Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E163AA985B2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 11:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D930D10E41D;
	Wed, 23 Apr 2025 09:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="QNsrgikE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E434410E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 09:36:54 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-22423adf751so62853845ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745401014; x=1746005814; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+QxK+Tc2ZVbe+5BePsqof8LIo5Vk1Mj0GQ50Wfpr8bE=;
 b=QNsrgikEg7X5eesELA59KRIK9uQ0oye2ISt4rH1NzqMVIApw8YX/4K8MNVR83hbLqa
 E1d7Uiutv/TkUPToET9LKIFCc1DqRrI7jOUbPu3EhpkO36SuQahyNUKk0eMIHKKqq9pg
 LCBNHqErYU5cFruOWYO9Q+EnNoJrBnHYsYVaxNDPXCjV16cfHf78Q09/0Ep1KHhyeScL
 0ir1dFAziQVnClEQDxZqmBHPP4VBUHgKg7k/rfBhbRmUNvDvywBlzgsF6K6c1wDVyk2V
 n9xLHJLapMwsPWyxWUy0yz7DaAakAEVQzrvZPU54sDhMSWQWlxNZ2YcyrpfyDJZ1OwZI
 rOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745401014; x=1746005814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+QxK+Tc2ZVbe+5BePsqof8LIo5Vk1Mj0GQ50Wfpr8bE=;
 b=oHhLw9eZjCkl1J7zUftaAriNunvq2yy6LQKehOfppsX1qzDYPjnnpGh++VO2NsVz6Y
 mKHJ9ZY/nopw4K2OcKnLUVbuGVHukIXh4Nse9SAKNTPPBq125/l5FU1Urc53gGYAfAfM
 2Z5FiEhGPeiE5XgjuiU8W3ylVRkcQkiREM5sFMX/MmJWnAeA9ynQlxhCzs4z63Q3XMB0
 b76ZU/gM53oTEVQ2UHnk77kLAkGDWD8+CEW7E4vx0x3fLAP8/jvJ3saFS4Z6KoYaPNLi
 ID2TfWil8Q1Lehmi55aGS4x1Zlin1RjPS9W1DOFyE/kHpkdOoMcdobDwYpmPyhPkaUTk
 kzFQ==
X-Gm-Message-State: AOJu0YwnEkPkkd+TpJk09bjAQL4m4Em6PpyUyEVw3ykjc1IDVLDimEgJ
 o8dnVsV7fxXYtOT7sYBTxrVdVKaO50LSNDD1at8u6K9A6J3219d6pq/8z1Ociz4=
X-Gm-Gg: ASbGncuu/W3DCfYHzklNceLFw1pBcw5O+PNg5wt1XrRg0ij6WQDaJ2K9+0OznwLJ+TK
 u/0delqWpB5BpxOoXuaEY1l8+/PsE3GptxmvszhUbUc9eQAweLQktkztpVESgei1mBNeqwKIT+F
 2bDBCFyA/9GBZe9Mwbsid3pU7KNSJHiCckAaOym43fv70ernfjgoANqBKCqN3rMXGed9eXqZRnt
 gUJsksVMh3jOqgZE/gxAIzb9ubSmCm3Nle3+Dcc8hsiLBEGFK54s+yuVNgkAeqvSdZoQS3HPuF4
 uh8OhFKEYkKWtvbsKDg5Tv1McbHlJ5bHQg6KSWb1y0wcJJwNKLMF4E8mX6Ct4RHnabuSAo370e8
 =
X-Google-Smtp-Source: AGHT+IFGuOW6Tpkgou6NY/aO5b7J0ZgNyZb2L7+1Em7PC2gecYR8PaSxzzzBVlry/acNwbDrg5EeYA==
X-Received: by 2002:a17:903:3c43:b0:223:501c:7576 with SMTP id
 d9443c01a7336-22c53583deamr299094675ad.12.1745401014467; 
 Wed, 23 Apr 2025 02:36:54 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50ecec54sm99557885ad.168.2025.04.23.02.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 02:36:54 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v10 0/2]
Date: Wed, 23 Apr 2025 17:36:45 +0800
Message-Id: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is v10 of the MT8186 Chromebook device tree series.
---
Changes in v10:
- PATCH 1/2: Add enum for ponyta sku.
- Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v9:
- PATCH 2/2: Add sound model to fix the warning.
- Link to v8:https://lore.kernel.org/all/20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v8:
- PATCH 1/2: Remove custom label.
- PATCH 2/2: Change the commit about ponyta.
- Link to v7:https://lore.kernel.org/all/20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v7:
- PATCH 2/2: Remove prototype sku.
- PATCH 2/2: Disable the other trackpad to enable one of them.
- Link to v5:https://lore.kernel.org/all/20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v6:
- No change.

Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- PATCH 2/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 0/2: Add the modify records.
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 2/2: Modify the dtb name without rev2.
- Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/

Jianeng Ceng (2):
  dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
  arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     | 13 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1

