Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270A81551F4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 06:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A602C89518;
	Fri,  7 Feb 2020 05:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DC789518
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 05:26:49 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id ay11so536189plb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 21:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/zB9xLJSCEmcEROv88A82DPGekOIdz0Re4N4EUvv7YQ=;
 b=iHfAblZm+66QNJpVWC8jKplx2ZNZqjZfzjQmcBKuD+0bxVGGTQ5lOzM36vtl1ggI/y
 BOf4sQDqdKsGpwT3fK2xC4db5Y6c9+OsKKLAZoyvCpfNiMc7AWpgFmE6LjIs8qtiPXfQ
 m1bMLy5a60UKdJJA50YccQmyGqBD0HQibNMpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/zB9xLJSCEmcEROv88A82DPGekOIdz0Re4N4EUvv7YQ=;
 b=fU+4h+p4XO59/6Oq79OMKYNEg650DQrQw8s1ZtSwABHsD6H3GZBGGEhNx7jv9ttHYj
 +o+WkOVrGx9DuL7mpL6tfdqYsEHDZgQNG5lMEjb3zJJxpQIUmmcHjZfURQCjV7C78QN/
 Bt9iMhBySF5/IDYo0gyFlI6U1hHx20Wmi1Xv8EAZhSSUkerwpVS7sqWXBkJ9UAg0kUKW
 SrIodmafliWgJ09b8y4bwO0beK3F5JWwHY8AoIXjlCTKRYG2GRUVyQmG+BKaYP+nJEl8
 Vclo82T+bbxA0be7e1wgdM7/fL0iccQL4C9IrgYJSmjowDA3AYLsxoL6P1n5Qb9px+i2
 SOgg==
X-Gm-Message-State: APjAAAUh2Bhs1m+mwClAw2mCQ5rAC4vT3r1jMo1PL20ywIkYs31Yghn6
 YBGCM2el5GK2qKLwNh68xpiPjA==
X-Google-Smtp-Source: APXvYqwDhczmXZwMAxUZru60y6Afvx+soks2DBAlo9PuHeMARGx+nULMRNQyK00qlg2Fi3ADU5IOrQ==
X-Received: by 2002:a17:90a:a48a:: with SMTP id
 z10mr1822467pjp.52.1581053208716; 
 Thu, 06 Feb 2020 21:26:48 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id i66sm1174485pfg.85.2020.02.06.21.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 21:26:47 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
Date: Fri,  7 Feb 2020 13:26:20 +0800
Message-Id: <20200207052627.130118-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
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
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Follow-up on the v3: https://patchwork.kernel.org/cover/11331343/.

The main purpose of this series is to upstream the dts change and the
binding document, but I wanted to see how far I could probe the GPU, to
check that the binding is indeed correct. The rest of the patches are
RFC/work-in-progress, but I think some of them could already be picked up.

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

I believe at least patches 1, 2, and 3 can be merged. 4 and 5 are mostly
useful in conjunction with 6 and 7 (which are not ready yet), so I'll let
maintainers decide.

Thanks!

Nicolas Boichat (7):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: Improve error reporting in panfrost_gpu_power_on
  drm/panfrost: Add support for multiple regulators
  drm/panfrost: Add support for multiple power domains
  RFC: drm/panfrost: Add mt8183-mali compatible string
  RFC: drm/panfrost: devfreq: Add support for 2 regulators

 .../bindings/gpu/arm,mali-bifrost.yaml        |  25 ++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  17 +++
 drivers/gpu/drm/panfrost/panfrost_device.c    | 123 +++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_device.h    |  27 +++-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  41 ++++--
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  11 +-
 8 files changed, 326 insertions(+), 30 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
