Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B81256C90
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 09:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB616E241;
	Sun, 30 Aug 2020 07:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB0E6E241
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 07:25:28 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id q1so1439000pjd.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 00:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=IV89cFZ20MXQmcjrZOeePOj6c77zueFChyZwn38wWgM=;
 b=kZsXXqgPoy2pf2c0neC264dhCrRS5sd8ixRvSnilmkJ0H4T1+lnh+HH3N/sJzih5XB
 NI5nL4ArKzAFPdPoI2y9nV4kdC7SNgeFR8wbTl/YXvoohLl+xjjjkn2uKiMsOoC1UgW2
 WdsmIvvO1+i+IzhI79zhqikpWvE8J81cpV8WiDUZozCKe0vbu0UIuFdFk8r/tJnryvts
 N1k/VYEFH7do3TzJPH2MhQqv3yGpFLsFtlVMvKdOhuNgNkz/kakC9JNiM0B1SHrzb9OF
 XggkeuibmOLmyiyxjnQIOE/T2+SpTH+Mi97ATVvrV3HM234VCj5BprBIHF9d9DrWuFZ1
 umCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=IV89cFZ20MXQmcjrZOeePOj6c77zueFChyZwn38wWgM=;
 b=KKz0vvYpMp2vKzY/GiJIm7UQov37lermke0W2Fw31bJdKszaP3tm3OpPdiY6EyEH6q
 rIkPOq6P3Ukr4wW94kZrGcRHqoxvjh0jDSRQ/zJP4/BqcG9rQvO/uO9owjYkh/fMxCZc
 lv9jggpW/xJet+4ngJvfR4Mmg5b46kEij1YelyTi63/jUJ7kkeZ+Wn+zR94C9rj8hHRF
 Scf89ecKHcYj8m14NofbFzkjOJn2Ya7TvSvocfCPClfdcm/gt+D//lyu2ScGbUxLJXky
 pIW3jtdvxpbmfqokMlSYpFdyaI+N7DzOXiJyBvrUbnMQn6WUifcbSJ3+Ylj+33mrC2QM
 R/MA==
X-Gm-Message-State: AOAM533LmVTdEs9ZNgyJOq/nVtgbULRpAEFKWpZHEfRtxd4YPIO5bd36
 +URi0EX7r43Uz3gC0MSwgizHOI6B4IsyLw==
X-Google-Smtp-Source: ABdhPJwXRdjNYaIXRrJeaVNjjXn8VAmWeylmiF/rtAwxewWkvmO+0Kmbw/sPUO6aooiXtSBDTY3AgA==
X-Received: by 2002:a17:90a:6a05:: with SMTP id
 t5mr5411382pjj.26.1598772327923; 
 Sun, 30 Aug 2020 00:25:27 -0700 (PDT)
Received: from [192.168.86.30] ([49.207.129.184])
 by smtp.gmail.com with ESMTPSA id s8sm4477484pfm.180.2020.08.30.00.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 00:25:27 -0700 (PDT)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH 1/2] drm/radeon: Add sclk frequency as hwmon sensor
Message-ID: <61af3cb4-9bfc-0e61-de9c-4bb15afdd652@gmail.com>
Date: Sun, 30 Aug 2020 12:55:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
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

This patch series adds support for reporting sclk and vddc values for Radeon GPUs, where supported.

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
