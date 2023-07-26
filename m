Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B6C763CC7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 18:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECF910E166;
	Wed, 26 Jul 2023 16:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F5D8914B;
 Wed, 26 Jul 2023 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690389876; x=1721925876;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4yYCYMS1X5+8+dKZLjO0tNUiV3DOrWeoyubjzbdu4rY=;
 b=QYmyWShxHwr52uPIUZ8l/V+HHrXshhcKDHfB3v9LBiQejEX1WHPMYWwy
 w4IqQKSxXslelUQYy+kGwnyIU6WC09fCfMcNiAPqigVS8adMk2ooflvgi
 9g7tG/45We64uirdScr2TAAXpSsmHA7FL68/6XurwtGasQ+ppPnUJfIRb
 XlOMkw0P3k+kYPUka3zkIwXcyrSF278CmihtjgzMH/AiTqtXrWtk6zDN/
 i/Dvh9S+Ud2job5DMFqVGyOis56wnnKNaPhW95EbsnVObsQdVY/gM11e/
 l6Y36eTVvwNOj8wae/laaXytgf17/4G66aIiPfzumHi0DrutwsNj6mYZ0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370747897"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="370747897"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="900512351"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="900512351"
Received: from spsmyth-mobl1.ger.corp.intel.com (HELO [10.213.229.32])
 ([10.213.229.32])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:44:30 -0700
Message-ID: <8959f665-4353-3630-a6c7-5dca60959faa@linux.intel.com>
Date: Wed, 26 Jul 2023 17:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 16/17] cgroup/drm: Expose memory stats
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-17-tvrtko.ursulin@linux.intel.com>
 <ZLsFBHqCQdPHoZVw@slm.duckdns.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZLsFBHqCQdPHoZVw@slm.duckdns.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/07/2023 23:21, Tejun Heo wrote:
> On Wed, Jul 12, 2023 at 12:46:04PM +0100, Tvrtko Ursulin wrote:
>>    $ cat drm.memory.stat
>>    card0 region=system total=12898304 shared=0 active=0 resident=12111872 purgeable=167936
>>    card0 region=stolen-system total=0 shared=0 active=0 resident=0 purgeable=0
>>
>> Data is generated on demand for simplicty of implementation ie. no running
>> totals are kept or accounted during migrations and such. Various
>> optimisations such as cheaper collection of data are possible but
>> deliberately left out for now.
>>
>> Overall, the feature is deemed to be useful to container orchestration
>> software (and manual management).
>>
>> Limits, either soft or hard, are not envisaged to be implemented on top of
>> this approach due on demand nature of collecting the stats.
> 
> So, yeah, if you want to add memory controls, we better think through how
> the fd ownership migration should work.

It would be quite easy to make the implicit migration fail - just the 
matter of failing the first ioctl, which is what triggers the migration, 
after the file descriptor access from a new owner.

But I don't think I can really add that in the RFC given I have no hard 
controls or anything like that.

With GPU usage throttling it doesn't really apply, at least I don't 
think it does, since even when migrated to a lower budget group it would 
just get immediately de-prioritized.

I don't think hard GPU time limits are feasible in general, and while 
soft might be, again I don't see that any limiting would necessarily 
have to run immediately on implicit migration.

Second part of the story are hypothetical/future memory controls.

I think first thing to say is that implicit migration is important, but 
it is not really established to use the file descriptor from two places 
or to migrate more than once. It is simply fresh fd which gets sent to 
clients from Xorg, which is one of the legacy ways of doing things.

So we probably can just ignore that given no significant amount of 
memory ownership would be getting migrated.

And for drm.memory.stat I think what I have is good enough - both 
private and shared data get accounted, for any clients that have handles 
to particular buffers.

Maarten was working on memory controls so maybe he would have more 
thoughts on memory ownership and implicit migration.

But I don't think there is anything incompatible with that and 
drm.memory.stats as proposed here, given how the categories reported are 
the established ones from the DRM fdinfo spec, and it is fact of the 
matter that we can have multiple memory regions per driver.

The main thing that would change between this RFC and future memory 
controls in the area of drm.memory.stat is the implementation - it would 
have to get changed under the hood from "collect on query" to "account 
at allocation/free/etc". But that is just implementation details.

Regards,

Tvrtko
