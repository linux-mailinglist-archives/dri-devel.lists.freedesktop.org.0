Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA46677C2D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 14:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A5310E48F;
	Mon, 23 Jan 2023 13:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2470210E48F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 13:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674479618; x=1706015618;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6p6d8d0A0EQ/w0BUPthiORFjEs/2UH9nG7t++c03jZc=;
 b=CkO3T6EPRvxmUKXavMMZY9/qX8/341fFcfGGRlZ0Z7jynBkZSHh5Li5j
 LXdAE53hI8O7Lz+2JRvRFhpvSd2P+5IU8o69DcmCIUxUVoxy7H6BG9aNa
 ghq3zo8P6zEU0nubXE34TSMgKwpwXGFZ00I+zdCsNWqMIRULy5n6u4tNy
 WvorvC/R5qGXm4Eg4whF9PGZnmLWfJD7vWSry3vN/EYcO066pojjAKJYt
 jiWNbFpJQSgzrNJseNKwOyXwgFYX7hkVDDwvAgjNW9WrNAc/3ZnBX9BJk
 AhqWoYMaLNYE1KLREBO/JD8cB/1/fT1WIAjxvtPZktNSB5bzJKEGgCbe9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="390537237"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="390537237"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 05:13:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="990400275"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="990400275"
Received: from possola-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.125])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 05:13:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: pr-tracker-bot for drm subsystem?
In-Reply-To: <20230120151024.nflfvgl55wfl6ppj@meerkat.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87a670spdw.fsf@intel.com> <87a62dadi9.fsf@intel.com>
 <20230120151024.nflfvgl55wfl6ppj@meerkat.local>
Date: Mon, 23 Jan 2023 15:13:33 +0200
Message-ID: <871qnl8kci.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 tools@linux.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Jan 2023, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Fri, Jan 20, 2023 at 09:09:18AM +0200, Jani Nikula wrote:
>> 
>> Konstantin?
>
> Sorry, I didn't mean to scholz you around.

This reply alone was worth the wait. ;D

> The pr-tracker-bot is very much a
> bespoke solution for Linus, so adapting it to other subsystems is not very
> trivial, which is why I've been sitting on this request without any movement.
>
> The code for the bot is available here:
> https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/pr-tracker-bot.py
>
> I can take a look at it in the future, but at the moment I'm still not able to
> work on it, sorry. :(

I guess the question still stands: Regardless of who modifies the
tracker bot and when, do you think you could take on running it for
other subsystems, provided the changes are to your liking, or should the
subsystems adapt it and run their own?

If the latter, there's just not all that much incentive to make it nice,
especially so if you say it's not trivial. It'll just be copy and make
it bespoke for the other subsystem.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
