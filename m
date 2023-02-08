Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE53A68FA66
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 23:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902C110E11B;
	Wed,  8 Feb 2023 22:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E4710E11B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 22:47:13 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DDC6E5C01CF;
 Wed,  8 Feb 2023 17:47:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 08 Feb 2023 17:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1675896432; x=
 1675982832; bh=xhmwzdlAwubvYqvO3mY356QM4o3xt3TfxUknH0ELZiA=; b=C
 TjTNxdiGgSUx0var2qLdDqX4KpUshWXjVDL2n3nM0KJ0oSokO0qibp+uX82TEh8+
 /DU6Rxcwhk3AcJMl/oIcfgUoYD9EXcxTL2xSRJCVVYpqMxZ8pBRA10n/buOVN7oL
 Avx+2FsprcCeE+qS8YS9isNBc6otrnb0sjY2+7SvKfRTETd9PQ5EyOO13x1GjZyP
 84iAZuwqmNR6aFQv6c33WCbSS8lvGVqjwoZpBoisY77blsWMiPN9LjuiqWsJ/kwX
 +1+Eh6H/x6dehq3ClxOr7szeHSdiyb0wn/KZJFQ1efR6bq3Xym8Si9DmjkrQuQSx
 YsY4rm3XNuMjEkjYUvjDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675896432; x=
 1675982832; bh=xhmwzdlAwubvYqvO3mY356QM4o3xt3TfxUknH0ELZiA=; b=M
 25+Ic9OCSdF6U3xffDERIufCJ4yBTvewK45OH4aJBdtshgQlX6bOZwmOWYwdWc7+
 pMEdZ+5B9ZrvO6AzqHfyg80rFQHmcSHT1KqGdPQPfFdxOxqhCEJ6jWbbgTkbLk7A
 dZBSl1dCJcbit5pEJ5w8qfmEh1CpXvUFzNqv8ySDtRldBlVKz9nixxgH3c1RUE0u
 M/y3mtFD/poWh1sE/Oa9grZELuugYhO/ZIVKlz23xHv2ela/KV9xiA+Eu3/AkfWx
 Ea2T7Y7HZRrW/+9sBK6cXIDGewluqrw0FLv3AGkV7Gslw85poJ4v/lL+DQ+mxpoR
 NsPasX3qUAB2bZAuqUE+Q==
X-ME-Sender: <xms:cCbkY8gu5LKMDtgeUnyk2j1mL9G8nDBZwO6cVBIyaU8dewSA10yspA>
 <xme:cCbkY1C3hQUFGzmVLA38Ikp4AZskcKZfCzyBwhq8pARKd-tF49jFYZjMsCOxuE078
 QWfh7mY42zk6MCpM2Q>
X-ME-Received: <xmr:cCbkY0FFwdHblfz8fIwCQHdfmApzJUCEQvFR0CFAJImenkiGKtZTIpz8egZyJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehuddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepfdgm
 fdforggriicuofhomhgsrghsrgifrghlrgculdggofifrghrvgdmfdcuoehmrggriihmse
 hfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepteffhfegvddvgfeutdet
 heffjeelhffgudefudeujedvveehveeuhfethfdtjeffnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrgiimhesfhgrshhtmhgrihhlrdgt
 ohhm
X-ME-Proxy: <xmx:cCbkY9ROUm6wL9iAJ8l1jHlpV892LypQGmtllCUktuh_GTP2StEw-w>
 <xmx:cCbkY5zMkau_an87LyQ9hYxkEiaCqSVV9VGkAJtvSTmfHk83LZ28rg>
 <xmx:cCbkY77innNaQxd20N6PTClX7ukKyBvipDl2d8CXCNTwkHOO7he_GQ>
 <xmx:cCbkY7uAfWQ9dmfypULrKU9E1YPDgenDeyNfytvo9BrDd4q2Ni6Q7w>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 17:47:12 -0500 (EST)
Message-ID: <e0fa3947-be02-24d9-022c-f9820cd57901@fastmail.com>
Date: Wed, 8 Feb 2023 14:47:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/vmwgfx: Do not drop the reference to the handle too
 soon
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230208215340.2103955-1-zack@kde.org>
From: "\"Maaz Mombasawala (VMware)" <maazm@fastmail.com>
In-Reply-To: <20230208215340.2103955-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/23 13:53, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> It is possible for userspace to predict the next buffer handle and
> to destroy the buffer while it's still used by the kernel. Delay
> dropping the internal reference on the buffers until kernel is done
> with them.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
> Cc: <stable@vger.kernel.org> # v5.17+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 3 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     | 4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 1 -
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 43ffa5c7acbd..65bd88c8fef9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -708,7 +708,8 @@ int vmw_dumb_create(struct drm_file *file_priv,
>  	ret = vmw_gem_object_create_with_handle(dev_priv, file_priv,
>  						args->size, &args->handle,
>  						&vbo);
> -
> +	/* drop reference from allocate - handle holds it now */
> +	drm_gem_object_put(&vbo->tbo.base);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index 51bd1f8c5cc4..d6baf73a6458 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -133,8 +133,6 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>  	(*p_vbo)->tbo.base.funcs = &vmw_gem_object_funcs;
>  
>  	ret = drm_gem_handle_create(filp, &(*p_vbo)->tbo.base, handle);
> -	/* drop reference from allocate - handle holds it now */
> -	drm_gem_object_put(&(*p_vbo)->tbo.base);
>  out_no_bo:
>  	return ret;
>  }
> @@ -161,6 +159,8 @@ int vmw_gem_object_create_ioctl(struct drm_device *dev, void *data,
>  	rep->map_handle = drm_vma_node_offset_addr(&vbo->tbo.base.vma_node);
>  	rep->cur_gmr_id = handle;
>  	rep->cur_gmr_offset = 0;
> +	/* drop reference from allocate - handle holds it now */
> +	drm_gem_object_put(&vbo->tbo.base);
>  out_no_bo:
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> index 9d4ae9623a00..d18fec953fa7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -867,7 +867,6 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
>  			goto out_unlock;
>  		}
>  		vmw_bo_reference(res->guest_memory_bo);
> -		drm_gem_object_get(&res->guest_memory_bo->tbo.base);
>  	}
>  
>  	tmp = vmw_resource_reference(&srf->res);


LGTM!

Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>

-- 
Maaz Mombasawala (VMware) <maazm@fastmail.com>

