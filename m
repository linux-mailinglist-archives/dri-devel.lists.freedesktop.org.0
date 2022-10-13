Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FF5FD49E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 08:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFDB10E1BE;
	Thu, 13 Oct 2022 06:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5781810E1BE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 06:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1665641960;
 bh=a0YnP1i9bs24lEAd8uB+UTB2NYRN+cwhuNptzzc/nQ8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GHguRvzBB+ziM0CmXN1+HKdB1gzPyALRagkF0Yrq2VwoGUy2eANlms05SB9Kdvqny
 uu8xB1iCPbekOCP9atz9QKnAh57gQIx+W4lCQbUUQLenpyxElBG2/Yxt//yIDkp1N1
 c7CEd3isiWe9X/F7MzycnbzlPGvU4fU1kKl6lrHs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.150]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbRm-1owaGs1Cnu-00H40M; Thu, 13
 Oct 2022 08:19:20 +0200
Message-ID: <68f42463-e4b8-d4ce-51c7-3e0e5dc468ec@gmx.de>
Date: Thu, 13 Oct 2022 08:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] fbdev: MIPS supports iomem addresses
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20221012191838.never.778-kees@kernel.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221012191838.never.778-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vDcabaU0FvyZkkoeOJq7OcA4uY6T7+64cJDAjSyNahFXoqQNd6i
 6eW+msz0PAr0dD8WrqU3hBi/1b/Qs8w6d4Kp3I19UMvLyWR3VYYBh9OfykqWDloacLcIXCC
 xBJmqUCiT2ou5I2moDYDXsfe5KYV6mzkypSLS59rDcHPEE91NGC4FEdkGv3MCKLA3cz5QoL
 NkcAMJuYNnSjOXN3K97KA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aQjIGP8/pcU=:uhRQsZy7MG5QYeAAc6JeIB
 Oz6cN768Ay+Lw214rT4P+iadTMRbZ7lpnE/mtIj437CgbRwkOXg4IQP3jb2PXIRJHUEuS7nBO
 gUHZH/9ykXdZ8ex6HTzAQjYgq9W1esosOUp9W2n4SNhawFQ/Jm6abmwbaDSXitMg4UA9g6soF
 plBa9zU9P7RgSyfNWqsmbyJexozoWuzLibzJzvhmq2XXQy+FlnpkBuA821f0mRMy39MgQ3lTH
 97kKNWsHIKWA8YfxiTBK9SUrNT6N2ngdwsgJwlzXrMSv0YL1MwxlYXYpwCusteaXdOrpTNTGW
 id+bWVjml1LpSt+SztAJtgj7YIaQhez3zJ+fmspXDOyTDO41twhqTyh7VagzjF00ia48dPAbu
 CmREW2T1NeHtQwpcdvRu8EjfwNauFGKX1TSxVhjzalkLqk9chRRS5Vj5fao4XCB/1ulfWNeW0
 SdXoySoeyajtcwzJpEr/bB9t5OWHICSX5DKoM4hvACE3RsQYBi9YWMb9oRoBwdThN/lV8tLzy
 ZKJ5p+X6JXFp9P4F1QUtJRVHFQi8xr4Dv/xcCuO1MDBczuaX8whxpej7qZO0LnHJ1qgZnQGXs
 3kLtQYQmNXgCXq42nlnADcDnVvfQ8iXGJtFA5p/BhVZa+VvzUy23m/5INdDQY6uRMpsUcwV8H
 JHnZ/RbGTohKiNpDPB7s3fkhjvsURRsNwGgnOqy1z6LcZWeaYetU/MB6rN3PrO8gkOP5bGyhG
 uD92xRNfCOsK+XTyU5W1PGvucAJWklr1Xn6B/VM46RLbhpV58SNo322pQnY94ObO8dbUFE9Ug
 K60so/nYvPnAzP9nuLV8J0KAp9FaVHGJzprXL2a6NgNq8YsLxWVa3EZsMjzZaUClIiuzMl7d/
 Wa1HAkWTbr85FBlCkiQZ6MPC/v1LG1/DqL0oY3IfubOf+XtgmuwJxZE8TwVNSS8xlHVulo3s8
 XUrjK9ws1aIr7z9XqiVHVS+0zdIeoiu4F9+SpYRnJ1CS/HEdAmuU1UqtvUVuNpj3ZQU2+1eKE
 xizEm/xayJf7jeAYDgJOMyUb/YtBwEbzJh2KzxNEVI8IwDjpngySNkBFSEBr9vJoZpTm2bOns
 3UTjBVHaFziGzTfBg168q80xls89+l6u56Ge+8EvIfZETs7p+gcEJ8X5lVNygWDlQSy3yqzf2
 ya3tEwOTBZYtnJ4TmlLzWr9TiDPoo7cT6rXqejm66iZ2DCY59nW7LWsgUuuaqem8vcXDJ5yVf
 Qvj9m6q8dXvuPq9C6DzVzE/MwCVxUrn8lar9afpK4+aSHUnvqSPH1VovkVUDFhKjErdT+M9sG
 mcwQDei6PGqFJzK8RO/8VGwekmJ1/dZ9KAHLaDBQJah2+5mPQo5E8+ImxENTsGkl4GROQc5IU
 sRvyGYVBJCSBwTkwkZqiZhsB0grGGR43tqA2r34e/yRox428mYiRQfD4yq6ZFNm5X8zvzb3er
 eUFnLGUUB33RMDx70UmkIiMy6yaw5cpOJjilo5Ho7rVlCSetayIPZQqN5jAXtYAfTT5rj82NY
 nIp5zzmoexjozcpBHyp+TwDOUnfKcgDE1EdQgACJr4XL4
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
Cc: linux-fbdev@vger.kernel.org, linux-hardening@vger.kernel.org,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/12/22 21:18, Kees Cook wrote:
> Add MIPS to fb_* helpers list for iomem addresses. This silences Sparse
> warnings about lacking __iomem address space casts:
>
> drivers/video/fbdev/pvr2fb.c:800:9: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces)
> drivers/video/fbdev/pvr2fb.c:800:9: sparse:     expected void const *
> drivers/video/fbdev/pvr2fb.c:800:9: sparse:     got char [noderef] __iom=
em *screen_base
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/lkml/202210100209.tR2Iqbqk-lkp@intel.com/
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

applied to fbdev git tree.

Thanks!
Helge

> ---
>   include/linux/fb.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 07fcd0e56682..3822734a38c7 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -555,7 +555,7 @@ static inline struct apertures_struct *alloc_apertur=
es(unsigned int max_num) {
>
>   #elif defined(__i386__) || defined(__alpha__) || defined(__x86_64__) |=
|	\
>   	defined(__hppa__) || defined(__sh__) || defined(__powerpc__) ||	\
> -	defined(__arm__) || defined(__aarch64__)
> +	defined(__arm__) || defined(__aarch64__) || defined(__mips__)
>
>   #define fb_readb __raw_readb
>   #define fb_readw __raw_readw

