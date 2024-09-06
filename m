Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AC996E9CC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 08:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4B910E17C;
	Fri,  6 Sep 2024 06:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VHQLyubF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701C410E17C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 06:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725603185;
 bh=2puHZGA6xQO1YuAznvDyxapPEb2tfEuN2YvLjPORTLU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VHQLyubFi0Zydb1hJvqIuWrWhuf8arsHbeAh6DYQTmvOEtIF9151zJ9X8kTSfemXR
 PPmBbpxGwOeySK8KZ3eshFWUySRnLk75fXRVcDfvGyFzFfMNuyCPIFk3hpK4ipDQiz
 8wH18SxV+4nnAAbfTRH6i1WkELNPn9NM1PonbxDeJvlBwnqpMtHoVBgzU/3bEOlBLP
 qEoib5lKiZgb578baeYvfLi8cnSWj1Y+xdXsaT8+Wp1qWb0Rmohd44uc10ZJQzmn95
 7D45DyeYMiAIZru0A0K8ALkF0WidCCfFwtXWGt0nBKtyTr9P4RbLJ8Zm8Gy+JcGv3V
 3OukHmu44SN2w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6BDBE17E0F88;
 Fri,  6 Sep 2024 08:13:05 +0200 (CEST)
Date: Fri, 6 Sep 2024 08:13:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mary Guillemard <mary.guillemard@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/2] drm/panthor: Add PANTHOR_GROUP_PRIORITY_REALTIME
 group priority
Message-ID: <20240906081302.4aba8c45@collabora.com>
In-Reply-To: <20240905173222.252641-3-mary.guillemard@collabora.com>
References: <20240905173222.252641-2-mary.guillemard@collabora.com>
 <20240905173222.252641-3-mary.guillemard@collabora.com>
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

On Thu,  5 Sep 2024 19:32:22 +0200
Mary Guillemard <mary.guillemard@collabora.com> wrote:

> This adds a new value to drm_panthor_group_priority exposing the
> realtime priority to userspace.
> 
> This is required to implement NV_context_priority_realtime in Mesa.
> 
> v2:
> - Add Steven Price r-b
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   | 2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 --
>  include/uapi/drm/panthor_drm.h          | 7 +++++++
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 0caf9e9a8c45..7b1db2adcb4c 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1041,7 +1041,7 @@ static int group_priority_permit(struct drm_file *file,
>  				 u8 priority)
>  {
>  	/* Ensure that priority is valid */
> -	if (priority > PANTHOR_GROUP_PRIORITY_HIGH)
> +	if (priority > PANTHOR_GROUP_PRIORITY_REALTIME)
>  		return -EINVAL;
>  
>  	/* Medium priority and below are always allowed */
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 91a31b70c037..86908ada7335 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -137,8 +137,6 @@ enum panthor_csg_priority {
>  	 * non-real-time groups. When such a group becomes executable,
>  	 * it will evict the group with the lowest non-rt priority if
>  	 * there's no free group slot available.
> -	 *
> -	 * Currently not exposed to userspace.
>  	 */
>  	PANTHOR_CSG_PRIORITY_RT,
>  
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 1fd8473548ac..011a555e4674 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -720,6 +720,13 @@ enum drm_panthor_group_priority {
>  	 * Requires CAP_SYS_NICE or DRM_MASTER.
>  	 */
>  	PANTHOR_GROUP_PRIORITY_HIGH,
> +
> +	/**
> +	 * @PANTHOR_GROUP_PRIORITY_REALTIME: Realtime priority group.
> +	 *
> +	 * Requires CAP_SYS_NICE or DRM_MASTER.
> +	 */
> +	PANTHOR_GROUP_PRIORITY_REALTIME,
>  };
>  
>  /**

