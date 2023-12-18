Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DBE817BFC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 21:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E20810E0A8;
	Mon, 18 Dec 2023 20:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7C410E0A8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 20:33:24 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c08fso42667695e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 12:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702931602; x=1703536402;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uwBMo6h6CLFvzeF8BNuqk3mwyXmRoxEOvbk3nd1BFNQ=;
 b=hdvwz9WZrDRJF0br2EYsqn/jIHwa+2gyck037V6TrRcgNrNliALOpe0wutWccMHkz0
 UqXtciQ0k192Tm321hQIbeUwO23IviK3DaWAbTjhc9l4uuphM94rJVoiFViQQuIlQn8k
 zWdkFCOM+lReorkQTqdy8frNK4PVIEayITKnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702931602; x=1703536402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uwBMo6h6CLFvzeF8BNuqk3mwyXmRoxEOvbk3nd1BFNQ=;
 b=IPTmo2uB5v+89ojaK62lodpzN9lbSliA3Dt6v2o7KKLsSLZxDIgVzN8PfAjVWyIDXs
 kkPd/eTD6+wESvaodHZ+RpeOkP37hrE03nMsoiy6HKQmg+ccjHukfydMPhc9B2cmV3FE
 VtR65chxHU/oT1XAHFNeW3xiCOXad0Ye1GjkSQYhJFUkKEJmopqdcEUwM5QNq6KihTxv
 XX7yuGL0MQmlMzhPqK49iC5txvNwF6+w13433ZvDfcb2R8/Rc3cyetK9lqgKj2TdVSNc
 fAIDybYqRj9RRiKbxR/GG5ifjZliI7LLnDsJgvuUJJXmquYQ2HAho2ACxZ68O6SC0mNe
 Bcfg==
X-Gm-Message-State: AOJu0YxVgUQc2hKCEXq/apVdP3/bAYpqxij5do0mhX7lIgZJo6JSxu33
 k0Y0jzLuf2rNc33TiFoX7m+FgDE5kx0jmGrdmXwszQ==
X-Google-Smtp-Source: AGHT+IEm7GShvAvUVER372jEsNFgBOui/TD2GxKgfn1iLVvV9s2Ggpc1aSVL5uNloELUBBA8G0Q2fA==
X-Received: by 2002:a17:906:20d3:b0:a23:4472:57e7 with SMTP id
 c19-20020a17090620d300b00a23447257e7mr553006ejc.174.1702889041657; 
 Mon, 18 Dec 2023 00:44:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 un5-20020a170907cb8500b009ff77c2e1dasm13775480ejc.167.2023.12.18.00.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:44:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/2] Add displays support for bsh-smm-s2/pro boards
Date: Mon, 18 Dec 2023 09:43:36 +0100
Message-ID: <20231218084354.508942-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, michael@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


The series adds drivers for the displays used by bsh-smm-s2/pro boards.
This required applying some patches to the samsung-dsim driver and the
drm_bridge.c module.

Changes in v9:
- Updated commit message
- Drop [3/3] arm64: dts: imx8mn-bsh-smm-s2/pro: add display setup
  because applied.

Changes in v8:
- Move the 'status' property to the end of the list of nodes:
  - pwm1
  - lcdif
  - mipi_dsi
- Add a newline between properties and child node (mipi_dsi_out).
- Sort the iomuxc node alphabetically
- Rename pwm1grp to blgrp

Changes in v7:
- Drop [3/4] dt-bindings: display: panel: Add synaptics r63353 panel controller
  because applied.

Changes in v6:
- Drop patches:
  - [06/10] drm/panel: Add Synaptics R63353 panel driver
  - [07/10] dt-bindings: display: panel: Add Ilitek ili9805 panel controller
  - [08/10] drm/panel: Add Ilitek ILI9805 panel driver
  - [09/10] drm/panel: ilitek-ili9805: add support for Tianma TM041XDHG01 panel
  Because applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  Drop patches:
  - [01/10] drm/bridge: Fix bridge disable logic
  - [02/10] drm/bridge: Fix a use case in the bridge disable logic
  Because they are wrong

Changes in v3:
- Replace "synaptics,r63353" compatible with "syna,r63353", as
  required by vendor-prefixes.yaml.
- Squash patch [09/11] dt-bindings: ili9805: add compatible string for Tianma TM041XDHG01
  into [07/11] dt-bindings: display: panel: Add Ilitek ili9805 panel controller.

Changes in v2:
- Adjust the mipi_dsi node based on the latest patches merged into
  the mainline in the dtsi files it includes.
- Added to the series the following patches:
  - 0001 drm/bridge: Fix bridge disable logic
  - 0002 drm/bridge: Fix a use case in the bridge disable logic
  - 0003 samsung-dsim: enter display mode in the enable() callback
  - 0004 drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting

Dario Binacchi (2):
  drm: bridge: samsung-dsim: enter display mode in the enable() callback
  drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting

 drivers/gpu/drm/bridge/samsung-dsim.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.43.0

