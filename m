Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC4740D2DB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 07:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AF289F99;
	Thu, 16 Sep 2021 05:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6DD89F99
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 05:25:03 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210916052500epoutp025981e3fa118d5a4f850cabecd3597a57~lNhRMEE3c0554305543epoutp02H
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 05:25:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210916052500epoutp025981e3fa118d5a4f850cabecd3597a57~lNhRMEE3c0554305543epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631769900;
 bh=UG3AOVvCKNBrek8+NUimSES41T4oLlq7Q7RA3xtF1Mo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=l49Ac00Bx6b2x2HCH3g7l9IdJ3Hb00/pxYI6KoJb6WXx2lamL2taxG6aU02uDYAvL
 zaayf1FOAM2iaj1iaX9M3GZhR8wncQzr0r11iZK4AzldMEj9EGtiZGR953Mq+bUqOh
 ZC7Fndu59pl8a4haDSGn7gM/s3TYVjVF7WOEA82g=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20210916052459epcas1p42e76ba48242cea7e883e5642d6678f0f~lNhP2kN1w1659816598epcas1p47;
 Thu, 16 Sep 2021 05:24:59 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.235]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4H959c28Hcz4x9QN; Thu, 16 Sep
 2021 05:24:20 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 15.61.13888.CF4D2416; Thu, 16 Sep 2021 14:24:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20210916052412epcas1p4f21dcd7f8f1556b4c979391e454fc925~lNgj4eMG93139531395epcas1p4k;
 Thu, 16 Sep 2021 05:24:12 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210916052412epsmtrp18b3370a02a9fee49b06bfd0b7ca85ff4~lNgj3x8Ae3242132421epsmtrp1o;
 Thu, 16 Sep 2021 05:24:12 +0000 (GMT)
X-AuditID: b6c32a39-227ff70000003640-40-6142d4fc14b4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 95.47.08750.BF4D2416; Thu, 16 Sep 2021 14:24:12 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210916052411epsmtip1adfc6173dd7f4f32d476e56154ed8dff~lNgjlhPNz2228122281epsmtip1F;
 Thu, 16 Sep 2021 05:24:11 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie,
 daniel@ffwll.ch, krzysztof.kozlowski@canonical.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <9e3c7c13-b6e8-4f6a-7717-644d5256e678@samsung.com>
Date: Thu, 16 Sep 2021 14:34:32 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831074958.608-1-caihuoqing@baidu.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmnu6fK06JBodnmVr0njvJZLHm3l82
 i//bJjJbXPn6ns3ixb2LLBYb3/5gsjjb9IbdYtPja6wWM87vY7KYMfklmwOXx5elzcwesxp6
 2Tz2flvA4rH92wNWj/vdx5k8Ni+p9+jbsorR4/MmuQCOqGybjNTElNQihdS85PyUzLx0WyXv
 4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKAblRTKEnNKgUIBicXFSvp2NkX5pSWpChn5
 xSW2SqkFKTkFpgV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGU9uz2YsaPaomP2wh62B8a11FyMn
 h4SAicScq9dZQWwhgR2MEt/O+3QxcgHZnxglLm3fzAzhfGaUuHOrnx2m4+uKJqjELkaJacfP
 skE47xkldjz9zghSJSyQLPGp7Q4LSEJEYA+jxKNJk5lBEswCeRL31k8Ds9kEVCUmrrjPBmLz
 CthJHJzfAxZnAYp/v3EPLC4qECnx9+QuVogaQYmTM5+wgNicAhYS755dZYSYKS5x68l8Jghb
 XqJ562yw8yQEtnBIbLi4kBXibheJd1u3MEHYwhKvjm+B+kdK4mV/GztEQzOjxMQZp5kgnA5G
 ibuPr7NAVBlL7F86GSjBAbRCU2L9Ln2IsKLEzt9zoa7gk3j3tYcVpERCgFeio00IokRJ4tjF
 G4wQtoTEhSUT2SBsD4kdHbsYJzAqzkLy2ywk/8xC8s8shMULGFlWMYqlFhTnpqcWGxaYwuM7
 OT93EyM4BWtZ7mCc/vaD3iFGJg7GQ4wSHMxKIrwXahwThXhTEiurUovy44tKc1KLDzGaAkN7
 IrOUaHI+MAvklcQbmlgamJgZGZtYGJoZKonzHnttmSgkkJ5YkpqdmlqQWgTTx8TBKdXA1Bi6
 8YunKLtjo/qKzol6K3NkZeenOq2M9jYTdvzz5cyXI1eV3L+7TUjaf77WVE2gfW1dO8s55UDn
 DbsWbAvvBPpA5sL33wKpbaZ2sXYf5U79v3xLY+ey23v8VKq+zOqMmvPaJU2ueIezwFSeFY+r
 OvbYr9qQkCQ72SC5vSjgd+30rH/Xls1YunHKC/Mdjvb/WNeK7rJkOSlerimSMKHky4KkvXkv
 eL6zpq5IDnm0oOaGrM6BJZfCrmfdN0/Y9Hrh6STu76eP31u0wycyZG04z7n/q/SZdeZ3uE3/
 8JNde41vw5bqVV2S1yI2zq2Yyvf6U/ii930HouN7j1ZGVmy9mLFzvc33Jau2f1n+/MfbeCWW
 4oxEQy3mouJEADw5PfNKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSnO6fK06JBovamCx6z51kslhz7y+b
 xf9tE5ktrnx9z2bx4t5FFouNb38wWZxtesNusenxNVaLGef3MVnMmPySzYHL48vSZmaPWQ29
 bB57vy1g8dj+7QGrx/3u40wem5fUe/RtWcXo8XmTXABHFJdNSmpOZllqkb5dAlfGk9uzGQua
 PSpmP+xha2B8a93FyMkhIWAi8XVFE3MXIxeHkMAORokt0/tZuxg5gBISElu2ckCYwhKHDxdD
 lLxllGh9fI4FpFdYIFniU9sdFpCEiMAeRomLWzexgSSYBfIktk7fywjR0c0oMe9HC1gHm4Cq
 xMQV98GKeAXsJA7O72EGsVmA4t9v3AOLiwpESjSd2ApVIyhxcuYTsF5OAQuJd8+uMkIsUJf4
 M+8SM4QtLnHryXwmCFteonnrbOYJjEKzkLTPQtIyC0nLLCQtCxhZVjFKphYU56bnFhsWGOWl
 lusVJ+YWl+al6yXn525iBEecltYOxj2rPugdYmTiYDzEKMHBrCTCe6HGMVGINyWxsiq1KD++
 qDQntfgQozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGJtH7ndcqfLU10l4ppOm8P3PB
 ZJXL62Bnh+b4V5UzzEu7PJd+KBZ/fqRQs9b3TGK4FKt9UY9/32220xY/5tY9VFkTs/jvkeO2
 gtJbkwL64h+oWb9RfNLrk6OVNUf1rf/J5+ITKp69sP4XOpNhY+xt/UXKXVML9hYXcW7ijes5
 5JJ9UIGp72PcSk/5qG39dbKyNfoeazbfnO3AaeLs5XMxcpXQx40iXlPNtv0vtOsQShJcvVF/
 TRqnu7B1/TbJmtgnjVtZRAvklysuerHIPulwL7/eWae2TUfrFvJI/+//lR5RVL1poZXEO/MT
 bmURjaccWdZV3PVMf3b7zEc2Y2nHFqmoN6zb6mvfatmsfq7EUpyRaKjFXFScCADCbuuNJwMA
 AA==
X-CMS-MailID: 20210916052412epcas1p4f21dcd7f8f1556b4c979391e454fc925
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210831075015epcas1p1eacb427373ea390970512d8c21e112cf
References: <CGME20210831075015epcas1p1eacb427373ea390970512d8c21e112cf@epcas1p1.samsung.com>
 <20210831074958.608-1-caihuoqing@baidu.com>
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



21. 8. 31. 오후 4:49에 Cai Huoqing 이(가) 쓴 글:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 

Picked it up.

Thanks,
Inki Dae

> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 5 +----
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 5 +----
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 6 +-----
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 4 +---
>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 4 +---
>  9 files changed, 9 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 9870c4e6af36..b5001db7a95c 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -793,7 +793,6 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct decon_context *ctx;
> -	struct resource *res;
>  	int ret;
>  	int i;
>  
> @@ -818,8 +817,7 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
>  		ctx->clks[i] = clk;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ctx->addr = devm_ioremap_resource(dev, res);
> +	ctx->addr = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ctx->addr))
>  		return PTR_ERR(ctx->addr);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index e39fac889edc..8d137857818c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1738,7 +1738,6 @@ static const struct component_ops exynos_dsi_component_ops = {
>  static int exynos_dsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct resource *res;
>  	struct exynos_dsi *dsi;
>  	int ret, i;
>  
> @@ -1789,8 +1788,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	dsi->reg_base = devm_ioremap_resource(dev, res);
> +	dsi->reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(dsi->reg_base))
>  		return PTR_ERR(dsi->reg_base);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index a3c718148c45..ecfd82d0afb7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -85,7 +85,6 @@ struct fimc_scaler {
>  /*
>   * A structure of fimc context.
>   *
> - * @regs_res: register resources.
>   * @regs: memory mapped io registers.
>   * @lock: locking of operations.
>   * @clocks: fimc clocks.
> @@ -103,7 +102,6 @@ struct fimc_context {
>  	struct exynos_drm_ipp_formats	*formats;
>  	unsigned int			num_formats;
>  
> -	struct resource	*regs_res;
>  	void __iomem	*regs;
>  	spinlock_t	lock;
>  	struct clk	*clocks[FIMC_CLKS_MAX];
> @@ -1327,8 +1325,7 @@ static int fimc_probe(struct platform_device *pdev)
>  	ctx->num_formats = num_formats;
>  
>  	/* resource memory */
> -	ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ctx->regs = devm_ioremap_resource(dev, ctx->regs_res);
> +	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ctx->regs))
>  		return PTR_ERR(ctx->regs);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 700ca4fa6665..c735e53939d8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -1202,9 +1202,7 @@ static int fimd_probe(struct platform_device *pdev)
>  		return PTR_ERR(ctx->lcd_clk);
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	ctx->regs = devm_ioremap_resource(dev, res);
> +	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ctx->regs))
>  		return PTR_ERR(ctx->regs);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index b00230626c6a..471fd6c8135f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -1449,7 +1449,6 @@ static const struct component_ops g2d_component_ops = {
>  static int g2d_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct resource *res;
>  	struct g2d_data *g2d;
>  	int ret;
>  
> @@ -1491,9 +1490,7 @@ static int g2d_probe(struct platform_device *pdev)
>  	clear_bit(G2D_BIT_SUSPEND_RUNQUEUE, &g2d->flags);
>  	clear_bit(G2D_BIT_ENGINE_BUSY, &g2d->flags);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	g2d->regs = devm_ioremap_resource(dev, res);
> +	g2d->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(g2d->regs)) {
>  		ret = PTR_ERR(g2d->regs);
>  		goto err_put_clk;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> index 90d7bf906885..166a80262896 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -86,7 +86,6 @@ struct gsc_scaler {
>  /*
>   * A structure of gsc context.
>   *
> - * @regs_res: register resources.
>   * @regs: memory mapped io registers.
>   * @gsc_clk: gsc gate clock.
>   * @sc: scaler infomations.
> @@ -103,7 +102,6 @@ struct gsc_context {
>  	struct exynos_drm_ipp_formats	*formats;
>  	unsigned int			num_formats;
>  
> -	struct resource	*regs_res;
>  	void __iomem	*regs;
>  	const char	**clk_names;
>  	struct clk	*clocks[GSC_MAX_CLOCKS];
> @@ -1272,9 +1270,7 @@ static int gsc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/* resource memory */
> -	ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ctx->regs = devm_ioremap_resource(dev, ctx->regs_res);
> +	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ctx->regs))
>  		return PTR_ERR(ctx->regs);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> index ee61be4cf152..dec7df35baa9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -278,7 +278,6 @@ static const struct component_ops rotator_component_ops = {
>  static int rotator_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct resource	*regs_res;
>  	struct rot_context *rot;
>  	const struct rot_variant *variant;
>  	int irq;
> @@ -292,8 +291,7 @@ static int rotator_probe(struct platform_device *pdev)
>  	rot->formats = variant->formats;
>  	rot->num_formats = variant->num_formats;
>  	rot->dev = dev;
> -	regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	rot->regs = devm_ioremap_resource(dev, regs_res);
> +	rot->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rot->regs))
>  		return PTR_ERR(rot->regs);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> index f9ae5b038d59..3a7851b7dc66 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -485,7 +485,6 @@ static const struct component_ops scaler_component_ops = {
>  static int scaler_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct resource	*regs_res;
>  	struct scaler_context *scaler;
>  	int irq;
>  	int ret, i;
> @@ -498,8 +497,7 @@ static int scaler_probe(struct platform_device *pdev)
>  		(struct scaler_data *)of_device_get_match_data(dev);
>  
>  	scaler->dev = dev;
> -	regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	scaler->regs = devm_ioremap_resource(dev, regs_res);
> +	scaler->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(scaler->regs))
>  		return PTR_ERR(scaler->regs);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index c769dec576de..7655142a4651 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1957,7 +1957,6 @@ static int hdmi_probe(struct platform_device *pdev)
>  	struct hdmi_audio_infoframe *audio_infoframe;
>  	struct device *dev = &pdev->dev;
>  	struct hdmi_context *hdata;
> -	struct resource *res;
>  	int ret;
>  
>  	hdata = devm_kzalloc(dev, sizeof(struct hdmi_context), GFP_KERNEL);
> @@ -1979,8 +1978,7 @@ static int hdmi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	hdata->regs = devm_ioremap_resource(dev, res);
> +	hdata->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(hdata->regs)) {
>  		ret = PTR_ERR(hdata->regs);
>  		return ret;
> 
