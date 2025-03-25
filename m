Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8BCA70483
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B90A89221;
	Tue, 25 Mar 2025 15:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N4JMw98n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAA310E591
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742915033; x=1774451033;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kFbh0LlV4qyD9Zc+BpYtdVXJlfeuU7uh04pxDYsqlmE=;
 b=N4JMw98nB3fcnBpkfVbmGDwMXHbIvvvtPbste3tpF5D1nTy+kWZGa6TQ
 1apWDsigxTbKUOZWMCAQRCroYV0qO4PwCGlHSuIW1fMu9uqqdHgT9HDcr
 dwvpknBqQ0u/K4uJBDVth1mgXxzVcz+0Vvo+4nzVcpU1OSKo/9Opthoo5
 B4SbD1h68v3AD3fdHHcLg+Gu4q7fL2veGoBbPMkB3Lyw85JkQtjWflB5W
 lTixzk4Ts/ulkJk/2IAERNPaYNxkuDn+x4JbzucKFKHLGNdn9AFpSf1H2
 FOzO54k4Ac6JDRk6DODb7jNYNGNfqga/7fLaEgW+xa9zGRqTJ1uUWhB6M A==;
X-CSE-ConnectionGUID: 3iK1rr8kRpqja6bBbXLhAg==
X-CSE-MsgGUID: JwPQvqYiRIitsvXaFQZhxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="31769686"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="31769686"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:03:53 -0700
X-CSE-ConnectionGUID: DMDtKWK4Rae/QIGFg7jTfg==
X-CSE-MsgGUID: tg4WBIDZRqSUcwN/2lvOmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124374348"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:03:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: devbrones <jonas.cronholm@protonmail.com>,
 maarten.lankhorst@linux.intel.com, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/edid: Add non-desktop quirk for Playstation VR
 Headsets with Product ID 0xB403
In-Reply-To: <20250325-annoying-precise-uakari-6b6438@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250322122048.28677-1-jonas.cronholm@protonmail.com>
 <875xjxa2rk.fsf@intel.com> <20250325-inquisitive-ebony-mouse-bdf185@houat>
 <87pli58jze.fsf@intel.com> <20250325-annoying-precise-uakari-6b6438@houat>
Date: Tue, 25 Mar 2025 17:03:46 +0200
Message-ID: <87h63h884t.fsf@intel.com>
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

On Tue, 25 Mar 2025, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Mar 25, 2025 at 12:47:49PM +0200, Jani Nikula wrote:
>> On Tue, 25 Mar 2025, Maxime Ripard <mripard@kernel.org> wrote:
>> > On Tue, Mar 25, 2025 at 11:16:47AM +0200, Jani Nikula wrote:
>> >> On Sat, 22 Mar 2025, devbrones <jonas.cronholm@protonmail.com> wrote:
>> >> > This fixes a bug where some Playstation VR Headsets would not be assigned
>> >> > the EDID_QUIRK_NON_DESKTOP quirk, causing them to be inaccessible by
>> >> > certain software under Wayland.
>> >> 
>> >> Please file a bug over at [1], and attach the EDID on that bug, so we
>> >> have some clue what's going on.
>> >>
>> >> [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/new
>> >
>> > I'd rather have them in the commit log. Nobody uses gitlab issues for
>> > drm-misc, and those kind of issues are just lingering around and
>> > becoming stale.
>> 
>> For this one, it's fine as long as we preserve the raw EDID for
>> posterity. Unless the EDID does indicate VR and we need to dig deeper,
>> that is.
>
> What I was trying to say is if "posterity" means "a forever open issue
> in drm-misc", then no, sorry, that doesn't work for me.

I want to check the EDID before we merge the quirk.

If the EDID does not indicate VR, we can merge. I want the EDID
preserved so we can track them down later if we need to drop or modify
the quirks.

If the EDID does indicate VR, either the quirk is unnecessary or there's
a bug somewhere. This requires further debugging, and we must not merge
the quirk.


BR,
Jani.


-- 
Jani Nikula, Intel
