Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ECE575A07
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 05:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC67E10E361;
	Fri, 15 Jul 2022 03:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C1C10E361
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 03:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657856347; x=1689392347;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HwTOzRZgpchjVAnzo1ayeKj1m6sUUSaoUdc2ecYTIgc=;
 b=eEXIDnOFLPxRzzX5gM/P8WNytCmw35B4sv+YD+c6v3ZY+SPYLY4AL6er
 2e8YZZQYli3rbEj3b2ITYsunqWUhmK+LEPkBNtVgUXjATyqPtJ6DsxJhX
 HAM/+Dtb5qjw7IAJQ6Ht3PE0pCJ7vxcOyQg4PCT04+/qTw9V3n5/APT+9
 qAYU+6FN3EygD9Qj08oEdmfO1feuKF654kijCNLbwtMcX5hleqXE263/7
 f2XWsz+lZeE+e6CIqlcaMvrWIB9l32mFJBXoOkQ3mow7xYbqzxAYg256S
 dhz/xHoOENKOydDegi8zS0Y9G9mpf1NWZkt8WqZBSRWFfJ9ndGDX1TNDp g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="347370605"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; d="scan'208";a="347370605"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 20:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; d="scan'208";a="664035241"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2022 20:39:00 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oCCAN-0001UL-FC;
 Fri, 15 Jul 2022 03:38:59 +0000
Date: Fri, 15 Jul 2022 11:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v1 4/6] dma-buf: Acquire wait-wound context on attachment
Message-ID: <202207151112.Yi2gyyRX-lkp@intel.com>
References: <20220715005244.42198-5-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715005244.42198-5-dmitry.osipenko@collabora.com>
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
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20220714]
[also build test ERROR on v5.19-rc6]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next media-tree/master linus/master v5.19-rc6 v5.19-rc5 v5.19-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/Move-all-drivers-to-a-common-dma-buf-locking-convention/20220715-085556
base:    37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220715/202207151112.Yi2gyyRX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/ed55f535b8492ef30d7e94aae5811c772403ab4f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/Move-all-drivers-to-a-common-dma-buf-locking-convention/20220715-085556
        git checkout ed55f535b8492ef30d7e94aae5811c772403ab4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_gem_ww.c:52:6: error: no previous prototype for 'i915_gem_ww_ctx_fini2' [-Werror=missing-prototypes]
      52 | void i915_gem_ww_ctx_fini2(struct i915_gem_ww_ctx *ww)
         |      ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/i915_gem_ww_ctx_fini2 +52 drivers/gpu/drm/i915/i915_gem_ww.c

    51	
  > 52	void i915_gem_ww_ctx_fini2(struct i915_gem_ww_ctx *ww)
    53	{
    54		i915_gem_ww_ctx_unlock_all(ww);
    55		WARN_ON(ww->contended);
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
