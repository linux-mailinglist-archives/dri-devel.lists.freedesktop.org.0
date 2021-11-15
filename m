Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D367044FED6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 07:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4066E0A0;
	Mon, 15 Nov 2021 06:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481F36E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 06:46:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AD2A60F5B;
 Mon, 15 Nov 2021 06:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636958816;
 bh=XEM+DrVSvNflnPL2o1sMlhGONa8AnyEqQx/59JtGP2c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OVmNgMSmI4+Nmq5m1ncvHF0Pj3HaH4P86AajL8yTBREyzv2d7MxsEzOR148rV7V3s
 8ukBCJ3Kat5AJP80t8YnZsq9gpJufOZSbldpEr1ix4FvBTaUEoms36v/yx61XdmK2S
 kVypfhaOImIJz2nxHa5VqsBmQOPVG1LonLHOQPBiDZq13L5LTh4nxOZvpLARdtHgMD
 zDzoErjcMoqpIAVrm9Jrj22ZwiK2my/diouWP2doS6bQVObyl4+/o5CpkQZwb6w+J6
 zRUkpzFkxAV/oLZZaeSICOaHSlpo1+85aZexKO1N6nwc2GQZZ5Tiyn24XX6F9Pv6CG
 V/j4pe0XkrQ6g==
Date: Mon, 15 Nov 2021 00:51:58 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] fbdev: sh7760fb: document fallthrough cases
Message-ID: <20211115065158.GA98196@embeddedor>
References: <20211115063257.14369-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115063257.14369-1-rdunlap@infradead.org>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Manuel Lauss <mano@roarinelk.homelinux.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 14, 2021 at 10:32:57PM -0800, Randy Dunlap wrote:
> Fix fallthrough warnings in sh776fb.c:
> 
> ../drivers/video/fbdev/sh7760fb.c: In function 'sh7760fb_get_color_info':
> ../drivers/video/fbdev/sh7760fb.c:138:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   138 |                 lgray = 1;
> ../drivers/video/fbdev/sh7760fb.c:143:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   143 |                 lgray = 1;
> 
> Just document the current state of code execution/flow.
> 
> Fixes: 4a25e41831ee ("video: sh7760fb: SH7760/SH7763 LCDC framebuffer driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>
> Cc: Manuel Lauss <mano@roarinelk.homelinux.net>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks, Randy.
--
Gustavo

> ---
>  drivers/video/fbdev/sh7760fb.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- linux-next-20211112.orig/drivers/video/fbdev/sh7760fb.c
> +++ linux-next-20211112/drivers/video/fbdev/sh7760fb.c
> @@ -136,11 +136,13 @@ static int sh7760fb_get_color_info(struc
>  		break;
>  	case LDDFR_4BPP_MONO:
>  		lgray = 1;
> +		fallthrough;
>  	case LDDFR_4BPP:
>  		lbpp = 4;
>  		break;
>  	case LDDFR_6BPP_MONO:
>  		lgray = 1;
> +		fallthrough;
>  	case LDDFR_8BPP:
>  		lbpp = 8;
>  		break;
