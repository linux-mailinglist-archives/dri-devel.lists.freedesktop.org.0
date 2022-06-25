Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E255AB27
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 16:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3869112B56;
	Sat, 25 Jun 2022 14:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EAF14A109
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 14:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656168831;
 bh=b4k0XtQmuFF59sBaM5aELz4JInhW63FI7rs7eO3bvkI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KcRFsN0Z1R3wk6yoROanYibPMX5Vj1IjBbSlLqgZ1V7L0FdcCVTI/jYH8JPh6aAi4
 xhN7ZIFH0C30lmRAy0JwDy7fIOBjMyAdzGvzReHMyWgczqQDEnmZa1Mqjylgb2W62K
 RdDyYx90QPqx0luvHPlgwdF8ABG6FhrBmLlBjmNs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.162.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7K3i-1o1qRG3ZRU-007p6M; Sat, 25
 Jun 2022 16:53:50 +0200
Message-ID: <feee43e4-fad3-b8c8-852b-ab85804416b6@gmx.de>
Date: Sat, 25 Jun 2022 16:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/4] fbcon: Disallow setting font bigger than screen
 size
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-2-deller@gmx.de> <YrcDgjpgeqSZtSOE@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YrcDgjpgeqSZtSOE@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kXK30m6X4uN5E7tsq3IqOhuZ+3B45QWD8MggGhUzN/f0jxp1QXM
 3dgavUNZ8/FUq5PqB3YZmWzRkVy/n9Nv/38Oy2yxrKAPPX50glWC+xbrBqJbH4qJTTFPI0O
 KO0XTEWS1AzSUXqF4s75ORM1GSE7lPxE8kfICVvsNoJapTarchb9fGLff2hi+mRtdu76dyT
 fiJY+Jy/HPuMoR1kxQN+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eAwfn9QW44o=:vDKj1RoX3cSNixZRbeImQ7
 HB8S8P36ZiAe4E4HblAcsgn7VmMN2KXs2DUvYsXOztuyRNf36yqmCw73lp7OUZR7IUkE2cfAQ
 gyyMFi+6VoWvzCJpTZcCBHwCuDnkt+uMJysaHtDMdvTBHB4q6z0c2HWgSCgp1BTYA0xZnNrPz
 7m/3IhVZU0j35POM2qLR6ESIgh/NJycg1LaIZdamOz/lXXEvShoCmJMOGFTHx+Htj9V+h6tt/
 3B3RsZlOhqQ1eduvNWFVg+Pqe4fJPhelnHUeyyTCIt0KzqljhPnAsPRhN1FQwVhJ6ERHCfmMa
 Vi39glwodxPrpET5DYO76Pe4e0yp65p6Ip3SHMPRnwlVRvYGe9xXqYL5TW428K/ykR3lSBWIA
 lvvHXcpJXZvev5cfVn+QoLBIkQp+gJNnDP9Wx0D73DvMsCc1rwkAlVs17aSGRtAVsgAMcIrzA
 yr4fdNfF4qhXA0csu0W6GofLETBJjUbPGILHs1iy0XX+4to3a15Z3JucGbzzGye5K2aDCRSt+
 TltrYY1cfxIiuS/Y/9ab8eguF8CxcjXiVOMhC9fmDXY/t7H5DPCQ5Xup7JJdaQQXMwMIeabTD
 U//0S2w2KBDVWN5O29vQXXREcI+R+L8EWwqjUEs7+wCqyPUXb8Y4yE2NMy3oiinKQsmfFCBX5
 tATYHC7NFpu2HdhMMeSSWKdiKmqBDG7dDi+pXpeCIDxy8rcRdMgMUmnvc1Jvn7q2bXrd/lyhS
 vn8MsU/bcsQpDfvMeBCh45GCH0ydo1Eq4SKixQT9/QXrJ0N6rMU7Qe98uDNMhdY4a62Jau7ym
 rqMHPxb/uFrZP/wF77bFjIviZ9zlAy9hyn8UXLqTcajps40aTVy4TK0iImr2HfzIr8CVDGCnJ
 0g0o4WBnay/+TAp0TxDUrzXBeuxA1FR1h5zCYZxduIDLCMkXTlts1CEU7Du1nv+1eXwJzH9Yz
 F5EY+XOQzoZ+rbStaNJF/HEdTSfwYcVI+JVuGE2NiFMoNN0rIxEk73U3zuLUvDM8LQgsfEwhx
 r4/yRf3DE2pYMFUhVKL1yKwFtfXMSl8jhW2riT+v+5tP6j3Ik1muB+1Mlu7WjXURIdAu9ZRuR
 9VS1pfFK6g2KmsUbc1j/dTzqhenSe2CLYBmDvPM6qsBbb3N/L4zJuxgsA==
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/25/22 14:45, Daniel Vetter wrote:
> On Sat, Jun 25, 2022 at 02:24:59PM +0200, Helge Deller wrote:
>> Prevent that users set a font size which is bigger than the physical sc=
reen.
>> It's unlikely this may happen (because screens are usually much larger =
than the
>> fonts and each font char is limited to 32x32 pixels), but it may happen=
 on
>> smaller screens/LCD displays.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v4.14+
>> ---
>>  drivers/video/fbdev/core/fbcon.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
>> index c4e91715ef00..e162d5e753e5 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -2469,6 +2469,11 @@ static int fbcon_set_font(struct vc_data *vc, st=
ruct console_font *font,
>>  	if (charcount !=3D 256 && charcount !=3D 512)
>>  		return -EINVAL;
>>
>> +	/* font bigger than screen resolution ? */
>> +	if (font->width  > FBCON_SWAP(info->var.rotate, info->var.xres, info-=
>var.yres) ||
>> +	    font->height > FBCON_SWAP(info->var.rotate, info->var.yres, info-=
>var.xres))
>> +		return -EINVAL;
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks!

> Maybe as a safety follow up patch, we have a few copies of the below:
>
> 	cols =3D FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
> 	rows =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> 	cols /=3D vc->vc_font.width;
> 	rows /=3D vc->vc_font.height;
>
> Might be good to extract that into a helper and also add
>
> 	WARN_ON(!cols);
> 	WARN_ON(!rows);

That's not needed then.
The checks I added above will ensure that cols and rows are both greater t=
han 0.

> to make sure we really didn't screw this up and give syzkaller et all an
> easier time finding bugs - it doesn't need to discover the full exploit,
> only needs to get to this here.
>
> Also maybe even check that cols/rows is within reasons, like smaller tha=
n
> BIT(24) or so (so that we have a bunch of headroom for overflows).

Not needed either.
cols and rows is the screen size divided by an value between 1-32 (the max
font size). So, since screen size is already the higest limit, cols&rows
will always be smaller than screen size (and > 0).

Helge
