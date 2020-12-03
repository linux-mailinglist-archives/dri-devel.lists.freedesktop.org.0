Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00742CDE86
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 20:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F63D6E067;
	Thu,  3 Dec 2020 19:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5B66E067
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 19:13:46 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id g18so2007367pgk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 11:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=UB64UbUSJb9UjIl1DSmlKznWzh2B71H9tWiWqFm1ZJM=;
 b=BLJbvXwmkwl6XhAADig3fsLHsyb6HK3nyco5RlxSqUtO/djuLDg2Zv4fp9/tJ1kcJQ
 AbDJWNgtt5skMZ6xI6NNCdhq7EIEM1EhiDl6OHz0yK3UUrB1AOOPy8vOcXtT4IeX476D
 xIWMgQGYplVr8dIZuCX3UT73s7pNclmobTjfCPjhkJZGepjrH9QHHob8PBWzLspnn9VN
 n5C+64lIELXL5bTzAaLiKX/FMz8uB38orGaMZAFzoYwb5zDU1tM2vnBhDrnuxeCWmXNY
 iMmPQpjzypj+tL1ZSgmOMW/V+fjyxzS/fby27yU77Gis/+mwrhqmqrkcV5FDr+J+zSuj
 JaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=UB64UbUSJb9UjIl1DSmlKznWzh2B71H9tWiWqFm1ZJM=;
 b=Hs8gYp1T7w9vEwRG3FcC7B2DQXRUonZGH6lGcgA1Ps8b9mWTO9v0kAg8b//GoMejz1
 i57UfTMJeqP0Vyg6fYd6qNBxpdFCJIKiveQHQm0YkR1aFV3Hqdn6g7exQxIhCqZDSUxA
 vtRaYzsdBMaJd/6O/9eJfxZEoaF/TrTsoYnASZS1LhtNNv+JFxFSwY2Oji9uKx7dfjoN
 6TL0HzN6OVfWJwzNrTNsaQP+QMVwKEayNZgtdRGadbXJqhGeBLRNU/ivq+1DdEQoEfGL
 UgJaDo/icOUc5N43ntwkglc42TBkXlL0x4cn+zzm2teb6U28Xs9LOzYrTiUrV1r0S3Q3
 BWwg==
X-Gm-Message-State: AOAM531BthLeSQnTNIhgGcBnWutJiKzZn5TWOMY5tlC6VxNsldpiP5RN
 6q+Plc1ODfI+O06BYhuJPag=
X-Google-Smtp-Source: ABdhPJz9yWlfT7ehjo7zLQpsqHuAuYSbMtbgIPfqsEDwOA98FxlFGKncve4+x3YYqITYx2QyvjGQ5Q==
X-Received: by 2002:a63:1b1d:: with SMTP id b29mr4441309pgb.84.1607022826615; 
 Thu, 03 Dec 2020 11:13:46 -0800 (PST)
Received: from adolin ([49.207.211.146])
 by smtp.gmail.com with ESMTPSA id j9sm2455797pfa.58.2020.12.03.11.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 11:13:45 -0800 (PST)
Date: Fri, 4 Dec 2020 00:43:39 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH] drm/vkms: Add setup and testing information
Message-ID: <20201203191339.u5hfwy6ycrrzeb3z@adolin>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the vkms documentation to contain steps to:

 - setup the vkms driver
 - run tests using igt

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 Documentation/gpu/vkms.rst | 47 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 13bab1d93bb3..d6782174d23f 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -7,6 +7,53 @@
 .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
    :doc: vkms (Virtual Kernel Modesetting)
 
+SETUP
+=====
+
+The VKMS driver can be setup with the following steps:
+
+To check if VKMS is loaded, run::
+
+  lsmod | grep vkms
+
+This should list the VKMS driver. If no output is obtained, then
+you need to enable and/or load the VKMS driver.
+Ensure that the VKMS driver has been set as a loadable module in your
+kernel config file. The following line should be present in the .config
+file in your kernel root::
+
+  CONFIG_DRM_VKMS=m
+
+Compile and build the kernel for the changes to get reflected.
+If your existing config already has VKMS available as a loadable module,
+then there is no need to build the kernel again.
+Now, to load the driver, use::
+
+  sudo modprobe vkms
+
+On running the lsmod command now, the VKMS driver will appear listed.
+You can also observe the driver being loaded in the dmesg logs.
+
+To disable the driver, use ::
+
+  sudo modprobe -r vkms
+
+TESTING WITH IGT
+================
+
+The IGT GPU Tools is a test suite used specifically for debugging and
+development of the DRM drivers.
+The IGT Tools can be installed from
+`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
+Once you have installed IGT, you can run tests using::
+
+  ./scripts/run-tests.sh -t <name of test>
+
+For example, to test the functionality of the igt_draw library,
+we can run the kms_draw_crc test::
+
+  ./scripts/run-tests.sh -t kms_draw_crc
+
 TODO
 ====
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
