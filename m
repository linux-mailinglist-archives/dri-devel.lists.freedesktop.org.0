Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD1D1F71D9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 03:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F2F6E0F5;
	Fri, 12 Jun 2020 01:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8BC6E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 01:51:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591926684; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=NPCb3Uqzz3oUIaeeSIIlCSHfZW4+SVdoUKbcs2t0HXA=;
 b=sA40wfCR72QYcAVw72kQHykCve0WBYQKQR4+Rnm8t/KBcjQ627Ls5rBq6QLScI3yKdp0qHfX
 q0HTao4ZBzhgdJFTPbT/1o7k6bzjN9MkuGXm2+xrAcqCd8ZIwJIYT7CYzVl8PsfKizmMJicb
 fdy3SLwQ8Io6JXqFa+NU7PWU0M4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ee2df9886de6ccd4467555c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 01:51:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8DB3EC433CA; Fri, 12 Jun 2020 01:51:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 49565C433C8;
 Fri, 12 Jun 2020 01:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 49565C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=tanmay@codeaurora.org
From: Tanmay Shah <tanmay@codeaurora.org>
To: sam@ravnborg.org,
	robh+dt@kernel.org,
	swboyd@chromium.org
Subject: [PATCH v6 0/5] Add support for DisplayPort driver on
Date: Thu, 11 Jun 2020 18:50:25 -0700
Message-Id: <20200612015030.16072-1-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
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
Cc: devicetree@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches add support for Display-Port driver on SnapDragon
hardware. It adds
DP driver and DP PLL driver files along with the needed device-tree
bindings.

The block diagram of DP driver is shown below:


                 +-------------+
                 |DRM FRAMEWORK|
                 +------+------+
                        |
                   +----v----+
                   | DP DRM  |
                   +----+----+
                        |
                   +----v----+
     +------------+|   DP    +----------++------+
     +        +---+| DISPLAY |+---+      |      |
     |        +    +-+-----+-+    |      |      |
     |        |      |     |      |      |      |
     |        |      |     |      |      |      |
     |        |      |     |      |      |      |
     v        v      v     v      v      v      v
 +------+ +------+ +---+ +----+ +----+ +---+ +-----+
 |  DP  | |  DP  | |DP | | DP | | DP | |DP | | DP  |
 |PARSER| | HPD  | |AUX| |LINK| |CTRL| |PHY| |POWER|
 +--+---+ +---+--+ +---+ +----+ +--+-+ +-+-+ +-----+
    |                              |     |
 +--v---+                         +v-----v+
 |DEVICE|                         |  DP   |
 | TREE |                         |CATALOG|
 +------+                         +---+---+
                                      |
                                  +---v----+
                                  |CTRL/PHY|
                                  |   HW   |
                                  +--------+


These patches have dependency on clock driver changes mentioned below:
https://patchwork.kernel.org/patch/11245895/
https://patchwork.kernel.org/cover/11069083/

Chandan Uddaraju (4):
  dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
  drm: add constant N value in helper file
  drm/msm/dp: add displayPort driver support
  drm/msm/dp: add support for DP PLL driver

Jeykumar Sankaran (1):
  drm/msm/dpu: add display port support in DPU

 .../bindings/display/msm/dp-sc7180.yaml       |  142 ++
 .../devicetree/bindings/display/msm/dpu.txt   |    8 +
 drivers/gpu/drm/i915/display/intel_display.c  |    2 +-
 drivers/gpu/drm/msm/Kconfig                   |   21 +
 drivers/gpu/drm/msm/Makefile                  |   15 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   29 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   65 +-
 drivers/gpu/drm/msm/dp/dp_aux.c               |  530 +++++
 drivers/gpu/drm/msm/dp/dp_aux.h               |   35 +
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 1025 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h           |   86 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c              | 1709 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h              |   35 +
 drivers/gpu/drm/msm/dp/dp_display.c           |  912 +++++++++
 drivers/gpu/drm/msm/dp/dp_display.h           |   31 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |  170 ++
 drivers/gpu/drm/msm/dp/dp_drm.h               |   18 +
 drivers/gpu/drm/msm/dp/dp_hpd.c               |   69 +
 drivers/gpu/drm/msm/dp/dp_hpd.h               |   79 +
 drivers/gpu/drm/msm/dp/dp_link.c              | 1216 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h              |  132 ++
 drivers/gpu/drm/msm/dp/dp_panel.c             |  490 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h             |   95 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |  390 ++++
 drivers/gpu/drm/msm/dp/dp_parser.h            |  204 ++
 drivers/gpu/drm/msm/dp/dp_pll.c               |   93 +
 drivers/gpu/drm/msm/dp/dp_pll.h               |   59 +
 drivers/gpu/drm/msm/dp/dp_pll_10nm.c          |  903 +++++++++
 drivers/gpu/drm/msm/dp/dp_pll_private.h       |  103 +
 drivers/gpu/drm/msm/dp/dp_power.c             |  422 ++++
 drivers/gpu/drm/msm/dp/dp_power.h             |  115 ++
 drivers/gpu/drm/msm/dp/dp_reg.h               |  505 +++++
 drivers/gpu/drm/msm/msm_drv.c                 |    2 +
 drivers/gpu/drm/msm/msm_drv.h                 |   53 +-
 include/drm/drm_dp_helper.h                   |    1 +
 36 files changed, 9753 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
 create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_10nm.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_private.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h


base-commit: 48f99181fc118d82dc8bf6c7221ad1c654cb8bc2
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
