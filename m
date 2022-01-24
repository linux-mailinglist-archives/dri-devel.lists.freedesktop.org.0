Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D21F4983E7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3988F10E31B;
	Mon, 24 Jan 2022 15:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 47A0E10E31B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 15:58:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBEE7D6E;
 Mon, 24 Jan 2022 07:58:45 -0800 (PST)
Received: from [192.168.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33C7B3F766;
 Mon, 24 Jan 2022 07:58:45 -0800 (PST)
Message-ID: <9238e858-df20-6c61-011a-1f2b3e685db6@foss.arm.com>
Date: Mon, 24 Jan 2022 15:58:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/arm: Fix hdlcd selects to add DRM_GEM_CMA_HELPER for
 build
Content-Language: en-US
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
To: dri-devel@lists.freedesktop.org
References: <20220124145816.2466883-1-carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <20220124145816.2466883-1-carsten.haitzler@foss.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry - I meant disregard THIS one - following patch is right.

On 1/24/22 14:58, carsten.haitzler@foss.arm.com wrote:
> From: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> Without DRM_GEM_CMA_HELPER HDLCD won't build. This needs to be there too.
> 
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> ---
>   drivers/gpu/drm/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
> index 58a242871b28..9eaceb981d92 100644
> --- a/drivers/gpu/drm/arm/Kconfig
> +++ b/drivers/gpu/drm/arm/Kconfig
> @@ -6,6 +6,7 @@ config DRM_HDLCD
>   	depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
>   	depends on COMMON_CLK
>   	select DRM_KMS_HELPER
> +        select DRM_GEM_CMA_HELPER
>   	help
>   	  Choose this option if you have an ARM High Definition Colour LCD
>   	  controller.
