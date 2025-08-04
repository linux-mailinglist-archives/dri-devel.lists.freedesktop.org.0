Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C5B19D49
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 10:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A494210E14B;
	Mon,  4 Aug 2025 08:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMAGUcQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BCC10E14B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754294714; x=1785830714;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=vgspxbl8UxVr3PzohpAkVXZh1F5wHQ0BCxizAeL/4LQ=;
 b=RMAGUcQoyhypvA1dQIrzD0TMU0pFJGUMY+pABjDdR6b5lyuZi3sDNx2S
 7pmoJgWZAHmhBarJ9OWPNv2/QLVWueiWgrDYJhf9jrO54b9/Xgb9mMu8D
 5CbmVmFVV2fdx/XABm30FNlgEP9NwGjTM+rfX37XV78MMM+3dzFps21Xe
 HY42tL5T1OPp8ChXJpQNAguFveiR0yj/61jBad1k2hQBSd0enY3INpvxk
 h7bz/Ts15RtOLkifyBpTHn6HSc45MhzTZUb9pv0UnxUmErUHre+m8umm4
 GlAhIGDgUBxUaVZJUsCckTEGUgB/mjJokzJs7pG4jffQr/T1uoGqvPhAx Q==;
X-CSE-ConnectionGUID: xkXOUxvpQU24ZcziygkGfw==
X-CSE-MsgGUID: dN1aUt92RmKuY9YEwFfSXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67920292"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="67920292"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 01:05:14 -0700
X-CSE-ConnectionGUID: VRLisOH4TNmyX7at9d6+TA==
X-CSE-MsgGUID: 0aQY5NA5Rdu23p3nRsdSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="169402040"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.215])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 01:05:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alvaro Madela <alvaromadela@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [i915] Arrow Lake [8086:7d67] - No video output with kernel
 6.16 (Ubuntu 24.04)
In-Reply-To: <CALNP1JaK=LoavsmHcBXjr+ZboHFgteXR1pcPOSLxSvgdYHiD3A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CALNP1JaK=LoavsmHcBXjr+ZboHFgteXR1pcPOSLxSvgdYHiD3A@mail.gmail.com>
Date: Mon, 04 Aug 2025 11:05:10 +0300
Message-ID: <3345f07dda89195727b132812ae5d10db9ae680a@intel.com>
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

On Fri, 01 Aug 2025, Alvaro Madela <alvaromadela@gmail.com> wrote:
> Hello Intel Linux Graphics Team,
>
> I'm using an Intel Arrow Lake GPU (8086:7d67) on Ubuntu 24.04 (kernel 6.16)
> and facing complete lack of video output without 'nomodeset'.

Please file a bug as described at [1].

BR,
Jani.

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


-- 
Jani Nikula, Intel
