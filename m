Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADA0CE934D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 10:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E280510E62B;
	Tue, 30 Dec 2025 09:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="chJs5gzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1950310E62B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767086832; x=1767691632; i=deller@gmx.de;
 bh=E4b3Nrr8ErhI3OXzF3HBCJGNB5ATD0fyr9tKi8mhTT4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=chJs5gzms0Jb7pekTAaMHGsbTEirs0sY8J2VSEX6t00uc8RIcC42sqt8aijdPz8M
 vTKAxVYyQdO8Puf5wM1vuac/5JaQkFE5sTO8AHzWhpLYaPrAw4P5+W/VfVlCbNPYc
 m1kTkjgkuA4fjd74OiyLhqqdxW1qUk46wYQ2AZY5Z+AxJhJ4Dntojl+xL/yu20x51
 JHXrDc0xzREeJJenOoBVkiUofBmUad/Lx3A8OK53WAEf7a6sWamouEf7QOJlasjQU
 z7FZ7QhwhsdeDa/TYk7VIyVafszsEt6WuJ3VVulkGezNNYLS4rU9Wv3cwbzz9K9ht
 fZdaWgKrPVHefIcSxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.253]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKsnP-1vM0Sr1Zuv-00P0Vm; Tue, 30
 Dec 2025 10:27:12 +0100
Message-ID: <04969c5e-c04f-43d6-abe0-e458df89dca6@gmx.de>
Date: Tue, 30 Dec 2025 10:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Add check for return value
To: =?UTF-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
References: <20251217091036.249549-1-a.vatoropin@crpt.ru>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251217091036.249549-1-a.vatoropin@crpt.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UAOSZa+4K7xeq++MGNEFIq4JvdYGKAeYD90BYxN6X3Xo707bA/g
 f4SIM4otmqXCdCxxL//h+7JusDywMh6OdjnEmlskbUd229GoXIShv//yYCbtU914tS8e/AB
 m+VgEXn9PJTJFcqiEobsO1FLdsaW2BRLzArq9iZ4R539AlZbxQSfAF+GqBfoCs2C4RpXuqn
 /EjKNpkdeCA4J1CzcqLZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/e/NYSUZZHg=;KJqw8XKv0akv+cdJ6d9ggYniofa
 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
 ePj/drbTPurFyTP+NWRevU1u26lbhqE7ulcyEp
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

On 12/17/25 10:11, =C3=90=C3=90=C2=B0=C3=91=C3=90=C2=BE=C3=91=C3=90=C2=BE=
=C3=90=C2=BF=C3=90=C2=B8=C3=90=C2=BD =C3=90=C3=90=C2=BD=C3=90=C2=B4=C3=91=
=C3=90=C2=B5=C3=90=C2=B9 wrote:
> From: Andrey Vatoropin <a.vatoropin@crpt.ru>
>=20
> If fbcon_open() fails when called from con2fb_acquire_newinfo() then
> info->fbcon_par pointer remains NULL which is later dereferenced.
>=20
> Add check for return value of the function con2fb_acquire_newinfo() to
> avoid it.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

I was unsure if I should apply this patch since we don't have a real probl=
em.

This is inside the fbcon_init() function, so if con2fb_acquire_newinfo()
ever would have returned NULL, the kernel would have crashed and someone
would have reported it (or will report in the future if it happens).

Nevertheless, for correctness, I was tempted to change the check to a
WARN_ON() or BUG_ON() instead, but again: it never happened, so why
add bloat to the kernel ?

In the end, I've now applied this patch to the linux-fbdev git tree
as-is, just to avoid other people send similar patches based on
verification tool reports...

Thanks!
Helge
 =20
> Fixes: d1baa4ffa677 ("fbcon: set_con2fb_map fixes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
> ---
>   drivers/video/fbdev/core/fbcon.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index e7e07eb2142e..7453377f3433 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1047,7 +1047,8 @@ static void fbcon_init(struct vc_data *vc, bool in=
it)
>   		return;
>  =20
>   	if (!info->fbcon_par)
> -		con2fb_acquire_newinfo(vc, info, vc->vc_num);
> +		if (con2fb_acquire_newinfo(vc, info, vc->vc_num))
> +			return;
>  =20
>   	/* If we are not the first console on this
>   	   fb, copy the font from that console */

