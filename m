Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C025CAD50FE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B57F10E604;
	Wed, 11 Jun 2025 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aprOyDx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7867510E609;
 Wed, 11 Jun 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749636468; x=1781172468;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Q5e6tv+bujtwWWtPEqnJxXvf8HgI9FwF7xELoY8rbgo=;
 b=aprOyDx8C6pXo7sm3Ke8oyVLg7VMjgtE4CfGX5aTImqjpOOUJMG0tqGy
 qcemRnTjNMgMnxxN/BHIoVN654Ob4Imp0VBs6oZMKKsEvBzQ+fSZ/Zf61
 7sUR6r/yuCxfToxlqWdrsg8RMesdAe+zMUkXFxKHjgwYW1MriIeBKVEeu
 aK3fPZja5lnW7PEbVWBFKzc3nhn+22dBRWKqAIXjmEK121LcUiB47VY2+
 pvxT34M32mvprREO/N15tvnStd0PfZC1bSNUxejxcaH05yWV1zTWL5Ofe
 jc+gwrnjj1iKaxHwmMaw4jwuru226bZUw8eFQoegLO485hTp43w4MdQZa Q==;
X-CSE-ConnectionGUID: GVe0IBNSTRKDg19e0hPdJA==
X-CSE-MsgGUID: 84P5boDfRPeeamWFSX7fyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51486036"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51486036"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:07:48 -0700
X-CSE-ConnectionGUID: PEy/VNbTQ/O6uwV5GWzrLQ==
X-CSE-MsgGUID: baYEKrKQQTu3XTFVSE6ByA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="178060960"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.209])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:07:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Wysocki Rafael J
 <rafael.j.wysocki@intel.com>, Lee Shawn C <shawn.c.lee@intel.com>,
 simon1.yang@intel.com, Doug Anderson <dianders@chromium.org>, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/4] drm/panel, drm/i915: ACPI support for panel follower
In-Reply-To: <cover.1749199013.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1749199013.git.jani.nikula@intel.com>
Date: Wed, 11 Jun 2025 13:07:41 +0300
Message-ID: <b6e3b59d7b1f04d0085011584b4b5eee383a1441@intel.com>
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

On Fri, 06 Jun 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> Hi all -
>
> This series expands panel follower to ACPI, and enables drm_panel on
> i915.
>
> Patch 1 makes panel follower matching independent of DT, making it also
> work with ACPI. Similar to DT, you can use a _DSD "panel" property to
> describe the dependency.
>
> Patches 2-4 add drm_panel support to i915 DSI, making it possible to
> have followers be notified of panel states.
>
> It's not a whole lot of code, but I simply could not have done it
> alone. Thanks to Heikki and Rafael for ACPI insights, Shawn for testing
> and feedback, Simon for providing ASL, Doug and Maxime for drm_panel
> insights. Much appreciated!
>
> Alas that's not all. While this has been tested to work on an ACPI
> system, it has not been tested to not regress on DT systems. I wouldn't
> dream of merging this before that, but we don't have such systems
> handy. Could anyone provide their Tested-by on a DT system with panel
> followers, please?

Thanks for the reviews, acks, and tested-bys, merged to drm-misc-next.

BR,
Jani.


>
>
> BR,
> Jani.
>
>
> Jani Nikula (4):
>   drm/panel: use fwnode based lookups for panel followers
>   drm/i915/panel: add panel register/unregister
>   drm/i915/panel: register drm_panel and call prepare/unprepare for ICL+
>     DSI
>   drm/i915/panel: sync panel prepared state at register
>
>  drivers/gpu/drm/drm_panel.c                   |  39 ++++--
>  drivers/gpu/drm/i915/display/icl_dsi.c        |   4 +
>  .../gpu/drm/i915/display/intel_connector.c    |  23 ++-
>  .../drm/i915/display/intel_display_types.h    |   4 +
>  drivers/gpu/drm/i915/display/intel_panel.c    | 131 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_panel.h    |   6 +
>  6 files changed, 187 insertions(+), 20 deletions(-)

-- 
Jani Nikula, Intel
