Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE8D8B9DD1
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 17:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F4310EA15;
	Thu,  2 May 2024 15:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22D6110EA15
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 15:52:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 626DE339;
 Thu,  2 May 2024 08:52:55 -0700 (PDT)
Received: from [10.1.36.41] (e122027.cambridge.arm.com [10.1.36.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C0BB3F793;
 Thu,  2 May 2024 08:52:29 -0700 (PDT)
Message-ID: <60e058d0-0aac-4931-8552-c1663adca3be@arm.com>
Date: Thu, 2 May 2024 16:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/panthor: Document
 drm_panthor_tiler_heap_destroy::handle validity constraints
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20240502154025.1425278-1-boris.brezillon@collabora.com>
 <20240502154025.1425278-6-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240502154025.1425278-6-boris.brezillon@collabora.com>
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

On 02/05/2024 16:40, Boris Brezillon wrote:
> Make sure the user is aware that drm_panthor_tiler_heap_destroy::handle
> must be a handle previously returned by
> DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  include/uapi/drm/panthor_drm.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index b8220d2e698f..aaed8e12ad0b 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -939,7 +939,11 @@ struct drm_panthor_tiler_heap_create {
>   * struct drm_panthor_tiler_heap_destroy - Arguments passed to DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY
>   */
>  struct drm_panthor_tiler_heap_destroy {
> -	/** @handle: Handle of the tiler heap to destroy */
> +	/**
> +	 * @handle: Handle of the tiler heap to destroy.
> +	 *
> +	 * Must be a valid heap handle returned by DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE.
> +	 */
>  	__u32 handle;
>  
>  	/** @pad: Padding field, MBZ. */

