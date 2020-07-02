Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1FE211CEE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73096EA8E;
	Thu,  2 Jul 2020 07:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FEA6E1CE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 00:45:06 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200702004504epoutp010aedaca44822d67c6e7e56e31add6449~dyN9CeLw91705117051epoutp01R
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 00:45:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200702004504epoutp010aedaca44822d67c6e7e56e31add6449~dyN9CeLw91705117051epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593650704;
 bh=cr1O3j0g2Qo31hxYu1nd+OKIhFic8UjzEN5/LrLf1Rg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=BW5hWve/DGwbURL4rnA3BbmktMggL9hcf6OpJpX0ekc/FH42UcvsO4zWSdDpowEp9
 hi6X75NDnOoq2AXT8B9NJWlhTkURU7yhEXB6l+HX9cN5eFRtBz20T5bsnke1XtWCHd
 YxgtPJQEZesAoDw/gvQt+QuHXcmstGpwkBEeyttE=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200702004503epcas1p487e96ff72e39c320da2c74cd5f44c81e~dyN8e4WAR1635916359epcas1p4L;
 Thu,  2 Jul 2020 00:45:03 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.154]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 49xzrp6tKbzMqYkh; Thu,  2 Jul
 2020 00:44:58 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 EB.C8.19033.A0E2DFE5; Thu,  2 Jul 2020 09:44:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200702004458epcas1p4fdfcf011b6e880ad886ad5022a51c6b5~dyN3RyhPq1281412814epcas1p46;
 Thu,  2 Jul 2020 00:44:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200702004458epsmtrp244a74758c68d61794b2991b37abc29b9~dyN3Q1iT62661626616epsmtrp2k;
 Thu,  2 Jul 2020 00:44:58 +0000 (GMT)
X-AuditID: b6c32a36-16fff70000004a59-06-5efd2e0adc0c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2E.62.08382.A0E2DFE5; Thu,  2 Jul 2020 09:44:58 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702004457epsmtip27c5c6690082e9279945405425055c242~dyN27uuPo0248402484epsmtip2Q;
 Thu,  2 Jul 2020 00:44:57 +0000 (GMT)
Subject: Re: [PATCH v4 10/37] PM / devfreq: tegra20: Silence deferred probe
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
Message-ID: <14271aed-5fb6-14e1-3fe9-ef8d0c5013c4@samsung.com>
Date: Thu, 2 Jul 2020 09:56:13 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200609131404.17523-11-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxbZRTH9/S2ty2xeCkwHnDOcl3MwFFaoOxiAGWWpRM/oE00EKVc6V1L
 KG1ti3HDOOaAAXMbYAax4UVGpttFFBDYAEkVOhE7cIhuOEeQbEsWBmVQIEh5sZfrIt9+55z/
 ec7zf14EiPguGibINdooi5E04Kgft3swQhblJ93Ikn21EE9MNZQAwr34gEc0Okd5RMvCPUD8
 vjyPErX9HShRbL/IJUY+meUT4711KOE56wRE+ZIdJcZ+SSX+OnkZJapbLwCipN/JJzZvtXOJ
 f3obuK8EqOYnSviqHvskX/Xb6Dqi6qDLUdXdW9+jqqkzQxzV2VNuVHWukwYqT8fedGFmXqKe
 IrWURUIZc0zaXKMuCU9Ta17VKOJl8ih5AnEQlxjJfCoJV76eHnU41+Dzgks+IA0FvlQ6abXi
 0cmJFlOBjZLoTVZbEk6ZtQZzgllqJfOtBUadNMeU/5JcJotR+ITZefqapla++cunPuw4uQ6K
 wKqwAggFEIuDffQWtwL4CcTYNQCdS8UoGywCOOf91VcR+IIVAMvUTxoqr6zyWE2/T1Pv5rPB
 PIDfVQ8CRhWIqWHVSBGHKQRhTgS2lA8BJkCwcQBHSpdQRoVikdDxcGKbn8bC4R+r9wAzToQl
 w4keKYNcbB+kG3WMIhh7Cw53F2+vL8IC4PDn97kMC7GD8Mz1qm1GsBB4534jh+Xn4NW5OoQZ
 C7HTQvhwbYbHWlDC881uhOVAODPUyWc5DHrc/SjLhfDKsBNlm8sA7HTc/K85FjoufcZhNodg
 EfDb3mg2HQ57vPWAHewP3cuf8hgJxESwrFTMSp6H439PclgOhc2ny9FKgNt32LHvsGDfYcH+
 /7AvAJcGuymzNV9HWeXmmJ2X3QG2n3lk/DVQPfdYOgA4AjAAoADBg0Qu2VqWWKQljx2nLCaN
 pcBAWQeAwne+VUhYcI7J90+MNo1cERMbG0vEyeMVcjkeInphz80sMaYjbVQeRZkpy5M+jkAY
 VsRRa7C2RbV4zLSnatKh/TlVeWgz5TD6zZvn0LU3dqXVuVxdqWl9ouQMerHtz0T/Gcsjmk//
 uEA79tbMqh0es3+hVOPav//r68H2hEy361hpSfTK7refIT9W/FAW8K6iqcKgHFghpyOOntg4
 HvJic1xzXebRef+Qxx6n9/bw7YQJfXpx60dHTsWk0jemKqcz0KbR0PRlUb9/xXsP4qPf2djQ
 SW5o/Vyh2RcXa81Bms1pXeedjJSJ2Z9Wp5Nrsr319L7C9iOlDYFL3M2xwdcu99Ve0K8HeVu2
 HmWEv9wGU94353SfuBqKHUAOrbRXI7s4q13K4vADEaEziZeehetb3ugunGvVk/JIxGIl/wX8
 QUYkbwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsWy7bCSvC6X3t84gxOfmC3uz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUVw2Kak5mWWpRfp2CVwZ0xauZS9YxlOxqfEPYwPjD84u
 Rk4OCQETiQkrf7B2MXJxCAnsZpR4eukuI0RCUmLaxaPMXYwcQLawxOHDxRA1bxkl7uzfDVYj
 LBAsMfFsAxNIQkTgGLPEptOnwRxmgcuMEjs6v7JBtGxjlJh+ahkbSAubgJbE/hc3wGx+AUWJ
 qz8eM4Ks4BWwk7ixUw/EZBFQkVg1Px2kQlQgTGLnksdMIDavgKDEyZlPWEBsTgFzie6jE8Fs
 ZgF1iT/zLjFD2OISt57MZ4Kw5SW2v53DPIFReBaS9llIWmYhaZmFpGUBI8sqRsnUguLc9Nxi
 wwLDvNRyveLE3OLSvHS95PzcTYzgyNbS3MG4fdUHvUOMTByMhxglOJiVRHhPG/yKE+JNSays
 Si3Kjy8qzUktPsQozcGiJM57o3BhnJBAemJJanZqakFqEUyWiYNTqoFp+cSdUo++b9nbpR7J
 8GTClhVp4jMu2T2dbmb32S2v+3+k9LHPzt6lLMVFPq/qPDyPvP4UPVNCZcVNeUm9Z/JH15fO
 MsnJ0n78qfpisHD7zn0Xrgitdp5Q/f27d/wi81huBddtrBGJC2K0epkO5DZP81LIO8qs8Gum
 M1NDySNe90iul6yXTnybu4LnbNKjydv109xCaxdc756SGzxPTPDJh6iT2/O4TudlZO6OutCd
 xn/R6uzEI2E3JaU2FL32ifkdv1DuQNhNT80tM+Rac9mlYiRXXta4IFPxZ2n0kxUdjOlyM2dW
 Xeq/rJA9Y76yz/e536XZX2jNUufS31pR++D8GaO485qXjv1JnsMokf5HiaU4I9FQi7moOBEA
 1HYv0lsDAAA=
X-CMS-MailID: 20200702004458epcas1p4fdfcf011b6e880ad886ad5022a51c6b5
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200609131843epcas1p352d1dfcbca81988d3363036d762dd47f
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131843epcas1p352d1dfcbca81988d3363036d762dd47f@epcas1p3.samsung.com>
 <20200609131404.17523-11-digetx@gmail.com>
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

Hi Dmitry,

On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
> Tegra EMC driver was turned into a regular kernel driver, it also could
> be compiled as a loadable kernel module now. Hence EMC clock isn't

Looks good to me. But, you better to add the commit information
about Tegra EMC driver with commit-id ("patch title") format
into patch descritpion.

> guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER and
> there is no good reason to spam KMSG with a error about missing EMC clock
> in this case, so let's silence the deferred probe error.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra20-devfreq.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
> index ff82bac9ee4e..6469dc69c5e0 100644
> --- a/drivers/devfreq/tegra20-devfreq.c
> +++ b/drivers/devfreq/tegra20-devfreq.c
> @@ -141,9 +141,11 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  
>  	/* EMC is a system-critical clock that is always enabled */
>  	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
> -	if (IS_ERR(tegra->emc_clock)) {
> -		err = PTR_ERR(tegra->emc_clock);
> -		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
> +	err = PTR_ERR_OR_ZERO(tegra->emc_clock);
> +	if (err) {
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to get emc clock: %d\n",
> +				err);
>  		return err;
>  	}
>  
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
