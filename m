Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331B555426C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51719112465;
	Wed, 22 Jun 2022 05:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg136.qq.com [106.55.201.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B8E10E279
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:52:58 +0000 (UTC)
X-QQ-mid: bizesmtp67t1655819506trl0s0j1
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 21:51:42 +0800 (CST)
X-QQ-SSF: 0100000000700060B000D00A0000000
X-QQ-FEAT: wW02ejDrK1/ZlAO8EkXaEOVfFmvXqewCEGzogin1XrM0pJSkAuwU8347Hou52
 wQ1/NhiC9ypi0H7JWkWQ7ma8RbtxYRM+Yo+8KnBPlMWLz1Kw9uGc9Ud+wTzNDF4Skoyicfa
 flG1qYiZzlwWDVLOKrtpyfMbU5z8Jl2o4xkyBFa+kob5+SrEjq7SMvSTAGYJV4zUK/UKASA
 aXlG6gA5CM7emAdrv/8PA7BQReTYUs+DT22Ywj5aBMQh9e3+E4Y0E+yW+IJ+CpFLJ4W3I9n
 RAKyy8zRdmnyHERN7/MG4zZSGjj1rrqG0vCsfIFPpoQ0h0R7I0DD+las4na5/uaurfP6qTh
 VdrkVbyhYmytG13BuNa7lZmb4PXPkhuaW5CSYN7
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] GPU: drm: drop unexpected word "the" in the comments
Date: Tue, 21 Jun 2022 21:51:40 +0800
Message-Id: <20220621135140.12200-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:39 +0000
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
Cc: Jiang Jian <jiangjian@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word "the" in the comments that need to be dropped

file: drivers/gpu/drm/drm_ioctl.c
line: 86
*    means the the unique name for the master node just opening is _not_ filled
changed to
*    means the unique name for the master node just opening is _not_ filled

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/drm_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 51fcf1298023..8faad23dc1d8 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -83,7 +83,7 @@
  *
  * 1. Directly call VERSION to get the version and to match against the driver
  *    name returned by that ioctl. Note that SET_VERSION is not called, which
- *    means the the unique name for the master node just opening is _not_ filled
+ *    means the unique name for the master node just opening is _not_ filled
  *    out. This despite that with current drm device nodes are always bound to
  *    one device, and can't be runtime assigned like with drm 1.0.
  * 2. Match driver name. If it mismatches, proceed to the next device node.
-- 
2.17.1

