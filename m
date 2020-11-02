Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252DB2A23BF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 05:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58CD6E2BC;
	Mon,  2 Nov 2020 04:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB166E2BC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 04:14:52 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201102041449epoutp01f8232ad03a61a1634957dc2c8643c579~DlbNgUnn30045400454epoutp01-
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 04:14:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201102041449epoutp01f8232ad03a61a1634957dc2c8643c579~DlbNgUnn30045400454epoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604290489;
 bh=QrYoo1YX7FHmf+Kv5UEhq7+nJg391RDzNt24HpV8KFg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qniCFRzJNMgybQ0mvGS3oMDjDxzrH+CnHBOVCTIIskKNzUkvTvDjBPGkYeDf6Z1dL
 yHeqG8DVxL3dIUkzn+VkvniQ9HbaEcq+egO6tHwCybwNt+6GXyZIPdFynfrKVY56We
 zkkuBDnyBzkBioMyRtnPBT9yhwU17h1pgPfLm1Z4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201102041448epcas1p2e347635f4c5398898faa036804abd693~DlbMbcAdK1593815938epcas1p2Q;
 Mon,  2 Nov 2020 04:14:48 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4CPfh56xZZzMqYkY; Mon,  2 Nov
 2020 04:14:45 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.33.02418.5B78F9F5; Mon,  2 Nov 2020 13:14:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201102041444epcas1p21c489ffe14af8f6d59668f30464b4013~DlbIFNufI1593815938epcas1p2E;
 Mon,  2 Nov 2020 04:14:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201102041444epsmtrp282ec2e07137c3b3e0d660a4670510688~DlbH-f62O3084230842epsmtrp2G;
 Mon,  2 Nov 2020 04:14:44 +0000 (GMT)
X-AuditID: b6c32a35-c0dff70000010972-b7-5f9f87b58177
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 63.92.13470.3B78F9F5; Mon,  2 Nov 2020 13:14:43 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201102041443epsmtip26c19e1ac087a0d9fbaaa7294fff58fad~DlbHvB0rC2803928039epsmtip2L;
 Mon,  2 Nov 2020 04:14:43 +0000 (GMT)
Subject: Re: [PATCH v7 3/6] PM / devfreq: exynos-bus: Add registration of
 interconnect child device
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, georgi.djakov@linaro.org,
 krzk@kernel.org
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <943ea4d9-72a9-347c-87ee-e2e7e02a8920@samsung.com>
Date: Mon, 2 Nov 2020 13:28:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201030125149.8227-4-s.nawrocki@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPJsWRmVeSWpSXmKPExsWy7bCmnu7W9vnxBq/nslvcn9fKaLFxxnpW
 i/lHzrFaXPn6ns1i+t5NbBaT7k9gsTh/fgO7xeVdc9gsPvceYbSYcX4fk8XaI3fZLW43rmCz
 aN17hN3i8Jt2VosZk1+yOfB7bFrVyeZx59oeNo/73ceZPPq2rGL0+LxJLoA1KtsmIzUxJbVI
 ITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hcJYWyxJxSoFBAYnGx
 kr6dTVF+aUmqQkZ+cYmtUmpBSk6BZYFecWJucWleul5yfq6VoYGBkSlQYUJ2xr+tJ1kKfgtV
 LHy+kbmBcQJ/FyMHh4SAicSBPyVdjFwcQgI7GCU2HNjHDuF8YpS4/2MqE4TzjVFi7+JFzF2M
 nGAdH9/MYoNI7GWU2Hr9NQuE855RYsvHySwgVcICqRJLp3czguwQEYiRWP8uAiTMLHCCSeLI
 HUEQm01AS2L/ixtsIDa/gKLE1R+PGUFsXgE7iV0bf4MtYxFQkfiy/BxYXFQgTOLkthaoGkGJ
 kzOfgK3iFLCWOL3uLzvEfHGJW0/mM0HY8hLb385hBrlNQuAGh8TZx0eZID5wkeg58ZQFwhaW
 eHV8CzuELSXx+d1eNgi7WmLlySNsEM0dQI/tv8AKkTCW2L90MhPIY8wCmhLrd+lDhBUldv6e
 ywixmE/i3dceVkj48kp0tAlBlChLXH5wF+oESYnF7Z1sExiVZiF5ZxaSF2YheWEWwrIFjCyr
 GMVSC4pz01OLDQsMkSN7EyM4JWuZ7mCc+PaD3iFGJg7GQ4wSHMxKIrw1kfPihXhTEiurUovy
 44tKc1KLDzGaAgN4IrOUaHI+MCvklcQbmhoZGxtbmBiamRoaKonz/tHuiBcSSE8sSc1OTS1I
 LYLpY+LglGpgkr4dUOlzUEAuZ6Kq5BmZaWv2hdsv3nS84Wn3midHcnzNYt6Fb/OSK5rxUoAr
 dMr29E39eT1+RZaPH1r9bj8uL+U0YWOv4tfGv+a/fbr2bXn54XcLJ2eie12C9LJVQsF7dyXm
 z3Ba8kvp67ntUgue9n6M0cla174q127N+x0/Ms2SvJ6fuLxp/nIpm9yrG+42G0/RCCtYeuY0
 Y3bjtoMfstJmmlZVM/Pt6yt7N2f9jLcPVgbWnuoP4PvNycgYLKp+33zaog3hP/87/pvPenu5
 /9nJ3PNMpki+CPvNLqTd33c95vr+q20Sy04VasbM8y/9Lh4WYbZByD4h7Z7x7uDtdfoxRxIm
 vt36/Jf14dmv45VYijMSDbWYi4oTAXurVKZSBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsWy7bCSvO7m9vnxBid7zS3uz2tltNg4Yz2r
 xfwj51gtrnx9z2Yxfe8mNotJ9yewWJw/v4Hd4vKuOWwWn3uPMFrMOL+PyWLtkbvsFrcbV7BZ
 tO49wm5x+E07q8WMyS/ZHPg9Nq3qZPO4c20Pm8f97uNMHn1bVjF6fN4kF8AaxWWTkpqTWZZa
 pG+XwJXxb+tJloLfQhULn29kbmCcwN/FyMkhIWAi8fHNLLYuRi4OIYHdjBKrdxxhh0hISky7
 eJS5i5EDyBaWOHy4GKLmLaPE1/3b2EBqhAVSJZZO72YEsUUEYiROTZ7FAlLELHCCSeLjqgdM
 EB37GSU+rt0PVsUmoCWx/8UNsG5+AUWJqz8eg8V5Bewkdm38zQxiswioSHxZfg4sLioQJrFz
 yWMmiBpBiZMzn7CA2JwC1hKn1/0Fu5RZQF3iz7xLzBC2uMStJ/OZIGx5ie1v5zBPYBSehaR9
 FpKWWUhaZiFpWcDIsopRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIzhCtTR3MG5f9UHv
 ECMTB+MhRgkOZiUR3prIefFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeW8ULowTEkhPLEnNTk0t
 SC2CyTJxcEo1MAXtPJEcdTHNYkKdrVfzY8G1x8+Lsf34s1ZgUdPKk1VBC0Vfam7ODC3hudx5
 3iRy1gaG5XM+q72S61ObfmCPSOq30l1nbIP13Lc9eib5tJSry+nDw1wtoT2O1/yv1/yL3hu2
 SuFypkXVpI4drB/PX7M+LS7+tPh4vIjnigXmRZIuNp11O5V8Mr5N1JT0vr2m+n6IeXJyvYzw
 0hfZRpOb0woyddK4ldOuXt8pxXfD+2LxNKWXU2rDiwOko49FdSeUK+Y/t2C7GVG4okF6y+37
 j/4ckvj/9+F57ks/JooWOBnv03mp+V1BueLvxRDlGKPbZ+1FFu46f2S3//XWD1WnrTfnrHnl
 tSkwPCHVyra5UYmlOCPRUIu5qDgRALFFK9Q/AwAA
X-CMS-MailID: 20201102041444epcas1p21c489ffe14af8f6d59668f30464b4013
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201030125303eucas1p14a9de4111ffafc1870527abdea0994c9
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125303eucas1p14a9de4111ffafc1870527abdea0994c9@eucas1p1.samsung.com>
 <20201030125149.8227-4-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 myungjoo.ham@samsung.com, dri-devel@lists.freedesktop.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sylwester,

On 10/30/20 9:51 PM, Sylwester Nawrocki wrote:
> This patch adds registration of a child platform device for the exynos
> interconnect driver. It is assumed that the interconnect provider will
> only be needed when #interconnect-cells property is present in the bus
> DT node, hence the child device will be created only when such a property
> is present.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v7, v6:
>  - none.
> 
> Changes for v5:
>  - new patch.
> ---
>  drivers/devfreq/exynos-bus.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index 1e684a4..ee300ee 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -24,6 +24,7 @@
>  
>  struct exynos_bus {
>  	struct device *dev;
> +	struct platform_device *icc_pdev;
>  
>  	struct devfreq *devfreq;
>  	struct devfreq_event_dev **edev;
> @@ -156,6 +157,8 @@ static void exynos_bus_exit(struct device *dev)
>  	if (ret < 0)
>  		dev_warn(dev, "failed to disable the devfreq-event devices\n");
>  
> +	platform_device_unregister(bus->icc_pdev);
> +
>  	dev_pm_opp_of_remove_table(dev);
>  	clk_disable_unprepare(bus->clk);
>  	if (bus->opp_table) {
> @@ -168,6 +171,8 @@ static void exynos_bus_passive_exit(struct device *dev)
>  {
>  	struct exynos_bus *bus = dev_get_drvdata(dev);
>  
> +	platform_device_unregister(bus->icc_pdev);
> +
>  	dev_pm_opp_of_remove_table(dev);
>  	clk_disable_unprepare(bus->clk);
>  }
> @@ -432,6 +437,18 @@ static int exynos_bus_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err;
>  
> +	/* Create child platform device for the interconnect provider */
> +	if (of_get_property(dev->of_node, "#interconnect-cells", NULL)) {
> +		    bus->icc_pdev = platform_device_register_data(
> +						dev, "exynos-generic-icc",
> +						PLATFORM_DEVID_AUTO, NULL, 0);
> +
> +		    if (IS_ERR(bus->icc_pdev)) {
> +			    ret = PTR_ERR(bus->icc_pdev);
> +			    goto err;
> +		    }
> +	}
> +
>  	max_state = bus->devfreq->profile->max_state;
>  	min_freq = (bus->devfreq->profile->freq_table[0] / 1000);
>  	max_freq = (bus->devfreq->profile->freq_table[max_state - 1] / 1000);
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
