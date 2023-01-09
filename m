Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB293661F98
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 09:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC8310E077;
	Mon,  9 Jan 2023 08:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B1710E077
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1673251383; bh=qozjcx4hTpr3jaYdT2eKjDnLhPkqHFw+E4wFsV+KjBo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=smzHY8PNV3Owc520Tr9p8IXQNBB9KKe4GYCYgmoeCwe6bz71EZc4DA6nOyUvP8bVf
 1nT6FchfvuH/idf4w/pYs8IYRPsRNvPTCdbsk9RdPZr164FKH5gvVOJPredv5RruCz
 1uYcoj1ypJRVK3w3dvdktbAe6C+XMQmY87PTaG2jIvQZGpDB8R7v/3mqwsdPJLEtZU
 B9YI4MPAm0O1F8NJYMp+FwU9rrftW/l1QQIMiUnnfykkiniFWe8dLCN2xFlKAOkdYT
 IcPvik70XX9eKiXjk1dF0+VAJ30kRtHcZbaPXO2K1rRgRBBxXsjD13WvxRV9Evn2BE
 4fwlcf4j0NiDQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.168.5]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwfWU-1opqNY4Aig-00y8zI; Mon, 09
 Jan 2023 09:03:03 +0100
Message-ID: <b1ba214d-f3e1-4f6e-5226-2ab7761c4366@gmx.de>
Date: Mon, 9 Jan 2023 09:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] fbdev: Replace 0-length array with flexible array
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20230105192034.never.249-kees@kernel.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230105192034.never.249-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9YTJmsZjsjckd6I9le8J645mr0N28l3SdIAvOuyOXzXTuxHoKTG
 qoIQNW6zyu1FP5X6N850VSLQj1Yw9UebNucTTQJta3AtHaS+teEAiFne08YoJwisaVxSDKz
 N0oYml7bDnzZQ1yhL5GdZ+k+Rw41aEnT0J2GsXeJAIU8XqYi2nstRW8BFge+4dsNu52nJl+
 EE9Lx6dmVlu166rTDsPCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UMFGxlVWvYY=;5AI8Fz86dVux/6X6Zo26d4ofLkC
 Mn+YuXFtnpca4uzGQr10jGyFUg4BvKVTFjgjCPtpHp+9t+TvPxS1H2Odj2prQlE/FQ3V9eEwH
 xxb+uWK5yADaZddzuMIVkgqJWW7A2oWr7pF28RTRhGpqJoRmsh6ygXWO+RcoI29/M6QLaptlv
 8pcFmo6+6CqJZ0zD+1hf+KY/w0KMqnEMSPNq1X1ASYHssCDwwjtRtDHzfkeLkj3DFPt5LQCq3
 0eO+7duchHK0eZVEYULvCHQIv80zsVW518lnz0nsKBKSTg8nCTINjNjV3SPsJM9qariCEB0gJ
 yDLg0G9L88CTjZqj018fr5yj5xb0UfRa/9qJ/IoeALU04WRyKVcLeggi2jPGzfkMSq38MauOs
 trLH8xBQP1+fNv8n2BBGHzpqaHPwDcmUYQmmnZyvw2mWz3RtiyzNXv41Ni7/obCPxnjrvNuSF
 OpjiBhrKaV5tWj1FmXWLhGAb7SOn+K1bioeZA7uZpDwNnL97VNxz1CujfD6OlnYbHmEYtLOIe
 j/Mm223Cvc4wFGQsQca3aV3X0ZGP5WnC/YU+euHqNvO0XVFM0YNIt+noJKjFRgET/MOB7oJdY
 D9rrUCL31P4PRPMax3YRU9pNEg8tqVj6Zijn1frN2hZ59Gwx+9FIvmoZ/XPXc+c0gQyJ2rB+F
 C90+bAPSObZ8ctryBCfK+CBe8R2lStLhnvwpPQrOjsLaus/5vRp/vHj8Y3s3A6ynDvzFgQbgQ
 Tu56CTwE4PHumDWLoIuhhJV0irXMDCtmXGuoDbb0ZWRD10A+5hldW9orqblk/fN7eeoXNm+rM
 HijCdlGagKbAYRZeAgSga65k0N470YFnFz3shIyUXLsXI185uPoTKSwu05UkMoURZCGc9xm2n
 fTuwX9wN5JthviOzrR6vHxUnFHofAx/v5LHDLzaKCOlX7SLbaJLH1KJI5FzdZfI1biLpG8jS8
 5zHJ/A==
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
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/23 20:20, Kees Cook wrote:
> Zero-length arrays are deprecated[1]. Replace struct aperture's "ranges"
> 0-length array with a flexible array. (How is the size of this array
> verified?) Detected with GCC 13, using -fstrict-flex-arrays=3D3:
>
> samples/vfio-mdev/mdpy-fb.c: In function 'mdpy_fb_probe':
> samples/vfio-mdev/mdpy-fb.c:169:32: warning: array subscript 0 is outsid=
e array bounds of 'struct aperture[0]' [-Warray-bounds=3D]
>    169 |         info->apertures->ranges[0].base =3D info->fix.smem_star=
t;
>        |         ~~~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from samples/vfio-mdev/mdpy-fb.c:21:
> include/linux/fb.h:510:19: note: while referencing 'ranges'
>    510 |                 } ranges[0];
>        |                   ^~~~~~
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-=
length-and-one-element-arrays
>
> Cc: Helge Deller <deller@gmx.de>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

applied to the fbdev git tree.

Thanks!
Helge

> ---
>   include/linux/fb.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 96b96323e9cb..bf59d6a3590f 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -507,7 +507,7 @@ struct fb_info {
>   		struct aperture {
>   			resource_size_t base;
>   			resource_size_t size;
> -		} ranges[0];
> +		} ranges[];
>   	} *apertures;
>
>   	bool skip_vt_switch; /* no VT switch on suspend/resume required */

