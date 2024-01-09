Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6F98283CB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 11:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995BA10E379;
	Tue,  9 Jan 2024 10:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774D710E379
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 10:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704795391; x=1736331391;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ClaEQqrk/v3wUuwrOOTHotXQ0yZjmh9/VYVha78IPAs=;
 b=Mh9w5jin6tsLJRTzrydKwVmNJYqhvs9IZBCvGh+51GUVyHwvyeRKogQI
 NigqG6vtgJjz6q51MjoA6LJSS9G62o2Q19CZ+yWUfjHLB7cbPpAgG7EA5
 m2d3dOpknLOSkKglqa5JXNRshANbwAh0j1K37ZdSnFI0+Mt8NkUltWHOK
 lLlhGaX1UBwlikaC4FCabYB73n+hKAs/b17YLWP3J262J0jQL4pfC5bbD
 tunECtBco+Nttv8ig2Cb8/24V76jiX+AE0Yq+4yVEYnG8t+TxZwaZ49xs
 nAIX7XfwlbDhlXDT9Jx3y8NffhgXKy6V/LJSvu+3sOyZ9eY0qwUB4I3t+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4909988"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="4909988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 02:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="23516915"
Received: from aakinrin-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.36.188])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 02:16:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2] drm/bridge: nxp-ptn3460: switch to ->edid_read callback
In-Reply-To: <20240109101146.2425952-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <a8f71940221fb085b8767f8123f496c9b36b22cc.1704276309.git.jani.nikula@intel.com>
 <20240109101146.2425952-1-jani.nikula@intel.com>
Date: Tue, 09 Jan 2024 12:16:25 +0200
Message-ID: <87le8yx152.fsf@intel.com>
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

On Tue, 09 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Prefer using the struct drm_edid based callback and functions.
>
> v2: Fix -Wsometimes-uninitialized (kernel test robot)
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I fumbled and sent the v2 in reply to the wrong patch, and it'll
probably confuse all the build bots out there.

Anyway, I'd prefer not resending the entire series until there's been at
least some meaningful review.

BR,
Jani.

-- 
Jani Nikula, Intel
