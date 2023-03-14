Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A14E6B8D09
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 09:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A517710E730;
	Tue, 14 Mar 2023 08:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5C010E730;
 Tue, 14 Mar 2023 08:20:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t15so13460439wrz.7;
 Tue, 14 Mar 2023 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678782052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1NYMBiRuz7vfmt2Wpyeig2UyQ+79mH3kKnB3rm+kmQY=;
 b=n0GhsvE/3f+lSCHHtQcsmKLzTCo8UCOPV8n4FQL86IpRQzqFX9+9853Jg4KV6qlztJ
 OginLJoBPA0BpKvlFk+CIpJ/pAGmMMcBizLl+eKSjGrTtPSZ1xm7oYYBZd7M6fRc4+De
 5+mE6V1nXwSFgagI6IAiY9pYzLWtixvRtqISh7ORqmL9Gjk/LVERrQ6RT8Dm2qjryEyq
 kCRON/bfHwCYzESFJ7fWgT5Tgjw29o+MD1pNu/OX4WwtLZp8M3y8HSqMfnNdHp9Qv+Os
 5SxRaHpi2oMMrHwgLEh9YCdEYaHFgarLakuigRqkaHBrvROFteSqgTVoQNSBDiosGtm1
 HDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678782052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1NYMBiRuz7vfmt2Wpyeig2UyQ+79mH3kKnB3rm+kmQY=;
 b=fTfOYQmqgNe+tn5dZQsMkZYdF2QitxfR4uPMZaxbGPAOAMg4o1MHsdv+OnWWXRDGtQ
 VXtsj/sNrj3/MmZgmT/67yznBj/gFVv0HGu2StVJk8OuW8aYbZY6NMkRF4GfoYPQR3W+
 JntKXaStYTNdrTxz1PtwMyFF/QSgfY4mwaOMVitU42vc/ojyxPev9dDRQTKNwN4+0cjR
 EztP5KEi8vPF5IxZK+f6IWyKR/twG3ct2fjPhvA4mU4GkOTxDVfNoPrLCDufxl0dZ/TO
 skQK5xdJ+V1vOumKGgaiMvV2ACZv17dhcsgfeNaLzeKuk65r8hyfnPxS12ZsJwlNNogm
 bl7Q==
X-Gm-Message-State: AO0yUKUe2XOx8bNHi85ebcb2/Cpq411a7Ak/GCoG2X3v0/Gp36WNxYaE
 SquBDTQQDCnbyy/wQtrbziheLFWfiMPkjg==
X-Google-Smtp-Source: AK7set9PVFdLcKIPrfyDAWsSHFrgTZUfxU2m79g3kogwCE0yFQts0BNhT2cvYR6MhXj0pQOEi14JvA==
X-Received: by 2002:a5d:4209:0:b0:2c5:519f:307a with SMTP id
 n9-20020a5d4209000000b002c5519f307amr10246437wrq.30.1678782052616; 
 Tue, 14 Mar 2023 01:20:52 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 e25-20020a5d5959000000b002c8ed82c56csm1366019wri.116.2023.03.14.01.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 01:20:52 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH][next] drm/msm/dp: Fix spelling mistake "Capabiity" ->
 "Capability"
Date: Tue, 14 Mar 2023 08:20:50 +0000
Message-Id: <20230314082050.26331-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a drm_dbg_dp message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 5a4817ac086f..42427129acea 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1090,7 +1090,7 @@ int dp_link_process_request(struct dp_link *dp_link)
 	} else if (dp_link_read_psr_error_status(link)) {
 		DRM_ERROR("PSR IRQ_HPD received\n");
 	} else if (dp_link_psr_capability_changed(link)) {
-		drm_dbg_dp(link->drm_dev, "PSR Capabiity changed");
+		drm_dbg_dp(link->drm_dev, "PSR Capability changed");
 	} else {
 		ret = dp_link_process_link_status_update(link);
 		if (!ret) {
-- 
2.30.2

