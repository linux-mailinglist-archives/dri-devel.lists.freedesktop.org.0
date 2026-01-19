Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187C9D3AA9B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFA610E112;
	Mon, 19 Jan 2026 13:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB9610E464
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:44:52 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.felsch@pengutronix.de>)
 id 1vhpYk-0006Dl-8g; Mon, 19 Jan 2026 14:44:46 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 0/2] Add EDT ET057023UDBA Panel Support
Date: Mon, 19 Jan 2026 14:44:41 +0100
Message-Id: <20260119-v6-18-topic-panel-simple-et057023udba-v2-0-3c73f0c9d87a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEo1bmkC/5XNQQ6DIBCF4asY1p0GUKzpqvdoXIBMdRKLBJDYG
 O9e6g26/N/ifTuLGAgju1c7C5gp0uJKyEvFhkm7EYFsaSa5bLkQNeQWRAdp8TSA1w5niPT2MwI
 mrm5c1qs1GhQiCm5M3bTIypcP+KLtdJ596YliWsLnZLP4rf8KWQAH1WgrRYeopHl4dOOawuJou
 1pk/XEcXwQT2nffAAAA
X-Change-ID: 20260113-v6-18-topic-panel-simple-et057023udba-5eee10bb346e
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this adds the support for the above mentioned display from EDT.

Regards,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260113-v6-18-topic-panel-simple-et057023udba-v1-0-54ad218ee52b@pengutronix.de
- add r-b (Neil)
- fix order (Krzysztof)

---
Marco Felsch (2):
      dt-bindings: display: simple: add EDT ET057023UDBA panel
      drm/panel: simple: add EDT ET057023UDBA panel

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 32 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260113-v6-18-topic-panel-simple-et057023udba-5eee10bb346e

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

