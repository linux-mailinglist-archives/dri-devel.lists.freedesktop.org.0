Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4F97D60D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 15:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66D610E09B;
	Fri, 20 Sep 2024 13:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C7BD10E09B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 13:16:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4D1C1007;
 Fri, 20 Sep 2024 06:16:53 -0700 (PDT)
Received: from [10.1.28.24] (e122027.cambridge.arm.com [10.1.28.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C61073F66E;
 Fri, 20 Sep 2024 06:16:22 -0700 (PDT)
Message-ID: <249807b3-305c-40c8-bd58-1154309223d7@arm.com>
Date: Fri, 20 Sep 2024 14:16:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Add FOP_UNSIGNED_OFFSET to fop_flags
To: Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Brauner <brauner@kernel.org>, dri-devel@lists.freedesktop.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
References: <20240920102802.2483367-1-liviu.dudau@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240920102802.2483367-1-liviu.dudau@arm.com>
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

On 20/09/2024 11:28, Liviu Dudau wrote:
> Since 641bb4394f40 ("fs: move FMODE_UNSIGNED_OFFSET to fop_flags")
> the FMODE_UNSIGNED_OFFSET flag has been moved to fop_flags and renamed,
> but the patch failed to make the changes for the panthor driver.
> When user space opens the render node the WARN() added by the patch
> gets triggered.
> 
> Fixes: 641bb4394f40 ("fs: move FMODE_UNSIGNED_OFFSET to fop_flags")
> Cc: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

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

