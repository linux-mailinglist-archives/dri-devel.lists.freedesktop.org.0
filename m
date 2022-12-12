Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE1649A40
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 09:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDED710E146;
	Mon, 12 Dec 2022 08:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC61D10E146
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 08:43:33 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221212084332euoutp01ebd3d4028c84be0421b82e08540fa515~v-zo5ddT50984809848euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 08:43:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221212084332euoutp01ebd3d4028c84be0421b82e08540fa515~v-zo5ddT50984809848euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670834612;
 bh=TzuXQQWuwLA7nIau0lbc/UyW8F0h7L8KWyw2fHehNrU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ZscdcHzFQUMxkNxt8qGKFehxZa2BTsdr92xe9cKRGNH/MHBghEtpnjwmi98UEz02t
 lSchCmGOqrKpIamasqDniPAd13M1kB5XdZ1oF80PNlAru1SuvCcf1ModjCNBhpKyW6
 10rIcd5uk8kzka+J05OQdX/HlR7Pb9M8vL1BAPK0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221212084331eucas1p187d0e335483059ce10090867c6e7014e~v-zocOW_T0655406554eucas1p16;
 Mon, 12 Dec 2022 08:43:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E8.09.09561.3B9E6936; Mon, 12
 Dec 2022 08:43:31 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221212084331eucas1p22706f7fb39db7ab61ad335b0af1a8dc5~v-zn5Y7ze0639806398eucas1p2z;
 Mon, 12 Dec 2022 08:43:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221212084331eusmtrp13daf8fe7a6585d3151bb02cf0b1d6a75~v-zn4Ju0e1418714187eusmtrp1a;
 Mon, 12 Dec 2022 08:43:31 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-b4-6396e9b3f324
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F0.76.08916.3B9E6936; Mon, 12
 Dec 2022 08:43:31 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221212084330eusmtip2fbaf0ed68dee9217878e26c9337e82f5~v-zm5IP081656316563eusmtip2R;
 Mon, 12 Dec 2022 08:43:30 +0000 (GMT)
Message-ID: <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com>
Date: Mon, 12 Dec 2022 09:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host
 for first DSI transfer
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTdRy+7953716mWy/T4At2ZjMtEGFcnX4TMC3+eO+6jjq7vKs/ao03
 MNi0jYl518WPS2FQDBhMJqI5OhYdrI21sONQkNoAx1BxIkOWiLWhGAzUAwxje7H47/k8z+e5
 5/l870tioloiljygyGOUCmmumODj9t/n3dvbArUyiXE6AY16+zHkM87i6K7XRKChB38T6Jvv
 B7ioyqfF0ZxVSyD/2GUcuYru8VBpZSMPNWk7CWS97eEizcIPGDrh7uSge8cKAeofN2Oor/Br
 HF3RXSRQ0HBrWa0OEOiyM4ihR4subE8U3TLj49INBidO65w9XHqg/CZBnzPc5NEnS+q4tLEj
 wKF7rhm59King6B9ZQ4O3db4FW25386hv7U1A3rWuvEd4Qf81Ewm98BhRpm0+2N+9vTCn9gh
 9zNHanSVRAFwrdWACBJSr8KzV81cDeCTIsoEoKf1CcYOcwBWjBby2GEWQM3VIu5Ty/CtJsAK
 TQAWt50kQoKImgGw7MmaEBZQu+F0RTkewji1BToGAzyWj4S9dRNh/lkqE1445+KE8DrqE3hf
 ZwrvYFQ0HJk4HebXU9vgw7q7RCgMox4Q8LTdCUICQSVDzZQmHBxBvQsHNP4V8/Pwl6n68A2Q
 0vDhpbNzgK2dDscL/ASL18FJh43H4udgf3WoachwHMAziz4OO2gBLPhrZMWdAkcHFpbd5HJE
 HDT/msTSe+EfdaVYiIaUEA5PRbIlhLDKrl+hBbDkmIjd3goNjtb/YrsGr2BaIDasehfDqvsN
 q84x/J97BuDNIJpRq+RZjCpZweQnqqRylVqRlSg7KLeC5a/bv+QItoNTkzOJ3YBDgm4ASUy8
 XrDl5VqZSJAp/eIoozz4kVKdy6i6wQYSF0cLTLoSmYjKkuYxOQxziFE+VTlkRGwBJ81iaax/
 IbXZ3DDZWlPpiOR0ZiwOJzUlBDs+t8xliE71Lum+S7wxaLDJG2o85sqM5q5rVbt2ZazVOxUl
 5XcmdzhV8zahJCee2b9mSDLyz5v7dgS69fYNm8o2ktbJ/E8Xl0S5Y/Fv95zftD1t5NF13+xt
 mf/Ih2TXjT3v7f8y/fz19Kji1xxvJPQV+fNTvO5gTJq4wks8jnrrpcaWnTmxr5iqeRObBXF3
 JNkXfk6PKfKg1PZii8l+8cWUYq5gvM0pKZcEjjJ9qp1C32c147+9/viwOuuSsrDUeHyhft/S
 3okh77DtR/fmh3lb8Ri93IVa4tTbQLYjL61XT82/P3biJ4kYV2VLk+MxpUr6L4OsUqkpBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsVy+t/xe7qbX05LNmh+ym5x5/ZpZov7iz+z
 WLy+vYLN4srX92wWvUvPsVpMuj+BxeLLpglsFi/uXWSxONv0ht2ic+ISdovlE/axWWx6fI3V
 ouvXSmaLGef3MVm8aWtktDj9aD2zxanGVhaLS1MOs1l8mvUQKDv5JZvFxROfmC2+/z7L7CDm
 sfbjfVaPebNOsHhMOXGE1eNcz102j52z7rJ7zO6YyeqxeM9LJo8jVxezety5tofN4373cSaP
 zUvqPTa+28Hk0bdlFaPH501yAXxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZG
 pkr6djYpqTmZZalF+nYJehkffj1jLjjPXzF1ykS2BsazPF2MnBwSAiYSNx4uZ+xi5OIQEljK
 KLF89UYWiISMxMlpDawQtrDEn2tdbBBF7xklVq7qZQNJ8ArYSXzo7wFrYBFQlTh+4SU7RFxQ
 4uTMJ2BxUYEUifaef0wgtrBAksS+KYvAepkFxCVuPZkPFhcR0Jb4NvM12AJmge9sEjO/T2GB
 2HaCSeLWpw/MIFVsAoYSXW+7wLo5BQIlznW9YIeYZCbRtbWLEcKWl9j+dg7zBEahWUgOmYVk
 4SwkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRmGa2Hfu5eQfjvFcf9Q4xMnEw
 HmKU4GBWEuFV1ZiWLMSbklhZlVqUH19UmpNafIjRFBgaE5mlRJPzgYkuryTe0MzA1NDEzNLA
 1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBKXnShi8q+0/GZWu/8uBr3j5v7dWD3+d+
 DXotrMjHkeDh861dtGfu/btuAV5tAg/+nzPgP2I/cUpuuliibdnMx7PyUxnbOpTns9R8kJLd
 vHq55ixjt8RXJ1ef5Y2KmRRm+03l4aU9nYe2W9S8PRDw45rlmcslOdO/Zx58qRDCVW4qfHTK
 8hstrXsPnzLK1xSyO/rBwDKD+T3/sbfuijwSOTMF3u7Y+miLjd2PFSxlHUeDjF+EdvQfXX97
 LstvA++jJSazD6yy+7wtiuufvuiq1SabFOc+eMFhteKtpG6T6uuZ9y+qPFjsxdD17GfJBSUr
 W+8G48P7xFNvMv+/cq6t3aT7TK5bfkJk8xaz6glqW5VYijMSDbWYi4oTATqaRui8AwAA
X-CMS-MailID: 20221212084331eucas1p22706f7fb39db7ab61ad335b0af1a8dc5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com>
 <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12.12.2022 09:32, Jagan Teki wrote:
> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Hi Jagan,
>>
>> On 09.12.2022 16:23, Jagan Teki wrote:
>>> The existing drm panels and bridges in Exynos required host
>>> initialization during the first DSI command transfer even though
>>> the initialization was done before.
>>>
>>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
>>> flag and triggers from host transfer.
>>>
>>> Do this exclusively for Exynos.
>>>
>>> Initial logic is derived from Marek Szyprowski changes.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>> Changes from v9:
>>> - derived from v8
>>> - added comments
>>>
>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
>>>    include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>    2 files changed, 17 insertions(+), 3 deletions(-)
>> The following chunk is missing compared to v8:
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 6e9ad955ebd3..6a9403cb92ae 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
>> *dsi, unsigned int flag)
>>                   return 0;
>>
>>           samsung_dsim_reset(dsi);
>> -       samsung_dsim_enable_irq(dsi);
>> +
>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
>> +               samsung_dsim_enable_irq(dsi);
> Is this really required? does it make sure that the IRQ does not enable twice?

That's what that check does. Without the 'if (!(dsi->state & 
DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first 
from pre_enable, then from the first transfer), what leads to a warning 
from irq core.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

