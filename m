Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9319A544A5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 09:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A752810E918;
	Thu,  6 Mar 2025 08:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mAa4vXbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF9D10E918;
 Thu,  6 Mar 2025 08:22:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 84FCEA43B26;
 Thu,  6 Mar 2025 08:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C6EC4CEE0;
 Thu,  6 Mar 2025 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741249361;
 bh=fT03+6G5rTucsQWnUyxVVl43dK+hKfqe4LZr7gl7Kb4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mAa4vXbj0l7wHS1jpYZEoZxVCa/1hhXmPkSBeCVNdJgaOH2H/0cvEtH2vfaymKScb
 rE/cUkwiweXf9FCrq2/1r6q60Jy/fMDOc4L89wsSXsmcDxYi2QwwSMjFT3jYW9H12F
 PlxbMd8F01b6SbzQfyVuksz0yK+AiJvz3sSIMu+Vi7Ygi5EO/evF8zoHlglal7UWCO
 hU57TWeNdKszmSDipZ95PbZY9qGi0u5MtIffekfHxUxzcKd8Swy+2MMyVGUsTuvfxM
 hh+gvw6bmmEUE2voZkKOv9wdbNoUhies4wV7nDDxD0yduUX6DS0x4OBlvcE4CLjGDG
 kbMY12KDv8+ZQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Thu, 06 Mar 2025 10:22:30 +0200
Subject: [PATCH 2/2] drm/msm/dpu: correct struct dpu_encoder_virt docs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-dpu-fix-docs-v1-2-e51b71e8ad84@kernel.org>
References: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
In-Reply-To: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=lumag@kernel.org;
 h=from:subject:message-id; bh=fT03+6G5rTucsQWnUyxVVl43dK+hKfqe4LZr7gl7Kb4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyVtI7mRqwuVVjTWP/aMe3udqwy8sYNoLG1duY
 pSclayXg/eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8lbSAAKCRCLPIo+Aiko
 1UZQCACIB6mll0aSulvMTwV9aVTAG6d8mbAAMUuuaxASi9Po0bRXGeRh5TaZPo3zQj5EKbmONBz
 ENodmFfUO2nU3lfJfdropq64aR4apsJLbf3XwM0emXy8jZmrTWEpJx5R8lKeABz+9OHfTh41py+
 slx2MBJdah2BEzh9SokdpBqY3mQKun1eewIifUcHYx8Lifa8Fdrha3ZIGIREy/G2DHt8jlVQRWm
 F+yTpM9bTmTGxxeKE3bTr9yWYQZXNCDHyFojqouK8VF9gIuVdJgWIcq0gPl3D3nDDPIkuQ/BUlI
 xzoVD4KVs5wyhhsTgHibX/M3Kb4lrnSEx9GmsRO3nw+prRPZ
X-Developer-Key: i=lumag@kernel.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a typo in struct dpu_encoder_virt kerneldoc, which made it ignore
description of the cwb_mask field.

Fixes: dd331404ac7c ("drm/msm/dpu: Configure CWB in writeback encoder")
Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056beda6b54c0d20f027a53c84f67db..0637be07eb293041a350161b39a6276eb44bfb42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -140,7 +140,7 @@ enum dpu_enc_rc_states {
  *			num_phys_encs.
  * @hw_dsc:		Handle to the DSC blocks used for the display.
  * @dsc_mask:		Bitmask of used DSC blocks.
- * @cwb_mask		Bitmask of used CWB muxes
+ * @cwb_mask:		Bitmask of used CWB muxes
  * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
  *			for partial update right-only cases, such as pingpong
  *			split where virtual pingpong does not generate IRQs

-- 
2.39.5

