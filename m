Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B49F66D03A3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1724010E253;
	Thu, 30 Mar 2023 11:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id ADC3A10E25A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:44:28 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:33492.813236303
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id EB3E21002C5;
 Thu, 30 Mar 2023 19:44:19 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 373e01980ab14a27ba9013e33859b0ba for tzimmermann@suse.de; 
 Thu, 30 Mar 2023 19:44:24 CST
X-Transaction-ID: 373e01980ab14a27ba9013e33859b0ba
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <09bfe040-3185-392d-3ea3-734946ea5fd2@189.cn>
Date: Thu, 30 Mar 2023 19:44:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [1/4] drm/armada: Include <linux/of.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, linux@armlinux.org.uk,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230330073046.7150-2-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230330073046.7150-2-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

On 2023/3/30 15:30, Thomas Zimmermann wrote:
> Include <linux/of.h> to get declarations of of_node_put() and
> of_device_is_available(). No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/armada/armada_drv.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 0643887800b4..fd9842740a08 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -6,6 +6,7 @@
>   #include <linux/clk.h>
>   #include <linux/component.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/of_graph.h>
>   #include <linux/platform_device.h>
>   
