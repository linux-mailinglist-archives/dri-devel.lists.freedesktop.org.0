Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ADD1B672B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3DD6EA47;
	Thu, 23 Apr 2020 22:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37986E8D9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:34:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587656057; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=2Kjf6YLoA4OkpyBb4xKWnTXI0yhSWwCZFp3OhQ7ATXg=;
 b=EgK3YuYFXphY8JZ7XRLeZiBIHDjJja/8uNFuaidhcd8mSMZO0TJYa6V+3ITNhjzQtoyjsmSJ
 7ymWF7GB41uB4KBdW39+Ihex2ZHd4osRPCoBrnmekhL1UvaL24H2+dGyFb10nBVXS/Ndz2jk
 93DcZvSbldY3bZ4Z9tKVw3A20gk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1b574.7f79ffa49110-smtp-out-n01;
 Thu, 23 Apr 2020 15:34:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B0421C433F2; Thu, 23 Apr 2020 15:34:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A899C433D2;
 Thu, 23 Apr 2020 15:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A899C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kgunda@codeaurora.org
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, robh@kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V6 0/4] Add support for WLED5
Date: Thu, 23 Apr 2020 21:03:33 +0530
Message-Id: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, WLED driver supports only WLED4 peripherals that is present
on pmi8998 and pm660L. This patch series  converts the existing WLED4
bindings from .txt to .yaml format and adds the support for WLED5 peripheral
that is present on PM8150L.

PM8150L WLED supports the following.
    - Two modulators and each sink can use any of the modulator
    - Multiple CABC selection options
    - Multiple brightness width selection (12 bits to 15 bits)

Changes from V1:
	- Rebased on top of the below commit.
	  backlight: qcom-wled: Fix unsigned comparison to zero

Changes from V2:
	- Addressed Bjorn's comments by splitting the WLED4 changes
	  in a seperate patch.
	- Added WLED5 auto calibration support

Changes from V3:
        - Addressed comments from Daniel Thompson and Rob Herring
        - Seperated the WLED5 bindings from the driver changes
         - Squashed wled5 auto string detection and wled5 basic changes
          to avoid the NULL callback function pointer issue.

Changes from V4:
        - Addressed the yaml formatting comments from Rob Herring.
        - Addressed the comments from Daniel Thompson on the below patch
  	  "backlight: qcom-wled: Add callback functions"

Changes from V5:
        - This series depends on the below patch.
          https://lore.kernel.org/patchwork/patch/1226258/
        - Addressed yaml formatting comments from Rob Herring.
        - Removed the "wled_ovp_fault_status" callback as per Daniel Thomson
          suggestion from patch #2.
        - Addressed comments from Daniel Thomson on patch #4.

Kiran Gunda (3):
  backlight: qcom-wled: convert the wled bindings to .yaml format
  backlight: qcom-wled: Add callback functions
  backlight: qcom-wled: Add WLED5 bindings

Subbaraman Narayanamurthy (1):
  backlight: qcom-wled: Add support for WLED5 peripheral that is present
    on PM8150L PMICs

 .../bindings/leds/backlight/qcom-wled.txt          | 154 ------
 .../bindings/leds/backlight/qcom-wled.yaml         | 261 +++++++++
 drivers/video/backlight/qcom-wled.c                | 589 ++++++++++++++++++---
 3 files changed, 777 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
