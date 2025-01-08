Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D97A0550F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 09:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DA410E7F8;
	Wed,  8 Jan 2025 08:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fHyYr319";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D323C10E7F8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736323970;
 bh=WRmkL+4symXQ+ONKJqDNAlYNMmru+NMXqDhNYOALqUY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fHyYr319dN6xUBlzHgKxLqclFeAO/h7rMpbNYYWxuQBtqoOgx/6OWb8FqTR1LbZpV
 Lum7mOU3rpVQ1OVbMhlM/CwLrCyLv8m1/lC3vNWZy0FotxcrHijH8q7irgz/FkhhVD
 4mKz3r5RgWLbc3WjpgywJ1v6WVF/P+2bDE3vsQRnyJyrRXPzS0wwtLgrN7OYFoK+sq
 yVcX5E5RjRnYEwWO2ufWe/BdJujD0e1TXCrs3tqwT9tqkJZHRhYI7iDI8zrQyUGpXw
 15+cAsP614BOHkIB6JYhJRaJ5QCCjPtbfbfo39sgP6FhAy95HqtDW09bxEToIat34v
 f1Wqh1Yp5D7kA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 209B917E152A;
 Wed,  8 Jan 2025 09:12:50 +0100 (CET)
Date: Wed, 8 Jan 2025 09:12:44 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, <nd@arm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/panthor: Remove dead code
Message-ID: <20250108091244.0a7eae0c@collabora.com>
In-Reply-To: <20250107173310.88329-1-florent.tomasin@arm.com>
References: <20250107173310.88329-1-florent.tomasin@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Tue, 7 Jan 2025 17:33:09 +0000
Florent Tomasin <florent.tomasin@arm.com> wrote:

> Remove unused function declaration in panthor_gem.h:
> - `panthor_gem_prime_import_sg_table()`
> 
> Remove duplicate macro definitions:
> - `MAX_CSG_PRIO`
> - `MIN_CS_PER_CSG`
> - `MIN_CSGS`
> 
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    | 1 -
>  drivers/gpu/drm/panthor/panthor_gem.h   | 5 -----
>  drivers/gpu/drm/panthor/panthor_sched.c | 3 ---
>  3 files changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 68eb4fb4d3a8..4a9c4afa9ad7 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -201,7 +201,6 @@ struct panthor_fw_section {
>  
>  #define MIN_CS_PER_CSG				8
>  #define MIN_CSGS				3
> -#define MAX_CSG_PRIO				0xf
>  
>  #define CSF_IFACE_VERSION(major, minor, patch)	\
>  	(((major) << 24) | ((minor) << 16) | (patch))
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index e43021cf6d45..5749ef2ebe03 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -85,11 +85,6 @@ struct panthor_gem_object *to_panthor_bo(struct drm_gem_object *obj)
>  
>  struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size);
>  
> -struct drm_gem_object *
> -panthor_gem_prime_import_sg_table(struct drm_device *ddev,
> -				  struct dma_buf_attachment *attach,
> -				  struct sg_table *sgt);
> -
>  int
>  panthor_gem_create_with_handle(struct drm_file *file,
>  			       struct drm_device *ddev,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 77b184c3fb0c..5844a7f639e0 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -88,9 +88,6 @@
>  
>  #define JOB_TIMEOUT_MS				5000
>  
> -#define MIN_CS_PER_CSG				8
> -
> -#define MIN_CSGS				3
>  #define MAX_CSG_PRIO				0xf
>  
>  #define NUM_INSTRS_PER_CACHE_LINE		(64 / sizeof(u64))

