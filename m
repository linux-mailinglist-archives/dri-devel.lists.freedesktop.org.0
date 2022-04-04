Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED24F1955
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B18610E82F;
	Mon,  4 Apr 2022 16:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03BF10E5F3;
 Mon,  4 Apr 2022 16:35:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50B8BB81837;
 Mon,  4 Apr 2022 16:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E25DC34110;
 Mon,  4 Apr 2022 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649090131;
 bh=jY1ehkq5K86uPGP2fbD9b7UNiEgcBssb2Z6xVzhvgOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c1KYp8ZqC9rHDWhrCuqapYynxk3RnSSvlNdipQ6aXQD08ljSkDKG0/7vibzlWpvxe
 I7AIeVNbErEvAp+HuVpENr8HAoyrv+dTTkexR9ekCmuaJS9A/jwSBTKISJq+SzSqYD
 yKpfpNOQCzqzkBX44ihK8QoazHscsXc5Wug0aaPOi35bo76Voqqks4XduPvsw+GFkX
 xP14agr0oyI7F0KxuwFiUWaitg1xpLaTjtmOBWMhdVV/P6hIz89k3Ju+gyyi26CT1M
 AC9bbm+Yg+sZFpUSzSdHFYhBOJL6nDdLcBBS2UTnS4lN6T56750t4RJ5uhjDKUWYKy
 MlfV1AsCRKcAw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v6 09/14] drm/msm: Add missing num_dspp field documentation
Date: Mon,  4 Apr 2022 22:04:31 +0530
Message-Id: <20220404163436.956875-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220404163436.956875-1-vkoul@kernel.org>
References: <20220404163436.956875-1-vkoul@kernel.org>
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
index 2a3280df7b12..bf2ccff97562 100644
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

