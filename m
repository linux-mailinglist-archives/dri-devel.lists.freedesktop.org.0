Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491B211CD7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069C56EA55;
	Thu,  2 Jul 2020 07:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CE36E0E2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:59:24 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200702015922epoutp03e54f8e9db76d23c2ad6c9a91cd93c992~dzO1Lz8qK1989119891epoutp03Z
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:59:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200702015922epoutp03e54f8e9db76d23c2ad6c9a91cd93c992~dzO1Lz8qK1989119891epoutp03Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593655162;
 bh=lOHAZFZPS9+a73hijdym/L6Q0O9mYbyCPmsKNSs7qgg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=LUegyff6IMYLE8WbGfPQDbJXWXv7YZEafhLnuGgONcvDDrv+pOL3vskjY6o4LRmUK
 9ifxlsc/copNmdkj56iCQKffbd1WAcE7heUOyLGQ5khFjwOIQ+xRunFhAgoQ3a0Svq
 bcLA7W0Q+VjqqtAurhOyvIXJeEZLyir3Ij7wzzbI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200702015921epcas1p2c5bb12503dd757cf487768767648b8e3~dzOzykN_i0470704707epcas1p2O;
 Thu,  2 Jul 2020 01:59:21 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.154]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 49y1Vb0fsMzMqYkw; Thu,  2 Jul
 2020 01:59:19 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 35.4E.28578.27F3DFE5; Thu,  2 Jul 2020 10:59:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200702015913epcas1p3b00b299a3d73041a2d160e8b27288335~dzOsxxd1t2702827028epcas1p3w;
 Thu,  2 Jul 2020 01:59:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702015913epsmtrp1c32923219f33a07f6da520a92f68fa0d~dzOsw0LvC3265932659epsmtrp1k;
 Thu,  2 Jul 2020 01:59:13 +0000 (GMT)
X-AuditID: b6c32a39-e6f5da8000006fa2-bc-5efd3f724813
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 09.7C.08382.17F3DFE5; Thu,  2 Jul 2020 10:59:13 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200702015913epsmtip16246678cb1645396ad107b39799832fa~dzOsh0BLI0949609496epsmtip13;
 Thu,  2 Jul 2020 01:59:13 +0000 (GMT)
Subject: Re: [PATCH v4 17/37] PM / devfreq: tegra20: Relax Kconfig dependency
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <876019c4-2dfa-b966-a6e7-573b5189d374@samsung.com>
Date: Thu, 2 Jul 2020 11:10:29 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200609131404.17523-18-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLJsWRmVeSWpSXmKPExsWy7bCmnm6R/d84g+51xhb357UyWrz79JTV
 Yv6Rc6wWqz8+ZrS48vU9m8X0vZvYLFpmLWKxONv0ht3i8q45bBafe48wWnR+mcVmcfGUq8Xt
 xhVsFpPWTmW0aN17hN3i37WNLBY/d81jcRD0eH+jld1j56y77B6Xzv1h9ti0qpPN4861PWwe
 97uPM3n0Nr9j8+jbsorR4/MmuQDOqGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sL
 cyWFvMTcVFslF58AXbfMHKBflBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFlgV6
 xYm5xaV56XrJ+blWhgYGRqZAhQnZGbuXTWAsWMdV8el/H0sD4w6OLkYODgkBE4kj2027GLk4
 hAR2MEr87ZvCCuF8YpT4cvoKE4TzjVFi56+bQBlOsI4bu9+zQyT2Mkr8nnaEEcJ5zyjx9eJV
 RpAqYQF/iQ8fT4C1iwgcYZZY3XkcrIpZ4DKjxNm2L2wgVWwCWhL7X9wAs/kFFCWu/ngM1s0r
 YCdx9Ps5FpALWQRUJH58rgQJiwqESZzc1gJVIihxcuYTsBJOAXOJ76dVQMLMAuISt57MZ4Kw
 5SW2v53DDLJWQqCZU2LflZXMEC+4SOza0s4IYQtLvDq+hR3ClpJ42d8GZVdLrDx5hA2iuYNR
 Ysv+C1D/G0vsXzqZCWQxs4CmxPpd+hBhRYmdv+cyQizmk3j3tYcVEsC8Eh1tQhAlyhKXH9xl
 grAlJRa3d7JNYFSaheSbWUhemIXkhVkIyxYwsqxiFEstKM5NTy02LDBFju1NjOB0rmW5g3H6
 2w96hxiZOBgPMUpwMCuJ8J42+BUnxJuSWFmVWpQfX1Sak1p8iNEUGLwTmaVEk/OBGSWvJN7Q
 1MjY2NjCxNDM1NBQSZzXyfpCnJBAemJJanZqakFqEUwfEwenVANTFaPhA4HPoX2vDv1Wefb3
 7PJ9H0XXhb9g3zvvjl6ibcLXG8f9e7eX7uZ6ElD3nPmAgo6rilzXkv3853KexUw0z+P7LePx
 UuuU5sXuyZ+7DHddKDx461kFM9+6oI2CG+78r5lissLS5NWjI/fKZ6jcu1F82eHi2hcvJr52
 em24yifP6onA2+dOC0U+/tttL5VtrRJ68qAx56TLb1TSZ6ycXDnvxcymgz81fLT//zh8WvnW
 xpo10vN2qJ0/WSwS+eBLsNzpE2t5yk0+RKzb7PX4/HTNqTJpy033VeXJmH1ZsTyoKcJph/JL
 /vo7PPcUZNm6OJmFO6N3rNTfFrxEvu+3/MxsuWIdtmsaBQqfHrEtjlJiKc5INNRiLipOBADJ
 3JN2cAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0hTYRzGfc85np0txo5z5eul1ZaQrZoKke+HsiiikyF2By2skYdpbbo2
 tSyoLP0wu0liqxXOmWnMVJyXOe0CXsoaGcuKeUNj2gXKlStSKa05Ar/93ud5frwf/hQu7CHC
 qIzMbFabqVBJSR7R0ikVrz2x6U9qTG1DJBopKwRoYnI8EJm6egNRzXc3QG9+ekhkeGQlUYGx
 gkAvL3zhoL62OyTyXukCSP/DSCLni21oMP8+ia7XlgJU+KiLg2bfNRBouq2M2BzEeFyFHMZu
 HOYwr3t/44zVoieZoXcPSWbk0jOMuXJxgmSuNlkA47WKd3FTeBvSWFVGLquNjj/CS2+vKgaa
 Ot6pybmrxHnQShUBLgXpddDV7uEUAR4lpNsBLDEXB/qLUHjD2Y0XAeofB8POTp1/8xVA93Ar
 5tsE04nw/Wcz6StE9FMcWh0OzPfA6T4AW/U/Sb/SAuCQcwL4FJKWwSefXKSPBbQEvp1yz+d8
 Oh52/+olfN8RdCSc8ub54sX0AWivdGP+SRB8fmtsfsKl4+AvR6QvxumV8HfZa9zPIXBgzIT5
 eRm0fb2DF4Ng4wLbuEAxLlCMC5RyQFhAKKvRqZVqXawmNpM9Kdcp1LqcTKX8aJbaCuaPLVvV
 CmyWb/IOgFGgA0AKl4r4jpiZVCE/TZF3mtVmHdbmqFhdBwinCGkI33XCnCqklYps9jjLaljt
 /xajuGHnsbyCyNtJH7c0SmT3Lg9F719Sl5AdkJRrNqzp2cNWyTv7aiKer073hI8eapTYCjZ4
 JBrJbUZk608cVQ0mr+43nN2ZKAp34s66seVxR2TfKY1dcJDnnZzePicr2bep1IzlVpW2RSQv
 AjtsMUMlPfbuS7tHlKbyLSmLalI+VCrN13num03ILTYmxCsyVIJ8A0mIlYJx9ZlhyzVxwMYm
 pmLWYNe6qrYKwrk7o6IV67NMoWLw6il4MDlomT0mCtq7FBWaHAGfhTn1owEh/Hj5sRXeM3Np
 2c1xYY/N5+5GFzfne+emUoMTHJdnyCh9jb6lOkI2ztVjWQN19dWD3VJCl66IleFaneIvbgKk
 5FsDAAA=
X-CMS-MailID: 20200702015913epcas1p3b00b299a3d73041a2d160e8b27288335
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200609131659epcas1p25e50d1a206229fefa3425740a476c989
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131659epcas1p25e50d1a206229fefa3425740a476c989@epcas1p2.samsung.com>
 <20200609131404.17523-18-digetx@gmail.com>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
> The Tegra EMC driver now could be compiled as a loadable kernel module.
> Currently devfreq driver depends on the EMC/MC drivers in Kconfig, and
> thus, devfreq is forced to be a kernel module if EMC is compiled as a
> module. This build dependency could be relaxed since devfreq driver
> checks MC/EMC presence on probe, allowing kernel configuration where
> devfreq is a built-in driver and EMC driver is a loadable module.
> This change puts Tegra20 devfreq Kconfig entry on a par with the Tegra30
> devfreq entry.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> index 37dc40d1fcfb..0ee36ae2fa79 100644
> --- a/drivers/devfreq/Kconfig
> +++ b/drivers/devfreq/Kconfig
> @@ -123,7 +123,7 @@ config ARM_TEGRA_DEVFREQ
>  
>  config ARM_TEGRA20_DEVFREQ
>  	tristate "NVIDIA Tegra20 DEVFREQ Driver"
> -	depends on (TEGRA_MC && TEGRA20_EMC) || COMPILE_TEST
> +	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
>  	depends on COMMON_CLK
>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>  	help
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
