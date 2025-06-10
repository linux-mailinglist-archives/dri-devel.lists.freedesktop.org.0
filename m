Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBAFAD41DE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 20:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CA010E356;
	Tue, 10 Jun 2025 18:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="KPmY2IS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C7310E5EA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749579881; x=1750184681; i=deller@gmx.de;
 bh=uaXSjmpcH4s/lkjBsb/Lg1NU9lJA8+bexTjVCbmDWSk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KPmY2IS0dDVsnKmUy1p2dE2aTbajH5S5anxdirP3wVnvj7DjH+tSrpQkVtEEGPl3
 R+tBhZGPF2wGmPXpkCqerNn4QSrxHUttL+UnIFhC31mnfeuvj9DFZKMkVUQPSySj4
 raeicEshDt/FlJ1oOrGt3BhcnR8jlz/HzLwWVaApGD/F628Yxg+ALwlSPaO8tAejZ
 ArPPAUBWEz6/hDUg/gPHvXQ/+JWr08xceVw3KZ4VJd9hS/ibqoc05HnsIkwP4cLea
 HOqtaZ/QyYfup9xMcI0CCoaWMgfm5gualtXBg9BqUxhPQwiOGDK06j6Gv0WUja8JH
 mOTV9UX3iZ6NyAO9xQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8hZD-1uTiUD2xPd-007HYi; Tue, 10
 Jun 2025 20:24:40 +0200
Message-ID: <7928576a-dffb-4d27-a04b-8257d7f25383@gmx.de>
Date: Tue, 10 Jun 2025 22:10:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] fbdev/cyber2000fb: Unexport symbols
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-5-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250610105948.384540-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UefUmg4sCRw3607JZMVEwyI/jpc1DTrLth50WgH+38wNmJnOHm4
 l5AJICb9g5y53PzJOvS6VkvXcYa0tlKzAlaSGFasscCuze85RCAZ+QEdvPmt/KOS1WJLg7Q
 lls/IKKJiT/kkEoEX8wlxdofqTHfAr0EIzZKRpmdiw/lEbU9sZ6uYNpQL/rrePsFCzbJkYH
 d0upm2Y48+Sxj6naVKkGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3xYZMWIZ7iE=;49Vob1POehb7TLjhqsTLjwy6ri/
 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
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

On 6/10/25 12:56, Thomas Zimmermann wrote:
> Fix the compile-time warning
>=20
>    drivers/video/fbdev/cyber2000fb.c: warning: EXPORT_SYMBOL() is used, =
but #include <linux/export.h> is missing
>=20
> The affected symbols are not used outside of their module.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/cyber2000fb.c | 4 ----
>   1 file changed, 4 deletions(-)


Seems those functions were used for some capture card/tv driver
functionality in the past.
Maybe we should simply remove those functions today?

Helge

>=20
> diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyb=
er2000fb.c
> index 986760b90465..fcc565b2d98c 100644
> --- a/drivers/video/fbdev/cyber2000fb.c
> +++ b/drivers/video/fbdev/cyber2000fb.c
> @@ -1089,7 +1089,6 @@ void cyber2000fb_enable_extregs(struct cfb_info *c=
fb)
>   		cyber2000_grphw(EXT_FUNC_CTL, old, cfb);
>   	}
>   }
> -EXPORT_SYMBOL(cyber2000fb_enable_extregs);
>  =20
>   /*
>    * Disable access to the extended registers
> @@ -1109,7 +1108,6 @@ void cyber2000fb_disable_extregs(struct cfb_info *=
cfb)
>   	else
>   		cfb->func_use_count -=3D 1;
>   }
> -EXPORT_SYMBOL(cyber2000fb_disable_extregs);
>  =20
>   /*
>    * Attach a capture/tv driver to the core CyberX0X0 driver.
> @@ -1135,7 +1133,6 @@ int cyber2000fb_attach(struct cyberpro_info *info,=
 int idx)
>  =20
>   	return int_cfb_info !=3D NULL;
>   }
> -EXPORT_SYMBOL(cyber2000fb_attach);
>  =20
>   /*
>    * Detach a capture/tv driver from the core CyberX0X0 driver.
> @@ -1143,7 +1140,6 @@ EXPORT_SYMBOL(cyber2000fb_attach);
>   void cyber2000fb_detach(int idx)
>   {
>   }
> -EXPORT_SYMBOL(cyber2000fb_detach);
>  =20
>   #ifdef CONFIG_FB_CYBER2000_DDC
>  =20

