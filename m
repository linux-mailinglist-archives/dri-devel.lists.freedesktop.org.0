Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 926CF345B37
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE876E880;
	Tue, 23 Mar 2021 09:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE446E87F;
 Tue, 23 Mar 2021 09:46:05 +0000 (UTC)
IronPort-SDR: P+zDnckdCp63md+XAGCR1k6Ksd4Lwk8eudoXsx1S3uSN+a1wcWpR+yCKwOpf461udzA1gZvkQ3
 SsODyWcvsing==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="210518968"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="210518968"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:46:04 -0700
IronPort-SDR: kXLRnYqM26EEDbRFgcpAO6CPM7cCXlzgnpW5O0R1D7v6AB0gzESNOUsOOhs4469UY34mu/rLcB
 04hC6jQ9464w==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="452076649"
Received: from fbogue-mobl1.ger.corp.intel.com (HELO [10.213.247.160])
 ([10.213.247.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:46:03 -0700
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Drop the CONTEXT_CLONE API
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-4-jason@jlekstrand.net>
 <7918db68-835c-b416-6187-1e62892ce5ed@linux.intel.com>
 <YFilKSbKYd+0HbCn@phenom.ffwll.local>
 <d83162e2-4b9e-c7e9-5324-6612bb9561d6@linux.intel.com>
 <CAKMK7uG0GLPu+auqDgMgD7ugvWo3E7W7DL6eALKxmp6hk-aZiA@mail.gmail.com>
 <fb406aca-1211-e1e5-b6a0-830c26d327ae@linux.intel.com>
 <CAOFGe96uUHfktEqx6WLxOd_=msO=nKSDYj2eUKNhyruzz=EJag@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <4ff16fca-a4b2-cae9-e052-091d55c31b22@linux.intel.com>
Date: Tue, 23 Mar 2021 09:46:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAOFGe96uUHfktEqx6WLxOd_=msO=nKSDYj2eUKNhyruzz=EJag@mail.gmail.com>
Content-Language: en-US
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22/03/2021 16:24, Jason Ekstrand wrote:
> Ugh... timezones.
> 
> On Mon, Mar 22, 2021 at 10:31 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 22/03/2021 14:57, Daniel Vetter wrote:
>>> On Mon, Mar 22, 2021 at 3:33 PM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>>
>>>> On 22/03/2021 14:09, Daniel Vetter wrote:
>>>>> On Mon, Mar 22, 2021 at 11:22:01AM +0000, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 19/03/2021 22:38, Jason Ekstrand wrote:
>>>>>>> This API allows one context to grab bits out of another context upon
>>>>>>> creation.  It can be used as a short-cut for setparam(getparam()) for
>>>>>>> things like I915_CONTEXT_PARAM_VM.  However, it's never been used by any
>>>>>>> real userspace.  It's used by a few IGT tests and that's it.  Since it
>>>>>>> doesn't add any real value (most of the stuff you can CLONE you can copy
>>>>>>> in other ways), drop it.
>>>>>>
>>>>>> No complaints to remove if it ended up unused outside IGT. Latter is a _big_
>>>>>> problem though, since it is much more that a few IGT tests. So I really
>>>>>> think there really needs to be an evaluation and a plan for that (we don't
>>>>>> want to lose 50% of the coverage over night).
> 
> You should look at my IGT patch set.  I'm not deleting any tests
> except those that explicitly test the clone API.  All the other tests
> which use cloning to save a few lines when constructing new contexts
> are updated to not require the cloning API.

I dare not mention the other IGT tree. There will be a plan needed since 
I fear much more usage will be found there.

[snip]

>>>> Timelines of execution were always exposed. Any "engine" (ring
>>>> previously) in I915_EXEC_RING_MASK was a single timeline of execution.
>>>> It is completely the same with engine map engines, which are also
>>>> different indices into I915_EXEC_RING_MASK space.
>>>>
>>>> Userspace was aware of these timelines forever as well. Media was
>>>> creating multiple contexts to have multiple timelines (so parallelism).
>>>> Everyone knew that engine-hopping submissions needs to be either
>>>> implicitly or explicitly synchronised, etc.
>>>
>>> Yup, I think we're saying the same thing here.
>>>
>>>> So I really don't see that we have leaked timelines as a concept *now*.
>>>> What the patch has exposed to userspace is a new way to sync between
>>>> timelines and nothing more.
>>>
>>> We've leaked it as something you can now share across hw context.
>>
>> Okay so we agree on most things but apparently have different
>> definitions of what it means to leak internal implementation details.
> 
> I said it was a "leak" because, from my git archeology, the best I
> could find for justification of doing it this way was that we already
> have a timeline object so why not expose it.  Same for the
> SINGLE_TIMELINE flag.  Is a "timeline" really an internal concept?
> No, not really.  It's pretty standard.  But intel_timeline is an
> internal thing and, while this doesn't give userspace an actual handle
> to it, it gives it more visibility than needed, IMO.

Cloning of timelines absolutely - I don't see a point for that. But I 
think there was no intent there. Rather it was just a consequence of 
striving for symmetry in the uapi.

But for the single timeline flag itself (so next patch in this series 
and it's commit message), when looked at within a single GEM context, I 
still really can't see the argument that it is leaking anything to 
userspace. Certainly not intel_timeline, which is also not even backend 
specific.

We seem to all agree timeline is just context:seqno, which was exposed 
to userpsace forever. For instance if the flag wasn't called "single 
timeline" but "implicit sync", "serial context", "ordered engines", 
whatever, would you still argue it is leaking struct intel_timeline out 
to userspace?

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
