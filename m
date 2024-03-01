Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FEA86DE44
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 10:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B99F10EC3E;
	Fri,  1 Mar 2024 09:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6Qjlqmg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF1A10EC3E;
 Fri,  1 Mar 2024 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709285312; x=1740821312;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vsIQzdzSSXDXtwXlioQP69sX38cjtgcp/ykQ7jjH3uY=;
 b=Z6QjlqmgKv/uLAcn+UAZ195dDfisJW/CcCVE/xiAyvOvFiUb5gshJ3O2
 1Bn2/vnVFMJrEN4vNaf7oI0Y5LnCKlnjz6Vf5CNdjtfezxyc+fdYny2AN
 FP3DnzC0oJ0HGEvSsOp6MiRBvNcKLA/KFNbbA8DBhlq8TRBy0jvyE5BYC
 JeFDT87tXTBqkbgdpfYBYRlCGRMIIGw/sAh28af/gg5zbjawSUY8bA1GT
 +d8frjjUqAz3n1St0+wT/oSw27GehZWSjH0SlBdiZI2DxlxI3v6SNhzdw
 eH5E0QeeW0hTa5aB2hkUq5zb/PS3iNLJjJ+AGcNrY3+HUbpIMnHaXl49o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7627054"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="7627054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 01:28:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="12743486"
Received: from eseresrx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.228])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 01:28:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com, Mitul
 Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: Re: [PATCH v15 0/9] Enable Adaptive Sync SDP Support for DP
In-Reply-To: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
Date: Fri, 01 Mar 2024 11:28:18 +0200
Message-ID: <87sf1a5mj1.fsf@intel.com>
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

On Fri, 01 Mar 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> An Adaptive-Sync-capable DP protocol converter indicates its
> support by setting the related bit in the DPCD register.

Please stop sending new series all the time!

Let the review come to a natural stop, with all the review comments
gathered, and issues fixed, before sending a new version. Don't send
another version until *all* patches in the series have gotten either R-b
or actionable review comments.

Sending new versions in short succession actually harms your series
getting merged instead of helps, because it scatters the review comments
and discussion to multiple threads that are difficult to follow.

You also haven't added the Reviewed-by's for the patches that actually
have been reviewed. Whoever applies this would have to go through the
old threads to find out which patches got reviewed, and if they match
the latest thread. And any potential reviewer might not know some of the
patches have already been reviewed, and might do duplicate work.

For a series of this size, please send at most 1-2 new revisions per
*week*, unless you're sure all the pathes have gotten review and the
series should be ready to merge. Make each new revision count.


BR,
Jani.


-- 
Jani Nikula, Intel
