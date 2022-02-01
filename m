Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF4E4A5EE8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CC110E684;
	Tue,  1 Feb 2022 15:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401FB10E680
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643727768;
 bh=nvs4NamF8w3PSAtLVFdwadPiUvfzFg613upYNZ/yXSg=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=Ig2IPZ5zKlouxpflVVmYYGrUePr/LI8+qLrp7aZA4uucD+2hXbYwRZLq855afcj7/
 1C1nsPz7s9e8i+8N7F1wnisBRN0mfKm2sAbMpx8DRuRWuiFg04oBnMytrkdwEQpEIQ
 DQTyXsVmllotv/hXvaZbbuOUiJ+3eYZuhKq4mj3U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQXN-1mP0sn1g4j-00sNis; Tue, 01
 Feb 2022 16:02:48 +0100
Message-ID: <b1c1f68d-4620-2429-66bd-33d806d31457@gmx.de>
Date: Tue, 1 Feb 2022 16:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Yizhuo Zhai <yzhai003@ucr.edu>
References: <20220131065719.1552958-1-yzhai003@ucr.edu>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: fbmem: Fix the implicit type casting
In-Reply-To: <20220131065719.1552958-1-yzhai003@ucr.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8rcnp3IDWKRjEYPQV485Zi+kFbcxjfN0d1QI0X2MU7OVul75bod
 eQuXX8jdrKjMIB2fbFNnodmCyPeknr4i/kfQBcukaVrSA3NwBE0B1kXD4gZR7qZqfK6SHW+
 P5Z3tyGBWi0S9W4OBNjklGZGQ+uS0XMCezCx8oxze65ATS7BFRkOph2vBGq3QOogmBUJFqh
 HohuYWpL/6NFwDvUyuDtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Rn0yXCvoSI=:wCSp2dm5E03DqfVW0te626
 y3QbpDpBUuTKWhC/2BhKHIV114JvdTj7FO7RgQjiIh0KVHFyDX7evBCCP7F7QZ1ym7TRzJ9Zd
 n0RjjMB5hei2NBwh1vXhjC7GF+gyG1PwKcEiNrYRjEgeDHRQ3HYYmyJK03F0F6HzWx7tmBnyL
 B6cNR7yC4WT0uB/OkuthjxwrEOL2HALsrdV74B6i4dvAfRLdet1ddKocbBqLpW0o6LQG1k3AD
 SQyeaSEztHEG2F9zKvC0uEaJjKPaiSTZuMyXeXiOIOW9jDiLM56Q2vKR0WnnRDH659abnY4o9
 nE+nlgTcCp78zrEd8D3r+tG1yBMKLhid/cVKvlQM4s+xZ9PIbZX0yAxyj6HVQYyGKtCaOmpu0
 Np4Jw35NnT7pfFo7vih+wmRc+D6K7Q2O0DxWgT60fwt1ia7v40fq40xZJXAO6XyWHPyCw9v2g
 Zb4rs/ro/DKlt4r/+Zk0470cy5Hj+wiuAXftlxMUp3E4naFS8ah1YPILH7JfRn3XI5/QXz3hn
 Uo6mWMn///bBb6RBSCUawnYKSuFTvUqztCr8NUuW0+vt0kO7OM/L9HpoGijp5Q14kpISNLVbr
 4F8o9A5rGgdNMHHiLwZmxst6Ir+m9e7X6xyjdEUcbhe7fma3wWzba54WQwIbRk33qAHWeFFyK
 h++uWp0yaOiYo05cMbaoIUdpcKB41YSD5638kF6NQtSuYHu9wGHHRnsI36i1JzJ17XZ9tLDaJ
 wnxL2qRxBLK5bLLioFBPKq0l17iOm+T47NgBa9+RGUmRM6a6iUf+OoTcMRATCSnMkG1F2Swi6
 Qj9e+XDFcZi1I1Iew5pDjzvtJxsdKTIdUArCPaUpEJ3i8vIhRLoEU3YQDKVxPIbdzndhvxM95
 nQ/6MMGob1zcMXn7AOZ4Cfj5u5zbl6h0IIYogZeAs73GQeVem2p1FdITwZYy4085v2MfB4pjl
 yvF1AdneaI+JZcr9OjM31zQrRW9vIB77/i+g4VHydbDZewVNxBqXlAmw6mac2FmS0IgQ65bxc
 Y4CO9SIvE/gKzU627zJIG1jMzE7BxSwIfLv4kDuxuQ6tR7KfNZSn+3EBl6f1LBos4J2aWdf4M
 /gNvQFfC3+A13s=
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/31/22 07:57, Yizhuo Zhai wrote:
> In function do_fb_ioctl(), the "arg" is the type of unsigned long,

yes, because it comes from the ioctl framework...

> and in "case FBIOBLANK:" this argument is casted into an int before
> passig to fb_blank().

which makes sense IMHO.

> In fb_blank(), the comparision if (blank > FB_BLANK_POWERDOWN) would
> be bypass if the original "arg" is a large number, which is possible
> because it comes from the user input.

The main problem I see with your patch is that you change the behaviour.
Let's assume someone passes in -1UL.
With your patch applied, this means the -1 (which is e.g. 0xffffffff on 32=
bit)
is converted to a positive integer and will be capped to FB_BLANK_POWERDOW=
N.
Since most blank functions just check and react on specific values, you ch=
anged
the behaviour that the screen now gets blanked at -1, while it wasn't befo=
re.

One could now argue, that it's undefined behaviour if people
pass in wrong values, but anyway, it's different now.

So, your patch isn't wrong. I'm just not sure if this is what we want...

Helge


> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> ---
>  drivers/video/fbdev/core/fbmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core=
/fbmem.c
> index 0fa7ede94fa6..a5f71c191122 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1064,7 +1064,7 @@ fb_set_var(struct fb_info *info, struct fb_var_scr=
eeninfo *var)
>  EXPORT_SYMBOL(fb_set_var);
>
>  int
> -fb_blank(struct fb_info *info, int blank)
> +fb_blank(struct fb_info *info, unsigned long blank)
>  {
