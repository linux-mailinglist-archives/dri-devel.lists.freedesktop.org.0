Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3068162E49
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 19:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1136EA60;
	Tue, 18 Feb 2020 18:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9643A6EA60
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 18:19:58 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2FE1246A7;
 Tue, 18 Feb 2020 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582049998;
 bh=l5a7op/30p7ukqEigTi578On9gZK9bp1FyOy/u+eqkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2PIIclwHWaq66d1SG5sGxEVCNNjClh8FPuhAYT/SShDtDzj7h+8jjv7CNn9vtLpV2
 102BZiwFIB4mjcgOYptQqgjSeqIN0wiHCDRcab1+rv5zFe1RPqmUS4C9RR65PK2I/m
 YJ1N7co8UGF6f0bd8piebuAyrB3376uAwb7Gl+uk=
Date: Tue, 18 Feb 2020 19:19:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/arc: make arcpgu_debugfs_init return 0
Message-ID: <20200218181956.GA2635524@kroah.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218172821.18378-1-wambui.karugax@gmail.com>
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
Cc: airlied@linux.ie, abrodkin@synopsys.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 08:28:12PM +0300, Wambui Karuga wrote:
> As drm_debugfs_create_files should return void, remove its use as the
> return value of arcpgu_debugfs_init and have the latter function
> return 0 directly.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/arc/arcpgu_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

What order does all of these patches apply in?

You have two of them numbered, but not all, so this is really confusing
as to how to review this...

Can you fix all that up and resend?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
