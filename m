Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1503A4B0AC5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBCD10E7E2;
	Thu, 10 Feb 2022 10:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFEB10E7D0;
 Thu, 10 Feb 2022 10:35:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D73461B95;
 Thu, 10 Feb 2022 10:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50923C36AE2;
 Thu, 10 Feb 2022 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644489310;
 bh=3UAY9lqkQR8YyUxNwNgQ/uSCRirIpixHQJe3MseOGWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=odv1Wg1dbLt2NFqVzex4rqgPb9lqVE1IEfcP7m2NXH4O1WbF41JfCsup0BiVJVrzW
 lIo8GTFnL3Wi+RTxcMs3cdi/kvV6lGoP9/zylFKoptF8aYwTI8XF0wfc984f5CvY2t
 udq8jvYkNaCNAEES3bCElHByA51Ztcq+fCkdkqedl8WotH0R5s5cXyPZDPxgeoq1fW
 Gqzl+IbHQlrySNOn+g8pD8pU4+01TA+VtGYc6KhWfzolDd9i4dB741Vmdsp7awKI2w
 pMJ2cRNjNEIaKS8jCPdBr8NzBg0SM7eQMOIdibFPCcOlzQDw7r3nmEwQHL5TsxohcZ
 UTKRLS+Cpu4dA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [REPOST PATCH v4 09/13] drm/msm: Add missing structure documentation
Date: Thu, 10 Feb 2022 16:04:19 +0530
Message-Id: <20220210103423.271016-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210103423.271016-1-vkoul@kernel.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Somehow documentation for dspp was missed, so add that

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e7a312edfe67..6425a42e997c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -102,6 +102,7 @@ enum msm_event_wait {
  * @num_lm:       number of layer mixers used
  * @num_enc:      number of compression encoder blocks used
  * @num_intf:     number of interfaces the panel is mounted on
+ * @num_dspp:     number of dspp blocks used
  */
 struct msm_display_topology {
 	u32 num_lm;
-- 
2.31.1

