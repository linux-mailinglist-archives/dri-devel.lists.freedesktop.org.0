Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C079AD2EC2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43F510E482;
	Tue, 10 Jun 2025 07:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="j0njGC3U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0A110E470;
 Tue, 10 Jun 2025 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=VkI4nXK+TS/9EeUuqPQ0SR/T+jH8FR1py6Gdua1yCt4=; b=j0njGC3UPXcWm0z3vckW4pMCjt
 nkvunDF+OMq3AA7GF73Y/5O/P+cNVS6vGBHOuACD6FpVFT9UQK+Td4auN86ig2fIs8fsmw/axWEvu
 0zaZdRaM0cWhvESthyGy3wcmgG9GvNMN+WzlKZSLkBg/GkbMacJICTm/3GUfyqgZwDOuQjpV/Ib7e
 Yp5ENxv04Ut/+uTseM4aPhaNu8MtaT2kxqYNHGeHV9hnVuFMRJHIbGkUHmKbQx2pCuOzNWSffSSff
 OQxSJW4qyB2U5fX9ZZR0asetT4W551WCyTvSNitSt1waxnpuP5hWLbv2H7osuQx5qm3DaVrye/ZSl
 fcJrueYA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uOtUp-00000001kLw-3mFR; Tue, 10 Jun 2025 07:34:12 +0000
Message-ID: <b17709fd-7ca6-40dc-8d9c-7d3a98d9d305@infradead.org>
Date: Tue, 10 Jun 2025 00:34:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: nouveau: Update GSP message queue
 kernel-doc reference
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Dave Airlie <airlied@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
References: <20250610065258.41467-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250610065258.41467-1-bagasdotme@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/9/25 11:52 PM, Bagas Sanjaya wrote:
> Commit c472d828348caf ("drm/nouveau/gsp: move subdev/engine impls to
> subdev/gsp/rm/r535/") moves GSP-RM message queue implementation in
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c to versioned path in
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c, but forgets to
> update kernel-doc reference in nouveau docs, hence triggers htmldocs
> warnings:
> 
> ERROR: Cannot find file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> WARNING: No kernel-doc for file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> 
> Update the reference.
> 
> Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/gpu/nouveau.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
> index b8c801e0068cb0..878fb1ade31e4c 100644
> --- a/Documentation/gpu/nouveau.rst
> +++ b/Documentation/gpu/nouveau.rst
> @@ -25,7 +25,7 @@ providing a consistent API to upper layers of the driver stack.
>  GSP Support
>  ------------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c

Are you sure?  Did that work for you?

I see
/**
 * DOC: GSP message queue element

in drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c but not in the
file that you referenced.  Maybe it just keeps moving around...


This works for me. Please send a v2 if you see the need to.


>     :doc: GSP message queue element
>  
>  .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

-- 
~Randy

