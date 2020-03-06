Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A76817B539
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 05:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691A36EC5C;
	Fri,  6 Mar 2020 04:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9886EC5C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 04:13:55 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id nm6so508266pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 20:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NGpha79Xw/kyrpH0KRykBURmEGjSa5ilFJNdTDuhavo=;
 b=UBFJfk7m2rjCNVc4mkH8nMfqbKNiiahjGDbTAxb6n6L3W7Pm2HZ2sPakIgBp1lURAp
 wCEx2AOH+h168RFpbM4kCfC0Bl2UTfPV+8xRkoukQQU1Xobx6M1BG8uUQvmOfTE3yk4+
 UBcROZ8vF9c7L9/DPrmxZxWKgxx6AwppH4XvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NGpha79Xw/kyrpH0KRykBURmEGjSa5ilFJNdTDuhavo=;
 b=FyfAvD0+TwZfwiGhRdCotX19vqDhydJwa0dLlzCH3/UkFdhH7ILG8JjILXVBisQO5O
 ZKossdgr2jImlYxTfM44AvHDfYfesR8am02WxIklzSx9HY8n7pcbiiEGCzzqeCxH5mv9
 EsKE7zi3FGFbXMWTxdhovxI14IFF0+gFGmqH/cVgrIDCouLyM7Jk522mlkuufdqqPFvA
 acVJkTHcdlBXIiK3SFwtb5yMDBNaann/02o2HmD6cvUS3m9d53/y+82BLALx8a9iMTow
 ESbv8LJ5/7eqzPEpBkgoI/atWOKc18RS52+nfL4chDMKPptUTMFMfCVTubU+nDcdQ3BE
 HoIA==
X-Gm-Message-State: ANhLgQ0fAJAexSXBCHhNvRhgPenTrU3mjOopyc3B/PNTih5eP8SdtF8N
 woYrz2Djkuqq73eOcHt7O7rNVg==
X-Google-Smtp-Source: ADFU+vu3QozVC0yE6LU6QscNhoRjHqPVAaBn/u3r6arshufaf8EPEK3BnFSFTzSCvpBiTDYG84+h2Q==
X-Received: by 2002:a17:902:b485:: with SMTP id y5mr1125061plr.4.1583468035448; 
 Thu, 05 Mar 2020 20:13:55 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id q97sm6295025pja.9.2020.03.05.20.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 20:13:54 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 0/4] Add dts for mt8183 GPU (and misc panfrost patches)
Date: Fri,  6 Mar 2020 12:13:41 +0800
Message-Id: <20200306041345.259332-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
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
 Matthias Brugger <matthias.bgg@gmail.com>, Nick Fan <nick.fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Follow-up on the v4: https://patchwork.kernel.org/cover/11369777/, some
of the core patches got merged already (thanks Rob!).

The main purpose of this series is to upstream the dts change and the
binding document, but I wanted to see how far I could probe the GPU, to
check that the binding is indeed correct. The rest of the patches are
RFC/work-in-progress.

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

I believe at least patches 1 & 2 can be merged (2 depends on another
patch series, so maybe we could start with 1 only for now...).

Thanks!

Nicolas Boichat (4):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  RFC: drm/panfrost: Add mt8183-mali compatible string
  RFC: drm/panfrost: devfreq: Add support for 2 regulators

 .../bindings/gpu/arm,mali-bifrost.yaml        |  25 +++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  17 +++
 drivers/gpu/drm/panfrost/panfrost_device.h    |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  11 ++
 6 files changed, 166 insertions(+)

-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
