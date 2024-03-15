Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728AC87CAAC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 10:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931D211207C;
	Fri, 15 Mar 2024 09:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZT6mpraC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48F011207C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710494901; x=1742030901;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MGYNWlWsopnRvwXHYNUgynG6Nap5bDj2+hfijJqWPm4=;
 b=ZT6mpraCy3B/bwJ1FD78j6YuUIbuCchiFqp6jgDCjMCJPCnwZO89smDN
 eBFzWfR2J8z0MoY3NAXPmnJduM5WLrsZh8FsgoPIVf1gdpDJoNIIk3aUf
 w9kyBikRCXM9/cJ8hRr4d4a1qZOqXnwBxfu/vqBzrcMGeKxK7mODU9hQW
 tQ0hRyBntalJfu/Pvlhn9BQb4fZ+PnGdcgp5yaNAO2mRR4fhmEt5a/iEw
 HXlLK4ntPowACqBjrHIUPqUPjioAOXdarzKPU8W9Fmgej6H911DYWTgGP
 6uinrADgRs++MFU+EDQXngdr7esJozGHI7D6B8F+fpdasAnIM2UWP+Gb8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15999577"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="15999577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12530343"
Received: from denache-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.82])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:28:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>, Helen Koike
 <helen.koike@collabora.com>, Vignesh Raman <vignesh.raman@collabora.com>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Time for drm-ci-next?
In-Reply-To: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
Date: Fri, 15 Mar 2024 11:28:09 +0200
Message-ID: <87a5mzrgie.fsf@intel.com>
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

On Thu, 14 Mar 2024, Rob Clark <robdclark@gmail.com> wrote:
> When we first merged drm/ci I was unsure if it would need it's own
> -next branch.  But after using it for a couple releases, a few times
> I've found myself wanting to backmerge drm/ci changes without
> necessarily backmerging all of drm-misc-next.
>
> So, maybe it makes some sense to have a drm-ci-next branch that
> driver-maintainers could back-merge as-needed?

That's a crossmerge instead of a backmerge, and I feel that could get
messy. What if folks crossmerge drm-ci-next but it gets rejected for
drm-next? Or the baselines are different, and the crossmerge pulls in
way more stuff than it should?

IMO the route should be drm-ci-next -> pull request to drm-next ->
backmerge drm-next to drivers and drm-misc-next.

I'm not opposed to having drm-ci-next at all, mainly indifferent, but I
question the merge flows. And then the question becomes, does my
suggested merge flow complicate your original goal?


BR,
Jani.


-- 
Jani Nikula, Intel
