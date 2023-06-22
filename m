Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17473AD25
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 01:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2117410E06F;
	Thu, 22 Jun 2023 23:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A8F10E06F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687476230; x=1719012230;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=JNwYBh0Urzcdz3q/+qItym33NbcdoT2hkhoe/UP/Mmk=;
 b=MQwNIg7aQJxgTSZmE2GVRz4lkBRgnZsc+wZajtnBGoU9rC8RAgIGa/Rw
 5rLI6akhcbNpvNZlCJA3oOnkXwQUhRWDK7K5HI5Gqc2fdkv6jP61LRUYI
 nbkgphWkzUEfnRMFwNw1F+I6gIdlDyxJdOcvtDEPGI33w8UfzZ5zTLxnl
 Uk8S59P1ZNQ3W6JIL3AO/HPIwkEdXvsD3FvM6Tt6M2siHny3ERkCWorDc
 77oNzcbqbSWK4Q8chZfwG0vTB6mygT2dBQ1CX/Kd33tuPKa/aAKD0nQy9
 CceisPvQwdVracL8wI/vQ8TS++MnD/Wd8r4C6YghXa4IDySN0LPFJZJDD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="340239466"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="340239466"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 16:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="828159236"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="828159236"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2023 16:23:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qCTeW-0007of-02;
 Thu, 22 Jun 2023 23:23:48 +0000
Date: Fri, 23 Jun 2023 07:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [drm-misc:for-linux-next-fixes 1/1]
 drivers/gpu/drm/ttm/ttm_resource.c:117:40: warning: suggest parentheses
 around '&&' within '||'
Message-ID: <202306230747.Ws6Fhv2o-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next-fixes
head:   4481913607e58196c48a4fef5e6f45350684ec3c
commit: 4481913607e58196c48a4fef5e6f45350684ec3c [1/1] drm/ttm: fix bulk_move corruption when adding a entry
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230623/202306230747.Ws6Fhv2o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230747.Ws6Fhv2o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230747.Ws6Fhv2o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/io.h:10,
                    from include/linux/iosys-map.h:10,
                    from drivers/gpu/drm/ttm/ttm_resource.c:25:
   drivers/gpu/drm/ttm/ttm_resource.c: In function 'ttm_lru_bulk_move_del':
>> drivers/gpu/drm/ttm/ttm_resource.c:117:40: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
     117 |                      pos->first == res && pos->last == res)) {
         |                      ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^


vim +117 drivers/gpu/drm/ttm/ttm_resource.c

  > 25	#include <linux/iosys-map.h>
    26	#include <linux/io-mapping.h>
    27	#include <linux/scatterlist.h>
    28	
    29	#include <drm/ttm/ttm_bo.h>
    30	#include <drm/ttm/ttm_placement.h>
    31	#include <drm/ttm/ttm_resource.h>
    32	
    33	/**
    34	 * ttm_lru_bulk_move_init - initialize a bulk move structure
    35	 * @bulk: the structure to init
    36	 *
    37	 * For now just memset the structure to zero.
    38	 */
    39	void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
    40	{
    41		memset(bulk, 0, sizeof(*bulk));
    42	}
    43	EXPORT_SYMBOL(ttm_lru_bulk_move_init);
    44	
    45	/**
    46	 * ttm_lru_bulk_move_tail - bulk move range of resources to the LRU tail.
    47	 *
    48	 * @bulk: bulk move structure
    49	 *
    50	 * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
    51	 * resource order never changes. Should be called with &ttm_device.lru_lock held.
    52	 */
    53	void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
    54	{
    55		unsigned i, j;
    56	
    57		for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
    58			for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
    59				struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
    60				struct ttm_resource_manager *man;
    61	
    62				if (!pos->first)
    63					continue;
    64	
    65				lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
    66				dma_resv_assert_held(pos->first->bo->base.resv);
    67				dma_resv_assert_held(pos->last->bo->base.resv);
    68	
    69				man = ttm_manager_type(pos->first->bo->bdev, i);
    70				list_bulk_move_tail(&man->lru[j], &pos->first->lru,
    71						    &pos->last->lru);
    72			}
    73		}
    74	}
    75	EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
    76	
    77	/* Return the bulk move pos object for this resource */
    78	static struct ttm_lru_bulk_move_pos *
    79	ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
    80	{
    81		return &bulk->pos[res->mem_type][res->bo->priority];
    82	}
    83	
    84	/* Move the resource to the tail of the bulk move range */
    85	static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
    86					       struct ttm_resource *res)
    87	{
    88		if (pos->last != res) {
    89			if (pos->first == res)
    90				pos->first = list_next_entry(res, lru);
    91			list_move(&res->lru, &pos->last->lru);
    92			pos->last = res;
    93		}
    94	}
    95	
    96	/* Add the resource to a bulk_move cursor */
    97	static void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
    98					  struct ttm_resource *res)
    99	{
   100		struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
   101	
   102		if (!pos->first) {
   103			pos->first = res;
   104			pos->last = res;
   105		} else {
   106			ttm_lru_bulk_move_pos_tail(pos, res);
   107		}
   108	}
   109	
   110	/* Remove the resource from a bulk_move range */
   111	static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
   112					  struct ttm_resource *res)
   113	{
   114		struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
   115	
   116		if (unlikely(WARN_ON(!pos->first || !pos->last) ||
 > 117			     pos->first == res && pos->last == res)) {
   118			pos->first = NULL;
   119			pos->last = NULL;
   120		} else if (pos->first == res) {
   121			pos->first = list_next_entry(res, lru);
   122		} else if (pos->last == res) {
   123			pos->last = list_prev_entry(res, lru);
   124		} else {
   125			list_move(&res->lru, &pos->last->lru);
   126		}
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
