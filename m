Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F038AD75
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54FB6F432;
	Thu, 20 May 2021 12:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E456289C96
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:21 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o127so9019261wmo.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T8jZ4n5cOgv/UmZYK2xnz10jZVZgWxDdZjKqpW0gHh0=;
 b=aMQQ1xEnSvQD3ee9SKBfMAucjU1i0GuZYxyAm5Vr609ce3SciJolcr8Wax9ZulKXcv
 sD6nDCXLgKhHFZ3wGUAXLDEJiKCTAzW9c2uo6dYfwWtOXy1SElARM6AMnC1g8qnj0Kza
 2OYno/nCbkZcTT7bwnUWwKjRmnz8/lkO7uVOG7spMZDcB/uIjfsZ5lvMUPouUpWIkbwG
 Y3s9n+8FZMsy05uayaR3a2lTuhWknvSN1tarfhiYwfVnNLGjQqu8AIILv9wDj7HGZ9IR
 siuqyEEn6LuXh2udRCEITucyFfyhS4/070fI4zr86ciM5gokEaJC2UPZ+PnezrY2wqPW
 Mi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T8jZ4n5cOgv/UmZYK2xnz10jZVZgWxDdZjKqpW0gHh0=;
 b=m9wOEQZeRYMPCIz84z/ZFhalionBWY4ykep+BfGqxU9RT4nPD32fO48Xzt1EbnA65b
 AcZWtO0kpIZZBOcwu1i1yCZBfszULiS8dlWrcHHOA6o5waLuf0ZqExkQEch+d5u+V8EB
 ZtnhYQmR0bltRrfojR8YQU0VMWcrYoM1SZVEj8BAGcF/5rIiQ1p395lffDkfJf8Rt5bI
 ZU46DllDvZeB9F9p08aDZalZFpc9RDiv1jWn6Cdze1XKJihsEMQoyAfGx49/uXJAWzB8
 OAhrqobv85PN077wKDOjiP7l+Jjj4Typ95C5LXrbRBhVW0W29V00xRoDUTtWUQxHIOao
 aTAw==
X-Gm-Message-State: AOAM532W7M4Um6CiKXLg0JRkXnhi3dlYdmz9VW+xEwfmIpfex8HV6N2q
 fi4jatjOGwLdvHRfxM4aqdyMFw==
X-Google-Smtp-Source: ABdhPJwtd7ia5gEWJ4SgBvkOPQ07S3wwyvf3RqqiLAzZCZ9Xq+Y9fxcbvVZ2VmUqb5ZT5on4iZGK8g==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr3716125wmk.97.1621512200589; 
 Thu, 20 May 2021 05:03:20 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:20 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/38] drm/msm/dp/dp_link: Fix some potential doc-rot
Date: Thu, 20 May 2021 13:02:38 +0100
Message-Id: <20210520120248.3464013-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/dp/dp_link.c:374: warning: expecting prototype for dp_parse_video_pattern_params(). Prototype was for dp_link_parse_video_pattern_params() instead
 drivers/gpu/drm/msm/dp/dp_link.c:573: warning: expecting prototype for dp_parse_phy_test_params(). Prototype was for dp_link_parse_phy_test_params() instead
 drivers/gpu/drm/msm/dp/dp_link.c:975: warning: expecting prototype for dp_link_process_downstream_port_status_change(). Prototype was for dp_link_process_ds_port_status_change() instead

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index be986da78c4a5..1099604bd1c86 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -364,7 +364,7 @@ static int dp_link_parse_timing_params3(struct dp_link_private *link,
 }
 
 /**
- * dp_parse_video_pattern_params() - parses video pattern parameters from DPCD
+ * dp_link_parse_video_pattern_params() - parses video pattern parameters from DPCD
  * @link: Display Port Driver data
  *
  * Returns 0 if it successfully parses the video link pattern and the link
@@ -563,7 +563,7 @@ static int dp_link_parse_link_training_params(struct dp_link_private *link)
 }
 
 /**
- * dp_parse_phy_test_params() - parses the phy link parameters
+ * dp_link_parse_phy_test_params() - parses the phy link parameters
  * @link: Display Port Driver data
  *
  * Parses the DPCD (Byte 0x248) for the DP PHY link pattern that is being
@@ -961,7 +961,7 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
 }
 
 /**
- * dp_link_process_downstream_port_status_change() - process port status changes
+ * dp_link_process_ds_port_status_change() - process port status changes
  * @link: Display Port Driver data
  *
  * This function will handle downstream port updates that are initiated by
-- 
2.31.1

