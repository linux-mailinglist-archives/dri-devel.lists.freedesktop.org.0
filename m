Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9475483A5C0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 10:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F3B10F6D2;
	Wed, 24 Jan 2024 09:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F3A10F6C8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 09:42:31 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1rSZSW-0002bS-PC; Wed, 24 Jan 2024 10:22:12 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] drm/etnaviv: Disable SH_EU clock gating on the i.MX8MP NPU
Date: Wed, 24 Jan 2024 10:22:07 +0100
Message-Id: <20240124-etnaviv-npu-v1-0-a5aaf64aec65@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/WsGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQyMT3dSSvMSyzDLdvIJSXTMj8zQzCwtDYyOjZCWgjoKi1LTMCrBp0bG
 1tQAUD+Y9XQAAAA==
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-f0463
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vendor kernel sets a previously unknown clock gating bit in the
VIVS_PM_MODULE_CONTROLS register to disable SH_EU clock gating.

Import new headers from rnndb for the definition and set the bit
for the VIPNano-Si+ NPU on i.MX8MP.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Philipp Zabel (2):
      drm/etnaviv: Update hardware headers from rnndb
      drm/etnaviv: Disable SH_EU clock gating on VIPNano-Si+

 drivers/gpu/drm/etnaviv/cmdstream.xml.h |  52 ++++++++++++++--
 drivers/gpu/drm/etnaviv/common.xml.h    |  12 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c   |   4 ++
 drivers/gpu/drm/etnaviv/state.xml.h     | 101 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/etnaviv/state_blt.xml.h |  20 +++----
 drivers/gpu/drm/etnaviv/state_hi.xml.h  |  28 +++++----
 6 files changed, 174 insertions(+), 43 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240124-etnaviv-npu-627f6881322c

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>

