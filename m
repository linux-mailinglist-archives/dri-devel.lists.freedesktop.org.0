Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D258E4630C1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 11:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211E56E5D5;
	Tue, 30 Nov 2021 10:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D657D6E7D4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 10:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638267072;
 bh=6as+OWQfUBBueP33NqtJSLGs4+mbtX4XzVOWARqtKOo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=TKmeK3VmPSNHMsECVgAcs8uEh2CjxVSajXw8fxB1GQVhoiITgvSTj+3DVLv5Dq46M
 eF7mYCPsrh0c1rrdSDxtba11ZdsoGyKPMY7xxV1NLd5TElA2LkzJNryj/a3a8tTCWs
 ZAnnvaWWiDBHaT7rfaN+T5HojCnYrjIli91XJXUs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.145.109]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95iR-1mUvUV2Lyh-0163pm; Tue, 30
 Nov 2021 11:11:12 +0100
Message-ID: <6a73a2c8-1055-ebd5-7f12-dd34e86b7f2d@gmx.de>
Date: Tue, 30 Nov 2021 11:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/7] agp/ati: Return error from ati_create_page_map()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel.vetter@ffwll.ch, arnd@arndb.de, gregkh@linuxfoundation.org,
 James.Bottomley@HansenPartnership.com
References: <20211112141628.12904-1-tzimmermann@suse.de>
 <20211112141628.12904-5-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20211112141628.12904-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vsXZmWREyyQO4Ei4hi7PGcBdNB7o4W7WlJycF4lrN8y7m8QghWY
 awXrOrKcpO2aiGIPC4PwoEVwCsCvDganvJb9FMID0k1BSb8zhMcRR9bAUD817IK73V3I2Qj
 YLY8pe/Yr2PqlBttdV6LdJLQQk8NPXEQzVplIxWciz0PH3lKZ2DbdaKkQn4XiLjA8ErYD0T
 moMKZpJM+10hX4MgNZsDA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dQW/7gbB9B0=:Ke5jKM3Vbv4XtclE6M8m1R
 69xiFRvhHOigWGdjntZCXaCdSWWk/vaSD2XXiU3GperqW4UVIITcMxyr6/VsqScA5fF0sxV3f
 Ft1wowUFUNkUZ1j8gmVx0PulFa0ygQ7IyFjJOMsAzr5SDIuk/AQfRPgSDoy2SbAokv7k5xIx4
 J66skMYzlQ1ibSXiOyg1dzs6ZFztuj56pqvg8SUcL0dg7X5gxgZ8zfRx0iCXeGftLCl7MxO1Z
 4q68lZL+2eF8rhgkhvjTknCWJMkgSQ79Hdj9zyt4BZsmYDmShAKCUjuPf5AtkHVnCnnI0sddH
 pFX6eDx9Thf/mDU8dfmexca9kxVZrv4G3tHQgOY5TATZjKX/gN0gA/TipE3cdBDYNH0JnTV9s
 oBsHxpolujwZUc+9L2QZN7ML+SduVwkOGWQvahITsFXZlS+kMKpE/m8bnfV0eN17mLeTPW5O9
 ACXguYCiSAzq2T+JCjjS8tqfcRcqJAp94ln9zqwrQsO21OU1sgVS6fdo4awNVg3peFo6JqmV0
 fHuTB21Sa2K5Jx5tYMT11hLGm2+2T4BNqYsIklM5+bGdVGdUEC5nPHtvEb/MvJolGou0jSTQf
 PJ0h9CZjnq2r3IB+xNkN/j4ElobsBrsFZmOyMKz+6Pq4mXrDwaOXUAYbnSgR7tG2crja/r9Dv
 kADpPSdmnOaas/9fGcc0UjqbxUaThkkVjFqwfmsR7Y0An27UJpaZWQdJcMO9mPRVtq07q3tnt
 YNWUUhX04F/Dwbph6b7LKU3uAoHBp8BujpbgH9EC+IdPN6r1NIToO0ym1Iy/DVbwdaA+lr43s
 Xy2KfcOKJLzCd2jzu/sYCbMkdBK2U34sgNaSvIxxpzMfHSJb8M8stoutxZhAd7+4NImMLeLkv
 VsFdRWJ4GtDd7u/FipyKZGzpVgr/ejKg9bK/b+aoqDjjZW/sBc5B+jLnt2xKsZmJ/utvNSebh
 zsQlvEc1nqoIXgaTtNNboRiWepfy4HJWSe7ESv1gJhx2mQimcE1Qpx4xBWpzXIlWFIwUo5rL3
 zTvLgYJFskFMPz7j1Bs38ujAfpMvKjmN81BjK62E0f+6EjC7LBcIPpcJe18tXobqRtc5JoYEm
 AGt0tVC9uTxw10=
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
>   drivers/char/agp/ati-agp.c: In function 'ati_create_page_map':
>   drivers/char/agp/ati-agp.c:58:16: warning: variable 'err' set but not =
used [-Wunused-but-set-variable]
>     58 |         int i, err =3D 0;
>
> by returing the error to the caller.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/char/agp/ati-agp.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/char/agp/ati-agp.c b/drivers/char/agp/ati-agp.c
> index 857b37141a07..785cc1ecf4e0 100644
> --- a/drivers/char/agp/ati-agp.c
> +++ b/drivers/char/agp/ati-agp.c
> @@ -55,7 +55,7 @@ static struct _ati_generic_private {
>
>  static int ati_create_page_map(struct ati_page_map *page_map)
>  {
> -	int i, err =3D 0;
> +	int i, err;
>
>  	page_map->real =3D (unsigned long *) __get_free_page(GFP_KERNEL);
>  	if (page_map->real =3D=3D NULL)
> @@ -63,6 +63,8 @@ static int ati_create_page_map(struct ati_page_map *pa=
ge_map)
>
>  	set_memory_uc((unsigned long)page_map->real, 1);
>  	err =3D map_page_into_agp(virt_to_page(page_map->real));
> +	if (err)
> +		goto err_free_page;

I'd suggest to not use goto here, but instead simply fold
in the free_page() and return.


>  	page_map->remapped =3D page_map->real;
>
>  	for (i =3D 0; i < PAGE_SIZE / sizeof(unsigned long); i++) {
> @@ -71,6 +73,10 @@ static int ati_create_page_map(struct ati_page_map *p=
age_map)
>  	}
>
>  	return 0;
> +
> +err_free_page:
> +	free_page((unsigned long)page_map->real);
> +	return err;
>  }
>
>
>

