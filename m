Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D41A6EE2D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 11:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2C610E393;
	Tue, 25 Mar 2025 10:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbQf5gxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A0910E393
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742899675; x=1774435675;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pRFdoRxHQv4ASkQQbPf/QJW+Fkq5GR+papCZB7h7xWQ=;
 b=BbQf5gxzSfGd2K7A/UDhgS+VmlXEqwVwrrb2BZIHPmccKqP7t92iqlxk
 BoF0kzv7Nqk+TEZFgQripSgR1XmUmZDaVH4Ngn9MrIyXNpMWIInHDizmb
 QXk2SKR+2T4RYsSlG8/NlevFzZJnQI2pxg7gTsANRvr2drnOvctGPqt9u
 9Lp29IQSL48FBKh/gFsPMfrJYlE2SUTbcLcH0cLi+nPEorrcWUhJTQk8f
 CGWeU2bW6TEGgQXraZgyjRdC04EOOZpAUQBxCBWPH4GQzLwkhW6zhNAP8
 cf0jgAxsyWmWUPjhQ1wMfogxmIq+kRHo2sdL+0Axf/NyHUnLItd+xBmsf A==;
X-CSE-ConnectionGUID: B4nWKHQaRhycZchnPl3A3Q==
X-CSE-MsgGUID: F6GoCF4WRlWDos8XfnNxlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43864144"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="43864144"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:47:55 -0700
X-CSE-ConnectionGUID: 29i981N9Ru+pvd9UBP+X9w==
X-CSE-MsgGUID: u86+9+DOQpaMYgpMgvreWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124058557"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:47:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: devbrones <jonas.cronholm@protonmail.com>,
 maarten.lankhorst@linux.intel.com, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/edid: Add non-desktop quirk for Playstation VR
 Headsets with Product ID 0xB403
In-Reply-To: <20250325-inquisitive-ebony-mouse-bdf185@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250322122048.28677-1-jonas.cronholm@protonmail.com>
 <875xjxa2rk.fsf@intel.com> <20250325-inquisitive-ebony-mouse-bdf185@houat>
Date: Tue, 25 Mar 2025 12:47:49 +0200
Message-ID: <87pli58jze.fsf@intel.com>
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
> On Tue, Mar 25, 2025 at 11:16:47AM +0200, Jani Nikula wrote:
>> On Sat, 22 Mar 2025, devbrones <jonas.cronholm@protonmail.com> wrote:
>> > This fixes a bug where some Playstation VR Headsets would not be assigned
>> > the EDID_QUIRK_NON_DESKTOP quirk, causing them to be inaccessible by
>> > certain software under Wayland.
>> 
>> Please file a bug over at [1], and attach the EDID on that bug, so we
>> have some clue what's going on.
>>
>> [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/new
>
> I'd rather have them in the commit log. Nobody uses gitlab issues for
> drm-misc, and those kind of issues are just lingering around and
> becoming stale.

For this one, it's fine as long as we preserve the raw EDID for
posterity. Unless the EDID does indicate VR and we need to dig deeper,
that is.

BR,
Jani.

-- 
Jani Nikula, Intel
