Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A116867408
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EE810F0E0;
	Mon, 26 Feb 2024 11:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXlHGR/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09B310F0EF
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708948666; x=1740484666;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gw+UntT3GjHJRAH5jf/ljPCWKD+NVX+15cT13udFrSE=;
 b=LXlHGR/nir5cEwnYBZMBMIqkHw4z58vD/U3DoK/aq8Y2SQiZnQglVk1W
 jDB6f92GJlmt+0/L7SBFnpP/r2NwhZmYYntQpbu6eLirJuaLXBHlfeJSo
 sPirf5tjASgttYQVSdguZJ2akLdGhOTlFuaXjOlI28Z5pbnA04UhVLZwo
 HQD8cfyU4FeKx3ceItWaDly8mdFTeXrnT5LnlzZr6QeOfp6lY+Qhdscng
 5OThZBfNJOZCoO7KRZOM6mikebhUW31+konkap0po34/FHspMJHvzKONh
 EquFaFFBcohtfJmGw3v8r9Imh14WUhljTTq+Iurf0/3wp38UQmFZbEiPz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="13779340"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="13779340"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:57:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11314333"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:57:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
In-Reply-To: <oazstrooilko4tfmead3b4l32tmz3szqpwgzy3kyga3xahjjfw@cbosrrwaul77>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <87bk83o3y3.fsf@intel.com>
 <oazstrooilko4tfmead3b4l32tmz3szqpwgzy3kyga3xahjjfw@cbosrrwaul77>
Date: Mon, 26 Feb 2024 13:57:40 +0200
Message-ID: <871q8zo2tn.fsf@intel.com>
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

On Mon, 26 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Mon, Feb 26, 2024 at 01:33:24PM +0200, Jani Nikula wrote:
>> On Tue, 20 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> > ## Adding the a remaining users
>> >
>> > I was able to identify most of the users with an account on the old git
>> > server. However, there's a few I couldn't match with certainty to a
>> > gitlab account:
>> >
>> > * andr2000
>> > * jsarha
>> >
>> > Please let me know your Gitlab user so I can add them to the group.
>> 
>> Is there no way for project owners/maintainers to see the email
>> addresses for members or access requests?
>> 
>> We've been pretty lax with giving reporter role to deal with issues, but
>> it's quite a different thing to give developer role with push access,
>> and feels like you'll need a side channel to match usernames with email
>> addresses.
>
> For the recent-ish subscriptions, it's possible since we've required to
> open a Gitlab issue for a while, so we have the association between the
> Gitlab account and the SSH account already.
>
> During the Gitlab setup, the groups were also created already with the
> people that had an SSH account at the time, and Gitlab account.
>
> But for the rest, yeah, I had to ping Daniel S. about it. He could find
> a few matches, but there's some where we just don't know if or what the
> Gitlab account is.
>
> Generally speaking, we've been conservative about it, and only added
> accounts we were sure of.

Ah, I didn't make myself clear. I'm more interested in the process going
forward, for new access requests. Anyone can create an account and
request access; how does a maintainer verify the request? For our
purposes it's basically just matching againt the email addresses in
existing commits in the repo.

BR,
Jani.




-- 
Jani Nikula, Intel
