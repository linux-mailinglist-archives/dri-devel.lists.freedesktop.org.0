Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC147F0FB3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 11:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1E810E384;
	Mon, 20 Nov 2023 10:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6181F10E382;
 Mon, 20 Nov 2023 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700474630; x=1732010630;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=z524JU8nouo+pN6TXqDU9LSOHh43q7lsuEG1QBlW4RE=;
 b=Ih+tuXB7pu6MskOiu1kZPVZsz0Eo4R4jmb70mcs2DGenVv0G6HT8bmOB
 w6f5W0Qf93E4eaYnym3nipxWoogY0uoEzQbbzsJTadO89Vhc/XNEWUstt
 k2TlY4ci/SaOPOim/TpQkXnpZi15YWZvIdRR1R0zIs5OYPSORe4OQW7Wx
 ci+lfJz6ADqSeHEDbZBZrvRlI908FZ1NY4QwktUnKbICaiLeTCEQuymJx
 DjRDPWxpXhfsA/SNb+bJ4n8NoL79Jy5bFl1CpGsX1oJGJ91aC9QaZ7CLI
 yCevp6hoTRKNhyvKlKCLD3kc9n9bqGSJynOAY9+jgACPkAuRQWHjO+QvL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="381979688"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="381979688"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:03:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1013547995"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="1013547995"
Received: from avmoskal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.194])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:03:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915: Remove return type from
 i915_drm_client_remove_object
In-Reply-To: <20231113085457.199053-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231113085457.199053-1-tvrtko.ursulin@linux.intel.com>
Date: Mon, 20 Nov 2023 12:03:44 +0200
Message-ID: <87fs10pwqn.fsf@intel.com>
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
Cc: kernel test robot <lkp@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Nov 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> There is no need to return anything in the version which was merged and
> also the implementation of the !CONFIG_PROC_FS wasn't returning anything,
> causing a build failure there.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: e4ae85e364fc ("drm/i915: Add ability for tracking buffer objects per client")
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311110104.8TlHVxUI-lkp@intel.com/

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_drm_client.c | 6 ++----
>  drivers/gpu/drm/i915/i915_drm_client.h | 5 +++--
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index 7efffdaa508d..be9acfd9410e 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -191,22 +191,20 @@ void i915_drm_client_add_object(struct i915_drm_client *client,
>  	spin_unlock_irqrestore(&client->objects_lock, flags);
>  }
>  
> -bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
> +void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
>  {
>  	struct i915_drm_client *client = fetch_and_zero(&obj->client);
>  	unsigned long flags;
>  
>  	/* Object may not be associated with a client. */
>  	if (!client)
> -		return false;
> +		return;
>  
>  	spin_lock_irqsave(&client->objects_lock, flags);
>  	list_del_rcu(&obj->client_link);
>  	spin_unlock_irqrestore(&client->objects_lock, flags);
>  
>  	i915_drm_client_put(client);
> -
> -	return true;
>  }
>  
>  void i915_drm_client_add_context_objects(struct i915_drm_client *client,
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> index 69cedfcd3d69..a439dd789936 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> @@ -70,7 +70,7 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
>  #ifdef CONFIG_PROC_FS
>  void i915_drm_client_add_object(struct i915_drm_client *client,
>  				struct drm_i915_gem_object *obj);
> -bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
> +void i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
>  void i915_drm_client_add_context_objects(struct i915_drm_client *client,
>  					 struct intel_context *ce);
>  #else
> @@ -79,7 +79,8 @@ static inline void i915_drm_client_add_object(struct i915_drm_client *client,
>  {
>  }
>  
> -static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
> +static inline void
> +i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
>  {
>  }

-- 
Jani Nikula, Intel
