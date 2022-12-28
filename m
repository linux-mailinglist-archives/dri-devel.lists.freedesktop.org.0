Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4AF6573CD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 09:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBEC10E37B;
	Wed, 28 Dec 2022 08:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Wed, 28 Dec 2022 08:03:44 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2371510E37B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1672214622; bh=cXJ87oJBwBaxFCFIb6cYyvIrq6iLUXOa4/DOQ+Am96A=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=h7AFZyr5qgXodQP1mK4olYnqRsmrN8bycN2egdIVipwM0DEduvVe7IC9IvTA5K2nF
 ucRMD2gkjsxtVhLhLFJQlk+hpJzaMTYUTOH9SdkS6pF1mdqZ2mjNuNPNJMkVE2VXYs
 0OoUiJ4uS35At3gZFFYHG4qa/TTnBM68HB4PXwOj2z87ry+wa2GUIk5/bfStJYzRCH
 UxHvqn7ccFXIS05XT+wodkeu8IjcY3/zXsWHkoVwfK4GkgbDurXI7ZCsQ/+ubW8YzA
 gP6u/B8ycWAfcTv3Bb4djn0vI5E26iKcBgkvMJhSROp7ve5eLQ85q5AcI5419UVjJe
 gPawQW+9mEGjw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.184.137]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2Dx8-1oi9c41F78-013b6v; Wed, 28
 Dec 2022 08:58:10 +0100
Message-ID: <ffcf3922-1ff9-ed2b-619b-d411a8eb70fc@gmx.de>
Date: Wed, 28 Dec 2022 08:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH linux-next] fbdev: use strscpy() to instead of strncpy()
Content-Language: en-US
To: yang.yang29@zte.com.cn
References: <202212280944112670081@zte.com.cn>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <202212280944112670081@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AAhu+1ssDZWoHC1JNYuG/2KCh1p3zsD72YAqTRmf05EsUPmyzrO
 QHsOOUBkSPhImYBWLCA4t1tg3wqvfaSlkTA/8WblTxjmF1CvOGiNqHRiEm8ChyQY/S9m7lv
 6njdih102P3MBEJaajcYb4iArArBV2eZ7XDl9cxSu02R8aoC0Pwxxn1xFB72dnrGrVzAIIt
 gzTblnWClmCUunfgBq7lA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ILU7Z7ejFFs=;FJKoln3lSfTSRTKnPEdkOgdU57o
 q4MdUz10DMnxNTKfIyUOwU1oqLA8DRQ2lZm2Z0ElGJWK5SydQBl+7JrpV2A4VtQTZWghrvgIQ
 viki1cwZ5wBL6rpkDmLWu1tJadwEWPQAoM4NkK2vLp9qfhz9JeHgRySg3FZeJtcQ3mL4QEckQ
 0q2SqmxRU62DYN3Ta01IGylEusSPgZQLT0Uy9a6U2OXdG08VJG0FZ2a57pYzS2+H7apFNFS/e
 G+9XvGiyow68Dxrha4t/yv00uXL+2cejb6NTOtRyF7TUcFMug/fmaBk69K/MXQlVr1/dV5GHS
 i0on6FUNOVI+FKTJizGGFLVXgP93jcohbjg2NMbNk14Jn6k9iOTwXSR4AYzX+0odKBuKJY/8D
 0BAKy6TAhVXXqoom76UFz77cTHneq+GdYcMZ91W9Eod9ubaK0PUoytcI2ahojNhT9CdPNuxol
 eB/BkvMBiaZdIAR6s81iRc0mRZglBhPy7fIBOagAmxwyBqRH8Ks5Xl70OCtLZDx+K17oFjKnG
 oit0NxOm/NYBsfYthM3jwl0tZXTdXsAMCOqtblbk7v5rDcgbIbZidW9v02Fx21vg6EMpFYnUT
 EAfq7eDhuosVyvARC9cfIpM9tPouVD3hYJffKHoUCwU66/A9FFGXLgj2snDWk7RSuMwwrIrxl
 F+sHKcoBSmpcT2t+OLaLyblVzV9jaizbrsebbm4WzEz9HxIXKDJULPFps7db15nViHobrePgm
 J/oEBoO/WP5EKvM3RDQUscHzRi7IJzmWzjzdG4WvAI5IND2q1UdFaXi8PuZkHzpK8ZCvyXY+l
 ehfE6BMsM0u05XICvvqIzvoAmeck1/EdemfgGwxVXmNlwuB44t4hLBKygu2orrdiHjiwXpfKg
 P0nUX/XtGenrUfE0VvgXLwT4HW1nD1y08f9ihrc0XYjwMI1/j5c5OvU6wYWHUXMasp4xdlIrP
 2x2cf1jhlfWsnnOj2LKllMTsVqE=
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
Cc: linux-fbdev@vger.kernel.org, xu.panda@zte.com.cn, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, christophe.leroy@csgroup.eu,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/28/22 02:44, yang.yang29@zte.com.cn wrote:
> From: Xu Panda <xu.panda@zte.com.cn>
>
> The implementation of strscpy() is more robust and safer.
> That's now the recommended way to copy NUL-terminated strings.
>
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> Signed-off-by: Yang Yang <yang.yang29@zte.com>
> ---
>   drivers/video/fbdev/aty/atyfb_base.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

applied.
Thanks!
Helge


>
> diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/=
aty/atyfb_base.c
> index 0ccf5d401ecb..851c1236fddb 100644
> --- a/drivers/video/fbdev/aty/atyfb_base.c
> +++ b/drivers/video/fbdev/aty/atyfb_base.c
> @@ -3192,8 +3192,7 @@ static void aty_init_lcd(struct atyfb_par *par, u3=
2 bios_base)
>   		 * which we print to the screen.
>   		 */
>   		id =3D *(u8 *)par->lcd_table;
> -		strncpy(model, (char *)par->lcd_table+1, 24);
> -		model[23] =3D 0;
> +		strscpy(model, (char *)par->lcd_table+1, 24);
>
>   		width =3D par->lcd_width =3D *(u16 *)(par->lcd_table+25);
>   		height =3D par->lcd_height =3D *(u16 *)(par->lcd_table+27);

