Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63933685C34
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 01:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C18410E3A5;
	Wed,  1 Feb 2023 00:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D29B10E3A5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 00:34:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2364F3200932;
 Tue, 31 Jan 2023 19:34:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 31 Jan 2023 19:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1675211667; x=
 1675298067; bh=F1zgPnu9638/1L+uhTRgouSFhdA2BukVapgoZVYxt4Y=; b=J
 RViv5ATKKUTrOb+2pFfK8QJNklkznAPbJHYBLTwuYPt/YS9aNBi9eJlKWS4wZkGy
 bxLfD98gS6H1swJygFNAaILLhiasVDvjzSQRkRPpSHP1pHAmJm1whCAGOU+H6pXN
 VZrbgXV/xjJ7mMGTMDpC/ZDZHaXwHQFdrQaiOAVQUqwgwv6HjZsfNIbGnlthN6Ar
 vNuM8L5mPbWcF4J7t16NCTYLlCmqs1ZDO00ZW8YbOJJA/wdMMAIoriwuDaFaypXQ
 2EWwoopKS+6Nr6aohFLLfURw1ml29qwaBuJFY3SBgKlUIotbUEMhu7ITtpkMR6j8
 eGgbx+1QZwvC/lUpc9ekQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675211667; x=
 1675298067; bh=F1zgPnu9638/1L+uhTRgouSFhdA2BukVapgoZVYxt4Y=; b=T
 Ln99GF7AT0z/71+SrFG7GuQ56BOTaqDbLNmKY/Nt7puysiY6o3pn7emWSXp7jihL
 ZjRk1IsnowP10cq3wDV2Yq9OSiAr2KSg0pN6vHAIKsS3x0xQBYhyuOzEE0SR/N3/
 kBToLY/2Noln5j26JrCvuOE2+UuFdyW+6JVvIRTke8FB07+1Tvj8Lwku8BCMDZIq
 +DAyAsh8S4Ab3l9TLuyQ64CSVJbXYcam9zQLaBlfnJscCG2qe4yOgYxtfwBT+xD9
 rWxkxkaL9HdOvqvIZTxVmP7gqRFBlbokfRqiYPjPbXAa7mwB9nDSvwllzrUdkT97
 XReWN1ZG3/SwSfb8eCwiQ==
X-ME-Sender: <xms:k7PZYxi-XumeCX_ugOMcTvTZM7f_m88CEqsYurJTQjVSAJH3clewFw>
 <xme:k7PZY2CcNtKWUwDpWbGbyyjB5QNLA0ZjLkv80yt6RrIuq0kWS7FrXrh5awaKVs5Tv
 Uv9avzH6PD4Up6MO_U>
X-ME-Received: <xmr:k7PZYxEtn_EKI0fAtctQ8dqyQ1D0_q_GCx1xlEQzRWUJkMcnwPjYWG4pdDjDwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpedfmgdf
 ofgrrgiiucfoohhmsggrshgrfigrlhgrucdlggfofigrrhgvmddfuceomhgrrgiimhesfh
 grshhtmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhgedvvdfguedtteeh
 ffejlefhgfdufeduueejvdevheevuefhtefhtdejffenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrggriihmsehfrghsthhmrghilhdrtgho
 mh
X-ME-Proxy: <xmx:k7PZY2Ti0nGNkD48rGefeHfyXY7JH3hEgFxjF1_1yXQNLGhNJVsMyQ>
 <xmx:k7PZY-wApJYk8Rnk703LX2G2tGhOeEQmM3PMWX7ztBoyzELGeGukGA>
 <xmx:k7PZY84IH382EQ1zwbGFDYDwuzPngeSnVj5DzgZVAaTnpl47ylkenQ>
 <xmx:k7PZYy965sZSOIiaEGgYZX3gci5j7bndkFhhCpLfZF6FQN2XWC-Ryw>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Jan 2023 19:34:26 -0500 (EST)
Message-ID: <52e93e1e-0e89-ff11-153e-506b40e0d678@fastmail.com>
Date: Tue, 31 Jan 2023 16:34:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/8] drm/vmwgfx: Cleanup the vmw bo usage in the cursor
 paths
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230131033542.953249-1-zack@kde.org>
 <20230131033542.953249-6-zack@kde.org>
From: "\"Maaz Mombasawala (VMware)" <maazm@fastmail.com>
In-Reply-To: <20230131033542.953249-6-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/30/23 19:35, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> Base mapped count is useless because the ttm unmap functions handle
> null maps just fine so completely remove all the code related to it.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h  |  3 ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 12 +-----------
>  2 files changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> index e2dadd68a16d..2ede1e28d7ce 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -44,7 +44,6 @@ struct vmw_resource;
>   * struct vmw_bo - TTM buffer object with vmwgfx additions
>   * @base: The TTM buffer object
>   * @res_tree: RB tree of resources using this buffer object as a backing MOB
> - * @base_mapped_count: ttm BO mapping count; used by KMS atomic helpers.
>   * @cpu_writers: Number of synccpu write grabs. Protected by reservation when
>   * increased. May be decreased without reservation.
>   * @dx_query_ctx: DX context if this buffer object is used as a DX query MOB
> @@ -55,8 +54,6 @@ struct vmw_resource;
>  struct vmw_bo {
>  	struct ttm_buffer_object base;
>  	struct rb_root res_tree;
> -	/* For KMS atomic helpers: ttm bo mapping count */
> -	atomic_t base_mapped_count;
>  
>  	atomic_t cpu_writers;
>  	/* Not ref-counted.  Protected by binding_mutex */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 6780391c57ea..1082218a1cfc 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -669,8 +669,7 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
>  		const int ret = ttm_bo_reserve(&vps->bo->base, true, false, NULL);
>  
>  		if (likely(ret == 0)) {
> -			if (atomic_read(&vps->bo->base_mapped_count) == 0)
> -			    ttm_bo_kunmap(&vps->bo->map);
> +			ttm_bo_kunmap(&vps->bo->map);
>  			ttm_bo_unreserve(&vps->bo->base);
>  		}
>  	}
> @@ -744,9 +743,6 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
>  
>  		ret = ttm_bo_kmap(&vps->bo->base, 0, PFN_UP(size), &vps->bo->map);
>  
> -		if (likely(ret == 0))
> -			atomic_inc(&vps->bo->base_mapped_count);
> -
>  		ttm_bo_unreserve(&vps->bo->base);
>  
>  		if (unlikely(ret != 0))
> @@ -786,7 +782,6 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
>  	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
>  	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
>  	s32 hotspot_x, hotspot_y;
> -	bool dummy;
>  
>  	hotspot_x = du->hotspot_x;
>  	hotspot_y = du->hotspot_y;
> @@ -828,11 +823,6 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
>  						hotspot_x, hotspot_y);
>  	}
>  
> -	if (vps->bo) {
> -		if (ttm_kmap_obj_virtual(&vps->bo->map, &dummy))
> -			atomic_dec(&vps->bo->base_mapped_count);
> -	}
> -
>  	du->cursor_x = new_state->crtc_x + du->set_gui_x;
>  	du->cursor_y = new_state->crtc_y + du->set_gui_y;
>  

LGTM!

Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
-- 
Maaz Mombasawala (VMware) <maazm@fastmail.com>

