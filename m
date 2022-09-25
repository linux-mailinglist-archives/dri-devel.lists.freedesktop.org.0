Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABF15E9295
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 13:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8622710E1DD;
	Sun, 25 Sep 2022 11:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477FB10E1DD
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 11:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664104283;
 bh=YfYGXKfrN/hquVgSeUYxv58IyRMBmaklCAIiUhWqJ1M=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Q4/VoogbKK/ISaRZGbiFojBjEZDNjlSKiGBPPC152HW/EEOZEgAKLocUE30zJHJZf
 187r+qpxJRz3TcYWHH4CyxbJF4vdwH6UYq4CL7rhVbnCvLhnYlUjzWKJFt1t+zheOq
 aG5aMhyowDObzC4CbaBVmdiCh3yh7GHZyBTlXuks=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9Bu-1p08iL0jKg-00oBx1; Sun, 25
 Sep 2022 13:11:23 +0200
Message-ID: <abde96de-193c-fa78-53c6-e65629b419e9@gmx.de>
Date: Sun, 25 Sep 2022 13:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] video: fbdev: controlfb: Remove the unused function
 VAR_MATCH()
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <20220914102301.87981-1-jiapeng.chong@linux.alibaba.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220914102301.87981-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UtXBP5Rqmu9ji5upE9dmWxqntnv3O0B/sajoMVPYMJvb/x3FO7W
 qtdDFG/9qA/96vMXDY2wGcBJWddykFNszm1UFEoOWqNsOOFP7G4kcPp7iGoMvXYLZTlFZA8
 NXJPLu2HGNz2Z4z6984XBi5d4JGrhUtZqYU1+EsKLUkYwn+hwyopIWre0mlu6bAtcRe9XcD
 Qr628T7/Fo+tYNklQxXqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x7DJNZCzVwA=:pqVk9zP8EZATFD0SIvDfxo
 cqzQkiXUrpQYVov6ctiqbhFDzkMKroIXlqslPwB7NEknUHe+GfBHAG40g5Ou+8UiOzV27BJq0
 6al8NEDRH+DEU78IzzzZyfO4LhgS+y3g4PnsaYHvy6qMV3LcCgN4RGlq/WwmdsCiyQyaAKjYR
 9QW+thirehM/Rd8Ujb36HCRM5aoM3HGAOXMqLo2vwFRk+WDy8ULZ6r46bQzDSQIarjzKBATel
 UIx2g2i4Fvq9K6hi79+J0kSAeeiVKhv3rhYydV4urDU/DPbO2z+WLvhfjp5RxZrNOmATp5ecS
 WCCpqv5PC5wpYBiX+IIZBvIrAfp3xUWRo1zyhDtKecQtGYBkMWujys/0YER0/TTwXa5nIBfhx
 oeMRHs6dzpeieRsOtK5ov72EhKqr2+zXOt5tq6A58rjsFDSC1vhxQWY/UZaj97vacN8P16bkY
 LGWm7AmLW2jy41weQRR07cKcLotpQ9Fy8TbPR63iePqAEieePqhNEVSbCYxGy+I0y/LUyzP+6
 N2Zmq8PAmQAlUTP4u5EoWlfFkuJVcEfnOF9r9qfxPWOXrS5eiCHYbw8yZcYZNBBRy5oJuYAUJ
 yHTMaWA8WAAlIOraY1fNbK00q73uldXLS9h757LJ+Y3Q7LxYFs8DH042BjQWQIWYG+GXrD+BA
 wB4sC/5sTB6+KtN3WqukXS/ExvwSQykjM9N9AnmwMgiZkkYodDDHaGaQaVUKe0JQ0cQ2geE01
 Om9iKnRJJF8S+k1xylTh1Nr06oeTjfw2a2NmGOLRlC9yEHGiCNIWvOq3eAov22BHmlzguvn98
 Af2lmqHgzNS6zkHmohl4OytehFFR7m6QV8sqrCUPebQA+GpHquCuvmf8RZzOuHr1fmxtJed6b
 N4zJj+fnymJ6aFaEMXFSwhqr4fajOH+0E1mKMneTqoXXqsNDYESgb/t21zcf7lv5hfVak41I9
 JS/hvpi3cJ0OZFxscyMa2rWVrBavx7UjLqjAL5fdbbrke9Q2Ek6ezZhRfZvyFvLRmMMgeBCtT
 4uBya+WPVY3aNqx+arb2TsJXHHRVnF/fOqLAeGVaAKZc4HzLtCtlhUqx1PB8517GJi9diiaMy
 +T+kdEf5ubXlZI7AI0N8Qte8PUPCwtiy6ETdqectEyb474qMP8xD2aWV8HnayNVV6jEDjqL3T
 6Q31vl6h1kIgJGvuaLu0JlqXOr
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
Cc: linux-fbdev@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/14/22 12:22, Jiapeng Chong wrote:
> The function VAR_MATCH is defined in the controlfb.c file, but not
> called elsewhere, so delete this unused function.
>
> drivers/video/fbdev/controlfb.c:111:19: warning: unused function 'VAR_MA=
TCH'.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D2153
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

applied.

Thanks,
Helge


> ---
>   drivers/video/fbdev/controlfb.c | 7 -------
>   1 file changed, 7 deletions(-)
>
> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/contr=
olfb.c
> index aba46118b208..6bbcd9fc864e 100644
> --- a/drivers/video/fbdev/controlfb.c
> +++ b/drivers/video/fbdev/controlfb.c
> @@ -108,13 +108,6 @@ static inline int PAR_EQUAL(struct fb_par_control *=
x, struct fb_par_control *y)
>   	return (!DIRTY(cmode) && !DIRTY(xres) && !DIRTY(yres)
>   		&& !DIRTY(vxres) && !DIRTY(vyres));
>   }
> -static inline int VAR_MATCH(struct fb_var_screeninfo *x, struct fb_var_=
screeninfo *y)
> -{
> -	return (!DIRTY(bits_per_pixel) && !DIRTY(xres)
> -		&& !DIRTY(yres) && !DIRTY(xres_virtual)
> -		&& !DIRTY(yres_virtual)
> -		&& !DIRTY_CMAP(red) && !DIRTY_CMAP(green) && !DIRTY_CMAP(blue));
> -}
>
>   struct fb_info_control {
>   	struct fb_info		info;

