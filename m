Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3A88AB052
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 16:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D32E10FF1A;
	Fri, 19 Apr 2024 14:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b78Md86P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C7E10FF1B;
 Fri, 19 Apr 2024 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713535778; x=1745071778;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0jDEvt2L6Ys/tEetgWM2Qb3Bb0hmkFKq639paPxTy1Y=;
 b=b78Md86PeUTCaD6hVABkj9e0tvx0FA7ZNkp4lSQsCJHKFVF6gEpMjGBJ
 aTpLi34ByCFYzDClsP3FeFRntWV3CbWG2peA9OF54HVz2t2GNks0YbHm8
 e2cconSLSgiLrpC1iTot/tKAmJzKEwXYIUXO1VLXcUI7WpkYYZV1+/EZv
 4bqmwuBFJQmqNisctV2lNX60UrCPkJ7DagMitRu4M3HcvsKsVqr7lL67f
 O96VIvdPJ9AryNtd/ez86CT0/vbLm/16fLijWB+7PG1iVyR074uiuc5hv
 HcQAv9bxTeFnkDhoGJSXozwPP9glu/Y1Xy6xl8NfFWk28TjPfIyCJ6ebw A==;
X-CSE-ConnectionGUID: fOEHxKv8RSStmIM2JTQkKw==
X-CSE-MsgGUID: u74vz8zYTVKePaFvgGoyNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="31620532"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="31620532"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:09:37 -0700
X-CSE-ConnectionGUID: +tCZE2JFQj2G92kU3rGbnQ==
X-CSE-MsgGUID: TFV4itN/QfSwiIxapHWgJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23411085"
Received: from agherasi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.46.119])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:09:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v17 0/9] Enable Adaptive Sync SDP Support for DP
In-Reply-To: <20240419-bonobo-of-stimulating-dignity-50ad22@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
 <87a5mvppvd.fsf@intel.com> <20240319-devious-natural-rook-df5f43@houat>
 <f3ec8e22-1963-47e0-8c5d-53a7e6fc73ae@intel.com>
 <871q71wmvo.fsf@intel.com>
 <20240419-bonobo-of-stimulating-dignity-50ad22@houat>
Date: Fri, 19 Apr 2024 17:09:29 +0300
Message-ID: <87v84dv3za.fsf@intel.com>
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

On Fri, 19 Apr 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Fri, Apr 19, 2024 at 03:35:55PM +0300, Jani Nikula wrote:
>> On Thu, 04 Apr 2024, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
>> > On 3/19/2024 3:16 PM, Maxime Ripard wrote:
>> >> On Mon, Mar 18, 2024 at 04:37:58PM +0200, Jani Nikula wrote:
>> >>> On Mon, 11 Mar 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
>> >>>>   An Adaptive-Sync-capable DP protocol converter indicates its
>> >>>> support by setting the related bit in the DPCD register. This
>> >>>> is valid for DP and edp as well.
>> >>>>
>> >>>> Computes AS SDP values based on the display configuration,
>> >>>> ensuring proper handling of Variable Refresh Rate (VRR)
>> >>>> in the context of Adaptive Sync.
>> >>> [snip]
>> >>>
>> >>>> Mitul Golani (9):
>> >>>>    drm/dp: Add support to indicate if sink supports AS SDP
>> >>>>    drm: Add Adaptive Sync SDP logging
>> >>> Maarten, Maxime, Thomas, ack for merging these two patches via
>> >>> drm-intel-next?
>> >> Ack
>> >>
>> >> Maxime
>> >
>> > Thanks for the patch, ack and reviews, pushed to drm-intel-next.
>> 
>> This came up again today [1]. The acks absolutely must be recorded in
>> the commit messages when pushing the patches.
>> 
>> dim should complain about applying non-i915 patches without acks.
>
> It doesn't at the moment, this has bitten us a couple of times in
> drm-misc too.

See check_maintainer() that gets called from apply_patch() and
dim_b4_shazam_branch().

It's of limited value, but it should complain while applying non-i915
patches.

> I did a MR to address that that hasn't been reviewed yet:
> https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/40

Yeah, a more generic solution is needed, but I think we should unify
with the above.

BR,
Jani.


-- 
Jani Nikula, Intel
