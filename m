Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34ED4115E4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 15:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7726E4F1;
	Mon, 20 Sep 2021 13:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4CA606E4EA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 13:33:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D0AF11B3;
 Mon, 20 Sep 2021 06:33:53 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27C6B3F719;
 Mon, 20 Sep 2021 06:33:50 -0700 (PDT)
Subject: Re: [PATCH] panfrost: make mediatek_mt8183_supplies and
 mediatek_mt8183_pm_domains static
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, robh@kernel.org
Cc: tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <1631956414-85412-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <616fa113-7718-918c-db07-4826ef61b57f@arm.com>
Date: Mon, 20 Sep 2021 14:33:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631956414-85412-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/09/2021 10:13, Jiapeng Chong wrote:
> This symbol is not used outside of panfrost_drv.c, so marks it static.
> 
> Fix the following sparse warning:
> 
> drivers/gpu/drm/panfrost/panfrost_drv.c:641:12: warning: symbol
> 'mediatek_mt8183_supplies' was not declared. Should it be static?
> 
> drivers/gpu/drm/panfrost/panfrost_drv.c:642:12: warning: symbol
> 'mediatek_mt8183_pm_domains' was not declared. Should it be static?
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push to drm-misc-next.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 077cbbf..82ad9a6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -638,8 +638,8 @@ static int panfrost_remove(struct platform_device *pdev)
>  	.vendor_quirk = panfrost_gpu_amlogic_quirk,
>  };
>  
> -const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
> -const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
> +static const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
> +static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
>  static const struct panfrost_compatible mediatek_mt8183_data = {
>  	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
>  	.supply_names = mediatek_mt8183_supplies,
> 

