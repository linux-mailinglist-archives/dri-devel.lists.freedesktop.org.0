Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521B152CF86
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05AB11B292;
	Thu, 19 May 2022 09:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABA411B298
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652953037;
 bh=N4+dzENszk7EjcP6QEPG3DSK2vLDP5A+aM1bUGENtoU=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=ibe/MwLFCPT67vMgQQXi6vRQIrAFoU9fJmtE+jbjTLRMB4YXectMWQnNabbOdeCLb
 BwrvVEnEgJThlDh6vsO+8XIaBXX42iXvnoWmrfp9BCJMtzf+O4us/rgB86Vm3geXWY
 sYtnZOTvBf0y2N+0XOpAtXkI09Rmryv2pItPk8Wo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.152.7]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1o7dH90PG2-00JGVp; Thu, 19
 May 2022 11:37:17 +0200
Message-ID: <e1d467ab-4ce6-6702-bd96-4ed5f4c6543c@gmx.de>
Date: Thu, 19 May 2022 11:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH -next] video: fbdev: pxa3xx-gcu: release the resources
 correctly in pxa3xx_gcu_probe/remove()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20220513100541.2665467-1-yangyingliang@huawei.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220513100541.2665467-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ebaSU/xZ4T/UJa7gN3ZOW6FXe26rKla8kTIdy+5kcvbSvy25IJn
 uJktWwDhmDVMgZZt+EyTXX5QPgL7yKQZ5Pk7XBn0EVjVNwpkXGR+tp7clsC4a8/DUYA76By
 3WJTdp1BET2BUeHJqxhVmQbbN2uyHySZNDFTq6eO5LvFSzgRDR7kPhQ71BBz1fk3cn7K/5G
 BKtgtt54OmA2dCx5kKAFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vbKg9C5u+iQ=:Kt1F/dbe2n8qiSHFmm4uwM
 nqvnToH/GMrC+66EDQQ2x7vodIDjrbvjmfpH/8qIa0fjBUjmjscisX84AiIeU2VL6Qfup9bDC
 SvuI2s6yM6FCCbc1Ef7R1aEm9tT6HRv9PANGY5zSmFAOjgNQodSSiwC/dyvktUwNniQiRiARV
 Fq80Mq3WKSYAPqumVN4xZkAfHiv/qTTHJaakXfIcZLn/P+sUqOwEwDPKlOVlMzI88cyzNXxeo
 z0lBfmQQPpWS9/A41sjQTeG6FYAtSg2WuuAQCIaSLuyeonR0OIaX7+hezsp4tbHeOMDA7G5G3
 ZX6cYSRHxSEpibIZgfVV2of3dovBD5Oj+uS0SLDKwD+jhxUwuCXn93dP7jVBGfK8gqACwP+5W
 qFsyEj7JjQ/rr9bOf84Sw5c2HY1oPh4phVAIiHdzF2DciLepcCWC3RxQE0jgIa8LkXa1XMaXd
 Oa2w6yDWepPHx5dWN2+fIyQtm4TrscTQiByLVC4AaHAPAAg9OxqHiSyeTOse+iv7JHYSZjJJp
 mmthA961QTvoDlXlBBvyuDBcO12wRCGGm0NlUaOq2SVq439YWrKYjux4d9bqU23hRvqOexd4a
 LPr9lLXr8gx8qkKZtcpW5N+BGzNz0wm/VCpCpbH4XtTAuatsRVGez1B5OTb+3WLJiv4856egD
 6SPFCAVC9Q6jZwrfIW/MJUr/QH8oGKFHbPgsa7MWUMh0SzQ/yv/g7ZLUpomlNk3lK8MyexmxT
 IDS1N3QIyUnvP9vqxSsqKmw8JEpp7biSu3Q8trCretBUkNmQyKMKcalmC+jx+od2HHZYoBmKm
 Sd+Zf0ezmGhopZ6vpOIi6qEJuMWgFNSzWefm0AjmzWwDS1UaJEYgLXhk+X+lWgJFfbzl2K04k
 z83kSuea51xmHuUo+MIdlmEte/IF9xaIGfkSV7eqNpltN8b9T1blZsEdLG2+QvbFw1AO4+OKQ
 rsVgo0PzFi9OBunPux7gM+U+/mC/WvxuCZG9nS209VWQedHZgubbF5nL7jgGQ32hwi8PGHf3B
 PkLSfa5oNF/W3QqZCHhXRZAM3WS3PtFWu5eOGTSjzx7lESVy42VC7AryWkSaMbPfGitxLiesA
 91Cf5i8pl48NXMSulWcuigJVxp7XU9TuXHyOzcGyeYwcvU94rVyNHn4AQ==
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

On 5/13/22 12:05, Yang Yingliang wrote:
> In pxa3xx_gcu_probe(), the sequence of error lable is wrong, it will
> leads some resource leaked, so adjust the sequence to handle the error
> correctly, and if pxa3xx_gcu_add_buffer() fails, pxa3xx_gcu_free_buffers=
()
> need be called.
> In pxa3xx_gcu_remove(), add missing clk_disable_unpreprare().
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

applied to fbdev tree.

Thanks!
Helge

> ---
>  drivers/video/fbdev/pxa3xx-gcu.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/pxa3xx-gcu.c b/drivers/video/fbdev/pxa3=
xx-gcu.c
> index 350b3139c863..043cc8f9ef1c 100644
> --- a/drivers/video/fbdev/pxa3xx-gcu.c
> +++ b/drivers/video/fbdev/pxa3xx-gcu.c
> @@ -646,6 +646,7 @@ static int pxa3xx_gcu_probe(struct platform_device *=
pdev)
>  	for (i =3D 0; i < 8; i++) {
>  		ret =3D pxa3xx_gcu_add_buffer(dev, priv);
>  		if (ret) {
> +			pxa3xx_gcu_free_buffers(dev, priv);
>  			dev_err(dev, "failed to allocate DMA memory\n");
>  			goto err_disable_clk;
>  		}
> @@ -662,15 +663,15 @@ static int pxa3xx_gcu_probe(struct platform_device=
 *pdev)
>  			SHARED_SIZE, irq);
>  	return 0;
>
> -err_free_dma:
> -	dma_free_coherent(dev, SHARED_SIZE,
> -			priv->shared, priv->shared_phys);
> +err_disable_clk:
> +	clk_disable_unprepare(priv->clk);
>
>  err_misc_deregister:
>  	misc_deregister(&priv->misc_dev);
>
> -err_disable_clk:
> -	clk_disable_unprepare(priv->clk);
> +err_free_dma:
> +	dma_free_coherent(dev, SHARED_SIZE,
> +			  priv->shared, priv->shared_phys);
>
>  	return ret;
>  }
> @@ -683,6 +684,7 @@ static int pxa3xx_gcu_remove(struct platform_device =
*pdev)
>  	pxa3xx_gcu_wait_idle(priv);
>  	misc_deregister(&priv->misc_dev);
>  	dma_free_coherent(dev, SHARED_SIZE, priv->shared, priv->shared_phys);
> +	clk_disable_unprepare(priv->clk);
>  	pxa3xx_gcu_free_buffers(dev, priv);
>
>  	return 0;

