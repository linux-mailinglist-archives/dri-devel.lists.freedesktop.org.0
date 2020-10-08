Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D5D287B7C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 20:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366BB6EABD;
	Thu,  8 Oct 2020 18:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BB06EABC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 18:16:24 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id l126so4657970pfd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e5s8LCVJjUuHDRPGSTz3yqeUAexd2U3fpVyGWJ34IVg=;
 b=XWAyaqGT343pkAVgue24VEDcIlhvLszmgsMHgxvMfHUR08zdBPqbJkAarrA/MnXnoW
 Ve7P2bS+f96w8zTeE+qTQqcupi/HNxQvLfnBe0pEAVwaBCABlDQ2tutqW0xT9RCCwSaN
 vJSGynqIm0lFYF3qnmV893/0577izedA3ASc83XyDHqd7grhDtSmokNoTUZBsKzhP54w
 rSo7B5LOt3fL3ckgsEfr3z2WYUUQuMo7YtohS9sEG6TF6vffvwTA2qnNznADVtVvlKMl
 SmMVx6KEnQBuiZw2GqqqyrsKtylboV7lj0sEE8fO0yBCHtqWcEHx5bjrgObQ3QC3tv21
 ZOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e5s8LCVJjUuHDRPGSTz3yqeUAexd2U3fpVyGWJ34IVg=;
 b=UkIzBW/KYTzExYyf8tpPnuUx0EO/HSijOfpxTI9EqnVkNfROO/53PLfZDOSEZdZx2v
 WX1xD0cIvjL+UxEGZGprv2n2OdtlFcbfjnfjegzRNDXv3Z2UA/6GnrZJbYb0D0+m8nn9
 B2o43OzqnyYnDvTGDXwd5zvG34m//+HU6jRR24gk6MrZBKZ0XVWFwBYEVtIF2D6BQclm
 ZtClIhxBJyXbeGjzBZ7EfANo4gpcL8pf8TLPtHacmEJWwKaVtk80gyQTUOz7Y6wfZWwe
 UDcyABbk8ZW6LtZoYUZOvYJQ6tgVNMskIRcuBADvvCTvb+TOdRINkgK0wNk/Fki2FkxT
 61ew==
X-Gm-Message-State: AOAM530uaQRQoQCxqleoMRZvhs97uIcB7q3/882EfBOxKOmeq7jN1k3S
 b0cghTQsrRDTkOf8Ts9AatA=
X-Google-Smtp-Source: ABdhPJwmME58yjJ7+TUuJAXm+F8YwdihiEx//hG8GzuLZH2YE56c0InZHFvTTSEHxOQBGA+TErKPyA==
X-Received: by 2002:a17:90a:dc0c:: with SMTP id
 i12mr95984pjv.191.1602180984025; 
 Thu, 08 Oct 2020 11:16:24 -0700 (PDT)
Received: from localhost.localdomain ([49.207.141.225])
 by smtp.gmail.com with ESMTPSA id u18sm8492491pgk.18.2020.10.08.11.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 11:16:23 -0700 (PDT)
From: sandy.8925@gmail.com
To: alexander.deucher@amd.com
Subject: [PATCH 3/3] drm/radeon: Expose vddc through hwmon
Date: Thu,  8 Oct 2020 23:46:06 +0530
Message-Id: <20201008181606.460499-4-sandy.8925@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201008181606.460499-1-sandy.8925@gmail.com>
References: <20201008181606.460499-1-sandy.8925@gmail.com>
MIME-Version: 1.0
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
Cc: Sandeep Raghuraman <sandy.8925@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandeep Raghuraman <sandy.8925@gmail.com>

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_pm.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index 05c4196a8212..65d172b13e06 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -737,6 +737,26 @@ static ssize_t radeon_hwmon_show_sclk(struct device *dev,
 static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, radeon_hwmon_show_sclk, NULL,
 			  0);
 
+static ssize_t radeon_hwmon_show_vddc(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct radeon_device *rdev = dev_get_drvdata(dev);
+	struct drm_device *ddev = rdev->ddev;
+	u16 vddc = 0;
+
+	/* Can't get vddc when the card is off */
+	if ((rdev->flags & RADEON_IS_PX) &&
+		(ddev->switch_power_state != DRM_SWITCH_POWER_ON))
+		return -EINVAL;
+
+	if (rdev->asic->dpm.get_current_vddc)
+		vddc = rdev->asic->dpm.get_current_vddc(rdev);
+
+	return snprintf(buf, PAGE_SIZE, "%u\n", vddc);
+}
+
+static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, radeon_hwmon_show_vddc, NULL,
+			  0);
 
 static struct attribute *hwmon_attributes[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
@@ -747,6 +767,7 @@ static struct attribute *hwmon_attributes[] = {
 	&sensor_dev_attr_pwm1_min.dev_attr.attr,
 	&sensor_dev_attr_pwm1_max.dev_attr.attr,
 	&sensor_dev_attr_freq1_input.dev_attr.attr,
+	&sensor_dev_attr_in0_input.dev_attr.attr,
 	NULL
 };
 
@@ -765,7 +786,13 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
 	     attr == &sensor_dev_attr_pwm1_enable.dev_attr.attr ||
 	     attr == &sensor_dev_attr_pwm1_max.dev_attr.attr ||
 	     attr == &sensor_dev_attr_pwm1_min.dev_attr.attr ||
-	     attr == &sensor_dev_attr_freq1_input.dev_attr.attr))
+	     attr == &sensor_dev_attr_freq1_input.dev_attr.attr ||
+	     attr == &sensor_dev_attr_in0_input.dev_attr.attr))
+		return 0;
+
+	/* Skip vddc attribute if get_current_vddc is not implemented */
+	if(attr == &sensor_dev_attr_in0_input.dev_attr.attr &&
+		!rdev->asic->dpm.get_current_vddc)
 		return 0;
 
 	/* Skip fan attributes if fan is not present */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
