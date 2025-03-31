Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D46DA765B7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 14:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35478961D;
	Mon, 31 Mar 2025 12:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSs0tLVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1A210E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743423775; x=1774959775;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hxW1lV/r8oPbwLoRABuWVuSGWYgO/Jc77S/mTKjJ66I=;
 b=RSs0tLVVQ0l7B1TCiihXmHXn5mcw7Nq71RvIhzrpiXd+jXPsjPhhBClN
 gI/rrK52Y6QgL3lr27fh83vxSuA6aJ+rzX3aSQmMpjvriHMFqoGxsqeXQ
 wMUypNot5sL3/24bsqq5/VzgbOGZkOyMV1mfqz7IdmN2x1ZAHQeVC5Z8B
 PjSU0S5MalEZ2+tl1az/SEQn2suNLw4lZHnH3lqiAh2moTEsc/+WXZs8R
 TvDvlL+0A3jZ+6gT2w4BF8GwXnFWzAu2Jxj5oTBE2whV2/yAZX0TddF6u
 eZYQaZd1ytqu8T4ez7TyRYu2RKWhzs/m+LxyGwSeIOZsI6IDPkikSkzja A==;
X-CSE-ConnectionGUID: RNAGJGFhTeiVW2jgWqqD4Q==
X-CSE-MsgGUID: Q94ecF3HTISHCgBrnmB/Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44714211"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44714211"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 05:22:50 -0700
X-CSE-ConnectionGUID: 2VlgL3poQgaPm4CXIWOj7A==
X-CSE-MsgGUID: 6wFg+3GiTrWUAofH3xIBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126066577"
Received: from pszymich-mobl2.ger.corp.intel.com (HELO [10.245.112.211])
 ([10.245.112.211])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 05:22:47 -0700
Message-ID: <1a4053db-740a-4a26-bc24-6f0100f3055d@linux.intel.com>
Date: Mon, 31 Mar 2025 14:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] PM fixes in Metric Steamer code
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, lizhi.hou@amd.com
References: <20250325114306.3740022-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250325114306.3740022-1-maciej.falkowski@linux.intel.com>
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

Applied to drm-misc-fixes

On 3/25/2025 12:43 PM, Maciej Falkowski wrote:
> This patches contains two fixes for Metric Stream:
>   - Fix deadlock that may occur when
>     executing runtime resume during cold boot where
>     ms_lock will be already held there,
>   - Fix warning to warn for suspend status only if
>     the runtime PM is enabled.
> 
> Jacek Lawrynowicz (2):
>   accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
>   accel/ivpu: Fix PM related deadlocks in MS IOCTLs
> 
>  drivers/accel/ivpu/ivpu_debugfs.c |  4 ++--
>  drivers/accel/ivpu/ivpu_ms.c      | 24 ++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 

