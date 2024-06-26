Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2591848B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C721310E7A9;
	Wed, 26 Jun 2024 14:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48BB10E2CB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:40:41 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sMTp9-0007iB-Bv; Wed, 26 Jun 2024 16:40:39 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: =?utf-8?q?=5BPATCH_0/2=5D_drm/panel=3A_ilitek-ili9881c=3A_Suppor?=
 =?utf-8?q?t_in-panel_180=C2=B0_rotation?=
Date: Wed, 26 Jun 2024 16:40:37 +0200
Message-Id: <20240626-drm-panel-ili9881c-rotation-v1-0-e0ff54173e32@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGUofGYC/x3MQQ5AMBBA0avIrE1CKeUqYtG0g0komYpIxN01l
 m/x/wORhClCnz0gdHHkPSSUeQZusWEmZJ8MqlB10agGvWx42EAr8sqdMaVD2U97pg517XVljdG
 +dZAOh9DE938fxvf9AIQuxcBtAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14-dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Ilitek IL9881C controller can rotate the image by 180°. This
might be desirable on devices with their display mounted upside down,
that don't have rotation capability in the SoC display controller.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Philipp Zabel (2):
      drm/panel: ilitek-ili9881c: Explicitly set address mode, allow 180° rotation
      drm/panel: ilitek-ili9881c: Report subpixel order according to rotation

 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240626-drm-panel-ili9881c-rotation-54d53a885d7c

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>

