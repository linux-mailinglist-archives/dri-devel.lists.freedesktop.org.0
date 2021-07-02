Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D3A3B9DAC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 10:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD3289EB8;
	Fri,  2 Jul 2021 08:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BAA89EA9;
 Fri,  2 Jul 2021 08:45:05 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1628fU6C020705; Fri, 2 Jul 2021 08:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ZIuH8D+EyX6mFkCkrL5fr3fRYqL0maMZ+VxGvfpCCd4=;
 b=r8YhU07wvPwkTeXab9u4EDENNubb61HstwR3RgAz5optsYszI5LUGEgVFwow2gOKn47S
 25mceYQhz4fgGPOva9bCJUr0ZezUrjPgN/97CZBbAqt0uhNKLBuZxSfxuJjNrISpSSg4
 mo/9GMUdOvYarMcHrEfd6Azq7HDqqVsUD9D7P+aceZpUgDuIeNAvDCPMQ2skGxwIldPt
 lYsmvtlxTFbMH6GyIFs/dzj+y1dNaqKPyICcT+5lvlogt6fBFDjNCt1rxvQXS5H2q86l
 qbOF3tWn1HLPgpBbG7jIqwrZg2BVvFbrJjkOvOyz+dEvsqWhGfe08ELv75Z/73jlUJ3y YA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gy5w38cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 08:44:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1628a5P0185787;
 Fri, 2 Jul 2021 08:44:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 39dv2ca05r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 08:44:55 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1628fB8T001938;
 Fri, 2 Jul 2021 08:44:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 39dv2ca055-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 08:44:55 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1628ip3r029218;
 Fri, 2 Jul 2021 08:44:51 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 02 Jul 2021 01:44:50 -0700
Date: Fri, 2 Jul 2021 11:44:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Chris Wilson <chris@chris-wilson.co.uk>
Subject: [drm-intel:drm-intel-gt-next 8/14]
 drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized
 symbol 'rq'.
Message-ID: <202107020708.XXwacDfG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: kEtmSQlaUxkKPbIqY2OEIX32z96Vda_h
X-Proofpoint-ORIG-GUID: kEtmSQlaUxkKPbIqY2OEIX32z96Vda_h
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
 kbuild-all@lists.01.org, lkp@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
head:   5cd57f676bb946a00275408f0dd0d75dbc466d25
commit: cf586021642d8017cde111b7dd1ba86224e9da51 [8/14] drm/i915/gt: Pipelined page migration
config: x86_64-randconfig-m001-20210630 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized symbol 'rq'.
drivers/gpu/drm/i915/gt/selftest_migrate.c:113 copy() error: uninitialized symbol 'vaddr'.

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:182 __i915_gem_object_lock() error: we previously assumed 'ww' could be null (see line 171)

vim +/rq +102 drivers/gpu/drm/i915/gt/selftest_migrate.c

cf586021642d80 Chris Wilson 2021-06-17   32  static int copy(struct intel_migrate *migrate,
cf586021642d80 Chris Wilson 2021-06-17   33  		int (*fn)(struct intel_migrate *migrate,
cf586021642d80 Chris Wilson 2021-06-17   34  			  struct i915_gem_ww_ctx *ww,
cf586021642d80 Chris Wilson 2021-06-17   35  			  struct drm_i915_gem_object *src,
cf586021642d80 Chris Wilson 2021-06-17   36  			  struct drm_i915_gem_object *dst,
cf586021642d80 Chris Wilson 2021-06-17   37  			  struct i915_request **out),
cf586021642d80 Chris Wilson 2021-06-17   38  		u32 sz, struct rnd_state *prng)
cf586021642d80 Chris Wilson 2021-06-17   39  {
cf586021642d80 Chris Wilson 2021-06-17   40  	struct drm_i915_private *i915 = migrate->context->engine->i915;
cf586021642d80 Chris Wilson 2021-06-17   41  	struct drm_i915_gem_object *src, *dst;
cf586021642d80 Chris Wilson 2021-06-17   42  	struct i915_request *rq;
cf586021642d80 Chris Wilson 2021-06-17   43  	struct i915_gem_ww_ctx ww;
cf586021642d80 Chris Wilson 2021-06-17   44  	u32 *vaddr;
cf586021642d80 Chris Wilson 2021-06-17   45  	int err = 0;

One way to silence these warnings would be to initialize err = -EINVAL.
Then Smatch would know that we goto err_out for an empty list.

cf586021642d80 Chris Wilson 2021-06-17   46  	int i;
cf586021642d80 Chris Wilson 2021-06-17   47  
cf586021642d80 Chris Wilson 2021-06-17   48  	src = create_lmem_or_internal(i915, sz);
cf586021642d80 Chris Wilson 2021-06-17   49  	if (IS_ERR(src))
cf586021642d80 Chris Wilson 2021-06-17   50  		return 0;
cf586021642d80 Chris Wilson 2021-06-17   51  
cf586021642d80 Chris Wilson 2021-06-17   52  	dst = i915_gem_object_create_internal(i915, sz);
cf586021642d80 Chris Wilson 2021-06-17   53  	if (IS_ERR(dst))
cf586021642d80 Chris Wilson 2021-06-17   54  		goto err_free_src;
cf586021642d80 Chris Wilson 2021-06-17   55  
cf586021642d80 Chris Wilson 2021-06-17   56  	for_i915_gem_ww(&ww, err, true) {
cf586021642d80 Chris Wilson 2021-06-17   57  		err = i915_gem_object_lock(src, &ww);
cf586021642d80 Chris Wilson 2021-06-17   58  		if (err)
cf586021642d80 Chris Wilson 2021-06-17   59  			continue;
cf586021642d80 Chris Wilson 2021-06-17   60  
cf586021642d80 Chris Wilson 2021-06-17   61  		err = i915_gem_object_lock(dst, &ww);
cf586021642d80 Chris Wilson 2021-06-17   62  		if (err)
cf586021642d80 Chris Wilson 2021-06-17   63  			continue;
cf586021642d80 Chris Wilson 2021-06-17   64  
cf586021642d80 Chris Wilson 2021-06-17   65  		vaddr = i915_gem_object_pin_map(src, I915_MAP_WC);
cf586021642d80 Chris Wilson 2021-06-17   66  		if (IS_ERR(vaddr)) {
cf586021642d80 Chris Wilson 2021-06-17   67  			err = PTR_ERR(vaddr);
cf586021642d80 Chris Wilson 2021-06-17   68  			continue;
cf586021642d80 Chris Wilson 2021-06-17   69  		}
cf586021642d80 Chris Wilson 2021-06-17   70  
cf586021642d80 Chris Wilson 2021-06-17   71  		for (i = 0; i < sz / sizeof(u32); i++)
cf586021642d80 Chris Wilson 2021-06-17   72  			vaddr[i] = i;
cf586021642d80 Chris Wilson 2021-06-17   73  		i915_gem_object_flush_map(src);
cf586021642d80 Chris Wilson 2021-06-17   74  
cf586021642d80 Chris Wilson 2021-06-17   75  		vaddr = i915_gem_object_pin_map(dst, I915_MAP_WC);
cf586021642d80 Chris Wilson 2021-06-17   76  		if (IS_ERR(vaddr)) {
cf586021642d80 Chris Wilson 2021-06-17   77  			err = PTR_ERR(vaddr);
cf586021642d80 Chris Wilson 2021-06-17   78  			goto unpin_src;
cf586021642d80 Chris Wilson 2021-06-17   79  		}
cf586021642d80 Chris Wilson 2021-06-17   80  
cf586021642d80 Chris Wilson 2021-06-17   81  		for (i = 0; i < sz / sizeof(u32); i++)
cf586021642d80 Chris Wilson 2021-06-17   82  			vaddr[i] = ~i;
cf586021642d80 Chris Wilson 2021-06-17   83  		i915_gem_object_flush_map(dst);
cf586021642d80 Chris Wilson 2021-06-17   84  
cf586021642d80 Chris Wilson 2021-06-17   85  		err = fn(migrate, &ww, src, dst, &rq);
cf586021642d80 Chris Wilson 2021-06-17   86  		if (!err)
cf586021642d80 Chris Wilson 2021-06-17   87  			continue;

Does fn() initialize "rq" on the success path?  Anyway Smatch would
complain anyway because it thinks the list could be empty or that we
might hit and early continue for everything.

cf586021642d80 Chris Wilson 2021-06-17   88  
cf586021642d80 Chris Wilson 2021-06-17   89  		if (err != -EDEADLK && err != -EINTR && err != -ERESTARTSYS)
cf586021642d80 Chris Wilson 2021-06-17   90  			pr_err("%ps failed, size: %u\n", fn, sz);
cf586021642d80 Chris Wilson 2021-06-17   91  		if (rq) {
cf586021642d80 Chris Wilson 2021-06-17   92  			i915_request_wait(rq, 0, HZ);
cf586021642d80 Chris Wilson 2021-06-17   93  			i915_request_put(rq);
cf586021642d80 Chris Wilson 2021-06-17   94  		}
cf586021642d80 Chris Wilson 2021-06-17   95  		i915_gem_object_unpin_map(dst);
cf586021642d80 Chris Wilson 2021-06-17   96  unpin_src:
cf586021642d80 Chris Wilson 2021-06-17   97  		i915_gem_object_unpin_map(src);
cf586021642d80 Chris Wilson 2021-06-17   98  	}
cf586021642d80 Chris Wilson 2021-06-17   99  	if (err)
cf586021642d80 Chris Wilson 2021-06-17  100  		goto err_out;
cf586021642d80 Chris Wilson 2021-06-17  101  
cf586021642d80 Chris Wilson 2021-06-17 @102  	if (rq) {
cf586021642d80 Chris Wilson 2021-06-17  103  		if (i915_request_wait(rq, 0, HZ) < 0) {
cf586021642d80 Chris Wilson 2021-06-17  104  			pr_err("%ps timed out, size: %u\n", fn, sz);
cf586021642d80 Chris Wilson 2021-06-17  105  			err = -ETIME;
cf586021642d80 Chris Wilson 2021-06-17  106  		}
cf586021642d80 Chris Wilson 2021-06-17  107  		i915_request_put(rq);
cf586021642d80 Chris Wilson 2021-06-17  108  	}
cf586021642d80 Chris Wilson 2021-06-17  109  
cf586021642d80 Chris Wilson 2021-06-17  110  	for (i = 0; !err && i < sz / PAGE_SIZE; i++) {
cf586021642d80 Chris Wilson 2021-06-17  111  		int x = i * 1024 + i915_prandom_u32_max_state(1024, prng);
cf586021642d80 Chris Wilson 2021-06-17  112  
cf586021642d80 Chris Wilson 2021-06-17 @113  		if (vaddr[x] != x) {
cf586021642d80 Chris Wilson 2021-06-17  114  			pr_err("%ps failed, size: %u, offset: %zu\n",
cf586021642d80 Chris Wilson 2021-06-17  115  			       fn, sz, x * sizeof(u32));
cf586021642d80 Chris Wilson 2021-06-17  116  			igt_hexdump(vaddr + i * 1024, 4096);
cf586021642d80 Chris Wilson 2021-06-17  117  			err = -EINVAL;
cf586021642d80 Chris Wilson 2021-06-17  118  		}
cf586021642d80 Chris Wilson 2021-06-17  119  	}
cf586021642d80 Chris Wilson 2021-06-17  120  
cf586021642d80 Chris Wilson 2021-06-17  121  	i915_gem_object_unpin_map(dst);
cf586021642d80 Chris Wilson 2021-06-17  122  	i915_gem_object_unpin_map(src);
cf586021642d80 Chris Wilson 2021-06-17  123  
cf586021642d80 Chris Wilson 2021-06-17  124  err_out:
cf586021642d80 Chris Wilson 2021-06-17  125  	i915_gem_object_put(dst);
cf586021642d80 Chris Wilson 2021-06-17  126  err_free_src:
cf586021642d80 Chris Wilson 2021-06-17  127  	i915_gem_object_put(src);
cf586021642d80 Chris Wilson 2021-06-17  128  
cf586021642d80 Chris Wilson 2021-06-17  129  	return err;
cf586021642d80 Chris Wilson 2021-06-17  130  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

