Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B1FB9BD76
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 22:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D291110E7D0;
	Wed, 24 Sep 2025 20:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GmYsDnER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6509310E7D4;
 Wed, 24 Sep 2025 20:20:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7F3F36021A;
 Wed, 24 Sep 2025 20:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC72CC4CEE7;
 Wed, 24 Sep 2025 20:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758745238;
 bh=bLS/hlN1lD3wNbOZhcabpYcqxPoG7q6gXbeLI6MYs8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GmYsDnERidGaRvMZ1cNNX059PHnnjFiRUPfKMH2PnR23eRJCo8HOQsNrExO7aJRWF
 OuuDss9BcUD7/dw8LFS0lLT+stIfFvFnWnhP4AurL6zQXPo1ZV0mP8dDBBtj3pGvnV
 3d5KYr9CYGOCGCR+yoei9Ujwk+V4kiBqBoAj2qq4wwzjr4OsuC04Mol6S/O624w9W8
 bJl1wDvh71jlT8Q9+7NK1ijjby8KTZ8LYWmpHd4cTvIcAxHnl6w/GtI+0gZEfa49t4
 OD/7j/WkobP6BnWpG5uUd72FS8+dAp7fSzvN+EMY/X1eHeKbULVu2qyaW3Xe3423hs
 XPSAOzXxL9fkQ==
Date: Wed, 24 Sep 2025 22:20:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 lvc-project@linuxtesting.org, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH] gpu: i915: fix error return in mmap_offset_attach()
Message-ID: <ammcxcfamq6f6ip35ccre4an7tcnksksifrjy2alq3eh3eqgai@hvsmgmw5i35n>
References: <20250924124852.11-1-alsp705@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924124852.11-1-alsp705@gmail.com>
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

Hi Alexandr,

Please, verision the patch: this is [PATCH v2].

On Wed, Sep 24, 2025 at 03:48:50PM +0300, Alexandr Sapozhnkiov wrote:
> Return value of function drm_vma_node_allow_once(), 
> called at i915_gem_mman.c:672, is not checked.

You've been asked to improve the commit log, but you didn't.
Please reply to this email with the commit log improved as
suggested.

> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>

You forgot to add the r-b tag you received.

> ---

you are missing the changelog.

>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 75f5b0e871ef..eb76f8f2bd95 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -758,8 +758,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>  	mmo = insert_mmo(obj, mmo);
>  	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
>  out:
> -	if (file)
> -		drm_vma_node_allow_once(&mmo->vma_node, file);
> +	if (file) {
> +		err = drm_vma_node_allow_once(&mmo->vma_node, file);
> +		if (err)
> +			goto err;
> +	}

I agree with the change.

Thank you,
Andi

>  	return mmo;
>  
>  err:
> -- 
> 2.43.0
