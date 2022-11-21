Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D663249A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 15:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778E810E0F1;
	Mon, 21 Nov 2022 14:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABA610E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 09:42:40 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id i10so27133175ejg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 01:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=vamem0qPPK/+qqHyZ7VitfMXhg5vodX1x04ClBWqxyY=;
 b=OUeHTSRpqIyD4R+SqDqs5uhVa9x+OQ2cMnKfV2ZkV4P/IkGNIwZYRZ2VFJBzKqUPbl
 uymtKtNXLwDKBD+QV6MeP4nAhtRwDcMxEkVsDLXgcckmBx2vm7UeLrAtz4aL/pppDhYQ
 a7LBijeewz1qULGcsRntcMNYNtsfxAreJRugrhzxKIOkjgDuaj7eoKwpk3X2u/pELVnA
 ebm4zcczKzNhluBk4StHyjIF3A8MALqdji0MmPPSfR8UVHDyY5idpHdodx1qprpkxTC6
 CNrJsiXqL/tSCWVLPw6GtSUiB4bscMPRbcsLzd2aU3pzsRxRC6OoZm+9OJIu2XJzdktQ
 SpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vamem0qPPK/+qqHyZ7VitfMXhg5vodX1x04ClBWqxyY=;
 b=q+p8aTBhdWG5k2Up7hSFMmSd3XYMOZjwx8JX8K2hJOntaD160+LwrPijVmkRSqnNhU
 iFSrMlGdcxG7+5k1UCONZDJRdOIiUTn577401bKP8tBdTf2oIBGFGBtQhzjZwlTw+9Re
 rL4NjMbcMnaz66Zmw1Jm9dujv4UsWcoHx5EbXk3pELmfYwSP3bjIfLLY+0VK/CJKmEAD
 NddAO0owvq6kRzvQJg+7cpVCJem6wmRwYS+lds8p2EWsq/pbQ45oYBwQhvfiL4z6+D3l
 x98OdRV886S2xj+Ty0WbTa8u0AOd2nn/tzZVuREUKalWJBQbGReX/6QHgVW78Pm4uCqD
 hRuQ==
X-Gm-Message-State: ANoB5pkxUwGwdGjn/lIo2pDUTGdmoCKb0vHOpCmIT6lfMWtEqzLMYx+i
 1TJI+MAzBYUrPbJDKg0k040wCi3xxtbJIQmu
X-Google-Smtp-Source: AA0mqf4Y/qO5IHzq7wyR8BmivhktsDan+5uOus9RTtHptmY2liXFr5diD78YovU3f96o/KrsaB8d2Q==
X-Received: by 2002:a17:906:cedc:b0:7ad:e8dd:837c with SMTP id
 si28-20020a170906cedc00b007ade8dd837cmr15613331ejb.264.1669023758927; 
 Mon, 21 Nov 2022 01:42:38 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:c97f:bc5d:82d3:1a3b])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a17090632cb00b0078d3f96d293sm4822240ejk.30.2022.11.21.01.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 01:42:38 -0800 (PST)
Subject: [PATCH v2 0/2] Make ILI9486 driver working with 16-bits SPI
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAAVIe2MC/32NUQrCMBBEr1L220g2bYP1y3uIlCTd2oWYSlaLpfTuBg/g1/AG3swGQplJ4FxtkG
 lh4TkVMIcKwuTSnRQPhcFoYxDRKul0++nlyT1H7pqTVY6GthnHOniDUDzvhJTPLoWpmOkdYyknltec
 19/PgiWu/yYXVFrZWjcag7dmaC/erZF9pmOYH3Db9/0LqPc1fboAAAA=
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 21 Nov 2022 10:42:29 +0100
Message-Id: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Mon, 21 Nov 2022 14:01:27 +0000
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
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is trying to fix problems seen on S905X boards when interfacing
with an ILI9486 equipped SPI panel.

To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Carlo Caione <ccaione@baylibre.com>

---
Changes in v2:
- Removed SPICC patch
- Reworked commit message
- Link to v1: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com

---
Carlo Caione (2):
      drm/tiny: rpi-lcd-35: Enable driver module autoloading
      drm/tiny: ili9486: Do not assume 8-bit only SPI controllers

 drivers/gpu/drm/tiny/ili9486.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
---
base-commit: 147307c69ba4441ee90c1f8ce8edf5df4ea60f67
change-id: 20221116-s905x_spi_ili9486-aed54ff3cb21

Best regards,
-- 
Carlo Caione

