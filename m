Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7D4701764
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 15:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245D110E0C0;
	Sat, 13 May 2023 13:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC5FE10E0C0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 13:29:50 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:53644.2016826367
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 673BE100183;
 Sat, 13 May 2023 21:29:47 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-prw2v with ESMTP id
 4a38efb6a79845d5bc48b8e718dad9b4 for javierm@redhat.com; 
 Sat, 13 May 2023 21:29:48 CST
X-Transaction-ID: 4a38efb6a79845d5bc48b8e718dad9b4
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <ab3a2467-2236-604f-b4aa-862a7ac838e9@189.cn>
Date: Sat, 13 May 2023 21:29:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: drm/ssd130x: Fix include guard name
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230512120232.304603-1-javierm@redhat.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230512120232.304603-1-javierm@redhat.com>
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


On 2023/5/12 20:02, Javier Martinez Canillas wrote:
> This is a leftover from an early iteration of the driver when it was still
> named ssd1307 instead of ssd130x. Change it for consistency with the rest.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>
>   drivers/gpu/drm/solomon/ssd130x.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
> index 03038c1b6476..db03ee5db392 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.h
> +++ b/drivers/gpu/drm/solomon/ssd130x.h
> @@ -10,8 +10,8 @@
>    * Copyright 2012 Free Electrons
>    */
>   
> -#ifndef __SSD1307X_H__
> -#define __SSD1307X_H__
> +#ifndef __SSD130X_H__
> +#define __SSD130X_H__
>   
>   #include <drm/drm_connector.h>
>   #include <drm/drm_crtc.h>
> @@ -94,4 +94,4 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap);
>   void ssd130x_remove(struct ssd130x_device *ssd130x);
>   void ssd130x_shutdown(struct ssd130x_device *ssd130x);
>   
> -#endif /* __SSD1307X_H__ */
> +#endif /* __SSD130X_H__ */
