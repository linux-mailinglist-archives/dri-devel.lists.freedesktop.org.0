Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7576197D527
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 14:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F127910E80C;
	Fri, 20 Sep 2024 12:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NwedZpcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D1C10E80C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 12:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726833640;
 bh=vGkdCrKt2mqP8Fql+DXD0U+dMzqeSKngmeuHotXauKY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NwedZpcgmqcMNy2XJOpxmnaye9mrd64XOyNJ06zPXIRfulvLU9Qt9wMNRsn/92Prk
 6YkvDLBVw+hgTEzMuL4FiQGREDAFhBdZfzx4ceYgmtrcZ5V69v9isuyRLtHAsGs3UE
 pGTUpq+SPWcVs1325kpxVq+W2Kt5vJIxaCQy2JcxPc0UEJo12mG7BHiF9axTU6KTPA
 fxW69pP8/yWCSDq0pTmTZJiGlrskut6Uz5E4Km65d2BBKmO9dxKLBcKWlcUXDluapq
 lM2v9K5TqPH++X0mBWnnIo51+hIAjurt8q+ZnqTXHnbGxqtO04FR05vPMsm9XpWEm5
 IIjnK8LRjnkkA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B086417E12AC;
 Fri, 20 Sep 2024 14:00:39 +0200 (CEST)
Date: Fri, 20 Sep 2024 14:00:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Christian Brauner <brauner@kernel.org>,
 dri-devel@lists.freedesktop.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Add FOP_UNSIGNED_OFFSET to fop_flags
Message-ID: <20240920140034.29f9dc2d@collabora.com>
In-Reply-To: <20240920102802.2483367-1-liviu.dudau@arm.com>
References: <20240920102802.2483367-1-liviu.dudau@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 20 Sep 2024 11:28:02 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> Since 641bb4394f40 ("fs: move FMODE_UNSIGNED_OFFSET to fop_flags")
> the FMODE_UNSIGNED_OFFSET flag has been moved to fop_flags and renamed,
> but the patch failed to make the changes for the panthor driver.
> When user space opens the render node the WARN() added by the patch
> gets triggered.
> 
> Fixes: 641bb4394f40 ("fs: move FMODE_UNSIGNED_OFFSET to fop_flags")
> Cc: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 34182f67136c1..c520f156e2d73 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1383,6 +1383,7 @@ static const struct file_operations panthor_drm_driver_fops = {
>  	.read = drm_read,
>  	.llseek = noop_llseek,
>  	.mmap = panthor_mmap,
> +	.fop_flags = FOP_UNSIGNED_OFFSET,
>  };
>  
>  #ifdef CONFIG_DEBUG_FS

