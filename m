Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58A27FDEC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 12:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB216E187;
	Thu,  1 Oct 2020 10:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 216186E187
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 10:58:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC5D30E;
 Thu,  1 Oct 2020 03:58:13 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93C733F70D;
 Thu,  1 Oct 2020 03:58:12 -0700 (PDT)
Subject: Re: [PATCH -next] drm/panfrost: simplify the return expression of
 cz_ih_hw_init()
To: Qinglang Miao <miaoqinglang@huawei.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20200921131019.91558-1-miaoqinglang@huawei.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <a50ee060-b313-2d53-9ffc-6180fd5a5643@arm.com>
Date: Thu, 1 Oct 2020 11:57:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921131019.91558-1-miaoqinglang@huawei.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/09/2020 14:10, Qinglang Miao wrote:
> Simplify the return expression.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_device.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index e68967338..ea8d31863 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -18,19 +18,13 @@
>   
>   static int panfrost_reset_init(struct panfrost_device *pfdev)
>   {
> -	int err;
> -
>   	pfdev->rstc = devm_reset_control_array_get(pfdev->dev, false, true);
>   	if (IS_ERR(pfdev->rstc)) {
>   		dev_err(pfdev->dev, "get reset failed %ld\n", PTR_ERR(pfdev->rstc));
>   		return PTR_ERR(pfdev->rstc);
>   	}
>   
> -	err = reset_control_deassert(pfdev->rstc);
> -	if (err)
> -		return err;
> -
> -	return 0;
> +	return reset_control_deassert(pfdev->rstc);
>   }
>   
>   static void panfrost_reset_fini(struct panfrost_device *pfdev)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
