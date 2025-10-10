Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D0BCDA96
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 17:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4299010EC42;
	Fri, 10 Oct 2025 15:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5823110EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 15:01:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 068A21595;
 Fri, 10 Oct 2025 08:00:58 -0700 (PDT)
Received: from [10.57.35.12] (unknown [10.57.35.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5AD03F66E;
 Fri, 10 Oct 2025 08:01:03 -0700 (PDT)
Message-ID: <a6cb480f-5530-4bd6-a27d-18a1af9b9fe9@arm.com>
Date: Fri, 10 Oct 2025 16:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] drm/panfrost: Bump the driver version to 1.6
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
 <20251010101147.3290604-14-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251010101147.3290604-14-boris.brezillon@collabora.com>
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

On 10/10/2025 11:11, Boris Brezillon wrote:
> From: Faith Ekstrand <faith.ekstrand@collabora.com>
> 
> Bump the driver version to reflect the new cached-CPU mapping
> capability.
> 
> v2:
> - Quickly describe what the new version exposes in the commit message
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 0f51b1dc1abc..9316daa91543 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -934,6 +934,9 @@ static void panfrost_debugfs_init(struct drm_minor *minor)
>   * - 1.4 - adds SET_LABEL_BO
>   * - 1.5 - adds JM_CTX_{CREATE,DESTROY} ioctls and extend SUBMIT to allow
>   *	   context creation with configurable priorities/affinity
> + * - 1.6 - adds PANFROST_BO_MAP_WB, PANFROST_IOCTL_SYNC_BO,
> + *	   PANFROST_IOCTL_QUERY_BO_INFO and
> + *	   DRM_PANFROST_PARAM_SELECTED_COHERENCY
>   */
>  static const struct drm_driver panfrost_drm_driver = {
>  	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
> @@ -946,7 +949,7 @@ static const struct drm_driver panfrost_drm_driver = {
>  	.name			= "panfrost",
>  	.desc			= "panfrost DRM",
>  	.major			= 1,
> -	.minor			= 5,
> +	.minor			= 6,
>  
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,

