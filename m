Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC40D3405AF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 13:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FBC6E8E8;
	Thu, 18 Mar 2021 12:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from a0.mail.mailgun.net (a0.mail.mailgun.net [198.61.254.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528346E8E4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 12:40:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616071227; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=s6VV7GTQncp21xvrXYojy8gPu45408PlPCy0aMnUmSc=;
 b=EXGWhYRUz3mDzZUwsIkkFKCCUkaJFe6P46aht9uSk4CqmKSwesJ3ANbQzGmpoWPe/aKV2yE1
 8V6I2KzqN+nx/amT6HS4JQVPCG4jARfBvE8maDTaCfpv+dH3cZ+rvClp8aiO8FYXqERoDf1e
 flNb3vCbT0HjKpbLC7Z0uoor6l4=
X-Mailgun-Sending-Ip: 198.61.254.59
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60534a2ae3fca7d0a62ae741 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Mar 2021 12:40:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 16FAEC4346F; Thu, 18 Mar 2021 12:40:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 508BCC433C6;
 Thu, 18 Mar 2021 12:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 508BCC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kgunda@codeaurora.org
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: [PATCH V5 0/2] Fix WLED FSC Sync and brightness Sync settings
Date: Thu, 18 Mar 2021 18:09:38 +0530
Message-Id: <1616071180-24493-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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

This patch series has the following two WLED fixes
 1. As per the current implementation, for WLED5, after
    the FSC (Full Scale Current) update the driver is incorrectly
    toggling the MOD_SYNC register instead of toggling the SYNC register.
    The patch 1/2 fixes this by toggling the SYNC register after
    FSC update.

 2. Currently, the sync bits are set-then-cleared after FSC and brightness
    update. As per hardware team recommendation the FSC and brightness sync
    takes place from clear-then-set transition of the sync bits.
    The patch 2/2 fies this issue.

changes from V4:
  1. Rebased this patch series on the below patch.
     "backlight-qcom-wled-Use-sink_addr-for-sync-toggle.patch".

Changes from V3:
  1. Updated the patch description as per Daneil's suggestion.
  2. Added Daniel's "Reviewed-by" tag for patch 2/2.
  3. Updated the cover letter to use "set" and "clear" properly.
 
Changes from V2:
  1. Added Daniel's "Reviewed-by" tag for patch 1/2.
  2. Updated the patch 2/2 description with "set" and "clear"
     terminology instead of "1" and "0".
  3. Updated the cover letter with "set" and "clear" terminology
     instead of "1" and "0".

Changes from V1:
  1. Updated the cover letter.
  2. Updated the description of the patches as per Daniel's suggestion.

Kiran Gunda (2):
  backlight: qcom-wled: Fix FSC update issue for WLED5
  backlight: qcom-wled: Correct the sync_toggle sequence

 drivers/video/backlight/qcom-wled.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
