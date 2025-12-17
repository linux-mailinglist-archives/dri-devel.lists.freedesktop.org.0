Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3B6CC7EFA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 14:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068DC10ECC4;
	Wed, 17 Dec 2025 13:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 458CB10ECC4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 13:46:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6223106F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 05:45:56 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 92AD43F73F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 05:46:03 -0800 (PST)
Date: Wed, 17 Dec 2025 13:45:18 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Fix kerneldoc in uAPI header
Message-ID: <aUKz7t2FmrDhkmh8@e142607>
References: <20251217132403.3996014-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217132403.3996014-1-boris.brezillon@collabora.com>
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

On Wed, Dec 17, 2025 at 02:24:03PM +0100, Boris Brezillon wrote:
> Fix a typo in a kerneldoc header.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/dri-devel/20251216120049.3ed7e06e@canb.auug.org.au/
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  include/uapi/drm/panthor_drm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index e238c6264fa1..b401ac585d6a 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -350,7 +350,7 @@ struct drm_panthor_gpu_info {
>  	__u32 as_present;
>  
>  	/**
> -	 * @select_coherency: Coherency selected for this device.
> +	 * @selected_coherency: Coherency selected for this device.
>  	 *
>  	 * One of drm_panthor_gpu_coherency.
>  	 */
> -- 
> 2.52.0
> 
