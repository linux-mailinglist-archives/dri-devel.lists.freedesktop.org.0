Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A112AA089D7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 09:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDA810F007;
	Fri, 10 Jan 2025 08:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B21C10E366
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 11:37:55 +0000 (UTC)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <jre@pengutronix.de>)
 id 1tVqpC-0008AS-2l; Thu, 09 Jan 2025 12:35:42 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH 0/2] drm/panel: simple: Add DataImage FG080016DNCWAG03
Date: Thu, 09 Jan 2025 12:34:56 +0100
Message-Id: <20250109-panel-dataimage_fg080016dncwag-v1-0-0465603f6669@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGC0f2cC/x3NTQqEMAxA4atI1lNIZPy9yiASbFoDWqUVHRDvP
 mWW3+a9G5JElQR9cUOUU5NuIYNeBUwzBy9GbTaUWFZI2JmdgyzG8sG6spfReWwRqbZhutgbJHo
 7oqqVxkKO7FGcfv+Dz/A8P6EBJt1wAAAA
X-Change-ID: 20250109-panel-dataimage_fg080016dncwag-0114f1158e7d
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=TGMlxvlXLxSwB7OMug1nAJvEF8pciqz/EBtHNkH1EWc=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkiv39Lt420QmDgz7mjQG3O7L4cWcjD27k7SljLfqXXVQ
 C1WrnNWRykLgxgHg6yYIkusmpyCkLH/dbNKu1iYOaxMIEMYuDgFYCKTzzEy/Pb8sjqRuaKdJfjP
 OwWJhWFcG5UDVrF9sdlt7SDKkK93heF/csJC38v2swRrF4reO8obu2Fxyuo1s8XN76jszZpzSD6
 RFwA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 10 Jan 2025 08:22:58 +0000
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

This series adds DT-bindings and panel-simple implementation for the
DataImage FG080016DNCWAG03 8" 640x480 TFT LCD panel.

The timings are sourced from the FG080016DNCWAGL1 datasheet but
available for testing was only the DataImage FG080016DNCWAG03, for which
I can confirm these values work.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Jonas Rebmann (2):
      dt-bindings: display: simple: Add DataImage FG080016DNCWAG03 compatible string
      drm/panel: simple: Add DataImage FG080016DNCWAG03 driver support

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: eea6e4b4dfb8859446177c32961c96726d0117be
change-id: 20250109-panel-dataimage_fg080016dncwag-0114f1158e7d

Best regards,
-- 
Jonas Rebmann <jre@pengutronix.de>

