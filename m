Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35014AB0C1E
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 09:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C6410E9D5;
	Fri,  9 May 2025 07:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIGdQlgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DCC10E9D4;
 Fri,  9 May 2025 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746776976; x=1778312976;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Uyuy+e4DBC1UIWqVBYpg3UTGYaZs31GjYXCCFnVAogk=;
 b=cIGdQlgn7zcOyLQoXc3/N+92LD+toTQCc57wgXEWGuSMNOF+4TNB1aAp
 YdY7SnNjwfa79qWdZDArgt/pTU+pwOV+7ujLuIpwYjZcd91QQZ6UuyBea
 m0u4zq0aSVPWgC4Wqg0GPgWI0G0A0igSqMMaTIJ7gDenCdCFpRxg0jCkT
 X0VZikCU5E9kYl5H2KxTQpcI9JFBGjkEVv844iiYgt9vQAc1ystXfiHHa
 kl97ZCHhbrxa29dAUOVTO1frtgZgYfQEDkG3NVLQAeY5W75lkUFCKCRzm
 9VMh36RX6aIBnTLseMYjv6v2mXD/zhakWCwuCVbbJ87gBIXBOfQShlFRQ Q==;
X-CSE-ConnectionGUID: OaUpezNJSZeDU4of6hmJ6Q==
X-CSE-MsgGUID: AzgY3RKsTZ6FMvDxBdov1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="73973743"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="73973743"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:49:36 -0700
X-CSE-ConnectionGUID: 5vTepq8mRNSFuMqulfYk5w==
X-CSE-MsgGUID: ZYIlvWvfRmKgCpWTatJ1Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="136473103"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.55])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:49:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, Arun R Murthy
 <arun.r.murthy@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 Naveen Kumar <naveen1.kumar@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
In-Reply-To: <87plgimdme.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
 <87plgimdme.fsf@intel.com>
Date: Fri, 09 May 2025 10:49:31 +0300
Message-ID: <87msbmmdf8.fsf@intel.com>
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

On Fri, 09 May 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 07 Apr 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> Arun R Murthy (5):
>>       drm/i915/display: Populate list of async supported formats/modifiers
>>       drm/i915/display: Add function for format_mod_supported_async
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
>
> for merging these via drm-misc-next.

And I mean the last three patches touching i915 of course. But there's a
boatload of shortlogs in the cover letter?! Only have *one* shortlog
with stats that is formatted by git, none of the other cruft.

>
> Maarten, I see that you did the final pull drm-misc-next pull request
> yesterday... would you consider doing one more once this is merged so we
> can get back in sync faster?
>
> Thanks,
> Jani.

-- 
Jani Nikula, Intel
