Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CAE13A15E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 08:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3936E27C;
	Tue, 14 Jan 2020 07:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4916E27C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 07:16:08 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id k25so5960989pgt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 23:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PgN1A3/jcSNW9U7ZQPj+hV6TF/FYO27/H6WZlglC4Rc=;
 b=L0iyokzQjznU7jd7+4yRIjZG4W+Kh/QVfHxO9R/YomTTvZh7b8xaC5TCZUUYDfVDXN
 P2IwRlrn+TbuhVEJfj6oijTp7NO3dd3UJHVeEFZdgB8J3r0aXarKK7Nsjb9D57P/urEw
 WzCncn51xRlztqYXPBSbDrfgKBb5vo2D7zGwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PgN1A3/jcSNW9U7ZQPj+hV6TF/FYO27/H6WZlglC4Rc=;
 b=cBNVskvoo89ieKAKPCfnUGughEaA95HPQDsY/Ww2yR7vY937AkRcxx+baz2eBGFWpf
 yINWPCM4bipLV3e/UcYAv93AsqaUJ60iVbPOFOFfZWRpe/AzDo/7tTGv1kWqc0Vf1kOe
 UstEax7afOZY+N9aKMcgQ2/tHo11IMZbvD9/JHZRRx+kfpLDuDsdcrcv7AunytoxKHHp
 xQGNiqGucKuWCbqO+I6nW++vWwop45cxIcdZ4YJVCkx5+MpK99d3Wmn2AjRXBEC3Tgp4
 ZKuDFpp1bcUYoVeh5r+3ohoLJZbIt0UTW8NygXLyGYt7O0xUo+LaFXRHODyvL9apFymx
 MFvA==
X-Gm-Message-State: APjAAAVIWFpNBfC2XlJ7pKzzATg1a/xfmYPN9zTg1B4L4STl+6K/taii
 fAphLHNCGaJOF8iylLwDuU+GtQ==
X-Google-Smtp-Source: APXvYqzMqBBdzwBKGKEOl+Tc4G0Gj7LZPgMyixK0fqjyI+joZwzSNKerDHvLgKupoGqp6US/0o9C2A==
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr22776522pgk.99.1578986168173; 
 Mon, 13 Jan 2020 23:16:08 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id b4sm17092976pfd.18.2020.01.13.23.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 23:16:07 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
Date: Tue, 14 Jan 2020 15:15:55 +0800
Message-Id: <20200114071602.47627-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Follow-up on the v2: https://patchwork.kernel.org/cover/11322801/ .

The main purpose of this series is to upstream the dts change and the binding
document, but I wanted to see how far I could probe the GPU, to check that the
binding is indeed correct. The rest of the patches are RFC/work-in-progress, but
I think some of them could already be picked up.

So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
backports to get the latest panfrost driver (I should probably try on
linux-next at some point but this was the path of least resistance).

I tested it as a module as it's more challenging (originally probing would
work built-in, on boot, but not as a module, as I didn't have the power
domain changes, and all power domains are on by default during boot).

Probing logs looks like this, currently. They look sane.
[  501.319728] panfrost 13040000.gpu: clock rate = 511999970
[  501.320041] panfrost 13040000.gpu: Linked as a consumer to regulator.14
[  501.320102] panfrost 13040000.gpu: Linked as a consumer to regulator.31
[  501.320651] panfrost 13040000.gpu: Linked as a consumer to genpd:0:13040000.gpu
[  501.320954] panfrost 13040000.gpu: Linked as a consumer to genpd:1:13040000.gpu
[  501.321062] panfrost 13040000.gpu: Linked as a consumer to genpd:2:13040000.gpu
[  501.321734] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
[  501.321741] panfrost 13040000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
[  501.321747] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[  501.321752] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
[  501.324951] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu on minor 2

Some more changes are still required to get devfreq working, and of course
I do not have a userspace driver to test this with.

Thanks!

Nicolas

v3 (see individual patches, too):
 - Match a specific mediatek,mt8183-mali instead of the generic bifrost,
   as this instance requires 2 special cases:
    - 2 regulators
    - 3 power domains

v2:
 - Use sram instead of mali_sram as SRAM supply name.
 - Rename mali@ to gpu@.
 - Add dt-bindings changes
 - Stacking patches after the device tree change that allow basic
   probing (still incomplete and broken).

Nicolas Boichat (7):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: Improve error reporting in panfrost_gpu_power_on
  drm/panfrost: Add support for multiple regulators
  drm/panfrost: Add support for multiple power domains
  RFC: drm/panfrost: Add mt8183-mali compatible string
  RFC: drm/panfrost: devfreq: Add support for 2 regulators

 .../bindings/gpu/arm,mali-bifrost.yaml        |  18 +++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 104 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  17 +++
 drivers/gpu/drm/panfrost/panfrost_device.c    | 120 +++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_device.h    |  25 +++-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  38 ++++--
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  11 +-
 8 files changed, 310 insertions(+), 30 deletions(-)

-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
