Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F7262D9F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 13:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EE76EE31;
	Wed,  9 Sep 2020 11:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE736EE31
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 11:04:39 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id z19so1827605pfn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 04:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=f2Sbla12+5ce/P/uB+FjJ7Tw46ovGgVhGQnUxjR00hU=;
 b=ASC+RXZQP/VggFVNg20bD/H0zMhREL4yhMFCTYViXh/BFLVAV6VmKNxhCxo0ynTRnF
 IchsnLujzWP47chlgiOa1Pq41pAvLGU3w3x8DxpvlJ+KQnVCWDIjrNC4jNOC4FFbanAx
 bgPb1IPL5ZP5lM0UpPbVsT+YsJW8MId/JpLcXZPptn7JUygo9Md/tKuYBCYSQrg+iKzV
 y9QCQF4+VH5tMSszNQ6Q4ItPcfzcmjMx3/H661Q8aJyw+zNREf2rxniYLWIYuRrt+GJo
 Nj4Fg9Uo8zAoXB1TZ7/ah7gOcG4uhAcLv8ikbj9fHwhXmyjxeSkVnAJQVP3dugp6AW4E
 fB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=f2Sbla12+5ce/P/uB+FjJ7Tw46ovGgVhGQnUxjR00hU=;
 b=UEZAVqRT73HstE0rPZ0F32MBxveGXeOu83edVw0k7K8Ck43fuYu6Llop/iQLe9xupA
 ClPqH0iBDG/ZKly1fBbM6THQVVJWOTye0s+nKq4Sx7Pda98TlUDo7YX0OrsxpCVnOUVo
 9Mh1GYRFf6rfgQI9i/q8yR2Q2Z2zLlA1iCCNR0wmWhpxn5TE+KSPsg/JPias/H6CBfYE
 JAGdC/38cBvlfkE6Kl3mOOH61spbE+sPbk3pG9vnX4CMBAuxfMr92H/rN97tzbVz7UHU
 TqVsK4hokgJNiRUZUQMYdMAZbPkrkOH589JkhORTZUgbSN5hKuySA5LcpaJ3Zgsmy5t4
 kBZg==
X-Gm-Message-State: AOAM530uTzGZGfjKU2wZmSvCBHvFBj02kf/oNiNehEWhm9GWJefDKaFb
 lrGkIt9fbMHLRRbbc8fwuWE=
X-Google-Smtp-Source: ABdhPJwERHFEezQfdoqkLev5Z5w3iff5q3QH3ZVHFwGaa6EbthK1qM9mRBdgUaHqjPOOce9DtaCg3A==
X-Received: by 2002:a63:3d0e:: with SMTP id k14mr223103pga.219.1599649478689; 
 Wed, 09 Sep 2020 04:04:38 -0700 (PDT)
Received: from [192.168.86.30] ([49.206.127.148])
 by smtp.gmail.com with ESMTPSA id y23sm2339158pfp.65.2020.09.09.04.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 04:04:38 -0700 (PDT)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH v2 1/1] drm/radeon: Add sclk frequency as hwmon sensor
Message-ID: <88e558db-d6f4-01bb-205c-34e473e4f9c3@gmail.com>
Date: Wed, 9 Sep 2020 16:34:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for reporting sclk values for Radeon GPUs, where supported.

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_pm.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index 8c5d6fda0d75..05c4196a8212 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -712,6 +712,31 @@ static SENSOR_DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR, radeon_hwmon_get_pwm1_
 static SENSOR_DEVICE_ATTR(pwm1_min, S_IRUGO, radeon_hwmon_get_pwm1_min, NULL, 0);
 static SENSOR_DEVICE_ATTR(pwm1_max, S_IRUGO, radeon_hwmon_get_pwm1_max, NULL, 0);
 
+static ssize_t radeon_hwmon_show_sclk(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct radeon_device *rdev = dev_get_drvdata(dev);
+	struct drm_device *ddev = rdev->ddev;
+	u32 sclk = 0;
+
+	/* Can't get clock frequency when the card is off */
+	if ((rdev->flags & RADEON_IS_PX) &&
+	    (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
+		return -EINVAL;
+
+	if (rdev->asic->dpm.get_current_sclk)
+		sclk = radeon_dpm_get_current_sclk(rdev);
+
+	/* Value returned by dpm is in 10 KHz units, need to convert it into Hz 
+	   for hwmon */
+	sclk *= 10000;
+
+	return snprintf(buf, PAGE_SIZE, "%u\n", sclk);
+}
+
+static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, radeon_hwmon_show_sclk, NULL,
+			  0);
+
 
 static struct attribute *hwmon_attributes[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
@@ -721,6 +746,7 @@ static struct attribute *hwmon_attributes[] = {
 	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
 	&sensor_dev_attr_pwm1_min.dev_attr.attr,
 	&sensor_dev_attr_pwm1_max.dev_attr.attr,
+	&sensor_dev_attr_freq1_input.dev_attr.attr,
 	NULL
 };
 
@@ -738,7 +764,8 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
 	     attr == &sensor_dev_attr_pwm1.dev_attr.attr ||
 	     attr == &sensor_dev_attr_pwm1_enable.dev_attr.attr ||
 	     attr == &sensor_dev_attr_pwm1_max.dev_attr.attr ||
-	     attr == &sensor_dev_attr_pwm1_min.dev_attr.attr))
+	     attr == &sensor_dev_attr_pwm1_min.dev_attr.attr ||
+	     attr == &sensor_dev_attr_freq1_input.dev_attr.attr))
 		return 0;
 
 	/* Skip fan attributes if fan is not present */
--
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
