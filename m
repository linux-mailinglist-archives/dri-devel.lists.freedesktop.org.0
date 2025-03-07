Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94793A560CA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E441010EAFB;
	Fri,  7 Mar 2025 06:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NVNWmUcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF33D10EAF8;
 Fri,  7 Mar 2025 06:25:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 60DF7A4544A;
 Fri,  7 Mar 2025 06:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A88C4CEEA;
 Fri,  7 Mar 2025 06:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741328718;
 bh=AF3zl1+3FmKibEn7/QOSbKUdjP/4OElMD03QmbV+0OA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NVNWmUcjMZmGp4yR1hKCdWcuzmbDRihO4EAht1fDtP9oknIizerW8vCOa2OyySi3r
 QKq1UyUIG2ujIkRo065FRVnRi7lIT/fc+SJDbxmHzVtJEClmsA0UnsUGygI5m05RKI
 HJ1M2xUgtP2TSZXse4PFiFfTbJVS//wuqd8vIizVhv7LnCzNs6nAkIGf7NEQOl69Al
 qKeuLOR4UZ5/iJfDmkg50X5lJ/0qBCQ7GIqKEeAaHtswQit3tqVxCkQIOkBx/XjVxh
 673YR0rAcF13t5QzFelv1UWVg6429xbZe8t0gaz6tv7HuaTalKbGYwhVQuhGxXq9nZ
 PqhsBrc1NnX0A==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:56 +0200
Subject: [PATCH v3 8/8] drm/msm/dpu: drop now-unused condition for
 has_legacy_ctls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-8-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZJQfVL2u4VLDEzUOjMo39hljcpjLahCFYCRsgXyDRmA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE1yrtWX3xCYRYx1ZvpKfNuxSjI3TqtdorJY
 Xwo5LuIbXaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNQAKCRCLPIo+Aiko
 1Y5oCACxrnDt4RHInE5qYZQOS7Yfg2KFXB99dPyXHoPvVCAeCuxMNrnXLdRIuMXk3V9ffq3qRQh
 9C2GhKbH6x6iUpA8CqKyOhGrgyK5pjiUAQB2lVQF85Y2Tf/XV1KsVceGZw3xqqP/6VMDXXs11R+
 q/zJ5WMdZvZIpdrvtbetOQITH1Z6I0IE00DgR6jyiCRqE7iBLENLsAHU0jfJeoK3caKmjK0LFZM
 PhXZCdHzLwZzvXOwURoOz4zIEu22NpKUCv3z7WQPrTg4QfLhq0cZ9dX4YroRR0XeMaFtVV27cCn
 EZ8iyNI2V8jzddau3hXEe+dgmeOhjbS2DNhmATa1bIZV70yq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Now as we have dropped the DPU_CTL_SPLIT_DISPLAY from DPU >= 5.0
configuration, drop the rm->has_legacy_ctl condition which short-cutted
the check for those platforms.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Note, it is imposible to reoder commits in any other sensible way. The
DPU_CTL_SPLIT_DISPLAY can not be dropped before the patch that enables
single-CTL support.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index c72b968d58a65960605456e752278def2a21df7b..2e296f79cba1437470eeb30900a650f6f4e334b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -466,8 +466,7 @@ static int _dpu_rm_reserve_ctls(
 
 		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
 
-		if (rm->has_legacy_ctls &&
-		    needs_split_display != has_split_display)
+		if (needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;

-- 
2.39.5

