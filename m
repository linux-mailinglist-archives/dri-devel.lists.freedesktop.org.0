Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC04B88952
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 11:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E29E10E973;
	Fri, 19 Sep 2025 09:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="GfGmo4Vq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA22A10E973
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 09:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758274530; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ia/weqB67JSOOFDADLRgnZnK1FSgsllrjF7nnMivBIzpsKy4d/24ygj7PjZkuX3hLKveVj9spU13OIgC6sYgHIrYa3x07YqoF8mXEH8Qpb07REJTaQ+EXYOAKMfqSzB7oqFDr7Aa7dr57x1Wlqw9I3O1M2Ldi0P9RBDs3dzhj50=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758274530;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Q4AgxNNAIA3/Y/jnWgb7B4t21i6FI8oSC22E+XxRvPA=; 
 b=aZEpgt7OJ92jBCcTdVl+9pF09w/UFhZUmiUnhzBFVx0f1+C00bGBHTa5W4w45DjZbUL/bsIx4xAealShlTCKoA10dHPR3fp2rgbHX1rZhVnblwuEGl1tJ1sJxij+EffGtnw7HxxNTXG7sSspluj88TAzyqDR9u4mooyFme9m4wM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758274530; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=Q4AgxNNAIA3/Y/jnWgb7B4t21i6FI8oSC22E+XxRvPA=;
 b=GfGmo4VqF9j3Te3raCUUXsUy7ppKdoQm/P+I4RWLjPumoDI1atAwH8F5zvAfixqH
 tpJXAVKiBEQUwlWEeq/Akcl+wTv5qWqRiEA1weaBHJ3JgXXK9ndf70lYX7pLz2UxUP8
 TVRGxlfr3HIAX6N8mqEc9UudqUKR0nAFU0XokrMA=
Received: by mx.zohomail.com with SMTPS id 1758274529027121.54735845958476;
 Fri, 19 Sep 2025 02:35:29 -0700 (PDT)
Date: Fri, 19 Sep 2025 10:35:25 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: Bump the minor version number
Message-ID: <76ob3x7aeflkz3q2sm44zz7wk55sarrprxixixzq32xi2qkjm3@gmctkhzl5w3c>
References: <20250919080700.3949393-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250919080700.3949393-1-steven.price@arm.com>
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

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 19.09.2025 09:07, Steven Price wrote:
> Commit a017f7b86051 ("drm/panfrost: Expose JM context IOCTLs to UM")
> added new ioctls to the driver and was meant to bump the version number.
> However it actually only added a comment and didn't change the exposed
> version number. Bump the number to be consistent with the comment.
>
> Fixes: a017f7b86051 ("drm/panfrost: Expose JM context IOCTLs to UM")
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 3af4b4753ca4..22350ce8a08f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -853,7 +853,7 @@ static const struct drm_driver panfrost_drm_driver = {
>  	.name			= "panfrost",
>  	.desc			= "panfrost DRM",
>  	.major			= 1,
> -	.minor			= 4,
> +	.minor			= 5,
>
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
> --
> 2.39.5

Adrian Larumbe
