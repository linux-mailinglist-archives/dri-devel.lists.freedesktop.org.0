Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6574B245D35
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D34E6E4B7;
	Mon, 17 Aug 2020 07:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9F16EB1D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 10:02:58 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com)
 ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 14 Aug 2020 02:56:54 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA;
 14 Aug 2020 02:56:53 -0700
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
 by ironmsg02-blr.qualcomm.com with ESMTP; 14 Aug 2020 15:26:15 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
 id A98061AC8; Fri, 14 Aug 2020 15:26:14 +0530 (IST)
From: Roja Rani Yarubandi <rojay@codeaurora.org>
To: wsa@kernel.org
Subject: [PATCH 0/2] Implement Shutdown callback for i2c
Date: Fri, 14 Aug 2020 15:25:38 +0530
Message-Id: <20200814095540.32115-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

Add tx_dma, rx_dma and xfer_len in geni_i2c_dev struct.
Implement Shutdown callback for geni i2c driver.

Roja Rani Yarubandi (2):
  i2c: i2c-qcom-geni: Add tx_dma, rx_dma and xfer_len to geni_i2c_dev
    struct
  i2c: i2c-qcom-geni: Add shutdown callback for i2c

 drivers/i2c/busses/i2c-qcom-geni.c | 59 +++++++++++++++++++++++++-----
 include/linux/qcom-geni-se.h       |  5 +++
 2 files changed, 54 insertions(+), 10 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
