Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60B83C2FA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 14:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCED010F551;
	Thu, 25 Jan 2024 13:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA2910EF29
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706187703; x=1737723703;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=Gdze/kYIbhyNqOKfvdxBbgx9v55pU9dS7O8FgxSQP2U=;
 b=TRzczXyBHKEBBi6lLIMjfaX5L/hFchg7kMn0SksJ+7DoA3sJ1XrUA6if
 fQqGog3WVbAdP7kxqL/+pX5PHPDIbbaeMdfbDjZiUlLkec2hMzL50BFQt
 KPV9X+fpLz7TtjCkrSnuOQqTmQskda7zUO+JqIqjfDnXCCOhKwbyYIaew
 RKxuR7sFuTakOetsTVyw3dZk+94ETaZT2F/HQstXbMVbDkLzPoTvbtbl0
 6OxfZFQex1QWbJvStnIZ8REtS/taMaOvbSUBbjy5igxqUn2mXl4sf9Aoe
 FwW5CO8dRgf1Q24I1uUnMpcERjIWt7M1WqSXNEIBeQtOyUXQ2rARTm2y2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23615097"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23615097"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 05:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2265381"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 05:01:39 -0800
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
Date: Thu, 25 Jan 2024 15:01:36 +0200
Message-ID: <871qa5lg7j.fsf@intel.com>
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

Oh, dang it, that was mentioned before, but I forgot. My bad.

> With that fixed please add:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Entire series? Much appreciated, thanks!

BR,
Jani.

-- 
Jani Nikula, Intel
