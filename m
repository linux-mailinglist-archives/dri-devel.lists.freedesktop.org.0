Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE1469CABF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 13:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9673C10E0E1;
	Mon, 20 Feb 2023 12:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583C810E0E1;
 Mon, 20 Feb 2023 12:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676895733; x=1708431733;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E6sDOcX1qXRt0QrbN/D4rkV/vYCpY8ybq78T+WYxVUI=;
 b=RS8doES8FjKgnSWJA9kJ1ZRZgE3trRSj7CZogy57Gto0VdICCnM/1+RR
 H7Gdtnm4hqW//fBDdeQ2CG9YKKBeLuM4YXv4/janqDAcNpLBikmEBER1n
 ETb5U8KeTzLBDLKzhmRDvZ0WYP5M/Yzh6Ty1dJtBfz9u0Ut0xSXP/QOfl
 JtSE2SsHTwvoFN28KSsBX9Y6bRDtnRSPN1/nnxiuJCvFhZNkrm+JZLVu+
 PidOfcPZQJsRmbdUvUCjjNCwRGeBIasOsLmcSsCyax/C1NV8s3jQzqfh5
 RjOvhLcNdlUreUbW0VYYipLwNGd7zak2/WxhzIOLMlMCYI9Y/L4Olnhnl Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="359856005"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="359856005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 04:22:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="701652083"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="701652083"
Received: from mochoamo-mobl.ger.corp.intel.com (HELO [10.213.211.126])
 ([10.213.211.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 04:22:10 -0800
Message-ID: <9fa6b49f-376b-f9e2-bce7-e58b04628822@linux.intel.com>
Date: Mon, 20 Feb 2023 12:22:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <Y+5zyeSncSbsXHWG@intel.com>
 <7e059e8c-41c3-b56c-26c8-c0e2230616b1@linux.intel.com>
 <CAF6AEGuN2dv+Lsk3R43oPRA9c8ZoMjzCCKR+L41wNT8Sc3TgsQ@mail.gmail.com>
 <c0663648-5567-2d7a-43b1-dfa043109051@linux.intel.com>
 <CAF6AEGsGqjbL_tA8x_xwygBccKMP2DTbSy-B5_dEakpQVep8vg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGsGqjbL_tA8x_xwygBccKMP2DTbSy-B5_dEakpQVep8vg@mail.gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/02/2023 17:00, Rob Clark wrote:
> On Fri, Feb 17, 2023 at 8:03 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:

[snip]

>>> adapted from your patches..  I think the basic idea of deadlines
>>> (which includes "I want it NOW" ;-)) isn't controversial, but the
>>> original idea got caught up in some bikeshed (what about compositors
>>> that wait on fences in userspace to decide which surfaces to update in
>>> the next frame), plus me getting busy and generally not having a good
>>> plan for how to leverage this from VM guests (which is becoming
>>> increasingly important for CrOS).  I think I can build on some ongoing
>>> virtgpu fencing improvement work to solve the latter.  But now that we
>>> have a 2nd use-case for this, it makes sense to respin.
>>
>> Sure, I was looking at the old version already. It is interesting. But
>> also IMO needs quite a bit more work to approach achieving what is
>> implied from the name of the feature. It would need proper deadline
>> based sched job picking, and even then drm sched is mostly just a
>> frontend. So once past runnable status and jobs handed over to backend,
>> without further driver work it probably wouldn't be very effective past
>> very lightly loaded systems.
> 
> Yes, but all of that is not part of dma_fence ;-)

:) Okay.

Having said that, do we need a step back to think about whether adding 
deadline to dma-fences is not making them something too much different 
to what they were? Going from purely synchronisation primitive more 
towards scheduling paradigms. Just to brainstorm if there will not be 
any unintended consequences. I should mention this in your RFC thread 
actually.

> A pretty common challenging usecase is still the single fullscreen
> game, where scheduling isn't the problem, but landing at an
> appropriate GPU freq absolutely is.  (UI workloads are perhaps more
> interesting from a scheduler standpoint, but they generally aren't
> challenging from a load/freq standpoint.)

Challenging as in picking the right operating point? Might be latency 
impacted (and so user perceived UI smoothness) due missing waitboost for 
anything syncobj related. I don't know if anything to measure that 
exists currently though. Assuming it is measurable then the question 
would be is it perceivable.
> Fwiw, the original motivation of the series was to implement something
> akin to i915 pageflip boosting without having to abandon the atomic
> helpers.  (And, I guess it would also let i915 preserve that feature
> if it switched to atomic helpers.. I'm unsure if there are still other
> things blocking i915's migration.)

Question for display folks I guess.

>> Then if we fast forward to a world where schedulers perhaps become fully
>> deadline aware (we even had this for i915 few years back) then the
>> question will be does equating waits with immediate deadlines still
>> works. Maybe not too well because we wouldn't have the ability to
>> distinguish between the "someone is waiting" signal from the otherwise
>> propagated deadlines.
> 
> Is there any other way to handle a wait boost than expressing it as an
> ASAP deadline?

A leading question or just a question? Nothing springs to my mind at the 
moment.

Regards,

Tvrtko
