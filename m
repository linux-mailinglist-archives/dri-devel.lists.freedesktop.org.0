Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A458B757DB2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDA510E032;
	Tue, 18 Jul 2023 13:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEC710E032
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 13:33:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28F7161588;
 Tue, 18 Jul 2023 13:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF596C433C8;
 Tue, 18 Jul 2023 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1689687222;
 bh=/gnZG6o0DMnotHgfldqGvalM6a/Vulwkk2wHnxMrZAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=upk/z28T72VgEyaJkNGdvIrsytrYpric58NXQB6VYUVRyy3OcNMqBWEtVf4ZIsT04
 46s9mJsM3Ox9Mg6EJqNjwVJqwnJfiQWrUisHJ82lvg9rJh/9MzFuZZkBapJHUcy8Zl
 0MJdaybC9IRqWDbu3/WTtODTkXY/jyp0H69miUmY=
Date: Tue, 18 Jul 2023 15:33:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: Re: [PATCH RESEND v2] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
Message-ID: <2023071817-enslave-unlovable-f8ae@gregkh>
References: <20230718081759.28902-1-rgallaispou@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718081759.28902-1-rgallaispou@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 10:17:59AM +0200, Raphael Gallais-Pou wrote:
> Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
> ultimately causes a warning when the module probes. Fixes it.
> 
> Changes in v2:
> 	- dropped MODULE_ALIAS changes
> 	- changed commit log for more accurate description
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  drivers/staging/fbtft/fb_ili9341.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Why is this a resend?

And the changes need to go below the --- line as per the documentation.

thanks,

greg k-h
