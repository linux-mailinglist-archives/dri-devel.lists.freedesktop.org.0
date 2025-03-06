Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8F2A53FFF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C7210E890;
	Thu,  6 Mar 2025 01:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id 9B82E10E890;
 Thu,  6 Mar 2025 01:37:28 +0000 (UTC)
Received: from [172.30.20.101] (unknown [180.167.10.98])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 11774604A4FAC; 
 Thu,  6 Mar 2025 09:36:48 +0800 (CST)
Message-ID: <cef18438-4cb3-f69e-f3b9-200151b2eb4c@nfschina.com>
Date: Thu, 6 Mar 2025 09:36:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
 michael.j.ruhl@intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 tzimmermann@suse.de, airlied@gmail.com
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <202503052153.gQnXU123-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2025/3/5 21:15, kernel test robot wrote:
> Hi Su,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on drm-xe/drm-xe-next]
> [also build test ERROR on linus/master v6.14-rc5 next-20250304]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/drm-xe-Select-INTEL_VSEC-to-fix-build-dependency/20250227-153437
> base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
> patch link:    https://lore.kernel.org/r/20250227073205.1248282-1-suhui%40nfschina.com
> patch subject: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
> config: loongarch-randconfig-001-20250304 (https://download.01.org/0day-ci/archive/20250305/202503052153.gQnXU123-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503052153.gQnXU123-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503052153.gQnXU123-lkp@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>>> ERROR: modpost: "intel_vsec_register" [drivers/gpu/drm/xe/xe.ko] undefined!
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for INTEL_VSEC
>     Depends on [n]: X86_PLATFORM_DEVICES [=n] && PCI [=y]
>     Selected by [m]:
>     - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=y] || KUNIT [=y]=y [=y])
>     WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
>     Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
>     Selected by [m]:
>     - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]
>
Thanks for these reported, this patch has some problems and is discarded.

As Lucas's and Jani's suggestion, there are some other solutions, but I 
can't
make sure these solutions won't generate such building errors like this one.
So I want to use some tools to make sure this dependency is absolutely 
right.
I saw there were some thoughts about kconfig-sat[1], maybe it can help. 
I guess
using SAT is a nice solution for this problem, but I'm not famlilar with 
SAT.

So it need some time (maybe more) for me to send a v2 patch.

[1] https://kernelnewbies.org/KernelProjects/linux-sat

Su Hui

