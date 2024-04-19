Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F88AAE96
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 14:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A8510FEB7;
	Fri, 19 Apr 2024 12:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRoEviM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F5E10FEB1;
 Fri, 19 Apr 2024 12:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713530164; x=1745066164;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=M94cwTmY2wA2rRmUTGrGazaBWg8b1Rrj2b3Uj08EcyQ=;
 b=MRoEviM3uG/31h3+11wzIaPGxgzbCIQ+AMAz4QEva2lsD+fI4rcW76cX
 y1zYKbl8cnx+ZM0ELZBCdkE7oFR20jFty5WK0FzSPldwTtAckI16swwis
 KeDJmfqSDamyfpPAzaLHHunNaPo+2IM+rxClO5tyyiNHKGvVeShLHenGN
 3xZNi3Wo6FAEDoSjG7hKFJlYlKvf7bfK5F4RZLcC45pW+zEpvnaQEkPc7
 h+/1BuREDTNI2Xjx0twXVo63LwrMjxPDkrKWQucvt71jdnYcSbZpr8S5g
 w+5rAobq4nQ5pDH85WTUuKR27RNoyrdNofZKMkrHFL5IAdrvwi3IhMKA1 g==;
X-CSE-ConnectionGUID: bwstqLIXSVuIzvF+T5NVZw==
X-CSE-MsgGUID: nHskEchsR5+4fHwDmmwTHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12918898"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12918898"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:36:04 -0700
X-CSE-ConnectionGUID: Fo2oSY2US5GSNXTkbtrXjQ==
X-CSE-MsgGUID: Yz67tNn2TKWyBw/0EhVAMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23185924"
Received: from agherasi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.46.119])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:36:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, Maxime Ripard
 <mripard@kernel.org>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v17 0/9] Enable Adaptive Sync SDP Support for DP
In-Reply-To: <f3ec8e22-1963-47e0-8c5d-53a7e6fc73ae@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
 <87a5mvppvd.fsf@intel.com> <20240319-devious-natural-rook-df5f43@houat>
 <f3ec8e22-1963-47e0-8c5d-53a7e6fc73ae@intel.com>
Date: Fri, 19 Apr 2024 15:35:55 +0300
Message-ID: <871q71wmvo.fsf@intel.com>
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

On Thu, 04 Apr 2024, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> On 3/19/2024 3:16 PM, Maxime Ripard wrote:
>> On Mon, Mar 18, 2024 at 04:37:58PM +0200, Jani Nikula wrote:
>>> On Mon, 11 Mar 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
>>>>   An Adaptive-Sync-capable DP protocol converter indicates its
>>>> support by setting the related bit in the DPCD register. This
>>>> is valid for DP and edp as well.
>>>>
>>>> Computes AS SDP values based on the display configuration,
>>>> ensuring proper handling of Variable Refresh Rate (VRR)
>>>> in the context of Adaptive Sync.
>>> [snip]
>>>
>>>> Mitul Golani (9):
>>>>    drm/dp: Add support to indicate if sink supports AS SDP
>>>>    drm: Add Adaptive Sync SDP logging
>>> Maarten, Maxime, Thomas, ack for merging these two patches via
>>> drm-intel-next?
>> Ack
>>
>> Maxime
>
> Thanks for the patch, ack and reviews, pushed to drm-intel-next.

This came up again today [1]. The acks absolutely must be recorded in
the commit messages when pushing the patches.

dim should complain about applying non-i915 patches without acks.

BR,
Jani.


[1] https://lore.kernel.org/r/Zh_Q72gYKMMbge9A@intel.com


-- 
Jani Nikula, Intel
