Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D918216594A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3304D6E1E2;
	Thu, 20 Feb 2020 08:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1A16ECF6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 08:35:53 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id dw13so576896pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 00:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SW6+8bpFonKNb3f2YyuDTFneOp+QYGUKG8MU+Huhr84=;
 b=NLfDvpmphz84eNv17aBMiiqAMqVRvSFWjee1gd8DwTcU5WUsDFqZ9aP2ecjx9QMRwb
 PALAwf/6OlcTq/DyByk0h/aL5jR0Qh9kpipz1wKr+X5OrLfG1xso5chKqEDsvCEN1+7N
 AdybVWlhDI15pIfmzvZVQv43ua+uIFoDZJrZDz5Ua0Fiypghs7qmCxakm12iLhqx6prn
 MIqA8+HOleqP7N+mT+fe3/JnCtSTQM8pLAUuVj3WkfTo14VvtQavoi6qzUSIhv5TJqXr
 s9lBrcXILDs5wdYQKHBFMZkvh68Wg1UutoTVS4mSTxrtUs7NPiittk0I5xDEDo1a1I/C
 KxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SW6+8bpFonKNb3f2YyuDTFneOp+QYGUKG8MU+Huhr84=;
 b=cvFLbXhGAW0EPiSEfLcAVDCKl33RfPeFWMY1/r1vSG4UoV9YiGizTMizfpxnkuqHKC
 mzWrNmoleFu1oNoTjp3WBXKFGts6KO1tyPy7nYavwpYdTDr4f9AVYGvlloS1r/x1chqs
 feUJlYEIPP2FLNqE+c4uJ4FxfO75txgasfUeRbopgRPAOq5w+SZmPfIL20VPQ8ZuuSFb
 BNBwGAbso4nxU07tgar70xTA2AQcl+bU6Qzgdc8LcPO6+VHanXyLztUdsVuIRoYFoFKy
 2ux5f8vp9aWPB8LvvtVLIHdl2VokyS08RB2Vsnzd69gE2xlJl0jor+XfwJrnSGxKYJcG
 uCdw==
X-Gm-Message-State: APjAAAUmJ2vxITRpY7my5phHqMxIqyafolLlmJjZ0nv9kbwo6sIY8gLp
 bzAPOg4wuT52Lbqfh3O4kwk=
X-Google-Smtp-Source: APXvYqwUjt36D32iUpxvkzgCrZ5Cy1bNz6qVcLjbq7xSe6oYStvEJ3BdJs2uPheTayNx6ML7KG+AaA==
X-Received: by 2002:a17:902:8bc7:: with SMTP id
 r7mr30187510plo.12.1582187753221; 
 Thu, 20 Feb 2020 00:35:53 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id l13sm2319038pjq.23.2020.02.20.00.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 00:35:52 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Icenowy Zheng <icenowy@aosc.io>, Torsten Duwe <duwe@suse.de>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/6] Add LCD support for Pine64 Pinebook 1080p
Date: Thu, 20 Feb 2020 00:35:02 -0800
Message-Id: <20200220083508.792071-1-anarsoul@gmail.com>
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

Icenowy Zheng (1):
  arm64: allwinner: a64: enable LCD-related hardware for Pinebook

Samuel Holland (1):
  drm/bridge: anx6345: Fix getting anx6345 regulators

Vasily Khoruzhick (4):
  drm/bridge: anx6345: Clean up error handling in probe()
  dt-bindings: Add Guangdong Neweast Optoelectronics CO. LTD vendor
    prefix
  dt-bindings: display: simple: Add NewEast Optoelectronics WJFH116008A
    compatible
  drm/panel: simple: Add NewEast Optoelectronics CO., LTD WJFH116008A
    panel support

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 .../dts/allwinner/sun50i-a64-pinebook.dts     | 69 ++++++++++++++++++-
 .../drm/bridge/analogix/analogix-anx6345.c    | 12 ++--
 drivers/gpu/drm/panel/panel-simple.c          | 47 +++++++++++++
 5 files changed, 123 insertions(+), 9 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
