Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013A12A2640
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED476E419;
	Mon,  2 Nov 2020 08:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 631946E419
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 08:39:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABFAE101E;
 Mon,  2 Nov 2020 00:39:31 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC2723F718;
 Mon,  2 Nov 2020 00:39:30 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Remove unused variables in
 panfrost_job_close()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20201101173817.831769-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <9e47f8ff-8a3b-5c4f-3566-7f07f41709c4@arm.com>
Date: Mon, 2 Nov 2020 08:39:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201101173817.831769-1-boris.brezillon@collabora.com>
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/11/2020 17:38, Boris Brezillon wrote:
> Commit a17d609e3e21 ("drm/panfrost: Don't corrupt the queue mutex on
> open/close") left unused variables behind, thus generating a warning
> at compilation time. Remove those variables.
> 
> Fixes: a17d609e3e21 ("drm/panfrost: Don't corrupt the queue mutex on open/close")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> My bad, I didn't notice this warning when rebasing Steven's patch on
> top of drm-misc-next :-/

Partly my fault - I think I forgot to rebase the patch on drm-misc-next 
before posting. Thanks for fixing it.

Steve

> ---
>   drivers/gpu/drm/panfrost/panfrost_job.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 14c11293791e..d58e5fe12cab 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -634,8 +634,6 @@ int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
>   
>   void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
>   {
> -	struct panfrost_device *pfdev = panfrost_priv->pfdev;
> -	struct panfrost_job_slot *js = pfdev->js;
>   	int i;
>   
>   	for (i = 0; i < NUM_JOB_SLOTS; i++)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
