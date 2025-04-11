Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E54CA867E0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 23:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E6610E0F0;
	Fri, 11 Apr 2025 21:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="oYxRtJfA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ACE10E0F0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 21:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=5ao/hAEK1tVECI3MffyX4CyT/zLaj3fsGpJIOrxlYbs=; b=oYxRtJfA8n7+wbug1XMpDb8jVb
 TAyW2sBXKhvwwhtvIXy9Xa/2mzgAFAL/Dh45l08V3+A/RH0zgv8juv+Pxeh6l+yFOLh5MXKizXYrw
 xjUdGn+vyp5Nao20+31I8V7IOBugD1sjk4qj6Ib303/jYS9p4QZuWkmPptsL+Bqgo1vY2xSUYVX2G
 C0uSMpJ4tbxI3OZFsX+PcnXzlZl5WRZ4jZbQblHoyQDPXP6j2cTdKE5i557zB6JqqQLdrRkp643oe
 9gnXFKsyo/RIqGbkV25z64iIM+B0NWfTljJajYzeUBrmjnYxhf0cGA7Mxx4TVD6xjRESgeexg53+8
 4jyyabWw==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1u3Lau-000000095I7-2VSU; Fri, 11 Apr 2025 21:07:26 +0000
Message-ID: <dcc36d2f-8dad-47f9-b7c4-4e1f558545ff@infradead.org>
Date: Fri, 11 Apr 2025 14:07:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] backlight: ktd2801: depend on GPIOLIB
To: duje.mihanovic@skole.hr, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250411-ktd-fix-v1-1-e7425d273268@skole.hr>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250411-ktd-fix-v1-1-e7425d273268@skole.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 4/11/25 10:22 AM, Duje Mihanović via B4 Relay wrote:
> From: Duje Mihanović <duje.mihanovic@skole.hr>
> 
> The ExpressWire library used by the driver depends on GPIOLIB, and by
> extension the driver does as well. This is not reflected in the driver's
> Kconfig entry, potentially causing Kconfig warnings. Fix this by adding
> the dependency.
> 
> Link: https://lore.kernel.org/all/5cf231e1-0bba-4595-9441-46acc5255512@infradead.org

s/Link:/Closes:/

> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>o

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/video/backlight/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index d9374d208ceebbf8b3c27976e9cb4d725939b942..37341474beb9982f7099711e5e2506081061df46 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -185,6 +185,7 @@ config BACKLIGHT_KTD253
>  
>  config BACKLIGHT_KTD2801
>  	tristate "Backlight Driver for Kinetic KTD2801"
> +	depends on GPIOLIB || COMPILE_TEST
>  	select LEDS_EXPRESSWIRE
>  	help
>  	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire
> 
> ---
> base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
> change-id: 20250411-ktd-fix-7a5e5d8657b8
> 
> Best regards,

-- 
~Randy
