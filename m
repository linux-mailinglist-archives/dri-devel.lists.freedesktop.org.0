Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315BA80C52B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBB110E388;
	Mon, 11 Dec 2023 09:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4160110E387;
 Mon, 11 Dec 2023 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702288129; x=1733824129;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ic0GPJBgQ3YvW998HxkEiapTj7oEIaYPrJU331ugKoc=;
 b=kJoMB1IAuSxV2QBuYbp0VbXzRBG9m3eKQRr3ZnAC/5JVXso+8OKLmb41
 fLPN/Xjfz8QhUhAu54HaQOCbKk9kT9yQvRb9jjjyzqwsAJLiuPaJz6nt4
 sk0HnLBUa6FgtMylBie3I/eAo5pPCc/H2ytLDnYRoLZVBgb1gehIvTq2+
 IukBlBxg+VKSqE81vDoBPnlNQTcR4KxRj3H9E1yQhTnn/8rw+0b9Uznvg
 bC+n3CxfLEhWKx7x0xyGlcXBtUdPGLP1oNW94Ht/Gix/YjpuTG0it4ebu
 HYeJygJttxhGA7mKHT61FSffiM/yK7AVFnBiE//z+rwVBAdfuYEHp0R/7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1433430"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1433430"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 01:48:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="749220838"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="749220838"
Received: from kbalak2x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.68])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 01:48:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH][next] drm/i915/selftests: Fix spelling mistake
 "initialiased" -> "initialised"
In-Reply-To: <20231209230541.4055786-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231209230541.4055786-1-colin.i.king@gmail.com>
Date: Mon, 11 Dec 2023 11:48:41 +0200
Message-ID: <87v895xe6e.fsf@intel.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 09 Dec 2023, Colin Ian King <colin.i.king@gmail.com> wrote:
> There is a spelling mistake in a pr_err error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, pushed to drm-intel-gt-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index e57f9390076c..d684a70f2c04 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -504,7 +504,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>  	}
>  
>  	if (memchr_inv(ptr, 0, dmabuf->size)) {
> -		pr_err("Exported object not initialiased to zero!\n");
> +		pr_err("Exported object not initialised to zero!\n");
>  		err = -EINVAL;
>  		goto out;
>  	}

-- 
Jani Nikula, Intel
