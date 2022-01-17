Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0313A49063D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 11:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E363210E15A;
	Mon, 17 Jan 2022 10:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1F310E15A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642416598; x=1673952598;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+F3cr2LC9C2ZI7Rd8QEaWqzsRs3Pay43Ar9tUq2gZg8=;
 b=du/2Bu+HOsxISVEc2SZWEqB27NjdOuOGd27FuJvqPvpSyev4P4BDX/Oc
 xoFO6eA6tbv1V6x992+mxUBE+nv6OVIV6Y1WV/6Ow6zD/lLehW7cCQaso
 U1WTHBS4KWB5gJ0466NqvI/aX9KTjDj/OSMLp9AyQldZPDZbsSqsc2//L
 kscHoztU6jsx/yrWyVJbcgpUBkM56ghyO2rSyV69gxLDGxRBusUB1+8yi
 x9MzI5704KGd8LUrY17Ioagjn5yzLSTS+I4Cu1O8vfzGuvHj3F/U8PWaj
 IjwaYnAv499gSnvjWwJ5bJTxYIVeYyM9oHm6/1J9DxRuWOctqEK8JV9lk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="224580409"
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="224580409"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 02:49:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="476605640"
Received: from nsilva2-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.2.18])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 02:49:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>, Linus
 Torvalds <torvalds@linux-foundation.org>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
In-Reply-To: <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
Date: Mon, 17 Jan 2022 12:49:45 +0200
Message-ID: <87o84a63hy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jan 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> Hi Helge
>
> On Fri, Jan 14, 2022 at 7:18 PM Helge Deller <deller@gmx.de> wrote:
>>
>> The fbdev layer is orphaned, but seems to need some care.
>> So I'd like to step up as new maintainer.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5d0cd537803a..ce47dbc467cc 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7583,11 +7583,12 @@ W:      http://floatingpoint.sourceforge.net/emulator/index.html
>>  F:     arch/x86/math-emu/
>>
>>  FRAMEBUFFER LAYER
>> -L:     dri-devel@lists.freedesktop.org
>> +M:     Helge Deller <deller@gmx.de>
>>  L:     linux-fbdev@vger.kernel.org
>> -S:     Orphan
>
> Maybe don't rush maintainer changes in over the w/e without even bothering
> to get any input from the people who've been maintaining it before.
>
> Because the status isn't entirely correct, fbdev core code and fbcon and
> all that has been maintained, but in bugfixes only mode. And there's very
> solid&important reasons to keep merging these patches through a drm tree,
> because that's where all the driver development happens, and hence also
> all the testing (e.g. the drm test suite has some fbdev tests - the only
> automated ones that exist to my knowledge - and we run them in CI). So
> moving that into an obscure new tree which isn't even in linux-next yet is
> no good at all.
>
> Now fbdev driver bugfixes is indeed practically orphaned and I very much
> welcome anyone stepping up for that, but the simplest approach there would
> be to just get drm-misc commit rights and push the oddball bugfix in there
> directly. But also if you want to do your own pull requests to Linus for
> that I don't care and there's really no interference I think, so
> whatever floats.
>
> But any code that is relevant for drm drivers really needs to go in through
> drm trees, nothing else makes much sense.
>
> I guess you're first action as newly minted fbdev maintainer is going to be to
> clean up the confusion you just created.

As much as I like folks stepping up as maintainers, I've got to say this
is not a style I appreciate at all.

Thursday: Object a recent fbdev change [1].

Friday: Step up as fbdev maintainer, change git tree (this thread) [2].

Sunday: Send the maintainer change to Linus [3].

Later Sunday: Start reverting the changes objected to on Thursday, with
no discussion, no acks, no reviews, in the new git tree [4].

Monday: Continue reverting the changes [5].

I'm heavily in favor of maintainers who are open, transparent,
collaborative, who seek consensus through discussion, and only put their
foot down when required.

I really don't like the optics here. I'd expect some pretty good
explanations.


BR,
Jani.


[1] https://lore.kernel.org/r/feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de
[2] https://lore.kernel.org/r/YeG8ydoJNWWkGrTb@ls3530
[3] https://lore.kernel.org/r/YeRyfaesC2kxkgZC@ls3530
[4] https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?h=for-next&id=a8005a65d06cfb89585574d956d80b6e23012caa
[5] https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?h=for-next&id=9a89eeda722231fd1079dbfab4a9769b4beb868d


-- 
Jani Nikula, Intel Open Source Graphics Center
