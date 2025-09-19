Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E035CB88A23
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 11:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DF510E972;
	Fri, 19 Sep 2025 09:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3258410E972
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 09:46:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6022D2F;
 Fri, 19 Sep 2025 02:46:12 -0700 (PDT)
Received: from [10.57.5.234] (unknown [10.57.5.234])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1E163F66E;
 Fri, 19 Sep 2025 02:46:19 -0700 (PDT)
Message-ID: <945085cb-ccfb-498f-b25e-d95f7627d78a@arm.com>
Date: Fri, 19 Sep 2025 10:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Bump the minor version number
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250919080700.3949393-1-steven.price@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250919080700.3949393-1-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8
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

On 19/09/2025 09:07, Steven Price wrote:
> Commit a017f7b86051 ("drm/panfrost: Expose JM context IOCTLs to UM")
> added new ioctls to the driver and was meant to bump the version number.
> However it actually only added a comment and didn't change the exposed
> version number. Bump the number to be consistent with the comment.
> 
> Fixes: a017f7b86051 ("drm/panfrost: Expose JM context IOCTLs to UM")
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

Pushed to drm-misc-next.

Thanks,
Steve

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

