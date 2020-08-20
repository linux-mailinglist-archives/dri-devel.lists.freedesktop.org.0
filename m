Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED0124CE8D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A9D6EA98;
	Fri, 21 Aug 2020 07:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B326E934
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 10:36:07 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 20 Aug 2020 03:36:07 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Aug 2020 03:36:05 -0700
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
 by ironmsg01-blr.qualcomm.com with ESMTP; 20 Aug 2020 16:05:26 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
 id DB9311F44; Thu, 20 Aug 2020 16:05:25 +0530 (IST)
From: Roja Rani Yarubandi <rojay@codeaurora.org>
To: wsa@kernel.org
Subject: [PATCH V2 0/2] Implement Shutdown callback for i2c
Date: Thu, 20 Aug 2020 16:05:20 +0530
Message-Id: <20200820103522.26242-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, saiprakash.ranjan@codeaurora.org,
 rnayak@codeaurora.org, linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
 dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 akashast@codeaurora.org, mka@chromium.org, agross@kernel.org,
 msavaliy@qti.qualcomm.com, bjorn.andersson@linaro.org, skakit@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store DMA mapping data in geni_i2c_dev struct.
Implement Shutdown callback for geni i2c driver.

Changes in V2:
 - Changed commit text.
 - As per Stephen's comments added separate function for stop transfer.

Roja Rani Yarubandi (2):
  i2c: i2c-qcom-geni: Store DMA mapping data in geni_i2c_dev struct
  i2c: i2c-qcom-geni: Add shutdown callback for i2c

 drivers/i2c/busses/i2c-qcom-geni.c | 50 ++++++++++++++++++++++++++++++
 include/linux/qcom-geni-se.h       |  5 +++
 2 files changed, 55 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
