Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6927D20BED0
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 07:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CF56E207;
	Sat, 27 Jun 2020 05:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6616E207
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 05:12:53 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78BCD20720;
 Sat, 27 Jun 2020 05:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593234773;
 bh=Gw5zaq+vMe/vtdVW8SlA7Vem2sWc7vMLiEdibwo5Tno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwo183Uw/BYuL37VI8DSmUM58XmYEuDcx3JGyXEv04LLKrFdsl0Qpf4I8MNpPt/A1
 97MOndH+T+zSyc072BVSrb4TmDgxSJ0Kh6y5hOT+rCMvEQdws1tdAD6UjHKDgIyTcB
 uuu58Hmg+kEK+tk2Z+tuApffxTblN3d6OayY0QiA=
Date: Sat, 27 Jun 2020 07:12:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: B K Karthik <bkkarthik@pesu.pes.edu>
Subject: Re: [PATCH] fbtft-bus.c: Removing that prohibited space before ')'
Message-ID: <20200627051249.GB233327@kroah.com>
References: <20200627045150.ysqvd47o52f4a6rc@pesu-pes-edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627045150.ysqvd47o52f4a6rc@pesu-pes-edu>
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
Cc: Jan Sebastian =?iso-8859-1?Q?G=F6tte?= <linux@jaseg.net>,
 devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 27, 2020 at 12:51:50AM -0400, B K Karthik wrote:
> fbtft-bus.c:
> 
> fixing ERROR: space prohibited before that close parenthesis ')' by removing that space and ',' in line 65 and 67.
> 
> Signed-off-by: B K Karthik <karthik.bk2000@live.com>
> ---
>  drivers/staging/fbtft/fbtft-bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> index 63c65dd67b17..847cbfbbd766 100644
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

Also, did you test-build this patch?  I think this just broke the
build...

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
