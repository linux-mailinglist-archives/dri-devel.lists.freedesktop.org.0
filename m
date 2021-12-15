Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1E44754B7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 09:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B3C10EE81;
	Wed, 15 Dec 2021 08:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3C610EE7F;
 Wed, 15 Dec 2021 08:56:03 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id o17so21122376qtk.1;
 Wed, 15 Dec 2021 00:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dbfkGjADP1JP/ccn6Y79dw0BB+q77R8upChfhWhpbLY=;
 b=QXkOpqLoRDDSGEf+AKDxWv1QFdCmuMqUjVA8i/659rKFxt5MDdmYGq1Va3+xt4xFWn
 IbmRS6G79/ayBNeyvLsUXJa5B25V31ewyeG6mriDRl05OyLYuonJjzZkz5/gzgRBWwSY
 FujwC5lJEo49cYy1CCLMPqhWg1fIqquQ7F1PsTfqC4edm3O6I6OqqjsYmkCkDIDcqBBv
 3K+E9Jov4WP9Src1YIj53P5sSLYU2RgOjKiQd6tqUUrMgPwb85qooPV4q/htvnGcJiOz
 04fzUV19TQL/zQhrxkcxDCBiCQrFo0YchSj5plkEyKKSN4KMhRsV/KI0kBjbP2e75lo7
 ovsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dbfkGjADP1JP/ccn6Y79dw0BB+q77R8upChfhWhpbLY=;
 b=MZLa/q4VCmeuyDg6jRKxrRf+Ijd7P7y8DRHMWaULKU4djO+8fkCw1gTZPLGSCQBeIb
 yHjPMNJjvHrPoET6HsbdMgTxkSHAGatXUFbgQvaQJCT3qrA4qaVs009cjdRs/hKuLvfL
 EhIpkkyp5Thdc/9B+/7geKmCV/FewgecL2o5+EzmmfglZY5JN7f8NFx0vpFdPv4Q8BJF
 SgoYeS0RAHL3JxiK6gAmI6aYvLoC2tAWqavGpr84tTspp1RuuAlsYxs8FzS9P+oMRFQd
 Y0PMwH1w3e27kf+tBx0E5Iwf/L9evaCcf02LK0vVRhGfrDyrZIa3jIKPyamdBv4rVJ+s
 uKOQ==
X-Gm-Message-State: AOAM533JkN8UmBKyIQs2vXMlEj/bHFpZsjE623h3CJeYXzEcFLd9jcUP
 jJ4tmstR8DWn6Jw3yoWvJJE=
X-Google-Smtp-Source: ABdhPJzLfQfHP7IxlGx7vxk8z92ch8kS1M5ARNToa0yOaFgzRN1nbpR8d1Z4m+rwQRnrr/BsDfzCQw==
X-Received: by 2002:ac8:5949:: with SMTP id 9mr10885179qtz.522.1639558562394; 
 Wed, 15 Dec 2021 00:56:02 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id q185sm696876qke.64.2021.12.15.00.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 00:56:01 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: robdclark@gmail.com
Subject: [PATCH] drm/msm/dp: remove unneeded variable
Date: Wed, 15 Dec 2021 08:55:54 +0000
Message-Id: <20211215085554.444351-1-deng.changcheng@zte.com.cn>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, swboyd@chromium.org,
 sean@poorly.run, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Remove unneeded variable used to store return value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8d9c19dbf33e..7cc4d21f2091 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -416,12 +416,11 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 
 static int dp_display_usbpd_disconnect_cb(struct device *dev)
 {
-	int rc = 0;
 	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
-	return rc;
+	return 0;
 }
 
 static void dp_display_handle_video_request(struct dp_display_private *dp)
-- 
2.25.1

