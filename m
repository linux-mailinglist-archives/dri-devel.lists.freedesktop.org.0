Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FBB8C7693
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1109710ECCF;
	Thu, 16 May 2024 12:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="hw0gb46n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB7E10ECCF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 12:37:00 +0000 (UTC)
X-Envelope-To: jani.nikula@intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715863018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r04OWwAV6eA+faXUNBmKwuom7bvhLBgHLac87pt1QOQ=;
 b=hw0gb46ny2v+HvV7NXffk9l8Afg9gqMvJ65EWd0CM8zOs2FoRESiyCSD3gj1HG8eVSBEWU
 xQaf6CykNbaZX4FIgHAmIqGC0mhfBHF1FPfL7jO3gRBYMSxQvWxkqzoGmm6nxcEEN4SdIY
 C0KEI2kIcAyi0vc3SR2SA6KnDaqAmLk=
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: airlied@gmail.com
X-Envelope-To: torvalds@linux-foundation.org
Message-ID: <d24aa187-88b4-4651-9634-f8324880c823@linux.dev>
Date: Thu, 16 May 2024 20:36:54 +0800
MIME-Version: 1.0
Subject: Re: drm: have config DRM_WERROR depend on !WERROR
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, airlied@gmail.com,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20240516083343.1375687-1-jani.nikula@intel.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240516083343.1375687-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 5/16/24 16:33, Jani Nikula wrote:
> If WERROR is already enabled, there's no point in enabling DRM_WERROR or
> asking users about it.
> 
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/r/CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com
> Fixes: f89632a9e5fa ("drm: Add CONFIG_DRM_WERROR")
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Wow, you successfully get Linus's attention, haha.

> ---
>   drivers/gpu/drm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 026444eeb5c6..d0aa277fc3bf 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -450,6 +450,7 @@ config DRM_PRIVACY_SCREEN
>   config DRM_WERROR
>   	bool "Compile the drm subsystem with warnings as errors"
>   	depends on DRM && EXPERT
> +	depends on !WERROR
>   	default n
>   	help
>   	  A kernel build should not cause any compiler warnings, and this

-- 
Best regards
Sui
