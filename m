Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5961A97F4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 11:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80146E924;
	Wed, 15 Apr 2020 09:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B216F6E923;
 Wed, 15 Apr 2020 09:07:52 +0000 (UTC)
IronPort-SDR: S/kW969uv6uWbupWxzjJmqD7+iC/tnbmowY4L923BDsIyX0j0RBgk3vmzRJ5ppAnfMs1biy1gF
 56sktdp47Jfw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 02:07:52 -0700
IronPort-SDR: dIcvUqmm8vkltmzBbRt7swG9EIHcpliBK18dHSes44YOxPl9GSHu+CpHbMxzexYHs+shu+VVQy
 da/XylUQ7VEQ==
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="427370602"
Received: from ssolodk-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.48.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 02:07:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org
Subject: Re: [PATCH] drm/i915/gt: remove redundant assignment to variable x
In-Reply-To: <43eb0cbb-9bf0-c99a-470d-8121c3108a5e@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200414092359.GC1163@kadam>
 <43eb0cbb-9bf0-c99a-470d-8121c3108a5e@canonical.com>
Date: Wed, 15 Apr 2020 12:07:44 +0300
Message-ID: <87blnt5d7j.fsf@intel.com>
MIME-Version: 1.0
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Apr 2020, Colin Ian King <colin.king@canonical.com> wrote:
> Hi Dan,
>
> I'd post a revert, but I don't seem to see an upstream commit for this
> this to revert against. What's the revert policy in these cases? Or can
> the patch be just ignored by the maintainers so it's not applied?

It has not been applied, and will be ignored, in part thanks to the
report.

However I think Dan's report is misleading in that it looks like it's
about a commit while I think it should emphasize that it's a pre-merge
report on the patch on the mailing list.

BR,
Jani.



>
> Colin
>
>
> On 14/04/2020 10:23, Dan Carpenter wrote:
>> Hi Colin,
>> 
>> url:    https://github.com/0day-ci/linux/commits/Colin-King/drm-i915-gt-remove-redundant-assignment-to-variable-x/20200411-032731
>> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
>> 
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> 
>> smatch warnings:
>> drivers/gpu/drm/i915/gt/intel_engine_cs.c:1210 print_request() error: uninitialized symbol 'x'.
>> 
>> # https://github.com/0day-ci/linux/commit/6ee08d455bba0066e8f5f276dcd43d9e3e594dc5
>> git remote add linux-review https://github.com/0day-ci/linux
>> git remote update linux-review
>> git checkout 6ee08d455bba0066e8f5f276dcd43d9e3e594dc5
>> vim +/x +1210 drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> 
>> f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2017-10-09  1202  static void print_request(struct drm_printer *m,
>> e61e0f51ba7974 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-02-21  1203  			  struct i915_request *rq,
>> f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2017-10-09  1204  			  const char *prefix)
>> f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2017-10-09  1205  {
>> ab2681512b4c10 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-03-14  1206  	const char *name = rq->fence.ops->get_timeline_name(&rq->fence);
>> 96d4f03c20d04c drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-05-17  1207  	char buf[80] = "";
>> 6ee08d455bba00 drivers/gpu/drm/i915/gt/intel_engine_cs.c Colin Ian King 2020-04-10  1208  	int x;
>>                                                                                                 ^^^^^
>> 
>> 247870ac8ea729 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-04-24  1209  
>> 247870ac8ea729 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-04-24 @1210  	x = print_sched_attr(rq->i915, &rq->sched.attr, buf, x, sizeof(buf));
>>                                                                                                                                                      ^
>> Uninitialized variable
>> 
>> ab2681512b4c10 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-03-14  1211  
>> b300fde8965fdd drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-02-26  1212  	drm_printf(m, "%s %llx:%llx%s%s %s @ %dms: %s\n",
>> b7268c5eed0ab4 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-04-18  1213  		   prefix,
>> b300fde8965fdd drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-02-26  1214  		   rq->fence.context, rq->fence.seqno,
>> 8547444137ec61 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-01-29  1215  		   i915_request_completed(rq) ? "!" :
>> 8547444137ec61 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-01-29  1216  		   i915_request_started(rq) ? "*" :
>> 8547444137ec61 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-01-29  1217  		   "",
>> 8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   2019-05-01  1218  		   test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>> 8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   2019-05-01  1219  			    &rq->fence.flags) ? "+" :
>> 52c0fdb25c7c91 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-01-29  1220  		   test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>> 8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   2019-05-01  1221  			    &rq->fence.flags) ? "-" :
>> 8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   2019-05-01  1222  		   "",
>> 247870ac8ea729 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-04-24  1223  		   buf,
>> f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2017-10-09  1224  		   jiffies_to_msecs(jiffies - rq->emitted_jiffies),
>> ab2681512b4c10 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-03-14  1225  		   name);
>> f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2017-10-09  1226  }
>> 
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
