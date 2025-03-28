Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB9A748A5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 11:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0565310E9DB;
	Fri, 28 Mar 2025 10:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZL6EmQk+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6F610E9DA;
 Fri, 28 Mar 2025 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743158795; x=1774694795;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pkCIVidlW+xUA8a12iAvYcIOv3QWSvZNAy+X7yunKNs=;
 b=ZL6EmQk+lW1i0401Ho9zwyK7PzIECFukjtHRrJVaUPzNRR7EB5IgIvB8
 OnEstarsPEzuGEVdCqNY1tJYYvtViYrY8mkU2xAB3ndM8OpeYIcyH9YuN
 6iiUH2n0kHLV2deeTCik0eEQPKe/5Z1GI2u0koe/jr1hyAiCLQyyLUUlA
 LLfaLTt3Q9Qkq4YF5rq2CIwSu5P6OoHjwXCteid+i61BfB/HKhLcF8sI1
 928IZzCnuH/9b35CHeDbDrZvt0nmYRUqjU0PwI7TFJzKFRQXtZDwSVm7N
 8jCvSs+L8nDqDjs2yKhcNx182rYhyJvd8VIL1AVKl2RrF8VOzcXUhM2iJ Q==;
X-CSE-ConnectionGUID: OcsjMycTQuunv5LGhd6NTA==
X-CSE-MsgGUID: W0lPBf1zTc6ZYiJz+Z8zZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44432598"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44432598"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:46:35 -0700
X-CSE-ConnectionGUID: uhEZ4ZJhSX+3IShoAxy1uQ==
X-CSE-MsgGUID: bXys1AR8R5+MBbTh44mHWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="126337752"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.94])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:46:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] drm/i915/gem: Convert SPDX headers to single-line format
In-Reply-To: <20250327232629.2939-1-andi.shyti@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250327232629.2939-1-andi.shyti@linux.intel.com>
Date: Fri, 28 Mar 2025 12:46:29 +0200
Message-ID: <87msd54em2.fsf@intel.com>
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

On Fri, 28 Mar 2025, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Replace multi-line SPDX license headers with single-line
> equivalents (// SPDX-License-Identifier: MIT or /* ... */ for
> headers), as preferred by current kernel coding style.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel
