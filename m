Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2F58964CA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 08:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE5A112532;
	Wed,  3 Apr 2024 06:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Hthilw/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2401112531
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 06:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712126794;
 bh=hIZbR30slL0FGdXzurjYhKrkjHFf/JJm1t6jgO08JD4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hthilw/9ANClt2yi6/22ZMDxCdxvHBUzkkCsc8nIh47vcWiehNKyppXr4RWnNrOAn
 b8lOtpyt2+U0vyt7Pk8doYFk1OgkiNAdgieEGX/dRNt+lOLgO+VtMejN2nun+fFabx
 cEXlr/9+8hjy13Id0Xt1FwkLDxk9KDbyc0YqtRT41T+ZpvRHkeep9j+5lkmAF9KRI+
 x83CIo4JPjpcCuLGsHKv/jwOBewKLWoWjtOP5Mk2PBmCpYAbphnZyxSTUpsSK4ceJ1
 aGACxe25MTdgV21rrl0tq6cziIvbtIJmUKx23uDg/nhgcZV8BPbT0t8mGILseWScbY
 YdrJcMmpPGWLQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 155F737820CD;
 Wed,  3 Apr 2024 06:46:34 +0000 (UTC)
Date: Wed, 3 Apr 2024 08:46:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Steven Price
 <steven.price@arm.com>
Subject: Re: [PATCH 2/2] drm/panthor: Fix some kerneldoc warnings
Message-ID: <20240403084632.1d00d1c6@collabora.com>
In-Reply-To: <20240402215423.360341-2-liviu.dudau@arm.com>
References: <20240402215423.360341-1-liviu.dudau@arm.com>
 <20240402215423.360341-2-liviu.dudau@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Tue,  2 Apr 2024 22:54:23 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> When compiling with W=1 the build process will flag empty comments,
> misnamed documented variables and incorrect tagging of functions.
> Fix them in one go.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index e5a710f190d2a8..a787f2fea33e98 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -517,7 +517,7 @@ struct panthor_group {
>  	/** @max_compute_cores: Maximum number of shader cores used for compute jobs. */
>  	u8 max_compute_cores;
>  
> -	/** @max_compute_cores: Maximum number of shader cores used for fragment jobs. */
> +	/** @max_fragment_cores: Maximum number of shader cores used for fragment jobs. */
>  	u8 max_fragment_cores;
>  
>  	/** @max_tiler_cores: Maximum number of tiler cores used for tiler jobs. */
> @@ -993,7 +993,7 @@ cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
>  }
>  
>  /**
> - * @cs_slot_reset_locked() - Reset a queue slot
> + * cs_slot_reset_locked() - Reset a queue slot
>   * @ptdev: Device.
>   * @csg_id: Group slot.
>   * @cs_id: Queue slot.
> @@ -1591,7 +1591,7 @@ static void sched_process_idle_event_locked(struct panthor_device *ptdev)
>  }
>  
>  /**
> - * panthor_sched_process_global_irq() - Process the scheduling part of a global IRQ
> + * sched_process_global_irq_locked() - Process the scheduling part of a global IRQ
>   * @ptdev: Device.
>   */
>  static void sched_process_global_irq_locked(struct panthor_device *ptdev)
> @@ -1660,8 +1660,6 @@ static const struct dma_fence_ops panthor_queue_fence_ops = {
>  	.get_timeline_name = queue_fence_get_timeline_name,
>  };
>  
> -/**
> - */
>  struct panthor_csg_slots_upd_ctx {
>  	u32 update_mask;
>  	u32 timedout_mask;

