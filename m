Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C6A05F4C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 15:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFDC10EBBB;
	Wed,  8 Jan 2025 14:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5635A10EBD3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 14:48:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0826B13D5;
 Wed,  8 Jan 2025 06:49:19 -0800 (PST)
Received: from [10.57.5.66] (unknown [10.57.5.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B01A13F673;
 Wed,  8 Jan 2025 06:48:48 -0800 (PST)
Message-ID: <b47c130a-4693-4652-84db-15a24dfc7bb1@arm.com>
Date: Wed, 8 Jan 2025 14:48:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Remove dead code
To: Florent Tomasin <florent.tomasin@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250107173310.88329-1-florent.tomasin@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250107173310.88329-1-florent.tomasin@arm.com>
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

On 07/01/2025 17:33, Florent Tomasin wrote:
> Remove unused function declaration in panthor_gem.h:
> - `panthor_gem_prime_import_sg_table()`
> 
> Remove duplicate macro definitions:
> - `MAX_CSG_PRIO`
> - `MIN_CS_PER_CSG`
> - `MIN_CSGS`
> 
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

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

