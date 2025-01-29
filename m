Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A33A2235B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 18:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FBD10E10A;
	Wed, 29 Jan 2025 17:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="AtfEM9m2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4B210E10A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 17:51:01 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250129175059euoutp020b6fa69f6e6ac033b35da79ce0f9b5bb~fOzAgkROb1346113461euoutp02R
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 17:50:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250129175059euoutp020b6fa69f6e6ac033b35da79ce0f9b5bb~fOzAgkROb1346113461euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738173059;
 bh=kSqxDp2G8UmdMOmj3Yqy0w3UxKBUqDUXGbyJOchC1os=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=AtfEM9m2PLEeXOaqh6XXLsx/3VsaPGDqfxz2PfTkylaE8+Ble3HZiimRVEhPV3xS1
 DV/N27iUvE3qG8VJ7ldjcooQKm7NW22tQE2dV0lR/cpU2QmBJ6yWGKZV55jqX5V5kH
 gexeEcZAzfUhJTk25//FaELjBTLxTDMtmIh54BjQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250129175058eucas1p17f0a325e475a8433d68280fba4d88aad~fOzALVMwX0575505755eucas1p1-;
 Wed, 29 Jan 2025 17:50:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 37.D2.20397.28A6A976; Wed, 29
 Jan 2025 17:50:58 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250129175058eucas1p130a5352d5ee0c5db03baf91bab6b34b4~fOy-zHqcr1248312483eucas1p1I;
 Wed, 29 Jan 2025 17:50:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250129175058eusmtrp1e17ae7aef3ef5a385d1fa5ec640d2c42~fOy-ykSp91832818328eusmtrp1O;
 Wed, 29 Jan 2025 17:50:58 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-e9-679a6a827b32
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 53.3F.19920.28A6A976; Wed, 29
 Jan 2025 17:50:58 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250129175057eusmtip114ad00e49b0f787cab57f6d62ee091cb~fOy-O6tiY0827008270eusmtip1y;
 Wed, 29 Jan 2025 17:50:57 +0000 (GMT)
Message-ID: <c2c2f613-3b65-4efe-99c2-135f043b2d3b@samsung.com>
Date: Wed, 29 Jan 2025 18:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, DRI mailing list
 <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <Z5pESDSekep9ChAN@smile.fi.intel.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djPc7pNWbPSDe52alj0Nk1nspj68Amb
 xetpH9gsJp7/yWZx5et7NovmxevZLC7vmsNmMffLVGYHDo9NqzrZPO5c28PmMe9koMf+uWvY
 Pe53H2fy+LxJLoAtissmJTUnsyy1SN8ugSuj4fwjpoJPPBX/thxgbWBcxNXFyMkhIWAisWTW
 C8YuRi4OIYEVjBJ/fnxkAkkICXxhlOg9UAOR+Mwosef7HzaYjs8P57JAJJYzSrw8PY8VwvnI
 KHH94TSgWRwcvAJ2Etv+R4OYLAKqEv3/U0B6eQUEJU7OfMICYosKyEvcvzWDHcQWFvCWWNE6
 nxHEFhEwl1g3aREbyEhmgdVMEo/6b4BdxCwgLnHryXwwm03AUKLrbRfYQZwCRhInJ82GqpGX
 2P52DjNIs4TABw6J5h897CBHSAi4SJzZWADxgLDEq+Nb2CFsGYnTk3tYIOrbGSUW/L7PBOFM
 YJRoeH6LEaLKWuLOuV9sIIOYBTQl1u/Shwg7SlzZPo0FYj6fxI23ghA38ElM2jadGSLMK9HR
 JgRRrSYx6/g6uLUHL1xinsCoNAspWGYh+XIWkm9mIexdwMiyilE8tbQ4Nz212DgvtVyvODG3
 uDQvXS85P3cTIzAlnf53/OsOxhWvPuodYmTiYDzEKMHBrCTCG3tuRroQb0piZVVqUX58UWlO
 avEhRmkOFiVx3kX7W9OFBNITS1KzU1MLUotgskwcnFINTJblT2cY3Fmh92BZpjX7djv2fKZQ
 tj1W4VK/O99q+O49IjpZ7VnZxr9ftwmkm98MzrwUmthccCZOoPeoyF3mrVON3cW82qVZhK/c
 +Sjp919pmab8aX//qGmtv5M9NrpUcN6Y15+540jyv77X2zi3/VH8u96jYXorg6icpOiBXces
 Hoj0J0xx5dht8nPSC2kFd58H0g/Ps5VuiJzydeqTuDkcCy5z9c8wZ17/znW/8wQDtvz4l5pP
 pKPKerkNGadGJL5cdH2h54EXx0KFtyy55FCx7HHqouf/TNUD3C4ckdDyfd9fkBk6+7naoWv7
 7+/atENA+81dnq9FUVpRN52evpp5QLDzuFzGwqP33/AYNiixFGckGmoxFxUnAgBQsz3VuAMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xu7pNWbPSDfp38Fn0Nk1nspj68Amb
 xetpH9gsJp7/yWZx5et7NovmxevZLC7vmsNmMffLVGYHDo9NqzrZPO5c28PmMe9koMf+uWvY
 Pe53H2fy+LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
 syy1SN8uQS+j4fwjpoJPPBX/thxgbWBcxNXFyMkhIWAi8fnhXJYuRi4OIYGljBKHFx1kg0jI
 SJyc1sAKYQtL/LnWxQZR9J5RoqP/PmMXIwcHr4CdxLb/0SAmi4CqRP//FJByXgFBiZMzn7CA
 2KIC8hL3b81gB7GFBbwlVrTOZwSxRQTMJdZNWgQ2kllgNZPEj94N7BDz57JIvJmxBaybWUBc
 4taT+UwgNpuAoUTX2y6w4zgFjCROTprNBFFjJtG1tYsRwpaX2P52DvMERqFZSA6ZhWTULCQt
 s5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYh9uO/dy8g3Heq496hxiZOBgPMUpw
 MCuJ8Maem5EuxJuSWFmVWpQfX1Sak1p8iNEUGBgTmaVEk/OBiSCvJN7QzMDU0MTM0sDU0sxY
 SZzX7fL5NCGB9MSS1OzU1ILUIpg+Jg5OqQYmGweO/lea1tP3xkpunOM+KWhyq+EGz4aGRuOo
 dRPyupU0TF+oiIXGqAtkBl+c5CXLlabZtlCUYXGWoVLN4Wv2Rn2a0iKGhn0lz2YazOFVvvSv
 q8zFeCIvh5Xn33bf9yfWFgip71+d4VWdJv5IUOpQiOEbr1UPngh0fl48b9MWu4gPmm9rTy2Y
 /d12ScWxfWV39v6+ubZ6/dVFp3UCkvTW2U7J39HGJ7+W86jL8cP1vo9kdGUc2Y54WzKcV7Jc
 3fXkeX6V3am7h57n/dL46q3/nKHGqmv/04Df5qnrI5/fbQu/0cm0bHmdfeuvvakLg+dIbPxa
 mxw7YeLHrx8DZ57k/PSx7eDhV0Fltuf7uU4qsRRnJBpqMRcVJwIAV5Rfw0wDAAA=
X-CMS-MailID: 20250129175058eucas1p130a5352d5ee0c5db03baf91bab6b34b4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
References: <CGME20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109@eucas1p1.samsung.com>
 <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
 <Z4pktkZ1ihfkZjHm@smile.fi.intel.com> <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com> <Z5pESDSekep9ChAN@smile.fi.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.01.2025 16:07, Andy Shevchenko wrote:
>> [...]
> Meanwhile, can you test this patch (on top of non-working case)?
>
> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> index 2314744201b4..f799a7a80231 100644
> --- a/drivers/base/regmap/regmap.c
> +++ b/drivers/base/regmap/regmap.c
> @@ -1553,8 +1553,19 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
>   		 * virtual copy as well.
>   		 */
>   		if (page_chg &&
> -		    in_range(range->selector_reg, range->window_start, range->window_len))
> +		    in_range(range->selector_reg, range->window_start, range->window_len)) {
> +			bool bypass, cache_only;
> +
> +			bypass = map->cache_bypass;
> +			cache_only = map->cache_only;
> +			map->cache_bypass = false;
> +			map->cache_only = true;
> +
>   			_regmap_update_bits(map, sel_register, mask, val, NULL, false);
> +
> +			map->cache_bypass = bypass;
> +			map->cache_only = cache_only;
> +		}
>   	}
>   
>   	*reg = range->window_start + win_offset;
>
> If I understood the case, the affected driver doesn't use case and we actually
> write to the selector register twice which most likely messes up the things.
> But this is only a theory (since we don't have the traces yet).

Bingo! This patch (on top of current linux-next) fixed the probe issue. 
Feel free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

(although I'm not sure if this is a fix for the generic case or just 
this driver)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

