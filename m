Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F45FA1DD3C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 21:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0E110E10F;
	Mon, 27 Jan 2025 20:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="JR3piSwz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CDF10E10F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 20:14:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738008882; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cqHzVlXavfxL+btJsuGWjsbN6DF3j85/9VbYmfU/lf6N7eGpMUPg4GTUwOfix807yE0+x8xZc/jb6wEG5gUqjS8fXhYWMH3v9tP4Ae390MgOQ9x7rU+ZF1rgVEs5yIj/glO9t8Jv5y5UXDkofSxOLFbu7qzftDMXYU4Qx8Cjbws=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738008882;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GoeF47GY6aQuCi6qHyAqiz3Bk15fhHngbcFRSbnsNuA=; 
 b=MXTcOOJ+Sq/2RUXu1xWH7VwPipjZLH6XjZnZ7HtEdCrIoQAqFGdqsNwJaTe+u8Q1KhjaUdXJwANetsAXIsQOPY+kIM6aa/w2b1YCzNozEJbo9FuWKHJyeZanhfc8mYgMsMex5lWZ85IlwbJK8KkxSHki7CS+FpzVbktvPHILXo4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738008882; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=GoeF47GY6aQuCi6qHyAqiz3Bk15fhHngbcFRSbnsNuA=;
 b=JR3piSwzUGZmu9SGIHJLBh0fb6lrIb+j0GiZbOWc5DqxlzlJjSfCi9lXd0H6ZdFc
 OKKUf5Xfn6i6c97vV1VLPWubKwaFwYtYqR0enY4K5CSYRSBMQWgObNvS0XJT1X/ltxg
 wQCXa0EnXQNdC89u2uAR2K8fywCrT/ufH+1MQIu0=
Received: by mx.zohomail.com with SMTPS id 1738008848956580.7879104808565;
 Mon, 27 Jan 2025 12:14:08 -0800 (PST)
Date: Mon, 27 Jan 2025 20:14:05 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
Subject: Re: [RFC v2 8/8] drm/panthor: Expose the panthor perf ioctls
Message-ID: <ym5gk6uhwteiv3p4kvjjvpujval3rfjsv2lnzzgmq3cvnmfv5o@qbwtvgnqyyui>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-9-lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211165024.490748-9-lukas.zapolskas@arm.com>
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

I don't know what the usual practice is when adding a new DRM driver ioctl(), but wouldn't it make
more sense to add the PERF_CONTROL one to the panthor_drm_driver_ioctls array in this patch instead?

Other than that:

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 11.12.2024 16:50, Lukas Zapolskas wrote:
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 2848ab442d10..ef081a383fa9 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1654,6 +1654,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
>   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
> + * - 1.3 - adds DEV_QUERY_PERF_INFO query
> + *         adds PERF_CONTROL ioctl
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1667,7 +1669,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 2,
> +	.minor = 3,
>  
>  	.gem_create_object = panthor_gem_create_object,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> -- 
> 2.25.1


Adrian Larumbe
