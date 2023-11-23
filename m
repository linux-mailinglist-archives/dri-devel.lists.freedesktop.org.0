Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC8A7F64E2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C9910E165;
	Thu, 23 Nov 2023 17:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F7410E165
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:08:14 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1r6DBR-0001A4-My; Thu, 23 Nov 2023 18:08:09 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/3] drm/panel: ilitek-ili9881c: Support Ampire AM8001280G LCD
 panel
Date: Thu, 23 Nov 2023 18:08:04 +0100
Message-Id: <20231123-drm-panel-ili9881c-am8001280g-v1-0-fdf4d624c211@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPSGX2UC/x2NQQrDIBBFrxJm3QEdu7C9Suli1EkyEG3QEgIhd
 2/s8vH47x/QpKo0eA4HVNm06adcYG8DxJnLJKjpYiBDzlpymGrGlYssqIs+vLcROXtjLHkzYSKh
 8R6cYRK4GoGbYKhc4twrfZy1RSyyf7tfq4y6//9f7/P8AYabI7mPAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12-dev-aab37
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Marco Felsch <m.felsch@pengutronix.de>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Ampire AM8001280G LCD panels to the Ilitek ILI9881C
driver.

Also set prepare_prev_first, to make sure that the DSI host controller
is initialized to LP-11 before the panel is powered up. Tested to work
with samsung-dsim on i.MX8MM after commit 0c14d3130654 ("drm: bridge:
samsung-dsim: Fix i.MX8M enable flow to meet spec").

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: kernel@pengutronix.de
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

---
Marco Felsch (1):
      drm/panel: ilitek-ili9881c: make use of prepare_prev_first

Philipp Zabel (2):
      dt-bindings: ili9881c: Add Ampire AM8001280G LCD panel
      drm/panel: ilitek-ili9881c: Add Ampire AM8001280G LCD panel

 .../bindings/display/panel/ilitek,ili9881c.yaml    |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 225 +++++++++++++++++++++
 2 files changed, 226 insertions(+)
---
base-commit: e4d983acffff270ccee417445a69b9ed198658b1
change-id: 20231123-drm-panel-ili9881c-am8001280g-d2e2f4b30a2e

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>
