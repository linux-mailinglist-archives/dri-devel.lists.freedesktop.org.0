Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECDE49F7BE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 11:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FDB10F002;
	Fri, 28 Jan 2022 10:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F9110F002
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 10:59:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDOyC-0006q3-Lu; Fri, 28 Jan 2022 11:59:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDOy8-00CxGl-OF; Fri, 28 Jan 2022 11:59:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDOy7-001vPp-CZ; Fri, 28 Jan 2022 11:59:03 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/2] drm/imx/lcdc: drm driver for imx21/25/27
Date: Fri, 28 Jan 2022 11:58:47 +0100
Message-Id: <20220128105849.368438-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; h=from:subject;
 bh=loQ9hR5oKD5ck64zONOGFj50UFcPnR0n2LOYgC2oTEE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBh88xZfzDQ0qRlo9d5OI23RAi6UQhkl7eOkKTl/1Kz
 ufe1tNuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYfPMWQAKCRDB/BR4rcrsCZ/pCA
 CGPiZFUFzUMI9hbjF1m1CpjTMRZAP7ys15ysUe3oBUYO3o8lbw7rrSWmPgFia+l03VcaJQBsDdn0fa
 fyKV++SbUR6nslm+YTIl8wEOGRI0y0r8Q2EWfBPsXtwc0mcYECnX7D4vi2FAVQtKcSC5D5VQejbWB+
 z0dPF/iy3wwYEMRxeCzDmRys010OjUShtH3yQu72J5Ko7oIk/rp3ZELutqvjVuN/q5M4U8eixsWj5X
 IVkM5JCWe5/5FoPGvz1CeGSj3837Lm0/IZ67H29WAAgsFJD4agyfghHEdN7fJyI/IYFrQob+wtQQmH
 zD9Cp5KstTfGJYDyDmBoq/ZFs4DzDM
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this patchset was created mostly by Marian Cichy, who in the meantime
left Pengutronix. I still kept his name and email address as author, but
note that the email address doesn't reach Marian any more.

There is already a maintainer entry for imx DRM drivers that matches
good enough.

This was tested on an i.MX25 based customer machine.

Best regards
Uwe

Marian Cichy (2):
  dt-bindings: display: imx: Add fsl,imx21-lcdc docs
  drm/imx/lcdc: Implement DRM driver for imx21

 .../bindings/display/imx/fsl,imx21-lcdc.yaml  |  79 +++
 drivers/gpu/drm/imx/Kconfig                   |   9 +
 drivers/gpu/drm/imx/Makefile                  |   2 +
 drivers/gpu/drm/imx/imx21-lcdc/imx21-lcdc.c   | 631 ++++++++++++++++++
 4 files changed, 721 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx21-lcdc.yaml
 create mode 100644 drivers/gpu/drm/imx/imx21-lcdc/imx21-lcdc.c

-- 
2.34.1

