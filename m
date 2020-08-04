Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1B223B5AA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69116E436;
	Tue,  4 Aug 2020 07:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B986E42C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 06:45:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596523550; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9I+2fbpSXUFTiHD9lLljbO/ir26qO7xMDZYv1p85L6U=;
 b=Fruzch/HBvOCg4U+uAgH1884MwJRojbFD+qTXcz9AEt479t4KnTr9UaSWIfh3iuHYFhmpN93
 gWPS39DXLMrsTvE/gIMQYgOr8c+EJJRUELt8t/yxDyOkTPvEIOVqiahGFfYQlV/F4UNtHewo
 wgS2akKF7bQmK6RCiTYnar31mnk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f2903f18ecb2754f9a927c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 06:45:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EFF34C433B2; Tue,  4 Aug 2020 06:45:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 91954C4339C;
 Tue,  4 Aug 2020 06:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 91954C4339C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH 2/2] drm/msm/mdp5: Remove unused downstream bus scaling apis
Date: Tue,  4 Aug 2020 12:14:43 +0530
Message-Id: <5e836765699bfeb74495eaca37c1da26daab66dc.1596523010.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1596523009.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1596523009.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSM bus scaling has moved on to use interconnect framework
and downstream bus scaling apis are not present anymore.
Remove them as they are nop anyways in the current code,
no functional change.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 24 -------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 68 -------------------
 2 files changed, 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
index eeef41fcd4e1..ff2c1d583c79 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
@@ -14,27 +14,6 @@ static struct mdp5_kms *get_kms(struct drm_encoder *encoder)
 	return to_mdp5_kms(to_mdp_kms(priv->kms));
 }
 
-#ifdef DOWNSTREAM_CONFIG_MSM_BUS_SCALING
-#include <mach/board.h>
-#include <linux/msm-bus.h>
-#include <linux/msm-bus-board.h>
-
-static void bs_set(struct mdp5_encoder *mdp5_cmd_enc, int idx)
-{
-	if (mdp5_cmd_enc->bsc) {
-		DBG("set bus scaling: %d", idx);
-		/* HACK: scaling down, and then immediately back up
-		 * seems to leave things broken (underflow).. so
-		 * never disable:
-		 */
-		idx = 1;
-		msm_bus_scale_client_update_request(mdp5_cmd_enc->bsc, idx);
-	}
-}
-#else
-static void bs_set(struct mdp5_encoder *mdp5_cmd_enc, int idx) {}
-#endif
-
 #define VSYNC_CLK_RATE 19200000
 static int pingpong_tearcheck_setup(struct drm_encoder *encoder,
 				    struct drm_display_mode *mode)
@@ -146,8 +125,6 @@ void mdp5_cmd_encoder_disable(struct drm_encoder *encoder)
 	mdp5_ctl_set_encoder_state(ctl, pipeline, false);
 	mdp5_ctl_commit(ctl, pipeline, mdp_ctl_flush_mask_encoder(intf), true);
 
-	bs_set(mdp5_cmd_enc, 0);
-
 	mdp5_cmd_enc->enabled = false;
 }
 
@@ -161,7 +138,6 @@ void mdp5_cmd_encoder_enable(struct drm_encoder *encoder)
 	if (WARN_ON(mdp5_cmd_enc->enabled))
 		return;
 
-	bs_set(mdp5_cmd_enc, 1);
 	if (pingpong_tearcheck_enable(encoder))
 		return;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index f48827283c2b..79d67c495780 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -16,72 +16,9 @@ static struct mdp5_kms *get_kms(struct drm_encoder *encoder)
 	return to_mdp5_kms(to_mdp_kms(priv->kms));
 }
 
-#ifdef DOWNSTREAM_CONFIG_MSM_BUS_SCALING
-#include <mach/board.h>
-#include <mach/msm_bus.h>
-#include <mach/msm_bus_board.h>
-#define MDP_BUS_VECTOR_ENTRY(ab_val, ib_val)		\
-	{						\
-		.src = MSM_BUS_MASTER_MDP_PORT0,	\
-		.dst = MSM_BUS_SLAVE_EBI_CH0,		\
-		.ab = (ab_val),				\
-		.ib = (ib_val),				\
-	}
-
-static struct msm_bus_vectors mdp_bus_vectors[] = {
-	MDP_BUS_VECTOR_ENTRY(0, 0),
-	MDP_BUS_VECTOR_ENTRY(2000000000, 2000000000),
-};
-static struct msm_bus_paths mdp_bus_usecases[] = { {
-		.num_paths = 1,
-		.vectors = &mdp_bus_vectors[0],
-}, {
-		.num_paths = 1,
-		.vectors = &mdp_bus_vectors[1],
-} };
-static struct msm_bus_scale_pdata mdp_bus_scale_table = {
-	.usecase = mdp_bus_usecases,
-	.num_usecases = ARRAY_SIZE(mdp_bus_usecases),
-	.name = "mdss_mdp",
-};
-
-static void bs_init(struct mdp5_encoder *mdp5_encoder)
-{
-	mdp5_encoder->bsc = msm_bus_scale_register_client(
-			&mdp_bus_scale_table);
-	DBG("bus scale client: %08x", mdp5_encoder->bsc);
-}
-
-static void bs_fini(struct mdp5_encoder *mdp5_encoder)
-{
-	if (mdp5_encoder->bsc) {
-		msm_bus_scale_unregister_client(mdp5_encoder->bsc);
-		mdp5_encoder->bsc = 0;
-	}
-}
-
-static void bs_set(struct mdp5_encoder *mdp5_encoder, int idx)
-{
-	if (mdp5_encoder->bsc) {
-		DBG("set bus scaling: %d", idx);
-		/* HACK: scaling down, and then immediately back up
-		 * seems to leave things broken (underflow).. so
-		 * never disable:
-		 */
-		idx = 1;
-		msm_bus_scale_client_update_request(mdp5_encoder->bsc, idx);
-	}
-}
-#else
-static void bs_init(struct mdp5_encoder *mdp5_encoder) {}
-static void bs_fini(struct mdp5_encoder *mdp5_encoder) {}
-static void bs_set(struct mdp5_encoder *mdp5_encoder, int idx) {}
-#endif
-
 static void mdp5_encoder_destroy(struct drm_encoder *encoder)
 {
 	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
-	bs_fini(mdp5_encoder);
 	drm_encoder_cleanup(encoder);
 	kfree(mdp5_encoder);
 }
@@ -222,8 +159,6 @@ static void mdp5_vid_encoder_disable(struct drm_encoder *encoder)
 	 */
 	mdp_irq_wait(&mdp5_kms->base, intf2vblank(mixer, intf));
 
-	bs_set(mdp5_encoder, 0);
-
 	mdp5_encoder->enabled = false;
 }
 
@@ -240,7 +175,6 @@ static void mdp5_vid_encoder_enable(struct drm_encoder *encoder)
 	if (WARN_ON(mdp5_encoder->enabled))
 		return;
 
-	bs_set(mdp5_encoder, 1);
 	spin_lock_irqsave(&mdp5_encoder->intf_lock, flags);
 	mdp5_write(mdp5_kms, REG_MDP5_INTF_TIMING_ENGINE_EN(intfn), 1);
 	spin_unlock_irqrestore(&mdp5_encoder->intf_lock, flags);
@@ -426,8 +360,6 @@ struct drm_encoder *mdp5_encoder_init(struct drm_device *dev,
 
 	drm_encoder_helper_add(encoder, &mdp5_encoder_helper_funcs);
 
-	bs_init(mdp5_encoder);
-
 	return encoder;
 
 fail:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
