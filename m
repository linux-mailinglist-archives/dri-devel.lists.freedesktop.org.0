Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550FD74E655
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 07:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A58E10E2F9;
	Tue, 11 Jul 2023 05:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F0610E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 05:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1689053363; x=1689658163; i=deller@gmx.de;
 bh=4QllDK5N6KW5ySDanE63Wz0r1DuAJrr5WWCDUK8NUBc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=EIHdv7Rp18tH8i6AVqcdweFs/dheQ84sw1NiLc3eMs4MTKCbmIxyWKYCqsONqU+0S3WpBsa
 ZFkH2jXDmWitNp8vO+Ffr9nlCS6RTGw4uEEPkapyf4gYSNuE4N5n70/gdSaS4LtlM6VJdJEms
 ZglnOXkz0AtWOO2QLyzJ2GgrFjdPPLkcLJJo6acr/oVnK2Poy88isgBKT3bKdyZ8Ks1uci4o4
 qnHrM/XeRk20ofkkKKgs1WVBSeNhRNWB+WZG+lYJHnpyXf5d3UqD6wWLP5S7z4JdgPphnlOoW
 VHN0I890c2Ia0VvJqhP4eXQpv27rPVM/1EUKzltXlw92gOdvczoA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.147]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bX1-1ptHe40ERX-010YmL; Tue, 11
 Jul 2023 07:29:23 +0200
Message-ID: <c3e67df5-c25a-1123-4b64-cd5816a5642e@gmx.de>
Date: Tue, 11 Jul 2023 07:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/4] fbdev: imxfb: Removed unneeded release_mem_region
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230710132001.50764-1-frank.li@vivo.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230710132001.50764-1-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qhJUziMMhMozDpBHJhmj8WIcMHW5BDfy1dWmyboQDPzVPsnGowl
 drexJdoeA6i3GjZ5QGqjeAnX8rvxzUwzLngqOBX8cO/NFisUG0Eh3t1iUwRc+H1aXGjq/eg
 4D3+jrLdfSDT6028/0XUsElylI+99FKU6iJPkbVOmKmzonofI5xjT9h/jtPkh2jO0WXvkPQ
 Hy2by1LxZhIZG9ox5MT4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EG/PweqhG9Q=;duFnQUTnZGQ6CV9gE+bpwUwVofd
 rGERjbZp9CpdbXiyyXxgg8IG3AZoPTJMEYRsyKn9AQ0zXNMCbRc3LuBwrPWEwRgOxt4UvOeYt
 3Ja6j2Er4GeUAqKw7KN1w2cSSoLttOLl3FSDUXgkLJKKR58Wt6qPeTx6FIZt6/0b6INPNxH0C
 E0QREFvGT3s+Ayo/ZmjtdjPKGgpaMq17IL67w2ev7vRz0p7kxSkvCNp+T6+Zo6PP5mwJ60/8z
 nGgc5ce77CB+U93zDiaKxr+pUj6+0bneX9WZf8rZmVlDiHRPJC5dDjW5z7JTPKZBDzRHNS2+C
 RJLCUMx/QaJ408O8BLKHD+2eLGC7k1nbhBCQ1vWT98ljSjCobw6aAGwsJgC7E6nupyPID+sif
 6WMuw3kPqp8WrP6KvHhvYeDkr+rm+CM16FGgPZV5rggK4pxrhuw5Ui+uFMK6R+yDWD/06IKws
 I4zh2IPmgJI6P1iKuLV8QKSMY18FHk9A+atGJth8/5sYGbgZ1tnTcq2ltqa3qqclpAwE46HLh
 G862Pj9KMyIzqP90QxxfKH6M77X9K2lGcHg0J/a11+h9UE0VfjZY5+pXdWCkQMKJX/vlOF2SO
 xmjT+uz0Trlgg1N5MibBb1mWGmNmwPzmER84VbthQyugXDigpa9Vc8TxXPCF2X+RK7vf9fQlm
 VWXOVm99NmWNTiLhUhB6GW3zgETSH4xdjnrMymuvxRdlEH0gkPHZxcA8ZF5IewSWLJGc5fdKT
 8hLRa80BJ8PCfuovDlsGhLAswIm6bBo3jnCVzaVxRU/UWVYHkxQAqSfwRtN4iT58UMlNPWtZw
 G5xMAi9wLX2sCbqi7zaWgtBFvUgjcYpzdQQkH0HvcAT2kwzoxdOiFoCAomFpOeVv6/euYmFU1
 7y7s5EAThKuGi6ziqCtLp/1ebobaJ27MKHSKiT+5bvsFIv6BhMZNHCsKGhVDp5iO0ihYCBIgv
 7fF6PQ==
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/10/23 15:19, Yangtao Li wrote:
> Remove unnecessary release_mem_region from the error path to prevent
> mem region from being released twice, which could avoid resource leak
> or other unexpected issues.
>
> Fixes: b083c22d5114 ("video: fbdev: imxfb: Convert request_mem_region + =
ioremap to devm_ioremap_resource")
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

I've applied that series (and fixed minor grammar typos in the commit logs=
).

Thanks!
Helge

> ---
>   drivers/video/fbdev/imxfb.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
> index 04f3bf30a529..385c4715c7b7 100644
> --- a/drivers/video/fbdev/imxfb.c
> +++ b/drivers/video/fbdev/imxfb.c
> @@ -1043,7 +1043,6 @@ static int imxfb_probe(struct platform_device *pde=
v)
>   failed_map:
>   failed_ioremap:
>   failed_getclock:
> -	release_mem_region(res->start, resource_size(res));
>   failed_of_parse:
>   	kfree(info->pseudo_palette);
>   failed_init:

