Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C5B714C21
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDE610E04F;
	Mon, 29 May 2023 14:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0B310E04F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 14:36:38 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-514ab6cb529so361910a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685370997; x=1687962997; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u469KRx4vCdKAgsfJAWOcmQKH6zjtkSVtIxNGkN2biE=;
 b=LIZ4udwIb2+6Nfp5qkp9iblRacSJeZvPPcNcudBzj55PlslMHwN9P4aafKJbgKR/fI
 L2xsMqJu3btNijZwCJzEMJHNiKHVMHTX2ihz2jFKtNm+TyDdM8tb9IB07gwEDTdrYlGJ
 UqNV9TW751xwkDwv5HpblkjURzWpP060pFuxLpy1K9Qg6i+PPzAlJ1xnXRkj9UPCpg82
 YrzoLlQ9WuxiDokSGrfaf823RunWlIYNf5IC25S6fo2DMd4EM4uKfLtEjSDKJb8MxeEL
 2PcZYZl3ziHLluExHZ0qn1BNjMBf+VnhUH0fnSdqwup6fR8HQo5ax2WB5LBTeyF36jtX
 L9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685370997; x=1687962997;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u469KRx4vCdKAgsfJAWOcmQKH6zjtkSVtIxNGkN2biE=;
 b=FiWUR7gqwqfzZRucODYEn98tBHzW8d5ct8bCceY1Tpp/jGld9oY0v1uopon6FqX18T
 sFDk9Lc3J2kfKN/uuzh1sMV/E7rO+LWgh2QrM74Pc1k0I052EqYhtSt86ojEAGfdhV6I
 l10tqnCinN38ktKaJ6ndvLMazFs6pz/XgyID+V+hHTX64oHL22iLb/wh1+JwZ9b7CHRw
 vjZi7ZIviDO5smDtEt69C3WdXPgSFqnSONaHkswBVx0I0t1yELg9ciguFb9AkDpcJsag
 GpLY4u3INyeMmWqypVsrsXwvINEbEXeRJs0LoMEg8jwXUctWO5c29L1g27W02o7+6GXw
 78KQ==
X-Gm-Message-State: AC+VfDyfwr+whkKnoSY6S8/LdyZ1wCcuI4FMkSC4cO/7xQ3CJzh+ZM5q
 jpsYL7D7Zvz0fPIiXxgvwsOxDg==
X-Google-Smtp-Source: ACHHUZ7Hr4ZDVqH/Qj4vE00E8I4yNM7z78NM1kCWU9wALVVd+CWGUQTIyvQ5+OTL9WYuwLzBxngfDQ==
X-Received: by 2002:a17:906:6a29:b0:96f:5511:8803 with SMTP id
 qw41-20020a1709066a2900b0096f55118803mr7370099ejc.22.1685370996818; 
 Mon, 29 May 2023 07:36:36 -0700 (PDT)
Received: from [127.0.0.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr.
 [90.5.10.86]) by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b0096f803afbe3sm5993654ejc.66.2023.05.29.07.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 07:36:36 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Subject: [PATCH v4 0/8] Add MT8195 HDMI support
Date: Mon, 29 May 2023 16:30:57 +0200
Message-Id: <20220919-v4-0-687f09a06dd9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACG3dGQC/23MTQrCMBAF4KuUWRtJ0lATV72HiOSvJtimkNRAK
 b27gxuhuBre432zQfE5+gLXZoPsayxxThjEqQEbdHp6Eh1m4JRzqpgiwU3xMS0vwIXRxROTdbI
 BN+k9jliGWJY5r9+PleG5/XBlhBIhhZCss0pS2Ru9jtFkf7bzBHfklR8IRyIFU84OYqDK/SHtg
 bRItKTtwLuOMn45kH3fP9SYURL4AAAA
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mac.shen@mediatek.com, stuart.lee@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for HDMI Tx on MT8195.

This includes a split of the current "legacy" hdmi driver into a common
library of functions and two dedicated compilation units with specific
code for mt8167 and another for the "v2" mt8195 SoC.

Support for the new mt8195 dpi/drm_drv adjustments to support hdmi.

Based on next-20230523

Still in my TODO-list for v5:

- Removal of the 'is_internal_hdmi' flag in mtk_dpi. [1]
    I Couldn't find a way to get rid of it with the way things are done
    in mtk_drm_drv/mtk_ddp_comp.
- Do not use a "virtual" device for the ddc v2 hw as it is embedded in
  the hdmi IP. [2]
    Seems that a lot of work is done by the framework when using a
    proper device-tree entry that can be linked as the ddc-i2c-bus of
    the hdmi-connector.
    I will keep the virtual device unless I find a way to avoid
    rewriting the framework code that handles this.

[1] : https://lore.kernel.org/all/988b0a7a-69bb-34e4-e777-1d9516221077@collabora.com/
[2] : https://lore.kernel.org/all/7da1e73a0cca6867a060d5b69d45e8d4dfc89748.camel@mediatek.com/

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---

Changes in v4:
- Split phy related patches to another series (merged)
- Removed regmap wrappers in mtk_hdmi
- Removed colorimetry related changes as this initial version only
  support one color depth
- Fixed dt-bindings properties
- Removed some now useless clocks from mtk_hdmi_v2 and mtk_dpi
- Link to v3: https://lore.kernel.org/r/20220919-v3-0-a803f2660127@baylibre.com

Changes in v3:
- phy: Grouped register and bit definition together to add clarity
- dt-bindings: Addressed comments
- Link to v2: https://lore.kernel.org/r/20220919-v2-0-8419dcf4f09d@baylibre.com

Changes in v2:
- Removed syscon requirement from the hdmi node
- Use as much as possible bit FIELD_PREP/FIELD_GET macros across all the
  patches
- Make cec optional dynamically instead of hardcoded with a flag
- Renamed hdmi variants to v1 (legacy) and v2 (mt8195) while waiting for
  a better name
- Rework hdmi v2 code to use a connector (same as v1)
- Remove "magic" 0x43 addr special handling in hdmi ddc code
- Link to v1: https://lore.kernel.org/r/20220919-v1-0-4844816c9808@baylibre.com

---
Guillaume Ranquet (8):
      dt-bindings: display: mediatek: add MT8195 hdmi bindings
      drm/mediatek: hdmi: use a regmap instead of iomem
      drm/mediatek: extract common functions from the mtk hdmi driver
      drm/mediatek: hdmi: make the cec dev optional
      drm/mediatek: hdmi: add v2 support
      drm/mediatek: hdmi: v2: add audio support
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT8195
      drm/mediatek: dpi: Add mt8195 hdmi to DPI driver

 .../bindings/display/mediatek/mediatek,dpi.yaml    |    1 +
 .../bindings/display/mediatek/mediatek,hdmi.yaml   |   59 +-
 .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml |   45 +
 drivers/gpu/drm/mediatek/Kconfig                   |    2 +
 drivers/gpu/drm/mediatek/Makefile                  |    5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  121 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |    5 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  773 ++----------
 drivers/gpu/drm/mediatek/mtk_hdmi.h                |   18 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |  437 +++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h         |  208 ++++
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c         |  362 ++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h        |  276 +++++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 1303 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.h             |   32 +
 15 files changed, 2955 insertions(+), 692 deletions(-)
---
base-commit: c8a64c6a78c54887da437098d97dc2accc689e89
change-id: 20220919-hdmi_mtk

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>

