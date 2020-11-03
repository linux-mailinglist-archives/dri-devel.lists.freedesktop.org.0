Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE452A41E7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD616EC16;
	Tue,  3 Nov 2020 10:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975C46EC16
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:31:21 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201103103119epoutp04a85e2b48948c6f15110fac2b368a916b~D_NN3KcON0777207772epoutp04H
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:31:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201103103119epoutp04a85e2b48948c6f15110fac2b368a916b~D_NN3KcON0777207772epoutp04H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604399479;
 bh=FW4v5Qk+v0rEB3R/uVy5H75voYSsQhwx6F256sIO5Vk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Cb1guEW6V/c1PPxGlW5E7v0b4qZ80+fL9lUMb4Ue0Mc8uxvDHq9p1XLneWOzFQpKZ
 Rj0dIhnvbQXO8WCgU4MjAdUaSRqmLUZw0b3JikmxFxmX4EGDTGP1psEvLA072vjkmb
 nBBO2it2hRWcBJRi8LGlxwgCBeObrXWmvXRzOAPY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201103103118epcas1p2dff3d380e9e3f7a5aafb8effa2c4eb95~D_NNaz_HY1937119371epcas1p29;
 Tue,  3 Nov 2020 10:31:18 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4CQR042j80zMqYkY; Tue,  3 Nov
 2020 10:31:16 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 DD.1B.09577.47131AF5; Tue,  3 Nov 2020 19:31:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20201103103115epcas1p43681a136582c659db56bcb9d13b5af35~D_NKbm0cU1841018410epcas1p4v;
 Tue,  3 Nov 2020 10:31:15 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201103103115epsmtrp214d83039b80e993159fa9bf99aa08989~D_NKavn-Y2534225342epsmtrp2R;
 Tue,  3 Nov 2020 10:31:15 +0000 (GMT)
X-AuditID: b6c32a39-c13ff70000002569-55-5fa1317465aa
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.5B.08745.37131AF5; Tue,  3 Nov 2020 19:31:15 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201103103115epsmtip22f3e2821c707d5a32a84c9c4b3114954~D_NKHX9DZ0628706287epsmtip21;
 Tue,  3 Nov 2020 10:31:15 +0000 (GMT)
Subject: Re: [PATCH v7 3/6] PM / devfreq: exynos-bus: Add registration of
 interconnect child device
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, georgi.djakov@linaro.org,
 krzk@kernel.org
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <522dd3d8-7c76-92c6-ab1e-7e04797b3e9f@samsung.com>
Date: Tue, 3 Nov 2020 19:45:13 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201030125149.8227-4-s.nawrocki@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmgW6J4cJ4g+Z/Ahb357UyWmycsZ7V
 Yv6Rc6wWV76+Z7OYvncTm8Wk+xNYLM6f38BucXnXHDaLz71HGC1mnN/HZLH2yF12i9uNK9gs
 WvceYbc4/Kad1WLG5JdsDvwem1Z1snncubaHzeN+93Emj74tqxg9Pm+SC2CNyrbJSE1MSS1S
 SM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMATpXSaEsMacUKBSQWFys
 pG9nU5RfWpKqkJFfXGKrlFqQklNgWaBXnJhbXJqXrpecn2tlaGBgZApUmJCd8fbBVsaCE8IV
 PU+mMjcwHufvYuTkkBAwkVj4djpbFyMXh5DADkaJXS/+QzmfGCVuLpjCBOF8ZpT4tu89excj
 B1hL8087iPguRonmNZegit4zSty+tIQNZK6wQKrE0undjCANIgIxEuvfRYCEmQVOMEkcuSMI
 YrMJaEnsf3EDrJxfQFHi6o/HYOW8AnYSL1fkgZgsAioSE3/6gVSICoRJnNzWwghi8woISpyc
 +YQFxOYUsJY4ve4vO8R0cYlbT+YzQdjyEtvfzmEGuUxC4AaHxNLnbcwQH7tI9G+YyAZhC0u8
 Or6FHcKWkvj8bi9UvFpi5ckjbBDNHYwSW/ZfYIVIGEvsXzqZCeQ4ZgFNifW79CHCihI7f89l
 hFjMJ/Huaw8rJKh4JTrahCBKlCUuP7jLBGFLSixu72SbwKg0C8k7s5C8MAvJC7MQli1gZFnF
 KJZaUJybnlpsWGCKHNWbGMHpWMtyB+P0tx/0DjEycTAeYpTgYFYS4a2JnBcvxJuSWFmVWpQf
 X1Sak1p8iNEUGL4TmaVEk/OBGSGvJN7Q1MjY2NjCxNDM1NBQSZz3j3ZHvJBAemJJanZqakFq
 EUwfEwenVAOT/8FbWdv2r773ueorl8/O3+77ak8tUq0vvMez8PkETmOO4I7vNrVx0XG7957r
 m3BF/nzjvZ16U1dsUnWT9lqUXeMYOE1DsOzVwTUvFlwV6y/kNHs+MfSt07TrTY7GmyQfH0zj
 eCxT7R3CdH3XTN/qoxPSlZV06/NvBa5yT1yWy1rqt02ks91X7riIV5LYi9W7w7bvvyJXYdYv
 lLzvJWviv13fZJRzUzTOt/QeWq79U07vVkjkmtfTTWJua66y4epwZi5iv3qWPXVeWNKfwGrB
 U4sSU814zqbMjuObppzD7TpJqrX/9NL5h42Orvk660XR3pe/7x/SOuDY9rQiJ6934SOWi+Yr
 TV5NDzjls9NaiaU4I9FQi7moOBEAdgb88lAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsWy7bCSvG6x4cJ4g92nVC3uz2tltNg4Yz2r
 xfwj51gtrnx9z2Yxfe8mNotJ9yewWJw/v4Hd4vKuOWwWn3uPMFrMOL+PyWLtkbvsFrcbV7BZ
 tO49wm5x+E07q8WMyS/ZHPg9Nq3qZPO4c20Pm8f97uNMHn1bVjF6fN4kF8AaxWWTkpqTWZZa
 pG+XwJXx9sFWxoITwhU9T6YyNzAe5+9i5OCQEDCRaP5p18XIxSEksINRYu+k++xdjJxAcUmJ
 aRePMkPUCEscPlwMUfOWUeLkzhNsIDXCAqkSS6d3M4LYIgIxEqcmz2IBKWIWOMEk8XHVAyaI
 jv2MEh/X7gerYhPQktj/4gZYN7+AosTVH48ZQTbwCthJvFyRB2KyCKhITPzpB1IhKhAmsXPJ
 YyYQm1dAUOLkzCcsIDangLXE6XV/we5kFlCX+DPvEjOELS5x68l8JghbXmL72znMExiFZyFp
 n4WkZRaSlllIWhYwsqxilEwtKM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAiOTS2tHYx7Vn3Q
 O8TIxMF4iFGCg1lJhLcmcl68EG9KYmVValF+fFFpTmrxIUZpDhYlcd6vsxbGCQmkJ5akZqem
 FqQWwWSZODilGpjmVYT9Xn06KjNK1XR5z0dRe2Obo9M5PQUShU7PnGr8ctNjtwjdv3MKk4w+
 alwx+NztdVOHZzrz/h1cDDKr+41v/antlRKN6fbsXviu0C7ZeEECB0+326GlEm07z5x0N533
 k+NGu9jfBQVRu7J2bBBq4ftz77jXUaWNRnNdMx+fF/nvUTnfWEyE+UKStf/m/oNmE16f/b/2
 0ILvml2ya6smRkcL3Vxp0ynwnHXG25rMU79UymY38+4+kNijLOiQ+u7hdB27tyeeHdGamTgl
 uOjds7kJlaGtF9XPsV7YrsTk8FJkvmDu+VUZ97WrzhnUVkbY/hSsFiiykhV40TTJKjZQ/Y/u
 FzG2uMI7WU19q5VYijMSDbWYi4oTAYw9etM8AwAA
X-CMS-MailID: 20201103103115epcas1p43681a136582c659db56bcb9d13b5af35
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

We don't need to  add 'select INTERCONNECT_EXYNOS' in Kconfig?
Do you want to remain it as optional according to user?

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


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
