Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D642B905CF1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 22:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D70310E100;
	Wed, 12 Jun 2024 20:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IiHUHhqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB0C10E100;
 Wed, 12 Jun 2024 20:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718224876; x=1749760876;
 h=date:from:to:cc:subject:message-id;
 bh=SUtRVC2djTtEI8zFSnW33zdaI3PuW7Q9P+96RxyobaE=;
 b=IiHUHhqmkSYPvv9116i+NTty6LHpe3++fY/iRodsL6iu/RzNEMD7zzTz
 +y4AstQBOQKKhFYu95XPXOrmMyIirCd2tebu+4UvBnIP/8H/OYxRE42sQ
 kg64iatc89ZKv6+bG8WlpzxzwRbE3gq4DoePBV122aP01Qk97N7uA6lvI
 JfCAo6HGmMb7lHrf793dNTNkEfkn1RWiwxk4WmwsHFILs+VsSsuPJpkRr
 myIjFWES9rQizKudQXw/4Xy2EA++G1SWW/ZTVJxQDAWf0azjbNLMsaoA4
 s2jnZMUcafee7UXGfz76J7jNI3c6/O3Nw6rAMmiBxMymNMBrPtKv7Sbvi w==;
X-CSE-ConnectionGUID: pHDOx03aR6OknDJADef/MA==
X-CSE-MsgGUID: 9rkE5PlnSvOxG2chmkxn0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14736774"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14736774"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:41:16 -0700
X-CSE-ConnectionGUID: ksN4dkEYToahmIBhpCLmRw==
X-CSE-MsgGUID: ap5Q3xLKQSaByL+D2Qqg0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39972439"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 12 Jun 2024 13:41:13 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sHUmM-0001uk-2H;
 Wed, 12 Jun 2024 20:41:10 +0000
Date: Thu, 13 Jun 2024 04:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 03d44168cbd7fc57d5de56a3730427db758fc7f6
Message-ID: <202406130455.UJoyV0n2-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 03d44168cbd7fc57d5de56a3730427db758fc7f6  Add linux-next specific files for 20240612

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406130139.TV8i316r-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: compatible: ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: compatible: ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: compatible: ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-randconfig-001-20240612
|   `-- drivers-pinctrl-pinctrl-keembay.c:error:struct-function_desc-has-no-member-named-name
|-- arm64-randconfig-003-20240612
|   `-- drivers-pinctrl-pinctrl-keembay.c:error:struct-function_desc-has-no-member-named-name
|-- csky-randconfig-002-20240612
|   |-- kernel-trace-fgraph.c:warning:fgraph_pid_func-defined-but-not-used
|   |-- kernel-trace-fgraph.c:warning:unused-variable-gops
|   `-- kernel-trace-fgraph.c:warning:unused-variable-op
|-- i386-randconfig-061-20240612
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-hubbub-dcn401-dcn401_hubbub.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
|   `-- drivers-thermal-thermal_trip.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
|-- powerpc64-randconfig-r121-20240612
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- riscv-randconfig-001-20240612
|   |-- kernel-trace-fgraph.c:warning:fgraph_pid_func-defined-but-not-used
|   |-- kernel-trace-fgraph.c:warning:unused-variable-gops
|   `-- kernel-trace-fgraph.c:warning:unused-variable-op
|-- sh-randconfig-001-20240612
|   |-- kernel-trace-fgraph.c:warning:fgraph_pid_func-defined-but-not-used
|   |-- kernel-trace-fgraph.c:warning:unused-variable-gops
|   `-- kernel-trace-fgraph.c:warning:unused-variable-op
`-- x86_64-buildonly-randconfig-001-20240612
    |-- drivers-input-touchscreen-wacom_w8001.c:warning:Finger-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
    `-- drivers-input-touchscreen-wacom_w8001.c:warning:Pen-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
clang_recent_errors
|-- arm64-randconfig-051-20240612
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:dma-controller:compatible:fsl-ls1028a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:dma-controller:compatible:fsl-ls1028a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:dma-controller:compatible:fsl-ls1028a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:dma-controller:compatible:fsl-ls1028a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:dma-controller:compatible:fsl-ls1028a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var4.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var4.dtb:dma-controller:compatible:fsl-ls1028a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var4.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var4.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:dma-controller:compatible:fsl-ls1028a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds.dtb:dma-controller:compatible:fsl-ls1028a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-rdb.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-rdb.dtb:dma-controller:compatible:fsl-ls1028a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-rdb.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-rdb.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-qds.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-qds.dtb:dma-controller:compatible:fsl-ls1021a-qdma-fsl-ls1043a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-qds.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-qds.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-rdb.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-rdb.dtb:dma-controller:compatible:fsl-ls1021a-qdma-fsl-ls1043a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-rdb.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-rdb.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-tqmls1043a-mbls1xa.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-tqmls1043a-mbls1xa.dtb:dma-controller:compatible:fsl-ls1021a-qdma-fsl-ls1043a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-tqmls1043a-mbls1xa.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1043a-tqmls1043a-mbls1xa.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-frwy.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-frwy.dtb:dma-controller:compatible:fsl-ls1046a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-frwy.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-frwy.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-qds.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-qds.dtb:dma-controller:compatible:fsl-ls1046a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-qds.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-qds.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-rdb.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-rdb.dtb:dma-controller:compatible:fsl-ls1046a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-rdb.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-rdb.dtb:dma-controller:interrupts:is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-tqmls1046a-mbls1xa.dtb:dma-controller:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-tqmls1046a-mbls1xa.dtb:dma-controller:compatible:fsl-ls1046a-qdma-fsl-ls1021a-qdma-is-too-long
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1046a-tqmls1046a-mbls1xa.dtb:dma-controller:interrupt-names:qdma-error-qdma-queue0-qdma-queue1-qdma-queue2-qdma-queue3-is-too-long
|   `-- arch-arm64-boot-dts-freescale-fsl-ls1046a-tqmls1046a-mbls1xa.dtb:dma-controller:interrupts:is-too-long
|-- arm64-randconfig-r131-20240612
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- i386-randconfig-006-20240612
|   `-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration
|-- x86_64-randconfig-123-20240612
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
`-- x86_64-randconfig-161-20240612
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c-amdgpu_vm_bo_update()-error:we-previously-assumed-bo-could-be-null-(see-line-)
    |-- drivers-gpu-drm-i915-display-intel_dpt.c-intel_dpt_pin_to_ggtt()-error:uninitialized-symbol-vma-.
    |-- drivers-gpu-drm-i915-display-intel_fb_pin.c-intel_fb_pin_to_dpt()-error:uninitialized-symbol-vma-.
    `-- drivers-gpu-drm-i915-display-intel_fb_pin.c-intel_fb_pin_to_dpt()-error:vma-dereferencing-possible-ERR_PTR()

elapsed time: 777m

configs tested: 179
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                            hsdk_defconfig   gcc-13.2.0
arc                   randconfig-001-20240612   gcc-13.2.0
arc                   randconfig-002-20240612   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   clang-14
arm                         lpc32xx_defconfig   clang-19
arm                         nhk8815_defconfig   clang-19
arm                          pxa168_defconfig   clang-19
arm                   randconfig-001-20240612   gcc-13.2.0
arm                   randconfig-002-20240612   gcc-13.2.0
arm                   randconfig-003-20240612   clang-19
arm                   randconfig-004-20240612   clang-14
arm                           sunxi_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240612   gcc-13.2.0
arm64                 randconfig-002-20240612   gcc-13.2.0
arm64                 randconfig-003-20240612   gcc-13.2.0
arm64                 randconfig-004-20240612   clang-19
csky                             allmodconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                             allyesconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240612   gcc-13.2.0
csky                  randconfig-002-20240612   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240612   clang-19
hexagon               randconfig-002-20240612   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240612   gcc-13
i386         buildonly-randconfig-002-20240612   gcc-8
i386         buildonly-randconfig-003-20240612   gcc-13
i386         buildonly-randconfig-004-20240612   clang-18
i386         buildonly-randconfig-005-20240612   gcc-13
i386         buildonly-randconfig-006-20240612   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240612   gcc-8
i386                  randconfig-002-20240612   clang-18
i386                  randconfig-003-20240612   clang-18
i386                  randconfig-004-20240612   clang-18
i386                  randconfig-005-20240612   gcc-13
i386                  randconfig-006-20240612   clang-18
i386                  randconfig-011-20240612   clang-18
i386                  randconfig-012-20240612   clang-18
i386                  randconfig-013-20240612   clang-18
i386                  randconfig-014-20240612   gcc-7
i386                  randconfig-015-20240612   gcc-13
i386                  randconfig-016-20240612   gcc-7
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240612   gcc-13.2.0
loongarch             randconfig-002-20240612   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   clang-19
mips                     decstation_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
mips                           rs90_defconfig   gcc-13.2.0
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240612   gcc-13.2.0
nios2                 randconfig-002-20240612   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240612   gcc-13.2.0
parisc                randconfig-002-20240612   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                      cm5200_defconfig   clang-19
powerpc                      katmai_defconfig   clang-19
powerpc                   motionpro_defconfig   clang-17
powerpc                      ppc40x_defconfig   clang-19
powerpc               randconfig-001-20240612   gcc-13.2.0
powerpc               randconfig-002-20240612   gcc-13.2.0
powerpc               randconfig-003-20240612   clang-19
powerpc64             randconfig-001-20240612   gcc-13.2.0
powerpc64             randconfig-002-20240612   gcc-13.2.0
powerpc64             randconfig-003-20240612   clang-14
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240612   gcc-13.2.0
riscv                 randconfig-002-20240612   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240612   clang-19
s390                  randconfig-002-20240612   clang-19
sh                               alldefconfig   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240612   gcc-13.2.0
sh                    randconfig-002-20240612   gcc-13.2.0
sh                           se7750_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240612   gcc-13.2.0
sparc64               randconfig-002-20240612   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240612   gcc-13
um                    randconfig-002-20240612   clang-16
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240612   gcc-8
x86_64       buildonly-randconfig-002-20240612   clang-18
x86_64       buildonly-randconfig-003-20240612   clang-18
x86_64       buildonly-randconfig-004-20240612   gcc-12
x86_64       buildonly-randconfig-005-20240612   gcc-13
x86_64       buildonly-randconfig-006-20240612   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240612   clang-18
x86_64                randconfig-002-20240612   clang-18
x86_64                randconfig-003-20240612   gcc-13
x86_64                randconfig-004-20240612   gcc-13
x86_64                randconfig-005-20240612   gcc-13
x86_64                randconfig-006-20240612   clang-18
x86_64                randconfig-011-20240612   gcc-10
x86_64                randconfig-012-20240612   clang-18
x86_64                randconfig-013-20240612   gcc-10
x86_64                randconfig-014-20240612   clang-18
x86_64                randconfig-015-20240612   clang-18
x86_64                randconfig-016-20240612   clang-18
x86_64                randconfig-071-20240612   clang-18
x86_64                randconfig-072-20240612   gcc-13
x86_64                randconfig-073-20240612   gcc-10
x86_64                randconfig-074-20240612   gcc-13
x86_64                randconfig-075-20240612   gcc-8
x86_64                randconfig-076-20240612   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240612   gcc-13.2.0
xtensa                randconfig-002-20240612   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
