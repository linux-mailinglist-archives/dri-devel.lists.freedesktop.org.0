Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B9CB56F2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 11:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB0110E7C9;
	Thu, 11 Dec 2025 10:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mU+VG7hQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DA710E7C6;
 Thu, 11 Dec 2025 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765447263;
 bh=6zJiNj1L6vIB85ihK7K/8OX+7soTd/RpprQ5f+V4x74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mU+VG7hQmQxkswGmekpUaQ3s18Lyw37XYE4C60b/4rlkvBHbrAqSg7Uv3x8RJrx4m
 UbVhKwZi/Ac5BxVFKMkNsmmO9ynNa6uIGZMqsCikaTIL9fSpdj/fdwEq6cS/cr0PMm
 +ODZNAvnIwX4kbTohttJu6zXZGEepf//vYc4FZRVeCLF1v/7PJb6f5K0n736vMNZA3
 mSppa60dvaxkhO+3Y63KoI5lXKMqP6Skcez8h3R2W++ZKFkk3qHc3YLqnnT3//K+QX
 FO8XGVfcLA+oaYCwzFNa5iel/vLgXDc2tq7ZY6rf1jcpTxAIoiKNUrwl/fhucH07kb
 VbObVxP9msb3A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D2DE717E1544;
 Thu, 11 Dec 2025 11:01:02 +0100 (CET)
Date: Thu, 11 Dec 2025 11:00:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, ogabbay@kernel.org, mamin506@gmail.com,
 lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 01/13] drm/gem-shmem: Fix typos in documentation
Message-ID: <20251211110056.26a53786@fedora>
In-Reply-To: <20251209140141.94407-2-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
 <20251209140141.94407-2-tzimmermann@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue,  9 Dec 2025 14:41:58 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Fix the compile-time warnings
> 
> Warning: drm_gem_shmem_helper.c:104 function parameter 'shmem' not described in 'drm_gem_shmem_init'
> Warning: drm_gem_shmem_helper.c:104 function parameter 'size' not described in 'drm_gem_shmem_init'
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index dc94a27710e5..f4e77f75ec81 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -96,7 +96,8 @@ static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_obj
>  /**
>   * drm_gem_shmem_init - Initialize an allocated object.
>   * @dev: DRM device
> - * @obj: The allocated shmem GEM object.
> + * @shmem: The allocated shmem GEM object.
> + * @size: Buffer size in bytes
>   *
>   * Returns:
>   * 0 on success, or a negative error code on failure.

