Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B16D7E6042
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 22:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56E410E86A;
	Wed,  8 Nov 2023 21:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF3110E86A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 21:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699480621; x=1700085421; i=deller@gmx.de;
 bh=EVvbtdVKyoT9YNrbY1q9L/NNpUZnGYUgpxHahx3DLNY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=obO2YV31W2JkFZm1ODzFP0n4uKVLM+HQyjAUbrWEJyN2vJalnH84e9Q0M5pfX3ER
 IUkMVXNGAABa1Qqgzi0UL9+f8IUG97Lj2RWeC3H2RhdkrqM/a4T1dVyCqIsb34EBq
 k9efmrYFCI5yUylj7CclBbay8A+YbeUQsvY1n7EiFf4FsOwoQPFBJgkkumprsn8Uu
 AsByqVEMFE1Nz8L4CIwEVluwEe22g+zZu01aUqkir3W3ywyOc7iPGcvXY9sxtjZ8A
 UnO6c4BQZTE0CeevMwr/TUBhatANwQhIDnxwlPUcNHj4xg27d+jbQK7CjZplrs8Td
 aRhomhSlMYPMux560w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.158.7]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeI2-1qr2uv1HPQ-00RW48; Wed, 08
 Nov 2023 22:57:01 +0100
Message-ID: <656080fb-7d10-47ec-bdeb-a099ceee99bf@gmx.de>
Date: Wed, 8 Nov 2023 22:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
 <20231108184805.GA1579138@dev-arch.thelio-3990X>
 <20231108210018.ayo5b3afggmt6wfc@pengutronix.de>
 <24c4cc36-d14b-40cc-ad8d-dea029cf1845@gmx.de>
 <20231108215220.3iw5sydxad32gufj@pengutronix.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231108215220.3iw5sydxad32gufj@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sTnk1ongcvSCbBrFk4GvLn+XnR9xivqmx8vhXNolrr6BTrX+Jwl
 5Z4UFUe+Bz2VGvh+TJS5ImK8RJ9fEBUM59W9UEDNkyqoFFqRsts09CD0WIpeZctqUhdtPSG
 GhaUN1A33noortZGbTzOogdG9XYDcfFrJ0npF5nKU/aZMLP3cPNG62QXZqchrFiUtx40W6J
 Zvtz7gRotqItrCAgpgv8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XtvJNR+EDQQ=;16MzEAJdfkDGW1Ay83gsdE1oydy
 9tMp17B4cXRVKdJI+d2kTa4oJP5/oF1JVikIsskUU5h2SbUKIGeCs6NMEm3+EG+mrbzG/UCkV
 cSZI+eWVIystNYrmM7GeNic8IwMGEWYDUcGa+IVnsneIs8WDjDAz6oax7yZCKcjFzbO6WjWYN
 J+pzUf1z9GD3prU1/Xz32y4iVzOcPf5zTVy6yEpur7trFPJ3rslv4g9ceFKCyKDSpNPzw/WJi
 TkmFw3X4YeksGoRW4x5yirue6nDOGYzqld+59ONoNEsl+uLrDv7FyM1fdvuaM90sqxa4u9KIf
 NpQIw8yb0JX2I/Gb2+zAQvKUThlVT89p4owTFjQHPDNhw1OsyO5pFJQJinHFJUjg3iCeHYV5K
 LhQfIYYhpQ6PC2z08MY1Vmf5KPWACRzn6H7TzunMzuxt7qFZBbakAV3KfPwqcxAxpPpeV+xib
 yj2Hqkbl6VuUgf0Oz+wstU2otCSlLYbClP6MhWT6pHRw25ibaVeLFWYd/vfHs69CwMMHFfplg
 tGyewweAaOOoGhPBej2Lp7PMdJfLBmi9xfOoP5N0ltMollffaLU9A8vyycMUpPAuIZ3/7Iu4b
 s+FQKPLhXUv69xffh0I0QyFaMzcdw0G8+63IqoMLyEcdgBn8ITLFBnK5NbaM5bXdIgtuEfQmG
 PK6iXcS1v8zJv6X+aWFVDgHHhadUJsTwXB/0NQo1N3fYzY8/0VzEBLriVUiIM0JK8TV/4iREn
 ku/KLFMxXJAt86xcAEFbK8ZILuOF/WC14OGl+mULq8p3BpxZyZ8PmnaX+wGVFhmYxmV4QbNrb
 mAD8RETxYAUGXwpckjA/z5ZaT8etPM6mTsgYiPKkHCJlb+Iy9or03ibfamwEDw+ZmuUzst8g/
 s35rE/sHo3199E80+3LTNR4kwQ8XM+oxjJ+asY7ITjm6bXlSgphg9o3UScXoXT9J4RwaP+8aR
 uVffqw==
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nathan Chancellor <nathan@kernel.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/23 22:52, Uwe Kleine-K=C3=B6nig wrote:
> On Wed, Nov 08, 2023 at 10:24:09PM +0100, Helge Deller wrote:
>> On 11/8/23 22:00, Uwe Kleine-K=C3=B6nig wrote:
>>> On Wed, Nov 08, 2023 at 11:48:05AM -0700, Nathan Chancellor wrote:
>>>> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/=
atmel_lcdfb.c
>>>> index 88c75ae7d315..9e391e5eaf9d 100644
>>>> --- a/drivers/video/fbdev/atmel_lcdfb.c
>>>> +++ b/drivers/video/fbdev/atmel_lcdfb.c
>>>> @@ -220,7 +220,7 @@ static inline void atmel_lcdfb_power_control(stru=
ct atmel_lcdfb_info *sinfo, int
>>>>    	}
>>>>    }
>>>>
>>>> -static const struct fb_fix_screeninfo atmel_lcdfb_fix __initconst =
=3D {
>>>> +static const struct fb_fix_screeninfo atmel_lcdfb_fix =3D {
>>>>    	.type		=3D FB_TYPE_PACKED_PIXELS,
>>>>    	.visual		=3D FB_VISUAL_TRUECOLOR,
>>>>    	.xpanstep	=3D 0,
>>>
>>> I wonder if this was broken already before my patch. atmel_lcdfb_probe=
()
>>> does
>>>
>>> 	info->fix =3D atmel_lcdfb_fix;
>>>
>>> and unless I miss something (this is well possible) that is used e.g. =
in
>>> atmel_lcdfb_set_par() -> atmel_lcdfb_update_dma(). So atmel_lcdfb_fix
>>> should better not live in .init memory?! Someone with more knowledge
>>> about fbdev might want to take a look and decide if this justifies a
>>> separate fix that should then be backported to stable, too?!
>>
>> I don't think a backport this is necessary.
>> The "__initconst" atmel_lcdfb_fix struct was only copied in the
>> "__init" atmel_lcdfb_probe() function.
>> So, both were dropped at the same time in older kernels.
>
> But info and so info->fix live longer than the probe function, don't
> they?

Yes, they do.
But AFAICS info->fix contains a *copy* of the initial atmel_lcdfb_fix stru=
ct
(and not a pointer to it). So that should be ok.

Helge
