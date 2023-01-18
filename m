Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9467767148C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA97D10E68C;
	Wed, 18 Jan 2023 06:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D2D10E68C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:51:18 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id i188so34731430vsi.8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Kie7n9eyX2y+8J9SsgwusItXi1rTkJJNsJ1PDD++j0E=;
 b=B3s3j3N0gG+bNvJM1kixcYCNP/GKIWVHPyV4lr3MVXl/p0N7BMpYjYlyLkA+JDNEwK
 YPBayZkNvzY9TJMNbLdgwh74aQGMywjDnB+HgnS0sAYfB7rOXeKINkcC80Dq9Chxv1DM
 1Tew2QJlCzFdNmJd4aYvCOrI3jZfPsBDrEg+t6exzkc3wFZhl1TDhr3dj3POyWbweOYR
 +7Npg6iCsUQcJq8UB4rK0rr2tOPePqrnq2X7W6XikqLyrIoHUkuWy0cFKeDRI/7G0kUt
 bC9HiI6ACpwicvuUfC9hiCdSxpSHxHZNDelqvQnkWIAm1HWc1SKEmSTBl5163j53Jqb9
 dDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kie7n9eyX2y+8J9SsgwusItXi1rTkJJNsJ1PDD++j0E=;
 b=4Hv4bETAYgBOcmrVfrZ+rHPpvpRqYNoSc5hyeMK3SJXZaRBcW7YgCbnTybZcmpy08X
 M3DPZtfHhhun82con+NZ/ORl4N3SJUHntotguLvpHmGmT6EOXNgN9p5hfQf3V8qKf7YI
 6dSodh+iDxMXlmALkJALVvHCzDXJ9Eu3wSD40y6cDiNzyvJJvwV4nq/PBnHCWcdK/xKt
 LOBUFPCfzojw7NvfZ+yn4uYIUAu6LBvWdyrUarmwt6+ZU/WfyXyzALgXkqtzMupmE2/W
 IF4fRvSyXqrZ9cahMb7ebtVaF1f9q6fEP/CuMFuwLk4oPXoi/7hbIkSGu8h3zRtLNBkz
 Ly9A==
X-Gm-Message-State: AFqh2krdA30u2zGptn7CWze2BhhyEO3iXgYoc0u1xXU5eZ0sGQuW1bPy
 J3IiZ3AD7y8lGVRiF8zKwsKTN8CA353Dn4olVpskgi/uzJM5iNT7
X-Google-Smtp-Source: AMrXdXsAPqq2grhhH7dWv3ibNzidh83nP0UMQkpPzASvjBVgkLMqi0nHLe5BmrNOLAwh7gP3eyGxpJ7a7jWlLotqW3o=
X-Received: by 2002:a05:6102:5587:b0:3b5:32d0:edcc with SMTP id
 dc7-20020a056102558700b003b532d0edccmr779063vsb.24.1674024677099; Tue, 17 Jan
 2023 22:51:17 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 18 Jan 2023 12:21:06 +0530
Message-ID: <CA+G9fYs+ZDoW8Xm8M5quk7J3aE942D4c34oDWM2Xjg-DQFm+Bw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/gpu: Add devfreq tuning debugfs
To: dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, 
 lkft-triage@lists.linaro.org, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following build regression noticed on Linux next-20230118.

Regressions found on arm:
    - build/gcc-8-imx_v6_v7_defconfig
    - build/gcc-12-imx_v6_v7_defconfig
    - build/clang-15-imx_v6_v7_defconfig
    - build/clang-nightly-imx_v6_v7_defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
  Depends on [n]: PM_DEVFREQ [=n]
  Selected by [y]:
  - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM [=n] ||
SOC_IMX5 [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y] &&
IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) &&
(QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=n] ||
QCOM_COMMAND_DB [=n]=n)

WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
  Depends on [n]: PM_DEVFREQ [=n]
  Selected by [y]:
  - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM [=n] ||
SOC_IMX5 [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y] &&
IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) &&
(QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=n] ||
QCOM_COMMAND_DB [=n]=n)
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
In file included from drivers/gpu/drm/msm/msm_gpu.h:18,
                 from drivers/gpu/drm/msm/adreno/adreno_gpu.h:15,
                 from drivers/gpu/drm/msm/adreno/adreno_device.c:9:
drivers/gpu/drm/msm/msm_drv.h:237:45: error: field
'gpu_devfreq_config' has incomplete type
  237 |         struct devfreq_simple_ondemand_data gpu_devfreq_config;
      |                                             ^~~~~~~~~~~~~~~~~~

Build log:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230118/testrun/14250189/suite/build/test/gcc-12-imx_v6_v7_defconfig/log

This was already reported a while back on lore,
https://lore.kernel.org/all/202301130108.fslQjvJ8-lkp@intel.com/


--
Linaro LKFT
https://lkft.linaro.org
