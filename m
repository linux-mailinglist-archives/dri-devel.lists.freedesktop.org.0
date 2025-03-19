Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE984A69B34
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 22:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4264010E15C;
	Wed, 19 Mar 2025 21:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="U9PU6wt0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D71210E15C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 21:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1742420987; x=1743025787; i=deller@gmx.de;
 bh=P/5gFm2nZS74xsQp9W8UL6w9yAUFFB/yRfc2k0cdhpc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=U9PU6wt0YZhlgJvAJwEODDDpNez+ME/ZgumYD9wVUEz5tsRAQa8Euj391jlHtFch
 ai2wP4ajXS/81EBtwe1SL8crwYkFv4mE2VC0emBkw5oVlK4SMEMYg+Cz+kKWGJrhy
 xVwyT1+WW+60OrHlyztupUUFl833FoLqm0y9rh8WtJdBPmWEjTt1ev8XAMmVyByST
 Xa1tSoJyAoOl2TaJ6uPkhAuQQuVGT6fuQNumWaeN4X+igbb3EtgaclRl3abkDzj8Y
 OF9K0rTyOUNoqbuM/3qNxAB/6trdp7TXmyQUvuwrl+btONezdqQ6Th7R8J31L/FBU
 A52ZNjw/hxSxqOL3CA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEm2D-1twKau1RWN-00AUaq; Wed, 19
 Mar 2025 22:49:47 +0100
Message-ID: <2f6deb85-dcb7-40d8-b80f-3ca6e798a91c@gmx.de>
Date: Wed, 19 Mar 2025 22:49:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbcon: Use static attribute groups for sysfs entries
To: Thomas Zimmermann <tzimmermann@suse.de>, oushixiong1025@163.com,
 Simona Vetter <simona@ffwll.ch>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250314060941.160048-1-oushixiong1025@163.com>
 <9aec4ef1-7428-4630-a4af-d7448a023a60@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <9aec4ef1-7428-4630-a4af-d7448a023a60@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6gEIMBFrsWI4q0ElzKmsWhl2tLyS3U2j2PmJLKL5SUg+B56zloA
 oyS8VdpOBdoHM2xTOJDfiwLtdN0ujOtZM9YRac9BAVRyb+ceGnJJuxLzpf3SRshNpKtzcQd
 0a7VATHSobLcj+QxrfCR0CoHfIiMDnR6Oa52Li6uIckYkwEULwFZxa7bK5QrRPmLSQnRG0I
 KpFAPKzprMisThYJXjGnA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zGFvay1LiG0=;lfxBsntI4qks7FzZ7VIJCsDDTTI
 Nf5fnVSpsg9K27A3s2vHdL87kfUK3WCXEuimEg9UIetPv6exhny9m+d32TyXOAwhv3dOgSudb
 x494cYPoIUhUsmSVfjbrZOP2XKaar3iwn7DNTGTiPEnD3ifPWkDD13qT7MG+AkqBJZWKfTxYg
 sOHgwZokEtfQqJSqboAqSxDaNJW+2CEuel6RVUWrGXoAs6F/koTXxDzghZzclihWwx43Fztjp
 TmdesOQOwBn5vQEZuu4A6BI+jdFxv8rFkLaT+CeehzVhQX93/pxzAKXO0W+FTGdunaz/yAfkI
 RLgl0i2JsUShD6kDF+FMI/v3zhx1BqBAutVx1eCWr6R6vZZKhYd9tXrb0G2N6KV1MZWlXe4Rv
 GkWmmAMNnxKbjMzZBg/jVZ/Bx+t3JRWBABKVRyNwVrG+9ORsIGxxWXRI3gtTzbmaazEU6f506
 VUDQSl0OJ5ZZUs8uIoP7869lu8Gsea0LpkupNAWwv3dk77J2HANmUOJqXLohkWMQj1xOw8V/O
 FtMXfNJcri7R1Ce3t02Zc513X/g2HIz+2N6jjiSJQf+tkhETjIdLpNlWr+IArJ0MDtodElQZB
 xh+0NBEAQuRM8D2SouGrBjRkw7XIlHZ48h8jALGxtLyZnZxtJdXjXBsu6s4Rp9b0F6SVdBhgg
 Ej1dGK4bQ3pVmJ+xX0FBc20mTFJcFehHeABxRXWoEnfIp+GR/q5bgBPf0m4CdyHbu0QKQ3n1m
 Rt9jEk0sNtiqptM1EhN7i8b0lNat9/G8WP0/JCEcavqnjEIkqYYd4R5fQr+WC1A0KOO64isqr
 q2cne1PJcIQh8zseSfS9od22Gx0lCA34xDU8dh86gFZJty+5N2iKlAZX07gmyiJKHIfBpXdY5
 NEUrbCVWP9u+TvZMwzd6E0zgaXHHchCSS3XNWuVNp+JIkemVwjhB4uuX+nvv0pDZW8TnsmP8m
 niD3OU9iYlvJ6elat60lcqQgqBBiy+/+rZRXc0Ba39UehQ01Qn+y3HjJDW/4Qn71koC4x+4Cz
 MUOo97b47wuTtbUM94AjzChUQvqIJPwCpdQpS/NRNh8rda6Rw7WdcS0Ji0I1j659hA0p4x9/S
 NByRNfH0cSmnShWkjL0X5DT+3Gd4O7gnwaNjAwJFPSYcQDrqr4pF+NQEZzWClsrdyc/8WtA6X
 D1yOVnVCs2YxlKY9KjPxBUB8FVbyxidOkkWBFsYE/ZIXZl7OniCyTsh9Mk+mi7WPvWMiodlCp
 5uG9W8b4UqWUMoaOgb35sYIEmQUtWnLpElgrFMnydlKg5wyZNy0/2+dmbLtuK7FsRl0XrXkGg
 bf07tn7TdkpZji1OdWgaE+eduNVZMIvhTy9O5GLWKX2s5YTX6+oaGlR86oCvXnFpoA4Clar46
 NQxkDtLf5NBgjpUhSyn1nzIEB5D/6DKS3qjPj2xJKF16alg0h4gQC1shxTSM39SQV2hs3CRjV
 9IsqGQ2cxS3US2+ejLzRDcZ9+kEk=
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

On 3/14/25 09:16, Thomas Zimmermann wrote:
> Am 14.03.25 um 07:09 schrieb oushixiong1025@163.com:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
>> Using device_create_with_groups() to simplify creation and removal.
>> Same as commit 1083a7be4504 ("tty: Use static attribute groups for
>> sysfs entries").
>>
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> with minor comments below
>
>> ---
>> =C2=A0 drivers/video/fbdev/core/fbcon.c | 69 +++++++++-----------------=
------
>> =C2=A0 1 file changed, 19 insertions(+), 50 deletions(-)

series applied with changes as suggested by Thomas.

Thanks!
Helge
