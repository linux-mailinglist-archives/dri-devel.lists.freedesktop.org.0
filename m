Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172F7A776BC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FDB10E52C;
	Tue,  1 Apr 2025 08:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZunZtjGb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA2F10E518;
 Tue,  1 Apr 2025 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743497170; x=1775033170;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Q7VbP+OM6RZM51VIVzDa4IreTwBZkx3kkLxPIuuKwFQ=;
 b=ZunZtjGbMHckHlY8/OQJ6Kr54TmyVMFBJmXP25ngK3R3U2fh3cD2gTIi
 bmvKnPRadBPhyBWvErZR12WP+KMSO6pOH9zaLtVwoJgpQ7v58oT8E4KAg
 U4x4N8FY37BvK4NzBhV39EExakh1lXzSxkY+cyfQiKNQ5notoSQIeSTxj
 6ZRF1cRd0GTtYQcQbK8ENLtiUSr87q+649lvtPlveoYfqLlfQwMrVjyJc
 TUp01kJ+VWCiP891H2dQDkiQMGqqf6BDQNQhIshi5jdzSF5JlyFDQ3ae1
 7gs7cLu8RBdYVueDlOIdBzE6pivZSpcUET+NvotaVqZtdd8JJ6rV5voND Q==;
X-CSE-ConnectionGUID: FIliFjTlTvWi0NOOEU0l3g==
X-CSE-MsgGUID: QcgnWlW3RL2CATMk3rv6hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44718587"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="44718587"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:46:10 -0700
X-CSE-ConnectionGUID: qTj9HiagTA6x9dSJxwZcIw==
X-CSE-MsgGUID: LSxATFcBRZWdu+Owe3rvZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="131041277"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:46:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Justin
 Forbes <jforbes@redhat.com>, Nicolas Chauvet <kwizart@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: Add __nonstring annotations for
 unterminated strings
In-Reply-To: <37e1da82-736f-44a4-af51-036f9e3182f4@leemhuis.info>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250310222355.work.417-kees@kernel.org>
 <37e1da82-736f-44a4-af51-036f9e3182f4@leemhuis.info>
Date: Tue, 01 Apr 2025 11:46:03 +0300
Message-ID: <87ecyc46d0.fsf@intel.com>
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

On Mon, 31 Mar 2025, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> On 10.03.25 23:23, Kees Cook wrote:
>> When a character array without a terminating NUL character has a static
>> initializer, GCC 15's -Wunterminated-string-initialization will only
>> warn if the array lacks the "nonstring" attribute[1]. Mark the arrays
>> with __nonstring to and correctly identify the char array as "not a C
>> string" and thereby eliminate the warning.
>> 
>> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117178 [1]
>> [...]
>> Signed-off-by: Kees Cook <kees@kernel.org>
>
> To provide another small data point:
>
> Tested-by: Thorsten Leemhuis <linux@leemhuis.info>
>
> A "Compile-Tested-by", to be precise: after a handful similar patches
> reached mainline recently this is the only one I still need to compile
> the pretty broad Fedora rawhide config on rawhide using the GCC 15
> pre-release it currently includes. The latter or the final will
> hopefully soon also reach Fedora 42 beta as well and bring the "[1]"
> mentioned in the patch description above to F42 -- which will be
> released in a few weeks, so I guess it would be nice to have this patch
> mainlined rather sooner that later to avoid more people running into this.

Thanks for testing, though I've merged [1] instead.

BR,
Jani.



[1] https://lore.kernel.org/r/20250327124739.2609656-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
