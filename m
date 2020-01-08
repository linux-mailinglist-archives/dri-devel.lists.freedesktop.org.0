Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE5133AC7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 06:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3576E167;
	Wed,  8 Jan 2020 05:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFFB6E167
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 05:23:55 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q10so1016171pfs.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 21:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s1KUxpvNC0nSY4c57vW0grBhdHj/br9DS0Gj7LsMqAg=;
 b=UaDMeZnQsg7RWbE0j39tduViiq5tWgb5xwFNLW6CAsuaqrJDAaez2MGnV4PY7kH539
 aj30Ild0XBzKI5+QFVnZnuU/x9R/7QklbyAMShyxgCH4sxK7XMPCA8P3gzkn56vBNgnS
 fkoYP8jneVMWqlDMbIWdMfifnxnN8gAT8lJCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s1KUxpvNC0nSY4c57vW0grBhdHj/br9DS0Gj7LsMqAg=;
 b=dNjUILggOYhTSU1U88LEHRdAh+IPyUkYStudEUKXuBWbu79xKvELaCF/4jjlv+3zYR
 BZ8+MhwuNG3nLOuXHgpkyc2GN2HBDmxS/QgxFdEuYxPqXDc+6r0jYrTv4HHTVYx9YXQz
 PWbhZiEVvMHJrBeTjaeufAeDl8wCthrIrbj8N51D6el9uF/2sRTjikJ4csr5TLcwu2wk
 7aNdBIhbauIAnc89yqM2HAGO9Vj3mB+KE0NH/OlqHYULXh4G60Ne10mZMTza2lPyZCuu
 ltUW5JMi/ES1p28SfTCgPOKt1f4avaebFoJ4U3qW3g+EtPJd/CLUcPaB3zrpEOnD1ODO
 oOaA==
X-Gm-Message-State: APjAAAVZIxU0I+M3UIoDImXsuc19gBTdJGUYHvpUFRhU96gi54vO6rVx
 ydzLJF3hbvcNpZc/bQdq92/FRg==
X-Google-Smtp-Source: APXvYqxmaLR0+XdqtcLLRTMFj3xPry0wUm49NXvxttElsA1fauDaDpoKgiJkJbYJCbg0zpgZCOqf+g==
X-Received: by 2002:a62:446:: with SMTP id 67mr3056799pfe.109.1578461035208;
 Tue, 07 Jan 2020 21:23:55 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id n24sm387505pff.12.2020.01.07.21.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 21:23:54 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
Date: Wed,  8 Jan 2020 13:23:30 +0800
Message-Id: <20200108052337.65916-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
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

Sorry for the long delay since https://patchwork.kernel.org/patch/11132381/,
finally got around to give this a real try.

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

Probing logs looks like this, currently:
[  221.867726] panfrost 13040000.gpu: clock rate = 511999970
[  221.867929] panfrost 13040000.gpu: Linked as a consumer to regulator.14
[  221.868600] panfrost 13040000.gpu: Linked as a consumer to regulator.31
[  221.870586] panfrost 13040000.gpu: Linked as a consumer to genpd:0:13040000.gpu
[  221.871492] panfrost 13040000.gpu: Linked as a consumer to genpd:1:13040000.gpu
[  221.871866] panfrost 13040000.gpu: Linked as a consumer to genpd:2:13040000.gpu
[  221.872427] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
[  221.872439] panfrost 13040000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
[  221.872445] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[  221.872449] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
[  221.873526] panfrost 13040000.gpu: error powering up gpu stack
[  221.878088] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu on minor 2
[  221.940817] panfrost 13040000.gpu: error powering up gpu stack
[  222.018233] panfrost 13040000.gpu: error powering up gpu stack
(repeated)

So the GPU is probed, but there's an issue when powering up the STACK, not
quite sure why, I'll try to have a deeper look, at some point.

Thanks!

Nicolas

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
  drm/panfrost: Add support for a second regulator for the GPU
  drm/panfrost: Add support for multiple power domain support
  RFC: drm/panfrost: Add bifrost compatible string
  RFC: drm/panfrost: devfreq: Add support for 2 regulators

 .../bindings/gpu/arm,mali-bifrost.yaml        |  20 ++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 104 +++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  18 +++
 drivers/gpu/drm/panfrost/panfrost_device.c    | 108 ++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_device.h    |   7 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  15 ++-
 8 files changed, 267 insertions(+), 13 deletions(-)

-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
