Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503CB2AADFE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649998979F;
	Sun,  8 Nov 2020 22:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36E36E1D6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:23:35 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g11so1021909pll.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MKkOBZCmnnkkfq2sk1W6OI+c0KeKPWrWrNvTYxozK1s=;
 b=CUtPNhiUbyf4LAxR3iB7+8f0eR01VjThFFHigtTXQDEpl1W4/mzT+Y6H7YAxNxeebG
 bisDa+MxdvPHuBkhNRk7GmV5nKOoW3Ek70KEvgUKT0WSt3MVkHiLKTlTGXg/Q5jDADhD
 /GKCJoyUk46p5u79M4NGVTmhUPMgx9W8vK6F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MKkOBZCmnnkkfq2sk1W6OI+c0KeKPWrWrNvTYxozK1s=;
 b=pEFdLXa//g/KWMmwWB3wQanZ3FNk1fpSMCUhSEJsxLLAwuPfaH4MxzJLKGyZ+iAwRS
 /9IMzKm3l2b0pYcdkNXQoe1IJop8DGbyruQWTMA4odIFwk+8G6N4aPYFpB/CTj+WEtSG
 a2pbqqwJiREjfuXm2rwW2cct04dwK8m1iLZS/9YaVN2RquorJQhCG33O/GrbHO9vlORi
 Ev2IuKo68PEPOMrudpbS/jsaPiWKkpGizWMYe30K57ZXC0QM/TWJ/8rQRZrbVezh9Tmq
 GU3ZDgW/VEyqwKKT/UyVOCZSl7KfXc/ijP4zQE5tAC7t5rhkCTmkeKCaYzsNfIfdlOMI
 If/Q==
X-Gm-Message-State: AOAM530iXi3+ueGlQOsQL1JaA3uqGaPXxXcf5Us7V39tMz+TTIZjcfoG
 Gz9jV7RNNk0PDfhvmWgeDmOYNw==
X-Google-Smtp-Source: ABdhPJx8SHmXEBAV4mYFoSkHkoNGFAU9lOKSyzausqixRvZOoByFEpE5ebvABCnULHLDEAx1cBAepg==
X-Received: by 2002:a17:902:708a:b029:d6:c412:db4f with SMTP id
 z10-20020a170902708ab02900d6c412db4fmr2646285plk.69.1604687015297; 
 Fri, 06 Nov 2020 10:23:35 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id k8sm2979131pfh.6.2020.11.06.10.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:23:34 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/panel: simple: Add flags to boe_nv133fhm_n61
Date: Fri,  6 Nov 2020 10:23:33 -0800
Message-Id: <20201106182333.3080124-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reading the EDID of this panel shows that these flags should be set. Set
them so that we match what is in the EDID.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Fixes: b0c664cc80e8 ("panel: simple: Add BOE NV133FHM-N61")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2be358fb46f7..204674fccd64 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1327,6 +1327,7 @@ static const struct drm_display_mode boe_nv133fhm_n61_modes = {
 	.vsync_start = 1080 + 3,
 	.vsync_end = 1080 + 3 + 6,
 	.vtotal = 1080 + 3 + 6 + 31,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 
 /* Also used for boe_nv133fhm_n62 */

base-commit: 3650b228f83adda7e5ee532e2b90429c03f7b9ec
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
