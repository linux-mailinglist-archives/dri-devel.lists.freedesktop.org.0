Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B6775A61F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 08:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508B610E55B;
	Thu, 20 Jul 2023 06:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDE610E55C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1689833774; x=1690438574; i=deller@gmx.de;
 bh=Kjw2irROZgblodT7GrAJHMiu+Athn4WIlCQc+MmBJFk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Khj07uLafxC6/VVXXkBDAjAu7oB2EGZcI3RZB5LLkQ1wruAOXcLmV2/e+D4BSxfOFTIHc2Q
 +j+2DZOExBgmFygHcj+X1Bx/hLP2JH8wpr+UMh0rN6yWZBDtKFhtSFC5GkK95xC1v1oUmB4yN
 1/JQhBFPKq1E+ukuWhZMtjPrBIkeHfX2y9EIe6sLPzKduhJ5c1y0+hbleJhh30vYPX7cIFekx
 O4D8yjCBUchNyS+A0gMCANQeDW1NfDYTYxgQm8BJamxlLCSK6eRTraa/JIQYt7UvW7HT1vPHp
 HOFQSLdWY7He6YBL8uLFWtdvjR6KBT38uiE1lMZZTjvGQoXOzr3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.9]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9MpY-1psUGY0o0i-015MvO; Thu, 20
 Jul 2023 08:16:14 +0200
Message-ID: <1d045caf-2d83-047d-654b-03609dd91226@gmx.de>
Date: Thu, 20 Jul 2023 08:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/7] vgacon: switch vgacon_scrolldelta() and
 vgacon_restore_screen()
Content-Language: en-US
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
References: <20230712085942.5064-1-jirislaby@kernel.org>
 <20230712085942.5064-2-jirislaby@kernel.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230712085942.5064-2-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/YaYnmNmwmNBiWSeAkIditEiEjLVWWmnI18FP3ynD9r/fckEMQI
 4b/nP4E1xU52qYKfV8mXxZucwJGyJ1CO0/TqG59roNw7gJmnzD/+lxXMeJQQISqccF8u3Mo
 Egq3e3eUY4/E8WhLyXOa58UDopMmHgsHgYy1ZRhuRx02tkB2eNUUqe0VkWgw0Cp8xEz1f/7
 uQwASgZY4DUa4br5GrfIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:veCzuI3kDCg=;fnRmKSxZXEjl/taCOx7paUHzly4
 6XIDPwcabiiLuhF8P9PH0QhJ2joy9vduzgs2TBQiObO6tMDmEpeyxoMK+3D0xNJisj9uzOPKy
 nIpe0/ks4u5epwpY/INb08DS3by66ee73PqhUdzjtlX5giddyP8YE8AfvhcCTzGj8N2nwsLm0
 Q34prT4RT9+z0tIVHsR32na/yCLqeFtIqXs4eO5/DBpCz21+FSOxjBlFssyVkTHcPRgKwXYPO
 bd1YBu9PQL9oTrlUUVejFwtNv6TAIt+joOo9ANKe7wsfoq7CHHCu39Qna5whFwStbjCCwj2Ow
 bKh33Vs/e/Va+/hBq8jN31WV7YhCu9vPWnaMdRp9xDTfvdyjwRRBvxkrnEHTlBzhkqOHn2N5A
 41Lm2fM0DbqgFBoeygWj7X2fPzmtNkYzRQuwNbl0q0lbQsYnVgd0GCM6vz8jFcr5egJ9TD0pV
 d36IDEvKmbDcxauweuklHaoZeTPWkYBBpaY2rSpwXPAjFUEg/JZhPDhyY4Hzq1Gxh+g6zpYq9
 BaXIdm1yhhEz/vcr+DAipEITQB6J5NPlpKJtWIAHhnKbr0FonuqZ8P05BsYZYTIQ1j+v8aho9
 cULpRquSsxNDzjbtWvTv7qr9El2WO1qyiFAfrxOSXz5I2aWY9HPgNZJVKRYSpIcNPjxPTagXl
 ZdPwWX5cOwJDBMVEkdsSvBZPSVHhy7MTJpCk3HyoQzTsVkZTBiqUrQR5J6hlOb+yBDViILNvt
 YvgcU3kMNL1wyZIaRpjbKu+cKrOjVJuFUxeJIsssT1SifMuhrCCBAVh0A3ww+pVf5w3wN+iQd
 KkN9/K4qyJZq8Mqfhl+Iol92FIb5qJRdAG2DQu0Mse7eaPKybkMLsXK6YbzOYHcUAIOmzMFMQ
 SREHPu5bhH181wkGmmLEIP/6ZBSdKB4MBgix/EwCT5eAvoT4VfIYulomX40JHvAgKFPiYNx+3
 XHk2ZA==
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/23 10:59, Jiri Slaby (SUSE) wrote:
> Switch vgacon_scrolldelta() and vgacon_restore_screen() positions, so
> that the former is not needed to be forward-declared.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

Thanks Jiri !
I've applied this series to the fbdev git tree.

Helge

> ---
>   drivers/video/console/vgacon.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgac=
on.c
> index e25ba523892e..fbed2862c317 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -142,12 +142,6 @@ static inline void vga_set_mem_top(struct vc_data *=
c)
>   	write_vga(12, (c->vc_visible_origin - vga_vram_base) / 2);
>   }
>
> -static void vgacon_restore_screen(struct vc_data *c)
> -{
> -	if (c->vc_origin !=3D c->vc_visible_origin)
> -		vgacon_scrolldelta(c, 0);
> -}
> -
>   static void vgacon_scrolldelta(struct vc_data *c, int lines)
>   {
>   	vc_scrolldelta_helper(c, lines, vga_rolled_over, (void *)vga_vram_bas=
e,
> @@ -155,6 +149,12 @@ static void vgacon_scrolldelta(struct vc_data *c, i=
nt lines)
>   	vga_set_mem_top(c);
>   }
>
> +static void vgacon_restore_screen(struct vc_data *c)
> +{
> +	if (c->vc_origin !=3D c->vc_visible_origin)
> +		vgacon_scrolldelta(c, 0);
> +}
> +
>   static const char *vgacon_startup(void)
>   {
>   	const char *display_desc =3D NULL;

