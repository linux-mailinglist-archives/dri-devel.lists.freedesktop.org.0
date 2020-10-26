Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848A22985C0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 04:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D086E176;
	Mon, 26 Oct 2020 03:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207956E176
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 03:02:47 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201026030245epoutp0333adc90629c9993f0de05aa883fccb62~Ba7SMwIbX2476824768epoutp03o
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 03:02:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201026030245epoutp0333adc90629c9993f0de05aa883fccb62~Ba7SMwIbX2476824768epoutp03o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603681365;
 bh=hknHZ+cLjuYOEjh3nIdJbQqtqS+z8612JQBoz407ctU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=CmzQJL3+wRGl/IKU2IG/Dhe5UZ3dVq5ni+0BQKi9af6rg/kY9JO6AsbfC6eF8u1cV
 +T9tNSNCmGOCnkqI0V7Z5FAuoTD9qwKbh7QTQJVynb157v09+n3raSC6NP0rkvX7xp
 kg2u7EyeLYrVwxqijw+TgwJEP93l29FTkUUY3jVc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201026030245epcas1p2a8d5d3e9eb326c4c895023ef2a850daf~Ba7RwZoyZ1357213572epcas1p2o;
 Mon, 26 Oct 2020 03:02:45 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.155]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4CKKQB5Y6bzMqYkW; Mon, 26 Oct
 2020 03:02:42 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 B1.10.09543.25C369F5; Mon, 26 Oct 2020 12:02:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201026030241epcas1p219980df0fe3d9d3dc107b02b8a4f20cc~Ba7O5mfk41794217942epcas1p2i;
 Mon, 26 Oct 2020 03:02:41 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201026030241epsmtrp26d438f82cbb8d4266fe6b3e886368b65~Ba7O4ov1m3128731287epsmtrp20;
 Mon, 26 Oct 2020 03:02:41 +0000 (GMT)
X-AuditID: b6c32a35-347ff70000002547-cd-5f963c523034
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 F1.A6.08745.15C369F5; Mon, 26 Oct 2020 12:02:41 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201026030241epsmtip10fa986889482099bb846bf373ea2a4d3~Ba7OllRRi1057310573epsmtip1Y;
 Mon, 26 Oct 2020 03:02:41 +0000 (GMT)
Subject: Re: [PATCH v6 47/52] PM / devfreq: tegra20: Silence deferred probe
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
Message-ID: <6c4169da-6648-d93b-75a6-4a41a61b7ad9@samsung.com>
Date: Mon, 26 Oct 2020 12:16:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-48-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHc24vt4Wt210BOSNkK5eYKI5HxbIjAiPTkeswG5E4t7mt3tEb
 YJS26WM6kQx5VEBBmQLaMXk4HLKZTR7KMwxsoCUiTApRgahBjENsESSW8Brt3TL++5zf+f5+
 v/P9nXMEPNFTwleQotSxGiWjoAgP/NqNzaFBeyNLZaGzP29EttlJN1RhuuWGfn0+AZB13k6g
 so56AuUYq3E0MPAHHzVN/oah/qxpPhpqLSfQXKEJoPwXRgL91fcBGj1WS6AfrpQA1P84DuV2
 mPhoZeQqjhZaL+Co4UEPEeNF2+/k8ukW4zifvn1riUfX1+UT9NhIO0HfP9GL0YXZNoIuaqwD
 9Fz9W/Hun6dGJrOMnNWIWWWiSp6iTIqi4hJkO2XS8FBJkGQ7epcSK5k0NoratSc+KDZFseaM
 En/LKPRroXhGq6VCoiM1Kr2OFSertLooilXLFert6mAtk6bVK5OCE1VpEZLQ0K3SNeHB1OTq
 ihxC7fA4vPDSBjKBQ1AA3AWQ3AazzEv8AuAhEJHNAJZa7uPcYhbAwuJRjFvMATiXswoKgMCV
 0mbRcvFWAG1lnTxnKRFpB7D3T7GTPckE2HdvxFXJi7yLw19qVwjnBo88B+BYe4CTCTIQdj65
 44q/TvrDYccEcLKQjIZ1jku4k3FyIyzvbHZpvMlPoOVazr+aN6Dl/COXxp0Mh0/bx3Guvg+8
 96gC4/hteP1ZOc95CEiecYfVDTk4Z3oXXBhrARx7wqneRj7HvnDO1kFwnA4vW0wEl5wHYGPn
 oBu3EQY7a85gzlHwyM3w99YQLuwPWxZ/Alzj16Bt/qQbNy0hzDOIOEkAHHowjnH8Jrx4PJ84
 DSjjOjvGdRaM6ywY/29WCfA6sIFVa9OSWK1ELVl/2/XA9eoDpc2g+NlMcDfABKAbQAGP8hKW
 +5XIREI5890RVqOSafQKVtsNpGsDLub5eieq1r6NUieTSLeGhYWhbZJwqURC+QiXtuTJRGQS
 o2NTWVbNav7LwwTuvpmYV9bZJXvM1MRMwv4vypK/DG7i7a1drrP1fKz3pDaVShZehlfd/Cam
 6kUWs5qYXi83tFIpi/ZYusmvY99DRVfu6Z6uLUfN1tH29pNjZ+WDk13dReaAd841KE3WEWOG
 +BW/4B3L5/13Z1raQt5riw2r2ZFe6e1RI//0RL+9cqHx7+sROk8zdugIfHjA/HVj3qULH3rZ
 /aevTBtKvi+yVtTOnMw7dvv48MXZEMOBDatLNzMjD+n0h5v2RMVFH60aNOTvDHRY7xqS9pv9
 PsrAqtQWtelq9u7HlzdlRO+j838sOHVw6kZIz/C8uMGR/bzPx7H8ZGXo/UocfWZlIwZeFX6V
 0dSySOHaZEYSyNNomX8AKyyx0X4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0hTYRyHe885nZ2tlse57LVMcxCClWVpvJGZH5QOGZR2k7BstZOFbsmO
 3Q20FFIxxXLpSVpeklo3W2bLNMHNUkttprKsdTMtKi+l1ox120bgt+fP73k+/Slc0kPMpvap
 Uli1Sp4kI0VEjVHmsyg6VBO/5Hd2MBr61j8VaU3tU9HVr30AdY0Pk+hcvZ5EGXwZgTo6qgTo
 Tv81DLWd+CJAz2pLSDSaawIoa4wnkbk1Er1Iv0yiguuFALUNRKHMepMA/e65RaCJ2gsEuv3m
 IRkuZYYtmQLmHm8VMJ3tdpzR67JI5mVPHcm8znmEMbknh0jmdLUOMKN6nw3CbaJQBZu07yCr
 Xhy2U7S3TJtBJttEhyd+DIE0YKOyAUVBOhjeb+GygZCS0AYAOzSxDoa0F9SYm3CX4gGNxn+K
 6J8yCGB/Qb/A4XjQG2Frbw/hGKS0lYAFtl7SceB0EYD2qlsCV1INYOlYnjMh6QDY8NFCOtiN
 9oPdtj7gYDEdBnW2SsLBBD0fljQYnM5Megu8V9GHuRx32FL83ukI6eXwc53VyTjtD+0XOnEX
 z4K977WYi33h3cESPB948JNyflLCT0r4SclFQOiAF5vMKROUXFDyUhV7KJCTK7kDqoTA3fuV
 euB8fUCAAdTpRgIbAUaBRgApXCYVl3gXxkvECvmRo6x6f7z6QBLLNYI5FCGbJR7nS3dI6AR5
 CpvIssms+v+KUcLZaZii06L1exXXPLyqvEyfp/L+nmpMj4vM6uJPRpwRR42/i4lwN7TAeLsh
 j8MjpGr/mOZ5OnvFroG+X4nLjt1I1WniYhIF5Tl5+UVuI982RdmuHeytl873MT0u9F17dE1N
 RWzgus3aaX7P+RUfqjUhscIZEeVTTL6Nx5/uSQn2tOZ4NlXaY66aF6Zeas4xTnjvWc+Hb181
 Kkn7aeGVY54DqZp1lqLmU9vOPnkQ2mUO84o71jRiPxMZwvx5NygixNiGmnRMtbmq0JS7uubT
 3MTz2o3uh1uDFZWcf+bnrEuRb68sZ7ozFN7h1pXd5E3f6fnRIXOCNrlNWSJiitPfmLc2sQtk
 BLdXHhSAqzn5X9u4i11pAwAA
X-CMS-MailID: 20201026030241epcas1p219980df0fe3d9d3dc107b02b8a4f20cc
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201025221928epcas1p48d77b56eaf6f05a8a5bf60dd468fdd41
References: <20201025221735.3062-1-digetx@gmail.com>
 <CGME20201025221928epcas1p48d77b56eaf6f05a8a5bf60dd468fdd41@epcas1p4.samsung.com>
 <20201025221735.3062-48-digetx@gmail.com>
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
>  drivers/devfreq/tegra20-devfreq.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
> index ff82bac9ee4e..fd801534771d 100644
> --- a/drivers/devfreq/tegra20-devfreq.c
> +++ b/drivers/devfreq/tegra20-devfreq.c
> @@ -141,11 +141,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  
>  	/* EMC is a system-critical clock that is always enabled */
>  	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
> -	if (IS_ERR(tegra->emc_clock)) {
> -		err = PTR_ERR(tegra->emc_clock);
> -		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
> -		return err;
> -	}
> +	if (IS_ERR(tegra->emc_clock))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->emc_clock),
> +				     "failed to get emc clock\n");
>  
>  	tegra->regs = mc->regs;
>  
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
