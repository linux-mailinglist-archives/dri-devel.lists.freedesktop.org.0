Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F604630E1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 11:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4486E91A;
	Tue, 30 Nov 2021 10:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E7D6E91F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638267550;
 bh=z+lkEpp8CtXh8BnnGEgWNMyATCAdkFl13007QbDbsNo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=B6Z24S8Izvw97319i6XK4m5xxon0CxovlTFGINRYOFb/3Q+aR5LsrStgLUEgoCSNz
 UIbVOhmHtIBLbxE+90qRrcErMWbrT2mvndhuKNulkowY3OFlfWEu/p//pIs+SRu5mh
 0P4diiz+kWSUlHRlDvSGKXUVJAGZM6SRjKQ5KmG4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.145.109]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5GE1-1mPzUm2tjp-0117qM; Tue, 30
 Nov 2021 11:13:57 +0100
Message-ID: <25f8e66c-09e8-f5d8-e3d5-ec48fbd8287d@gmx.de>
Date: Tue, 30 Nov 2021 11:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/7] agp/nvidia: Ignore value returned by readl()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel.vetter@ffwll.ch, arnd@arndb.de, gregkh@linuxfoundation.org,
 James.Bottomley@HansenPartnership.com
References: <20211112141628.12904-1-tzimmermann@suse.de>
 <20211112141628.12904-6-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20211112141628.12904-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dRfPSSYh1TVh5d5cFLP5Od6HlMcPXgpHTkESTdsjj++SHSyY4Tq
 8mdnp8HL3YtqOje53u3LSveK1icJG27ENSKshLTWZx3jiIueB+WuwqRMq8i78UQsVhFWmmi
 1v5wUbHbki2H0MBnWhrESFRSvDjweFcKeMC3PRilHAszI44ETNOuHf5onJDyzC9LUv+SrTC
 WtaQZ5nDGZI7wEJwOJR0g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iUNK+lue62c=:TtkVc26Tjk8Q8dRbPVofGJ
 vQ2r14vTWf+nyCfZdFJqKb/Vr5FZA2gd6g10dYWTKIG+DLHN0ywrfHD9SM+4AjiCzzsdK8id2
 170WMcKt3Q2LETTAX8uhiSfx4Qb9FXD0GFztTgPG14CywUd//PM4dwspe4vKHrJvCtIzCrjXB
 ktZYuYi3dwM7LQs1fcW10wyeGc9K33suJdV8f4L+pfVLCEMZm6SMbsU0MocVJG5gOKU/zOgOb
 ijxN+k204crV46ON1mvQGnFkL6/q9hE59t6XCkEf88PCwtkHkd7CbVvN3ypXaREvozBDlVPOy
 3z+0l6rTqEjrYygN2xnr2FGzyqkkkWwRerggP2+knXgWCs439AhlSfPwBXIkjMOm5Ite5Ll7q
 2kt1MWlN6ahDFcI4vCQ31x7Rljmd4K4TjecXc6DrHY6SEMY9AVRyR7itlCtIfE6s7Z1ZZtA5S
 gbEDpSzJ67Icbb/58KNKLSWiJkbtoGI/+3T2c7K96oWTibFtDKEjbA/hqyHDyZrNFgjQj2/KC
 7Xb9XKHyFa1qAIblC6nFC1tjL5Yky9KL1QKchgCNiNc/rsmCelaGwzAc6i1mwfw1fHtUpxgz9
 vb4oPJn0AdC3yAPKGSRkTWyIz8JbVTuhNxFhDlqDwmLEWrxFR5lvFMftgfeSQhixxF5s/H5rA
 5iPmRfmaAZQznSDbIjS0LiilNTBfxObmGFzpKHmEvs5y+V8VizJDmzl0iHQQTBAw+ltSsHxVm
 JZjf6RVYm6bV5S2FVDPuX2EguMI1ES5UZtdW54aSgFz46332oM2apVUe/1cMd/wg5XjskEaWl
 4kI19ur3Bb+OINuKzDkwzkaFbGegKvKZzs0ByC6gjIW0G6m3GI7YvTmS/PbJAM8nEBYc5tzE1
 sKG/6h5PLXlFaIyTX5SQPrIArS4JHZH/O7Uc8GReDIvS6JKsN6zdvuwTiJCB/mK3XrswG+Njv
 +vKZJM7iKkXKCXMwMvvWwMZYgl8r25PSn9Jt6OnAAn443AfCKiEToZCCG3AX0iBurMxkfCT6D
 uJH0CF5EMak2JF8NLygERivMmtXcjk4LZoQzG4DeLkyfVUkQwbuj3tsnqPldTzEmgRWugleem
 0ix3m+9+5D0pdM=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/21 15:16, Thomas Zimmermann wrote:
> Fix the compiler warning
>
>   drivers/char/agp/nvidia-agp.c: In function 'nvidia_tlbflush':
>   drivers/char/agp/nvidia-agp.c:264:22: warning: variable 'temp' set but=
 not used [-Wunused-but-set-variable]
>     264 |         u32 wbc_reg, temp;
>
> by removing the unused variable. The affected readl() is only
> required for flushing caches, but the returned value is not of
> interest.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/char/agp/nvidia-agp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/char/agp/nvidia-agp.c b/drivers/char/agp/nvidia-agp=
.c
> index f78e756157db..437b3581cbe5 100644
> --- a/drivers/char/agp/nvidia-agp.c
> +++ b/drivers/char/agp/nvidia-agp.c
> @@ -261,7 +261,7 @@ static int nvidia_remove_memory(struct agp_memory *m=
em, off_t pg_start, int type
>  static void nvidia_tlbflush(struct agp_memory *mem)
>  {
>  	unsigned long end;
> -	u32 wbc_reg, temp;
> +	u32 wbc_reg;
>  	int i;
>
>  	/* flush chipset */
> @@ -283,9 +283,9 @@ static void nvidia_tlbflush(struct agp_memory *mem)
>
>  	/* flush TLB entries */
>  	for (i =3D 0; i < 32 + 1; i++)
> -		temp =3D readl(nvidia_private.aperture+(i * PAGE_SIZE / sizeof(u32)))=
;
> +		(void)readl(nvidia_private.aperture+(i * PAGE_SIZE / sizeof(u32)));

IMHO the void is ugly.
Would tagging temp with "__maybe_unused" work ?

Helge


>  	for (i =3D 0; i < 32 + 1; i++)
> -		temp =3D readl(nvidia_private.aperture+(i * PAGE_SIZE / sizeof(u32)))=
;
> +		(void)readl(nvidia_private.aperture+(i * PAGE_SIZE / sizeof(u32)));
>  }
>
>
>

