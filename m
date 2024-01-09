Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF47828E95
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 21:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E6A10E4E8;
	Tue,  9 Jan 2024 20:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5137D10E4D2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 20:41:11 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50ea98440a7so3353032e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 12:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704832869; x=1705437669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1IMTrLGXL3DoYuQMmQ7qjtoDUmoVxjKFdnyiQCYD2qI=;
 b=jSFfyisAjq3NWmqSLrML4WSrDlbQp2kmqMbXKRLJ6gh/eis86znbzPPb063yfE8f/Z
 RnT3iRTF3ePrOZEA6MPIWbFiVz6vJG6EtHNVw8eCt+ny6cgDOozcY6w2PLAj9+CkF4l0
 z7NGqYh4FTgsHAPen7+aq/9UTExsbAk2WSmPPkSy9SExxJ6e1uRxZIlQPfn+04v+F7Si
 uYw3hWvcYgxfXbUqdcH214PusE2bd9eukaq7n8wca+CQTpFSEy0sV0FgzIvvNKhBFjbe
 apQB9toNlpY/yRI7mmI1ygklW9Hga91xutomYSNCDIrimCk0GCivcD0mQHLFVJl+ggks
 eQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704832869; x=1705437669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1IMTrLGXL3DoYuQMmQ7qjtoDUmoVxjKFdnyiQCYD2qI=;
 b=CA/W0ruvAB1PHqdVlvyE0kV9L8KeWIgG3cJBzaTHhiqC+IPUOxSTaTZQV0UdXtHR0b
 8d5Mw7r84F40AxKBIuXJsicorPZgeFwyHYxFmeXvBBcjMjAkJf9DKxcgSJoswN7L3TIu
 vumKVqPLetEiNm2FtNUjrRgS0eorAJjmkuNmO4U+r8wSnLe/J/eaVkpRftn3GvL5AXgX
 eTgmrAFj8eF8EPrgguuyH8aoD7dmOI+3183KL9DaNgU9pr+O8ewUNM3BIrj8G3Ngx+Nr
 RdSB33oEoUe2KqmsWuSY7EWoY1x6AdaM02jckvObzQ+wR5yS31RwWdbPI+183ezfvkoF
 Quqw==
X-Gm-Message-State: AOJu0YzWpH+712nycuH68bUGJztEc96v7e2PX0i5STQD9e/PItzwGVlU
 tELVHGB8rp+7eLy/EWp2TtUcHQfTkUhDsA==
X-Google-Smtp-Source: AGHT+IGq5218wvaogJueOD/DpYuKLoXmu4W+n/+HB2kF4j3PUDGcL22+DHFIx6i8j3H6hWkaN3FnnA==
X-Received: by 2002:a05:6512:2023:b0:50e:64f5:ad71 with SMTP id
 s3-20020a056512202300b0050e64f5ad71mr1476328lfs.146.1704832869503; 
 Tue, 09 Jan 2024 12:41:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a197503000000b0050e7e19b692sm448489lfe.154.2024.01.09.12.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 12:41:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/a6xx: set highest_bank_bit to 13 for a610
Date: Tue,  9 Jan 2024 22:41:08 +0200
Message-Id: <20240109204108.3385496-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During the testing of Gnome on Qualcomm Robotics platform screen
corruption has been observed. Lowering GPU's highest_bank_bit from 14 to
13 seems to fix the screen corruption.

Note, the MDSS and DPU drivers use HBB=1 (which maps to the
highest_bank_bit = 14). So this change merely works around the UBWC
swizzling issue on this platform until the real cause is found.

Fixes: e7fc9398e608 ("drm/msm/a6xx: Add A610 support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

The photo of screen corruption:
https://photos.app.goo.gl/k4MPzpBKPUD3AKR37

---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c0bc924cd302..c9c55e2ea584 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1287,7 +1287,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	gpu->ubwc_config.highest_bank_bit = 15;
 
 	if (adreno_is_a610(gpu)) {
-		gpu->ubwc_config.highest_bank_bit = 14;
+		gpu->ubwc_config.highest_bank_bit = 13;
 		gpu->ubwc_config.min_acc_len = 1;
 		gpu->ubwc_config.ubwc_mode = 1;
 	}
-- 
2.39.2

