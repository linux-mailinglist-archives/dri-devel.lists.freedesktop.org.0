Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F03B1CF56
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 01:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B5D10E062;
	Wed,  6 Aug 2025 23:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/RLh/JP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF7410E062
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 23:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754522406; x=1786058406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JfQFotiwf+YIiGXEHoH00+B6mobuy7IsAEk1M1OZK8o=;
 b=W/RLh/JPnU9RpyyAgwVwWWT4f7+kR5wFhFAt8a9LkMDUcnMlGmvzAEwA
 tGu9m3W0HUZrrq3UY/1ECK+SCfTqXCXmE5Hq71mS0WVevXyERrUS3IbX7
 1j39iswD9aY3GSGftx7UXC7IJ7hXqsOASXW5u0ealjkrgye3NbAn9YmJY
 NDX6qkElSdOBNXnZOC6CWV3Etg7vIh0952tVfVrSpb1GACLzTngVHTsDw
 2J8G/NZDgWTptEEc/SE3r/wUqef6wejaQO45eznPiim8pcTPQdOSDWQfd
 dxxKAbpnp2jfELhea/tCWAf4SnhAlu3gAoQKzaugNb4kr4isiEU4f1nn8 A==;
X-CSE-ConnectionGUID: muwZru5qSmWktIvegDnmsQ==
X-CSE-MsgGUID: rwmHsGxERiy5vBhoQ2z4XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67929249"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="67929249"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:20:05 -0700
X-CSE-ConnectionGUID: cxDPklwGSZKPfPAa877EuA==
X-CSE-MsgGUID: b8MQ1i4CSjaj0V4yn9qNWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="202061048"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 06 Aug 2025 16:20:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ujnQL-0002Ao-2E;
 Wed, 06 Aug 2025 23:19:57 +0000
Date: Thu, 7 Aug 2025 07:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 thierry.escande@linaro.org, quic_vgattupa@quicinc.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Ling Xu <quic_lxu5@quicinc.com>,
 stable@kernel.org
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Skip reference for DMA handles
Message-ID: <202508070731.S30957lV-lkp@intel.com>
References: <20250806115114.688814-5-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806115114.688814-5-quic_lxu5@quicinc.com>
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

Hi Ling,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.16 next-20250806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ling-Xu/misc-fastrpc-Save-actual-DMA-size-in-fastrpc_map-structure/20250806-200133
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250806115114.688814-5-quic_lxu5%40quicinc.com
patch subject: [PATCH v2 4/4] misc: fastrpc: Skip reference for DMA handles
config: hexagon-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070731.S30957lV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070731.S30957lV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070731.S30957lV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/fastrpc.c:368:30: warning: unused variable 'sess' [-Wunused-variable]
     368 |         struct fastrpc_session_ctx *sess = fl->sctx;
         |                                     ^~~~
   1 warning generated.


vim +/sess +368 drivers/misc/fastrpc.c

c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  363  
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  364  
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  365  static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
1922c68c56c660 Ling Xu                  2025-08-06  366  			    struct fastrpc_map **ppmap)
c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  367  {
9446fa1683a7e3 Abel Vesa                2022-11-24 @368  	struct fastrpc_session_ctx *sess = fl->sctx;
c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  369  	struct fastrpc_map *map = NULL;
d259063578ed76 Ling Xu                  2025-08-06  370  	struct dma_buf *buf;
9446fa1683a7e3 Abel Vesa                2022-11-24  371  	int ret = -ENOENT;
c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  372  
d259063578ed76 Ling Xu                  2025-08-06  373  	buf = dma_buf_get(fd);
d259063578ed76 Ling Xu                  2025-08-06  374  	if (IS_ERR(buf))
d259063578ed76 Ling Xu                  2025-08-06  375  		return PTR_ERR(buf);
d259063578ed76 Ling Xu                  2025-08-06  376  
9446fa1683a7e3 Abel Vesa                2022-11-24  377  	spin_lock(&fl->lock);
c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  378  	list_for_each_entry(map, &fl->maps, node) {
d259063578ed76 Ling Xu                  2025-08-06  379  		if (map->fd != fd || map->buf != buf)
9446fa1683a7e3 Abel Vesa                2022-11-24  380  			continue;
9446fa1683a7e3 Abel Vesa                2022-11-24  381  
9446fa1683a7e3 Abel Vesa                2022-11-24  382  		*ppmap = map;
9446fa1683a7e3 Abel Vesa                2022-11-24  383  		ret = 0;
9446fa1683a7e3 Abel Vesa                2022-11-24  384  		break;
c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  385  	}
9446fa1683a7e3 Abel Vesa                2022-11-24  386  	spin_unlock(&fl->lock);
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  387  
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  388  	return ret;
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  389  }
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  390  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
