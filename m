Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC66C45792
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 09:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F27A10E0F0;
	Mon, 10 Nov 2025 08:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="FJ2z7qVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15572.qiye.163.com (mail-m15572.qiye.163.com
 [101.71.155.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6E910E0F0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:58:41 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 29068b4ed;
 Mon, 10 Nov 2025 16:58:38 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 0/4] Apply DP helper APIs to do link train
Date: Mon, 10 Nov 2025 16:58:19 +0800
Message-Id: <20251110085823.1197472-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a6cfd1b4c03a3kunm91e8d29910ac4c4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRlLS1YdT0xLH0IfQh4ZThpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=FJ2z7qVZQ6/QYQQCRDzK6uzMBmlGV21oODl2EJdezVVkhkwdpWgr+9Xj+kORtROwhis/0OKAtkZFHQiVt8F9iOMEhOS5/ycxnc1wLmd4jAfFQlTdg1PRs6wEHyD21xvS1DZDbj6PuyfLv3+AwSgaVaeA6Fypl1Pw3OfI0MrgNzI=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=GgicSIGu0ctvY+ZmjY4F6uew1MDwxU5622xODKbenHQ=;
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

Changes in v3:
- Update Reviewed-by tag.

-- 
2.34.1

