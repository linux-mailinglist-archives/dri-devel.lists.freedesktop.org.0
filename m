Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8633317F1C5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EEA6E84A;
	Tue, 10 Mar 2020 08:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976F589E2B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 13:26:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583760398; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=D+vuyGCUCzEM9aL20B90w5AoCxN08RN5QuMYygPRkqs=;
 b=lEG/Sm1wWMwrhHbS9TKhjKJXV0Sku4Iy0Twdo+TyjdyVaq4pLAPmuWQMMKJSeVZxTXg7/TbV
 Oyre9fOk79wCLRHdzqiy1l0+6IpovPw3Cl5KrFs9l3ezaSMdffiB7fufcaMUQoL2q+CVONUI
 pmXqZvZOmx/xoDwPmRtJDpglZ+4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e664409.7f5fb300a570-smtp-out-n05;
 Mon, 09 Mar 2020 13:26:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7F81AC433D2; Mon,  9 Mar 2020 13:26:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F3D0C43637;
 Mon,  9 Mar 2020 13:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F3D0C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kgunda@codeaurora.org
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/4] Add support for WLED5
Date: Mon,  9 Mar 2020 18:55:58 +0530
Message-Id: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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

Kiran Gunda (4):
  backlight: qcom-wled: convert the wled bindings to .yaml format
  backlight: qcom-wled: Add callbacks functions
  backlight: qcom-wled: Add support for WLED5 peripheral in PM8150L
  backlight: qcom-wled: Update auto calibration support for WLED5

 .../bindings/leds/backlight/qcom-wled.txt          | 154 -----
 .../bindings/leds/backlight/qcom-wled.yaml         | 223 ++++++++
 drivers/video/backlight/qcom-wled.c                | 622 ++++++++++++++++++---
 3 files changed, 772 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
