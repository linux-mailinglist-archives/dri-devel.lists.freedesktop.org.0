Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC32627B66
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 12:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7AD10E09B;
	Mon, 14 Nov 2022 11:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A913D10E03F;
 Mon, 14 Nov 2022 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668423772; x=1699959772;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/FDzgq0LlS6mMw/MubQxFSGMoNYe/6uINUBW5zC8k2A=;
 b=XFUHwklUZHe+5XeBUKMxHwEokcpccI/3wWiPSVnFoZDGJhpoh/UI61mE
 BwJQOSq60yfjHYsXjNyz+TpdGI4D53rznVWrOkRXKq5BqnfKyHXjnT/IE
 046VfgVGjnncu6fU3MfPAsJ/kD7dpphP7BZ/eU/rd+A4F+PzCYgdfClzf
 1E3YQyXqq3D4ixyKNs0/jD0Tk+P0hQkW8Fq1AqcDfxrhYCxLNYr7w63/C
 5kPwi62OpthIYvn+M8Hl8II86ktNq6mravQnrN91UOZWnSqv2G2hd8mHb
 TpfxS/o1ojMMHwCbooE/vX0Y00uxBRtQvMPXOBYBzGLQew+eG49x93xor w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="338726597"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="338726597"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 03:02:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="763436230"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="763436230"
Received: from dsmahang-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.240])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 03:02:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with Linus' tree
In-Reply-To: <57f57c29-cf48-67c1-b6b3-0e50e7105031@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221114102327.6d53341e@canb.auug.org.au>
 <33ef1207-aad7-b7cd-61ac-327e9afb0699@redhat.com>
 <87cz9p4zj6.fsf@intel.com>
 <57f57c29-cf48-67c1-b6b3-0e50e7105031@redhat.com>
Date: Mon, 14 Nov 2022 13:02:46 +0200
Message-ID: <878rkd4x49.fsf@intel.com>
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Nov 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
>
> On 11/14/22 11:10, Jani Nikula wrote:
>> On Mon, 14 Nov 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>>> Hi,
>>>
>>> On 11/14/22 00:23, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Today's linux-next merge of the drm-intel tree got a conflict in:
>>>>
>>>>   drivers/gpu/drm/i915/display/intel_backlight.c
>>>>
>>>> between commit:
>>>>
>>>>   b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
>>>>
>>>> from Linus' tree and commit:
>>>>
>>>>   801543b2593b ("drm/i915: stop including i915_irq.h from i915_trace.h")
>>>>
>>>> from the drm-intel tree.
>>>
>>> This is weird, because the:
>>>
>>>    b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
>>>
>>> commit is in 6.1-rc1, so there can only be a conflict it 6.1-rc1 has not
>>> been back-merged into drm-intel yet ?
>> 
>> That's the reason it *is* a conflict, right?
>
> Right what I was trying to say is that I am surprised that 6.1-rc1 has not
> been back-merged into drm-intel yet even though it has been released
> 4 weeks ago.

Right, -ENOCOFFEE at my end.

> I thought it was more or less standard process to backmerge rc1 soon after
> it is released ?

The delay may be because v6.1-rc1 brought in more regressions for us
than any other -rc1 in recent memory. Our CI's been suffering, and our
folks have been spending a lot of time debugging, bisecting and
reporting. (And before you ask, yes, we're going to be more proactive in
reporting issues we find in linux-next.)

That said, Rodrigo's been in charge of drm-intel-next this cycle, maybe
it's time to backmerge drm-next?


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
