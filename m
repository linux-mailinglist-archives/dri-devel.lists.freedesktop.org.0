Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB01A544A3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 09:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6268410E156;
	Thu,  6 Mar 2025 08:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d2v2RJaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACA510E14B;
 Thu,  6 Mar 2025 08:22:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33E625C556C;
 Thu,  6 Mar 2025 08:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0245EC4CEE9;
 Thu,  6 Mar 2025 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741249358;
 bh=2os1exXRTLbwCbKF4tg9yibFt2d/rbUEgSdkENsF8oU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=d2v2RJaEzy/2r44Rgpy86PxHOm2b9SGl0u390HN+IdIgO6wNaZhKi2KffylWZ7mZ2
 dATJcqzgeg5U7sark2fK4p1nRMzwRrGiYCsX2r1Kk0xPsFekPeycceI3FIbZvT6rYW
 nakb0EazU0tKtb0Y5Ua2OGpJYmsJhmBbI2Dk1VbGG+TNz4cC0cejNud8XPvHSQwh2P
 ZeBepmVe40dn1wulYEmzZSPjCOTw9BsHooTHXq3EfoBwJ8+8b3GevY7c0unKhBDY+2
 0WxKA7SEbbO4qZvIZXowg/AfZ/vh3JdpL95l9V79AOK8lXtqK2YdrTanLDH9gwNxKY
 fAPQEWYJD8STg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Thu, 06 Mar 2025 10:22:29 +0200
Subject: [PATCH 1/2] drm/msm/dpu: correct dpu_crtc_check_mode_changed docs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-dpu-fix-docs-v1-1-e51b71e8ad84@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=lumag@kernel.org;
 h=from:subject:message-id; bh=2os1exXRTLbwCbKF4tg9yibFt2d/rbUEgSdkENsF8oU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyVtIF+/GZvDNDm7kkJRLaccnxr94zTGzRKQr4
 Pc9J1AEsqCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8lbSAAKCRCLPIo+Aiko
 1Y8mB/9ZXQrHQcKoZcVfndrjvDY6YzkNM4SJOYNBaBUyFHORDiw37QhmP8P6juXeE1omkOcsE/k
 QfAh5L5UUpNma2YbWobpuW06VavE1GPN07c3rP4YlkBXqT5AtMUXnsIeOu97NHpj+QH7AIt/LW3
 SNRVzgIsGBBARNEUgKucZBDYUsb121yUFwr7YYHlG1t/aehWuGfC4tnXvZi/Bi46dZCuvQfTAYR
 H7onUN+il2vUebmx9Pmgh2sQFSHGUhpOeav08kog572Dwm06zkdRcswodm2+6qOGLnumSeV2kgR
 fU8vsXnT/OfrsTORUnaRpIDdtnYu7G/NdUeERFVet+eienrG
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

Correct commit 20972609d12c ("drm/msm/dpu: Require modeset if clone mode
status changes") and describe old_crtc_state and new_crtc_state params
instead of the single previously used parameter crtc_state.

Fixes: 20972609d12c ("drm/msm/dpu: Require modeset if clone mode status changes")
Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b0a062d6fa3bf942ffd687a91bccac3aa4f06f02..536d15818ba24f8b11f24e3bd9726d31c57ef531 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1395,7 +1395,8 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 
 /**
  * dpu_crtc_check_mode_changed: check if full modeset is required
- * @crtc_state:	Corresponding CRTC state to be checked
+ * @old_crtc_state:	Previous CRTC state
+ * @new_crtc_state:	Corresponding CRTC state to be checked
  *
  * Check if the changes in the object properties demand full mode set.
  */

-- 
2.39.5

