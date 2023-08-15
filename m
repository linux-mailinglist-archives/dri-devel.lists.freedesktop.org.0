Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34877D546
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 23:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7301E10E29E;
	Tue, 15 Aug 2023 21:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A50D10E29E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1692135410; x=1692740210; i=deller@gmx.de;
 bh=mfDkyOir6LEgXPl0g293YmZSl3TmvAXLPzi8uuN2AZA=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=pcRahvBOX1xhCF+TWXdrjF5f2nR7airDN503Og9vVBdnO5L4hDv5JaFclaUi+Wxr/O38K9Z
 F1qM1UoIulBs7kdXWsRx+4l/0oklZQPIupQOBtjeJ2LtbeVDW8NliXpIOGm3dHO7hSY362ik9
 61Ajq9FHy3DrZ+779qQIYENcub75UfNwYdTcvgM2gGmTi9bQKVINfP+j4CxehOW6FIcAG9dYj
 crfLtyfXafc2qUc2TGSJYAp47nky0f7H6dvDHdSVPpCAKb0Dhiy7p9edfFra5C8ZZ0nMJB1k/
 tlfzaS2J/xEmUZeQhTgSZdtz0ziE3FX4FjHVkNQjssKdGGa1QDpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.222]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqs4Z-1q0nUR1s7l-00mtHi; Tue, 15
 Aug 2023 23:36:50 +0200
Message-ID: <6fdb4475-6f9e-810c-85af-97eafa6528ba@gmx.de>
Date: Tue, 15 Aug 2023 23:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] fbcon: mark fbcon_registered_fb static
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: Min-Hua Chen <minhuadotchen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230804113237.51653-1-minhuadotchen@gmail.com>
 <0423ff9f-f783-0986-9867-7862560b8c59@gmx.de>
In-Reply-To: <0423ff9f-f783-0986-9867-7862560b8c59@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZXrHO0Z+t9PrFWHOOFLenpVoK3pFqZLROUpXzlbqGblCUfA63Te
 s1fSGHQCoWmOhPXovFqfEZL8UIoWOmk4RF1fECYx8qIURSqJyNfsGhoWsMjFz9YnMsqqsMO
 myRLHg9gr1ioLDl8udFCxwUpQklkWRdW2+FT0rdB/dByceegdUwdIg6gn4cexizzEeNFJut
 jsghZW4siVnHnql2k+4iA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Vtb9DImuWFc=;XdqBbp3RYRTR1Ep8IfByBLxOfqU
 PSwhzbQCywiBI6zj0Bd/lAC5INbqUXL3LQS+Veft8LNWM995ZKqVfoe+k18FVoUUCWTN60L/N
 YELb1kqmQXUWEMn2NOA6HtyEYU7oG3XhpxNv22L7kHeh/95Wt3rnXpR/B5R6bBhk+ZDKLwy8T
 4GjH1MfCUnHQTIniEYO45ascCTzU2peQdA0douj5u7UlNzDElUObsB0NEhMWqjYDcdm3gs55w
 wbSJ04HZ/Joc5JAYAh/uUqpBoeypPXljC6TbLP7Icwg/tLZP5f7cGpZpJrIspQlixbr6AsKla
 vIWC7N+n008SJDwWwygh0rXc1qc7pE8x/4OIQS1NVwcI4fvqDPOF6oz0e3lsI/ZJf+QmPzvRo
 G/I2E8v8DvgHDlxt5T+dixZLEIVNQMlfSKPhQvYdWMMoLFgppzrNcgalcun1sUKNZJbOFsr+D
 8zF1oUG+OcgVY1JxzjO+l3g8YSTDnlDNR/3pWS8rl10hatMfbC8Ugvopjbw/Nm0VAksZYBaq2
 XpqB56CsibKWwO0LGT/f5c8xR8s+6y/7idhq7FjaLs/UlkUF2ow8x6tqUdy1LaXNjoQXFwab4
 fF/aemftHxwGrx6e9VqgSzIA9BFgGoxlQK5k82umFcfbHrewMQmmwdWwbJsQMAkscVEVw+eUX
 h4DTfzu7ASKLNJxXKd/lTkG9WWUPj5H5jekt0+YqLeu1NB2L3O6Rl9zNiUhI50cwogYOT7guo
 ONcDh5ZdjcyK89EiO5zV29XyTkWJLJFjOYK62YHM0SZiAxd0WQtp3RDgNmytwrmXoiySZZLtc
 xq6+CBIi5xCus82raeAzZ+spPwu6T86Z2ErYYA5csDWp0UsniQAZkRFdI3/EDyq9Mv++iqy1R
 mDml5BKY8ZRtDivdoPydpe2c9idh9PjxkGumOQbxAQELUZHaJV1nXNIVrW/MbWWx4xdM52G25
 Foa9TBrgkW41FV0yrQJHios1nV4=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/23 23:34, Helge Deller wrote:
> On 8/4/23 13:32, Min-Hua Chen wrote:
>> Mark fbcon_registered_fb, and fbcon_num_registered_fb static
>> to fix the following sparse warnings:
>>
>> drivers/video/fbdev/core/fbcon.c:105:16: sparse: warning: symbol 'fbcon=
_registered_fb' was not declared. Should it be static?
>> drivers/video/fbdev/core/fbcon.c:106:5: sparse: warning: symbol 'fbcon_=
num_registered_fb' was not declared. Should it be static?
>>
>> No functional change intended.
>>
>> Cc: Helge Deller <deller@gmx.de>
>> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
>
> applied to the for-next-6.6 branch.

Just dropped it again, since it was already applied by Daniel to the drm-m=
isc tree ...

Helge

>
> Thanks,
> Helge
>
>
>>
>> ---
>>
>> change since v1:
>> 1. registered_fb and num_registered_fb are still used in drivers/stagin=
g/olpc_dcon,
>> so do keep them as-is.
>> 2. change the subject to fbcon: mark fbcon_registered_fb static
>> ---
>> =C2=A0 drivers/video/fbdev/core/fbcon.c | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
>> index 887fad44e7ec..976900d6893c 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -102,8 +102,8 @@ enum {
>>
>> =C2=A0 static struct fbcon_display fb_display[MAX_NR_CONSOLES];
>>
>> -struct fb_info *fbcon_registered_fb[FB_MAX];
>> -int fbcon_num_registered_fb;
>> +static struct fb_info *fbcon_registered_fb[FB_MAX];
>> +static int fbcon_num_registered_fb;
>>
>> =C2=A0 #define fbcon_for_each_registered_fb(i)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; WARN_CONSOLE_UNLOCKED(), i=
 < FB_MAX; i++)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>

