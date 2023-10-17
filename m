Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9797CD00C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 00:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F325410E337;
	Tue, 17 Oct 2023 22:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA2410E05A;
 Tue, 17 Oct 2023 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697581908; x=1729117908;
 h=date:from:to:cc:subject:message-id;
 bh=+PZzgswT11tTCY1wW5RYTAzOwYzHytdZcwrWclS/1Lw=;
 b=RX1xwzxHHVS1Xqa2ZB8M59a/5KlE7AHXttUf18CmqCTmyk+znWkRsJOd
 o2oIWpd1sqKovnh+W5RGy7vrsbGBBqn1YUiDyi2m6UXNbZN9Z20qcCw+f
 lajK/uR3AFAVg+r/ZS9wRjj863HU8VvL/DqiWzMuqifIz8dU7y2E5Y2oF
 d1Z/TneK4MK1cCf06oxFW06ecD1BpDfqbkSQCnix6xZG95IKn7PggKrv3
 ZLya+3bVVeLExoolwrWvJswco1uC1IRQH3jb3315UzAoQqCsn4erx1I+q
 jzMLWhVm42rH8T9ZGgTDSgXV3Rj2+ePxaSCEvXUOFEKDls9v7fLVlLzOq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="376260808"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; d="scan'208";a="376260808"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 15:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="759988573"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; d="scan'208";a="759988573"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 17 Oct 2023 15:31:45 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qssbF-000ABQ-0H;
 Tue, 17 Oct 2023 22:31:42 +0000
Date: Wed, 18 Oct 2023 06:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 4d5ab2376ec576af173e5eac3887ed0b51bd8566
Message-ID: <202310180627.U2wgFLJO-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 bpf@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 4d5ab2376ec576af173e5eac3887ed0b51bd8566  Add linux-next specific files for 20231017

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202309212121.cul1pTRa-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202309212339.hxhBu2F1-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310171612.nWyFirmz-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310171657.KGpaQG47-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310171905.azfrKoID-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310172007.cCfBVBuG-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:286:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c:72:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1752:(.text+0x455c): undefined reference to `qmp_get'
drivers/gpu/drm/msm/adreno/a6xx_gmu.c:994:(.text+0x369c): undefined reference to `qmp_send'
kernel/bpf/helpers.c:1909:19: warning: no previous declaration for 'bpf_percpu_obj_new_impl' [-Wmissing-declarations]
kernel/bpf/helpers.c:1945:18: warning: no previous declaration for 'bpf_percpu_obj_drop_impl' [-Wmissing-declarations]
kernel/bpf/helpers.c:2480:18: warning: no previous declaration for 'bpf_throw' [-Wmissing-declarations]
security/landlock/net.h:26:1: warning: 'landlock_append_net_rule' declared 'static' but never defined [-Wunused-function]
security/landlock/net.h:26:1: warning: 'landlock_append_net_rule' used but never defined
security/landlock/net.h:28:1: error: expected identifier or '('
security/landlock/net.h:28:1: error: expected identifier or '(' before '{' token

Unverified Error/Warning (likely false positive, please contact us if interested):

Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml:
Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-buildonly-randconfig-r006-20230322
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- arm64-randconfig-r003-20220728
|   |-- drivers-gpu-drm-msm-adreno-a6xx_gmu.c:(.text):undefined-reference-to-qmp_get
|   `-- drivers-gpu-drm-msm-adreno-a6xx_gmu.c:(.text):undefined-reference-to-qmp_send
|-- i386-buildonly-randconfig-004-20231017
|   |-- security-landlock-net.h:error:expected-identifier-or-(-before-token
|   |-- security-landlock-net.h:warning:landlock_append_net_rule-declared-static-but-never-defined
|   `-- security-landlock-net.h:warning:landlock_append_net_rule-used-but-never-defined
|-- loongarch-randconfig-001-20231017
|   |-- Documentation-devicetree-bindings-mfd-qcom-pm8xxx.yaml:
|   `-- Documentation-devicetree-bindings-mfd-qcom-tcsr.yaml:
|-- microblaze-randconfig-r004-20230514
|   |-- security-landlock-net.h:error:expected-identifier-or-(-before-token
|   |-- security-landlock-net.h:warning:landlock_append_net_rule-declared-static-but-never-defined
|   `-- security-landlock-net.h:warning:landlock_append_net_rule-used-but-never-defined
|-- openrisc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- openrisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- riscv-randconfig-001-20231017
|   |-- security-landlock-net.h:warning:landlock_append_net_rule-declared-static-but-never-defined
|   `-- security-landlock-net.h:warning:landlock_append_net_rule-used-but-never-defined
|-- riscv-randconfig-002-20231017
|   |-- security-landlock-net.h:warning:landlock_append_net_rule-declared-static-but-never-defined
|   `-- security-landlock-net.h:warning:landlock_append_net_rule-used-but-never-defined
|-- x86_64-buildonly-randconfig-004-20231017
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-randconfig-001-20231017
|   |-- kernel-bpf-helpers.c:warning:no-previous-declaration-for-bpf_percpu_obj_drop_impl
|   |-- kernel-bpf-helpers.c:warning:no-previous-declaration-for-bpf_percpu_obj_new_impl
|   `-- kernel-bpf-helpers.c:warning:no-previous-declaration-for-bpf_throw
`-- x86_64-randconfig-015-20231017
    |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
    `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
clang_recent_errors
`-- hexagon-buildonly-randconfig-r005-20211202
    `-- security-landlock-net.h:error:expected-identifier-or-(

elapsed time: 1053m

configs tested: 128
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231017   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231017   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231017   gcc  
i386         buildonly-randconfig-002-20231017   gcc  
i386         buildonly-randconfig-003-20231017   gcc  
i386         buildonly-randconfig-004-20231017   gcc  
i386         buildonly-randconfig-005-20231017   gcc  
i386         buildonly-randconfig-006-20231017   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231017   gcc  
i386                  randconfig-002-20231017   gcc  
i386                  randconfig-003-20231017   gcc  
i386                  randconfig-004-20231017   gcc  
i386                  randconfig-005-20231017   gcc  
i386                  randconfig-006-20231017   gcc  
i386                  randconfig-011-20231017   gcc  
i386                  randconfig-012-20231017   gcc  
i386                  randconfig-013-20231017   gcc  
i386                  randconfig-014-20231017   gcc  
i386                  randconfig-015-20231017   gcc  
i386                  randconfig-016-20231017   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231017   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231017   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231017   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231017   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231017   gcc  
x86_64       buildonly-randconfig-002-20231017   gcc  
x86_64       buildonly-randconfig-003-20231017   gcc  
x86_64       buildonly-randconfig-004-20231017   gcc  
x86_64       buildonly-randconfig-005-20231017   gcc  
x86_64       buildonly-randconfig-006-20231017   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231017   gcc  
x86_64                randconfig-002-20231017   gcc  
x86_64                randconfig-003-20231017   gcc  
x86_64                randconfig-004-20231017   gcc  
x86_64                randconfig-005-20231017   gcc  
x86_64                randconfig-006-20231017   gcc  
x86_64                randconfig-011-20231017   gcc  
x86_64                randconfig-012-20231017   gcc  
x86_64                randconfig-013-20231017   gcc  
x86_64                randconfig-014-20231017   gcc  
x86_64                randconfig-015-20231017   gcc  
x86_64                randconfig-016-20231017   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
