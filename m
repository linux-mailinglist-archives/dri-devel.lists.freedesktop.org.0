Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B726D054C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB73C10E32C;
	Thu, 30 Mar 2023 12:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 15AB010E2EB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:52:09 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:51490.1253082464
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 1A5BB1002B0;
 Thu, 30 Mar 2023 20:52:05 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 2532a3fdd6f049228020437bbe1ad0c7 for tzimmermann@suse.de; 
 Thu, 30 Mar 2023 20:52:07 CST
X-Transaction-ID: 2532a3fdd6f049228020437bbe1ad0c7
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <c8d305b9-0962-f40e-0191-0bdd786f75cb@189.cn>
Date: Thu, 30 Mar 2023 20:52:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [2/7] drm/tegra: Include <linux/i2c.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230330083607.12834-3-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230330083607.12834-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn 
<mailto:suijingfeng@loongson.cn>>

On 2023/3/30 16:36, Thomas Zimmermann wrote:
> Include <linux/i2c.h> to get the contained declarations. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tegra/output.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index d31c87f48da0..dc2dcb5ca1c8 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -4,6 +4,7 @@
>    * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>    */
>   
> +#include <linux/i2c.h>
>   #include <linux/of.h>
>   
>   #include <drm/drm_atomic_helper.h>
