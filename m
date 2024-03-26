Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D45A88BEFF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED78D10E043;
	Tue, 26 Mar 2024 10:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9758910E043
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:13:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 827482F4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 03:14:12 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4CFD3F64C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 03:13:38 -0700 (PDT)
Date: Tue, 26 Mar 2024 10:13:35 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/panthor: Fix wrong kernel-doc format in the uAPI
 header
Message-ID: <ZgKfz3YGRsfxGma9@e110455-lin.cambridge.arm.com>
References: <20240326093055.411932-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326093055.411932-1-boris.brezillon@collabora.com>
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

On Tue, Mar 26, 2024 at 10:30:55AM +0100, Boris Brezillon wrote:
> The kernel doc prefix is /** not /*.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  include/uapi/drm/panthor_drm.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 373df80f41ed..dadb05ab1235 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -336,10 +336,10 @@ struct drm_panthor_gpu_info {
>  	/** @tiler_present: Bitmask encoding the tiler units exposed by the GPU. */
>  	__u64 tiler_present;
>  
> -	/* @core_features: Used to discriminate core variants when they exist. */
> +	/** @core_features: Used to discriminate core variants when they exist. */
>  	__u32 core_features;
>  
> -	/* @pad: MBZ. */
> +	/** @pad: MBZ. */
>  	__u32 pad;
>  };
>  
> -- 
> 2.44.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
