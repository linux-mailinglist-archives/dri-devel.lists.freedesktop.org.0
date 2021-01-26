Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8BF30310E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 02:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188A76E14D;
	Tue, 26 Jan 2021 01:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8236E14D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 01:18:10 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id e9so8774869plh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 17:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iWbVQO5R0FpQjPeleTL5ZQxXMwOKE8gz64YVQB09gIE=;
 b=M8/QV0mlc2v2R8DUyzcSmv2ah8W3t/Zyct7N54o+QNG5dYc72k3Goi4nwckpZUxBKY
 OLzUjzQ069Xg0Mwox3AdKaNd2sH8efxb8MswfwAeVssIrhd+5npraQUBmohEdUUtPBi+
 tnkK7aKAGBIFCJRX+MW31GV68uGwQMAPlaYME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iWbVQO5R0FpQjPeleTL5ZQxXMwOKE8gz64YVQB09gIE=;
 b=BlfkcawYIpNS6xytJwe7rmYOf7svqxqnS/L3/+wYg7/qoorHKf1vMzdVeakr8YD0uW
 yDGtw3rb+FxpxUHHSFtJzdIWCRiVY/s+Tu3oUfapFp+TQZSLqDKNWa6NvomIyJLqL34k
 c5F/C9uN/lsdEmvkK1P/w55Rk7DqJ98hZVsS3zM7q2bjjaX06BebDUERQfoaZ0h4OnyU
 LWRDNuQGg1ThA9F0fOm9qQg+xVkfUKC400bsOGbvjeIXNhIG3vL7lW9NK00QcRzyDIXZ
 fhARH9D8Spfd4XE6h4icyuffAZVQPZJ2/BHZGr3AlX+k+BNXcSX/Rr0G35CAPoG7VEmV
 laAg==
X-Gm-Message-State: AOAM530HxSca0PANyqql5qjDF1wy1A+CbSYOoGCFdzq1ON66z+rWh0J7
 grs+9MZFvA6Cl0c7T3bb2T9MRQ==
X-Google-Smtp-Source: ABdhPJyjPaSweKNxNtO2gkziAaXPMrY4Rp0Kuls26ijdkAvAyf1Ku0oC++DgRuy/WatKIEzuLxGMZA==
X-Received: by 2002:a17:90a:d255:: with SMTP id
 o21mr3117952pjw.151.1611623889956; 
 Mon, 25 Jan 2021 17:18:09 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:50cc:9282:4fdd:3979])
 by smtp.gmail.com with ESMTPSA id k9sm522248pji.8.2021.01.25.17.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 17:18:09 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v11 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Tue, 26 Jan 2021 09:17:55 +0800
Message-Id: <20210126011759.1605641-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Follow-up on the v5 [1], things have gotten significantly
better in the last 9 months, thanks to the efforts on Bifrost
support by the Collabora team (and probably others I'm not
aware of).

I've been testing this series on a MT8183/kukui device, with a
chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
mesa 20.3.2 (lots of artifacts though).

devfreq is currently not supported, as we'll need:
 - Clock core support for switching the GPU core clock (see 2/4).
 - Platform-specific handling of the 2-regulator (see 3/4).

Since the latter is easy to detect, patch 3/4 just disables
devfreq if the more than one regulator is specified in the
compatible matching table.

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
[2] https://crrev.com/c/2608070

Changes in v11:
 - binding: power-domain-names not power-domainS-names
 - mt8183*.dts: remove incorrect supply-names

Changes in v10:
 - Fix the binding to make sure sram-supply property can be provided.

Changes in v9:
 - Explain why devfreq needs to be disabled for GPUs with >1
   regulators.

Changes in v8:
 - Use DRM_DEV_INFO instead of ERROR

Changes in v7:
 - Fix GPU ID in commit message
 - Fix GPU ID in commit message

Changes in v6:
 - Rebased, actually tested with recent mesa driver.
 - Add gpu regulators to kukui dtsi as well.
 - Power domains are now attached to spm, not scpsys
 - Drop R-B.
 - devfreq: New change
 - Context conflicts, reflow the code.
 - Use ARRAY_SIZE for power domains too.

Changes in v5:
 - Rename "2d" power domain to "core2"
 - Rename "2d" power domain to "core2" (keep R-B again).
 - Change power domain name from 2d to core2.

Changes in v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)
 - Add power-domain-names to describe the 3 domains.
   (kept Alyssa's reviewed-by as the change is minor)
 - Add power domain names.

Changes in v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

Changes in v2:
 - Use sram instead of mali_sram as SRAM supply name.
 - Rename mali@ to gpu@.

Nicolas Boichat (4):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
  drm/panfrost: Add mt8183-mali compatible string

 .../bindings/gpu/arm,mali-bifrost.yaml        |  28 +++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
 6 files changed, 162 insertions(+)

-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
