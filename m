Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4908965CE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA86B11207D;
	Wed,  3 Apr 2024 07:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZSOfNFjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAA111207D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 07:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712128510;
 bh=qzfSfHG2Ybl71GhTl+7btqP37t8xlMwKwQEX6DKSPuc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZSOfNFjCrw4xsn7R+uqY+6VzlKRxIvoD/aWVbFtNhVn80sXm02Bpr0gqGSLr91zGw
 xW9JDqijVntntCRsYNToY5aHEpTTk5vMJvV5iOET1iEh/rPQWmqYfmBxvd2uAxrMXa
 M6FLuM6v0VNaXLK6f8a9P8biOAGSNpeKj3E9QTId/4fZK/EUhxcu//uD1k3ls5qR8o
 IJyXSr1qf5gIWSfvNXBSR1ZPVBorEi3GEPn7kHU1kdnzYve/6g8CddMB3EqQzkJ1lC
 IAIEuNJLm1ZaePI9aCxLzUJZlojyAVbsIe+OCcH6EGf6Z3Cggf/p4GbWgrLEpV83Ra
 n22K46WdDofYQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D9F1037813DC;
 Wed,  3 Apr 2024 07:15:09 +0000 (UTC)
Date: Wed, 3 Apr 2024 09:15:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Steven Price
 <steven.price@arm.com>
Subject: Re: [PATCH 1/2] drm/panthor: Cleanup unused variable 'cookie'
Message-ID: <20240403091508.009369b0@collabora.com>
In-Reply-To: <20240402215423.360341-1-liviu.dudau@arm.com>
References: <20240402215423.360341-1-liviu.dudau@arm.com>
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

On Tue,  2 Apr 2024 22:54:22 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> Commit 962f88b9c916 ("drm/panthor: Drop the dev_enter/exit() sections in
> _irq_suspend/resume()") removed the code that used the 'cookie' variable
> but left the declaration in place. Remove it.
> 
> Fixes: 962f88b9c916 ("drm/panthor: Drop the dev_enter/exit() sections in _irq_suspend/resume()")
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Queued both patches to drm-misc-next.

> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index dc3e9c666b5bd4..2fdd671b38fd9b 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -323,8 +323,6 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  												\
>  static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
>  {												\
> -	int cookie;										\
> -												\
>  	pirq->mask = 0;										\
>  	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
>  	synchronize_irq(pirq->irq);								\
> @@ -333,8 +331,6 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
>  												\
>  static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
>  {												\
> -	int cookie;										\
> -												\
>  	atomic_set(&pirq->suspended, false);							\
>  	pirq->mask = mask;									\
>  	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\

