Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046DF211CC0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CF26EA89;
	Thu,  2 Jul 2020 07:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C686E1CE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:01:21 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200702010119epoutp028df2443ee0b0833f38195f63521b42c0~dycI4PMcD2468824688epoutp024
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:01:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200702010119epoutp028df2443ee0b0833f38195f63521b42c0~dycI4PMcD2468824688epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593651679;
 bh=V8Gva5iDzFc4G0IttFrfiVO2V6kQ+Z8Y94e+lUkePSw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=XNtckBHi0xquu1bNQAUqCXboZZYSgPkecYSvG/GuhPzj0K4LBnU8Ba7ASxodkaA1f
 ELeYTTRSXvcvyU2dgSgOuwX+Xr3gZjXSGezYXClXCKtjI4d08Bk/kIB70UdLPj8hro
 CKPjNTovvuWboQz7CPrJ6nK7fITRbbNDSU1JvAfM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200702010118epcas1p294ce9e022e324f8093b3d88131e0fe78~dycIC3xKH2182521825epcas1p2R;
 Thu,  2 Jul 2020 01:01:18 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.155]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 49y0CY6FVTzMqYm7; Thu,  2 Jul
 2020 01:01:13 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 1E.00.29173.5D13DFE5; Thu,  2 Jul 2020 10:01:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200702010108epcas1p10f6a1661eb148c937b1d1c791ffc54f3~dyb-Nd0Lq3155831558epcas1p1I;
 Thu,  2 Jul 2020 01:01:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200702010108epsmtrp26c5ec83135bdc8ad5894ee49890ddc45~dyb-MFY9F0515005150epsmtrp2s;
 Thu,  2 Jul 2020 01:01:08 +0000 (GMT)
X-AuditID: b6c32a37-9cdff700000071f5-15-5efd31d52409
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 28.F3.08382.4D13DFE5; Thu,  2 Jul 2020 10:01:08 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200702010108epsmtip10874fbddbdd158a43fec5c2fa3d56992~dyb_3GekE1145611456epsmtip1w;
 Thu,  2 Jul 2020 01:01:08 +0000 (GMT)
Subject: Re: [PATCH v4 14/37] PM / devfreq: tegra20: Add error messages to
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
Message-ID: <5d83261b-12e5-9734-f793-0600212bcee1@samsung.com>
Date: Thu, 2 Jul 2020 10:12:24 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200609131404.17523-15-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHJsWRmVeSWpSXmKPExsWy7bCmge5Vw79xBlM2Gljcn9fKaPHu01NW
 i/lHzrFarP74mNHiytf3bBbT925is2iZtYjF4mzTG3aLy7vmsFl87j3CaNH5ZRabxcVTrha3
 G1ewWUxaO5XRonXvEXaLf9c2slj83DWPxUHQ4/2NVnaPnbPusntcOveH2WPTqk42jzvX9rB5
 3O8+zuTR2/yOzaNvyypGj8+b5AI4o7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0t
 zJUU8hJzU22VXHwCdN0yc4B+UVIoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUWBbo
 FSfmFpfmpesl5+daGRoYGJkCFSZkZ7z8sJq94BB3xeo5W5kaGCdxdjFyckgImEhM/PSApYuR
 i0NIYAejxNJj/UwQzidGibUnt0E53xgljrc3M8O0TJl3gxHEFhLYyyjRPYkNoug9o0TX39Ps
 IAlhgWSJXwt3MoMkRASOMEus7jzOCOIwC1xmlDjb9oUNpIpNQEti/4sbYDa/gKLE1R+Pwcby
 CthJfNj2EMxmEVCRWHjqLxOILSoQJnFyWwtUjaDEyZlPgC7n4OAUMJd48L8IJMwsIC5x68l8
 JghbXmL72zlgR0gItHNKTD3ZxwLxgovE1MadjBC2sMSr41vYIWwpic/v9rJB2NUSK08eYYNo
 7mCU2LL/AitEwlhi/9LJTCCLmQU0Jdbv0ocIK0rs/D2XEWIxn8S7rz2sICUSArwSHW1CECXK
 Epcf3GWCsCUlFrd3sk1gVJqF5JtZSF6YheSFWQjLFjCyrGIUSy0ozk1PLTYsMEaO7k2M4ISu
 Zb6DcdrbD3qHGJk4GA8xSnAwK4nwnjb4FSfEm5JYWZValB9fVJqTWnyI0RQYvhOZpUST84E5
 Ja8k3tDUyNjY2MLE0MzU0FBJnNfX6kKckEB6YklqdmpqQWoRTB8TB6dUA9NeI9s3Gf670qRW
 m64p4qs5dtVQXfzAmn678+GvfjZqfVzwq1R1fWt2wJ2k8r3VqiHTW9PjOJ3ii2RuPJN++dL2
 8prPRqE2AVV/7qhkv+Sa9myXIBf/7EPZv0O9vbTtLf/+K9+dvuHJZB82nRcHXRJuXOWqC/r2
 9XHzlKj0lO7pR/dHVOhd89uf+951TQZL0qwtxzb6mlqXh87b//nN0VkTry9w748quJiVNTmp
 d3PN1ql94s/EUl6ncgp/qH+msGnH1rDmEw9f5xrGKyvaZ6qW7X6l+/72oudzlxfdqH/ZY5W9
 Neucv93UpNDCHz9Vz5S8vv/BXPye0fa7IWYrBDbGyPMzTX7HsL9vo8r5dmYlluKMREMt5qLi
 RAAA370XcQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsWy7bCSnO4Vw79xBpc+aVjcn9fKaPHu01NW
 i/lHzrFarP74mNHiytf3bBbT925is2iZtYjF4mzTG3aLy7vmsFl87j3CaNH5ZRabxcVTrha3
 G1ewWUxaO5XRonXvEXaLf9c2slj83DWPxUHQ4/2NVnaPnbPusntcOveH2WPTqk42jzvX9rB5
 3O8+zuTR2/yOzaNvyypGj8+b5AI4o7hsUlJzMstSi/TtErgyXn5YzV5wiLti9ZytTA2Mkzi7
 GDk5JARMJKbMu8HYxcjFISSwm1Hi36OLTBAJSYlpF48ydzFyANnCEocPF0PUvGWUuPPyDViN
 sECyxK+FO5lBEiICx5glNp0+zQTiMAtcZpTY0fmVDaJlG6PE1/0/2UBa2AS0JPa/uAFm8wso
 Slz98ZgRxOYVsJP4sO0hmM0ioCKx8NRfsBWiAmESO5c8ZoKoEZQ4OfMJC8hJnALmEg/+F4GE
 mQXUJf7Mu8QMYYtL3HoynwnClpfY/nYO8wRG4VlIumchaZmFpGUWkpYFjCyrGCVTC4pz03OL
 DQsM81LL9YoTc4tL89L1kvNzNzGCY1tLcwfj9lUf9A4xMnEwHmKU4GBWEuE9bfArTog3JbGy
 KrUoP76oNCe1+BCjNAeLkjjvjcKFcUIC6YklqdmpqQWpRTBZJg5OqQYm67uOt5lEF+6v7zDg
 eq0vdIwvme1sa3WY/oGbn/u330yt5PCYnJ0wSazrquH/4klCpcsf194KY5l8zefXm2a1T089
 doYcPffop/nHSNEF6td9v8tYeTc2H43ezXVx/syeYzvPHWdoSam3n2Ul0yvXZH8zRlxyyUyN
 9EkmX2UcJ5hO9vnC8u9F271zmT3MlZOSahyO9G4sLjVdmhDyo0FMzO3OY2vNbYLt73PO5KaZ
 85kr392fddr/rKuW1PpJKUlzb9V/vrEw6ORp5WB1/RNfDbiXfLLZaX/35/+3Z+Y28D3Wv3nr
 mKf2683NO5KO7ah9/PpIQs7lRbvumQsdEwnZcm9F90yHC+Y9q1SfP02XUmIpzkg01GIuKk4E
 AA3mMGFcAwAA
X-CMS-MailID: 20200702010108epcas1p10f6a1661eb148c937b1d1c791ffc54f3
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200609131736epcas1p1ba2a7c962cc370785327e82c973594b6
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131736epcas1p1ba2a7c962cc370785327e82c973594b6@epcas1p1.samsung.com>
 <20200609131404.17523-15-digetx@gmail.com>
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
>  drivers/devfreq/tegra20-devfreq.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
> index bf504ca4dea2..249d0dc44f6c 100644
> --- a/drivers/devfreq/tegra20-devfreq.c
> +++ b/drivers/devfreq/tegra20-devfreq.c
> @@ -44,19 +44,25 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
>  	int err;
>  
>  	opp = devfreq_recommended_opp(dev, freq, flags);
> -	if (IS_ERR(opp))
> +	if (IS_ERR(opp)) {
> +		dev_err(dev, "failed to find opp for %lu Hz\n", *freq);
>  		return PTR_ERR(opp);
> +	}
>  
>  	rate = dev_pm_opp_get_freq(opp);
>  	dev_pm_opp_put(opp);
>  
>  	err = clk_set_min_rate(tegra->emc_clock, rate);
> -	if (err)
> +	if (err) {
> +		dev_err(dev, "failed to set min rate: %d\n", err);
>  		return err;
> +	}
>  
>  	err = clk_set_rate(tegra->emc_clock, 0);
> -	if (err)
> +	if (err) {
> +		dev_err(dev, "failed to set rate: %d\n", err);
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
