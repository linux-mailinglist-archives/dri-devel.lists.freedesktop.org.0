Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90CA744D85
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 14:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C97B10E082;
	Sun,  2 Jul 2023 12:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F3610E082
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 12:02:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D3B060A29;
 Sun,  2 Jul 2023 12:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EA3C433C8;
 Sun,  2 Jul 2023 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1688299356;
 bh=8bLEnUYc7wEzh+SSE9/0jlwi4h6W7dJNNRt3uf4BLDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mUrM5RxqjUF/JOgKqmDozbciP2lgT9QI5eOe32JYsSTsSUxEYuQ8wCsz6LtY+Ecmx
 D7LJO1zjDaIPNeAWHDJRoMog2JVK+kubREifRIvGskNmugyjp7R0rfnHaYJssVAo6N
 w1dV0S/TE13204CvGS/4f0qjlp73UxyvcXzzOaRA=
Date: Sun, 2 Jul 2023 14:02:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: Re: [PATCH] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
Message-ID: <2023070254-embark-subplot-4dd4@gregkh>
References: <20230702080324.120137-1-rgallaispou@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230702080324.120137-1-rgallaispou@gmail.com>
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

On Sun, Jul 02, 2023 at 10:03:24AM +0200, Raphael Gallais-Pou wrote:
> Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
> ultimately causes the module to an early exit at probe time.

So this doesn't work at all today?  Has it ever worked?  What commit
does thi fix?

> In addition the MODULE_ALIASes can be dropped.

Why?  When you say "also" or "in addition", that's a huge hint it should
be a separate patch.

thanks,

greg k-h
