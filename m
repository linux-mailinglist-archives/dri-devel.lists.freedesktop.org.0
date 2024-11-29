Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC59DE706
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18A410EE0E;
	Fri, 29 Nov 2024 13:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="RrMUdUpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8C710EE0E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732885923; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KkV3JdZc5loR9OCk3LmythD9NGnOfmQcMugqub2TML3Xhib0jTmgAD9PwJYAz8YpOT1/vxn9DiBPaVxRC3VwTaaCd31DclcTqo4ItK3aiJU1yJ2O80uyvyfoEeQNnm1UyulozT4aN1Nz6paHMsokDPJrvKN1ybmQzBa05I/zrBQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732885923;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Tg/AOK0DIca83WVw9pFtFXFtEk4+UICG1iHoodkbXAI=; 
 b=Y/FGg17voNh6ShO5nIWh1wCBu3hIU99IZO6IobW9rU9CAh4M3WgHgzuwlsnAjxaQg96z5y0Grc5LOY6mfvhf8uaDWNl2WB0QjrN6pW8+wOhZq3L6EXzGCeNyilTcfBaN+ZJFgO18H2TG2rMXLI45JuE9+Z8EBLXksvD01IqYcJk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732885923; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=Tg/AOK0DIca83WVw9pFtFXFtEk4+UICG1iHoodkbXAI=;
 b=RrMUdUpize2fzTFcmR3SF6RJePMdvHOBEkL8VWRB7thPB/RYvm9mxcLqzzWqEvpu
 2ik7nnp0EeoyyJfbFphUWZrCkyoi9uyx5iRSUewC790D9qFxx4/r9oasrdNYwH/ewVo
 a2NA8DybvjTyo2PTveXhqMoaJFlRuWxU2PWMjk+k=
Received: by mx.zohomail.com with SMTPS id 1732885922223692.3296776257824;
 Fri, 29 Nov 2024 05:12:02 -0800 (PST)
Date: Fri, 29 Nov 2024 13:11:59 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/5] drm/panthor: Preserve the result returned by
 panthor_fw_resume()
Message-ID: <36skiy7ozegfn5tcrjdbhmrd2ibwmqgli625wjuuivltglarsc@ap23t4tmmjna>
References: <20241128110255.3182366-1-boris.brezillon@collabora.com>
 <20241128110255.3182366-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128110255.3182366-2-boris.brezillon@collabora.com>
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

Reviewed-by: Adrian Larumbe <adrian.larumbe@collabora.com>

On 28.11.2024 12:02, Boris Brezillon wrote:
> WARN() will return true if the condition is true, false otherwise.
> If we store the return of drm_WARN_ON() in ret, we lose the actual
> error code.
> 
> v2:
> - Add R-b
> 
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 984615f4ed27..e701e605d013 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -461,8 +461,8 @@ int panthor_device_resume(struct device *dev)
>  	    drm_dev_enter(&ptdev->base, &cookie)) {
>  		panthor_gpu_resume(ptdev);
>  		panthor_mmu_resume(ptdev);
> -		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
> -		if (!ret) {
> +		ret = panthor_fw_resume(ptdev);
> +		if (!drm_WARN_ON(&ptdev->base, ret)) {
>  			panthor_sched_resume(ptdev);
>  		} else {
>  			panthor_mmu_suspend(ptdev);
> -- 
> 2.46.2

