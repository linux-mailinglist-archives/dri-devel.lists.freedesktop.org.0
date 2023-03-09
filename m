Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6316B2DCE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 20:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C3B10E1DD;
	Thu,  9 Mar 2023 19:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7855F10E1E4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 19:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1MW6Z7TO1pl1SzjDsVoifoj1rZxRQ5JoEL7G1umTWDg=; b=o45x5UjTQqMnDk1Bk+pO/CD/Xg
 p27rFdl9q3PFO+W2epThYzTOtkAgvbd852xxMskfTJTjTEFcbWlAJcHe9SGFkL3c/Kf+yKUFoP8mA
 6SgCzVLnjzWk27C7LKBoc9tc8uCOPz0ny8jRxvdz7Chl8DLi1AuVhBrLKa/oU9CbV4kkLbopa8RPM
 Zs6OE7tFMe2cEE+Xtt50CUGPM2e3vG2pEthkNKeDl1CmkGmFc5qf+TWNQPXfS6D7eyIdQiOmNTYFK
 +OfI2S4IZgsK2pLZTtYvTNUgEi0bYQaNg/Ra4ICmGwyHcJGKwx32jn9SKLcCX4XJiAX7IJ9mscq39
 FGARp4+g==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1paM5j-001zlQ-S5; Thu, 09 Mar 2023 20:38:19 +0100
Message-ID: <5eafb8b8-ba4c-6a74-60a9-ee3a7b5cae61@igalia.com>
Date: Thu, 9 Mar 2023 16:38:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/tests: helpers: Drop empty platform remove function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
References: <20230224221417.1712368-1-u.kleine-koenig@pengutronix.de>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230224221417.1712368-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kernel@pengutronix.de, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/24/23 19:14, Uwe Kleine-König wrote:
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to drm-misc-next.

Best Regards,
- Maíra Canal

> ---
> Hello,
> 
> the remove function was introduced in commit 57a84a97bbda ("drm/tests:
> helpers: Make sure the device is bound").
> 
> Best regards
> Uwe
> 
>   drivers/gpu/drm/tests/drm_kunit_helpers.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index e98b4150f556..4df47071dc88 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -19,14 +19,8 @@ static int fake_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int fake_remove(struct platform_device *pdev)
> -{
> -	return 0;
> -}
> -
>   static struct platform_driver fake_platform_driver = {
>   	.probe	= fake_probe,
> -	.remove	= fake_remove,
>   	.driver = {
>   		.name	= KUNIT_DEVICE_NAME,
>   	},
