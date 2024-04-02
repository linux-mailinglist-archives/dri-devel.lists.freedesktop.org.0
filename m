Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15D895FC5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 00:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E82A112137;
	Tue,  2 Apr 2024 22:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="R2Mv59eh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C683B1120AA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 22:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1712097821; x=1712357021;
 bh=F0SQdHHWp6QcFExmIqpo0ogahH8H5BOigMCQ40qcicw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=R2Mv59ehoIyH/WQrnuI8OI18xL8joPaY08/tXAePLDtkmo8Rkyj8LrPH7TazRoRBw
 cUEf1fc78ZcGBp1Z557S1L4JP44fUn3PuoOV8nB4k+6uLLOm+pa6MfYtndIapCgTus
 waJou+wgPiA91UA9p0W6ECX7qzkBAuTjLYuoYj8cdvk4/QgXgl6qZZTg3mKkH6upRA
 iH5g87hHwL0AehQRx+IOtuc/n6pWKD8sVIm4UtNMRM2XQbnDSdesijK9ZPPFWtZpg3
 VqyY45S9gCcW88LYjc7mT8+dhjrJTfaASwfXFI3ytvMuKGgzxQsieNLi5dQhIaZVL2
 q3Cb7x7IrPycQ==
Date: Tue, 02 Apr 2024 22:43:34 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Nicolas Devos <ndevos-dev@pm.me>
Cc: Nicolas Devos <ndevos-dev@pm.me>
Subject: [PATCH 1/4] gpu/drm: Add SPDX-license-Identifier tag
Message-ID: <20240402224320.12146-2-ndevos-dev@pm.me>
In-Reply-To: <20240402224320.12146-1-ndevos-dev@pm.me>
References: <20240402224320.12146-1-ndevos-dev@pm.me>
Feedback-ID: 76711691:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 02 Apr 2024 22:48:59 +0000
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

This commit fixes following checkpatch warning:
WARNING: Missing or malformed SPDX-License-Identifier tag

Signed-off-by: Nicolas Devos <ndevos-dev@pm.me>
---
 drivers/gpu/drm/drm_connector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index b0516505f7ae..40350256b1f6 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
 /*
  * Copyright (c) 2016 Intel Corporation
  *
--=20
2.42.0


