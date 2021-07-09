Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421D3C1D9F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 04:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D526E950;
	Fri,  9 Jul 2021 02:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305966E950;
 Fri,  9 Jul 2021 02:48:54 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id f11so4277871plg.0;
 Thu, 08 Jul 2021 19:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FJGeec/dd9lZetObCCGFRZpLuvUGuLNWG/KPXHyD92w=;
 b=vInsEHdyDhDpupYzggzG618GasGXW1IymHK8a7YzD2/3K/iLzU+Ug0HiqzQUicH+e5
 WDpixPGBU1ZRi8VEkGg0zUaUoXrxkUuJX/pUaEsdMDTUOmtWPtJAnQ53l1suTqBFOGQE
 uNOhj1OjjNXecrW9dxXCXqLQItT6QovIiYLqHkZNAOwz37RsBrMRulgfrPsIw0Amx4y/
 Cr1uqYs0RbauPj6rvPEDkKjn9sr86KN4IzZ5cFeoh7VQkx109CdPS+Uwk31715t7VA9p
 2bjQLu5jzkh3ts8FCuaoTCyt+N0mE3m4r1+fGkErMkBcLcwn1N7VO2HX3auqul58VFmp
 1pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FJGeec/dd9lZetObCCGFRZpLuvUGuLNWG/KPXHyD92w=;
 b=WoC8l7bY1Uaq3zjYmTVBzs5J1JMHYOSxQBS5ulTD4v8JhCe8J21afzCiUPuGiOXDJ0
 9o5+tOaAjfno9rdGZetlBEFri1m5JxwvK3l0r3hV3n9s0lpyBmu5D1QgpLJjkNx0N+pF
 voOEgeTdHPmqwauMPn0bc0nDCokneYJp06uY55fbVBmSfjswqdyA3A48B33+/6JZ5kBp
 RO0wCYs5uuW1LTY1VaFSYJmLMCKyZMYUqPymxZobpeLZLAROdMhAjNc8jQYPJS4tNvSL
 +EtMF6HJSwvsdBXaV5Xknw/16BnDt/pdeePyrnOGtrNjcZQFXiYmyxIDJ5XuuABWBXnr
 1dzw==
X-Gm-Message-State: AOAM530iMgkzMntBsvkPqmVLkie04naRseOWH4WLJ2Nq5cU9lDTpJpwZ
 idSJammQi6OqlMZ3u34g/0I=
X-Google-Smtp-Source: ABdhPJzppWn6OlM8ElvBqTOykcXyFL2SXYr+Y2O2KzabgIBpCXqWZ1tSI81I3VIk10TQtPA2h78kxw==
X-Received: by 2002:a17:90a:ee94:: with SMTP id
 i20mr8237957pjz.231.1625798933829; 
 Thu, 08 Jul 2021 19:48:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9005:8001:f83b:3fe0:973b:4044])
 by smtp.gmail.com with ESMTPSA id 10sm4353844pfh.174.2021.07.08.19.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 19:48:48 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 khsieh@codeaurora.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 dmitry.baryshkov@linaro.org, chandanu@codeaurora.org, tanmay@codeaurora.org
Subject: [PATCH] drm/msm/dp: Remove unused variable
Date: Fri,  9 Jul 2021 08:18:34 +0530
Message-Id: <20210709024834.29680-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Souptick Joarder <jrdr.linux@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel test roobot throws below warning ->

drivers/gpu/drm/msm/dp/dp_display.c:1017:21:
warning: variable 'drm' set but not used [-Wunused-but-set-variable]

Removed unused variable drm.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 051c1be1de7e..d42635a86d20 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1014,10 +1014,8 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 {
 	struct dp_display_private *dp_display;
-	struct drm_device *drm;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
-	drm = dp->drm_dev;
 
 	/*
 	 * if we are reading registers we need the link clocks to be on
-- 
2.25.1

