Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64EBAB12AB
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 13:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1976310EA29;
	Fri,  9 May 2025 11:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWOvYy/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624F110E126;
 Fri,  9 May 2025 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746791735; x=1778327735;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4lKHS+8tFTgQ2N4u6tBruorntuAKXGyR+fz6sHvxJTM=;
 b=DWOvYy/CeXD6X6QgB5IEVvGuQbhBjQD2XQIDT//i0sYwRTR/u/YLSGtw
 Y0FOunj6GU+X/yh3NwRMnujs2uXn07MfsMAog//4ILRaLGEcimM4bf5tg
 gc70ftiV1/N3lBtyjpECpyuI2Uts/HBA8FhIqZ+9HyL3AoY1LWQbsLQlJ
 Yi80hDrRta5ESqpdmoDKsalhQ0FIpa/u3Ek79GhDdy3Oq1WBIANI7hmBu
 dnJerDbfpUop0n1JOWz3UqXcCTgdz8W9d8jtBveLIB4gcOJWOGsd9hvTT
 n6j3I3aSvcubJ0GWo2cOWcebs67dN253x0b/VgHjf0h9nsoU7cnbnQ5zi g==;
X-CSE-ConnectionGUID: 7VU6WeDiQkKSF5pAlfbttQ==
X-CSE-MsgGUID: QrwvdCBDQOOwG8DteMslGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59279472"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="59279472"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 04:55:35 -0700
X-CSE-ConnectionGUID: EQdqlsyVRLq6DcySBDalmw==
X-CSE-MsgGUID: WEtI6RKtRGu2jFWBlXDjeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="136620907"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.218])
 ([10.245.244.218])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 04:55:32 -0700
Message-ID: <98c8bb9b-fb51-48ef-9b8a-51f69764c535@linux.intel.com>
Date: Fri, 9 May 2025 13:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Naveen Kumar <naveen1.kumar@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
References: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
 <87plgimdme.fsf@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87plgimdme.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

This would be a question for Dave and Simona,
I don't mind sending another pull request, but it's up to them on how to handle it.

Best regards,
~Maarten

On 2025-05-09 09:45, Jani Nikula wrote:
> On Mon, 07 Apr 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> Arun R Murthy (5):
>>       drm/i915/display: Populate list of async supported formats/modifiers
>>       drm/i915/display: Add function for format_mod_supported_async
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> for merging these via drm-misc-next.
> 
> Maarten, I see that you did the final pull drm-misc-next pull request
> yesterday... would you consider doing one more once this is merged so we
> can get back in sync faster?
> 
> Thanks,
> Jani.
> 
> 

