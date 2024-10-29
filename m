Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EFC9B5002
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 18:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5027410E396;
	Tue, 29 Oct 2024 17:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metux.net header.i=lkml@metux.net header.b="UX21EhKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 771 seconds by postgrey-1.36 at gabe;
 Tue, 29 Oct 2024 16:32:36 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7181F10E695
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=metux.net;
 s=s1-ionos; t=1730219554; x=1730824354; i=lkml@metux.net;
 bh=dgq2LSCjWwa2JKfRW5tqrxxYYTLx80O6ih4fABENKJ0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=UX21EhKAGckRbR1nK53abZ9yrhIdizoN2nxtRlZ78oVKQi0TwrjJyfpi9JI3MAgt
 /opkthUJuz3AfQO7E2VtxWEhi39TEbWpvqvq3ruwKoab9FOM38ASGEhNwW9M47Gb2
 ZgwOGkdqdd5UKlf2WH1sD/UEKwa7e1V2xnz0bqPSDMwur+qmys8oU4wa23frdDbrY
 MMifpGVXsGfn0Z0MZfNWtuoJFTldnyWJxIFC06dl2WGU3TsUo/jNgSaFj/J4yE+Nh
 qztoqOTSiB77K6ndWdCxyd/Sw5vSikI34vJCaYDp6GM8F1/x4tRgF+KQun2SCyNL/
 5873R/6om/ScTZ11Hg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.1.178] ([95.114.51.66]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MBV6n-1t0cgT2EKl-00HWmk; Tue, 29 Oct 2024 17:19:42 +0100
Message-ID: <6e4ec17d-9bdb-42fa-8d3d-6b9789a6ffe1@metux.net>
Date: Tue, 29 Oct 2024 17:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Constify struct sbus_mmap_map
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <67883bfad5c2c395438bfcef7a319394caca4155.1728820047.git.christophe.jaillet@wanadoo.fr>
Content-Language: tl
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <67883bfad5c2c395438bfcef7a319394caca4155.1728820047.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nq2ZXW+vZZqdLi4j76Moq2678U+KDEhFgUpm959quoF7rwCfnwi
 LdMpeifRtRN5yFDlqYuQVldJBhYStJrfRb6jMLYi8+/mcE0YN7rKtuUx7CHRfNZnZ6ueb4K
 09b/Hj1WGvEst6hkq8WG459FpKFscw9TfXwqkS2NDxJ9oGfR7WhD4deZuBvTne7qQcLkNkT
 w/SPKJPjU7Txjblt97nSA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W2Ei8EXo0ps=;Z67CDWV9NrKyQMY1ECK4y74s7gk
 yV2qt45lqkYLx/qhhj538G7kKER+qVxQG/6QfdnBHublg1A6zshGLjldpf2LeiX5EnsrcarxR
 hdyn49UGCddF0cVlHzzXZfUAoJ9kfLFn49O0u62tTN/F6m97q4qVpnFeOsLKmMRByVWOr4UO3
 8wBQPysnOx444DYhiB976QiycGVSGe8rmDYpQSooTs3ZSjZenl+azVnQFhveBAvIwNH4CEwBH
 I3bp6FJ5fZ70xcbcGWCNgGOodh9OoR1tyTJRcs85clFqowN21vDpiHOCPkpONRG5GS62ftb09
 OrU2KoxaUqg7NDs6yWHfuyS+ftTf3275FFZxQR4BhMoBidgLewd8IRQJz+noygl24D50uZT4C
 C05ihl1lnq1hQxU/cGSK+DV7N7WpV9n2J+aNTBCYJPdugmZw7R1hqVcK5Xj1Nwv2b4ZWdPxhP
 HZKERkPbVqcaE+gKEScDYkrYAt2LI8GXJhABn/8qugIWzEJJtM+wylYdt2xAOpSkjYGhaExT/
 cTpqnoQsW/9MoR2cOAeCfwOJZ8r0s5sgutk/ECVk5HU6S9uYnVjhXBah5Y4qC5VvBQ5mkh11x
 E0c6ilDjLMpFPdKAvn8Tg8dnEve7COHYkDwYi9H7XGZnbqxYfzZ1HFXflO/11ppro6u8KooeS
 SZs2NNz9Nv9dDyNJp2TRA+7VHcSlS+20pKPYP2til6xrGbwoYfYgOhGPOeEuzzkngccnJHSq0
 3LTZ877l6pi94xMDUTJeAX8Paf1CHKg+g==
X-Mailman-Approved-At: Tue, 29 Oct 2024 17:03:24 +0000
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


On 13.10.24 13:48, Christophe JAILLET wrote:
> 'struct sbus_mmap_map' are not modified in these drivers.
>
> Constifying this structure moves some data to a read-only section, so
> increases overall security.
>
> Update sbusfb_mmap_helper() accordingly.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>     text	   data	    bss	    dec	    hex	filename
>     2452	    536	     16	   3004	    bbc	drivers/video/fbdev/bw2.o
>
> After:
> =3D=3D=3D=3D=3D
>     text	   data	    bss	    dec	    hex	filename
>     2500	    483	     16	   2999	    bb7	drivers/video/fbdev/bw2.o

Cool.

It's just a few bytes, but better than nothing :)


=2D-mtx


>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only with a cross compiler for sparc.
> ---
>   drivers/video/fbdev/bw2.c     | 2 +-
>   drivers/video/fbdev/cg14.c    | 2 +-
>   drivers/video/fbdev/cg3.c     | 2 +-
>   drivers/video/fbdev/cg6.c     | 2 +-
>   drivers/video/fbdev/ffb.c     | 2 +-
>   drivers/video/fbdev/leo.c     | 2 +-
>   drivers/video/fbdev/p9100.c   | 2 +-
>   drivers/video/fbdev/sbuslib.c | 2 +-
>   drivers/video/fbdev/sbuslib.h | 2 +-
>   drivers/video/fbdev/tcx.c     | 2 +-
>   10 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
> index 4a64940e0c00..e757462af0a6 100644
> --- a/drivers/video/fbdev/bw2.c
> +++ b/drivers/video/fbdev/bw2.c
> @@ -147,7 +147,7 @@ bw2_blank(int blank, struct fb_info *info)
>   	return 0;
>   }
>
> -static struct sbus_mmap_map bw2_mmap_map[] =3D {
> +static const struct sbus_mmap_map bw2_mmap_map[] =3D {
>   	{
>   		.size =3D SBUS_MMAP_FBSIZE(1)
>   	},
> diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
> index 430e1a7b352b..5389f8f07346 100644
> --- a/drivers/video/fbdev/cg14.c
> +++ b/drivers/video/fbdev/cg14.c
> @@ -360,7 +360,7 @@ static void cg14_init_fix(struct fb_info *info, int =
linebytes,
>   	info->fix.accel =3D FB_ACCEL_SUN_CG14;
>   }
>
> -static struct sbus_mmap_map __cg14_mmap_map[CG14_MMAP_ENTRIES] =3D {
> +static const struct sbus_mmap_map __cg14_mmap_map[CG14_MMAP_ENTRIES] =
=3D {
>   	{
>   		.voff	=3D CG14_REGS,
>   		.poff	=3D 0x80000000,
> diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
> index e4c53c6632ba..a58a483014e6 100644
> --- a/drivers/video/fbdev/cg3.c
> +++ b/drivers/video/fbdev/cg3.c
> @@ -209,7 +209,7 @@ static int cg3_blank(int blank, struct fb_info *info=
)
>   	return 0;
>   }
>
> -static struct sbus_mmap_map cg3_mmap_map[] =3D {
> +static const struct sbus_mmap_map cg3_mmap_map[] =3D {
>   	{
>   		.voff	=3D CG3_MMAP_OFFSET,
>   		.poff	=3D CG3_RAM_OFFSET,
> diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
> index 0b60df51e7bc..56d74468040a 100644
> --- a/drivers/video/fbdev/cg6.c
> +++ b/drivers/video/fbdev/cg6.c
> @@ -545,7 +545,7 @@ static int cg6_blank(int blank, struct fb_info *info=
)
>   	return 0;
>   }
>
> -static struct sbus_mmap_map cg6_mmap_map[] =3D {
> +static const struct sbus_mmap_map cg6_mmap_map[] =3D {
>   	{
>   		.voff	=3D CG6_FBC,
>   		.poff	=3D CG6_FBC_OFFSET,
> diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
> index 0b7e7b38c05a..34b6abff9493 100644
> --- a/drivers/video/fbdev/ffb.c
> +++ b/drivers/video/fbdev/ffb.c
> @@ -710,7 +710,7 @@ static int ffb_blank(int blank, struct fb_info *info=
)
>   	return 0;
>   }
>
> -static struct sbus_mmap_map ffb_mmap_map[] =3D {
> +static const struct sbus_mmap_map ffb_mmap_map[] =3D {
>   	{
>   		.voff	=3D FFB_SFB8R_VOFF,
>   		.poff	=3D FFB_SFB8R_POFF,
> diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
> index 271e2e8c6a84..b9fb059df2c7 100644
> --- a/drivers/video/fbdev/leo.c
> +++ b/drivers/video/fbdev/leo.c
> @@ -338,7 +338,7 @@ static int leo_blank(int blank, struct fb_info *info=
)
>   	return 0;
>   }
>
> -static struct sbus_mmap_map leo_mmap_map[] =3D {
> +static const struct sbus_mmap_map leo_mmap_map[] =3D {
>   	{
>   		.voff	=3D LEO_SS0_MAP,
>   		.poff	=3D LEO_OFF_SS0,
> diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
> index 124468f0e9ef..0bc0f78fe4b9 100644
> --- a/drivers/video/fbdev/p9100.c
> +++ b/drivers/video/fbdev/p9100.c
> @@ -206,7 +206,7 @@ p9100_blank(int blank, struct fb_info *info)
>   	return 0;
>   }
>
> -static struct sbus_mmap_map p9100_mmap_map[] =3D {
> +static const struct sbus_mmap_map p9100_mmap_map[] =3D {
>   	{ CG3_MMAP_OFFSET,	0,		SBUS_MMAP_FBSIZE(1) },
>   	{ 0,			0,		0		    }
>   };
> diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib=
.c
> index 634e3d159452..4c79654bda30 100644
> --- a/drivers/video/fbdev/sbuslib.c
> +++ b/drivers/video/fbdev/sbuslib.c
> @@ -38,7 +38,7 @@ static unsigned long sbusfb_mmapsize(long size, unsign=
ed long fbsize)
>   	return fbsize * (-size);
>   }
>
> -int sbusfb_mmap_helper(struct sbus_mmap_map *map,
> +int sbusfb_mmap_helper(const struct sbus_mmap_map *map,
>   		       unsigned long physbase,
>   		       unsigned long fbsize,
>   		       unsigned long iospace,
> diff --git a/drivers/video/fbdev/sbuslib.h b/drivers/video/fbdev/sbuslib=
.h
> index 6466b4cbcd7b..e9af2dc93f94 100644
> --- a/drivers/video/fbdev/sbuslib.h
> +++ b/drivers/video/fbdev/sbuslib.h
> @@ -19,7 +19,7 @@ struct sbus_mmap_map {
>
>   extern void sbusfb_fill_var(struct fb_var_screeninfo *var,
>   			    struct device_node *dp, int bpp);
> -extern int sbusfb_mmap_helper(struct sbus_mmap_map *map,
> +extern int sbusfb_mmap_helper(const struct sbus_mmap_map *map,
>   			      unsigned long physbase, unsigned long fbsize,
>   			      unsigned long iospace,
>   			      struct vm_area_struct *vma);
> diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
> index 6eb8bb2e3501..f9a0085ad72b 100644
> --- a/drivers/video/fbdev/tcx.c
> +++ b/drivers/video/fbdev/tcx.c
> @@ -236,7 +236,7 @@ tcx_blank(int blank, struct fb_info *info)
>   	return 0;
>   }
>
> -static struct sbus_mmap_map __tcx_mmap_map[TCX_MMAP_ENTRIES] =3D {
> +static const struct sbus_mmap_map __tcx_mmap_map[TCX_MMAP_ENTRIES] =3D =
{
>   	{
>   		.voff	=3D TCX_RAM8BIT,
>   		.size	=3D SBUS_MMAP_FBSIZE(1)

=2D-
=2D--
Hinweis: unverschl=C3=BCsselte E-Mails k=C3=B6nnen leicht abgeh=C3=B6rt un=
d manipuliert
werden ! F=C3=BCr eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schl=C3=BCssel zu.
=2D--
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
