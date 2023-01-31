Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26A1682BDC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 12:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E02C10E133;
	Tue, 31 Jan 2023 11:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB2610E133
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 11:52:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19A6A6147C;
 Tue, 31 Jan 2023 11:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AC4C433D2;
 Tue, 31 Jan 2023 11:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1675165936;
 bh=TkDgebvBcy1nAPBeWdAqve5nYhA8Jlh68COgNvMgJq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fEw/isx6nokL5MQajzj0UenWpA26QRuZ9I9TS7D7SPAGyG8zFlRvvnkNHwRsBZUhB
 Bv5NamFV1ZUxxQdxm4mdYEWV6Bsu9zZ7z41P1nX1WYFElOVcDCIlPacUqvdgD9yv9x
 PhvaZcAKTM2D9vSiSBtl8SblcXIROWm5J4arqWiY=
Date: Tue, 31 Jan 2023 12:52:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] drivers: Restore alignment and newline in Makefile
Message-ID: <Y9kA7RRfZx1drk5e@kroah.com>
References: <20230124104145.3962497-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124104145.3962497-1-geert+renesas@glider.be>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 11:41:45AM +0100, Geert Uytterhoeven wrote:
> The introduction of drivers/accel/ broke alignment, and removed the
> newline at the end of the file.  Fix all of that.
> 
> Fixes: 35b137630f08d913 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/Makefile b/drivers/Makefile
> index f0972e2226c97cb5..9ea6eb3b5d7b7f17 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -189,4 +189,4 @@ obj-$(CONFIG_COUNTER)		+= counter/
>  obj-$(CONFIG_MOST)		+= most/
>  obj-$(CONFIG_PECI)		+= peci/
>  obj-$(CONFIG_HTE)		+= hte/
> -obj-$(CONFIG_DRM_ACCEL)	+= accel/
> \ No newline at end of file
> +obj-$(CONFIG_DRM_ACCEL)		+= accel/
> -- 
> 2.34.1
> 


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
