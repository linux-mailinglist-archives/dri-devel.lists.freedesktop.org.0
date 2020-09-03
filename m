Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C5725CDEA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 00:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A766EA39;
	Thu,  3 Sep 2020 22:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B756E20F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 22:43:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599173038; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=OUHfKb7+kSzeyyUYAIuHS6fXHze1IkqBGJwGQ2VEOsU=;
 b=Gb5763De1KDupDB0wIerj/AKxHp0eeKbRXLEAMkWtQAvM33ivS1LkhPfZvTQjKa1FDOM8ZYQ
 fm8CCr7eelSdczUhcWccjk0UQO+ZOT6q4zeB5n3Q31U1Ir6s5pauJZSYc2KpMR6wdU/FFtRD
 uE6LQxs+a7JDpoFDWN3OKhkYJF4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f51719832925f96e146e171 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 22:43:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C6D04C43395; Thu,  3 Sep 2020 22:43:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 026F2C433C8;
 Thu,  3 Sep 2020 22:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 026F2C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] Add support for video pattern DP CTS to MSM DP
Date: Thu,  3 Sep 2020 15:43:24 -0700
Message-Id: <20200903224328.26452-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 tanmay@codeaurora.org, aravindh@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for video pattern Display Port Compliance tests to
MSM DP driver. The userspace component of this shall be part of another
series in the igt mailing list.
This depends on series [1] , [2] and [3] which add basic Display Port
support to MSM chipsets.

[1] https://patchwork.kernel.org/project/dri-devel/list/?series=339847
[2] https://patchwork.kernel.org/project/dri-devel/list/?series=339997
[3] https://patchwork.kernel.org/project/dri-devel/list/?series=341175

Abhinav Kumar (4):
  drm/msm/dp: add debugfs support to DP driver
  drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/
  drm/msm/dp: add debugfs nodes for video pattern tests
  drm/msm/dp: remove mode hard-coding in case of DP CTS

 drivers/gpu/drm/msm/Makefile            |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   7 +
 drivers/gpu/drm/msm/dp/dp_debug.c       | 485 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_debug.h       |  74 ++++
 drivers/gpu/drm/msm/dp/dp_display.c     |  28 +-
 drivers/gpu/drm/msm/dp/dp_link.c        |   2 +-
 drivers/gpu/drm/msm/dp/dp_link.h        |  23 ++
 drivers/gpu/drm/msm/dp/dp_panel.c       |  46 +--
 drivers/gpu/drm/msm/msm_drv.h           |   2 +
 9 files changed, 617 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
