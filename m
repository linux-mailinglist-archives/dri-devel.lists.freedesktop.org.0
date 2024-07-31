Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30E994284B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 09:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED1910E1C2;
	Wed, 31 Jul 2024 07:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ksMDSoIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6810010E1C2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 07:44:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9AA6F62224;
 Wed, 31 Jul 2024 07:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF11C116B1;
 Wed, 31 Jul 2024 07:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1722411893;
 bh=ShY7Nj4mnNJABphfGU7nTPsI5y6WvrjXgfhgmdlfdAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ksMDSoIyA4US0w9TtUvGC3IjWc/1rNmQLUy97N8VumsV426KvF8GWKIJHoK10IO64
 7bCUSrcUG8nPIBc6f7/49R22jKPniW29jtTa1jPPU39W9PH7wU4Pz/ACyMhYtrzD9U
 /pcA4J2X0X3LpEL0NzIInLYZSON9GgpN4isLVtE4=
Date: Wed, 31 Jul 2024 09:44:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: vme_bridge.h: Fix mutex without
 comment warning
Message-ID: <2024073127-babbling-antiquely-22a2@gregkh>
References: <20240731073605.9857-1-riyandhiman14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731073605.9857-1-riyandhiman14@gmail.com>
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

On Wed, Jul 31, 2024 at 01:06:05PM +0530, Riyan Dhiman wrote:
> Adhere to Linux kernel coding style
> 
> Reported by checkpatch:
> 
> CHECK: mutex definition without comment
> 
> Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
> ---
>  drivers/staging/vme_user/vme_bridge.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
> index 9bdc41bb6602..0b1f05944f0d 100644
> --- a/drivers/staging/vme_user/vme_bridge.h
> +++ b/drivers/staging/vme_user/vme_bridge.h
> @@ -28,6 +28,7 @@ struct vme_master_resource {
>  struct vme_slave_resource {
>  	struct list_head list;
>  	struct vme_bridge *parent;
> +	/* Locking for VME slave resources */

Are you sure about all of these?  Please document them individually and
put the proof of that in the changelog text.

thanks,

greg k-h
