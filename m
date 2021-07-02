Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2293B9ED8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 12:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF03389EEB;
	Fri,  2 Jul 2021 10:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DB9FF89F0B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 10:08:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91B101FB;
 Fri,  2 Jul 2021 03:08:57 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D2AB3F85F;
 Fri,  2 Jul 2021 03:08:56 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] drm/panfrost: Bump minor version to reflect the
 feature additions
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210701091224.3209803-1-boris.brezillon@collabora.com>
 <20210701091224.3209803-8-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <377e9250-84db-6ea5-f2eb-749a125fabba@arm.com>
Date: Fri, 2 Jul 2021 11:08:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701091224.3209803-8-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/07/2021 10:12, Boris Brezillon wrote:
> We now have a new ioctl that allows submitting multiple jobs at once
> (among other things) and we support timelined syncobjs. Bump the
> minor version number to reflect those changes.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index b0978fe4fa36..1859e6887877 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -884,6 +884,8 @@ DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
>   * - 1.0 - initial interface
>   * - 1.1 - adds HEAP and NOEXEC flags for CREATE_BO
>   * - 1.2 - adds AFBC_FEATURES query
> + * - 1.3 - adds the BATCH_SUBMIT, CREATE_SUBMITQUEUE, DESTROY_SUBMITQUEUE
> + *	   ioctls and advertises the SYNCOBJ_TIMELINE feature
>   */
>  static const struct drm_driver panfrost_drm_driver = {
>  	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -897,7 +899,7 @@ static const struct drm_driver panfrost_drm_driver = {
>  	.desc			= "panfrost DRM",
>  	.date			= "20180908",
>  	.major			= 1,
> -	.minor			= 2,
> +	.minor			= 3,
>  
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> 

