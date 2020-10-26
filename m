Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 460A72985CB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 04:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0076E17A;
	Mon, 26 Oct 2020 03:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5496E17A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 03:05:01 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201026030459epoutp011977632be6b0e4c6a9b181f0c6246a29~Ba9O3gf512195021950epoutp01J
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 03:04:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201026030459epoutp011977632be6b0e4c6a9b181f0c6246a29~Ba9O3gf512195021950epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603681499;
 bh=rAZaAtl0r+2j3+7h7buuCLddDxaE+Tu5embt/8DbLeM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=c1tQLd+9imhZcPg8IUNDv1t6aZvlMYch4tcQj8xStqRSQUwqMTn5H+etHhcldZkwW
 rQgVAXEWmW8udwpWp0F+N48R7jpgCLZicrtXo3Qsy9UsPef+ryc2G8XvXpt292EF8S
 /9X+tYByjw4DjPM6sY6X+vXCMhWde7UA8AoL3VrI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20201026030458epcas1p4a73df2f922afcf80e796270b60e333c5~Ba9OLNylC3146231462epcas1p4G;
 Mon, 26 Oct 2020 03:04:58 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4CKKSm13GxzMqYkV; Mon, 26 Oct
 2020 03:04:56 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 8A.60.09543.7DC369F5; Mon, 26 Oct 2020 12:04:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201026030455epcas1p160c95fac388080dbadb353ae61526110~Ba9LjnbOE3236632366epcas1p1-;
 Mon, 26 Oct 2020 03:04:55 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201026030455epsmtrp279ae4c0cd9936ee26a3e60a6795033fb~Ba9LipXCr3214132141epsmtrp2Z;
 Mon, 26 Oct 2020 03:04:55 +0000 (GMT)
X-AuditID: b6c32a35-35dff70000002547-ff-5f963cd75e98
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 6D.D6.08745.7DC369F5; Mon, 26 Oct 2020 12:04:55 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201026030455epsmtip2303f08a45d26ce44df9d951ca26fc758~Ba9LPreLg1892518925epsmtip2F;
 Mon, 26 Oct 2020 03:04:55 +0000 (GMT)
Subject: Re: [PATCH v6 48/52] PM / devfreq: tegra20: Relax Kconfig dependency
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
Message-ID: <c38862ec-cca5-39c8-25b2-327cbd0bd6a8@samsung.com>
Date: Mon, 26 Oct 2020 12:18:45 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-49-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te1BUVRz23Lt79y62eVtRT2QFl4rhvSvsckBwrFhnVSjSGaeaZFvhthDs
 Y3YhezATKhCPNJEBYVsewlC2sIgroTAgtqwJziAG4YBAbKJMJS7GRoEyFMvFif++33e+7/x+
 33mQuPA+4UWmajIYvUaZThMenNZu/+Dg4egyhaj2Jo6cs/e4qNp+g4sa/pwE6Oe5GQKd7rQS
 KMdYy0H9/c089P29Rgz1HZ3mocF2E4Fcx+0AFfxlJNBP12Vo9MhZAp2ylALUN7UX5XbaeWjp
 1nkOWmiv4qALjh+JnZ7ymeFcnrzNOM6TD9xYxOVWcwEhH7vVQcgniq5h8uPHnIT8RIsZyF3W
 FxL476ZFpzDKZEbvzWiStMmpGlUMvXe/4nWFRCoSB4sjUQTtrVGqmRg6Ni4heFdq+nIy2vsj
 ZXrmMpWgNBjo0B3Rem1mBuOdojVkxNCMLjldF6kLMSjVhkyNKiRJq44Si0TbJMvC99NSznVk
 47rLHh/fvuqTDexkIeCTkAqH1qs2rBB4kELqEoATo49wtpgF0FLxiGALF4D366p5TyzGScuq
 qh1A06m8VdUMgHe6fsXcqo3Um9Ay1bSi8qRGOPDbs0uEewGnygEc6/B1Y4IKgF2/Da/wGygf
 ODQ/CQoBSQqoHXC00sdNc6iX4UKRY0WyiToAe1tzgBsLqGdgb8VdjhvzKSl0zpZx2e23wNt3
 qzEWvwgvPjCtzACpr/lworMZZyPEwp6ReS6LN8I/rrWsRvOCLmcnweLP4He9doI15wPY0nVz
 1RAGu+pLMPegOOUPz7WHsrQPbHtcCdjGT0Pn3JdctwRSApifJ2QlvnDQMY6x+FlY90UBcRLQ
 xjVxjGsiGNdEMP7frAZwzGAzozOoVYxBrBOvvW0rWHn1AZJLoPjBwxAbwEhgA5DEaU+BaWup
 QihIVn7yKaPXKvSZ6YzBBiTLB1yMe21K0i5/G02GQizZFhYWhsLFUolYTG8RLAbmK4SUSpnB
 pDGMjtE/8WEk3ysbs6w/4kfuidjt83neYPlg/VeHA49tn/owsNsBDvp5LkR5jo2/2lltXmc7
 akdthYcsPbxp37dal/rqyhp/74m/WNz/Tu4/Akd3zZnpMO91pqmt9ExQVBYvbo4Iiv83kRsx
 61/xXOOhxeutw9KDivfiYuplCxHPA1H3/De+RknD34mV55NiTUV8mfptV1WdLGv4hF/R5ssV
 hOoHbCRRVfPU+IHDkXiDWZDmsEVzH6uvDJXvL5PmxLtETREDV6wlzvDT0qELo4sDu/jzbzTV
 Phzdt71UHsI1/hJ9BntNK9Tc6WlzJI5EfbDenKXfU1de1dxxUvbK+Ev7sFDRzmC/oJJUslFG
 cwwpSnEArjco/wMe+SWifgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02RbUhTURjHObvXu7vB2s0tPGlouxDaUCupOB9s+aW4akEZRaRms24W+TLu
 Mk0K7EV8WdqSMrtNTQmqlWhmljZT3MyyzPIt01JzGWptpWUomOV1BH77nf//+T3Ph0Ni7t24
 J3k08TjLJWrjaUKK11hpn4B3wQUxa3Pa1cg5OeKGSmyv3dDdCTtAXVPfCXS1vopA5/kyHLW3
 V4rRw5F7ItR29psYddaZCPQz1wZQ9i+eQG9bt6D+M7cJlF9+BaC2L+Eoo94mRnM993E0U1eM
 owdDz4gQJfO9N0PM1PIfxUzH61mMqTJnE8yHHgvBDBpaREzuOSfB5FWbAfOzynuHZJ80+BAb
 f/QEy63RHJAeqbCkY7qn0tS+ZlU6sJE5QEJCaj3k7eVYDpCS7tRjAPu+mghXsRwWvG2eL8h5
 VkCrVe+acQA4OZZPCLmC2g4nrgcIuZL6iMP86T5CeGBUIYCzlffFLqMawMxLA0DYSlBq2DDa
 u3BBTqlg97QdCJtklAb2F6mEGKdWwRnD0MLIMmoPrL1pFwkso5bCF9c+4wJLqI3QOVngJjBG
 +cLZ4g7MxR6w73OJyMU+8JHDhBmBgl+k84sUfpHCL1JuANwMlrM6fUJcgn6dLiiRTQnUaxP0
 yYlxgQeTEqrAws+r1Y+BxfwjsAmISNAEIInRSplpxZUYd9kh7ck0lkuK4ZLjWX0T8CJx2kM2
 xZfud6fitMfZYyyrY7n/rYiUeKaL5KIW41iLv1z8V9IoXrk760JD6NfONb+X9A6k9Md6hHtG
 hdRoVow3e8sx2ra6ZrLeWaE7fMeybYbTmTd1vzml6qLNl8beh94qT12rMGQ5B60RbGvYhrGT
 Dqv/sahmv2L+l6pwpAHKNI7p591xhgP9s2G3vIaKox10xTPlZilWHWF8aK8xquseRConOl7l
 Ac2umNLgbGeYl3Y0ZLVi+GKor7rrRFHQuJ/cL409PdxWFvTyT9ntLy+Tyk8np7WG6Gy2fEtk
 LPdq0DurMe2Jc/hpiinzILavZO5weGQu/Vu2/x1m2BlAVn6yosapgWimOsJkVFzeuyk1Yiv3
 ROFP4/oj2nVqjNNr/wG0H1tAaAMAAA==
X-CMS-MailID: 20201026030455epcas1p160c95fac388080dbadb353ae61526110
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201025222141epcas1p3561566981daa20ed096227f0e4a26b98
References: <20201025221735.3062-1-digetx@gmail.com>
 <CGME20201025222141epcas1p3561566981daa20ed096227f0e4a26b98@epcas1p3.samsung.com>
 <20201025221735.3062-49-digetx@gmail.com>
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
> The Tegra EMC driver now could be compiled as a loadable kernel module.
> Currently devfreq driver depends on the EMC/MC drivers in Kconfig, and
> thus, devfreq is forced to be a kernel module if EMC is compiled as a
> module. This build dependency could be relaxed since devfreq driver
> checks MC/EMC presence on probe, allowing kernel configuration where
> devfreq is a built-in driver and EMC driver is a loadable module.
> This change puts Tegra20 devfreq Kconfig entry on a par with the Tegra30
> devfreq entry.
> 
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
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

Applied it.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
