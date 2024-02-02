Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6737B846C93
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 10:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112E710E196;
	Fri,  2 Feb 2024 09:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lU3i/BQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 09:42:59 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F0910E196
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 09:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706866979; x=1738402979;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Pk12KvS9am7NU1bl61zs4c06uJtY1JFJXFeHg2W7QXQ=;
 b=lU3i/BQdsQkP2DuRx0QAsCsY5fODewBYItSObvqc52zRMyqcrOK/gs6A
 UK+cu3SPm322p8x0QCh68tqZJ3ITDtmdfgzD4C7DOUIBthsrzHqoxX7w3
 3Ep1Kgl2czCjs1HwqcSbTRKrBfmg98yAknCSUxXiODj5ne6ZJxbHXec7v
 ELm/5/oPbrEz0e87XHIKWLNgvOQhkJvrPNz0Sq6Dxi8En1ob/p2gJX73X
 vVESVZZ863oWUhAecSHf03KVgoxfNtvPLLe26XzCIzPe7R2P4iWi5Tp1S
 p1AhKNEJa1wxil52SKAfeU7k/7Eo0vOgCnP6fbR60Yez0fU7hdPjQAUBl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="35317"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="35317"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 01:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="307868"
Received: from mistoan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.140])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 01:35:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Paz Zcharya <pazz@chromium.org>
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, Subrata Banik <subratabanik@google.com>,
 Manasi Navare <navaremanasi@chromium.org>, Drew Davenport
 <ddavenport@chromium.org>, Sean Paul <seanpaul@chromium.org>, Marcin
 Wojtas <mwojtas@chromium.org>, khaled.almahallawy@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Include debugfs.h in
 intel_display_debugfs_params.c
In-Reply-To: <87v878fc5h.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240131204658.795278-1-pazz@chromium.org>
 <87o7d0h73r.fsf@intel.com> <ZbuxsF7ubmL6lzdR@google.com>
 <87v878fc5h.fsf@intel.com>
Date: Fri, 02 Feb 2024 11:35:25 +0200
Message-ID: <87bk8zfbtu.fsf@intel.com>
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

On Thu, 01 Feb 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> On Thu, 01 Feb 2024, Paz Zcharya <pazz@chromium.org> wrote:
>> Thank you so much for the super prompt reply!
>
> FYI, looks like we've got some hiccup in CI, will merge after we get
> results.

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.

-- 
Jani Nikula, Intel
