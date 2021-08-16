Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0CD3EDDDB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 21:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9E889819;
	Mon, 16 Aug 2021 19:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C6589819
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 19:25:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q10so25143203wro.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 12:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qEog8lYm1iN8AupiUQMBZD9rF1zvKy9lbpFWZZLaRbk=;
 b=ifV48pV34am9tIz8/WNRWhxWLC4ODLUiG3D5qcShH3XfeVAnimg4J0l7yHDD33rbOf
 cNr+jRf7p4MuwmkLnG+2O4mklymiLhWEx6mI+lEKYaBCVqet3iU6siyEyandRwJR2DkP
 1VuRB3jLE0FMfZh34+PUcRg4D86mJApcM17dJTTckOHECOlXm745/S79rvptCohTQGGP
 FPeDqYcNQJ5MgLdNXYUMIRxGANR6Xy9R0BsLJjk/ix03Id1HwVHOSgHPEU1C4jS63Uuz
 BKpQSbfTAsFIuOU55AerU8+SqvQ4MH3rp750zuyVvgmX0QYNZ+ugzPKlC4AlJaBbol3b
 JmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qEog8lYm1iN8AupiUQMBZD9rF1zvKy9lbpFWZZLaRbk=;
 b=ZravBWuC3+kkVxL5x3/HICRSPu4y2V/K75vgCMoE/fWV2UcbpxQvymogGU/mDpCd2v
 XP25RipfIaToAFy1og6QkzjQ713POC16rMEnsM99ComN3QhlN1hA6P0N4YGqW8z4upR5
 WsM+mDKo2HF1QCQHRXflXO13bFmJdpVbFG6it9fOj1EAkOShj4rBdRxgUfqydx5vJBPw
 IuAguwekXNZtN+f2KCYiioKz3EFYGFqIY0Xd8DY1Q7UJCS1AmOeQPcNpbBuU3LOO68Mp
 z/jAdU7W3rIKqB6FsCjpoN+5jsCsMxP/U3aaJHyro/bJ7WbRtGOXaGnh2AekuyDMONIP
 6YQQ==
X-Gm-Message-State: AOAM5324g/n33J3Cbqaub2OrVeOgFXdlavja0B2USA4FQd4t3Z95ubxQ
 o+pYy9oHN/Yhxxsv0BcQLj4IrQ==
X-Google-Smtp-Source: ABdhPJzZZVgmbj1Ia/yPE/U1YY1+gVB1Ys9ecadHi2c/okmwaGHMpyDH5EhweM1eRbNU7BGvVhCjAA==
X-Received: by 2002:a5d:4dcf:: with SMTP id f15mr71705wru.216.1629141946713;
 Mon, 16 Aug 2021 12:25:46 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id k17sm333954wmj.0.2021.08.16.12.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:25:46 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [RFC PATCH 0/5] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon, 16 Aug 2021 21:25:18 +0200
Message-Id: <20210816192523.1739365-1-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
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

Hi everyone,

this series is built around the DisplayPort driver. The dpi/dpintf driver and
the added helper functions are required for the DisplayPort.

Note that this is an RFC. I would like to have your opinion on the driver and
what needs to change. The driver itself has its rough edges that I am currently
still working on, especially the training and powerup/down need some work in
my opinion. Also the code compiles without an issue but is not fully tested
yet.

However I already wanted to reach out for some feedback to see what can and
should be improved. I am happy about every comment, thanks for taking the
time.

The series is currently based on v5.14-rc5 but it requires other patches to
actually work on mt8195 (clock, etc.). A binding documentation is not included
yet.

Thanks,
Markus

Markus Schneider-Pargmann (5):
  dt-bindings: mediatek,dpi: Add mt8195 dpintf
  drm/mediatek: dpi: Add dpintf support
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: Add mt8195 DisplayPort driver

 .../display/mediatek/mediatek,dpi.yaml        |   48 +-
 drivers/gpu/drm/drm_edid.c                    |   57 +
 drivers/gpu/drm/mediatek/Kconfig              |    7 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 3025 ++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         | 3095 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  282 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   12 +
 drivers/video/hdmi.c                          |   87 +-
 include/drm/drm_edid.h                        |   18 +-
 include/linux/hdmi.h                          |    4 +
 11 files changed, 6564 insertions(+), 73 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h

-- 
2.32.0

