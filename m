Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D749364A40A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 16:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA23710E196;
	Mon, 12 Dec 2022 15:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5727F10E196
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 15:22:00 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221212152158euoutp01aebf70fcb38752a5a60a34ce653871f8~wFPhSaO-J0030800308euoutp01G
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 15:21:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221212152158euoutp01aebf70fcb38752a5a60a34ce653871f8~wFPhSaO-J0030800308euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670858518;
 bh=O7qk8MVmG/L8xQOa7f8wZ4uzmt6PDoYQiivYnkjDJs8=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=qIRkiUodnGOzukYrdNmdsEKiDK/fFnojZ+pEgIgZKuKUORi2HSDcI2hnsAVXGdpjq
 kU/U7FUVV5Dq7ZNMCQu5jHa5EpeN5ylFqRSdR/tz/HNN6zltwMNDVpkLGDPCUc9Yfd
 nI5qEsibDHstIGdYWCNSpFG8ot/ffA7CsVtRTzLc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221212152158eucas1p1d11cb60f3cadeccb2985ea8a07c7f598~wFPgzwoK71570515705eucas1p1R;
 Mon, 12 Dec 2022 15:21:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 22.75.09549.51747936; Mon, 12
 Dec 2022 15:21:57 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221212152157eucas1p18b1106f4eb28129934a6acc0433753ac~wFPgJjS4Y1570515705eucas1p1O;
 Mon, 12 Dec 2022 15:21:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221212152157eusmtrp1548a275163fbcd8d37c5f0c96152fc3d~wFPgIpSmz0470604706eusmtrp1_;
 Mon, 12 Dec 2022 15:21:57 +0000 (GMT)
X-AuditID: cbfec7f5-f47ff7000000254d-4a-639747159d22
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3D.6D.09026.41747936; Mon, 12
 Dec 2022 15:21:56 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221212152155eusmtip292649f60bf56079ed21ff1a7b0e0e1c0~wFPeUMOCy3196331963eusmtip2C;
 Mon, 12 Dec 2022 15:21:55 +0000 (GMT)
Message-ID: <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
Date: Mon, 12 Dec 2022 16:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host
 for first DSI transfer
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTdRjv+77v3o3R1ssc8T3qrFvioV1DTPPraaJdp29Zd/3hpVdZjfEG
 nrDZBmb80whDmGADFrpxFwumrGEuNp1ABG6YTBcLJDnlx5bDY+gQA4QQEtt4s/jv83yez/N8
 nue5h4eLviETefsUuYxKIcuWkHzCeemB76X4Hcfla7oLNqLBAS+OAnVTBAoPWEj0+/Q9EpWd
 9HFQRUBHoPt2HYlG/T0E6vpyjItKys1cVK9rI5F9uI+DtHPf4+jEb20YGisqAMgbtOHoSsFX
 BLqq7yDRpPFmJFt5m0Q9nkkc/TXfhW99mv5hIsChvzV6CFrvucihfaVDJN1sHOLS1cUGDl3X
 ehujL16r49CDfa0kHTjaidEO8xd043gTRh87awX0lH35O8L3+JszmOx9BxlVypaP+VnaQj04
 EF5+aPaXJo4GOBO1IIYHqXXQ5G3BtYDPE1EWAE0VbYAN7gPYda6DE1WJqCkAfxze87jC9bWV
 y4rqI6LLJpINJgBsHDpJRlUCaguc+7sdj2KCSoL+kB1j+Th42XCLiOJ4KgNeaO5a5JdR6XBc
 b+FGMU4lwP5bNYs8SaVC7V3tYk8x9SKcMYQXzXBqmoQ1Tg+IJmKoNNg3fYrDFj8HC89V4+yo
 Wj6svSBm8evQ0fwzweJl8E7nWS6Ln4XeylIi2hRSRyIHmA9gbKADUBPqB6xqExz0zUWseRGH
 VdDWksLS2+AfhhI8SkNKCK/fjWNnEMIK5/F/aQEsLhKx6pXQ2HnmP1tX91VcByTGJWcxLlnf
 uGQb4/++JkBYQQKTp87JZNQvK5jPpGpZjjpPkSmVK3PsIPK53oXO6SZguTMhdQOMB9wA8nCJ
 WJCUXCUXCTJkn+czKuVHqrxsRu0Gz/AISYLAoi+Wi6hMWS6zn2EOMKrHWYwXk6jBaseCN8z8
 Svf68/zZxjqfdNcMah/1Vo0o8svPr+i4JNZen38/1G6w+UY0pbuuLFAlLa5f+ak1I/6eFTuC
 6bGPyt64d/pNb9FBSe+qt0/E7149ZHcfmdn4yQsfZLQ3bC4WKZ8sNHvWWuPWHm4NC9OTNtQr
 TMrXwt+ZzuxdAxrSbA5y3IHfbKh6y/7T4Z2bEsKC0/1g+0i10Kc/5DrmPbq7Fou9Ydtr6H5l
 sHmBv1OXFEodSPNRrc6+ciTdWjSVH9xufWLU5Z+NDbWc6k17Nyt5YsOjXP/6T8Xm/WUpw+7Y
 h2WOP9cpJ199UPnhNZszuCer+2GvWbaSp0neBjxPDajlz0sIdZYsdTWuUsv+AZ0HZKgoBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsVy+t/xe7qi7tOTDVoWs1jcuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBaT7k9gsfiyaQKbxYt7F1kszja9YbfonLiE3WL5hH1sFpseX2O1
 6Pq1ktlixvl9TBZv2hoZLU4/Ws9scaqxlcXi0pTDbBafZj0Eyk5+yWZx8cQnZovvv88yO4h5
 rP14n9Vj3qwTLB5TThxh9TjXc5fNY+esu+wesztmsnos3vOSyePI1cWsHneu7WHzuN99nMlj
 85J6j43vdjB59G1ZxejxeZNcAF+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWR
 qZK+nU1Kak5mWWqRvl2CXkZX8xTGgtdyFT+O7mBtYNwm1cXIySEhYCJxsH8VexcjF4eQwFJG
 iSed/9ggEjISJ6c1sELYwhJ/rnWxQRS9Z5S49fAjWIJXwE7i15/9zCA2i4CqxL3nm5gg4oIS
 J2c+YQGxRQVSJNp7/oHFhQWSJPZNWQS2gFlAXOLWk/lgcTYBQ4mut11gcREBbYlvM1+DLWMW
 +M4mMfP7FBaIzX+ZJK4/7mYEqeIUsJe49nUZK8QkM4murV2MELa8RPPW2cwTGIVmITlkFpKF
 s5C0zELSsoCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgmtl27OeWHYwrX33UO8TIxMF4
 iFGCg1lJhFdVY1qyEG9KYmVValF+fFFpTmrxIUZTYGhMZJYSTc4HJrq8knhDMwNTQxMzSwNT
 SzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5OqQamxL7zZ2Y8zGUs9JJX3Nw9/SSz3UfZdSHL
 VJ9kn/uTvGdvusCJ8hvBGw+5p+0oqGpr8a27vcv6kOfZRX36dyxPXz7h2H2x7bXAnpoDM04b
 C0rUffu/9I6ntq5hsH+PefbZmqDUuXy3J5dpBR/5t71nv3us0f1P5g0r00oyZPwfTzVuXbzm
 QdXtWo+iUrdTcamVC7zUJzTq/PuWtFF5YV/K1+vH7r8+utfn51flqtecYhzbwpVe/n+tIe8i
 Ny1IOPjnUal2/+kaXusnVnculH4VcD3Jd73npJOfpn+K6353b2lQ++08pwMHLlyakOI6h82j
 9lZHmcqN3dNO62l+2Xrs5+vDhtbCufoZFqmXqgqMlFiKMxINtZiLihMBrNVlK7wDAAA=
X-CMS-MailID: 20221212152157eucas1p18b1106f4eb28129934a6acc0433753ac
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
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com>
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

On 12.12.2022 09:43, Marek Szyprowski wrote:
> On 12.12.2022 09:32, Jagan Teki wrote:
>> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> Hi Jagan,
>>>
>>> On 09.12.2022 16:23, Jagan Teki wrote:
>>>> The existing drm panels and bridges in Exynos required host
>>>> initialization during the first DSI command transfer even though
>>>> the initialization was done before.
>>>>
>>>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
>>>> flag and triggers from host transfer.
>>>>
>>>> Do this exclusively for Exynos.
>>>>
>>>> Initial logic is derived from Marek Szyprowski changes.
>>>>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>> ---
>>>> Changes from v9:
>>>> - derived from v8
>>>> - added comments
>>>>
>>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
>>>>    include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>    2 files changed, 17 insertions(+), 3 deletions(-)
>>> The following chunk is missing compared to v8:
>>>
>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> index 6e9ad955ebd3..6a9403cb92ae 100644
>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
>>> *dsi, unsigned int flag)
>>>                   return 0;
>>>
>>>           samsung_dsim_reset(dsi);
>>> -       samsung_dsim_enable_irq(dsi);
>>> +
>>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>> +               samsung_dsim_enable_irq(dsi);
>> Is this really required? does it make sure that the IRQ does not 
>> enable twice?
>
> That's what that check does. Without the 'if (!(dsi->state & 
> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first 
> from pre_enable, then from the first transfer), what leads to a 
> warning from irq core.

I've just noticed that we also would need to clear the 
DSIM_STATE_REINITIALIZED flag in dsim_suspend.

However I've found that a bit simpler patch would keep the current code 
flow for Exynos instead of this reinitialization hack. This can be 
applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host 
init in pre_enable" patch:

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0b2e52585485..acc95c61ae45 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1291,9 +1291,11 @@ static void samsung_dsim_atomic_pre_enable(struct 
drm_bridge *bridge,

         dsi->state |= DSIM_STATE_ENABLED;

-       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
-       if (ret)
-               return;
+       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
+               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
+               if (ret)
+                       return;
+       }
  }

  static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
diff --git a/include/drm/bridge/samsung-dsim.h 
b/include/drm/bridge/samsung-dsim.h
index b8132bf8e36f..b4e26de88b9e 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -30,6 +30,9 @@ enum samsung_dsim_type {
         SAMSUNG_DSIM_TYPE_COUNT,
  };

+#define samsung_dsim_hw_is_exynos(hw) ((hw) >= 
SAMSUNG_DSIM_TYPE_EXYNOS3250 && \
+       (hw) <= SAMSUNG_DSIM_TYPE_EXYNOS5433)
+
  struct samsung_dsim_transfer {
         struct list_head list;
         struct completion completed;



Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

