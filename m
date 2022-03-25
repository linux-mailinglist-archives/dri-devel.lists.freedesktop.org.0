Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D084E71F7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 12:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A7F10EB73;
	Fri, 25 Mar 2022 11:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88AD10E9E2;
 Fri, 25 Mar 2022 11:06:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44C8C6177C;
 Fri, 25 Mar 2022 11:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0C7C340F3;
 Fri, 25 Mar 2022 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648206408;
 bh=t/O8cKjwHQh1uBjrQkcfkl1HO3IEV+qbNVuAxz7p+6g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pxDDuM2kxpV4QoEe6zBRzfmB209N6E8xq9wQsQuQiabxNQdrUJUNtGLj0knVpM69d
 c30YS8iJML0Mw3CHRHSbPhzF+xAcrama8C1X4tu7UBVojfYWCo5wb4iMQk/lX8O0s1
 6yNNw4Kjcjuxe78sxnFO9S6Nj+8Chw+3xlo8+jt0LSl3kgLcX3NB1f2wGxObsoKpld
 ehwbW80uldzNl0T8hwRBE/jhzpG9bW+oUEXgJVGUuGNfCeqOtFQ2q37xXO26+d8qo4
 rfdLwbvSq+eunuILTDuUtJqIlHJWBBxCt+tY6SdJVkw42+EqRupFpXhQlids3DOaux
 psAod9yTPOiUg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v5 09/13] drm/msm: Add missing num_dspp field documentation
Date: Fri, 25 Mar 2022 16:35:52 +0530
Message-Id: <20220325110556.275490-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325110556.275490-1-vkoul@kernel.org>
References: <20220325110556.275490-1-vkoul@kernel.org>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Somehow documentation for num_dspp was missed, so add that

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
2.34.1

