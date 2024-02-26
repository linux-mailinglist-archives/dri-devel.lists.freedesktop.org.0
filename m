Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C2F867322
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B20B10F0AC;
	Mon, 26 Feb 2024 11:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRdqrJjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A8010F0AC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708947209; x=1740483209;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZgaDZYW1ZAKUNbPRfolz+8pI0xs8q/ddV+Psmle/wMQ=;
 b=WRdqrJjxwcgd69FqYKQZExxcsojZT2nfH4uTIL6RhVaipyzbYzq1si/n
 HuLytr1t3y+oHp27mMgitMbhd2tsbtKm71S78IJaFRadPV28+aui+o5QC
 121fkoWRpNQLM2H2P9W67xjdG7IgHBZbPvLLSO15venYUu2FVzvGQvw3i
 KRv+MOOHDvd+k5KB2uerAL863Rs5mlZ63KmQt/itRWi1MH2d3KY0P3zXC
 fUi8trQlTN4hE6JkFp0M7YZxjkYDmL9d1gI45sEP4xv2y4co7ERliJOmM
 5AhxnERtL7dndM5n24wOmnyIHu/l9KLpUhLB0EdCPP41LucDRhug4T8MF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="25693952"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="25693952"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6783602"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:33:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
In-Reply-To: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
Date: Mon, 26 Feb 2024 13:33:24 +0200
Message-ID: <87bk83o3y3.fsf@intel.com>
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

On Tue, 20 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> ## Adding the a remaining users
>
> I was able to identify most of the users with an account on the old git
> server. However, there's a few I couldn't match with certainty to a
> gitlab account:
>
> * andr2000
> * jsarha
>
> Please let me know your Gitlab user so I can add them to the group.

Is there no way for project owners/maintainers to see the email
addresses for members or access requests?

We've been pretty lax with giving reporter role to deal with issues, but
it's quite a different thing to give developer role with push access,
and feels like you'll need a side channel to match usernames with email
addresses.

BR,
Jani.


-- 
Jani Nikula, Intel
