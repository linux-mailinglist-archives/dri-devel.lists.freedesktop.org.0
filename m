Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C0B53061
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF91A10EAA9;
	Thu, 11 Sep 2025 11:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="EVroO2MF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m19731103.qiye.163.com (mail-m19731103.qiye.163.com
 [220.197.31.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D34F10EAA9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:28:04 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 227a3f1d8;
 Thu, 11 Sep 2025 19:27:59 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org, l.stach@pengutronix.de,
 dianders@chromium.org, m.szyprowski@samsung.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 0/4] Apply DP helper APIs to do link train
Date: Thu, 11 Sep 2025 19:27:52 +0800
Message-Id: <20250911112756.4008435-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993888476f03a3kunmb42177f792e2d9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhgfGlZCTR1IHk1MSRhLQ01WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=EVroO2MF3GnFuw9hJfohQ1fmLW1XOYM3YebZjt2OFUuZlpGO70vt4DcyHY9f4Wnm+X6mZ4ftsNAgztk50h7YQOu0NL5sEi6ZjGoJacbD5ViE52kDNQ+AOhihOYVse7MwpdClHCng27N4TFxItbMaHsEo4/709b+W+yutle8Y2Ow=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=Hk7Ki6Si6z3USDwD3fN4IHJ3bHgwqmzOwTM8IT8h4M4=;
 h=date:mime-version:subject:message-id:from;
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

Use the existing DP helper APIs instead of repeated self-defined
interfaces with the same functions. It can help make codes more
concise.

Damon Ding (4):
  drm/bridge: analogix_dp: Apply DP helper API
    drm_dp_dpcd_read_link_status()
  drm/bridge: analogix_dp: Apply DP helper API
    drm_dp_clock_recovery_ok()
  drm/bridge: analogix_dp: Apply DP helper API drm_dp_channel_eq_ok()
  drm/bridge: analogix_dp: Apply DP helper APIs to get adjusted voltages
    and pre-emphasises

 .../drm/bridge/analogix/analogix_dp_core.c    | 123 +++---------------
 1 file changed, 18 insertions(+), 105 deletions(-)

---

Changes in v2:
- Update Tested-by tag.

-- 
2.34.1

