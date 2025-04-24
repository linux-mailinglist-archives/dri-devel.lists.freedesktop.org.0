Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68FCA99DC5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 03:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C0C10E42F;
	Thu, 24 Apr 2025 01:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="xejFZvxk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB8610E2F6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 01:08:57 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7394945d37eso339767b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 18:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745456937; x=1746061737; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=96K+mNY7OtOPr52dzDB019LRxvI9XjhygxeglXZ6I3Y=;
 b=xejFZvxkMTDHH8HqsM/Rq8RHjrJ/XjEiKYMYZT+aLAHdxogl69yTIdkAYx+mY6fR5O
 aYmVaxaG4Zqdz6+5BIhFBkDAGqNE/tbXeGefNaSgVFqe8J3pRdMqCWIxsYU9NpOCg289
 yJOIvd0vm0Xe+lsJ7J6wqv+SAIKDaS8xWZ/pyNhIq+Lv9RE5Brn/dP4aFYwh7CmK2axk
 Lj62yfH3YTCK8Gu37GGAMle0Ye64/FWAjhhAcoNRQ+riHzdmI7Ffque0/Tc7ZTnwff3M
 5/6Qq7j70px2yLi1M8AlivP8uYVoO7z6nVaxHSyjpG7qEl/W3RtOVDF9JrcADenEckh+
 NeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745456937; x=1746061737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=96K+mNY7OtOPr52dzDB019LRxvI9XjhygxeglXZ6I3Y=;
 b=jBQy7V3zahTmv0jSX+luMVz//F9SdXFkNkC5iTg36o/1FgR3lWQ+3eC8AtnJGVAgbk
 A79n1tYag+Oz3Et6jOt6mopsealMxyLWB2aanvfCWBIquHAOjKb1ooRf9YzBWZ/aZpBf
 kmv9lAPp924LX2vI8cJn58UbJGumSSjXQr13pPvLbzTaMPcj0ewUSzeD5Iz4f525wdGb
 7XKrbpKmcId3vWd3POfVt36CyNO9wDOrZrBddRPO+1u5HZyV9eVf3gLczqBw8zZ+ojws
 ojQ3OWtQg3wRCg096FCIcB6OLYkLwpT0w9MeRzvMryqnHU7dBTnhAdSOVKtqBLVP9buh
 EwOQ==
X-Gm-Message-State: AOJu0YwWv6TYRM6I7w7DqlFSXX8wZCShbVW8e6nfF18oHCYTsqGFVBnH
 kXgOS/E7CW02YWY4pf1O2VkcgC1YMuHHL2NRY3uf8sJp4eeBYr4W3Vj2kGEqiiI=
X-Gm-Gg: ASbGncuSL6vp005K0VclFpKI5FxH4kJFYL3o6G6CNzx+SSSL967hcBTll8sYf7W041j
 JPGsn8r4Z2wT67ayUvl5jn7vz7lLnfvMDwhOV9t9VHNeCJU9RKpw8jqsfVmVXAffDWqy7whvzrW
 0NJR5+Fh25vCPqQvbwqDd63nYjKyZuRHL4H8X36IFHdBuP9sb3uW1/gcjPBE2DCfOuXQD1mpP+G
 CRESTdw80vL5OX8C77a1lm4Vx1Eu7xgaRGCglhNaMLcuPINJnau4XgDVQ59h/2348ImQO2Ttc7P
 J31IBEmP4jr72uTiK1P6O4fBz/BBUApIU89Hzf66O6w0hJ0ofkWLagOP23o7Fir69Dh3hLf4ays
 =
X-Google-Smtp-Source: AGHT+IEjab817v1eaoeZEkx35Op0t9qrF1r28YyBnzNAO8gZBkkFNiR9lKADu4oJ6ffW4g43dcuz5A==
X-Received: by 2002:a05:6a00:1d81:b0:736:5725:59b4 with SMTP id
 d2e1a72fcca58-73e245c09bemr1272531b3a.3.1745456936651; 
 Wed, 23 Apr 2025 18:08:56 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25941d65sm236071b3a.63.2025.04.23.18.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 18:08:56 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v11 0/2]
Date: Thu, 24 Apr 2025 09:08:48 +0800
Message-Id: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
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

This is v11 of the MT8186 Chromebook device tree series.
---
Changes in v11:
- PATCH 1/2: Remove redundant items.
- Link to v10:https://lore.kernel.org/all/20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com/

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

 .../devicetree/bindings/arm/mediatek.yaml     |  7 +++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 5 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1

