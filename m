Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889D7B99215
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 11:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CC510E6D2;
	Wed, 24 Sep 2025 09:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bogVNTk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADC910E6D3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 09:28:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 824454085F;
 Wed, 24 Sep 2025 09:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581DAC2BCB2;
 Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758706101;
 bh=47f3TxVSb5XBlK+7j3tmWOP9WWwsUxqEELtzzZHVOso=;
 h=From:To:Cc:Subject:Date:From;
 b=bogVNTk/cEiqP2mS+0+T+MLtpf4sOtySUsCQGN38IEf1lojp+iwQxRwHgRo0FJZCp
 jVLOiFJ9wtUsXxHe8rstJ3ilLZ4J05ywrxFIIXW2ODs/vGELtp3vP/SOgP2TqQt73R
 Wimu93Xj30m9pYrJU6guLk5DNSn6uQDIu73zXBQrMAMmo6dpyfL5gh69f0nQpiOSKU
 SiRxWv9Jhz172m0vXKsAccJ6PX2+KbhGzI2K1cBmHTBWpOnHLqaygErEAk13MzqJO2
 72tJVtrtK9lpTsstnaNk5i3YGky2PJyYG2k8S+S3u/VU/+dYwXUQMI8zE85+mlPz4X
 AHe2bnxt9MTBQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1v1LnK-000000006p0-2BWm;
 Wed, 24 Sep 2025 11:28:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] drm/imx: drop unused module aliases
Date: Wed, 24 Sep 2025 11:26:39 +0200
Message-ID: <20250924092643.26113-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
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

When fixing up a device reference leak in the tve drivers I noticed it
had an unused platform alias. This series drops unused aliases from the
imx drm drivers.

Johan


Johan Hovold (4):
  drm/imx/dw-hdmi: drop unused module alias
  drm/imx/ldb: drop unused module alias
  drm/imx/tve: drop unused module alias
  drm/imx/parallel-display: drop unused module alias

 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c      | 1 -
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c          | 1 -
 drivers/gpu/drm/imx/ipuv3/imx-tve.c          | 1 -
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 1 -
 4 files changed, 4 deletions(-)

-- 
2.49.1

