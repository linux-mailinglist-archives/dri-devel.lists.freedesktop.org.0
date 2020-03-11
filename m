Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2A318105B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 07:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFDF89F35;
	Wed, 11 Mar 2020 06:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B27589F35
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 06:06:23 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 960F921655;
 Wed, 11 Mar 2020 06:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583906783;
 bh=KN+8Bn3VC9leAlT1f02Os7gMAUM2T74PCNfPOjVGbWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wWo4tT1gOx3yAEZEhjPSUV27VP0nWW866DOBe9RFC0C6PJN2Q8MgE3engI4aXxTkO
 Y0QkrjLic3u26gKiuvnnXAovwfMBRrvXkt+cOJ7u7PzU4yi/cMi58QvUGClPhpeDWO
 W9oYXFjWNdxhk0zAd/NCbxO4GpZVw1T6PKT1tSpw=
Date: Wed, 11 Mar 2020 07:06:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Marcio Albano <marcio.ahf@gmail.com>
Subject: Re: [PATCH] staging: fbtft: Remove prohibited spaces before ')'
Message-ID: <20200311060620.GB3522362@kroah.com>
References: <20200311012533.26167-1-marcio.ahf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311012533.26167-1-marcio.ahf@gmail.com>
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 01:25:33AM +0000, Marcio Albano wrote:
> Fix checkpatch errors:
> 
> "ERROR: space prohibited before that close parenthesis ')'"
> in fbtft-bus.c:65 and fbtft-bus.c:67.
> 
> Signed-off-by: Marcio Albano <marcio.ahf@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> index 63c65dd67..847cbfbbd 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -62,9 +62,9 @@ out:									      \
>  }                                                                             \
>  EXPORT_SYMBOL(func);
>  
> -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
>  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
> -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)

Always test-build your patches :(
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
