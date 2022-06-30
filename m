Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0855612BE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 08:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30B910FD17;
	Thu, 30 Jun 2022 06:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7052F10FD34
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 06:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656571934;
 bh=ZU0HKrj/U8Ky903QI1buKExZhrj7mMmS2iFC6fGomSA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BPRpkDGLZ8JerUWKg3YxeyOz1mG3U3AJFEKMR1oVNymBxcF5WPPggtAgI2W+v18v4
 7iPmwMo4DjgJtwVKPRxMdHVtEfPBkCkvdTcfbYzHaUUkz0VPL0Fu6h5cMzQJdaap5N
 FfaVUzip5JFnTAJOKmME+SKDLMy22Jem9PjZA/qU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.11]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTABZ-1oCXsv2XjL-00UXU7; Thu, 30
 Jun 2022 08:52:14 +0200
Message-ID: <9eeb98b1-b53b-f90a-7610-5d40509d8204@gmx.de>
Date: Thu, 30 Jun 2022 08:51:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] fbdev: fbmem: Fix logo center image dx issue
Content-Language: en-US
To: Guiling Deng <greens9@163.com>, daniel@ffwll.ch
References: <20220628163641.4167-1-greens9@163.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220628163641.4167-1-greens9@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:StuGJg+gOrxZU2TSBaJ8FvbtcixzBEVjwjRW/XpF+r7xjRTqsbA
 L1foNai+z+dE3b12FpLtKY8bsEAjKmLkj0YHIk9W0if8S/kByI417rYFOfuNCk/SJSeTl18
 Mu28R8moWuoohDBYds+JRUtU0dSaJDo7XN76BXyZnxMZOFhIQ8mb8f1ky18H3V3kE7g6QNR
 ZRJGSA7N3Ab8VjJSu3jyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nvcOhbkODdE=:Ai4lNZWMkIN1tgmRB6ou01
 9xmzZAukr7+lp4SM/jpnY7hyqhQeEe1FY9n23rjdzidoURTHkTwUnfdL7OHjH4fo0/UvL5Co2
 Fec5WoV5TGariKDl1aALOMzaX1FKwS+ES/szQMfQ0hsFdI6cvXJPelT9OBx1DAh+0GbgH9V8H
 57UgAEF4pShZjyVEGFIQ4xD4hebXJkGj4Tk+m3ZBdQzB6YWY70fqmhphTrNfVDh3RVyx8fSIm
 CZd63lJariinn290Abmv3/t1L79ng1FBjgDOnQKJQsZFR3lW2+NjH+DCLg565Cq6L8lpiT5lv
 w+QwERLA8BBnj4wGp3LOrrvqaZ50oMxTqcDTcvOBf6c1waoab1qWE4vg9suPFjwVr1kfVjvVy
 lAxZaCyPFdNK9S5yrNgOrih4/J5Fa7Xck7MicPrsVO++HzQdwMcs3p72FRMWDSR+qLJIM8WcL
 CzgwIuZvmKFFIzJGZyHBfs+rDM3+GG5Syv5+8pjM+dKzAsHTRgFHZnWchHhCAFUp6LwUXu7Gy
 HrEh9O7FdPFMj6Da1z1rPkYqVgyqw8tLlBwBAMyUPMCO0dx72bArxhebskznasKxt8R81ya/z
 CWzvyE5g4WxUPGyQrjkYlRHhxBbq28xmHTo80QDBwtRgWzgPds7xySISk9NdBmwS1ZK7N256b
 NVjVIvIz+iShIAHpUGajBkwqHf02OVno0jGo/hulWwsdcFDQTGsBBTVQ7ypimF8wklEW0wx/0
 7R72NZ8wm/3SQr9Z5NuU42v25YQ2K2BvttjllRn7puIp9hZhspJVKQ9IzmpHBBRdZWeBH0QfB
 GrFCIaDCpAXzStJd2GFAIlCefeQPFhozC4CLtlvHzvJlq2Oc27472T23ipdj4cK1JZoGrzYwt
 9fCwO7m0WrIivUnDoPQhikRyFq9z7AzKv1rj6XOYFq3AbNgGUwaNCKiorGsy3TWwpILDjH9sV
 KUVLLwTSaM1376tAz6NwgyYrjBspBmj/2QLPT3oMcZ/EzOplQqr6oXtAd0dam4EzIOhiMaGEB
 0Ms541SzJw41/DAph/7j9/Vy+79O6HGCEdLTrI3t0Ytqbkldm/Skj4B6arn4g0vcdrB9uDvFw
 FW86Hv1VrLEq/5dJzQUGTFGRtrMboCRsWEk2VE479ILHkoMPDYHToRhlQ==
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

On 6/28/22 18:36, Guiling Deng wrote:
> Image.dx gets wrong value because of missing '()'.
>
> If xres =3D=3D logo->width and n =3D=3D 1, image.dx =3D -16.
>
> Signed-off-by: Guiling Deng <greens9@163.com>

Nice catch!

applied to the fbdev tree.

Thanks,
Helge

> ---
>  drivers/video/fbdev/core/fbmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core=
/fbmem.c
> index c4a18322dee9..1fd2bdb11266 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -511,7 +511,7 @@ static int fb_show_logo_line(struct fb_info *info, i=
nt rotate,
>
>  		while (n && (n * (logo->width + 8) - 8 > xres))
>  			--n;
> -		image.dx =3D (xres - n * (logo->width + 8) - 8) / 2;
> +		image.dx =3D (xres - (n * (logo->width + 8) - 8)) / 2;
>  		image.dy =3D y ?: (yres - logo->height) / 2;
>  	} else {
>  		image.dx =3D 0;

