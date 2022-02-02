Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5310D4A6D68
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3287410E6E4;
	Wed,  2 Feb 2022 09:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18CC10E6E4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:02:49 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id i10so58844068ybt.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 01:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=nnsoRIvHiPW86fgxS/TUyo3uILbX1Bq5yPw+gC/F9ps=;
 b=jcYJckd8Ljg20UUBM8DwyMlBxEUJU28BoexIQ5gFXf8MFvRLjMOwgeby/nQAUMck+R
 zgeldWz3rlkcnHIGXEkgSKvRPy8SUHeUS3OrmhopQkVqhEAb2vNDUW2fuvWFp89tK3iV
 9pB0F0wRWI2n8otQ+w22/W+XEbEhKoHirdS2nzt5A94k2sUJjmpGoGOwTrJJxUF6GF+8
 vycFMQyzdnVq7soCNlNJ1H2g4Vh2o/buypgUT7NDXDrtB7mmB8AFaYV39p8BDzlkzhp2
 aTnWX/6l1y5ppo1UeaT56ne2iZtsOl+OJyMbbD2/SyJOdlqo/h8+2E92sypqrb0rK0f0
 wwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=nnsoRIvHiPW86fgxS/TUyo3uILbX1Bq5yPw+gC/F9ps=;
 b=fL8DhzqsrrIWyDTuo1M+PDl1l8X+cH+mEJleDMdXeHu9nvwL0mUyxlgQWvEnzCJan2
 s9OqnCXu7e4E5lytGIsiPD6mS1adFnmy7rbF75jcxxxaqHcJfLDsMIRj6FXJTGTKNzP8
 G1hl03KwSy0CmCcFqv5XW/1RCGp37RQaju8cyFikaAuQPodawFIbeFbOwPjM3J1CBB9t
 ZEo/IGssTWMKLzMU824/LK/kOsrldkDbpZwLvjgzPBH4jvQp2D6xDshmZ4lCqcvr0l4/
 /QuXgMC3HsNJ3VAk1VbiNKDP/UpqBlJj2WCJxguzCQT7ep/AhR9RdXz57KBfyHSKDmZB
 Nt0w==
X-Gm-Message-State: AOAM530AWmkQR9ReCQgVlTewJwFVa6kxbGBW/LZ7/KJL9clMRfnpHRCJ
 keAm59DJZTXNnqry/x7zbAuURiDeLg1hqmk3sHC+Og==
X-Google-Smtp-Source: ABdhPJyvdt2XcB7jzRbFPAV1aT4cuO5tnJlamsO5G6CPh11//XRMrUWWSxF02QNQh572rdlKdwV2g/+q7FXHG2ral+o=
X-Received: by 2002:a25:b13:: with SMTP id 19mr37709652ybl.684.1643792568511; 
 Wed, 02 Feb 2022 01:02:48 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Feb 2022 14:32:37 +0530
Message-ID: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>
Subject: [next] arm: panel-edp.c:(.text+0xb74): undefined reference to
 `drm_panel_dp_aux_backlight'
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 lkft-triage@lists.linaro.org, 
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
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
Cc: Marek Vasut <marex@denx.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Arnd Bergmann <arnd@arndb.de>,
 Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Grace Mi <grace.mi@ecs.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following builds failed on Linux next 20220202 arm architecture.
  - arm-gcc-10-omap2plus_defconfig
  - arm-clang-nightly-shmobile_defconfig
  - arm-gcc-8-lpc32xx_defconfig
  - arm-clang-13-shmobile_defconfig
  - arm-gcc-10-shmobile_defconfig
  - arm-clang-11-shmobile_defconfig
  - arm-clang-11-omap2plus_defconfig
  - arm-clang-13-omap2plus_defconfig
  - arm-clang-11-lpc32xx_defconfig
  - arm-gcc-8-omap2plus_defconfig
  - arm-gcc-9-vexpress_defconfig
  - arm-clang-nightly-lpc32xx_defconfig
  - arm-gcc-9-shmobile_defconfig
  - arm-clang-13-lpc32xx_defconfig
  - arm-gcc-10-sama5_defconfig
  - arm-clang-11-vexpress_defconfig
  - arm-clang-11-sama5_defconfig
  - arm-gcc-9-omap2plus_defconfig
  - arm-clang-nightly-sama5_defconfig
  - arm-clang-13-vexpress_defconfig
  - arm-clang-nightly-vexpress_defconfig
  - arm-gcc-9-lpc32xx_defconfig
  - arm-clang-12-vexpress_defconfig
  - arm-gcc-10-vexpress_defconfig
  - arm-clang-12-shmobile_defconfig
  - arm-gcc-11-omap2plus_defconfig
  - arm-gcc-9-sama5_defconfig
  - arm-gcc-8-shmobile_defconfig
  - arm-gcc-10-lpc32xx_defconfig
  - arm-clang-12-omap2plus_defconfig
  - arm-gcc-8-vexpress_defconfig
  - arm-clang-12-sama5_defconfig
  - arm-clang-nightly-omap2plus_defconfig
  - arm-gcc-11-lpc32xx_defconfig
  - arm-gcc-11-sama5_defconfig
  - arm-gcc-11-shmobile_defconfig
  - arm-gcc-11-vexpress_defconfig
  - arm-gcc-8-sama5_defconfig
  - arm-clang-13-sama5_defconfig
  - arm-clang-12-lpc32xx_defconfig


make --silent --keep-going --jobs=8  ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc' vexpress_defconfig
make --silent --keep-going --jobs=8  ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
arm-linux-gnueabihf-ld: drivers/gpu/drm/panel/panel-edp.o: in function
`panel_edp_probe':
panel-edp.c:(.text+0xb74): undefined reference to `drm_panel_dp_aux_backlight'
make[1]: *** [/builds/linux/Makefile:1222: vmlinux] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git describe: next-20220202
    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
    target_arch: arm
    kconfig: vexpress_defconfig
    toolchain: gcc-11

Build log:
-------------
https://builds.tuxbuild.com/24XRim72vFXix6l6MdAJNENy6je/

Steps to reproduce:
--------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch arm --toolchain gcc-11
--kconfig vexpress_defconfig

tuxmake --runtime podman --target-arch arm --toolchain gcc-11
--kconfig https://builds.tuxbuild.com/24XRim72vFXix6l6MdAJNENy6je/config


--
Linaro LKFT
https://lkft.linaro.org
