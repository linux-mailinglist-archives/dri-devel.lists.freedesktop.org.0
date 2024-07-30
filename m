Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E998894095E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713E010E340;
	Tue, 30 Jul 2024 07:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IEZ5fsGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07BA10E340
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:17:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B01E61D4D;
 Tue, 30 Jul 2024 07:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6347EC4AF0F;
 Tue, 30 Jul 2024 07:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1722323861;
 bh=VVI1imebOJVZF9QSxnCFZP3BleBHP121TLHTCjh66WQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEZ5fsGOwu84wMRvOs2CcTyBXd/kUDc0zoJP0qAxBcuTP1uIeLCMyNd4QbZyrnn0S
 txxwzOmm4o6VkwJMWLAE9Y3dvi8gBkBulrn8EI8QszSmR4BVfazjynysN76r6sSmxD
 jPYFW1etK6uytPRZ3YZ213jqbpmeEJbv4ckRS/FA=
Date: Tue, 30 Jul 2024 09:17:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sakirnth Nagarasa <sakirnth@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com
Subject: Re: [PATCH] staging: fbtft: Remove trailing semicolon in macro.
Message-ID: <2024073026-clubhouse-vividness-600d@gregkh>
References: <sakirnth@gmail.com>
 <20240730071455.37494-1-sakirnth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730071455.37494-1-sakirnth@gmail.com>
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

On Tue, Jul 30, 2024 at 07:14:55AM +0000, Sakirnth Nagarasa wrote:
> Fix checkpath warning: "WARNING: macros should not use a trailing semicolon
> in fbtft.h:356.
> 
> Signed-off-by: Sakirnth Nagarasa <sakirnth@gmail.com>
> 
> ---
> 
> Hello, this is my first patch to the kernel.
> ---
>  drivers/staging/fbtft/fbtft.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
> index f86ed9d47..45dfc92b8 100644
> --- a/drivers/staging/fbtft/fbtft.h
> +++ b/drivers/staging/fbtft/fbtft.h
> @@ -365,7 +365,7 @@ MODULE_DEVICE_TABLE(spi, spi_ids);						\
>  										\
>  FBTFT_SPI_DRIVER(_name, _comp_vend "," _comp_dev, _display, spi_ids)		\
>  										\
> -module_spi_driver(fbtft_driver_spi_driver);
> +module_spi_driver(fbtft_driver_spi_driver)

checkpatch is wrong here, the ';' is correct.

thanks,

greg k-h
