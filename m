Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B2C87B958
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 09:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5924010F98D;
	Thu, 14 Mar 2024 08:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nnw0sE2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4C10F98E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710405256; x=1741941256;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qd4eqTBkHcwbLo7eSV2Kedg+vbWdERUbOG59W19P5oY=;
 b=Nnw0sE2w5WgLU+U9KmeF5rShXpeSoUEeIQ57MOzzS6IRowS5H+7JEUNM
 gRy3xaxbna2fO0BYWYeBx6nF9q3hBUO6M6NLyORLR+dCy8DdYF4Ka5LUb
 XoBadCjDWwWVXdwi1F91+Mvqc43HOuZcJivvtO0K10mv0XKCVZB2cN/Ks
 XQ9xhVwcqUnEsOCR+NbnXg4CZ2RLKPv6laPCXd5rqt3NyK8lP9xMhevMd
 iZcobWkCx0jn4f8ZdAlPZ4T74zYDkaIG2aZDn9JvUJrRBvjar8gv/XtpS
 ksM/TeZYAIT5Xo1uk+IIrRhf7Ki/KNUDmLeyinfSq0gXRFIldNj85nQg5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="22669295"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="22669295"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 01:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12669113"
Received: from rboza-mobl.ger.corp.intel.com (HELO localhost) ([10.252.53.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 01:34:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Animesh Manna <animesh.manna@intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.9-rc1
In-Reply-To: <CAPM=9twwZ-u7_8sRRRf5kRnuRa44ixzM8dHZUs6f5wLnQi90Zw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9twR+WnE3GGqyeh1cuGVmpADPTwDPK10625RP--rLrqkxA@mail.gmail.com>
 <CAHk-=wiTWLKkg0Hht4ofDTVsebD2Zq-m4UP-DsiZjM+w4b7qug@mail.gmail.com>
 <CAPM=9twwZ-u7_8sRRRf5kRnuRa44ixzM8dHZUs6f5wLnQi90Zw@mail.gmail.com>
Date: Thu, 14 Mar 2024 10:34:10 +0200
Message-ID: <87zfv1qkjh.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Mar 2024, Dave Airlie <airlied@gmail.com> wrote:
> On Thu, 14 Mar 2024 at 11:49, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Tue, 12 Mar 2024 at 21:07, Dave Airlie <airlied@gmail.com> wrote:
>> >
>> > I've done a trial merge into your tree from a few hours ago, there
>> > are definitely some slighty messy conflicts, I've pushed a sample
>> > branch here:
>>
>> I appreciate your sample merges since I like verifying my end result,
>> but I think your merge is wrong.
>>
>> I got two differences when I did the merge. The one in
>> intel_dp_detect() I think is just syntactic - I ended up placing the
>>
>>         if (!intel_dp_is_edp(intel_dp))
>>                 intel_psr_init_dpcd(intel_dp);
>>
>> differently than you did (I did it *after* the tunnel_detect()).
>>
>> I don't _think,_ that placement matters, but somebody more familiar
>> with the code should check it out. Added Animesh and Jani to the
>> participants.
>>
>> But I think your merge gets the TP_printk() for the xe_bo_move trace
>> event is actively wrong. You don't have the destination for the move
>> in the printk.
>>
>> Or maybe I got it wrong. Our merges end up _close_, but not identical.
>
> You are right, I lost a line there, I've repushed mine just for
> prosperity with that fixed.
>
> The other one I'm not sure on and will defer to the i915 maintainers
> if ordering matters.

I don't think the ordering matters, but Linus' solution matches what we
have in our -next, and has been tested.

BR,
Jani.


-- 
Jani Nikula, Intel
