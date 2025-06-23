Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F441AE3AAE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 11:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D0310E1CA;
	Mon, 23 Jun 2025 09:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="fVouHzBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC7B10E1CA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 09:37:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250623093736euoutp01a8b75e683d32ad3aa15099e35aa2c1bb~Lomn0CEfq1598315983euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 09:37:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250623093736euoutp01a8b75e683d32ad3aa15099e35aa2c1bb~Lomn0CEfq1598315983euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750671456;
 bh=A+5IcRjSNl6qTqtwlarHYbjTthP/DIVVwhUwdFuoGjY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=fVouHzBovKz06ZjCSTUzzVtvq1/bXcnO6R8VuQS7xqwdD09innDB78O3m+FPkHLQT
 jCR+MZVCrVaSRAkIqbLUqSBVCpUJaxGHhomvvJVspNLeVVsHSvszjhylVLw61sbF5I
 ZYoEU7YplN+4hRjKmoHlscC77y4zVCqcTlzmneLE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250623093735eucas1p2843b624612475c22eb8e1c677b03d9cc~Lomm81wST1776817768eucas1p2q;
 Mon, 23 Jun 2025 09:37:35 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250623093734eusmtip2411fe770a0df6b19f0942a2c666da528~Loml5U_gb0224702247eusmtip2N;
 Mon, 23 Jun 2025 09:37:34 +0000 (GMT)
Message-ID: <c7f8523e-a139-4438-9987-466f415099f8@samsung.com>
Date: Mon, 23 Jun 2025 11:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
To: kernel test robot <lkp@intel.com>, Drew Fustini <drew@pdp7.com>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <202506201103.GX6DA9Gx-lkp@intel.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250623093735eucas1p2843b624612475c22eb8e1c677b03d9cc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250620033331eucas1p22011774fc3a362b04e2bb98db2424299
X-EPHeader: CA
X-CMS-RootMailID: 20250620033331eucas1p22011774fc3a362b04e2bb98db2424299
References: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
 <CGME20250620033331eucas1p22011774fc3a362b04e2bb98db2424299@eucas1p2.samsung.com>
 <202506201103.GX6DA9Gx-lkp@intel.com>
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



On 6/20/25 05:32, kernel test robot wrote:
> Hi Michal,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 4774cfe3543abb8ee98089f535e28ebfd45b975a]
> 
> url:    https://protect2.fireeye.com/v1/url?k=459f4078-1a047974-459ecb37-000babff3563-f67f8714258a7e91&q=1&e=0474f2bc-b688-4260-ae67-33e26f33bf90&u=https%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FMichal-Wilczynski%2Fpower-sequencing-Add-T-HEAD-TH1520-GPU-power-sequencer-driver%2F20250618-182429
> base:   4774cfe3543abb8ee98089f535e28ebfd45b975a
> patch link:    https://lore.kernel.org/r/20250618-apr_14_for_sending-v5-8-27ed33ea5c6f%40samsung.com
> patch subject: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
> config: sparc64-randconfig-r121-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201103.GX6DA9Gx-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250620/202506201103.GX6DA9Gx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506201103.GX6DA9Gx-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/gpu/drm/imagination/pvr_mmu.c:57:3: error: #error Unsupported device page size PVR_DEVICE_PAGE_SIZE
>     # error Unsupported device page size PVR_DEVICE_PAGE_SIZE
>       ^~~~~
>    In file included from ./arch/sparc/include/generated/asm/rwonce.h:1,
>                     from include/linux/compiler.h:390,
>                     from include/linux/dev_printk.h:14,
>                     from include/linux/device.h:15,
>                     from include/linux/node.h:18,
>                     from include/linux/memory.h:19,
>                     from drivers/gpu/drm/imagination/pvr_mmu.h:7,
>                     from drivers/gpu/drm/imagination/pvr_mmu.c:4:
>    drivers/gpu/drm/imagination/pvr_mmu.c: In function 'pvr_page_table_l1_entry_raw_set':
>    drivers/gpu/drm/imagination/pvr_mmu.c:577:50: error: 'ROGUE_MMUCTRL_PAGE_SIZE_X' undeclared (first use in this function); did you mean 'ROGUE_MMUCTRL_PAGE_SIZE_1MB'?
>          PVR_PAGE_TABLE_FIELD_PREP(1, PD, PAGE_SIZE, ROGUE_MMUCTRL_PAGE_SIZE_X) |
>                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>    include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
>      *(volatile typeof(x) *)&(x) = (val);    \
>                                     ^~~
>    drivers/gpu/drm/imagination/pvr_mmu.c:574:2: note: in expansion of macro 'WRITE_ONCE'
>      WRITE_ONCE(entry->val,
>      ^~~~~~~~~~
>    drivers/gpu/drm/imagination/pvr_mmu.c:577:6: note: in expansion of macro 'PVR_PAGE_TABLE_FIELD_PREP'
>          PVR_PAGE_TABLE_FIELD_PREP(1, PD, PAGE_SIZE, ROGUE_MMUCTRL_PAGE_SIZE_X) |
>          ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/imagination/pvr_mmu.c:577:50: note: each undeclared identifier is reported only once for each function it appears in
>          PVR_PAGE_TABLE_FIELD_PREP(1, PD, PAGE_SIZE, ROGUE_MMUCTRL_PAGE_SIZE_X) |
>                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>    include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
>      *(volatile typeof(x) *)&(x) = (val);    \
>                                     ^~~
>    drivers/gpu/drm/imagination/pvr_mmu.c:574:2: note: in expansion of macro 'WRITE_ONCE'
>      WRITE_ONCE(entry->val,
>      ^~~~~~~~~~
>    drivers/gpu/drm/imagination/pvr_mmu.c:577:6: note: in expansion of macro 'PVR_PAGE_TABLE_FIELD_PREP'
>          PVR_PAGE_TABLE_FIELD_PREP(1, PD, PAGE_SIZE, ROGUE_MMUCTRL_PAGE_SIZE_X) |
>          ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/imagination/pvr_mmu.c: In function 'pvr_page_table_l0_entry_raw_set':
>    drivers/gpu/drm/imagination/pvr_mmu.c:741:24: error: 'ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK' undeclared (first use in this function); did you mean 'ROGUE_MMUCTRL_PAGE_1MB_RANGE_CLRMSK'?
>               (dma_addr & ~ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK) |
>                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
>      *(volatile typeof(x) *)&(x) = (val);    \
>                                     ^~~
>    drivers/gpu/drm/imagination/pvr_mmu.c:739:2: note: in expansion of macro 'WRITE_ONCE'
>      WRITE_ONCE(entry->val, PVR_PAGE_TABLE_FIELD_PREP(0, PT, VALID, true) |
>      ^~~~~~~~~~
>    drivers/gpu/drm/imagination/pvr_mmu.c: In function 'pvr_page_table_l0_idx':
>    drivers/gpu/drm/imagination/pvr_mmu.c:1713:9: error: 'ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT' undeclared (first use in this function); did you mean 'ROGUE_MMUCTRL_PAGE_4KB_RANGE_SHIFT'?
>             ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT;
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>             ROGUE_MMUCTRL_PAGE_4KB_RANGE_SHIFT
>>> drivers/gpu/drm/imagination/pvr_mmu.c:1714:1: warning: control reaches end of non-void function [-Wreturn-type]
>     }

It's clear from the build log that enabling COMPILE_TEST has exposed
some pre existing portability issues in pvr_mmu.c.

Fixing these underlying MMU issues seem to be outside the scope
of this patch series, which is focused on enabling the TH1520 SoC GPU.
To keep this work focused on its original goal, I will remove the
COMPILE_TEST addition for now.

The addition of COMPILE_TEST support can be revisited in a separate,
dedicated series.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
