Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45F84F294
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 10:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA8610F1C4;
	Fri,  9 Feb 2024 09:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cn8wnioC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E641810F216
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707472103; x=1739008103;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=frwFEg6vwKNrCDayNwTH8DWOX07hV24behnkNIgIaUk=;
 b=cn8wnioCL7hWGxqiO5R4vrShEK/ag08m4zINlHXDeRy++UsdM9peSADd
 wZWB+N+kWJBgw4G/e0+mWVKRyuNcfdkxBPjttkwyj0l6DKvQIPyEKN3tE
 /HzwjOiz15H8iXDH2+3drKBlwXsDp25Hh75CWVGqB659hXuKUWdyc5krs
 zQZKd/5J3fW2sLL3v3N9u7FjWbV9ASLvOrvUSMZwqjJcybaGirTIpf2jG
 trQ0M5spBpet1R32fF7Z39xE8GhdR1fvOhO+xSjc1+ggJSB8eKegWXbe8
 PEkb6+qjFfyQCQHTZiMxHEs7rhLckpv3WAM4FVw2kTIhKg9GSDVLI4aco g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1288213"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1288213"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 01:48:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="25134029"
Received: from dfischbe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.64])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 01:48:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, Andrzej
 Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v3 00/39] drm/bridge: switch to struct drm_edid
In-Reply-To: <a6b8152a-a8ef-4b41-96e2-df6192f3c934@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1706038510.git.jani.nikula@intel.com>
 <a6b8152a-a8ef-4b41-96e2-df6192f3c934@linaro.org>
Date: Fri, 09 Feb 2024 11:48:14 +0200
Message-ID: <874jeiarz5.fsf@intel.com>
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

On Thu, 25 Jan 2024, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Thanks, but now some patches subjects are wrong:
> s/drm_bridge_read_edid/drm_bridge_edid_read/s

Fixed while applying.

> With that fixed please add:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Many thanks, pushed the lot to drm-misc-next.

BR,
Jani.


-- 
Jani Nikula, Intel
