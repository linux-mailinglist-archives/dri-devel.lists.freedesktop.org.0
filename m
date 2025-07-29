Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA5EB15604
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 01:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E3610E07C;
	Tue, 29 Jul 2025 23:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="qXY3+Dc5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6064210E07C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 23:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=NjWBJG7tnyKrxfyIh+OKHLF6Inx68AtsDOyMPzd00Xo=; b=qXY3+Dc5FFgFT73FrOZTpW43H9
 1MOGRE3croRQW30WJYSzm3QEhT04m0KgdTav2qWvyXm/ZJbq25Oz315aMkjU5SbGI9B3e1uqmVMkA
 h2MCi4SXAlVwRURC5p5F+6z2nRbfVU0AtFJGc4fz2oz6ErPrddFj0bwwwxPsrh45eUrlAE2jGHdhZ
 6+e/JM6RkgS8KWGSYj18rDkF3WkSVFnSRL9K+JsMcpBJQbbsVQuAidJMhsJtKo/bCk4UsrLgeLbj4
 g99plku8t7MAZKXMyVHulmm/x8wgvQaHx7j2jOpWJi1a1jYJoWrIIHobDd9s+qRid9Qwvm/ToKyAZ
 jr0/uOVA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1ugtnc-00000000IvB-0qmF; Tue, 29 Jul 2025 23:32:00 +0000
Message-ID: <70e9842b-83dc-44f8-b27d-260ff9543b36@infradead.org>
Date: Tue, 29 Jul 2025 16:31:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] leds: Drop duplicate LEDS_EXPRESSWIRE config
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
 <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
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
> While moving said config symbol out of the "if NEW_LEDS" block, I
> accidentally left a copy inside that block. Remove it.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/b6c481bb-e854-405e-a428-90301789fe20@infradead.org/

s/Link/Closes/

> Fixes: 2cd0d1db31e7 ("leds: expresswire: Don't depend on NEW_LEDS")
> Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/leds/Kconfig | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 6e3dce7e35a490df050cb4cd8e98611028c8dce1..8098b7b49c9decb591a894fe514a7ee757da5b44 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -214,10 +214,6 @@ config LEDS_EL15203000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-el15203000.
>  
> -config LEDS_EXPRESSWIRE
> -	bool
> -	depends on GPIOLIB
> -
>  config LEDS_TURRIS_OMNIA
>  	tristate "LED support for CZ.NIC's Turris Omnia"
>  	depends on LEDS_CLASS_MULTICOLOR
> 

-- 
~Randy
