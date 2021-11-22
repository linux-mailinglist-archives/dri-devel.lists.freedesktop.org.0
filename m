Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B245907D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABCE89E35;
	Mon, 22 Nov 2021 14:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB5E89E35
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:46:12 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211122144611euoutp0175370f16435c246bc401d92eb59c198f~55ZXgL06s2506025060euoutp01b
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:46:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211122144611euoutp0175370f16435c246bc401d92eb59c198f~55ZXgL06s2506025060euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1637592371;
 bh=FbpePbUSbQDY+x0NIXb7rdxZ0/i4fGRqx60/aKeNzS8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=XIOhRO7B0CWjW+RZSdwEhyQj/CoYsjv2+atdpB7j0j8h4YLuWEzuRQC6bPRljki6+
 MhZ2x0B1chKsnP1O0Uec5y4c3ZSlnijRj1uY8p3N4GwZRXaqn6iQMW9jsXndygOEmL
 IE8ElttSZlJ9YSSQwOYC3z3S7h9x8yhRbvwFqC5w=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211122144611eucas1p2a5061c4fc34ccf4e1ea1c8575e120ad9~55ZXKxdHG1307713077eucas1p2j;
 Mon, 22 Nov 2021 14:46:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 41.75.10260.33DAB916; Mon, 22
 Nov 2021 14:46:11 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211122144610eucas1p10bbaca5f697497ebccca8977e9e63784~55ZWzfM4N0797607976eucas1p1Z;
 Mon, 22 Nov 2021 14:46:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211122144610eusmtrp23842a196fd8e7d80ed912026b27e1ce7~55ZWyoiZa1309213092eusmtrp20;
 Mon, 22 Nov 2021 14:46:10 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-8e-619bad33f979
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CF.B6.09522.23DAB916; Mon, 22
 Nov 2021 14:46:10 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211122144610eusmtip2605dd96211a2641b0a7940194f514abc~55ZWRhXEN1881118811eusmtip2N;
 Mon, 22 Nov 2021 14:46:10 +0000 (GMT)
Message-ID: <f61ed39a-00d0-e962-cec1-5a1d327e5185@samsung.com>
Date: Mon, 22 Nov 2021 15:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAOMZO5BTO7H4r7+vaJd-4pQ9eQt_q0BjVxxjyyVtvAKsVEkmvw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87rGa2cnGiz9yG9xf/FnFosrX9+z
 WTy86m/xZdMENovOiUvYLZZP2Mdmcagv2uLTrIfMFit+bmV04PRY+/E+q8f7G63sHjtn3WX3
 mN0xk9Vj8Z6XTB53ru1h87jffZzJY8m0q2wBHFFcNimpOZllqUX6dglcGT9OLWUq6GCt+Plu
 LXMDYx9LFyMnh4SAicSK73/Yuxi5OIQEVjBKfNj5C8r5wijR8fAtM4TzmVHiU087XMvB9h9M
 EInljBJfpm1ihXA+MkrMXr6MDaSKV8BO4vyhA2A2i4CqxJG195kg4oISJ2c+AZskKpAkcbp1
 EjOILSzgLHHk3TJGEJtZQFzi1pP5YPUiAoESjUv+gd3ELHCISeLiySlgQ9kEDCW63naB2ZxA
 RZueLoBqlpfY/nYOM8Sp/zkk9t3I6mLkALJdJH5ezocIC0u8Or6FHcKWkfi/cz7YNxICzYwS
 D8+tZYdwehglLjfNYISospa4c+4XG8ggZgFNifW79CHCjhJbJi9igpjPJ3HjrSDECXwSk7ZN
 Z4YI80p0tAlBVKtJzDq+Dm7twQuXmCcwKs1CCpVZSL6fheSZWQh7FzCyrGIUTy0tzk1PLTbO
 Sy3XK07MLS7NS9dLzs/dxAhMWqf/Hf+6g3HFq496hxiZOBgPMUpwMCuJ8F5bMjtRiDclsbIq
 tSg/vqg0J7X4EKM0B4uSOK/In4ZEIYH0xJLU7NTUgtQimCwTB6dUA5OUUmWKkU+uKq+P2+Gj
 M7K7ja2455zKffLH+k9dhpHnTI7yx59TtsQWzV3kWOLTHR3tp5ZnWZmyrf/8nug5d6fbnO8x
 DmHRX/xeNswvte6CVoB1/PZ68/Lzhdv/St+VU5vNfVpF28GywWfKUelFYgZT7hgcCHjHcl59
 taIL/+dZC0WLGW99PsLyvtvs+zKRpYH80uclzbe8PFqxK/aU0nKOS5e4J0jKbRJpnbuhoPHi
 RTtGN/17iiecFmav/Xl9m1DC22tnzRuOPVWK+m+R8/qHTuJZL/EdExmT9NIMGlkYTzEE9K87
 YznpDO/EFWveHZ7LtlH+4k39zfNuca/fKqvI2RzavbktZ7npyZcut5VYijMSDbWYi4oTAXsO
 L+DJAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xe7pGa2cnGuydamJxf/FnFosrX9+z
 WTy86m/xZdMENovOiUvYLZZP2Mdmcagv2uLTrIfMFit+bmV04PRY+/E+q8f7G63sHjtn3WX3
 mN0xk9Vj8Z6XTB53ru1h87jffZzJY8m0q2wBHFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYm
 lnqGxuaxVkamSvp2NimpOZllqUX6dgl6GT9OLWUq6GCt+PluLXMDYx9LFyMnh4SAicTB9h9M
 XYxcHEICSxklTj7dzwqRkJE4Oa0ByhaW+HOtiw2i6D2jxJ2Nl9hBErwCdhLnDx1gA7FZBFQl
 jqy9zwQRF5Q4OfMJ2AZRgSSJ/u+7mEFsYQFniSPvljGC2MwC4hK3nswHqxcRCJR4MOcwI8gC
 ZoEjTBLrl6xmhtjWwyzR/eoDWBWbgKFE19susG2cQB2bni6AmmQm0bW1C8qWl9j+dg7zBEah
 WUgOmYVk4SwkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGKnbjv3cvINx3quP
 eocYmTgYDzFKcDArifBeWzI7UYg3JbGyKrUoP76oNCe1+BCjKTA0JjJLiSbnA1NFXkm8oZmB
 qaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2ampBahFMHxMHp1QDk7z3tnOz9Ut+N1/5sMjoasU8
 u/KVXoxLfge/1Dl2NsO+88yji0FPws6n+1/3P8JWYr+YKUH8dpEIb53sjr62e5caz7Dut21Z
 UKJpdPq3X7emvWdH2E07ps+mrsYMCfePrxSRKvGO1G8okLnQr8j86F941R6WhP4mW6Frvw7m
 SOnm2MQGWK8xV8r7KrVOqTckyHUpa8wVw+WW76/wx6g1y1pZ74r6KTnz+WmL3Kmd/v1m8qIl
 iZfvf+5Imbnb+mphau26opNrqm5Jfbuym4G9R4y3wn7/5bQS1oua6f8cFZNjl7/52l0Ufu7P
 gdKey/tysvQvGq2tOvx1rtypU8ISMcoqc7UemfFcyj4pIKrEUpyRaKjFXFScCABXgcpzXQMA
 AA==
X-CMS-MailID: 20211122144610eucas1p10bbaca5f697497ebccca8977e9e63784
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599
References: <20211122070633.89219-1-jagan@amarulasolutions.com>
 <CGME20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599@eucas1p1.samsung.com>
 <20211122070633.89219-2-jagan@amarulasolutions.com>
 <5e173bc6-a320-42ec-79de-0ea4c3c2b480@samsung.com>
 <CAMty3ZArYY5ECD5AWZiNa8pYn16ziWi=S-39o3VuTXGA1eN1DQ@mail.gmail.com>
 <CAOMZO5BTO7H4r7+vaJd-4pQ9eQt_q0BjVxxjyyVtvAKsVEkmvw@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.11.2021 15:40, Fabio Estevam wrote:
> Hi Jagan,
>
> On Mon, Nov 22, 2021 at 11:21 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
>> Is this with Bridge or normal DSI panel?
> According to the log shared by Marek, the dts being used is:
>   arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> which includes arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi.
>
> In this dtsi there is a "sil,sii8620" bridge.

Sii8620 bridge is attached to the HDMI display path. That's completely 
different from the DSI display path modified by this patchset.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

