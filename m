Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FF56C4551
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C70E10E36E;
	Wed, 22 Mar 2023 08:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D08A10E36E;
 Wed, 22 Mar 2023 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679474930; x=1711010930;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PlMYbLd1qJQMPYx4SczrL0/ko7mvh83PpGJQuHvX9K0=;
 b=Pc+hfscwvG9GmnQnUJJFb8KB/TBoTdQOylOGVsI0vBlJlTgRUgI84Hie
 a8emmhqXvR+6d9011Q6GCdg/99Rw8KXC4XrHOl6liWVwYXRGCQxE4eTpo
 nLDHTcDvAvkiP5IMMKt1LdW/WB/xnxUeL2Y86qNvfc21hHUEdOjQTpnUa
 qqMAODh1s3tlLu9jeIrByveaYDOHLM3fAkLYHJcSA9PcewJ3H99DhlGv6
 EGBNPjgA1YCsGzWwhfl6dY2805XogtVCe1E3ID97pEmnBeliWPAUKgvNY
 h/bmi/A8/S2bFlFrxBoyud0BgJGi4S3UGUEwRt1YqXoSd0qNwx/k+V6MZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339201881"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="339201881"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 01:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631909903"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="631909903"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.22.233])
 ([10.213.22.233])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 01:48:30 -0700
Message-ID: <fc3306a6-bae9-25dd-980e-cc00a2cd71d7@intel.com>
Date: Wed, 22 Mar 2023 09:48:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use i915 instead of dev_priv insied
 the file_priv structure
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20230322001611.632321-1-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230322001611.632321-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.03.2023 01:16, Andi Shyti wrote:
> In the process of renaming all instances of 'dev_priv' to 'i915',
> start using 'i915' within the 'drm_i915_file_private' structure.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Apparently the last struct member with this name, R.I.P.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 22 ++++++++++-----------
>   drivers/gpu/drm/i915/i915_drm_client.c      |  2 +-
>   drivers/gpu/drm/i915/i915_file_private.h    |  2 +-
>   drivers/gpu/drm/i915/i915_gem.c             |  2 +-
>   4 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 6d639ca24dfbb..5402a7bbcb1d1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -364,7 +364,7 @@ static int set_proto_ctx_vm(struct drm_i915_file_private *fpriv,
>   			    struct i915_gem_proto_context *pc,
>   			    const struct drm_i915_gem_context_param *args)
>   {
> -	struct drm_i915_private *i915 = fpriv->dev_priv;
> +	struct drm_i915_private *i915 = fpriv->i915;
>   	struct i915_address_space *vm;
>   
>   	if (args->size)
> @@ -733,7 +733,7 @@ static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
>   			         struct i915_gem_proto_context *pc,
>   			         const struct drm_i915_gem_context_param *args)
>   {
> -	struct drm_i915_private *i915 = fpriv->dev_priv;
> +	struct drm_i915_private *i915 = fpriv->i915;
>   	struct set_proto_ctx_engines set = { .i915 = i915 };
>   	struct i915_context_param_engines __user *user =
>   		u64_to_user_ptr(args->value);
> @@ -813,7 +813,7 @@ static int set_proto_ctx_sseu(struct drm_i915_file_private *fpriv,
>   			      struct i915_gem_proto_context *pc,
>   			      struct drm_i915_gem_context_param *args)
>   {
> -	struct drm_i915_private *i915 = fpriv->dev_priv;
> +	struct drm_i915_private *i915 = fpriv->i915;
>   	struct drm_i915_gem_context_param_sseu user_sseu;
>   	struct intel_sseu *sseu;
>   	int ret;
> @@ -913,7 +913,7 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>   		break;
>   
>   	case I915_CONTEXT_PARAM_PRIORITY:
> -		ret = validate_priority(fpriv->dev_priv, args);
> +		ret = validate_priority(fpriv->i915, args);
>   		if (!ret)
>   			pc->sched.priority = args->value;
>   		break;
> @@ -934,12 +934,12 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>   		if (args->size)
>   			ret = -EINVAL;
>   		else
> -			ret = proto_context_set_persistence(fpriv->dev_priv, pc,
> +			ret = proto_context_set_persistence(fpriv->i915, pc,
>   							    args->value);
>   		break;
>   
>   	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
> -		ret = proto_context_set_protected(fpriv->dev_priv, pc,
> +		ret = proto_context_set_protected(fpriv->i915, pc,
>   						  args->value);
>   		break;
>   
> @@ -1770,7 +1770,7 @@ void i915_gem_context_close(struct drm_file *file)
>   	unsigned long idx;
>   
>   	xa_for_each(&file_priv->proto_context_xa, idx, pc)
> -		proto_context_close(file_priv->dev_priv, pc);
> +		proto_context_close(file_priv->i915, pc);
>   	xa_destroy(&file_priv->proto_context_xa);
>   	mutex_destroy(&file_priv->proto_context_lock);
>   
> @@ -2206,7 +2206,7 @@ finalize_create_context_locked(struct drm_i915_file_private *file_priv,
>   
>   	lockdep_assert_held(&file_priv->proto_context_lock);
>   
> -	ctx = i915_gem_create_context(file_priv->dev_priv, pc);
> +	ctx = i915_gem_create_context(file_priv->i915, pc);
>   	if (IS_ERR(ctx))
>   		return ctx;
>   
> @@ -2223,7 +2223,7 @@ finalize_create_context_locked(struct drm_i915_file_private *file_priv,
>   
>   	old = xa_erase(&file_priv->proto_context_xa, id);
>   	GEM_BUG_ON(old != pc);
> -	proto_context_close(file_priv->dev_priv, pc);
> +	proto_context_close(file_priv->i915, pc);
>   
>   	return ctx;
>   }
> @@ -2352,7 +2352,7 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
>   	GEM_WARN_ON(ctx && pc);
>   
>   	if (pc)
> -		proto_context_close(file_priv->dev_priv, pc);
> +		proto_context_close(file_priv->i915, pc);
>   
>   	if (ctx)
>   		context_close(ctx);
> @@ -2505,7 +2505,7 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
>   			 * GEM_CONTEXT_CREATE starting with graphics
>   			 * version 13.
>   			 */
> -			WARN_ON(GRAPHICS_VER(file_priv->dev_priv) > 12);
> +			WARN_ON(GRAPHICS_VER(file_priv->i915) > 12);
>   			ret = set_proto_ctx_param(file_priv, pc, args);
>   		} else {
>   			ret = -ENOENT;
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index b09d1d3865740..e8fa172ebe5ee 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -130,7 +130,7 @@ void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
>   {
>   	struct drm_file *file = f->private_data;
>   	struct drm_i915_file_private *file_priv = file->driver_priv;
> -	struct drm_i915_private *i915 = file_priv->dev_priv;
> +	struct drm_i915_private *i915 = file_priv->i915;
>   	struct i915_drm_client *client = file_priv->client;
>   	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>   	unsigned int i;
> diff --git a/drivers/gpu/drm/i915/i915_file_private.h b/drivers/gpu/drm/i915/i915_file_private.h
> index f428778696925..c9cb8eecacde0 100644
> --- a/drivers/gpu/drm/i915/i915_file_private.h
> +++ b/drivers/gpu/drm/i915/i915_file_private.h
> @@ -15,7 +15,7 @@ struct drm_file;
>   struct i915_drm_client;
>   
>   struct drm_i915_file_private {
> -	struct drm_i915_private *dev_priv;
> +	struct drm_i915_private *i915;
>   
>   	union {
>   		struct drm_file *file;
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 35950fa914068..2ba922fbbd5ff 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1313,7 +1313,7 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
>   	}
>   
>   	file->driver_priv = file_priv;
> -	file_priv->dev_priv = i915;
> +	file_priv->i915 = i915;
>   	file_priv->file = file;
>   	file_priv->client = client;
>   

