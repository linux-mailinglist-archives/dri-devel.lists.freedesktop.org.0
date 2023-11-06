Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350F7E1E0F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2899110E2B1;
	Mon,  6 Nov 2023 10:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D809610E2AF;
 Mon,  6 Nov 2023 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699265709; x=1730801709;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rl/CQQQAEsiExbTArsSNlwkvoXmROn7Y+a5SKI9y6cY=;
 b=QPWl+fsyOU8RRjOKMj0yuPyTfKP0EQqQuJtGm/C8nMcnpD/Wv4V0uQ2U
 ViQPKCoIjwKUDEp6F2XYvHT7CWmiTVH2MGWpdfV3KeEn+HJCjIZJNvDK9
 +JBrSZpWwdLoHep3hsBWv3efPfwjsibTHjW/bVKcJ9pWbQkUHOtKDwu7Y
 aDymtxGfjBM7bKQ7tLZ7Y0EN5WWORkZIB9zI8SyZgFNS+F0ah0GT+DSs8
 j3T2edK1900UINBAOtTSjv1hM8EkTNpfcI76sBAKr40OFBML4dctgrPxj
 XD/+OleAbf87j2j6YghVYFlydSkEn2oKD8n6yWGI2xZYw99kJ63aFk2CP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393142062"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="393142062"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:15:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797260470"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="797260470"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.222])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:15:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, Hunter Chasens <hunter.chasens18@ncf.edu>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation warning
In-Reply-To: <ZUigbshGGc451V5L@debian.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
 <ZUh2fuCjmgle3vd9@debian.me>
 <665794d7-38e0-4e74-9af7-eca986792e44@infradead.org>
 <ZUigbshGGc451V5L@debian.me>
Date: Mon, 06 Nov 2023 12:15:02 +0200
Message-ID: <875y2f193t.fsf@intel.com>
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
Cc: Lijo Lazar <lijo.lazar@amd.com>,
 Linux Documentation <linux-doc@vger.kernel.org>, Xinhui.Pan@amd.com,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Nov 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> On Sun, Nov 05, 2023 at 09:26:26PM -0800, Randy Dunlap wrote:
>> 
>> 
>> On 11/5/23 21:15, Bagas Sanjaya wrote:
>> > On Sun, Nov 05, 2023 at 04:00:44PM -0500, Hunter Chasens wrote:
>> >> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> >> index 517b9fb4624c..703fe2542258 100644
>> >> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> >> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> >> @@ -990,11 +990,14 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
>> >>   * the power state and the clock information for those levels. If deep sleep is
>> >>   * applied to a clock, the level will be denoted by a special level 'S:'
>> >>   * E.g.,
>> >> - *	S: 19Mhz *
>> >> - *	0: 615Mhz
>> >> - *	1: 800Mhz
>> >> - *	2: 888Mhz
>> >> - *	3: 1000Mhz
>> >> + *
>> >> + * ::

The literal block marker :: could be added at the end of the preceding
paragraph, so it doesn't stand out so much. See [1].

BR,
Jani.

[1] https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks

>> >> + *
>> >> + *  S: 19Mhz *
>> >> + *  0: 615Mhz
>> >> + *  1: 800Mhz
>> >> + *  2: 888Mhz
>> >> + *  3: 1000Mhz
>> >>   *
>> >>   *
>> >>   * To manually adjust these states, first select manual using
>> > 
>> > LGTM, thanks!
>> > 
>> > Fixes: 615585d09b33 ("Documentation/amdgpu: Modify pp_dpm_*clk details")
>> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>> > 
>> 
>> but can it be done without being so obvious about using Sphinx (or is it ReST?)
>> in source files?
>
> Yes, the comment is included in Documentation/gpu/amdgpu/thermal.rst, so reST
> syntax applies there.

-- 
Jani Nikula, Intel
