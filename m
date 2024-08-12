Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2194F8B9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 23:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B40A10E06A;
	Mon, 12 Aug 2024 21:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="LmX4tE4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B1110E06A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 21:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1723496662; x=1724101462; i=wahrenst@gmx.net;
 bh=DKtjNhe7+nbF8JHA3vCW5OYYhp8tnoOSo7h0OpUJ9U4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LmX4tE4jw8yVX9Gap8ZeeTe6AdNlHl6Nw4asL7aV48MtaRxG0Feuk0top0/DB41E
 TlicCV75pQQ4rG/s23JXqCIQrf5seUygl2wP/QDgn8vwLLUVTsgItO2AsVOlQRmnV
 BeUS1TG0TI8uA5FhgnY6dFx5S3aoRaH3PO4e8gv/YVQkl0vFlHhkYmTq/hxx4CPHD
 Z9IMLrHuFR5XWiRGVPCBFlguQzthOYrGlkiNnxdTb5PPrtI6p4MPBo99NxiFY2uOI
 X4lu1LSWvrV3qhKVfCXP7gXU58dCG7SVmweWGbT1IMDnRbQz4VLYtX0B4RzxXrAS7
 gq6M0rQQvn2MCv5xzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmGZ-1stDG30Zuj-00KJ2j; Mon, 12
 Aug 2024 23:04:22 +0200
Message-ID: <19287be7-3136-4c75-be91-f3fb585954a9@gmx.net>
Date: Mon, 12 Aug 2024 23:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 05/16] pmdomain: raspberrypi-power: set flag
 GENPD_FLAG_ACTIVE_WAKEUP
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728114200.75559-6-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240728114200.75559-6-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d1gqw1yiMT8CmYwa+ZALyjX6ZixEUPMZTinZ8wEqTverOYCRAjk
 tFuXt33XZNSJdQi1QK/M0cF2UC3mLRcJL/JrRMAbSQ7Uzs/LLL/OdYdWAjDmR4Or+rlAtxI
 dssQxHgIVPc/JRBVDwR9/wse56Q+OI/5Z5i8s1dHlPCzOH8zKobEQ1lRg30XYJ8rypp1joF
 sURD4BAlt8ElWUsowAb6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0WKLVPnD5vU=;a6jv6C6lAtEo32uCXJC7ohdm6Ot
 ChB3zr7zIu++csE/YRwUf+3uzCorTCo+OgeXLt+F/GsOLHYPNmJu93SV61mjCpaKtaCAQ+eHG
 aicWvxs0jgOMHahuqUHjKmp2M5BaJvQfTEaxyWnXSBZUDoQ7meMOV+7zWwbcI7CWguhUY+4jh
 xcElR/IWxRl/x8BQTT4YGMkvKcJvCqmXmjsWAn3B3FQARFbwqp8wgrcpwbArzl1V6//ssp2ZM
 3Rf368IiVlbbDjL2zANv+xf3QmmwbFWkI6b7l+IFDjWB9S3dovZjNC77uITA8cjEHOg/ACsJX
 KGSh13aXM7xpumVIQFn0FlJ/9JRW9BF1BRBRENcrmV2cZmrmE5uQ4atbOK6PvdeGhk6skpxFf
 VO6U9EWCgaIbwDJfOAiyOEYkt7PsvyhSITyTnaeNfI9lZb6cvb2NNxqzUUHcVfPIBH/Y9DFKy
 DYvzPqxPCjsswEVm6+4A7BoNdxcegQT3r3fxN2RHQAv9CurqGBaJuwdVebNKGTmzVUqmN/oYd
 AU2t0OIWF9750oauBp7wbTyAVCDnzJRNqyJuT1vaP0R1tt0WpXG8Z/ZPivY5R+z3pB7Z6OshO
 27A9k8SDKU1KDzDpZKIHk9nlfyRgkRuWzlyO5O+y4rntwYGjQ8syNyie2V3drpPM+Beun/iMN
 kSoZbCF7gGYIrKhTrZURpePONGQsqXeUOi9b6VZ6yX5IImqPbIkjqq3WxkyDW9yEr0Vy/1qEw
 jysgE0wJ94YyR9cl6U/9XEKurryPpOOd4jlTpqIueohGuxwQSv/h0oJqWnIg/bGaicqYDp4Kb
 89MqcEhTmiUQCsAT9a8rk9pA==
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

Hi,

Am 28.07.24 um 13:41 schrieb Stefan Wahren:
> Set flag GENPD_FLAG_ACTIVE_WAKEUP to rpi_power genpd, then when a device
> is set as wakeup source using device_set_wakeup_enable, the power
> domain could be kept on to make sure the device could wakeup the system.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
I know a lot developer are in holidays, but it would be nice to get a
review for the new pmdomain parts before i send V3.

Best regards
> ---
>   drivers/pmdomain/bcm/raspberrypi-power.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdomain=
/bcm/raspberrypi-power.c
> index fadedfc9c645..b87ea7adb7be 100644
> --- a/drivers/pmdomain/bcm/raspberrypi-power.c
> +++ b/drivers/pmdomain/bcm/raspberrypi-power.c
> @@ -91,6 +91,7 @@ static void rpi_common_init_power_domain(struct rpi_po=
wer_domains *rpi_domains,
>   	dom->fw =3D rpi_domains->fw;
>
>   	dom->base.name =3D name;
> +	dom->base.flags =3D GENPD_FLAG_ACTIVE_WAKEUP;
>   	dom->base.power_on =3D rpi_domain_on;
>   	dom->base.power_off =3D rpi_domain_off;
>
> --
> 2.34.1
>

