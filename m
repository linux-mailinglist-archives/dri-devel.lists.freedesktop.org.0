Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D48629CE
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 09:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AD010E1FB;
	Sun, 25 Feb 2024 08:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gTEy0rkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8E710EC10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:49:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4E6A4C3A18
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:45:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0367A240003;
 Fri, 23 Feb 2024 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708695922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CUmJ2G7CxGQ9gN41KMMicO2/OzO2sVyAXn0vq+YQnEs=;
 b=gTEy0rkq6UYMGwiZTZ19b5bAZM7P5MtNF/JcL+z+6Id31uzQKxvukzqG7INnoxfz/hE5sA
 gaA0JXFzwJnX2ADB4KKpOMNs4M0hpULTxM41eZpR24F2rlTwo6CJgZB0TdIHf3L8tWamS+
 QY90FjXIpmXfsmZ5N2xJyi3tXgmV1xH9x1eVF1ptspNhFQuZhd0LQ0RzOnEP5ffJJRNlZU
 C+6pBhjcdfpt5G8PpRZUWjpQ+q+BWGXofYRijBLTb0hMpDr/Dz2w8Tbt8koOuPF9k2nDqe
 EF/kFHns6hbI75gpEdMbseAuPP5dJ/xhA6SXEQQPB890H+HatiGoKkddh4gciA==
From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?=
 <jeremie.dautheribes@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>,
 =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?= <jeremie.dautheribes@bootlin.com>
Subject: [PATCH 0/3] panel-simple: add support for Crystal Clear CMT430B19N00
Date: Fri, 23 Feb 2024 14:45:14 +0100
Message-Id: <20240223134517.728568-1-jeremie.dautheribes@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeremie.dautheribes@bootlin.com
X-Mailman-Approved-At: Sun, 25 Feb 2024 08:49:54 +0000
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

This patch series add support for the Crystal Clear Technology
CMT430B19N00 4.3" 480x272 TFT-LCD panel.
It also adds Crystal Clear Technology to vendor-prefixes.yaml.

Please note that unfortunately there is no public datasheet available
for this panel.

Jérémie Dautheribes (3):
  dt-bindings: Add Crystal Clear Technology vendor prefix
  dt-bindings: display: simple: add support for Crystal Clear
    CMT430B19N00
  drm/panel: simple: add CMT430B19N00 LCD panel support

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
 3 files changed, 33 insertions(+)

-- 
2.34.1

