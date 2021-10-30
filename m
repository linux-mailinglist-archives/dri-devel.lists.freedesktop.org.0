Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0754440A5E
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 19:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B365A6E038;
	Sat, 30 Oct 2021 17:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B733B6E038
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Oct 2021 17:08:55 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id m26so12304529pff.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Oct 2021 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+W1GMLw6C5reaVE/Y3pI1gn/PZ+dci603n52uqzIAc=;
 b=K6IFILSEntzkjF4zAJE53lfbxpsnnRNjTX18tiLglLxJt0GORz7bgiSEoN5mAxVgsh
 mGFKli7c6RMXqSX9ifPiVEt2g7fVDBii20SQgVDzVo4LR3co8CO0nNOsWbIk2ue/DqJO
 qUXF3lMtss5oMddUcgBFo0PkgV8queNnOxfeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+W1GMLw6C5reaVE/Y3pI1gn/PZ+dci603n52uqzIAc=;
 b=K7bX6fx5tmyLgw3RxcYmQHDZTCfRp/vjonyleEJvYMsAc9wiZ1n56k9efKAced+PhP
 GdhiuAJ9duUKra5CX7JyZ44Am3iOJWnLljDLq8+MaGDHfUnbw3sHIPQrjgruZky3EwCW
 mnWk2wn6PjQ7pkcWKkiCW5LE5h3IKWXBrkKZt2SV5yAJuKL98NcjNASI0OVSRRcarq4z
 w6b5nHMku/RXDTjhaE8vXj3rBJE1NECOyzC8QpuYpxhMXY/V2gHHjXHB7iXoMPquhJS3
 fzjnkcV4C7f27hqInueuzLBFJ9CME/wEZHyEKq2DGresjU2JTUekn0I1SIcZpuTtwmap
 SrqQ==
X-Gm-Message-State: AOAM530UO/iD4NYZcaKt5xU8WLkzDhQOnAba5hFogBh6kzl5BpCFwmhc
 IGI9J3E50n9tg3+LHyOvL1FjWQ==
X-Google-Smtp-Source: ABdhPJwSmUoGp7LXb7jUr28+7PBB+QkgoTQGz8UyV8ymunRt9JTMHBCp+cX19W4PjQ1KMU+pSedPog==
X-Received: by 2002:a63:ce0a:: with SMTP id y10mr13812030pgf.133.1635613735258; 
 Sat, 30 Oct 2021 10:08:55 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:f63c:4559:725c:b6da])
 by smtp.gmail.com with ESMTPSA id i7sm8565390pgk.85.2021.10.30.10.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:54 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: dianders@chromium.org, swboyd@chromium.org, robdclark@chromium.org,
 Philip Chen <philipchen@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Bernard Zhao <bernard@vivo.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Viresh Kumar <viresh.kumar@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: set default num_data_lanes
Date: Sat, 30 Oct 2021 10:08:50 -0700
Message-Id: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If "data_lanes" property of the dsi output endpoint is missing in
the DT, num_data_lanes would be 0 by default, which could cause
dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
by the bridge driver.

According to the binding document of msm dsi controller, the
input/output endpoint of the controller is expected to have 4 lanes.
So let's set num_data_lanes to 4 by default.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c86b5090fae6..a32eb33dfc14 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1696,6 +1696,8 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	if (!prop) {
 		DRM_DEV_DEBUG(dev,
 			"failed to find data lane mapping, using default\n");
+		/* Set the number of date lanes to 4 by default. */
+		msm_host->num_data_lanes = 4;
 		return 0;
 	}
 
-- 
2.33.1.1089.g2158813163f-goog

