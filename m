Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2288051B5B5
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 04:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2DB10EC83;
	Thu,  5 May 2022 02:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D82F10EC83;
 Thu,  5 May 2022 02:16:33 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id k1so3115526pll.4;
 Wed, 04 May 2022 19:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMR76WMtkLn5xSTes1b8YF480Y1GgwkYWQvKagsQ23c=;
 b=lTqzT44oMY16d9Q4twuk0c0lXMC5F1xGFPRg3Jj6HEiH9TFF5H5koNJD4eQaKzttfT
 sgENSGElIa9Kc2LHBThuTXr1+dZu5MQ9GfCUZ+xUCz8q0oiodddN/HVWSo8jCQNUvMCd
 L/jCPyb4yi3eBul5ETs67tUyMVoT7bKKMqigyVENPd6F4kpeyLWQ9LID0FmwI0gdxlRR
 tlHHo5+pPO48zF2MEm2PBFZ+wPisDzIXv47T9XYbd6r80ZUyXA6RU1BgFyh7d1gNsOkJ
 A689XeiQsLctldVKncIBEWcO5uRx1CCqGym47SHYrwqQMZyesvIRBUsj3G8nqFAJDWM5
 mLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMR76WMtkLn5xSTes1b8YF480Y1GgwkYWQvKagsQ23c=;
 b=kKrBPvSpE7zCii/vbTFx8tBAErIK9UB90RfmwVog6ouD8pkhc4N8MEYQXAp830m9YU
 dvcm/yX5ExVEWMnrZyoqDHYnsW02wvXYWM5h6DyK4+7c7NCCHz0SW0myhJ7pc1Ak3oiY
 FxukTxNqYIYOs3IoUXY9jypK5Nm8ADly1isnUAdmRXZ8GIoqLGP2pj/pXTENAi7XLZqg
 CQGWBaN40lSTyVecslbfGpKk6W12ZYUMfVM+Xq7h7OBb46oKCeaXkxWQgb4bLu0pYiPv
 ogKphYsBlwsmfxLrza4gKwbaTJ/u6TQvVgL+PaRSfk9qOeJi7GMEFbwH1eJbGhmCDVPv
 ya4A==
X-Gm-Message-State: AOAM532qjOxKECKTkrXGv+k2XmLT7mgImYJ86JBZP0GBw0p9cw0DagzU
 i4iYysL2R05xNlOuni24zF0=
X-Google-Smtp-Source: ABdhPJxCSy4KhWQzFFnnhYGswJBl+qB4knx8GwmMjyTM7dpflZx+m1LM67r/kdwz69coX7XkvQl5/A==
X-Received: by 2002:a17:902:9a4c:b0:158:b6f0:4aa2 with SMTP id
 x12-20020a1709029a4c00b00158b6f04aa2mr24890390plv.163.1651716992863; 
 Wed, 04 May 2022 19:16:32 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a170902ca9100b0015e8d4eb265sm174733pld.175.2022.05.04.19.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 19:16:32 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: jani.nikula@linux.intel.com
Subject: [PATCH] drm/i915: simplify the return expression of i915_driver_open()
Date: Thu,  5 May 2022 02:16:25 +0000
Message-Id: <20220505021625.54146-1-chi.minghao@zte.com.cn>
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
Cc: tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Minghao Chi <chi.minghao@zte.com.cn>,
 rodrigo.vivi@intel.com, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/i915/i915_driver.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 09de45d3e274..d11a7445909a 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -977,13 +977,8 @@ static void i915_driver_release(struct drm_device *dev)
 static int i915_driver_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
-	int ret;
 
-	ret = i915_gem_open(i915, file);
-	if (ret)
-		return ret;
-
-	return 0;
+	return i915_gem_open(i915, file);
 }
 
 /**
-- 
2.25.1


