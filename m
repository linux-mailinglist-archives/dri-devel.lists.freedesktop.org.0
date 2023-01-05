Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6165EFCE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79C889B66;
	Thu,  5 Jan 2023 15:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6187089B66
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:18:28 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id t190so7497735vkb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 07:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UcGhj1fWzMBjio5nPbCBvm4l5bqnUYX6YD0JwGx4dxg=;
 b=meWLS9NU+Y3YtvvQJS71Z9odvgeKiXGhWUT9NYGY5/bnOvz++UYSDsM7nF02c0SzMn
 3NDg/KwpuoEftJdQvhwR8rPAJQ2JxZ6cEs/NG7U7dEgRLiBlN1Q4CR2ekOkrglCbHbG8
 NlD0hIO+bsDRXAkJznh3cPGRCglwvdht2w8GK1wnXxJdMG0GfoZPZio/SIuaCaz3+Yf5
 gfCmtUHu8qx9s179gEy4DG27g2uKMpTygors/xviFJN23m3LoprMcWvtjUILy8FRq4Uu
 6rua9yrFmIaAdHqQ1tPhr8lWaKDnJq3nnoHVfG7/SjzUWCnEJd1DoxZwO9F3GEPCPYBg
 nKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UcGhj1fWzMBjio5nPbCBvm4l5bqnUYX6YD0JwGx4dxg=;
 b=j1yELpBBnPyOuEHMgUnSC6va38y10x7zsgbBN3IR7dnBfitE6WmEQ+Lkk9GPjyDmch
 nmsdEVKSbjVXECeUp7755mX/VTVD3bMx87CoU9Ck3BRyVXzTGWgPtExi2XFRfb5McucM
 wkJVhNmwIYA6S7AE5AEbKn/+pdvnMncSEDn0QCEFrIqu0v16p07OeiuqZGeMo0tClGu3
 6eIbfJV+AKn9bgEoigB1wb/hr1LPFiutCt3wjFK+TvS+Aacl4kR+L9vay07zhahMOAbW
 NSHthf2AO+CmLL5v4p2lLf9l/PZKkOp2Ehsih9b3ezvkyG/r/eaONSdF+5CL4+x0iNxx
 nv0g==
X-Gm-Message-State: AFqh2ko6PXckHYQDBVBYSnBc+YyDp953ae2CyP8ZhTAj1p04G75Dizfc
 yvNmhDSwtvh6ywSrwBXEnmMYUM34CK23VaB4UJeOVQkEpwYGm2k2
X-Google-Smtp-Source: AMrXdXv+/VSMgynXqQpmsyBzO7isr1WOZJtTaF/1AnM7s//bGzTRjfKyoZFdmXyQ2hX1KPv8cG92bBRBhajW8vCeWKA=
X-Received: by 2002:a1f:6282:0:b0:3d5:555e:49c5 with SMTP id
 w124-20020a1f6282000000b003d5555e49c5mr3967985vkb.39.1672931907075; Thu, 05
 Jan 2023 07:18:27 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 5 Jan 2023 20:48:15 +0530
Message-ID: <CA+G9fYvj4kuaup=kXtFPDRu7YouayJyU_3wNykO7bX=Scsnn+g@mail.gmail.com>
Subject: next: arm64: ERROR: modpost: "kunit_running"
 [drivers/gpu/drm/vc4/vc4.ko] undefined!
To: dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, 
 kunit-dev@googlegroups.com, lkft-triage@lists.linaro.org, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>
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
Cc: brendan.higgins@linux.dev, David Gow <davidgow@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following arm64 kunit enabled build failed with gcc-12.

ERROR: modpost: "kunit_running" [drivers/gpu/drm/vc4/vc4.ko] undefined!

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
-------------
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build
CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- 'CC=sccache aarch64-linux-gnu-gcc'
'HOSTCC=sccache gcc' olddefconfig
.config:10084:warning: override: TRANSPARENT_HUGEPAGE_MADVISE changes
choice state
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build
CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- 'CC=sccache aarch64-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from /builds/linux/include/asm-generic/rwonce.h:26,
                 from /builds/linux/arch/arm64/include/asm/rwonce.h:71,
                 from /builds/linux/include/linux/compiler.h:247,
                 from /builds/linux/include/linux/export.h:33,
                 from /builds/linux/include/linux/linkage.h:7,
                 from /builds/linux/include/linux/kernel.h:17,
                 from /builds/linux/fs/btrfs/ioctl.c:6:
/builds/linux/include/linux/kasan-checks.h: In function 'btrfs_ioctl_wait_sync':
/builds/linux/include/linux/kasan-checks.h:38:27: warning: 'transid'
may be used uninitialized [-Wmaybe-uninitialized]
   38 | #define kasan_check_write __kasan_check_write
      |                           ^~~~~~~~~~~~~~~~~~~
/builds/linux/include/linux/kasan-checks.h:20:6: note: by argument 1
of type 'const volatile void *' to '__kasan_check_write' declared here
   20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
      |      ^~~~~~~~~~~~~~~~~~~
/builds/linux/fs/btrfs/ioctl.c:3134:13: note: 'transid' declared here
 3134 |         u64 transid;
      |             ^~~~~~~
/builds/linux/include/linux/kasan-checks.h: In function 'btrfs_ioctl':
/builds/linux/include/linux/kasan-checks.h:38:27: warning:
'space_args' may be used uninitialized [-Wmaybe-uninitialized]
   38 | #define kasan_check_write __kasan_check_write
      |                           ^~~~~~~~~~~~~~~~~~~
/builds/linux/include/linux/kasan-checks.h:20:6: note: by argument 1
of type 'const volatile void *' to '__kasan_check_write' declared here
   20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
      |      ^~~~~~~~~~~~~~~~~~~
/builds/linux/fs/btrfs/ioctl.c:2973:39: note: 'space_args' declared here
 2973 |         struct btrfs_ioctl_space_args space_args;
      |                                       ^~~~~~~~~~
/builds/linux/include/linux/kasan-checks.h:38:27: warning: 'args32'
may be used uninitialized [-Wmaybe-uninitialized]
   38 | #define kasan_check_write __kasan_check_write
      |                           ^~~~~~~~~~~~~~~~~~~
/builds/linux/include/linux/kasan-checks.h:20:6: note: by argument 1
of type 'const volatile void *' to '__kasan_check_write' declared here
   20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
      |      ^~~~~~~~~~~~~~~~~~~
/builds/linux/fs/btrfs/ioctl.c:4320:49: note: 'args32' declared here
 4320 |                 struct btrfs_ioctl_send_args_32 args32;
      |                                                 ^~~~~~
ERROR: modpost: "kunit_running" [drivers/gpu/drm/vc4/vc4.ko] undefined!
make[2]: *** [/builds/linux/scripts/Makefile.modpost:137:
Module.symvers] Error 1
make[2]: Target '__modpost' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1967: modpost] Error 2

build log:
-----------
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230105/testrun/13988421/suite/build/test/gcc-12-lkftconfig-kunit/log

Easy steps to reproduce with tuxmake:
-------------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-12
--kconfig defconfig --kconfig-add
https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft-crypto.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/distro-overrides.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/systemd.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/virtio.config
--kconfig-add CONFIG_ARM64_MODULE_PLTS=y --kconfig-add
CONFIG_SYN_COOKIES=y --kconfig-add CONFIG_SCHEDSTATS=y --kconfig-add
CONFIG_KASAN=y --kconfig-add CONFIG_KUNIT=y --kconfig-add
CONFIG_KUNIT_ALL_TESTS=y CROSS_COMPILE_COMPAT=arm-linux-gnueabihf-

tuxmake --runtime podman --target-arch arm64 --toolchain gcc-12
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2JtJj8Fpj9wmxgtyz3nkpqOFHdf/config
CROSS_COMPILE_COMPAT=arm-linux-gnueabihf-


--
Linaro LKFT
https://lkft.linaro.org
