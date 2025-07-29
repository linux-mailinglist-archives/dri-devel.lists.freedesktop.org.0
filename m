Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30D3B15607
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 01:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2A810E0FC;
	Tue, 29 Jul 2025 23:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="cWcKApOF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB0910E0FC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 23:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=XjCUQoijn+VHziSL44vr/+oUMR1LsJbsYTyzN9g744s=; b=cWcKApOFbv58gk1Y1Rd9evKWwF
 tFbXZOrBQPHQIxLF2QLjOhjP153OAtT0yxmHr6JQ0OVISfq2NAWAOgo3kPlWS+T5wkRmihgBDyeSV
 f1vXImMbxVnxKkdypd7YhOg8++gwhObdsIB1shvrvM3vo8wwJd+75JQKW6ghAlTRiduUCO+D1yHvA
 9JFaE2t1iqpWcUlEvC/XxLW6XDOTeavoMBS5p5RAQrcAhBvBcjBJEZmFIkTNXLqzW0jhdMAxsufuP
 oI/Xoumiu79wjHv30YSKvyLLF/ArQbLk/7ZbTiviPZezVZz6xvSj4jPWq2vsSXXMXUEVbzQJ1V01K
 FHumHPPw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1ugtoK-00000000J0w-2haF; Tue, 29 Jul 2025 23:32:44 +0000
Message-ID: <2d6cb0c8-6fe1-43d9-b744-0a0a95cf30d3@infradead.org>
Date: Tue, 29 Jul 2025 16:32:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] backlight: ktd2801: Depend on GPIOLIB
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
 <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
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



On 7/29/25 10:18 AM, Duje Mihanović wrote:
> The LEDS_EXPRESSWIRE library used by the driver requires GPIOLIB. Make
> sure this dependency is not left unsatisfied.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/b6c481bb-e854-405e-a428-90301789fe20@infradead.org/

s/Link/Closes/

> Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

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

-- 
~Randy
