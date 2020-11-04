Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29A32A63A7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 12:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D276E9CD;
	Wed,  4 Nov 2020 11:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A1026E9CD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 11:53:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ACD61474;
 Wed,  4 Nov 2020 03:53:34 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AA383F719;
 Wed,  4 Nov 2020 03:53:32 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Replace devm_reset_control_array_get()
To: Yejune Deng <yejune.deng@gmail.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 airlied@linux.ie, daniel@ffwll.ch, p.zabel@pengutronix.de
References: <1604368082-6032-1-git-send-email-yejune.deng@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <0de60b2e-fdff-f2f1-f734-1b1aa949b6fb@arm.com>
Date: Wed, 4 Nov 2020 11:53:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1604368082-6032-1-git-send-email-yejune.deng@gmail.com>
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

On 03/11/2020 01:48, Yejune Deng wrote:
> devm_reset_control_array_get_optional_exclusive() looks more readable
> 
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks, I'll push this to drm-misc-next.

Steve

> ---
>   drivers/gpu/drm/panfrost/panfrost_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index ea8d318..1daf932 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -18,7 +18,7 @@
>   
>   static int panfrost_reset_init(struct panfrost_device *pfdev)
>   {
> -	pfdev->rstc = devm_reset_control_array_get(pfdev->dev, false, true);
> +	pfdev->rstc = devm_reset_control_array_get_optional_exclusive(pfdev->dev);
>   	if (IS_ERR(pfdev->rstc)) {
>   		dev_err(pfdev->dev, "get reset failed %ld\n", PTR_ERR(pfdev->rstc));
>   		return PTR_ERR(pfdev->rstc);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
