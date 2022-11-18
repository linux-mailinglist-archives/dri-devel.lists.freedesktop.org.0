Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9AF62F0B1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 10:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C90310E203;
	Fri, 18 Nov 2022 09:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7AC10E1FB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668762759; bh=eKtJWiPpgSifp4dBJaDSkL5sqHrBEh+fk4begN3cTGM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=QQdIoYkdv7fAqcKxznKql80UxqQqvLwoCdJXXKczFwaYw6nSNxqGjV3XXjg44Ufgm
 DQqhbIrWxmFDtcD1/UtWgejcX2zZx12hKkfRxfptU/8OGgTiK31xaRVGaGWni0jHXK
 fx1FefJBl1ccCTP8OBEeQa3ug4r5qBJDdsvJpr05XthVgMFQXZFUfLnRxjXPxa7Eh7
 wzslW5SfyRSMi5viHgeUUe/AqFcpC3DBx/ytRiTZr34dAJHpSqfDdety6rYbnID2dv
 KVH2GQXDc8VGyUBBRhn3Av0kk3l+PoaBd3Qt5x/m6YR/rg8ZMypjh0BM3GnMK+bv4P
 42Z6+rtHS/+xw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.164.156]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGRA-1ocdcX1xl0-00JNsO; Fri, 18
 Nov 2022 10:12:39 +0100
Message-ID: <9a32a234-b0a0-036d-86cc-f9942e165adc@gmx.de>
Date: Fri, 18 Nov 2022 10:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] video: fbdev: fix spelling mistake
 "paramaters"->"parameters"
Content-Language: en-US
To: Yu Zhe <yuzhe@nfschina.com>
References: <20221118090050.22148-1-yuzhe@nfschina.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221118090050.22148-1-yuzhe@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qfIlyXIDHqaMAPZu9uHYkCd2oiFTvgPIJHWKLO9du0KUtLNE/2m
 Qzk2OqSoz1Lb0es4i/CykSc+OajTd50HnyUFkQzuelz5HW3aIWEBQy8Dk5zb90YSPH9ZGYh
 9CT9UHjKTNHTYpUCWyCcSQ2BpG7Jx/O28VfIL5eWVS+1St+fYQI62OimfoGlWe7J8DrQ2Sf
 ma7iSzENejpn3jVPXnV2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4MMYiyYALVU=;0s3UI9q7gh6NlMHW3ScnT+zMsEh
 YxFm1x/91bP1UjpfA4w7HsxhGwnSVkytLBItMdtfYZI1hhjHqQp9iqfBj0zz1QYVW/YNaR0sr
 xsmypNg3dyicDohMtOgwm0LJnz0fHOmY1IGYKcYCCkislAM1nYuKPde6XRzOMEbXgyJc+AWb2
 MaV6qwJyi4OvWhmmxnvYK5UJhQ89Oigao3q03tU9mwS6i35HXtJY6Qwq3uxCCGRCcNDu6/0u+
 Ulv7TXCA6z0RaINaGl2xsXrs3frdJ07AzN5RhiLFaO/leFse8OWC0EJZEMdrMfBWyHVZM+34r
 HgWIYOHGvHsoC7ugU34TFQTwRr2tgTm35mt/bBCp2QCeCdz94scZJfWXB3MY9/TO+9GkIr2mU
 RID51dkRyBET6GkgHljmpbcJbq9w4CDGixAPx3/jvSqIQO0NUU7LzY+JtPKwFjMCoLWNnNFh8
 RYLjVjimmVkF/AVHwsQNSgS8+VBjh2nVrMOLOmgkTerD3eiKvLPjdLW8hcKc9spTKz6v71D1J
 ZiOG+YGCAEr14jl7MdRLx1SYizM5nlbKJvvKJKQrOToDUvKAyaaLt+w9h4fLYTGBOsEPPRa3E
 Opln0X+n9MFIN7wLFhc1AI3Ik4IxZWaH8ZsS+9493yWn480SPrkx59xGwQywEDMNFQCXz9Xte
 TaZWBiR4KnFYcrtCdp/ae3/Pw+9T2KNycULx2+McNDAjQ5vJB5++xaEahRC8dIWZwvMND4cO4
 FHcFchrdWxxug0kJh8MPtdGQy9MI9wfK+h62KxmbpQ2DV6Bcfbh4S2LnQpf8WnW0gTtN5LfCP
 sd/yVeDHImW6+lxDAop06+KHHwHis0yXZ+AwStvMAZPYaiY4keu2/jfv/IWvIHKfeQo1oN/7x
 EHLhadKC8WSpHNR0Fx0r8Ca2ulhG0fDWYko0MSGVKRi52rnRfIqJgw+/RxtlPAhrFvaRN51Jm
 p6f9DA==
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
Cc: liqiong@nfschina.com, linux-fbdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 10:00, Yu Zhe wrote:
> There is a spelling mistake in comment. Fix it.
>
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/controlfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/contr=
olfb.c
> index 6bbcd9fc864e..77dbf94aae5f 100644
> --- a/drivers/video/fbdev/controlfb.c
> +++ b/drivers/video/fbdev/controlfb.c
> @@ -376,7 +376,7 @@ static int read_control_sense(struct fb_info_control=
 *p)
>   #define CONTROL_PIXCLOCK_MIN	5000	/* ~ 200 MHz dot clock */
>
>   /*
> - * calculate the clock paramaters to be sent to CUDA according to given
> + * calculate the clock parameters to be sent to CUDA according to given
>    * pixclock in pico second.
>    */
>   static int calc_clock_params(unsigned long clk, unsigned char *param)

