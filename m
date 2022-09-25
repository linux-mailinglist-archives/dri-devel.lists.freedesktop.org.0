Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD2B5E92B6
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 13:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2B010E222;
	Sun, 25 Sep 2022 11:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E025910E216
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 11:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664105101;
 bh=UWqhMQp6ZxdK7nN3F7WhJnrk5n9DdR2COrjRGDFJtmg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=gn7cl1qvgjQmfsGQT3kz/hP3pdXTE+/0JNg2efoaiVGr0b67L6hD4n4yAU5FJlZql
 TZYKTWrV2VPLamveMuvMQExSHCuujj0Sni6hhLi6NaOh7UWykPwt7lFKohd0BBZlUp
 eFzBa3Prdeu6mnuxh3vjFmScy9OkpSWOeCt+ws+A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGz1f-1oPzIs1AbT-00E1iV; Sun, 25
 Sep 2022 13:25:01 +0200
Message-ID: <d57755de-44dc-e39c-6f79-1c139a77525f@gmx.de>
Date: Sun, 25 Sep 2022 13:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] video: fbdev: gbefb: Remove unproper information
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, broonie@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel.vetter@ffwll.ch
References: <20220902025612.3833972-1-jiasheng@iscas.ac.cn>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220902025612.3833972-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NWo9unw0v52ZFh0r2dGQYyZpghQUKrtzka/hso5b+yrA2j3vu+E
 qYiZ1qOmdwDM46N1xr8Ne6oZQC+FP0Js6RaF7lEIERXTnqLs6oFkD9FSWt1OAaNsavE0kWv
 K+PT4Jf4HGLG8EE/ZnlppmveezN1u6oiDlfV/UfHf35tk70LBL1MhdimNvo2n8NLItI58Fc
 M+DvRUTVNzwrjoDyX5IGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lvvGcYDw70o=:e9E8067rY2u8n0gK4OGbxV
 1BygFJt4LIrgwOC7gLlDUNHWK777hhq+FUckuGx/yYKQ7A2yVPDTiInKCDBOfguhZv36VfvfL
 CLa341Rmv7VcAzlt6mRjUtTyWzzYr6rxCayaIb0xbh4xya854ZOcfE9ARy6ALotgCh/IFJLcv
 nGcR7WUtp562CuPM0gecUPHi6cuCLHxyOXx1vrM20o+LWMCIX99kCUV56t7L/HIgm+F8EjFDn
 /+WIJAidTbL59eZErg8rROMx9PkpuSeCqNwtWWUGRD3m99pDIBJkgAY+P02tKu9zbzqb9dDH8
 C4OQevn6pjkadV+p7EK4jB5Axaym+cUOmcKkucfzHU6Pam+zjFaFFTzeMPgrLcexfEhTdDF2V
 2cToD8+r+SFkS8GcT20UlRUWBK+wWKZoVd0Z1Sjlvkq6HuTyYdf5vEzM3Ltw7jqNGibSeUtHz
 c8H5fwnuezv+wYKhQkK39b6hLeM84Y5gR7wmQQjCjUmz4Kzkmxi9eahe910SBg2Bm3xLoydEv
 /+bHLjTikV0obqWOX0R8r8qIRj+xb1imqjVrsIKiKLXLmm4Yam6cCkFRKrqHneH13RsXMfNW8
 nxTvyGmyY/M1ZRgMknJfNp/ZwJYGQdwBEC7fXGzKFQ7hojiSvgCquK4SMgd8FCkv43hWI0Fre
 PCo6O+k/zmZS5eVuUwuJmkyGTfxU++Lu+4IGK32BOiMcAYw0U2nZo57WA7h3QWtHch8onRYfq
 v6YGI5bf7WKyBYaWypgJI652tX7F7/gu80IebRzGJ9xDGWzQsxWOqxPslz7aCLORo9w1GYH7G
 fkR9RpzXNvZgHyPuG5ov6CL0U+9Qpg7dR0HxiqonPWGzeta+l2DI7I8upZscZ9KLTSawceg+H
 mFE7CztJkLkd7jCgGcBDpF7Xd6rkpRmd64T6PtgVl+C3kFf6POxxSTH8AwCbgzna9gWm5xH8Y
 aFaod9KiUeWCtKxnoULIwtviKu4POUESbGbo9YJ7nSTJXP/3uKt0vXotA9HM4zvj5qtTrW+TW
 Bk+lErEK5Z1U3n+eXO0GRwlwp4R/GMKwVyUM91W7BbXgZA80PcKRpayafHjvk5ecZhzn4SgqI
 jDoh0tZI0tenpdD/FIs9ebQOnfQ/4EmDqhwgMqlrZemgnnN3xhFuA7p/ssDmjXfG6VWsWO3Ha
 u6vimqD2StUIqSluEMXPWMC/Cn
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

On 9/2/22 04:56, Jiasheng Jiang wrote:
> When drivers are working properly, they are quiet.
> Therefore, the fb_info() should be removed.

NAK.
This seems to be useful info about the detected card and it's only
printed once.

Helge

> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/video/fbdev/gbefb.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
> index 1582c718329c..7e39ab939691 100644
> --- a/drivers/video/fbdev/gbefb.c
> +++ b/drivers/video/fbdev/gbefb.c
> @@ -1217,10 +1217,6 @@ static int gbefb_probe(struct platform_device *p_=
dev)
>
>   	platform_set_drvdata(p_dev, info);
>
> -	fb_info(info, "%s rev %d @ 0x%08x using %dkB memory\n",
> -		info->fix.id, gbe_revision, (unsigned)GBE_BASE,
> -		gbe_mem_size >> 10);
> -
>   	return 0;
>
>   out_gbe_unmap:

