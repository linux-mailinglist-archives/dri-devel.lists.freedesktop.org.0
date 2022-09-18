Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D59AA5BBB5C
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 05:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C6C10E15E;
	Sun, 18 Sep 2022 03:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B0E10E15E
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:44:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D5193320099A;
 Sat, 17 Sep 2022 23:44:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 17 Sep 2022 23:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxfierke.com;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663472663; x=1663559063; bh=qyQljdV9br
 pQJ7X55JsdBpi3YH2RlBhC12hsk3NzNdM=; b=tliP6Vx6i4qWtfuv1MT5mY58wF
 VprFpjMbV2maKU4X7ev5oWu1FPwRARQvELBwizF9bWGy1XTuhZi4BMld27/og7M4
 M8b1nfr0wpUfHhP/w23HiyZGI7QeaUKkrp5GNe8DzlaTTZcxl//rSMVST/wusLwS
 n5okqhk6qqdIhGDQhx/ZstMfypHzSwS10JcSjko5bmLJbmRduuc34YoxDAqM6AQS
 MmDe0iUjCs3R1izHsv7iL0/jGxoV62ekczfjq3qJ9VR3eIVKRXRUSzSLBUEOqv/U
 +bnl+ci5zNFr0lCHl+o202eG4OohVvy8JHwPajB4Or7lXXTEIgg3z39PL2Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1663472663; x=1663559063; bh=qyQljdV9brpQJ7X55JsdBpi3YH2RlBhC12h
 sk3NzNdM=; b=JnPzx/8N42/1t3r7Guau990PpqWPol35q2YGHlKhEzdM+u7PysY
 EsHXiz4p999PZCFm1s9sc4yVCRgtJYhAmkiOmZEZ4Qq8vH+yKhiEodq+K9fzzYHW
 q/6wxgIlG60CoNiZprlNQbHTp78WjCoYbAKJQcGUelOhHT6i2z7tVwx8skBTJeBe
 v48L7jpHFycevc6lhd7XVE5zUqCOLE5ccHtsTvSpBAFBDAOGgL3tGpftDBL5vKuN
 2YmdrNOa43xDVFGkOT1U/Vp8iVNmlXtyiHBKY6LAoU+QG+XbpxoZ/6IpVlZmgSv6
 a/AZlfgx0QXOuShWkITRS57dv1S8jYdzWQQ==
X-ME-Sender: <xms:FpQmY0MMBkdOqIYk2IL01KuYGVZckUEU_FsMxR-apwWocZKqUhg_JQ>
 <xme:FpQmY6-GUVxyyhE8SQSaIa3OhzJKjL-kYBip0WTuNYYlbGHIP9EfUliMnrfoPG_Dc
 srP-kgk-KA7XXIuXRw>
X-ME-Received: <xmr:FpQmY7Tqa3AlediiJBdsXrBT3AObmSG7AWyCHRpiJRh6mlCCRuI67m2lKW4jXi3MZWkktLVY9Fnu4Ew9MfzGRcqB6uzO2yxW3gU7LvpGfBOmmt05Sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvfedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeforgigucfhihgvrhhkvgcuoehmrgigsehmrgigfhhivghrkhgv
 rdgtohhmqeenucggtffrrghtthgvrhhnpedvtdffffegvdejheehudegkeefgffggffgge
 dutdeiheduheehhfefgeekgfektdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgiesmh
 grgihfihgvrhhkvgdrtghomh
X-ME-Proxy: <xmx:FpQmY8sSpI24hC4OFJGyBEEa0D6-3mrgTrh67NmuTl9Wv52-YBqqHg>
 <xmx:FpQmY8cmJlEc3iqIKNGTnTCqH82nWnhvk99bov-DAS1IseUZYN6HIw>
 <xmx:FpQmYw3pb6ZDZ-iKGeHBy_2WrdaSv1AYCb_8M_FyIc6SDCfn6wZf2Q>
 <xmx:F5QmYy0cbDpwLTiGekHw04CJnEfU-MybNImgVBLoa32b0FZC2zncOA>
Feedback-ID: idee9475d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Sep 2022 23:44:22 -0400 (EDT)
From: Max Fierke <max@maxfierke.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 0/4] Introduce ClockworkPi CWD686 DRM panel driver
Date: Sat, 17 Sep 2022 22:44:11 -0500
Message-Id: <20220918034415.74641-1-max@maxfierke.com>
X-Mailer: git-send-email 2.37.2
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
Cc: devicetree@vger.kernel.org, Max Fierke <max@maxfierke.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ClockworkPi DevTerm (all models) uses a 6.86" IPS display
of unknown provenance, which uses the Chipone ICNL9707 IC driver[1].

The display panel I have has two model numbers: TXW686001 and WTL068601G,
but cannot find any manufacturer associated with either, so opting for the
ClockworkPi model number.

This driver is based on the GPL-licensed driver released by ClockworkPi[1],
authored by Pinfan Zhu, with some additional cleanup, rotation support,
and display sleep re-enabling done by me.

[1] https://github.com/clockworkpi/DevTerm/blob/main/Schematics/ICNL9707_Datasheet.pdf
[2] https://github.com/clockworkpi/DevTerm/blob/main/Code/patch/armbian_build_a06/patch/kernel-004-panel.patch

Thanks to Krzysztof Kozlowski, Rob Herring, and Sam Ravnborg for their
prior reviews and apologies for the long delay between patch set versions.

Changes in v3:
 - dt-bindings: add missing lines for spacing

Changes in v2:
 - dt-bindings: remove redundant backlight example
 - add missing regulators
 - remove some unused properties from definition (e.g. enable_gpio, supply)
 - reorder includes
 - remove redundant ctx->backlight in favor of backlight through drm_panel_of_backlight
 - remove now-unneeded ctx->enabled and enable/disable hooks
 - replace ICNL9707_DCS macro with mipi_dsi_dcs_write_seq
 - use dev_err_probe instead of checking EPROBE_DEFER
 - fixed return type of cwd686_remove to be void following changes to mipi_dsi_driver
 - add .get_orientation callback

Max Fierke (4):
  dt-bindings: vendor-prefixes: Add prefix for ClockworkPi
  dt-bindings: display: Add ClockworkPi CWD686 panel
  drm: panel: Add driver for ClockworkPi cwd686 panel
  drm/panel: clockworkpi-cwd686: Implement .get_orientation callback

 .../display/panel/clockworkpi,cwd686.yaml     |  65 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-clockworkpi-cwd686.c  | 456 ++++++++++++++++++
 5 files changed, 536 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-clockworkpi-cwd686.c

-- 
2.37.2
