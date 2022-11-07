Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3F261EDB7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 09:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1987810E281;
	Mon,  7 Nov 2022 08:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EBD10E2A5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 08:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667811157; bh=iRI7W/QU1cJZbiWjVLUSX5kKamrVwlbhRdK3X5/OYJc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=nlsygfpqZU/71gN7QJEp82YXz7fNG+Ipuq5rAqofcc5tYsGdwHTz9Z9CLPBg1QRa/
 mbTP3VCMxbKWJ8pZhQKxkf86KQyLupdoC2wuh8H9q9JXViU8ot90e2HU6xRJIcsz4H
 V3J870dLBLn22gYFqkuK9clBFV1v8vOu0bTdfjcs4dhysuDsrEdBiwbcbywo3CHxFK
 gVjl7NLmcQpgZtWZiJCXjRVxobowLGR7CB7E+ti2wSY9QjeNEjRHbvhv3uzaUzgHM2
 T8CePU4+OwqC5Vw9q53+lFT+Ig3ox6KXT4vpgwsXX8GrMiMqHph7dYj97/09vORK11
 Eun2ScIMnnmFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.191.140]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU9Z-1pWGQg08xf-00ehBl; Mon, 07
 Nov 2022 09:52:37 +0100
Message-ID: <5e52528f-e4a7-0aa5-b795-0cff80a153ce@gmx.de>
Date: Mon, 7 Nov 2022 09:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] video: fbdev: pxafb: Remove unnecessary print function
 dev_err()
Content-Language: en-US
To: arnd@arndb.de, b.zolnierkie@samsung.com, robert.jarzmik@free.fr,
 ulf.hansson@linaro.org, wangqing@vivo.com
References: <278d64e0.bd.1844d4c7a95.Coremail.wangkailong@jari.cn>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <278d64e0.bd.1844d4c7a95.Coremail.wangkailong@jari.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vgxJnNsimSpuwn3kVv4h30sgEDvxe1TqMkycvRhld3dN1CBbTNb
 cirLau/yhh7HBclzqrqixPy8ktn1jtwQSDFrpF/raYzeRgwoRV1ydCSr/8n1fL1QEK+GaEQ
 4USchyiL5usUlQQdpEZEIY2RqExktJvP2Iw0YOVs+W2+FqV9NrtHrBUy88pRdpftPf7MzDg
 KsIrej/SrMpGuuMpEO7Jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fi3ciiG9BaU=;3RmSQ8aQx9DarEbQVh70IdhJfSq
 CWBBzmhO/iJ/X6e96gqICmiDIOalEwt6rElV3glUyo5giZm1OezYS2kitoqKaH/AlGd1HYTD5
 Wo8Tr8LomMBiAq1ntaKaqpekRW04hvyyNFKtj+jW2YpKswkLh1xvpqGFjoQMykeQQ/DuuPf7A
 cBRr+njKZMUKbhjy4pGgkN4H0LOoy4krXKpbBM2UcXhzRNJFCXDaGd5FQ7CZpglZ01qCRWxIs
 +bSvdDYrgxBi2ssdBYl3nqokjbA7i81D+Y4iQhQLuirmQ5CfTphvNZvBlpklXKL6PMl4iZy2v
 OVnxZpEQInncGLivqyNfsQ4/f1jvMc4LWMOSfRi7Svw3r0B6FxSGKr1gHpM5MDezAATVYYuuU
 jGcCDhJkySG2TP9ANgL8iJL0rPE1BnT+C0t9NdoY+ii7sU8JxZcawOw+glTXF0nhEoo6fxm09
 uV42c85SorKuh1n8LPEF9NXP7zh1NY0SaHjwBbao842rbi+ybimkO9gTbETqdholj8UvK4TC0
 f1+mnomn7W1O7eX+pxMCPwW+DbQaseRDBml56Q1btmaAWNlO9ji8VPuS24HtqnUpkfFCy2bn+
 CXbCcY7ymPekQ9u5WeQSgZki/iJVa/y6lPJ9KBBGHlCvFGM1dGKojenAMDEOGfi1CAHZIZAOl
 pgfh1FmsNuyZbdbTuAz2XN8u2m+MSCbJmN0w7/iC1vv1zMxW9x97PZsw6H75ImgVq4fV44/hP
 FK8COyhE00FLJd8/yr56vSUER/sM3668Km+i48JIWh4nqsT+gPjwBe3ZH/3egOs8N0uTL/jLz
 B03qHXIjh6qVZ+P3GE0iGJuZteeLjtWxBmMz5kvijXH/WMPQ/eFyVaZ8TSwd0ozHSfNpWfWtj
 +BkT2BF4VDA7MGwft50GbL7eeu3xnm5fRrx3KiNTlq7n+bSt//b4LQai0DA6IhF5HuXS1kGyN
 kQJWeYCCVoXhbKdpjnDgVfeoNsc=
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

On 11/6/22 15:16, wangkailong@jari.cn wrote:
> Eliminate the follow coccicheck warning:
>
> ./drivers/video/fbdev/pxafb.c:2330:2-9: line 2330 is redundant because
> platform_get_irq() already prints an error
>
> Signed-off-by: KaiLong Wang <wangkailong@jari.cn>

applied.
Thanks!
Helge

> ---
>   drivers/video/fbdev/pxafb.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index 696ac5431180..c46ed78298ae 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -2327,7 +2327,6 @@ static int pxafb_probe(struct platform_device *dev=
)
>
>   	irq =3D platform_get_irq(dev, 0);
>   	if (irq < 0) {
> -		dev_err(&dev->dev, "no IRQ defined\n");
>   		ret =3D -ENODEV;
>   		goto failed_free_mem;
>   	}

