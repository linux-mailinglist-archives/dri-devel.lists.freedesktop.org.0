Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC541398CEE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E335E6ECC2;
	Wed,  2 Jun 2021 14:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9095A6ECBE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z17so2537242wrq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T8jZ4n5cOgv/UmZYK2xnz10jZVZgWxDdZjKqpW0gHh0=;
 b=dNuB3B2ZN/IUe14URz5THaczrIvVApLvBf/j+zvvve6RZ/O6re2huGXtRCQgRWkAOP
 w5fzHvDWc4Rh/Ay7X/DPmNU3/6S+vJ352lVlWbPNaSLwY6fdTCX9WKJCOajDKCEf8DH9
 yryJjXIuK+qZBVE8xock7wffCr6aKu4DQhdQvxjmPpd2h0i2oiwESzoSLB7l6fDeMbkk
 7qRBB1szRgH6DLxRCs16BoFwOA11D0RrqT7AYIXIYpp8IeiIkafzrjtzXSRSfIHZooIb
 +4nApsAavQKOmycMgWzVK+2LiLpq17G7LHw7l+qYsoTUkmlygCqdeHaxWqVrCi3O26UQ
 ZzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T8jZ4n5cOgv/UmZYK2xnz10jZVZgWxDdZjKqpW0gHh0=;
 b=SF9j/erIL/mYR6oU2nvZ96kcOOBpVwFXfPvOe5ju2EAyiiMXr8HcXDWU8Q3xj6Tr/3
 /FjgLwHoUhB54zM/zT/lR+YUO59am3FN5qR7faB0s8vthpvUL08FMGhIzkaquOAoZl5w
 tMnh98zpXQCIV9MMDx6uoODHjv64U81e0Mdhq2yr1p+u9mCMDrjYQsoL4i0kR/6V5zLN
 ZRhM5qgdjK3BIS474HOrgv7ZNemgoMZ00KESfS5xNZP66nLSgCFS8RExVQKnnUuxHkhn
 eQHqZNWOwcO/CABM6bMTnwn9IkG4yJ00ep9WSCMYhWpAZ21F5a4s5nMH2FwKYVyN60j6
 MKbQ==
X-Gm-Message-State: AOAM530KyMMD0QY3ErQCgyxm9czjOpnIP+6svwRUJVPEKZNXsN6vUt8M
 7WBUZMciHaQabrwWPDPoKhVHRw==
X-Google-Smtp-Source: ABdhPJy4eaAZDDLpuejgdBoZ7/qW/U1oHdCxFoj2xXoCYyRG4oT5MTbvOgxHnOicDCh32UW/JzeOtA==
X-Received: by 2002:adf:8b9a:: with SMTP id o26mr23354563wra.96.1622644405303; 
 Wed, 02 Jun 2021 07:33:25 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:24 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 14/26] drm/msm/dp/dp_link: Fix some potential doc-rot
Date: Wed,  2 Jun 2021 15:32:48 +0100
Message-Id: <20210602143300.2330146-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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

