Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9D5AC3EB9
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 13:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2F610E360;
	Mon, 26 May 2025 11:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anqVxfWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F6B10E349;
 Mon, 26 May 2025 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748259836; x=1779795836;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nXK9aHaSnCBzwUGJaW6Xqlp0wxZVNyxxWlId6RErS58=;
 b=anqVxfWh41q238rdBQv+v2awMaGbjEw/j9DhLFvk6pxLzZevwRasu+2X
 a/8s43TU7hFbNH8YXAuXS7poyt1TOVdH9k4sX2l3hhbhmue8c43h2xxLY
 vqVDP0ubO4tzDMMhzX61GDBzKkDJrqZl9HxLf0ttVt3HdpwYanwKA+2Kr
 mIruoWZPLNaxgJicpBwiOJfAg9g8IZSz2HYUMqeEWypWKUBTvvkOj30JJ
 KK5DyBycJEJJ65fjNS/G4C5PJ3QIrkXNR6P3+vhr35ScDNwTY4cH4lm/M
 q38nl7Qf2h1qFrerO0l9JO6Mceh+iZBncq+VG8HiBcqIPErF0Auxgatrs Q==;
X-CSE-ConnectionGUID: cBoNSP6wQNa3YaXEJlnajw==
X-CSE-MsgGUID: AmU5+ISuTMa4RP+LOW6ZVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="61591141"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="61591141"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 04:43:55 -0700
X-CSE-ConnectionGUID: xfzwo1CIS0iv6jvh6ljwEA==
X-CSE-MsgGUID: PTlF88xVRkOo+lY9E+wOFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="173267939"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.224])
 ([10.245.245.224])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 04:43:53 -0700
Message-ID: <224ad9ad-dd59-447f-978d-24e6e315d5fc@linux.intel.com>
Date: Mon, 26 May 2025 13:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] Panel Replay + Adaptive sync
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250521115319.2380655-1-jouni.hogander@intel.com>
 <4ba5f8375dea2ee73b430730abd11cd45fd12fcc.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <4ba5f8375dea2ee73b430730abd11cd45fd12fcc.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Seems to be just some register definitions.

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Best regards,
~Maarten

On 2025-05-22 07:25, Hogander, Jouni wrote:
> Hello DRM Maintainers,
> 
> I have two patches (01/12 and 02/12) in this set I would like to merge
> via drm-intel/drm-intel-next. Is that ok to you? They are touching i915
> display driver and drm_dp.h header and rest of the patch set is
> depending on those changes. Can one of you ack those two patches?
> 
> Thank You in Advance,
> 
> Jouni Högander
> 
> On Wed, 2025-05-21 at 14:53 +0300, Jouni Högander wrote:
>> This patch set is adding missing configuration to have Panel Replay
>> and Adaptive Sync enabled simultaneously. Also some issues identified
>> while debugging are fixed:
>>
>> 1. Source PORT ALPM configuration has to made during modeset.
>> 2. PHY_CMN1_CONTROL is not written according to HAS document
>> 3. Wrong register field definitions for PORT_ALPM_LFPS_CTL.
>>
>> Patches are tested on LunarLake and PantherLake using our reference
>> panel supporting
>> Adaptive Sync and Panel Replay.
>>
>> v4:
>>   - added DP_DSC_DECODE_CAPABILITY definitions
>>   - use defined shift instead of hardcoded value
>> v3:
>>   - comment about DP2.1 corrected as DP2.1a
>>   - referring patch removed from commit message
>> v2:
>>   - rework Panel Replay DPCD register definitions
>>   - do not use hardcoded indices while accessing intel_dp->pr_dpcd
>>   - ensure ALPM registers are not written on platform where they do
>>     not exist
>>   - remove kerneldoc comments
>>
>> Jouni Högander (12):
>>   drm/panelreplay: Panel Replay capability DPCD register definitions
>>   drm/dp: Add Panel Replay capability bits from DP2.1 specification
>>   drm/i915/psr: Read all Panel Replay capability registers from DPCD
>>   drm/i915/alpm: Add PR_ALPM_CTL register definitions
>>   drm/i915/alpm: Write PR_ALPM_CTL register
>>   drm/i915/psr: Add interface to check if AUXLess ALPM is needed by
>> PSR
>>   drm/i915/alpm: Add new interface to check if AUXLess ALPM is used
>>   drm/i915/alpm: Move port alpm configuration
>>   drm/i915/display: Add PHY_CMN1_CONTROL register definitions
>>   drm/i915/display: Add function to configure LFPS sending
>>   drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP
>>   drm/i915/psr: Do not disable Panel Replay in case VRR is enabled
>>
>>  drivers/gpu/drm/i915/display/intel_alpm.c     | 72 +++++++++++++----
>> --
>>  drivers/gpu/drm/i915/display/intel_alpm.h     |  4 ++
>>  drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 32 +++++++++
>>  drivers/gpu/drm/i915/display/intel_cx0_phy.h  |  2 +
>>  .../gpu/drm/i915/display/intel_cx0_phy_regs.h |  3 +
>>  drivers/gpu/drm/i915/display/intel_ddi.c      | 12 ++++
>>  .../drm/i915/display/intel_display_types.h    |  4 +-
>>  drivers/gpu/drm/i915/display/intel_psr.c      | 44 +++++++-----
>>  drivers/gpu/drm/i915/display/intel_psr.h      |  2 +
>>  drivers/gpu/drm/i915/display/intel_psr_regs.h | 14 +++-
>>  include/drm/display/drm_dp.h                  | 24 +++++--
>>  11 files changed, 168 insertions(+), 45 deletions(-)
>>
> 

