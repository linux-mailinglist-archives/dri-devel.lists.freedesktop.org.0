Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0BD2985C4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 04:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D7B6E17C;
	Mon, 26 Oct 2020 03:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD226E17C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 03:04:03 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201026030401epoutp0439b14fff9742ee8b16b3b8232f8f316c~Ba8ZHZZme1358513585epoutp04Q
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 03:04:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201026030401epoutp0439b14fff9742ee8b16b3b8232f8f316c~Ba8ZHZZme1358513585epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603681441;
 bh=y609irCBYybY+9S/rFRyWytQWA30gaNleBpJh3UjY/s=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=B+j+f/mTPpYWk80KMTVQHIzPeAl16vsiFp2QZPyZOtPv+nCVoM3rKsTmnOYcoNSpc
 4ARUG9IABdIrsakdk5bgb7Nwk2kPRSS07tpi+Vk1+OBQmwUviL5HtnMhAt3cTEeVu1
 kBFUtjEORuyALk/dQy6gPB6kymy0+SN1TmDWIx9g=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20201026030400epcas1p4a0edb4057a394c5039a6e82ca71b9c9f~Ba8YeFwP80689906899epcas1p4I;
 Mon, 26 Oct 2020 03:04:00 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.155]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4CKKRb6P24zMqYlp; Mon, 26 Oct
 2020 03:03:55 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 42.54.10463.B9C369F5; Mon, 26 Oct 2020 12:03:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201026030355epcas1p19fc746c6b362de310863b725c7a1583b~Ba8TRuN9H1859618596epcas1p1f;
 Mon, 26 Oct 2020 03:03:55 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201026030355epsmtrp253dd774871f3ce099a89186dd3876bcc~Ba8TQs7X-3146731467epsmtrp22;
 Mon, 26 Oct 2020 03:03:55 +0000 (GMT)
X-AuditID: b6c32a38-efbff700000028df-0d-5f963c9b2ab1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 EF.B6.08745.B9C369F5; Mon, 26 Oct 2020 12:03:55 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201026030355epsmtip170465f0d872a33a00bf7309ed66a01dc~Ba8S_Ixc51238112381epsmtip1e;
 Mon, 26 Oct 2020 03:03:55 +0000 (GMT)
Subject: Re: [PATCH v6 50/52] PM / devfreq: tegra30: Silence deferred probe
 error
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>, Viresh Kumar <vireshk@kernel.org>, Peter Geis
 <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Krzysztof
 Kozlowski <krzk@kernel.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <0bbf89ed-c8ac-86a8-8ed4-b5a887c82656@samsung.com>
Date: Mon, 26 Oct 2020 12:17:44 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-51-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxjO6cdtQequgOsZcYiX+EMWPiq0OzhgKmoqbguJYQyTURt60xJK
 W3vBjKnRKUqhfqJWaUEcRkE2h5SOYS2gDGE1KahsDhw4UDAEbetaiajI1vZixr/nfd/nOc95
 zgeXGerEIrj5qiJSq5IqCSyY1frrqthYU4pBkuCYjkcuzwQb1Xb3sdEP/zwG6PdpN4bOtJsx
 VGqsY6H+/qsc9PPEjwzk2P+Mgwas1RjyHukGqPyFEUN3b29Ef33XgKHKK6cBcjzZgg62d3PQ
 3P1mFnplPcdCLaM92NpwsXvwIEd8zTjCEd/rm2WKzY3lmHj4vg0T/63vZYiPHHBh4qOWRiD2
 miMzg7YVpChIqYzURpGqPLUsXyVPJbZslaRLhKIEQawgGX1MRKmkhWQqseGzzNhN+UpfMiJq
 p1RZ7GtlSimKiE9L0aqLi8gohZoqSiVIjUypSdbEUdJCqlglj8tTF64RJCSsFvqI2wsUh6/f
 wTStwd/0mc4x94FebgUI4kI8CT5xlLIqQDA3FG8D8EKFjUEXHgDbTriZdOEF8OkNJ+udpKm2
 jU0PrACWew5x6MIN4OQjJ9PPCsO3QltjS0Aejg+xYH3DHOYfMPGzAA7bov0Yw2Ng5+RgoP8e
 vgL+MfMY+DEPT4OVnVfZfszCV8LKA5cC1kvxL6G9tXSeswTaq8YD/SBcBL3HugC9Ph8+GK9l
 0Hg5/MVZHdgExE1B8PKQi0ln2AArn7sZNA6DU70WDo0joNfVjtF4F7xs78ZosQ5AS+cdNj1I
 hJ0XT/rEXJ/DKthkjafbK+C1NzXzm1gMXdOH2X4KxHlQdyiUpkTDgdGRedsP4IWycuw4IIwL
 4hgXRDAuiGD83+w8YDWC90kNVSgnKYEmaeF9m0Hg3cegNlDjfB7XBRhc0AUgl0mE86qXnZaE
 8mTSkm9JrVqiLVaSVBcQ+g74BDNiaZ7a93FURRKBcHViYiJKEoiEAgHB581+pJOE4nJpEVlA
 khpS+07H4AZF7GMkzvbXZ9uzDX296z7xOLFnjpAe5ZvolumqAffU0Fy2fqT5bmrGZtv6TZst
 ux0dbz3DP6muK08dd6XpqP2m8pwMvVN4Pv3fY7dq5rI8ubtE5gfrVzoMX5BjY5HbZ/iURa59
 HTdrAovedq7r7/E8OhnXccpl8E6m75F9pX/qrVIsurf7e5Ooh0rW38hcw3lpiHSGYU32ZR+q
 tkUG71Xk6MjI0dyykJKch7Li3FaUUS+37uhQH9UvnqlLizU7GfyHhu7JSxO1dSVLNoqzbn76
 9ctXn4/uEI1ZdPXjU2Vw8JY8hC/Kar742rbnN+uV8YabMYq1Yzv/tJ9d/mJvOu928nI+waIU
 UkEMU0tJ/wOPD6awgAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsWy7bCSnO5sm2nxBh8XC1q8+/SU1WL+kXOs
 Fqs/Pma0uPL1PZvF9L2b2CxaZi1isTh/fgO7xdana5gszja9Ybe4vGsOm8Xn3iOMFp1fZrFZ
 XDzlanG7cQWbxaS1Uxktzj7ztmjde4Td4t+1jSwWP3fNY7HY/OAYm4OIx/sbreweO2fdZfe4
 dO4Ps8emVZ1sHneu7WHzuN99nMmjt/kdm0ffllWMHp83yQVwRnHZpKTmZJalFunbJXBl9Oy+
 wFawjavi3Ox5zA2Mxzm6GDk5JARMJNbP38HaxcjFISSwg1Hi08Sp7BAJSYlpF48ydzFyANnC
 EocPF0PUvGWUuDfzDitIjbBAsMSeVZuZQRIiAndZJCb9uMUG4jALzGCU+LNhIztEyxZGidZZ
 29hAWtgEtCT2v7gBZvMLKEpc/fGYEcTmFbCTmLR/A9hYFgFViUnNy1hAbFGBMImdSx4zQdQI
 Spyc+QQszilgJvG5/xBYL7OAusSfeZeYIWxxiVtP5jNB2PIS29/OYZ7AKDwLSfssJC2zkLTM
 QtKygJFlFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcORrae1g3LPqg94hRiYOxkOM
 EhzMSiK8c2SmxgvxpiRWVqUW5ccXleakFh9ilOZgURLn/TprYZyQQHpiSWp2ampBahFMlomD
 U6qBqfAr08dfM9+vSv8SZn8lav9m1SMR3ncqXTdGCr2Y7/HoYYhpjUYW46ypwc2cB0ov8R3c
 GxVTJuDyWremXlMn6sYiLSc559e/Imq/u3tkRDhN73902n1L6tWUhXIOcpY7dz2W3maVJPi/
 uWvKm4OCsxMbNvoZPGl/2/C9/N7ykpf/VK45vJ0clJ8udZqhjsmmK5xFQVL14Ofz88z1I7mP
 9vMvmZV1t/c+a/FEjok+AW1z/veZGT5+XzXT7e7swuvdOTkPbna1h9TMO9e7aUrvFON3278F
 vhOt1Z1QFbau7mL8n8uVaU5FhcXyYlr9lYa9ZhrWp9S+MUd+vLm8X8D/0ORlD1QyNopezE2W
 WVGrxFKckWioxVxUnAgA7YsTrGsDAAA=
X-CMS-MailID: 20201026030355epcas1p19fc746c6b362de310863b725c7a1583b
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201025222140epcas1p28ff3c4dc35d4b524185fe46c98617d8d
References: <20201025221735.3062-1-digetx@gmail.com>
 <CGME20201025222140epcas1p28ff3c4dc35d4b524185fe46c98617d8d@epcas1p2.samsung.com>
 <20201025221735.3062-51-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/26/20 7:17 AM, Dmitry Osipenko wrote:
> Tegra EMC driver was turned into a regular kernel driver, meaning that it
> could be compiled as a loadable kernel module now. Hence EMC clock isn't
> guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER.
> Let's silence the deferred probe error.
> 
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index f5e74c2ede85..3f732ab53573 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -801,10 +801,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	}
>  
>  	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
> -	if (IS_ERR(tegra->emc_clock)) {
> -		dev_err(&pdev->dev, "Failed to get emc clock\n");
> -		return PTR_ERR(tegra->emc_clock);
> -	}
> +	if (IS_ERR(tegra->emc_clock))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->emc_clock),
> +				     "Failed to get emc clock\n");
>  
>  	err = platform_get_irq(pdev, 0);
>  	if (err < 0)
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
