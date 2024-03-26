Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60588C00C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF92910EE74;
	Tue, 26 Mar 2024 10:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="w/mLZvXV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8989810EE74
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711450776;
 bh=aliybyz47uinRGXtRKuSPxDxjVQ2TQQ62bnfexZTrs0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=w/mLZvXVacsLyu1w1YPitYD7b71BVTkwHwEjVQcPrOlcSprscNQbgLFCPjs/hv7VD
 IAi2JzFPKfGSXYLyD/5JEMz1xHzAG7FnqOgmU6OXf/yCn3rWflQExN6oWNoXtygBno
 hqIcspidGTNLc3p86j0Ng5RuU+ag+toUkvuZ1XwqBcL7F+AcM9Aiw8NBvxPoZ0gzu/
 lrwGH4xuuRNaQhS2+lxjsPvUWO0Lm0jjjX0DSzDfinIlY2BPDQsnvapUW3RqFRvWAE
 lgZUdXc4RUXE3pmiWskVNBM3PDHe5qB7V8lG4FngdaxSyYKTgC+GrEO5E7eMjZDIN+
 quDDouyKuxzRg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3E65B378110A;
 Tue, 26 Mar 2024 10:59:36 +0000 (UTC)
Date: Tue, 26 Mar 2024 11:59:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/panthor: Fix spelling mistake "readyness" ->
 "readiness"
Message-ID: <20240326115934.726d3ca1@collabora.com>
In-Reply-To: <20240326100219.43989-1-colin.i.king@gmail.com>
References: <20240326100219.43989-1-colin.i.king@gmail.com>
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

On Tue, 26 Mar 2024 10:02:19 +0000
Colin Ian King <colin.i.king@gmail.com> wrote:

> There is a spelling mistake in a drm_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Queued to drm-misc-next.

> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 6dbbc4cfbe7e..0f7c962440d3 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -333,7 +333,7 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
>  						 val, (mask32 & val) == mask32,
>  						 100, timeout_us);
>  		if (ret) {
> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx readyness",
> +			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
>  				blk_name, mask);
>  			return ret;
>  		}

