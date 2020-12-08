Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD982D3406
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 21:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7816E069;
	Tue,  8 Dec 2020 20:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231F96E069
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 20:37:43 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id s21so15013691pfu.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 12:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=SNP2rIe8G2wxSnafh8FU2upaNSqmof5AJ943Uuvz4dw=;
 b=HbROMcQcEmaR8A4+xfeZsLCwM8PcwhFYL64MOP8sPCwZYfO84rS56Flo0/gYv3iWTp
 f61DePhePPUaXs5yxlei68P3PNm+cxJRgO3zsUAj+tIIjntTt/EjDn7aziJCJd760xQ0
 jSDHPNRGSvFcbV8+WdHg812j7Kl3hBhGaKW1poyVWvcYS3iygzwbBZpjg4ATXN9SxFpu
 07h++o+NxI+HvnILG33JWlJcXADXWCO6NT2vapgGq9MNxbzyHeEwMUWLp2aL7SpjoWuu
 cviLNPkFAS8Pf4+a1bkDsKFcVnSMsvfmKq7YrRix8DvnbAq4JMNhnQXRjZP9HBriDjjg
 GNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=SNP2rIe8G2wxSnafh8FU2upaNSqmof5AJ943Uuvz4dw=;
 b=RctvjeCIkPVLTrWyGETGoOwzrsKoGtQfBqy441CkK96Dj647xJzVZryBrwvc0TpbEc
 +eTHYTBAAs7Ix4k0ZdtAgGuZHeHpmFjxMrLtsapmuUM9qtTxg8+6GPMfiJoBrFvjp6K3
 aOzU7DIjGNTM61kgvxSjw/0Ek8tQpxAF5SkQ8VjODqzLFxoLkC6gEVxen1gseHg4q62d
 ohmPCXrNC+uBSCFdA8NtmLpatLpQMb2Sy7CGLdUtJC37RkI0p/wiWoK8sEy7STzuBj9F
 6Hbp1YkfFoLZ7bQu9qH16y2SXUezgrBAwvin55UcSOSvHRu+fRVsQ+auyBmODcyJQ/SB
 h7fg==
X-Gm-Message-State: AOAM532BQM7P5iPVHRsNtnE7mYfnKTXDBeA6uTfHtiDHIlVQgb6uBTqg
 EOwr2B7T5zo1nkBzpui+oeo=
X-Google-Smtp-Source: ABdhPJwj1BKNN6Nnq1qFVujF0F6c5iG63I40szpF99JYVx692OKwFWWi3UWVFiwRINbA//tv34X6Pg==
X-Received: by 2002:a17:90a:ab0f:: with SMTP id
 m15mr5019026pjq.222.1607459862734; 
 Tue, 08 Dec 2020 12:37:42 -0800 (PST)
Received: from adolin ([49.207.194.238])
 by smtp.gmail.com with ESMTPSA id f21sm17153448pgk.18.2020.12.08.12.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:42 -0800 (PST)
Date: Wed, 9 Dec 2020 02:07:35 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V2] drm/vkms: Add setup and testing information
Message-ID: <20201208203735.ukqrgjmlntbvxc7e@adolin>
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
---
 Documentation/gpu/vkms.rst | 67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 13bab1d93bb3..d6739fbbe503 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -7,6 +7,73 @@
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
+to test::
+
+  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
+  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
+
+For example, to test the functionality of the writeback library,
+we can run the kms_writeback test::
+
+  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
+  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
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
