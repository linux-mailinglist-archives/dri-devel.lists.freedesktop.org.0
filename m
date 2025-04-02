Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B44A78BD5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7213B10E72E;
	Wed,  2 Apr 2025 10:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D29710E72E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:19:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 082951063;
 Wed,  2 Apr 2025 03:19:48 -0700 (PDT)
Received: from [10.57.15.238] (unknown [10.57.15.238])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B8EA3F63F;
 Wed,  2 Apr 2025 03:19:44 -0700 (PDT)
Message-ID: <bde220ff-2d28-48a4-bc60-08479cb79196@arm.com>
Date: Wed, 2 Apr 2025 11:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/panthor: Fix GPU_COHERENCY_ACE[_LITE]
 definitions
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250401182348.252422-1-boris.brezillon@collabora.com>
 <20250401182348.252422-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250401182348.252422-2-boris.brezillon@collabora.com>
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

On 01/04/2025 19:23, Boris Brezillon wrote:
> GPU_COHERENCY_ACE and GPU_COHERENCY_ACE_LITE definitions have been
> swapped.
> 
> Changes in v2:
> - New patch
> 
> Reported-by: Liviu Dudau <liviu.dudau@arm.com>
> Fixes: 546b366600ef ("drm/panthor: Add GPU register definitions")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_regs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index b7b3b3add166..a7a323dc5cf9 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -133,8 +133,8 @@
>  #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
>  
>  #define GPU_COHERENCY_PROTOCOL				0x304
> -#define   GPU_COHERENCY_ACE				0
> -#define   GPU_COHERENCY_ACE_LITE			1
> +#define   GPU_COHERENCY_ACE_LITE			0
> +#define   GPU_COHERENCY_ACE				1
>  #define   GPU_COHERENCY_NONE				31
>  
>  #define MCU_CONTROL					0x700

