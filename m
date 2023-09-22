Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F67AA8AA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 08:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3B710E3B1;
	Fri, 22 Sep 2023 06:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 337 seconds by postgrey-1.36 at gabe;
 Fri, 22 Sep 2023 06:00:48 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834B010E061
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 06:00:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230922055509euoutp0171f17176ada3568351de12199b23a5ba~HItstrwwI1804718047euoutp01g
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 05:55:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230922055509euoutp0171f17176ada3568351de12199b23a5ba~HItstrwwI1804718047euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1695362109;
 bh=IEWQo9HWa/ekBjyP7YGkeNCCcesh2MxuPZybdnf8uE8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=KBMyF5GYY8SqY8q62FVFhryH358rj2h4lSeK3+hrQ/mfeot8zdA50pJYTbZ3Vhi+Z
 xDNtwHNxHGcoJAt9Ehc5vagPPJIrg145GxcxOxmq+kqk4X8WjbvhiV85SBGi2tBgoX
 qb+bCpjd4AFRn6NdLLk4Tal24XDpe5Ot7b7cJYis=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230922055508eucas1p261c40237aa1f2a136ee468d168df9116~HItr8G0aW2758227582eucas1p2d;
 Fri, 22 Sep 2023 05:55:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3F.FF.42423.C3C2D056; Fri, 22
 Sep 2023 06:55:08 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230922055508eucas1p1edfc2f4d05e0798befbea4e9e12a7420~HItrhpR_Y1907919079eucas1p1P;
 Fri, 22 Sep 2023 05:55:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230922055508eusmtrp25106bea1cfa55a4813fbcf2160cdb15e~HItrhBSBo2098420984eusmtrp2S;
 Fri, 22 Sep 2023 05:55:08 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-0d-650d2c3c20ab
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 60.7F.10549.C3C2D056; Fri, 22
 Sep 2023 06:55:08 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230922055507eusmtip1d124390875027b2027ecab671aaea1e0~HItqop6Io1535115351eusmtip1w;
 Fri, 22 Sep 2023 05:55:07 +0000 (GMT)
Message-ID: <fb9cd62b-6637-7bcc-e23d-37f3806f8460@samsung.com>
Date: Fri, 22 Sep 2023 07:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [RFT PATCH v2 09/12] drm/exynos: Call
 drm_atomic_helper_shutdown() at shutdown/unbind time
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230921122641.RFT.v2.9.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djP87o2OrypBjefKlucuL6IyeLBvG1s
 Fv+3TWS2OLvsIJvFla/v2Swm3Z/AYrH39VZ2i7NNb9gtNj2+xmpxedccNosZ5/cxWbR1LmO1
 mDH5JZsDr8fshossHnu/LWDx2DnrLrvHplWdbB53ru1h87jffZzJY/OSeo++LasYPT5vkgvg
 jOKySUnNySxLLdK3S+DKmHT5ClvBPcmKjoNrWRoYv4p0MXJwSAiYSDR0eXcxcnEICaxglPj0
 dyorhPOFUWJpzxQWCOczo8TLdSvZuhg5wTo27/vHCJFYziix8NgKZgjnI6PEvOtNrCBVvAJ2
 Es+e3gbrYBFQlTh/7AsbRFxQ4uTMJywgtqhAqkTzm/PsILawQKbE3xOXwXqZBcQlbj2ZzwRi
 iwgUS3w8sQtsG7PAdCaJi19uMoIk2AQMJbredoEN5RSIlLgzbwkzRLO8xPa3c8AukhBYzimx
 5cJkVoi7XSTetv5mhrCFJV4d38IOYctI/N8Jsg2koZ1RYsHv+1DOBEaJhue3GCGqrCXunPvF
 BgozZgFNifW79CHCjhIzvnxnhwQln8SNt4IQR/BJTNo2nRkizCvR0SYEUa0mMev4Ori1By9c
 Yp7AqDQLKVxmIfl/FpJ3ZiHsXcDIsopRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMw0Z3+
 d/zTDsa5rz7qHWJk4mA8xCjBwawkwpv8iStViDclsbIqtSg/vqg0J7X4EKM0B4uSOK+27clk
 IYH0xJLU7NTUgtQimCwTB6dUA9PE1xcP+T6dZDgnQ66N+9JaobVyf+9pxU1nj71c+I514TQp
 h728jau/2d/rsilzPqev0fo8z+JRm90s3ylymnzK1fzZKlNjl73pn7xC/4xbn8fJgGMPucwC
 Ux8HLHW3duw69eHWidsKv8W8FtgELmm+yOb8a8v+y8rbHE6v+351ecUu413KD6QyVvlKJi+a
 49iv9fwN/8X/2r+inE7yuU5xZ/pzfdMbm/+6q05veXXr4KTbNaeD1qfv6+Jes2Dal7y/Sdx7
 HSYqbFTUOXnLL/d1p8unQ+scilVXbsrSKn1ZYv1gdgD31K073sj+UfcXE1g7adqGnt2PXl+K
 N1M4W37w1sqXneeurTD/ZnaqNqC9R4mlOCPRUIu5qDgRABMfL6/jAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xu7o2OrypBtP+MFucuL6IyeLBvG1s
 Fv+3TWS2OLvsIJvFla/v2Swm3Z/AYrH39VZ2i7NNb9gtNj2+xmpxedccNosZ5/cxWbR1LmO1
 mDH5JZsDr8fshossHnu/LWDx2DnrLrvHplWdbB53ru1h87jffZzJY/OSeo++LasYPT5vkgvg
 jNKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLmHT5
 ClvBPcmKjoNrWRoYv4p0MXJySAiYSGze94+xi5GLQ0hgKaPEvR83WCESMhInpzVA2cISf651
 sUEUvWeU2N8M0sHJwStgJ/Hs6W02EJtFQFXi/LEvbBBxQYmTM5+wgNiiAqkSp6dtAqsXFsiU
 +HviMthQZgFxiVtP5jOB2CICxRIfny5kBlnALDCdSeLF+1dgDUIC9xklpvWngthsAoYSXW+7
 wBZwCkRK3Jm3hBlikJlE19YuRghbXmL72znMExiFZiG5YxaSfbOQtMxC0rKAkWUVo0hqaXFu
 em6xoV5xYm5xaV66XnJ+7iZGYGRvO/Zz8w7Gea8+6h1iZOJgPMQowcGsJMKb/IkrVYg3JbGy
 KrUoP76oNCe1+BCjKTAwJjJLiSbnA1NLXkm8oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2
 ampBahFMHxMHp1QDU3Ovt6L1l96EHLXmns+WTk8Wte1R75V5b/+Yq7VKrfi846O5TB9tPtjJ
 LNt1KHKuvujl6el+V4pL2TZvOS2/vFTE9OayC3YsileyNEouMoWVfc97kevKfflIqsoT3U1v
 Ti8syeJXD3u//K2YWHrMjt49Sk0qTN1dK9eJLtixdv6D6n+Vxrbmdff/PfZbOaVmjkuOzeTa
 ReW+mZe2id+K+Sb7+2GQSOTfdd2MV3k/nV6y8Hjk0ezD25RbPLtuf/wmVqd6UV3senDQ+TXB
 e5+nLzvsusXz+MHAKZp7Yp5VzdBffFR9scVt1428y4L/z94f9kVnziZ95VvbvXUtJH/kHeTI
 qdLWOVH1Y8rTd9pyi5RYijMSDbWYi4oTAaLVMYB1AwAA
X-CMS-MailID: 20230922055508eucas1p1edfc2f4d05e0798befbea4e9e12a7420
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230921194907eucas1p1027c5dfc5c5f77bca3c43673427c89cc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230921194907eucas1p1027c5dfc5c5f77bca3c43673427c89cc
References: <20230921192749.1542462-1-dianders@chromium.org>
 <CGME20230921194907eucas1p1027c5dfc5c5f77bca3c43673427c89cc@eucas1p1.samsung.com>
 <20230921122641.RFT.v2.9.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
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
Cc: linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
 sw0312.kim@samsung.com, krzysztof.kozlowski@linaro.org,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21.09.2023 21:26, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver unbind time. Among other things, this means that if a
> panel is in use that it won't be cleanly powered off at system
> shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart and at driver remove (or unbind) time comes
> straight out of the kernel doc "driver instance overview" in
> drm_drv.c.
>
> A few notes about this fix:
> - When adding drm_atomic_helper_shutdown() to the unbind path, I added
>    it after drm_kms_helper_poll_fini() since that's when other drivers
>    seemed to have it.
> - Technically with a previous patch, ("drm/atomic-helper:
>    drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
>    actually need to check to see if our "drm" pointer is NULL before
>    calling drm_atomic_helper_shutdown(). We'll leave the "if" test in,
>    though, so that this patch can land without any dependencies. It
>    could potentially be removed later.
> - This patch also makes sure to set the drvdata to NULL in the case of
>    bind errors to make sure that shutdown can't access freed data.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Seems to be working fine on all my test Exynos-based boards with display.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> This commit is only compile-time tested.
>
> (no changes since v1)
>
>   drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 8399256cb5c9..5380fb6c55ae 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -300,6 +300,7 @@ static int exynos_drm_bind(struct device *dev)
>   	drm_mode_config_cleanup(drm);
>   	exynos_drm_cleanup_dma(drm);
>   	kfree(private);
> +	dev_set_drvdata(dev, NULL);
>   err_free_drm:
>   	drm_dev_put(drm);
>   
> @@ -313,6 +314,7 @@ static void exynos_drm_unbind(struct device *dev)
>   	drm_dev_unregister(drm);
>   
>   	drm_kms_helper_poll_fini(drm);
> +	drm_atomic_helper_shutdown(drm);
>   
>   	component_unbind_all(drm->dev, drm);
>   	drm_mode_config_cleanup(drm);
> @@ -350,9 +352,18 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static void exynos_drm_platform_shutdown(struct platform_device *pdev)
> +{
> +	struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +	if (drm)
> +		drm_atomic_helper_shutdown(drm);
> +}
> +
>   static struct platform_driver exynos_drm_platform_driver = {
>   	.probe	= exynos_drm_platform_probe,
>   	.remove	= exynos_drm_platform_remove,
> +	.shutdown = exynos_drm_platform_shutdown,
>   	.driver	= {
>   		.name	= "exynos-drm",
>   		.pm	= &exynos_drm_pm_ops,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

