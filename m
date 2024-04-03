Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092D98964C9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 08:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D464112530;
	Wed,  3 Apr 2024 06:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="X1u1ZoyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5183F112530
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 06:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712126784;
 bh=4o3ntBNpYqUgIZdHQ1U/y0jQBsMQSH9TcFAtLdKyjuQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X1u1ZoyMammAE08xT4ox6hLmoYLdDW2GFZgpWa/l4VDVw1cvFaJ907uYdCznXLMc6
 iSN+Kq53I024oSSq5XxM9VjtWJCTrR15wJueEd+Yc/o3+E6Kz2eex32ekASSCJ5C87
 m7RiImAzBk4U0Kan8hsvzO6IGt3ZhyMf4D+xwMK2nIhiLJSQd/BbJx3WnH2paVaoqz
 CBt2m4M6cqLMc3mCvUuo0eGNfakYuAIUVvwuyfNGgCCR5BfwyZo8Hj9Vo+pfJhN8wO
 bmh2Fu7mSTNSxC6RPbGXF/HmH4FrcsbHotrdcOkxQBDWJXKU0OnKoGZQ8nYbVjRVk5
 pJwoXxKZZ75mg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D632237820CD;
 Wed,  3 Apr 2024 06:46:23 +0000 (UTC)
Date: Wed, 3 Apr 2024 08:46:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Steven Price
 <steven.price@arm.com>
Subject: Re: [PATCH 1/2] drm/panthor: Cleanup unused variable 'cookie'
Message-ID: <20240403084622.4fc0f0d8@collabora.com>
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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

