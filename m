Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7236E211CE3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59A86EA4D;
	Thu,  2 Jul 2020 07:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97846E1CE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 00:48:31 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200702004829epoutp02320034e3eea229b761c5f7aee5c3b5f8~dyQ8T6jXa1281612816epoutp028
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 00:48:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200702004829epoutp02320034e3eea229b761c5f7aee5c3b5f8~dyQ8T6jXa1281612816epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593650909;
 bh=I77Z4g8yokv4VG82pYM0RXw1CCZQHU9fQ0hoIEmNIYI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=t2BdkH4SUdFJGpl4O600JqiHfEHdDtHXGWc1oyyyv7vtoaw8Gk4eKspo6GGAwIdIM
 k3cAIecyOmgaeubi4+2vJJIJFBmCqoCMTwOvrnfq6mMsjWwJAbZ3SN9QpnB1/cTGkP
 7wIjMAtG9rVgUXhkaPOCZo2ERdZNZodGctGjFmu8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200702004829epcas1p103b066ef2ba4e6dbecf27cb2b7e61460~dyQ7p7pkJ1740417404epcas1p1X;
 Thu,  2 Jul 2020 00:48:29 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.152]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 49xzwp1xhJzMqYkZ; Thu,  2 Jul
 2020 00:48:26 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 E5.3B.29173.ADE2DFE5; Thu,  2 Jul 2020 09:48:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200702004825epcas1p33fdd93cfedaf14e3331e4b943ed7be67~dyQ3_rDbK2059920599epcas1p3d;
 Thu,  2 Jul 2020 00:48:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702004825epsmtrp13dd5c1d03d0937c96bce740a77b5493b~dyQ39riMf2782827828epsmtrp1E;
 Thu,  2 Jul 2020 00:48:25 +0000 (GMT)
X-AuditID: b6c32a37-9b7ff700000071f5-fc-5efd2edafb71
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AF.D2.08382.8DE2DFE5; Thu,  2 Jul 2020 09:48:24 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702004824epsmtip2b64ef5cd823d2a5cb8525b53f607b606~dyQ3tQXm50823308233epsmtip2k;
 Thu,  2 Jul 2020 00:48:24 +0000 (GMT)
Subject: Re: [PATCH v4 11/37] PM / devfreq: tegra30: Silence deferred probe
 error
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <136b430d-2097-7b2b-d7dd-b438deee8f5d@samsung.com>
Date: Thu, 2 Jul 2020 09:59:40 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200609131404.17523-12-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNJsWRmVeSWpSXmKPExsWy7bCmvu4tvb9xBk0HeSzuz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW
 5koKeYm5qbZKLj4Bum6ZOUC/KCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKLAv0
 ihNzi0vz0vWS83OtDA0MjEyBChOyMz52iBV85q442nuVrYHxImcXIweHhICJxNPv5l2MnBxC
 AjsYJRqusXQxcgHZnxglJv2bBuV8A0o0fGcCqQJp+P77EzNEYi+jxOttX6Gc94wSH19OYAap
 EhYIljj2+hI7SEJE4AizxOrO44wgDrPAZUaJs21f2ECq2AS0JPa/uAFm8wsoSlz98ZgR5Che
 ATuJW/9kQMIsAioSD2feZgSxRQXCJE5uawGzeQUEJU7OfMICUs4pYC5x8WcMSJhZQFzi1pP5
 TBC2vMT2t3PAjpMQaOeUmLdoL9QLLhIXtr5ghLCFJV4d38IOYUtJvOxvg7KrJVaePMIG0dzB
 KLFl/wVWiISxxP6lk5lAFjMLaEqs36UPEVaU2Pl7LiPEYj6Jd197WCHhyyvR0SYEUaIscfnB
 XagTJCUWt3eyTWBUmoXkm1lIXpiF5IVZCMsWMLKsYhRLLSjOTU8tNiwwRo7rTYzgVK5lvoNx
 2tsPeocYmTgYDzFKcDArifCeNvgVJ8SbklhZlVqUH19UmpNafIjRFBi+E5mlRJPzgdkkryTe
 0NTI2NjYwsTQzNTQUEmc19fqQpyQQHpiSWp2ampBahFMHxMHp1QD09m/YpxLErenxl30Fuz+
 xP7N7fiN9UsllRUrj2YzH/7GU1ns45xUq3t2zj/xnv9LvWb0iC0V3VebMtPcpDxtCaMBi4SH
 ddPZP3kzvff96O9eOcX8dMKS/nvPdj6d/WEN3+5TP9lsGf8l+zAsDZHh3XM/bkpxcLvF2aw1
 sZU81gbvlnpkbXqt5SWS/XnVkuP3LvAJePF8fsOioPNY4vwB42e3I3sdS5X/CMScKp16z35d
 7Lnz4pk1ey38gl7lnN7GzNWdoaW+WlHa5tmyPNlFVl/L1xjP4cwuVTM+aO07nenxdVO7LIGk
 9RKX/gqabpTmjjJ6o7t6z/FDTNrv2vt6JUsyD5kIifDf2xrZOXeWEktxRqKhFnNRcSIAt0jh
 ym4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsWy7bCSvO4Nvb9xBp3rbCzuz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUVw2Kak5mWWpRfp2CVwZHzvECj5zVxztvcrWwHiRs4uR
 k0NCwETi++9PzF2MXBxCArsZJV5/XscGkZCUmHbxKFCCA8gWljh8uBii5i2jxJc5e1hBaoQF
 giWOvb7EDpIQETjGLLHp9GkmEIdZ4DKjxI7Or2wQLdsYJda1TGECaWET0JLY/+IG2Ap+AUWJ
 qz8eM4Ks4BWwk7j1TwYkzCKgIvFw5m1GEFtUIExi55LHYK28AoISJ2c+YQEp5xQwl7j4MwYk
 zCygLvFn3iVmCFtc4taT+UwQtrzE9rdzmCcwCs9C0j0LScssJC2zkLQsYGRZxSiZWlCcm55b
 bFhgmJdarlecmFtcmpeul5yfu4kRHNdamjsYt6/6oHeIkYmD8RCjBAezkgjvaYNfcUK8KYmV
 ValF+fFFpTmpxYcYpTlYlMR5bxQujBMSSE8sSc1OTS1ILYLJMnFwSjUwTcjuWKBpzxi+/1/V
 tIlBqjocnw36Xzq805E4Pb/pFfNj/54tH4z7G4ImPK0rXPos2rAsYZ5k8cyUuUuUG2UjAu5e
 2MR31FzzyWr3wLk5D76WLLx8UVNM9ZhlqfH0maeZPgUxCm+wZ+x0+Mcs8yJ2+ZtFQfU/ryjx
 rIvgvFsavLMo//P0dBblb5/KBbbKdOSHNATazRcLNthqVLX70hy1m8mLDzLslf7Uwt55YsEB
 hnlG9b96Dy64ujmO05QhWOEg5wGTPPU7LlvZHlw7ldD3apFmeaGSu7P6LtH63hkvPC/JH9tW
 n7/Gw0fcatkSlWJbexaRmZkiDyJL77Vt2ptg6GfTbidlcXlpxvVFU3uUWIozEg21mIuKEwGn
 KlUGWgMAAA==
X-CMS-MailID: 20200702004825epcas1p33fdd93cfedaf14e3331e4b943ed7be67
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200609131843epcas1p3a5b06308559ff03ef1b27521f412b656
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131843epcas1p3a5b06308559ff03ef1b27521f412b656@epcas1p3.samsung.com>
 <20200609131404.17523-12-digetx@gmail.com>
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

Hi,

On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
> Tegra EMC driver was turned into a regular kernel driver, it also could
> be compiled as a loadable kernel module now. Hence EMC clock isn't
> guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER and
> there is no good reason to spam KMSG with a error about missing EMC clock
> in this case, so let's silence the deferred probe error.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index e94a27804c20..423dd35c95b3 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -801,9 +801,12 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	}
>  
>  	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
> -	if (IS_ERR(tegra->emc_clock)) {
> -		dev_err(&pdev->dev, "Failed to get emc clock\n");
> -		return PTR_ERR(tegra->emc_clock);
> +	err = PTR_ERR_OR_ZERO(tegra->emc_clock);
> +	if (err) {
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to get emc clock: %d\n",
> +				err);
> +		return err;
>  	}
>  
>  	err = platform_get_irq(pdev, 0);
> 

As I commented on patch10, I recommend that you add the Tegra EMC driver
commit information into patch description and Looks good to me.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
