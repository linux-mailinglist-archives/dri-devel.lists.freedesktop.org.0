Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 067C26A2A7B
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 16:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C2310E1B4;
	Sat, 25 Feb 2023 15:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC05010E1B4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H6Uiv5I35bNnZ+fMK1HxbJjQC2/MfqTNC2KWFLvXGt8=; b=SM63xdlY84wM0IAIhh7OCgYcrz
 jHybek7OXfAWRUM9eqaPyvjswcpN60f9CVACzx0VaC9rqpE2QBDq+BjyJAg7iEt7QaEec/lHyOx3L
 nS/1ly0x8GdQuaBGjx9xOEvw59+OUXZaf4bbKwkMH/r29pWiGW1TFwjuQ4fCkl8ASsjZAfVRBEKKv
 LXtC+iw1rnDQ01J4GY+1wZLHRruqWRiHsXh9TQZYEwFxMolZ0fgY8EOSHH9NjIXmEFgGskNfO9/J3
 vW7zBz58J1uqcnK3iRFsjNrHUIEEy+A2BBzaOMQcy5CeSsIyKnHHjUAhd6wTr2NSk2LbeCx7UB3IF
 x7rE4ZRg==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pVwQC-00Ei9w-If; Sat, 25 Feb 2023 16:25:12 +0100
Message-ID: <a1b0f2d2-e389-6db0-1df7-f3986e581d4a@igalia.com>
Date: Sat, 25 Feb 2023 12:25:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/tests: helpers: Drop empty platform remove function
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
References: <20230224221417.1712368-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
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

Reviewed-by: Maíra Canal <mcanal@igalia.com>

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
