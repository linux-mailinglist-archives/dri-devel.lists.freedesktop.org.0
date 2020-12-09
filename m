Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98402D49B9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 20:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6676E1BC;
	Wed,  9 Dec 2020 19:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2836E188
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 19:05:00 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id g20so612053plo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 11:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=/UsojO3YT4ojgGWZWe9AgdTF40UliX8euFAjdhHI+5E=;
 b=D548r6tfjRjuqddyZqi6fpDGFfJXK5WSIO8Ho5JrZxdYuYRITJ+sRRWwNqN3IUalMq
 rmtgctzQ3zUpEv7Wc38JbJfD9xNy64wqd6UkGHOa0nJ8qu4Nanz6oAllOcvWjOJ5/e1z
 p8tRiEuqY6EGV+1AZaT78ZX/AHDess2iD6mo0PJa6wb36pcA5Zv2/gNZvLKxJYf5lHnn
 c1Q+VZGJtercgP3c2Sl3bWSSzfwCEOExRjDsEXoHUqtmxhGQcbGcmYxXCa3LhxxJ117u
 VUUmBiiOaCZUTdO29sNKlzdHIayKqtdIgd/i+txlYmADMT8RzpcwtYjtjstnyjzwdcOt
 mbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=/UsojO3YT4ojgGWZWe9AgdTF40UliX8euFAjdhHI+5E=;
 b=mdZwR/d0MK6ZnkJJZrCH7JpMrJFi1CikOE1b0UDTyJ/xm/sn+DifucYbdmuCHm3JgQ
 X0ekMwI0/B54izfmOaaw2iWBDpW0VrCSprGEpf7P4Vk21S0rhvf18sJlH2xDBuoosMO4
 4Z15HCu1pJXkKqpHYbb9g8aEUNTMXAEXCtykTvkYMEEpX9c5AfUYD+bVSt59UF6HDryz
 pMxmrDmBFPA7BlhRCBuRrnDSozdN69/XTUQk4yjXeMWwhk/8RnJMP4iJxKVXRV/CNFoy
 kJBYf9Fmk6np0BQ7NcgxPhpG+4kyzeuipxRFySz5Lxl7b8vp1zz2bn4SDb0tRRvsuj0D
 vZeA==
X-Gm-Message-State: AOAM532pGKWAdT+fFlVa3XDW8ih9VURavpOXlGFCkYaTqY0eQdISmKWv
 znQlf7Czy5eVoa7KxSAK2wg=
X-Google-Smtp-Source: ABdhPJynKIt47cLvQOMnEdiyWNtUNdbLfIaDC7GfpGEwNNwF7mRz6z1XwWljvTc8ahnUQTGmtPnFjw==
X-Received: by 2002:a17:902:b582:b029:d6:6008:264d with SMTP id
 a2-20020a170902b582b02900d66008264dmr3494207pls.80.1607540700315; 
 Wed, 09 Dec 2020 11:05:00 -0800 (PST)
Received: from adolin ([49.207.194.238])
 by smtp.gmail.com with ESMTPSA id g16sm3177829pfb.201.2020.12.09.11.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 11:04:59 -0800 (PST)
Date: Thu, 10 Dec 2020 00:34:53 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH v3] drm/vkms: Add setup and testing information
Message-ID: <20201209190453.c6kp5winikr55n3i@adolin>
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
___
Changes in v2:
 - Change heading to title case (Daniel)
 - Add examples to run tests directly (Daniel)
 - Add examples to run subtests (Melissa)

Changes in v3:
 - Add example using run-tests.sh script(Daniel)
---
 Documentation/gpu/vkms.rst | 70 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 13bab1d93bb3..9e030c74a82e 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -7,6 +7,76 @@
 .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
    :doc: vkms (Virtual Kernel Modesetting)
 
+Setup
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
+kernel config file. Do::
+
+  make nconfig
+
+  Go to `Device Drivers> Graphics support`
+
+  Enable `Virtual KMS (EXPERIMENTAL)`
+
+Compile and build the kernel for the changes to get reflected.
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
+Testing With IGT
+================
+
+The IGT GPU Tools is a test suite used specifically for debugging and
+development of the DRM drivers.
+The IGT Tools can be installed from
+`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
+
+The tests need to be run without a compositor, so you need to switch to text
+only mode. You can do this by::
+
+  sudo systemctl isolate multi-user.target
+
+To return to graphical mode, do::
+
+  sudo systemctl isolate graphical.target
+
+Once you are in text only mode, you can run tests using the --device switch
+or IGT_DEVICE variable to specify the device filter for the driver we want
+to test. IGT_DEVICE can also be used with the run-test.sh script to run the
+tests for a specific driver::
+
+  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
+  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
+  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t <name of test>
+
+For example, to test the functionality of the writeback library,
+we can run the kms_writeback test::
+
+  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
+  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
+  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t kms_writeback
+
+You can also run subtests if you do not want to run the entire test::
+
+  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
+  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
+
 TODO
 ====
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
