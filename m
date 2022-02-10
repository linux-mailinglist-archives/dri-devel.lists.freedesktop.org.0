Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAB84B0CC0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164B610E81D;
	Thu, 10 Feb 2022 11:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 434 seconds by postgrey-1.36 at gabe;
 Thu, 10 Feb 2022 11:48:38 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9578110E81D;
 Thu, 10 Feb 2022 11:48:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 22C97CE2312;
 Thu, 10 Feb 2022 11:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21AB9C340ED;
 Thu, 10 Feb 2022 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644493280;
 bh=H2RdFMbRP7RJJRAbgsf+fGP8lEtZwF/hA1bM/itUqRE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sPMMjUOrJ36Af0bXmXEh9TZNqVWM8Z2gvyQc9iwH6TuLRaleJsmfGneK6uljoO0C4
 DHYvQxvj5PdVH+eKT0jFZNEEz9ej9L5/w9q3KG0CwXSZwQ0gINtaNShvCT3oLdT4zO
 u+xSeaOICJ8Z3M/kciEvTOla5F+pNkNAm8xaZcpEsDxxAPNyR2QQ31uTYtgB4Ijyui
 9NWpXsR4E2a+c/hZO6/o8k+OmNgIvt0LVmvVIqnANsDCnBkYFKLr5HmBBXqrG/Yy/4
 tMu+X+rvOcE2CunOqHc6PGNoREf9FxL+1CXnf1GZbAy4Lp6gGvs48liOgtZ3yK13Ef
 nr4dM/DxdapjQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/3] drm/msm/dpu: Update the comment style
Date: Thu, 10 Feb 2022 17:11:05 +0530
Message-Id: <20220210114106.290669-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210114106.290669-1-vkoul@kernel.org>
References: <20220210114106.290669-1-vkoul@kernel.org>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The multi line comment style is wrongly used as kernel-doc comment. This
gives a warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:17:
warning: This comment starts with '/**', but isn't a kernel-doc comment.
Refer Documentation/doc-guide/kernel-doc.rst

Update the style to fix this.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a77a5eaa78ad..9341c88a336f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -13,7 +13,7 @@
 #include "dpu_hw_mdss.h"
 #include "dpu_trace.h"
 
-/**
+/*
  * Register offsets in MDSS register file for the interrupt registers
  * w.r.t. to the MDP base
  */
-- 
2.31.1

