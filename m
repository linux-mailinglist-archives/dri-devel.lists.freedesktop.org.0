Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F1978F9E9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 10:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D7610E746;
	Fri,  1 Sep 2023 08:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EB910E746
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1693556526; x=1694161326; i=deller@gmx.de;
 bh=MwQErYC2WyUnqBkZ1OHIzcRkFv5RC+6+03ppvFQMhrk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fTK56NUD7/nlYlhuGfkQIZVcV+rk8+mKAsIFZycbieI9mcTggQA4VfdacY3a9u8EFAOBpvH
 hmZcSm5Tj/WFVhaoL98r4l0FXk5n+zYPw6AtvrcJjRdu5YBLm4iB62eAr/FfCTKhC/B07lDpx
 bVkeNJmRNxnadgQWwUYs7BoQA0NzBmhgQN6IWt+EJ8hI71y7wSt3+M34dUabzFeoei/fgIPep
 L68M/PJJgsTwiP2bT8CzWL9cNIU3M4lmDuMw+4CihV10gBi69jVV5iz72ABltWAnDN4lMH47h
 /uBTAvCbTYwMHtv/OoqZYIN9ujctUV9wEwlgGNU2V7Sx1zhNPw6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.187]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEFvj-1qU2mp25H3-00ACnX; Fri, 01
 Sep 2023 10:22:06 +0200
Message-ID: <bf8e8402-2def-a365-18be-3b426cb1830a@gmx.de>
Date: Fri, 1 Sep 2023 10:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/7] fbdev/core: Build fb_logo iff CONFIG_LOGO has been
 selected
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 javierm@redhat.com, sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-6-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230829142109.4521-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vuU05QJT6IlWwo4Mi3+L1LzYABiF5ykbqlHFcYulGYtDh4+YQmD
 NiJ41y51505V3tq6TsqpIMJVUdUzMflX32opvKoFSKfSb4llLjqi5VlheVhZXDOnaZJeIuG
 U4DvyPxX6F9/UNCrvUSFj8J2ym+i/ODRz8+YUQj6lXqjeSxtfvYjPDyHzfeaKayJUVpUFX/
 Y8wuqXjBOk5P/8g0tAxHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LnujzmPgv/8=;1ax9GF5eQQESMwk4R/s5sXECxOf
 ZYexDqZJ8RXgI6/CyF4ZLCXxn/QhXzVQhEy4EbnnSR3Bdoj2LIluW140fn0Uh3oQXAYrwukQP
 JvMX38J0+oBkK0P3mJo7hag3tp/SphTkN3rzdnW7Mf1N5VEGTrfceXMWbJVAHou9H0FrovZVL
 8SngG9wzpZXJSuP/Y4kGPFyZhI5MHJOmuzcSnMYgOp7C02WBFW7p2oRxu08Ntwpj2Xpp6+mbW
 ejI7cDZqpHhcou7ydwj00YRP2miOLDwY0BpbCAzCrWM/OWjtkOAnlb0flWgyfYzOQP/dqfkeb
 eXz52q1JA2WQyLnFZ+0p5C8ySH7PMOPAGtkh51kJGctxthzkOuaAvWh8RP1WMMXVunbahcH8X
 gB9GAD374qWiGGp14DZeejQoOf/mGul0McEHjS31csm2lXfLeQdYfTog13xa/rTBsENLtdu46
 54qJeLhhUpZdgJZk5IF9v1cxbY+/ZVywXf4NqlXkUgH307aXcPsXakL2Eibe0EQFUYaSrdvT/
 4dR7xcEerfQ4T6qAPtAPNedfD3Fk3LgBQFOJtbW58x44dNyScMMvuunax0v6ksE7MtKvgD4gS
 FUnslvc8NeX3KBP0MasMtD/lPi23JTh7sYhy56lLs7lXoBG1G6GAHbQYTVfufBDYi7oG7A0hv
 EYwmzkJ45Hpa2eIXy/HO2NuHSrHk+D1YyHr17CU6Xgv4xYe3qHVUQ/su9cS2vJNKZjk2oUaGW
 KK74WwvNJyra98VQoMdCGJEspdXtHO9BUinHBK1GbEkyAMiEIQON7NaylFLyVBka2laf93+AY
 J72Sr4pq/c5+I/EGMH+f1dK7s5nM8o5iQyVcLkGBmwUrH49HOemOeFLLHKNgHqJtGnl/Sqs+P
 fh+0W2JbOa68g45aAqPa/NIySdkFjFmb+041DaeN+fRoBsBje4ph8RrudXVA/u9TP+zKqOsTI
 fLnItZXdGrlgY6RUCx0WQ6jsZvA=
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/29/23 16:15, Thomas Zimmermann wrote:
> Only build fb_logo.c if CONFIG_LOGO has been selected. Otherwise
> provide empty implementations of the contained interfaces and avoid
> using the exported variables.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
...
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index f157a5a1dffc..24b038510a71 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -474,15 +474,19 @@ static int __init fb_console_setup(char *this_opt)
>
>   		if (!strncmp(options, "logo-pos:", 9)) {
>   			options +=3D 9;
> +#ifdef CONFIG_LOGO
>   			if (!strcmp(options, "center"))
>   				fb_center_logo =3D true;
> +#endif

IMHO, *sometimes* it makes sense to not use #ifdef and code it instead lik=
e this:
   			if (IS_ENABLED(CONFIG_LOGO) &&
			    !strcmp(options, "center"))
...
That way the compiler will optimize that code away as well, but in
addition it will compile-check that you have correct coding independend
if CONFIG_LOGO is set or not.

>   			continue;
>   		}
>
>   		if (!strncmp(options, "logo-count:", 11)) {
>   			options +=3D 11;
> +#ifdef CONFIG_LOGO
>   			if (*options)
>   				fb_logo_count =3D simple_strtol(options, &options, 0);
> +#endif

same here.

Helge
