Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2FB82ABB4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8452210E8DA;
	Thu, 11 Jan 2024 10:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D829310E8DA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:15:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e60e13581so2980865e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 02:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704968109; x=1705572909;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+V4JzjzBqaHzJLZncYnEckgIPzqOvsDKGfGUY3ZauSA=;
 b=camEBpFRsoOxm8N52zakH14na3BHYAzl9sr91w3zUvK3NyS28+p5JptYIahdxBpKDO
 QoCVzJHMTAjQlSsPJnb+xlnON1utNDpVPRS3s7Ij0EcMfLXnZP672vWS7TQ7ltErI3j2
 Mrn2HA5Su91EG8dd6LbbyfKN6JuC8ykYZwI+Ua/rVfXRv0WR5JVGKWc1f1g0GrN93x+6
 fFuSdRk8883FAZjRNRbuVUS7cKRUD7g9FgyAeCiyGjJoSHIjTnVRZWnWwe7knuRfBZNK
 q6F/iCqyhNYMz2l9lix4eSbB1/LBw7hmdavK9mELDTm44LVdxGhbPO7eOsnQu6yljvxf
 jGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704968109; x=1705572909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+V4JzjzBqaHzJLZncYnEckgIPzqOvsDKGfGUY3ZauSA=;
 b=q+Dd5K/LEcVODood1zx87Esi6zcsZQo2Row+qLvK6EDPW57elvpIwh1KGP6wzhu0Z0
 XIjfFMzqy6+omjqmGwe7epfk92T8xvrBBuNZKhX1xvgy/4ogJjuQaoOCXHVnMq6ZKgye
 ogiXO2gqt1+MDPafkc3ztSYQhRhCMUDLM2tHCtlRsxpSmc6Rf/MNTdwcogZm6j/FM8YZ
 HXhDyt536Syb2tg7ufowKYeTLJNOKKcbvxuMw0k26K8zWJIWLGwlJ4oPzHyz3rwvrzhy
 cAmjBRW+3ueGbaRdWUUmh2JxUk4t6/opg9GEdasbS1pDG8w4J3zrho0XR2Bq7aAa9VPh
 g6jg==
X-Gm-Message-State: AOJu0YynHXwIrWyWUt7AQH5FOvc6CxCZ0v57mBZFxSKEmNSkVHAhmOnW
 oIA1BKKNrmfwSMBo4zA2bNsfRLHIzTyk8A==
X-Google-Smtp-Source: AGHT+IEm+n9REC3cDZLVtCMBBH7ollyf38bVEHwiAvqjBMBz1qwTcxZsn0pt65qrruZ1CkOufUMg3Q==
X-Received: by 2002:a05:600c:3b1d:b0:40e:6206:a518 with SMTP id
 m29-20020a05600c3b1d00b0040e6206a518mr68778wms.184.1704968109127; 
 Thu, 11 Jan 2024 02:15:09 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b0040e52cac976sm5157758wmq.29.2024.01.11.02.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:15:08 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Subject: [PATCH v5 0/2] phy: mtk-mipi-csi: add driver for CSI phy
Date: Thu, 11 Jan 2024 11:14:49 +0100
Message-ID: <20240111101504.468169-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding a new driver for the MIPI CSI CD-PHY module v 0.5 embedded in
some Mediatek soc, such as the MT8365

This driver was adapted from https://patchwork.kernel.org/project/linux-mediatek/cover/20200708104023.3225-1-louis.kuo@mediatek.com/

v1 can be found here: https://lore.kernel.org/all/20230403071929.360911-1-jstephan@baylibre.com/

v2 can be found here: https://lore.kernel.org/all/20230515090551.1251389-1-jstephan@baylibre.com/

v3 can be found here: https://lore.kernel.org/all/20230524083033.486490-1-jstephan@baylibre.com/

v4 can be found here: https://lore.kernel.org/linux-phy/20230620121928.1231745-1-jstephan@baylibre.com/

Changelog
Changes in v5:
- rebase on latest master scheduled for 6.8-rc1
- sort alphabetically CONFIG_PHY_MTK_MIPI_CSI_0_5 in Kconfig and Makefile
- put lines under 100 chars on one line

Changes in v4:
include/dt-bindings/phy/phy.h:
	- remove commit adding PHY_TYPE_CDPHY definition

Binding file:
	- use the standard phy-type property instead of a custom one so
	  rename mediatek,phy-type -> phy-type
	- phy-type property is made optional: when present, describes the
	  phy type and the operating mode
	- phy-cell is modified to accept a phy argument representing the
	  phy operating mode if phy-type is not specified
	- adding new property num-lanes

Driver:
	- add a custom xlate function to handle phy cells
	- update probe function to retrieve the new value phy-type
	  instead of the mediatek,phy-type
	- remove useless struct define `struct mtk_mipi_dphy;`
	- rename some functin/variable from `xx_dphy_xx` to `xx_cdphy_xx`
	- update probe function to read num-lanes property

Changes in v3:
Binding file:
	- rename compatible string
	  mediatek,phy-mipi-csi-0-5 -> mediatek,mt8365-csi-rx
	- rename binding file to be as compatible string
	- change property mediatek,is_cdphy -> mediatek,phy-type using an
	  enum value instead of boolean for scalability
	- remove status property from example nodes
	- rename example node name 'mipi_rx_csi0: mipi_rx_csi0@11c10000' ->
	  'csi0_rx: phy@11c10000'
	- put reg address in lower case

include/dt-bindings/phy/phy.h:
	- add PHY_TYPE_CDPHY definition

Driver:
	- rename compatible string
	- rename property mediatek,is_cdphy -> mediatek,phy-type
	- rename CSIx* macro to CSIX* (x -> X)
	- fix style issue on the driver data structure
	- update MODULE_DESCRIPTION as suggested by Angelo
	  and update the kconfig module description to match it
	- add dphy /cdphy eq tuning function to factor the code
	  and increase readability
	- fix typo __PHY_MTK__MIPI_CSI__C_0_5_RX_REG_H_ -->
	  __PHY_MTK_MIPI_CSI_V_0_5_RX_REG_H_
	- reword commit message to update my contributions
	- added missing copyright
	- added module name in Kconfig

Changes in v2:
	- fix all comments on bindings
	- move the binding chunk from driver to binding commit
	- fix dt_binding_check error (reported by DT_CHECKER_FLAGS)
	- use a more generic compatible string
	- add a new dt properties to simplify the driver
	  "mediatek,is_cdphy"
	- rename the driver and the corresponding file to include
	  version
	- drop of_match_ptr()
	- use devm_platform_ioremap_resource
	- use phy-mtk-io.h api instead of regmap
	- rework the driver to use dt nodes to declare PHY instead of an
	  array in the driver
	- remove useless define for unused registers
	- remove support for CSI0A/B because it cannot be tested, and it
	  simplifies the driver for a first review
	- edit commit message and bindings to be more descriptive about the
	  hardware

Florian Sylvestre (1):
  dt-bindings: phy: add mediatek MIPI CD-PHY module v0.5

Phi-bang Nguyen (1):
  phy: mtk-mipi-csi: add driver for CSI phy

 .../bindings/phy/mediatek,mt8365-csi-rx.yaml  |  79 +++++
 MAINTAINERS                                   |   7 +
 drivers/phy/mediatek/Kconfig                  |  12 +
 drivers/phy/mediatek/Makefile                 |   2 +
 .../mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h    |  62 ++++
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c   | 294 ++++++++++++++++++
 6 files changed, 456 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c

-- 
2.43.0

