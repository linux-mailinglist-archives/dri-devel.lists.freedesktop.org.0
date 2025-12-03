Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC0CC9F20F
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D56110E7DF;
	Wed,  3 Dec 2025 13:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2905110E7DF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 13:27:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 809B61477
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 05:27:41 -0800 (PST)
Received: from [10.2.10.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 959C83F59E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 05:27:48 -0800 (PST)
Date: Wed, 3 Dec 2025 13:27:30 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Akash Goel <akash.goel@arm.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, karunika.choo@arm.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH] drm/panthor: Remove redundant call to disable the MCU
Message-ID: <aTA6wgDxZYRpfc-X@e142607>
References: <20251203091911.145623-1-akash.goel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251203091911.145623-1-akash.goel@arm.com>
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

On Wed, Dec 03, 2025 at 09:19:11AM +0000, Akash Goel wrote:
> This commit removes the redundant call to disable the MCU firmware
> in the suspend path.
> 
> Fixes: 514072549865 ("drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs")
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Pushed to drm-misc-next.

Best regards,
Liviu

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
> -- 
> 2.25.1
> 
