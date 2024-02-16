Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D485783F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 09:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8646710E5CC;
	Fri, 16 Feb 2024 08:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5DocEkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BAF10E507;
 Fri, 16 Feb 2024 08:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708073903; x=1739609903;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=d6QxL5a8KwuUX1bWADJH8Z/xc++iOJI/PqmoWkmlZxw=;
 b=M5DocEkU62kSocOjlG9I2RpZqn2uJ2zbFDf0hn3rWqRdra1/NedL1Frg
 MnvfG1p+kNvPaLIOss7M8GPvyTcc0CTLFIa5ANbaFW090Wozdf15GSfSt
 Ytxl3MAJdhUE0CakumS33co/V2X43XRuIwYigxRhiQgVO866nZlb6Suf2
 nEgXr76jY3eQeBZPlRcu3HY5f1TmQVAgOaLZ7X/hSNimEmx3FKutAAXTP
 YJ6iN6jjEAfGtpxMAFgXoA+8qVtHizKEJc8M2xvsxX86Z5KmPNbFJ+znn
 0RMEdohLsk9SZc5VPq8bo6Si2Fq3brhjcj9tPqw7HpxEqvik1QzvPxJ/m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2103966"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2103966"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 00:58:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="4171354"
Received: from pshishpo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.79])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 00:58:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>, Harry Wentland
 <harry.wentland@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 amd-gfx@lists.freedesktop.org
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
In-Reply-To: <a1d2749b-8db5-46d1-bf60-7820902cfc8f@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240202152837.7388-1-hamza.mahfooz@amd.com>
 <0b94b25a-9ffa-41a5-b931-ad84e1892d36@amd.com>
 <b117ccc0-6569-4753-9cb9-c304f9e50d30@amd.com>
 <a1d2749b-8db5-46d1-bf60-7820902cfc8f@amd.com>
Date: Fri, 16 Feb 2024 10:58:14 +0200
Message-ID: <87mss04wgp.fsf@intel.com>
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

On Thu, 15 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> I feel the solution to these concerns is that we should make a knob that 
> controls whether the DRM property is created or the sysfs file is 
> created but not let them happen simultaneously.

*insert the eyeballs emoji here*

I mean no matter what the problem is, this sounds like the solution is
worse than the problem!


BR,
Jani.


-- 
Jani Nikula, Intel
