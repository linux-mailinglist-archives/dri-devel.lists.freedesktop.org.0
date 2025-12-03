Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D0C9EC68
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 11:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BB410E12A;
	Wed,  3 Dec 2025 10:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AqnFVe+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AADD10E12A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764759239;
 bh=YLSiEKJ6/tH9m5xSyjmEV67CROzsVsg8C1JbrTivRJ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AqnFVe+tHRBwy1p6naMwc6JbCE4LDgHaECo8E1Sz5CsZsplWoDNv/t7mGfg1ylhUp
 yoPYJIG5FBCBcpAz0qHEHM3Ti1iQKwEOLK2pCdg5OgUIxQs/WNpoDE9vnQroZYhumk
 iHojPBhsYg32zFJr8gigpnMzGGiWhyjquJB6Ypvf3Yf/VQXWyHw2n04Y4M6AjcEm+W
 SupGZM/vmXUhx3fC152wW4sROYNe+ie2sEScx5nBxw9neDan4629XIFhIVHE3ZiGZx
 wfvlh87TOt04wzA1fX3Rcv6peE9OgwxkjtDy30dZwC1zhUgQHCdWRlXyyJ83+ZwIf9
 ZeNdKFiHVtJPA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C31517E0117;
 Wed,  3 Dec 2025 11:53:59 +0100 (CET)
Date: Wed, 3 Dec 2025 11:53:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, karunika.choo@arm.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH] drm/panthor: Remove redundant call to disable the MCU
Message-ID: <20251203115354.40acbbe9@fedora>
In-Reply-To: <20251203091911.145623-1-akash.goel@arm.com>
References: <20251203091911.145623-1-akash.goel@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Wed,  3 Dec 2025 09:19:11 +0000
Akash Goel <akash.goel@arm.com> wrote:

> This commit removes the redundant call to disable the MCU firmware
> in the suspend path.
> 
> Fixes: 514072549865 ("drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs")
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 1a5e3c1a27fb..94a3cd6dfa6d 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1187,7 +1187,6 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
>  		else
>  			ptdev->reset.fast = true;
>  	}
> -	panthor_fw_stop(ptdev);
>  
>  	panthor_job_irq_suspend(&ptdev->fw->irq);
>  	panthor_fw_stop(ptdev);

