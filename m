Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595BD954A92
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A93610E5FE;
	Fri, 16 Aug 2024 12:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccqst9i5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCB110E5FE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 12:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723812899; x=1755348899;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OSCzB+p00nSVW/dHRk7hsNkN+RR7Pek+A4z85VZMYuU=;
 b=ccqst9i548UGMuEgqqoGlKB6DJ1xnfGu6cc2xDgTaZ5dFCb73wVoGCJj
 RbazYnVEZ15B2oCqSDJFMKAYfRVW0AhzvDbSb9bteZtcsmxuGQuVbx/Un
 tYKEcxyUBdp+yHJFbeVyBKdlcNAptzl1ndKi+3Mgic8uCG9Qpz12BD9LC
 yhk/L83BXqPbboA3/mRdRlPJKyKo4tr6FLME8scAwWfHbkGq8M0dvWF4x
 z6ioI3u53ED50KFoYG0Slqk7/MIzh6k5ZptuEXAzx6+BLWDL0vevKXnFz
 RQcfoDBR61ed2XFzh+V76k+XlYnE1Q/acQsa7pB+8YgzBznc8AdW7bw1s Q==;
X-CSE-ConnectionGUID: 21bkRMkBQiuUEw4TnvQL9w==
X-CSE-MsgGUID: FJSPzrFdSYq8fJKyaPdcWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33259272"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="33259272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 05:54:58 -0700
X-CSE-ConnectionGUID: QDVynEIoRQ270siWOnAKdw==
X-CSE-MsgGUID: m3JGk3tFT6SARvoiCDI1VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="90440914"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 16 Aug 2024 05:54:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sewTk-0006Qs-2B;
 Fri, 16 Aug 2024 12:54:52 +0000
Date: Fri, 16 Aug 2024 20:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, opensource.kernel@vivo.com,
 Huan Yang <link@vivo.com>
Subject: Re: [PATCH v3 5/5] udmabuf: remove udmabuf_folio
Message-ID: <202408162012.cL9pnFSm-lkp@intel.com>
References: <20240813090518.3252469-6-link@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813090518.3252469-6-link@vivo.com>
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

Hi Huan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 033a4691702cdca3a613256b0623b8eeacb4985e]

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/udmabuf-cancel-mmap-page-fault-direct-map-it/20240814-231504
base:   033a4691702cdca3a613256b0623b8eeacb4985e
patch link:    https://lore.kernel.org/r/20240813090518.3252469-6-link%40vivo.com
patch subject: [PATCH v3 5/5] udmabuf: remove udmabuf_folio
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240816/202408162012.cL9pnFSm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162012.cL9pnFSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408162012.cL9pnFSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/udmabuf.c:175: warning: Function parameter or struct member 'ubuf' not described in 'unpin_all_folios'


vim +175 drivers/dma-buf/udmabuf.c

17a7ce20349045 Gurchetan Singh 2019-12-02  165  
d934739404652b Huan Yang       2024-08-13  166  /**
d934739404652b Huan Yang       2024-08-13  167   * unpin_all_folios:		unpin each folio we pinned in create
d934739404652b Huan Yang       2024-08-13  168   * The udmabuf set all folio in folios and pinned it, but for large folio,
d934739404652b Huan Yang       2024-08-13  169   * We may have only used a small portion of the physical in the folio.
d934739404652b Huan Yang       2024-08-13  170   * we will repeatedly, sequentially set the folio into the array to ensure
d934739404652b Huan Yang       2024-08-13  171   * that the offset can index the correct folio at the corresponding index.
d934739404652b Huan Yang       2024-08-13  172   * Hence, we only need to unpin the first iterred folio.
d934739404652b Huan Yang       2024-08-13  173   */
d934739404652b Huan Yang       2024-08-13  174  static void unpin_all_folios(struct udmabuf *ubuf)
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23 @175  {
d934739404652b Huan Yang       2024-08-13  176  	pgoff_t pg;
d934739404652b Huan Yang       2024-08-13  177  	struct folio *last = NULL;
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  178  
d934739404652b Huan Yang       2024-08-13  179  	for (pg = 0; pg < ubuf->pagecount; pg++) {
d934739404652b Huan Yang       2024-08-13  180  		struct folio *tmp = ubuf->folios[pg];
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  181  
d934739404652b Huan Yang       2024-08-13  182  		if (tmp == last)
d934739404652b Huan Yang       2024-08-13  183  			continue;
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  184  
d934739404652b Huan Yang       2024-08-13  185  		last = tmp;
d934739404652b Huan Yang       2024-08-13  186  		unpin_folio(tmp);
d934739404652b Huan Yang       2024-08-13  187  	}
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  188  }
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
