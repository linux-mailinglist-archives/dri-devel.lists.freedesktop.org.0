Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E539AD02
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CF26E7EC;
	Thu,  3 Jun 2021 21:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B506C6E7EC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 21:37:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q5so7278263wrm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 14:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vJlzoUdOSruMuooum0zqXCZ4vqzkUw0aK8eJrAulkto=;
 b=lcZ2xo0j8jOvqoN8F/g5zwG4s0F4Iyd7VdHE2jP89DVX3q0UytGGl+gtoXjS9Zl+UK
 V0ZX8gjGYtxMPKACi85+My0tVn3HAq2KC56hLkpNvbtSc6PBAESGolwHOCwsN7pvWohI
 0hH7Pm8VXDjKW+PN/1LQfrxMZWJnCf4YHEki4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vJlzoUdOSruMuooum0zqXCZ4vqzkUw0aK8eJrAulkto=;
 b=NWIT6KEG5FkIov5Q8r3if+1lcf4ylidl+QxwAUdlFYAnx357gnkV/2fxsANVbJHfGM
 ZHKd80693FcwsQAOxwoKRxcZEOv91FAYKVyOnit+nQe6wGdJW/HzTVmK/8GGsd2eq5BW
 4vwx5XuP9cXCJ74JmJnVLvhGoM+YAov7k/iDqgiVdw2ImwmemgdmriAY60p5X6usKm+F
 WX8V04ui7PrRvRiSKbiCD2dJW3zp4/7PvMEY6MesOxU22rSnroQ3E0nNgTTVfIYkZ5f6
 b0ZTxjS+dcGDdG9Am0+l6c5r/O3xif+42mGM5arWtGjHOwWxXpfZdxBpBYDIrcYAcsH+
 EhRA==
X-Gm-Message-State: AOAM530XhiseIDxwcMhujW8ZL55pBMOJ5kXgjzXKixl6QRnQnlGENS6z
 2AcAsHX+IqucOPv3R3KbP0ySaIhKEkHCiw==
X-Google-Smtp-Source: ABdhPJwVJyQyTvA53Kd7kmmWDRjnXuaD0lFeKdHw9vSEwaTiOiP9SeBHMrkl/M5xM1cDNyN31pJNtQ==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr480175wru.77.1622756247363;
 Thu, 03 Jun 2021 14:37:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm4380801wrn.38.2021.06.03.14.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:37:26 -0700 (PDT)
Date: Thu, 3 Jun 2021 23:37:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH 11/20] drm/i915/guc: Replace CTB array with
 explicit members
Message-ID: <YLlLlTdvaTGrNmzV@phenom.ffwll.local>
References: <20210603051630.2635-12-matthew.brost@intel.com>
 <202106031503.lHkI3iTz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106031503.lHkI3iTz-lkp@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Matthew Brost <matthew.brost@intel.com>, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 03:25:29PM +0800, kernel test robot wrote:
> Hi Matthew,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on drm-tip/drm-tip]
> [also build test ERROR on drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.13-rc4 next-20210602]
> [cannot apply to drm-intel/for-linux-next drm/drm-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Matthew-Brost/GuC-CTBs-changes-a-few-misc-patches/20210603-130102
> base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
> config: i386-randconfig-a015-20210603 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/0day-ci/linux/commit/7672d3ecddcd8af3a2a856facac49ca93d4bdf9e
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Matthew-Brost/GuC-CTBs-changes-a-few-misc-patches/20210603-130102
>         git checkout 7672d3ecddcd8af3a2a856facac49ca93d4bdf9e
>         # save the attached .config to linux build tree
>         make W=1 ARCH=i386 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/drm/drm_mm.h:49,
>                     from include/drm/drm_vma_manager.h:26,
>                     from include/drm/drm_gem.h:40,
>                     from drivers/gpu/drm/i915/i915_drv.h:54,
>                     from drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:6:
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c: In function 'intel_guc_ct_init':
> >> drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:34:26: error: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'ptrdiff_t' {aka 'int'} [-Werror=format=]
>       34 |  drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
>          |                          ^~~~~~
>    ......
>      215 |    ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>          |    ~~~~~~~~~~~~~~~~~~~    
>          |    |
>          |    ptrdiff_t {aka int}
>    include/drm/drm_print.h:448:56: note: in definition of macro 'drm_dbg'
>      448 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>          |                                                        ^~~
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:214:2: note: in expansion of macro 'CT_DEBUG'
>      214 |  CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "send",
>          |  ^~~~~~~~
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:214:27: note: format string is defined here
>      214 |  CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "send",
>          |                        ~~~^
>          |                           |
>          |                           long unsigned int

32bit ptrdiff vs 64bit printk modifier. You need something else here.

I've stuffed all the previous patches into drm-intel-gt-next. If you
resend with just this one fixed here I'll continue tomorrow (--in-reply-to
resend I mean).

Thanks, Daniel

>          |                        %#x
>    In file included from include/drm/drm_mm.h:49,
>                     from include/drm/drm_vma_manager.h:26,
>                     from include/drm/drm_gem.h:40,
>                     from drivers/gpu/drm/i915/i915_drv.h:54,
>                     from drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:6:
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:34:26: error: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'ptrdiff_t' {aka 'int'} [-Werror=format=]
>       34 |  drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
>          |                          ^~~~~~
>    ......
>      215 |    ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>          |                         ~~~~~~~~~~~~~~~~~~~
>          |                         |
>          |                         ptrdiff_t {aka int}
>    include/drm/drm_print.h:448:56: note: in definition of macro 'drm_dbg'
>      448 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>          |                                                        ^~~
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:214:2: note: in expansion of macro 'CT_DEBUG'
>      214 |  CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "send",
>          |  ^~~~~~~~
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:214:37: note: format string is defined here
>      214 |  CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "send",
>          |                                  ~~~^
>          |                                     |
>          |                                     long unsigned int
>          |                                  %#x
>    In file included from include/drm/drm_mm.h:49,
>                     from include/drm/drm_vma_manager.h:26,
>                     from include/drm/drm_gem.h:40,
>                     from drivers/gpu/drm/i915/i915_drv.h:54,
>                     from drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:6:
> >> drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:34:26: error: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'ptrdiff_t' {aka 'int'} [-Werror=format=]
>       34 |  drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
>          |                          ^~~~~~
>    ......
>      224 |    ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>          |    ~~~~~~~~~~~~~~~~~~~    
>          |    |
>          |    ptrdiff_t {aka int}
>    include/drm/drm_print.h:448:56: note: in definition of macro 'drm_dbg'
>      448 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>          |                                                        ^~~
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:223:2: note: in expansion of macro 'CT_DEBUG'
>      223 |  CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "recv",
>          |  ^~~~~~~~
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:223:27: note: format string is defined here
>      223 |  CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "recv",
>          |                        ~~~^
>          |                           |
>          |                           long unsigned int
>          |                        %#x
>    In file included from include/drm/drm_mm.h:49,
>                     from include/drm/drm_vma_manager.h:26,
>                     from include/drm/drm_gem.h:40,
>                     from drivers/gpu/drm/i915/i915_drv.h:54,
>                     from drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:6:
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:34:26: error: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'ptrdiff_t' {aka 'int'} [-Werror=format=]
>       34 |  drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
>          |                          ^~~~~~
>    ......
>      224 |    ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>          |                         ~~~~~~~~~~~~~~~~~~~
>          |                         |
>          |                         ptrdiff_t {aka int}
>    include/drm/drm_print.h:448:56: note: in definition of macro 'drm_dbg'
>      448 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>          |                                                        ^~~
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:223:2: note: in expansion of macro 'CT_DEBUG'
>      223 |  CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "recv",
>          |  ^~~~~~~~
>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:223:37: note: format string is defined here
>      223 |  CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "recv",
>          |                                  ~~~^
>          |                                     |
>          |                                     long unsigned int
>          |                                  %#x
>    cc1: all warnings being treated as errors
> 
> 
> vim +34 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> 
> f8a58d639dd95b drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko       2017-05-26  @6  #include "i915_drv.h"
> f8a58d639dd95b drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko       2017-05-26   7  #include "intel_guc_ct.h"
> 18c8832523c850 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko       2020-01-11   8  #include "gt/intel_gt.h"
> f8a58d639dd95b drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko       2017-05-26   9  
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  10  static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  11  {
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  12  	return container_of(ct, struct intel_guc, ct);
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  13  }
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  14  
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  15  static inline struct intel_gt *ct_to_gt(struct intel_guc_ct *ct)
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  16  {
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  17  	return guc_to_gt(ct_to_guc(ct));
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  18  }
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  19  
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  20  static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  21  {
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  22  	return ct_to_gt(ct)->i915;
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  23  }
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  24  
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  25  static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  26  {
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  27  	return &ct_to_i915(ct)->drm;
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  28  }
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  29  
> 18c8832523c850 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko       2020-01-11  30  #define CT_ERROR(_ct, _fmt, ...) \
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  31  	drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
> 0a015ff9730c16 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko       2018-03-26  32  #ifdef CONFIG_DRM_I915_DEBUG_GUC
> 77b20896d57e91 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko       2020-01-17  33  #define CT_DEBUG(_ct, _fmt, ...) \
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02 @34  	drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
> 0a015ff9730c16 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko       2018-03-26  35  #else
> 77b20896d57e91 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko       2020-01-17  36  #define CT_DEBUG(...)	do { } while (0)
> 0a015ff9730c16 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko       2018-03-26  37  #endif
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  38  #define CT_PROBE_ERROR(_ct, _fmt, ...) \
> a4c78275ba7e01 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Daniele Ceraolo Spurio 2021-06-02  39  	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
> 0a015ff9730c16 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko       2018-03-26  40  
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
