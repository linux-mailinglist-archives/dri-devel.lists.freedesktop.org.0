Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C50293B9E41
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 11:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5256E029;
	Fri,  2 Jul 2021 09:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CC089FEC;
 Fri,  2 Jul 2021 09:30:46 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1629DEDZ007865; Fri, 2 Jul 2021 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=y8XH+0UxgcFcaPtHQidy9BG2OpEHpi6oH21KE651syM=;
 b=Sv+gVpHwQxbH7ieQrvFb1uE74mcwusgbzTFL0r6CZV4rbXJeZSmR1erIcluD/VAq0ZY7
 OTLwYSjO0syEsGu5B4p2TBYs8QTUAKCOlQ0aHyLYXvYRqV5p8GkoAxOi0933WKI0DVYH
 7RpJ80gTug0OeFirZlnJ9kSlq8IP73DD8VpWtph/bVZe/QbPOhHysVKIaZNYFREZKd0i
 uxMFJP1erSVcK7BU0W6+CMT+NiZ4auSQ4wwsmuhbqoj5zKkdmGwfzErtxIwkhY6Vzxvu
 qSsiCrhWl4QkxnTfm+cAQDobjapBx5L7T76DQ8U9oE+v0/xas78DhDSoVt+YghsLIfQ+ 7A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gy5w3bh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 09:30:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1629U7NC094155;
 Fri, 2 Jul 2021 09:30:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 39dsc61j0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 09:30:43 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1629UgPm096744;
 Fri, 2 Jul 2021 09:30:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 39dsc61hyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 09:30:42 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1629UewB004723;
 Fri, 2 Jul 2021 09:30:40 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 02 Jul 2021 02:30:40 -0700
Date: Fri, 2 Jul 2021 12:30:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Matthew Auld <matthew.auld@intel.com>
Subject: [drm-intel:drm-intel-gt-next 7/8]
 drivers/gpu/drm/i915/selftests/intel_memory_region.c:227 igt_mock_reserve()
 error: 'mem' dereferencing possible ERR_PTR()
Message-ID: <202107020223.RidpjHxP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: uv9V24ZAzt2nG0CPqBZBcRBJh7uoR-OL
X-Proofpoint-ORIG-GUID: uv9V24ZAzt2nG0CPqBZBcRBJh7uoR-OL
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org, lkp@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
head:   13c2ceb6addb6b14468e09b75832c98909eed8e7
commit: d53ec322dc7de32a59bf1c2a56b93e90fc2f1c28 [7/8] drm/i915/ttm: switch over to ttm_buddy_man
config: x86_64-randconfig-m001-20210630 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/selftests/intel_memory_region.c:227 igt_mock_reserve() error: 'mem' dereferencing possible ERR_PTR()

vim +/mem +227 drivers/gpu/drm/i915/selftests/intel_memory_region.c

adeca641bcb64f Abdiel Janulgue 2021-01-27  153  static int igt_mock_reserve(void *arg)
adeca641bcb64f Abdiel Janulgue 2021-01-27  154  {
adeca641bcb64f Abdiel Janulgue 2021-01-27  155  	struct intel_memory_region *mem = arg;
d53ec322dc7de3 Matthew Auld    2021-06-16  156  	struct drm_i915_private *i915 = mem->i915;
adeca641bcb64f Abdiel Janulgue 2021-01-27  157  	resource_size_t avail = resource_size(&mem->region);
adeca641bcb64f Abdiel Janulgue 2021-01-27  158  	struct drm_i915_gem_object *obj;
adeca641bcb64f Abdiel Janulgue 2021-01-27  159  	const u32 chunk_size = SZ_32M;
adeca641bcb64f Abdiel Janulgue 2021-01-27  160  	u32 i, offset, count, *order;
adeca641bcb64f Abdiel Janulgue 2021-01-27  161  	u64 allocated, cur_avail;
adeca641bcb64f Abdiel Janulgue 2021-01-27  162  	I915_RND_STATE(prng);
adeca641bcb64f Abdiel Janulgue 2021-01-27  163  	LIST_HEAD(objects);
adeca641bcb64f Abdiel Janulgue 2021-01-27  164  	int err = 0;
adeca641bcb64f Abdiel Janulgue 2021-01-27  165  
adeca641bcb64f Abdiel Janulgue 2021-01-27  166  	count = avail / chunk_size;
adeca641bcb64f Abdiel Janulgue 2021-01-27  167  	order = i915_random_order(count, &prng);
adeca641bcb64f Abdiel Janulgue 2021-01-27  168  	if (!order)
adeca641bcb64f Abdiel Janulgue 2021-01-27  169  		return 0;
adeca641bcb64f Abdiel Janulgue 2021-01-27  170  
d53ec322dc7de3 Matthew Auld    2021-06-16  171  	mem = mock_region_create(i915, 0, SZ_2G, I915_GTT_PAGE_SIZE_4K, 0);
d53ec322dc7de3 Matthew Auld    2021-06-16  172  	if (IS_ERR(mem)) {
d53ec322dc7de3 Matthew Auld    2021-06-16  173  		pr_err("failed to create memory region\n");
d53ec322dc7de3 Matthew Auld    2021-06-16  174  		err = PTR_ERR(mem);
d53ec322dc7de3 Matthew Auld    2021-06-16  175  		goto out_close;

"mem" is an error pointer.

d53ec322dc7de3 Matthew Auld    2021-06-16  176  	}
d53ec322dc7de3 Matthew Auld    2021-06-16  177  
adeca641bcb64f Abdiel Janulgue 2021-01-27  178  	/* Reserve a bunch of ranges within the region */
adeca641bcb64f Abdiel Janulgue 2021-01-27  179  	for (i = 0; i < count; ++i) {
adeca641bcb64f Abdiel Janulgue 2021-01-27  180  		u64 start = order[i] * chunk_size;
adeca641bcb64f Abdiel Janulgue 2021-01-27  181  		u64 size = i915_prandom_u32_max_state(chunk_size, &prng);
adeca641bcb64f Abdiel Janulgue 2021-01-27  182  
adeca641bcb64f Abdiel Janulgue 2021-01-27  183  		/* Allow for some really big holes */
adeca641bcb64f Abdiel Janulgue 2021-01-27  184  		if (!size)
adeca641bcb64f Abdiel Janulgue 2021-01-27  185  			continue;
adeca641bcb64f Abdiel Janulgue 2021-01-27  186  
adeca641bcb64f Abdiel Janulgue 2021-01-27  187  		size = round_up(size, PAGE_SIZE);
adeca641bcb64f Abdiel Janulgue 2021-01-27  188  		offset = igt_random_offset(&prng, 0, chunk_size, size,
adeca641bcb64f Abdiel Janulgue 2021-01-27  189  					   PAGE_SIZE);
adeca641bcb64f Abdiel Janulgue 2021-01-27  190  
adeca641bcb64f Abdiel Janulgue 2021-01-27  191  		err = intel_memory_region_reserve(mem, start + offset, size);
adeca641bcb64f Abdiel Janulgue 2021-01-27  192  		if (err) {
adeca641bcb64f Abdiel Janulgue 2021-01-27  193  			pr_err("%s failed to reserve range", __func__);
adeca641bcb64f Abdiel Janulgue 2021-01-27  194  			goto out_close;
adeca641bcb64f Abdiel Janulgue 2021-01-27  195  		}
adeca641bcb64f Abdiel Janulgue 2021-01-27  196  
adeca641bcb64f Abdiel Janulgue 2021-01-27  197  		/* XXX: maybe sanity check the block range here? */
adeca641bcb64f Abdiel Janulgue 2021-01-27  198  		avail -= size;
adeca641bcb64f Abdiel Janulgue 2021-01-27  199  	}
adeca641bcb64f Abdiel Janulgue 2021-01-27  200  
adeca641bcb64f Abdiel Janulgue 2021-01-27  201  	/* Try to see if we can allocate from the remaining space */
adeca641bcb64f Abdiel Janulgue 2021-01-27  202  	allocated = 0;
adeca641bcb64f Abdiel Janulgue 2021-01-27  203  	cur_avail = avail;
adeca641bcb64f Abdiel Janulgue 2021-01-27  204  	do {
adeca641bcb64f Abdiel Janulgue 2021-01-27  205  		u32 size = i915_prandom_u32_max_state(cur_avail, &prng);
adeca641bcb64f Abdiel Janulgue 2021-01-27  206  
adeca641bcb64f Abdiel Janulgue 2021-01-27  207  		size = max_t(u32, round_up(size, PAGE_SIZE), PAGE_SIZE);
adeca641bcb64f Abdiel Janulgue 2021-01-27  208  		obj = igt_object_create(mem, &objects, size, 0);
adeca641bcb64f Abdiel Janulgue 2021-01-27  209  		if (IS_ERR(obj)) {
d53ec322dc7de3 Matthew Auld    2021-06-16  210  			if (PTR_ERR(obj) == -ENXIO)
adeca641bcb64f Abdiel Janulgue 2021-01-27  211  				break;
d53ec322dc7de3 Matthew Auld    2021-06-16  212  
adeca641bcb64f Abdiel Janulgue 2021-01-27  213  			err = PTR_ERR(obj);
adeca641bcb64f Abdiel Janulgue 2021-01-27  214  			goto out_close;
adeca641bcb64f Abdiel Janulgue 2021-01-27  215  		}
adeca641bcb64f Abdiel Janulgue 2021-01-27  216  		cur_avail -= size;
adeca641bcb64f Abdiel Janulgue 2021-01-27  217  		allocated += size;
adeca641bcb64f Abdiel Janulgue 2021-01-27  218  	} while (1);
adeca641bcb64f Abdiel Janulgue 2021-01-27  219  
adeca641bcb64f Abdiel Janulgue 2021-01-27  220  	if (allocated != avail) {
adeca641bcb64f Abdiel Janulgue 2021-01-27  221  		pr_err("%s mismatch between allocation and free space", __func__);
adeca641bcb64f Abdiel Janulgue 2021-01-27  222  		err = -EINVAL;
adeca641bcb64f Abdiel Janulgue 2021-01-27  223  	}
adeca641bcb64f Abdiel Janulgue 2021-01-27  224  
adeca641bcb64f Abdiel Janulgue 2021-01-27  225  out_close:
adeca641bcb64f Abdiel Janulgue 2021-01-27  226  	kfree(order);
adeca641bcb64f Abdiel Janulgue 2021-01-27 @227  	close_objects(mem, &objects);
                                                                      ^^^
Dereferenced inside function.

d53ec322dc7de3 Matthew Auld    2021-06-16  228  	intel_memory_region_put(mem);
adeca641bcb64f Abdiel Janulgue 2021-01-27  229  	return err;
adeca641bcb64f Abdiel Janulgue 2021-01-27  230  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

