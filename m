Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568BD93AD30
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A375310E0C8;
	Wed, 24 Jul 2024 07:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+F10Y4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356D510E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721806459; x=1753342459;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ryU4IBCBceUxEUDP2SiVcXZERvqZxabEiR5XZy1XpYo=;
 b=V+F10Y4qb/vPb0gkDUi8Bbpx/8QzJqlHcVOlv+mG3QrcUUWtOaxAmoye
 cb6izeZf90W8QSOF9yWvPEIAW8NBTVBq6wnD31c54t1RQiCiYW2TPFB42
 QpxwC/r1wvRIn9Jw27v0+0BPrjIDqCtBBw7JDHYsyZfjCrbV0ZPhqcq9k
 JsbOUMZPru4LKy9OXppASqeN4U2oBEYs5yzk4bDhmiOBU+r13IR68FAj0
 RSC6uRmcDHeawN8UwFgIDwFSplophWod1Hal7JAXU1nLdvt81IK3yb5an
 KPu8tISd8IeDKUZhImO5qWzUpK0yFtClj38Uy8LdzXg1A2jjNdUA/7maZ w==;
X-CSE-ConnectionGUID: 51hRiu14QQ+GG+nzM+QWVQ==
X-CSE-MsgGUID: ntspb0YVQbmw5LhMwzzUsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="23276749"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="23276749"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 00:34:19 -0700
X-CSE-ConnectionGUID: y5Aewy0cQm+wkYhiNRBGBg==
X-CSE-MsgGUID: rERyPg1CTq+4t4DFPxXG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="57303592"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.156])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 00:34:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Philipp Stanner <pstanner@redhat.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Philipp
 Stanner <pstanner@redhat.com>, Marco Pagani <marpagan@redhat.com>
Subject: Re: [PATCH] drm/scheduler: Use ternary operator in standardized manner
In-Reply-To: <20240715071533.12936-1-pstanner@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240715071533.12936-1-pstanner@redhat.com>
Date: Wed, 24 Jul 2024 10:34:10 +0300
Message-ID: <87wmlbfdl9.fsf@intel.com>
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

On Mon, 15 Jul 2024, Philipp Stanner <pstanner@redhat.com> wrote:
> drm_sched_init() omits the middle operand when using the ternary
> operator to set the timeout_wq if one has been passed.
>
> This is a non-standardized GNU extension to the C language [1].
>
> It decreases code readability and might be read as a bug. Furthermore,
> it is not consistent with all other places in drm/scheduler where the
> ternary operator is used.
>
> Replace the expression with the standard one.

The GCC extension is widely used in the kernel for brevity. Arguably
duplicating the first operand is more error prone than omitting it.

Consistency within scheduler may be a valid point, but I'd consider
removing the redundant middle operand instead.

BR,
Jani.

>
> [1] https://gcc.gnu.org/onlinedocs/gcc-14.1.0/gcc/Conditionals.html
>
> Suggested-by: Marco Pagani <marpagan@redhat.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..02cf9c37a232 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1257,7 +1257,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->credit_limit = credit_limit;
>  	sched->name = name;
>  	sched->timeout = timeout;
> -	sched->timeout_wq = timeout_wq ? : system_wq;
> +	sched->timeout_wq = timeout_wq ? timeout_wq : system_wq;
>  	sched->hang_limit = hang_limit;
>  	sched->score = score ? score : &sched->_score;
>  	sched->dev = dev;

-- 
Jani Nikula, Intel
