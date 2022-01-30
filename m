Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD64A3BFF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 01:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F410A1124A6;
	Mon, 31 Jan 2022 00:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2FF11249F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 00:00:01 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id o12so23289657lfg.12
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 16:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qexSNYWB7tiyIuCaaBWHS9YHRPNUyCUhhgTpadvVgtM=;
 b=EBv1/JWzmmsta2iNd/4vCWqpQlnhyzJLB+LZORlFD5E6o+GKw+Bi1KpnETkFxhg/Af
 +ptPl5fFaldPfltEah2n0VZu2sBs1mIkn4IJE94ZPNt/BVorbKUMOWVHiGYzSdOPnaUd
 8g6LzEhARyQiyOM4Rxt7f5zNfh8O06zAqS0wq5d9MXz05/OY4WFQZf0sr99y70Q5IedY
 KTGhFIwA6FUsoN8DE+fcM5c8j2Es9gGcFg8QxHWDCSMIRORvPWA8b7QB2IZIBdaZ1b/Q
 BKzDKXpNIQ0nhIpcnnf8RnNN0+udNOc5CSmEIl0oO+YTID2zleO8vPYeJFUi2joML8NN
 zTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qexSNYWB7tiyIuCaaBWHS9YHRPNUyCUhhgTpadvVgtM=;
 b=7+CJXyvaAga8Zr4S3d6jdV43Z3jXrder/zpUh01lfbs6I0Cul4EtqjJ03i/2KSGbwj
 8im2bCI+Pf5nWXlqNmt+rs/3kAD+cVnhYyf5eQuUxY46P12fCsxvkV1mrkrHVLNoya5x
 CB89kjYaW+dlX4KBVPtctJJxh0W3i5fWiptjawjpkCE1bd3Ifbu55srWymmh1NLt1+TT
 BrS0hg3/5a3NVjW36SCh7OS+6qD1d4AX3Flh0OSNwnkQJwbvEWMlUCgX8pO0cZXATmCi
 4GS3Kx6RwCSK696BraambZXZKrcqF8OGZIc9PZ4vg/P9qwQP6KfBM1PVqpNDKX3uMYh6
 9jsg==
X-Gm-Message-State: AOAM5301CUAfXzKs1wv/BWondDYCO44ip+kV55SMsDvIltkmjo03fNwF
 7x5VehzjmJ96pPB4OS85sDs=
X-Google-Smtp-Source: ABdhPJxlvDzkyoA4bZ+eX1yRXfz7bao5u1AqtrWg5qj9UF+eKcdBIsH+t3x1Y8gksCLxAyQTSNwCXw==
X-Received: by 2002:a05:6512:e82:: with SMTP id
 bi2mr8530755lfb.590.1643587199935; 
 Sun, 30 Jan 2022 15:59:59 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id e7sm3443193lfb.17.2022.01.30.15.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:59:59 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v3 0/3] Support Sharp LQ101R1SX03 and HannStar HSD101PWW2
 panels
Date: Mon, 31 Jan 2022 02:59:42 +0300
Message-Id: <20220130235945.22746-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for Sharp LQ101R1SX03 and HannStar HSD101PWW2
display panels that are used by Asus Transformer tablets, which we're
planning to support since 5.17 kernel.

Changelog:

v3: - No changes. Re-sending for 5.18. Device-trees of devices that use
      these panels were merge to 5.17, so we're missing the display support.

v2: - Added ack from Rob Herring to the HSD101PWW2 binding.

    - Updated LQ101R1SX01 binding, like it was suggested by Rob Herring,
      making LQ101R1SX03 directly compatible with the LQ101R1SX01.
      Such that ["sharp,lq101r1sx03", "sharp,lq101r1sx01"] could be
      used in DT. This removes need to update panel driver with the new
      compatible.

    - Improved commit message of the LQ101R1SX03 patch.

    - Added my s-o-b to all patches.

Anton Bambura (1):
  dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03

Svyatoslav Ryhel (2):
  dt-bindings: display: simple: Add HannStar HSD101PWW2
  drm/panel: simple: Add support for HannStar HSD101PWW2 panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../display/panel/sharp,lq101r1sx01.yaml      |  7 ++++-
 drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.34.1

