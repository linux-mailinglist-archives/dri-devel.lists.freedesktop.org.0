Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C961AA74672
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3590210E9B2;
	Fri, 28 Mar 2025 09:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="t0gkUwaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D6810E9B2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:40:49 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-223fd89d036so44434535ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1743154849; x=1743759649; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lVf1OxT8PGj4PYemPZVHKfGsO8vE6CKP1+cnxJtI79Q=;
 b=t0gkUwaq8/0c0cEwyIMuB/MJxCRwXENbstC76oEjs50or86JlT8/1fkhm5uaeo/QG+
 zv34g5NCa+9D/l/LUH4eCOMGPfYCn/T5po5o9OA67dva3zWmwT8zIvszCSDXesY0EiLR
 lnXISm7+zofdxhPCBBJp5lTSnPtxPIpbdWEZ3uL0v3AVbQkisr7qp7kWwzvF/Ipqq1zW
 AA0YBtch+iC20aBntp5HUiKik93s5/xKINv0yCnyh26UaObr6c20s/HDliWK+qx6w+bI
 Z0aMzV1+FFk6p333gcX2nq7Ix4Z9eFDrqg6GK7rs3w8YTSTNr73/zy7Z90jplhcGPVd/
 z2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743154849; x=1743759649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lVf1OxT8PGj4PYemPZVHKfGsO8vE6CKP1+cnxJtI79Q=;
 b=nAYYyjdI6wogshbcs7FGrQC+CqVm1dn4lo9oFXmW/hN73VDx5LR8aDDuxcr4vtySh6
 nbykMV8XbbW6CWXnKnfqbqu1/K5FPPyuaaEBph38H5FUnS8cvzHHENiR3kOAaY/ausLx
 tnXrtidOjm7pdoG7hnUWTV/z8zw0uoo9gbCwEfVNTjrk/OTnoOmrb8JQJzTPP3Xrngl4
 M6KkgPgSWBgM5MvFGGV3MV4CWchgYbcqXrsOkrQ+pGz9Th79oCurzhOymE7mkw1I5LKb
 U2LnS1i+milrtZItnQecl0go9MuA0cWjRPYwTpGpM3hL8cphLIGLdBowF/d+ozWfo7DH
 oJmw==
X-Gm-Message-State: AOJu0Yz/6hMx3z9OsFXrCbqe6sShdabmEZj62w3DVksl+OOdazFSZhJQ
 IiTw14tqxHTY0xbmF+GLu+k2QLPcHbhrGOHYYkrMk7PxHLWSWNIsksWuihU+Y/Y=
X-Gm-Gg: ASbGnctfhsSBu1O3G4AYE5k8z9ZGGb1UvgXUptwsefISyfwwwpKLkt8NAECppVgicJb
 tPKcRftZ91InJMlYBmTE5LGNorP48YrkX46E1nk0Z7Rj9yMv0+3B+zWY3sH+SAcHZELexCvla8Q
 //XaVZG9JJ8F4h8W0Djh19EujA6fvn4ULkUgE+laoUuVRSea27PA51OlLtAhSAs0JHDY3f6xQmh
 XyoEOeR+Csj4CXPLORaxsXcsqSz6GFeEZr6NSpxOsUs1/Ja+QKQFxSbhgMCpj8Da6ppDICZuAid
 GY5fNcBFFYVyC2CDLaYWl7IS9tm7wxH6W1Au1ts6PkDTP0QBuPaf3BHDsbqxtTenQa49+uz6/HG
 8K9w=
X-Google-Smtp-Source: AGHT+IHlMk3FT8wV80BXMjlruAdNjtASKILfG6spB3x0ZSEswoz0sZWSrejxGN07tV3Fa7SmSJ5ASQ==
X-Received: by 2002:a05:6a00:3392:b0:736:9fa2:bcbb with SMTP id
 d2e1a72fcca58-739610e3485mr11701752b3a.24.1743154848458; 
 Fri, 28 Mar 2025 02:40:48 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7397106c7b7sm1283012b3a.116.2025.03.28.02.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 02:40:48 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v9 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Fri, 28 Mar 2025 17:40:32 +0800
Message-Id: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
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

This is v9 of the MT8186 Chromebook device tree series.
---
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

 .../devicetree/bindings/arm/mediatek.yaml     | 10 ++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 5 files changed, 101 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1

