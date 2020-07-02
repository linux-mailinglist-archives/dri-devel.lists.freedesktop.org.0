Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DAD211CC7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331396EA68;
	Thu,  2 Jul 2020 07:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F786E1CE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:01:22 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200702010120epoutp04427d891ca81b406c6a55fcb7b48303cd~dycJwpW9a1823418234epoutp04a
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:01:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200702010120epoutp04427d891ca81b406c6a55fcb7b48303cd~dycJwpW9a1823418234epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593651680;
 bh=RsDj3CoPR1c7on0/7kkXlT3fnQEAu+pB1kuzaD759NE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=sPZuY5Gr2LXvyOGauwcUcac938YcV204WwXoVlVKbdP+2Cjc9dapQoPaY9lhpa4vM
 qODIMLAB1uJePTlfKieSXnlYnbYeLs4ES6PckLquMgucZCecx8Fy386keiicWYtyu5
 WxdSeqFvhPZUzYCUycQ5vyT1eBIEqUSti2zEMTD8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200702010119epcas1p4473b8c2187f17e0a003511635d125d6a~dycJCKZMZ2585225852epcas1p4_;
 Thu,  2 Jul 2020 01:01:19 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.158]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 49y0Cc3WppzMqYkZ; Thu,  2 Jul
 2020 01:01:16 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 4B.BF.18978.CD13DFE5; Thu,  2 Jul 2020 10:01:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200702010116epcas1p1e610a393c91c8ceff1bb7ed3c0ce0a42~dycGBJOBJ3155831558epcas1p17;
 Thu,  2 Jul 2020 01:01:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702010116epsmtrp1944739d7de34b50d28a2b175ea2d2f01~dycGAMQT40320003200epsmtrp1O;
 Thu,  2 Jul 2020 01:01:16 +0000 (GMT)
X-AuditID: b6c32a35-603ff70000004a22-33-5efd31dc51a9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6E.F3.08382.BD13DFE5; Thu,  2 Jul 2020 10:01:15 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702010115epsmtip21e1e4d6e06ba114440f6dab9770a9626~dycFrcvq-0995009950epsmtip2j;
 Thu,  2 Jul 2020 01:01:15 +0000 (GMT)
Subject: Re: [PATCH v4 15/37] PM / devfreq: tegra30: Add error messages to
 tegra_devfreq_target()
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <1d11b08f-eed5-ece1-462d-b18151e65777@samsung.com>
Date: Thu, 2 Jul 2020 10:12:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200609131404.17523-16-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAJsWRmVeSWpSXmKPExsWy7bCmru4dw79xBl2bpCzuz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW
 5koKeYm5qbZKLj4Bum6ZOUC/KCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKLAv0
 ihNzi0vz0vWS83OtDA0MjEyBChOyM9Y8+MVecJiz4tH102wNjJfYuxg5OSQETCR6dkxi62Lk
 4hAS2MEo8W/yTFYI5xOjxKlZD5kgnG+MEjN3f2SBadk0/TkjRGIvo0Tb651QLe8ZJZa9+MYI
 UiUskCzx5NgbsHYRgSPMEqs7j4O1MAtcZpQ42/aFDaSKTUBLYv+LG2A2v4CixNUfj8G6eQXs
 JCZ9fQV2IouAikTXxeVMILaoQJjEyW0tUDWCEidnPgG7iVPAXOLo9T6wemYBcYlbT+YzQdjy
 EtvfzmEGWSwh0M4pcXDJJ2aIJ1wkpp2/CA0DYYlXx7dA2VISL/vboOxqiZUnj7BBNHcwSmzZ
 f4EVImEssX/pZKANHEAbNCXW79KHCCtK7Pw9lxFiMZ/Eu689rCAlEgK8Eh1tQhAlyhKXH9xl
 grAlJRa3d7JNYFSaheSdWUhemIXkhVkIyxYwsqxiFEstKM5NTy02LDBEjvBNjOCkrmW6g3Hi
 2w96hxiZOBgPMUpwMCuJ8J42+BUnxJuSWFmVWpQfX1Sak1p8iNEUGMATmaVEk/OBeSWvJN7Q
 1MjY2NjCxNDM1NBQSZxXXOZCnJBAemJJanZqakFqEUwfEwenVAOTT9sJtSOy7u1nDhS0JEqc
 KLmut+HYzU/l8pGiZo//TnZ4JXv/fmvMsz+JSyr/CNxakd+5Yp9Gao5jYZDvPPMS0VnxFVG9
 sTzXTt5amW7WWMabNeP+UfU98f/ThBynblQIskrIWHr1aPaK7b+vST58ctzYnmVpVVeEQ/D9
 S3oS7ikq9d9VP7oH/P6wo8tIkfn/7ibVv5KPGk8euMUkxpL2suPBVznDXYuiH8/3O2Q0U0ok
 gK/d10POwdTF8DZTodHDw5bWCwPPStvICYs0u0b0LYw9qcETNFti2S4dX75JDz4r9XYbcgse
 qDE1nKy7NFO4Jlmk5F+dtNIWO7YlZrv82X+fUZ+SX+4gVrPjhhJLcUaioRZzUXEiAIxS6HNz
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsWy7bCSvO5tw79xBnPabSzuz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUVw2Kak5mWWpRfp2CVwZax78Yi84zFnx6PpptgbGS+xd
 jJwcEgImEpumP2fsYuTiEBLYzSjx8VwjC0RCUmLaxaPMXYwcQLawxOHDxRA1bxkl5h/ayQpS
 IyyQLPHk2BsmkISIwDFmiU2nT4M5zAKXGSV2dH5lg2jZxihxZ/c1NpAWNgEtif0vboDZ/AKK
 Eld/PGYEsXkF7CQmfX0FdhOLgIpE18XlTCC2qECYxM4lj5kgagQlTs58AnYep4C5xNHrfWD1
 zALqEn/mXWKGsMUlbj2ZzwRhy0tsfzuHeQKj8Cwk7bOQtMxC0jILScsCRpZVjJKpBcW56bnF
 hgWGeanlesWJucWleel6yfm5mxjB0a2luYNx+6oPeocYmTgYDzFKcDArifCeNvgVJ8SbklhZ
 lVqUH19UmpNafIhRmoNFSZz3RuHCOCGB9MSS1OzU1ILUIpgsEwenVAOT/HPnzltqCx4ElKSX
 PWKf/5ifye+k8MX+Uw+sZbfFWUlJqv8RvHL9sXZXt4ZBgML9Z3a/ix5F384ts320NEMk+Kr6
 5Lt7Pp7vVp97XTtxbbPmNxXj1Ts/81x0S/CfoDn9QNtu56Z/V68cnpu5c6qY7vvNPzN+eE/Y
 1D+lWpMjJ+ZC1EOz1vd/Zy2IPdhvs0t44myJlUnsHXXHTUtvdc+ZccrFynWW7HP3hj35iybJ
 ci67JaP6+kf3t+aV0RY/tRxdeavuptS/bZ1iwNr+bJPZJCWFJPfuX5kTrK1W60z1Tb1dz7ml
 7F9VOtfH4slTX2hkxDk0F+QoLznk0RrLavl2hbgwp/vahLp5sh/75p1TYinOSDTUYi4qTgQA
 9enaEV0DAAA=
X-CMS-MailID: 20200702010116epcas1p1e610a393c91c8ceff1bb7ed3c0ce0a42
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200609131710epcas1p218e720c23ae62ecf4a6f6727854d93f0
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131710epcas1p218e720c23ae62ecf4a6f6727854d93f0@epcas1p2.samsung.com>
 <20200609131404.17523-16-digetx@gmail.com>
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
> It's useful to now when something goes wrong instead of failing silently,
> so let's add error messages to tegra_devfreq_target() to prevent situation
> where it fails silently.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 13f93c6038ab..a03fb16c5c4c 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -641,12 +641,16 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
>  	dev_pm_opp_put(opp);
>  
>  	err = clk_set_min_rate(tegra->emc_clock, rate * KHZ);
> -	if (err)
> +	if (err) {
> +		dev_err(dev, "Failed to set min rate: %d\n", err);
>  		return err;
> +	}
>  
>  	err = clk_set_rate(tegra->emc_clock, 0);
> -	if (err)
> +	if (err) {
> +		dev_err(dev, "Failed to set rate: %d\n", err);
>  		goto restore_min_rate;
> +	}
>  
>  	return 0;
>  
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
