Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E3DA1511E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 15:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E8810E260;
	Fri, 17 Jan 2025 14:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="SIvoohom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 381 seconds by postgrey-1.36 at gabe;
 Fri, 17 Jan 2025 14:04:18 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C074710E260
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 14:04:18 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250117135755euoutp02a2970a17694d6fe58e3c6b5c9b5f3ef0~bf4F5-Yw60137901379euoutp02Q
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 13:57:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250117135755euoutp02a2970a17694d6fe58e3c6b5c9b5f3ef0~bf4F5-Yw60137901379euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737122275;
 bh=b0Ufdly5pj6epJmi+e5PQACEwPX4EomCfmGRK1+QHrc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=SIvoohomn89AidyrVCtHGT8OpfY9cOQfVU5ywNbJ5INhGee9M8PvevisL3ZYzy+/0
 maCAPhTAO7aiBN7+z7FjwEztN+ZSFBM2J20pzbiMLsbkSwsu705nTu5+/vITyCDovE
 y5tkDkeqzUXo5PzmL8dZHSgLLYEpx/S/7Pc2w2Fs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250117135754eucas1p16aa0d5badad782736c61324cd641a31c~bf4FYp81m0401404014eucas1p1k;
 Fri, 17 Jan 2025 13:57:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 26.93.20397.2E16A876; Fri, 17
 Jan 2025 13:57:54 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109~bf4FAkZZM0405604056eucas1p1X;
 Fri, 17 Jan 2025 13:57:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250117135754eusmtrp2e7176a7b7b8d3f7ad3f19199fab55c39~bf4FABBaH0449804498eusmtrp2R;
 Fri, 17 Jan 2025 13:57:54 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-c1-678a61e2cd8a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 67.E5.19920.2E16A876; Fri, 17
 Jan 2025 13:57:54 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250117135753eusmtip261012378e6a0a00e49df6d8ca3960dd2~bf4EQhZuE0910609106eusmtip2B;
 Fri, 17 Jan 2025 13:57:53 +0000 (GMT)
Message-ID: <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
Date: Fri, 17 Jan 2025 14:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, DRI mailing list
 <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250116124303.3941583-1-andriy.shevchenko@linux.intel.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djP87qPErvSDWZc0LDobZrOZDH14RM2
 i9fTPrBZTDz/k83iytf3bBbNi9ezWVzeNYfNYu6XqcwOHB6bVnWyedy5tofNY97JQI/9c9ew
 e9zvPs7k8XmTXABbFJdNSmpOZllqkb5dAlfG/1kb2ArmqVb0/tjB0sA4SaaLkZNDQsBEYu+U
 E0xdjFwcQgIrGCVWtl1mhHC+MEqsuruOFcL5zCix5M96FpiW982/2SASyxklvt5tB0sICXxk
 lGi/aAVi8wrYSWxYvRRoLgcHi4CqxMZePoiwoMTJmU/AykUF5CXu35rBDmILC3hLrGidzwhi
 iwhUSHz59wrsCmaBV4wS+7beZwJJMAuIS9x6Mh/MZhMwlOh628UGYnMKeEqsnLoLqkZeonnr
 bGaQZgmBNxwSx1svM0Jc7SLx6tYOdghbWOLV8S1QtozE/53zmSAa2hklFvy+D+VMYJRoeH4L
 qtta4s65X2wg7zALaEqs36UPEXaUuLJ9GgtIWEKAT+LGW0GII/gkJm2bzgwR5pXoaBOCqFaT
 mHV8HdzagxcuMU9gVJqFFC6zkLw5C8k7sxD2LmBkWcUonlpanJueWmycl1quV5yYW1yal66X
 nJ+7iRGYlk7/O/51B+OKVx/1DjEycTAeYpTgYFYS4U373ZEuxJuSWFmVWpQfX1Sak1p8iFGa
 g0VJnHfR/tZ0IYH0xJLU7NTUgtQimCwTB6dUA1OMDTtbn3Dam+C+ymW+rBHb3/dnrPxczitf
 2fJFsG1h09XYnU/rdFVmeV9WFWE/+GHj5kfK8+9fFdZSYZlcaDvBp0O3XEvsSKuT7sGAa/Mv
 2S9I0D0w5Wtm9Y+4xrtsH0RZlNcceHX6ju4rLgOtiV3KF70evpaKqJ68c5N35C7eDzteid3I
 Zf4Xef/X/fuPjhvPlCtnjX4T5fX/o7yhopqHrsXdecyJ7xNOM+yMMVwpraJh/+/c+9LkpEtW
 dXG+Oc5vumqvbO+IeekSH7qb6034q5ovBtppStuMH+YGbSr62TSxOvpC0STP9rI5ji/W8fuf
 ++B8xiPbfPHVwqVlWt9mv4m0UJgdsUjb3uzmCSWW4oxEQy3mouJEAJU3uA66AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xe7qPErvSDU42CFj0Nk1nspj68Amb
 xetpH9gsJp7/yWZx5et7NovmxevZLC7vmsNmMffLVGYHDo9NqzrZPO5c28PmMe9koMf+uWvY
 Pe53H2fy+LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
 syy1SN8uQS/j/6wNbAXzVCt6f+xgaWCcJNPFyMkhIWAi8b75N1sXIxeHkMBSRomPjzaxQyRk
 JE5Oa2CFsIUl/lzrgip6zyix7NEfsASvgJ3EhtVLmboYOThYBFQlNvbyQYQFJU7OfMICYosK
 yEvcvzUDbKawgLfEitb5jCC2iECFxJLzDYwgM5kFXjFKNN98xAaSEBLwkJh2oR+siFlAXOLW
 k/lMIDabgKFE19susBpOAU+JlVN3MUHUmEl0be2CqpeXaN46m3kCo9AsJHfMQjJqFpKWWUha
 FjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMw23Hfm7ewTjv1Ue9Q4xMHIyHGCU4mJVE
 eNN+d6QL8aYkVlalFuXHF5XmpBYfYjQFhsVEZinR5HxgIsgriTc0MzA1NDGzNDC1NDNWEud1
 u3w+TUggPbEkNTs1tSC1CKaPiYNTqoGpnHdF0MG6qiLlu/XGO8tiW6+pf30/LTtjYk2RoU7c
 vLaDS/J7Dx87ULo0bH+i/uYL+47+/PLokPA94YO5VtZKd+VEuKJKVuZKqEm9WNOV6htwfeYP
 P7HtB7rzFmR53r+h8f95z7eY9JSzXSVNjP5TwrZyRJw6+cp7td5n5tnvupMCr03do7bmz4+C
 xay+/D/PSmUkFLten36oKc/r6kWD58nzrM3evd0rG9H5+oLkQrXAxY9O+z78fFT+BN/h9lIj
 w60zdnKtef593oai+BD3Nztup3Er/a1szkl93SbtX/dw/307n57zzq6VO69LBqxwTWv6OS9q
 5snanU/MGHiytwve09k5ofRi/Ll/2UKKSizFGYmGWsxFxYkAG0BDiUwDAAA=
X-CMS-MailID: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
References: <20250116124303.3941583-1-andriy.shevchenko@linux.intel.com>
 <CGME20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109@eucas1p1.samsung.com>
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

Dear All,

On 16.01.2025 13:42, Andy Shevchenko wrote:
> If the selector register is represented in each page, its value
> in accordance to the debugfs is stale because it gets synchronized
> only after the real page switch happens. Synchronize cache for
> the page selector.
>
> Before (offset followed by hexdump, the first byte is selector):
>
>      // Real registers
>      18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>      ...
>      // Virtual (per port)
>      40: 05 ff 00 00 e0 e0 00 00 00 00 00 1f
>      50: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
>      60: 01 ff 00 00 ff ff 00 00 00 00 00 00
>      70: 02 ff 00 00 cf f3 00 00 00 00 00 0c
>      80: 03 ff 00 00 00 00 00 00 00 00 00 ff
>      90: 04 ff 00 00 ff 0f 00 00 f0 00 00 00
>
> After:
>
>      // Real registers
>      18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>      ...
>      // Virtual (per port)
>      40: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
>      50: 01 ff 00 00 e0 e0 00 00 00 00 00 1f
>      60: 02 ff 00 00 ff ff 00 00 00 00 00 00
>      70: 03 ff 00 00 cf f3 00 00 00 00 00 0c
>      80: 04 ff 00 00 00 00 00 00 00 00 00 ff
>      90: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>
> Fixes: 6863ca622759 ("regmap: Add support for register indirect addressing.")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This patch landed in linux-next some time ago as commit 1fd60ed1700c 
("regmap: Synchronize cache for the page selector"). Today I've noticed 
that it causes a regression for Lontium LT9611UXC HDMI bridge driver. 
With today's linux-next I got the following messages on QCom RB5 board:

# dmesg | grep  lt9611uxc
[   13.737346] lt9611uxc 5-002b: LT9611 revision: 0x00.00.00
[   13.804190] lt9611uxc 5-002b: LT9611 version: 0x00
[   13.870564] lt9611uxc 5-002b: FW version 0, enforcing firmware update
[   13.877437] lt9611uxc 5-002b: Direct firmware load for 
lt9611uxc_fw.bin failed with error -2
[   13.887517] lt9611uxc 5-002b: probe with driver lt9611uxc failed with 
error -2

after reverting the $subject patch, the driver probes fine on that board.

I'm not sure if this is really a bug caused by this change or simply the 
driver already was aligned to old regmap behavior. Dmitry, could you 
check the regamp usage and review the changes introduced by this patch? 
Let me know if there is anything to check on the real hardware to help 
resolving this issue.

> ---
> v3: rebased on the top of latest vanilla
>   drivers/base/regmap/regmap.c | 28 ++++++++++++++++++++++------
>   1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> index f2843f814675..197c79b66828 100644
> --- a/drivers/base/regmap/regmap.c
> +++ b/drivers/base/regmap/regmap.c
> @@ -1557,24 +1557,40 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
>   			return -EINVAL;
>   	}
>   
> -	/* It is possible to have selector register inside data window.
> -	   In that case, selector register is located on every page and
> -	   it needs no page switching, when accessed alone. */
> +	/*
> +	 * It is possible to have selector register inside data window.
> +	 * In that case, selector register is located on every page and it
> +	 * needs no page switching, when accessed alone.
> +	 *
> +	 * Nevertheless we should synchronize the cache values for it.
> +	 */
>   	if (val_num > 1 ||
>   	    range->window_start + win_offset != range->selector_reg) {
> +		unsigned int page_off = win_page * range->window_len;
> +		unsigned int sel_offset = range->selector_reg - range->window_start;
> +		unsigned int sel_register = range->range_min + page_off + sel_offset;
> +		unsigned int val = win_page << range->selector_shift;
> +		unsigned int mask = range->selector_mask;
> +
>   		/* Use separate work_buf during page switching */
>   		orig_work_buf = map->work_buf;
>   		map->work_buf = map->selector_work_buf;
>   
> -		ret = _regmap_update_bits(map, range->selector_reg,
> -					  range->selector_mask,
> -					  win_page << range->selector_shift,
> +		ret = _regmap_update_bits(map, range->selector_reg, mask, val,
>   					  &page_chg, false);
>   
>   		map->work_buf = orig_work_buf;
>   
>   		if (ret != 0)
>   			return ret;
> +
> +		/*
> +		 * If selector register has been just updated, update the respective
> +		 * virtual copy as well.
> +		 */
> +		if (page_chg &&
> +		    in_range(range->selector_reg, range->window_start, range->window_len))
> +			_regmap_update_bits(map, sel_register, mask, val, NULL, false);
>   	}
>   
>   	*reg = range->window_start + win_offset;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

