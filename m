Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1416F92A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E637E6E222;
	Wed, 26 Feb 2020 08:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8E46E222
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 08:10:42 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 185so1064745pfv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 00:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WxwmrpsEvSIHCqKyrbgIWagGPaBeap74xZ38jQnYjMI=;
 b=G1GsoxC1VQuC2LzKxNIiH8WzlN8FWR5TNjYvsUrS4EpNTF67B0l7m+ux8gBd/URe9K
 Ni169aQfWICKEdDaOovkUoQ6TY8mp7LlZHJZ6Pyh12jXifWrBo6wNpwH+hDAl0UCJeuO
 diXFcso+LmH8SDxwSQYp2Us4VaL3d/8PrHxIwh2BO6zrCkCl4rlWXND2PaGmhmv5LO4g
 866z8wbTQDg9ADpDehmo7RnXIdslb/fXtfj9fH8aEqt6k6VmU5ypu3ND+wnwX7yes9a/
 ikkRFE+xAnlAyVqjNEsi4c/y7zzELDSiseyApg0HTDvw+Sq7rIIHJHhwIduufFULCSHo
 khfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WxwmrpsEvSIHCqKyrbgIWagGPaBeap74xZ38jQnYjMI=;
 b=EFDvAV7c/nCAlApSDNBypdm7rJRRv7BaGuMwmwCo8CiB2SQ4VNug/FTAo+J05pfaov
 V9gU9SZKGEdtA08ge015NMJI0hrTxm4QaKIwEzf0CG9AtSFSGHApYOOt8eJvfqZNOj5Q
 HP6z1FmXrxw5U2usvX+wr7AuA5H/Mz/u3SzloJBhyUDhu+fDi3rdatCa+hG04wtTH8Sx
 ac2S0uJ5ptOddl62i3dDK62UHzBJ/58ptIL0756jq7lEUthzTJwcPqku+m2F6jzBI5OV
 4YlK+aJXvqkOCBvOZAKT9qmDXq1Dr1DtWBwzxvd/h5ODAgRCKPacEZ9FkwXsXjb59inT
 4kRQ==
X-Gm-Message-State: APjAAAUiGaL1/lL69TFRoAT3iBKlnXjEU4Wxcml4+OkIL4CUwZjvSU0D
 76FOKdpRLAnH+OPb8lNGXdE=
X-Google-Smtp-Source: APXvYqxua5ZCZ8hYefxJVw0Z7sASanab3iVfMHAfLgUosQmXYzmdnZdSqWeV1lPWXafRXfEHEpPlMw==
X-Received: by 2002:aa7:9a96:: with SMTP id w22mr3010770pfi.210.1582704641739; 
 Wed, 26 Feb 2020 00:10:41 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id v7sm1679230pfn.61.2020.02.26.00.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 00:10:40 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Torsten Duwe <duwe@suse.de>, Icenowy Zheng <icenowy@aosc.io>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/6] Add LCD support for Pine64 Pinebook 1080p
Date: Wed, 26 Feb 2020 00:10:05 -0800
Message-Id: <20200226081011.1347245-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.25.0
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since ANX6345 driver has been merged we can add support for Pinebook LCD

This is a follow up on [1] which attempted to add support for all the
A64-based Pinebooks.

Since patches for 768p were dropped we don't need edp-connector binding
discussed in [1] and its earlier versions and we can use panel-simple
binding as everyone else does.

If we ever going to add support for 768p we can do it through dt-overlay
with appropriate panel node or by teaching bootloader to patch dtb with
correct panel compatible.

Similar approach was chosen in [2]

[1] https://patchwork.kernel.org/cover/10814169/
[2] https://patchwork.kernel.org/patch/11277765/

v2:
  - Collect r-b tags
  - Don't print devm_regulator_get() error only if it is -EPROBE_DEFER
  - Keep compatibles alphabetically sorted in panel-simple.yaml
  - Properly indent new panel modes
  - Drop #address-cells, #size-cells properties and @0 suffix
    of endpoints in sun50i-a64-pinebook.dts

Icenowy Zheng (1):
  arm64: allwinner: a64: enable LCD-related hardware for Pinebook

Samuel Holland (1):
  drm/bridge: anx6345: Fix getting anx6345 regulators

Vasily Khoruzhick (4):
  drm/bridge: anx6345: don't print error message if regulator is not
    ready
  dt-bindings: Add Guangdong Neweast Optoelectronics CO. LTD vendor
    prefix
  dt-bindings: display: simple: Add NewEast Optoelectronics WJFH116008A
    compatible
  drm/panel: simple: Add NewEast Optoelectronics CO., LTD WJFH116008A
    panel support

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 .../dts/allwinner/sun50i-a64-pinebook.dts     | 61 ++++++++++++++++++-
 .../drm/bridge/analogix/analogix-anx6345.c    | 12 ++--
 drivers/gpu/drm/panel/panel-simple.c          | 48 +++++++++++++++
 5 files changed, 120 insertions(+), 5 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
