Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBAB200480
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 11:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF85D6EC39;
	Fri, 19 Jun 2020 09:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 127466EC39
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 09:00:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A12452B;
 Fri, 19 Jun 2020 02:00:25 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D341E3F71F;
 Fri, 19 Jun 2020 02:00:23 -0700 (PDT)
Subject: Re: [PATCH 2/2] panfrost: Add compatible string for bifrost
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
 <20200611085900.49740-2-tomeu.vizoso@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <1b72d5ad-365f-e7fb-624e-b88420ff264b@arm.com>
Date: Fri, 19 Jun 2020 10:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611085900.49740-2-tomeu.vizoso@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/06/2020 09:58, Tomeu Vizoso wrote:
> Mesa now supports some Bifrost devices, so enable it.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I've also dug out my Hikey960 (from the box it's been in since lock down 
started), so I'll see if I can get things running on there, at the 
moment I'm seeing some DATA_INVALID_FAULT regressions running my hacked 
DDK :(

Steve

> ---
>   drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 882fecc33fdb..8ff8e140f91e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -677,6 +677,7 @@ static const struct of_device_id dt_match[] = {
>   	{ .compatible = "arm,mali-t830", .data = &default_data, },
>   	{ .compatible = "arm,mali-t860", .data = &default_data, },
>   	{ .compatible = "arm,mali-t880", .data = &default_data, },
> +	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, dt_match);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
