Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D92131DFE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 04:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8366E7D5;
	Tue,  7 Jan 2020 03:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83616E7D5;
 Tue,  7 Jan 2020 03:32:17 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0073TkTH035398;
 Tue, 7 Jan 2020 03:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=/GSK+vjilBpwNYvAPuJCz5bn9ib/JaZA+xLStA4qQXM=;
 b=kyB9K5p6gmNEgHAqQ/Xhfq2HEf5ho8MsTwWbjVZUsvRzgXqFN7Zh0DuuYyu9gnFw+0uk
 NfBAHEpQJGShQcc121JE7Nh4Nz336H4O5Sa5bS1/E+RKcgmVRsR598SavGQqvVyokb4R
 BAZoM+wjwLC+i+jVYdl95CS+i2m7o1ea0DqGh+pMP7mGOgEDEaVnZdbRu71uA2TMYMou
 FsLVGNEPccfuTn4dm0YysSMor6QVvHbrSTqVYCxEBQOyZCq1THKU6Cd4Gbi4xBIU7Tx1
 3eUT9KXMXP1QJaYz/bqCalC2S8ujVyuqHF4Sh6C2KVzUWOZF2Fu4QBquZzAMl6rwYnUF aA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2xajnptsu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Jan 2020 03:32:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0073TgT0129555;
 Tue, 7 Jan 2020 03:32:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2xb4v271e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Jan 2020 03:32:07 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0073W6B1000421;
 Tue, 7 Jan 2020 03:32:06 GMT
Received: from kadam (/129.205.23.165) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 06 Jan 2020 19:32:05 -0800
Date: Tue, 7 Jan 2020 06:31:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Chris Wilson <chris@chris-wilson.co.uk>
Subject: [drm-intel:drm-intel-next-queued 20/20]
 drivers/gpu/drm/i915/gt/intel_lrc.c:4613 intel_execlists_create_virtual()
 warn: assigning (-2) to unsigned variable 've->base.uabi_instance'
Message-ID: <20200107033156.GH3889@kadam>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001070026
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001070026
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-next-queued
head:   f75fc37b5e70b75f21550410f88e2379648120e2
commit: f75fc37b5e70b75f21550410f88e2379648120e2 [20/20] drm/i915/gt: Mark up virtual engine uabi_instance

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/intel_lrc.c:4613 intel_execlists_create_virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'

Old smatch warnings:
drivers/gpu/drm/i915/gt/intel_lrc.c:4612 intel_execlists_create_virtual() warn: assigning (-2) to unsigned variable 've->base.instance'

git remote add drm-intel git://anongit.freedesktop.org/drm-intel
git remote update drm-intel
git checkout f75fc37b5e70b75f21550410f88e2379648120e2
vim +4613 drivers/gpu/drm/i915/gt/intel_lrc.c

6d06779e867243 Chris Wilson   2019-05-21  4587  struct intel_context *
e6ba76480299a0 Chris Wilson   2019-12-21  4588  intel_execlists_create_virtual(struct intel_engine_cs **siblings,
6d06779e867243 Chris Wilson   2019-05-21  4589  			       unsigned int count)
6d06779e867243 Chris Wilson   2019-05-21  4590  {
6d06779e867243 Chris Wilson   2019-05-21  4591  	struct virtual_engine *ve;
6d06779e867243 Chris Wilson   2019-05-21  4592  	unsigned int n;
6d06779e867243 Chris Wilson   2019-05-21  4593  	int err;
6d06779e867243 Chris Wilson   2019-05-21  4594  
6d06779e867243 Chris Wilson   2019-05-21  4595  	if (count == 0)
6d06779e867243 Chris Wilson   2019-05-21  4596  		return ERR_PTR(-EINVAL);
6d06779e867243 Chris Wilson   2019-05-21  4597  
6d06779e867243 Chris Wilson   2019-05-21  4598  	if (count == 1)
e6ba76480299a0 Chris Wilson   2019-12-21  4599  		return intel_context_create(siblings[0]);
6d06779e867243 Chris Wilson   2019-05-21  4600  
6d06779e867243 Chris Wilson   2019-05-21  4601  	ve = kzalloc(struct_size(ve, siblings, count), GFP_KERNEL);
6d06779e867243 Chris Wilson   2019-05-21  4602  	if (!ve)
6d06779e867243 Chris Wilson   2019-05-21  4603  		return ERR_PTR(-ENOMEM);
6d06779e867243 Chris Wilson   2019-05-21  4604  
e6ba76480299a0 Chris Wilson   2019-12-21  4605  	ve->base.i915 = siblings[0]->i915;
f937f5613b6f10 Tvrtko Ursulin 2019-06-21  4606  	ve->base.gt = siblings[0]->gt;
20af04f3dd5679 Chris Wilson   2019-10-08  4607  	ve->base.uncore = siblings[0]->uncore;
6d06779e867243 Chris Wilson   2019-05-21  4608  	ve->base.id = -1;
f75fc37b5e70b7 Chris Wilson   2020-01-06  4609  
6d06779e867243 Chris Wilson   2019-05-21  4610  	ve->base.class = OTHER_CLASS;
6d06779e867243 Chris Wilson   2019-05-21  4611  	ve->base.uabi_class = I915_ENGINE_CLASS_INVALID;
6d06779e867243 Chris Wilson   2019-05-21  4612  	ve->base.instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
f75fc37b5e70b7 Chris Wilson   2020-01-06 @4613  	ve->base.uabi_instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
6d06779e867243 Chris Wilson   2019-05-21  4614  
44d89409a12eb8 Chris Wilson   2019-06-18  4615  	/*
44d89409a12eb8 Chris Wilson   2019-06-18  4616  	 * The decision on whether to submit a request using semaphores
44d89409a12eb8 Chris Wilson   2019-06-18  4617  	 * depends on the saturated state of the engine. We only compute
44d89409a12eb8 Chris Wilson   2019-06-18  4618  	 * this during HW submission of the request, and we need for this
44d89409a12eb8 Chris Wilson   2019-06-18  4619  	 * state to be globally applied to all requests being submitted
44d89409a12eb8 Chris Wilson   2019-06-18  4620  	 * to this engine. Virtual engines encompass more than one physical

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
