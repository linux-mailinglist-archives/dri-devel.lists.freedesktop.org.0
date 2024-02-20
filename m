Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF2385BA1B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 12:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A81410E342;
	Tue, 20 Feb 2024 11:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j++qa4dP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FA610E32D;
 Tue, 20 Feb 2024 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708427720; x=1739963720;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4VpxTVVljrd5O5tk4aKFQR+l73LULNECbhvrEuohrH8=;
 b=j++qa4dPTx1uPUBGzr+viR0dgVdl+Y7PFHICu6uiS578krVXSect2avW
 NTG88yGrBLBlo3ZcfxxSCo/pmitID/aUGFkEh9IwydHywBfKO099OuQjJ
 a945Rk/cypRY3O+YD3m5JyrYOz0aQTV0bcOlk2IOQiE7KBY8OXhCSNNJs
 53Ao7p0Sd0ZGXXI6gl80Gi++Fc1aQ5cuv2ICTqN7yPwuBD9IItWq1GVA+
 +QsnPhrTG1xW+UZrn198zF4LCHVEMUV+HyA/SZDpYIXWe0GU5nQgUqtKZ
 9DpQue3RBm4XXtbDLja+bMDjPOhZwdwE83xnZXQ4ac3PHHwMgNs7SNURM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="20055960"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="20055960"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:15:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="35774805"
Received: from dunnejor-mobl2.ger.corp.intel.com (HELO [10.213.231.185])
 ([10.213.231.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:15:15 -0800
Message-ID: <97b11121-4c48-4dd9-b966-4c42eda3f6a3@linux.intel.com>
Date: Tue, 20 Feb 2024 11:15:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/gt: Set default CCS mode '1'
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240215135924.51705-1-andi.shyti@linux.intel.com>
 <20240215135924.51705-3-andi.shyti@linux.intel.com>
 <d61391f6-ff1d-4241-bd9e-2a3bee53c860@linux.intel.com>
 <c63a2d0e-fc57-4252-ad3d-2aa7615e062d@linux.intel.com>
 <ZdR6zeDlKXqR1mvZ@ashyti-mobl2.lan>
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZdR6zeDlKXqR1mvZ@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 20/02/2024 10:11, Andi Shyti wrote:
> Hi Tvrtko,
> 
> On Mon, Feb 19, 2024 at 12:51:44PM +0000, Tvrtko Ursulin wrote:
>> On 19/02/2024 11:16, Tvrtko Ursulin wrote:
>>> On 15/02/2024 13:59, Andi Shyti wrote:
> 
> ...
> 
>>>> +/*
>>>> + * Exclude unavailable engines.
>>>> + *
>>>> + * Only the first CCS engine is utilized due to the disabling of
>>>> CCS auto load
>>>> + * balancing. As a result, all CCS engines operate collectively,
>>>> functioning
>>>> + * essentially as a single CCS engine, hence the count of active
>>>> CCS engines is
>>>> + * considered '1'.
>>>> + * Currently, this applies to platforms with more than one CCS engine,
>>>> + * specifically DG2.
>>>> + */
>>>> +#define for_each_available_uabi_engine(engine__, i915__) \
>>>> +    for_each_uabi_engine(engine__, i915__) \
>>>> +        if ((IS_DG2(i915__)) && \
>>>> +            ((engine__)->uabi_class == I915_ENGINE_CLASS_COMPUTE) && \
>>>> +            ((engine__)->uabi_instance)) { } \
>>>> +        else
>>>> +
>>>
>>> If you don't want userspace to see some engines, just don't add them to
>>> the uabi list in intel_engines_driver_register or thereabouts?
> 
> It will be dynamic. In next series I am preparing the user will
> be able to increase the number of CCS engines he wants to use.

Oh tricky and new. Does it need to be at runtime or could be boot time?

If you are aiming to make the static single CCS only into the 6.9 
release, and you feel running out of time, you could always do a simple 
solution for now. The one I mentioned of simply not registering on the 
uabi list. Then you can refine more leisurely for the next release.

Regards,

Tvrtko

> 
>>> Similar as we do for gsc which uses I915_NO_UABI_CLASS, although for ccs
>>> you can choose a different approach, whatever is more elegant.
>>>
>>> That is also needed for i915->engine_uabi_class_count to be right, so
>>> userspace stats which rely on it are correct.
> 
> Oh yes. Will update it.
> 
>> I later realized it is more than that - everything that uses
>> intel_engine_lookup_user to look up class instance passed in from userspace
>> relies on the engine not being on the user list otherwise userspace could
>> bypass the fact engine query does not list it. Like PMU, Perf/POA, context
>> engine map and SSEU context query.
> 
> Correct, will look into that, thank you!
> 
> Andi
