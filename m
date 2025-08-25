Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19754B33864
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 10:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9C410E3FA;
	Mon, 25 Aug 2025 08:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuwIYx1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CAF10E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 08:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756108840; x=1787644840;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GG2c4odGFlYu4f5bVIygyXxOEmLBFST+MhVghFfMPEY=;
 b=cuwIYx1I/oGEXoKAeDAeFMhVy+YN6iMQMJQ//R5xVAHqYyLD41OH0l3V
 AlQ6ius0RG7u28+7qMv+TRPkCioy+mzLQJxBrzWVZzcZn9TCXQiqOkbIg
 YG+r8S+BepjX+82XZxIteODDnlvtT4wyRNthje9a+IdYw4vNyX+8hkBxu
 XIaYxPnaiLhJMsdJ5Vk6tMzJpeJaIAjD5+W92Qyq125shE05w+sjgYFoA
 AmwvKskOyat6Cdohr9KPrQVpIObzEqnUFmfzOBp06oDBAczM3KIj21Q8N
 YjXP/kMiBbstz8KZNwfvvFzWuP1TYLzp5ky1i1d4dsS6+8YuNWYVQCrdb w==;
X-CSE-ConnectionGUID: MudgIWAwTECjnUD33lYKZg==
X-CSE-MsgGUID: dffQSMZISuu0Zxc5j4SQnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="61957773"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61957773"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 01:00:39 -0700
X-CSE-ConnectionGUID: LB2Q77Q+QEi6EpNo701nVQ==
X-CSE-MsgGUID: cAmGS6RTTg6CQYfx//dxxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168731238"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.15])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 01:00:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Javier Garcia <rampxxxx@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Javier
 Garcia <rampxxxx@gmail.com>
Subject: Re: [PATCH 2/2] drm: fix kernel-doc struct tag for `drm_modeset_lock`.
In-Reply-To: <20250823075139.34797-2-rampxxxx@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250823075139.34797-1-rampxxxx@gmail.com>
 <20250823075139.34797-2-rampxxxx@gmail.com>
Date: Mon, 25 Aug 2025 11:00:33 +0300
Message-ID: <704edc3cae07cf09f27ff476ff11ca5dd2779520@intel.com>
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

On Sat, 23 Aug 2025, Javier Garcia <rampxxxx@gmail.com> wrote:
> - Add needed "@" to avoid warn messages about duplicated symbols
> as there is function and struct with the same name.
> - The fixed warning is:
>
> 	./Documentation/gpu/drm-kms:476: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
> 	Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]

Please look into why adding @ here appear to fix the issue.

The problem is deeper than what this patch makes it seem, and this
papers over the issue in a way that sets the wrong example for the
future.


BR,
Jani.

>
> Fixes: f3a808817fdb ("drm: fix drm_modeset_lock.h kernel-doc notation")
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
>  include/drm/drm_modeset_lock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
> index ec4f543c3d95..0de7046dc653 100644
> --- a/include/drm/drm_modeset_lock.h
> +++ b/include/drm/drm_modeset_lock.h
> @@ -75,7 +75,7 @@ struct drm_modeset_acquire_ctx {
>  };
>  
>  /**
> - * struct drm_modeset_lock - used for locking modeset resources.
> + * @struct drm_modeset_lock - used for locking modeset resources.
>   * @mutex: resource locking
>   * @head: used to hold its place on &drm_atomi_state.locked list when
>   *    part of an atomic update

-- 
Jani Nikula, Intel
