Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1C4ADE4A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 17:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A94C10E740;
	Tue,  8 Feb 2022 16:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD0610E740
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 16:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644337422;
 bh=XThKsYT3SSJDiqTd/cXFxOMEVDw/FGebkK8AA7t32ug=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=K2SOJjhU59b23DveJCHOw764L56MQasqumPLcGm3vm2YIF0gjPf4YMxNDhDDjNGwQ
 Okr949Bh9eOJztAT4bIKt85W8aU0lfJurJUKWOQtY+M1MYUw+gTSSUdPbbaGnu0jvV
 1qGktZ12jXKqOxSdXaVy1CY5eV9t/lJe4ljZjAvQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.144.255]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Qr-1nqG452Sfr-00aGEU; Tue, 08
 Feb 2022 17:23:42 +0100
Message-ID: <ac128a97-a886-640a-243d-d0af97386655@gmx.de>
Date: Tue, 8 Feb 2022 17:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] fbcon: Avoid 'cap' set but not used warning
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <YgFB4xqI+As196FR@p100> <YgJzohA7S7itGVe+@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YgJzohA7S7itGVe+@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DQ2UQXaPHNaHX/KiSwR0UEXxisFLIzTQ0pBVIxjm5rk3yggZHL3
 FHxFS8iYdWCceejT54iamAISAI+hoPUkzoO2lsgW+qzFTf4XPq2dMeBP7i8Utx4tw1xAcah
 qEghjTTBYsUpPCjF4iPGwgw+1zYOtwiIX4ar63uv37V574oiKkChSkr16+m39J98enj2nED
 +C3GK72yGxEVa04UuDTAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9RDiH95oPoY=:1rtdMUUt231M2W8wexZuiv
 YyVIw/Yo6SVf09sMfwYZvpRTEMO7aj5vc/fWJHrRct9ubY/U8sBIQPBnWtubKyW9suww66X6A
 zcPOc/GJKXzvEUDPt2HLYntTyUaE1vhL9YVXjdiwaS7V12q9FClrxU4WhaWZWJBJWIKG2QDPT
 1ks41A9xd3MqVLePZOH5odmWRGKeEkD3M9dB4pbRXazL3dxPzJ3A0z3yPJyur5440hsg1gKoM
 epWMQkcUSMXIDxoXwggHRIygQpaza78daK+nepdsb1FbRUiO5Hh+aiEFUsRT0A1IW0mvrn1pc
 x0qgHRr/muDqzX+FEB0cfFO8P34tKU064Db4yc8B2qBBEsSLUUp9FWt71WkZmyD3POvr4z5pI
 YU4EPY7wVriW2sbST4JO/YPrqLwbnbIOP4cRwTURytYlMWkIqvL1fOcEXJIZRAaHoTjSQfk14
 uKhY+vjzNsi3Rd6RQSE69uxpHLVi1a+YGVLqmr7gKlus1DU1LDx500pyP7WJjFOHZ9vbGBPo5
 L2LpLh/ZN2ij3N06f76A1ZE+njPNgOKfM0HlM7eTo0ycwyozroij9SwEf67c1fU6ewp5Kbgbm
 QjA2jkgeEFpqCyACPFyd+G4F955EIpALcJNtQpCNnwK0ew8dTW1CYuQYhDJ2xaV0KvxHJUK9v
 XIVombNiCYKvj6+bhVMW28Bgm66NzMbRiMZ7MSpYrF4ki+5Wws8zw1Pg6UcY0dV7xkjw2gJ/h
 1mPPeyijQwYwRIvSwdOo/4nouNZuQdeDPGrpTnbE/LkMe/hTXwiKOFIDrON0gdb8be/JrXTpX
 1KzF0eUSpiEzOoici7UGUiMyQtbM/EvIBcVI/XmHtSbTRGv4GCgD6H2yjbgVBFIbLX6eU4iP5
 t+EPWS3xIMUxkUUoZcYpeWw5q8n1/nlv9pvMCRDljKKYOr5bMkEnUEn6Wk4Ygf8p8l8/QI7uD
 a2Exyf1ULUfmJqvs4ONVoNb/5MyJGgY5IibYRpJV5ZvSfd2ECyfaeGmb6MBb0b6rH1ZsTmF58
 cpm4+9cjZsIlbwKyNO3ay0jw6gxdo0gjhitZfaZ8bcb/00zmjsU7Z2wEegGiTxMLlg==
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/22 14:44, Daniel Vetter wrote:
> On Mon, Feb 07, 2022 at 04:59:31PM +0100, Helge Deller wrote:
>> Fix this kernel test robot warning:
>>
>>   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_init':
>>   drivers/video/fbdev/core/fbcon.c:1028:6: warning: variable 'cap' set =
but not used [-Wunused-but-set-variable]
>>
>> The cap variable is only used when CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_AC=
CELERATION
>> is enabled. Drop the temporary variable and use info->flags instead.
>>
>> Fixes: 87ab9f6b7417 ("Revert "fbcon: Disable accelerated scrolling")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>
> Applied to drm-misc-fixes.

Thanks!

> btw I think would still make sense to grab drm-misc commit rights for yo=
u,
> so you can push stuff like this directly.

Yes, for such trivial patches to e.g. fbcon it makes sense to have git-pus=
h rights.
I've just created a ticket for this:
https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/417

Thanks!
Helge

> Thanks, Daniel
>
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
>> index f36829eeb5a9..2fc1b80a26ad 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -1025,7 +1025,7 @@ static void fbcon_init(struct vc_data *vc, int in=
it)
>>  	struct vc_data *svc =3D *default_mode;
>>  	struct fbcon_display *t, *p =3D &fb_display[vc->vc_num];
>>  	int logo =3D 1, new_rows, new_cols, rows, cols;
>> -	int cap, ret;
>> +	int ret;
>>
>>  	if (WARN_ON(info_idx =3D=3D -1))
>>  	    return;
>> @@ -1034,7 +1034,6 @@ static void fbcon_init(struct vc_data *vc, int in=
it)
>>  		con2fb_map[vc->vc_num] =3D info_idx;
>>
>>  	info =3D registered_fb[con2fb_map[vc->vc_num]];
>> -	cap =3D info->flags;
>>
>>  	if (logo_shown < 0 && console_loglevel <=3D CONSOLE_LOGLEVEL_QUIET)
>>  		logo_shown =3D FBCON_LOGO_DONTSHOW;
>> @@ -1137,8 +1136,8 @@ static void fbcon_init(struct vc_data *vc, int in=
it)
>>  	ops->graphics =3D 0;
>>
>>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>> -	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
>> -	    !(cap & FBINFO_HWACCEL_DISABLED))
>> +	if ((info->flags & FBINFO_HWACCEL_COPYAREA) &&
>> +	    !(info->flags & FBINFO_HWACCEL_DISABLED))
>>  		p->scrollmode =3D SCROLL_MOVE;
>>  	else /* default to something safe */
>>  		p->scrollmode =3D SCROLL_REDRAW;
>

