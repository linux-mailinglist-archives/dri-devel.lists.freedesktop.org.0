Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3CAB43D8
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FA510E498;
	Mon, 12 May 2025 18:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cEkkpk+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C737910E498
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:43:07 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a0b637db6eso2901805f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747075386; x=1747680186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=etzeMqCvGPIevt6vxBFhorzveQl/MKqmDBynhGBwRdQ=;
 b=cEkkpk+NGD3EiijptRBC5H+MQhxh6xxPdBD6ImHT9cK5MDVgbgT84r8VAtGTDydStM
 rvU51NuE+7kT/mh2y0eF5L7enVPVS5euiKr3PC1nrShYMTBaG5xLMjOzi0iPSA0zNzf8
 kQTHtHR7VERenQ4KiGyw4V2sbTMfa6pPQrXAZVpcY8JMMl47az1zB9i6j3TOrWn23EAw
 rm1dKQ5MlAH5PsE+VxZdYMFkFs0bYqjcny4SfXfOBluTWJH1CkI4RxVZI20rUaEt40oZ
 R/EIb2WjJV68lNUyTo3otGBqqsTCagdyyDiN16ZOp9sKMZM4xF6ve4xkJPYi1Pw2g2rt
 Ey8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747075386; x=1747680186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=etzeMqCvGPIevt6vxBFhorzveQl/MKqmDBynhGBwRdQ=;
 b=I3FBXanDPOj0fZ3PpwS04cIDUCU3N1gz90u2oAWY1gCUxIjdbv4pBEKiHbNfCtMdy1
 AP8EnIfM3Tb6GFYf77pP5QcQqZHUo9/qzHCBkBTXCIzCc8ml9iC8BY4wI9DN9pV0uTZW
 s49nl1axK85O9c2+8KAMS/5xmYYINOw4RxDaWTFeNn2Wj4CP6o5DjVEiiv/ND5WS8ds+
 63SVJ6s0xY70vPZxw4JmjEJ2GFtGYk61DQ5EkRpavdWEO7VXLv4k717ya3oQtLQZYVLH
 V84WSDcMg6E+wZYIK5Bjyi5MwR3+2S6Ee+Dpi8fs4uvWf5yBpCIuB3fOHjVfzBZQcEb6
 K3/Q==
X-Gm-Message-State: AOJu0YzpVjxuyVC8kzYPWeX6vq6qaVYtsEWA/b5vx+KzeBRayUgJ+Mq/
 6IK/eYr95x1KjPPBotkMeT4cNZW/5YH8qFKWHtjQWz2caEuB6wDF
X-Gm-Gg: ASbGncuNDsxIdJ1Ny+pwmWFGYjj31tnbSXNeRTvvkyKcGjjw/wPcuGB3MQbHeMpeI27
 zheYMp8wmeLWDjewuBzsvfp6T5uOwWZjLzzB2EiMaFKRTbMPSMJoKgA1AlFDrKbgxPpGH7mDSAe
 sYjIjjj1I5XX22Y9LL74SgY/VIMaz7zzq7LGNtFZMpVM/hOt2wLIocl9gQbkVeP8ByxBJVbbC41
 t+ZeJ8BMFm+w7ss/FB3igI98MqY0UuGTlTmpzFc1yUr5umQLCmjDhcMoFtoUtjm49VDIGtFvs+P
 vezxpizhkvlaiDqFnzLJqK6mb7KPlCJOxOvuPbmT1dFV1ETJz+R/20jRPBKagBnP7YCgsONsFxz
 Rpp5YeABy/8I=
X-Google-Smtp-Source: AGHT+IGCZBki1TwOZKeT8nLYBD47cY3GzVmgBzninh+63BIY3vJ4w+vzka5WJDllqnhD0owmjq7S0Q==
X-Received: by 2002:a05:6000:3102:b0:3a0:b784:8826 with SMTP id
 ffacd0b85a97d-3a1f6431a65mr10789833f8f.19.1747075386042; 
 Mon, 12 May 2025 11:43:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57ddd53sm13309203f8f.1.2025.05.12.11.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:43:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/4] Add support for DU/DSI clocks and DSI driver support
 for the Renesas RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:42:58 +0100
Message-ID: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds DU/DSI clocks and provides support for the
MIPI DSI interface on the RZ/V2H(P) SoC. It was originally part of
series [0], but has now been split into 4 patches due to dependencies
on the clock driver, making it easier to review and merge.

[0] https://lore.kernel.org/all/20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note: This patch series applies on top of the following patch series:
[1] https://lore.kernel.org/all/20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P)
    SoC
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 116 ++++--
 drivers/clk/renesas/r9a09g057-cpg.c           |  63 ++++
 drivers/clk/renesas/rzv2h-cpg.c               | 237 +++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  17 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 343 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas-rzv2h-dsi.h         | 211 +++++++++++
 7 files changed, 990 insertions(+), 31 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

-- 
2.49.0

