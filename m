Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8DE452A8C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 07:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43866EA32;
	Tue, 16 Nov 2021 06:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36CA6EA34;
 Tue, 16 Nov 2021 06:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57E3461251;
 Tue, 16 Nov 2021 06:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637043833;
 bh=q2O1rifNDJeVJrPjt5gSWkeOt1x5Bq2Ty8Q5ZVN/76s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UbBcr9RmKDtULhlQy9i+ibCOP65PstvCzbPlwaOJnqfwWs+ksNQCqyHXucTCauni/
 kt2H1xYtLUNEEwDBeXWznQj6eF6ubm+YXQXQpuAhl0BogSSjOKYncnAIeax7ky8Npl
 BwPmE5bp+4ZY2VBQfY4/ZGQ2Ezz9Vtk8Goq8crmh0LCsQTtTkC6SNLWe0K88MroMnY
 OJKa29voKkqebSWtjOdLasmRbzeLjk4F3op/HTN47lODzXxYS6ThstMfNxiU34RK8J
 rGLAl/+ldQ9w0qixO1glNOxNtZVkeCptjUaacfsk5Oj71CNbYdY6PRzSybfMe6Ua2G
 URtFZCYkUKQdA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 08/13] drm/msm: Add missing structure documentation
Date: Tue, 16 Nov 2021 11:52:51 +0530
Message-Id: <20211116062256.2417186-9-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116062256.2417186-1-vkoul@kernel.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
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
index de7cb65bfc52..c4a588ad226e 100644
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

