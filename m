Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549364B1A1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 09:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBF010E0CE;
	Tue, 13 Dec 2022 08:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1714310E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 08:58:23 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221213085820euoutp02daec895a1a885bc380db42b2d52bcaba~wTp2aWGKw1689516895euoutp02u
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 08:58:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221213085820euoutp02daec895a1a885bc380db42b2d52bcaba~wTp2aWGKw1689516895euoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670921900;
 bh=BJ0ZkEDUZPzoO+LuYUlggb5hVqjXIcf9mhmyQyYIcBk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=RYzJoPFinwrnfWFrGUhz5tD/nNqKfk4xRolvkTwfE5rJwKVZHMcxQgU6pp121+34m
 tQSPYr4HwAzbR1wgM/SgnzIfmxvqystJURQcURxVYvA8b4fuw1SzxOf6KdILyJV5IB
 KOAztF0WLp+vY69Se6LbjmqBHUWedgEtjiADblEs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221213085820eucas1p233079b4eb3523c52875a2329d262a2b1~wTp2FsylQ2354223542eucas1p2d;
 Tue, 13 Dec 2022 08:58:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 01.03.09561.CAE38936; Tue, 13
 Dec 2022 08:58:20 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221213085819eucas1p1ac566916a55168f544cc3895ff931f5e~wTp1kxhYH1260412604eucas1p1-;
 Tue, 13 Dec 2022 08:58:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221213085819eusmtrp16c00ac7db95599a61edf6656214fbcb8~wTp1j6j1H1767517675eusmtrp1J;
 Tue, 13 Dec 2022 08:58:19 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-8c-63983eac8b8c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6B.DE.08916.BAE38936; Tue, 13
 Dec 2022 08:58:19 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221213085818eusmtip2cf7540fefa130796090ea469d481de9a~wTp0W8JhX0953609536eusmtip2X;
 Tue, 13 Dec 2022 08:58:18 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------Ie8YMt0pJdtivekw73y66wY1"
Message-ID: <395a4762-70fe-1caf-579f-2b5952232470@samsung.com>
Date: Tue, 13 Dec 2022 09:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host
 for first DSI transfer
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTe0xTVxzHPffe3l5qyi4F5ASJUxzINMJYcJ65jbmELFdjEONGNpJllHIH
 ysOuFba5GOkc5SUEaaNQeXRpOypBHYzx0A4nokUIuHYMEMEL4oaUx8ZDJuDYKLcu7L/P7/H9
 fX/nlxwKl4yTvtSR1OOsIlWa7E+KiPrbC107q8OLZa8UlRFo4H4HjjjDLIHG75tJ1P3kDxLl
 m7oEqIgrJNBcbSGJHj+wEajzqwkhyjlrFKLKwmYS1Y70CFDu4kUcFd9txtCEWgVQx8MrOGpX
 ZRLIrr1Johnd8EpVM0YiW9sMjv5a6sT3bmAuTXMCplzXRjDatlYB03VmkGSadINC5kJ2iYAx
 WMYwpvVXg4AZ6LGQDJdnxZjvjaeYmqlGjCmoqwLMbO2mKPcY0ZvxbPKRdFYREh4rSqy7GCEf
 +R18nlfzSQZw2EEucKMgHQb/tn29wiJKQpsBXM4qEPLBHIDD/fcIPpgF8AfHd9hzSbOlzSWp
 BPBpt8olmQbw6iA/GKej4b2mAdLJYjocljxbFjqZoAOgoW5UwOc94J2SR4STvel4+FNT56qD
 Jx0Hp7RmIT/HB/Y/qljNe9E74HzJOOk0w+knJKyob1s1I+lQmDuZu1KgKDf6ELyt3ursgbRJ
 BJvtNpxfOwKWqpZInj2hw1on5NkPdmjOELwgC0D9EofxQSGAGaP9rju9AQe6Fl3qd+BQSQ7u
 dIO0O+yb9OA3dYdF9eddaTHMVkv47kCos17+z+vGz3bXPgx0TNwiCsEW3Zp76dbcRbfm/Ty/
 CBsmS3HdigNOvwyvXA3h00ehPbNUwHMQzCwtE/6/nR9zvVvt4i1Qmzfs6tkG2y1GXA/WVwEf
 Nk2ZksAqQ1PZz4KV0hRlWmpCsOxYSi1Y+Q8dy9aZRlDmmA5uARgFWgCkcH8vcUDQOZlEHC/9
 4gSrOPaxIi2ZVbaAjRTh7yM2a7NlEjpBepxNYlk5q3hexSg33wws8lkKdWNharhGdl51KPYX
 rKuz7+RuL0nv3T75vrETpP7SB+lm83z0VpudOWwrS2jdXLkndWynRtTg7b333H7cM1anD8h6
 /dX8sOo9BQeLlyO+DObI4j8b8tZ7rPstapfyQO6oj2/7HeNLnxaZL8zZ5Ybe4Q2m3pFKDvx4
 86Hng/hrFT1PVWDIsP10yHvlkVHVs+/7XZOcnKiR61OqvIzCspiPFmMONgZGHw2z9NeZbgWV
 V+x4a9l6dt4aHZ/eMpS0aSF/3a4krjjR7mcLjNn9bnacxv9bz8u9NVzcqW1v40pO/MLGyNPG
 b64Hbf4n87VB9Vh7DuQe6w9rsAP7PpQHmKIk/oQyURq6HVcopf8CFR+WX34EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsVy+t/xe7qr7WYkG8w/JWNx5/ZpZov7iz+z
 WLy+vYLN4srX92wWvUvPsVpMuj+BxeLLpglsFi/uXWSxONv0ht2ic+ISdovlE/axWWx6fI3V
 ouvXSmaLGef3MVm8aWtktDj9aD2zxanGVhaLS1MOs1l8mvUQKDv5JZvFxROfmC2+/z7L7CDm
 sfbjfVaPebNOsHhMOXGE1eNcz102j52z7rJ7zO6YyeqxeM9LJo8jVxezety5tofN4373cSaP
 zUvqPTa+28Hk0bdlFaPH501yAXxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZG
 pkr6djYpqTmZZalF+nYJehmTP+oV3Amu+PnsOWMD4yvnLkZODgkBE4l9e04wdjFycQgJLGWU
 2LdsEgtEQkbi5LQGVghbWOLPtS42EFtI4D2jxN3ZcSA2s0CYRMuzWYwgNq+AncTMP//YQWwW
 AVWJxVues0LEBSVOznwCNlNUIEWivecfE4gtLJAksW/KIjaIOeISt57MB4uLCGhLfJv5mg3k
 IGaB72wSM79PYYG47iezxKtVy8A2sAkYSnS9BbmIg4NTIFDiWJvyBEbBWUhumoVk9ywkOyBs
 M4murV2MELa8xPa3c5ghbDWJ29uusiOLL2BkX8UoklpanJueW2yoV5yYW1yal66XnJ+7iRGY
 kLYd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4VXVmJYsxJuSWFmVWpQfX1Sak1p8iNEUGDATmaVE
 k/OBKTGvJN7QzMDU0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoEpKqndN5aL
 5Y5ukrlGTrLZydnXZn08Uy3s/r3pz7f5RXvKY69yeq3cb7iJ4cXEL1La9z4dO5i1jKk75rtz
 s/lspjfTmdTEsjOTD7kzPeU7KPhwSdqpZ5KBhbvWpgafOrtNNXTbq6XaFxb8Z3WPvdo/MbqF
 Ked68rTtVq+CbNPfH5M4qfpxx76nv0vlvokVfdjKm2vhvOYIc9z/vgS9q5/yNDVMOKyn7ShT
 kbygb7RFrkw05stKxtT6n3b+BnJ693N8HoYs+LrmbvK1nHsTv00OtFOdP91zpw3PPF0Opnhv
 w21fah431+Zde1Vc3VL71NmXqe/u6+IXBX2tudlnhJafimBJPXtD5HzSBPfPotOUWIozEg21
 mIuKEwFUkfF90QMAAA==
X-CMS-MailID: 20221213085819eucas1p1ac566916a55168f544cc3895ff931f5e
X-Msg-Generator: CA
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
 <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
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

This is a multi-part message in MIME format.
--------------Ie8YMt0pJdtivekw73y66wY1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

On 12.12.2022 16:33, Jagan Teki wrote:
> On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
> <m.szyprowski@samsung.com>  wrote:
>> On 12.12.2022 09:43, Marek Szyprowski wrote:
>>> On 12.12.2022 09:32, Jagan Teki wrote:
>>>> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
>>>> <m.szyprowski@samsung.com>  wrote:
>>>>> Hi Jagan,
>>>>>
>>>>> On 09.12.2022 16:23, Jagan Teki wrote:
>>>>>> The existing drm panels and bridges in Exynos required host
>>>>>> initialization during the first DSI command transfer even though
>>>>>> the initialization was done before.
>>>>>>
>>>>>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
>>>>>> flag and triggers from host transfer.
>>>>>>
>>>>>> Do this exclusively for Exynos.
>>>>>>
>>>>>> Initial logic is derived from Marek Szyprowski changes.
>>>>>>
>>>>>> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
>>>>>> Signed-off-by: Jagan Teki<jagan@amarulasolutions.com>
>>>>>> ---
>>>>>> Changes from v9:
>>>>>> - derived from v8
>>>>>> - added comments
>>>>>>
>>>>>>     drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
>>>>>>     include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>>>     2 files changed, 17 insertions(+), 3 deletions(-)
>>>>> The following chunk is missing compared to v8:
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> index 6e9ad955ebd3..6a9403cb92ae 100644
>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
>>>>> *dsi, unsigned int flag)
>>>>>                    return 0;
>>>>>
>>>>>            samsung_dsim_reset(dsi);
>>>>> -       samsung_dsim_enable_irq(dsi);
>>>>> +
>>>>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>>>> +               samsung_dsim_enable_irq(dsi);
>>>> Is this really required? does it make sure that the IRQ does not
>>>> enable twice?
>>> That's what that check does. Without the 'if (!(dsi->state &
>>> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
>>> from pre_enable, then from the first transfer), what leads to a
>>> warning from irq core.
>> I've just noticed that we also would need to clear the
>> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
>>
>> However I've found that a bit simpler patch would keep the current code
>> flow for Exynos instead of this reinitialization hack. This can be
>> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
>> init in pre_enable" patch:
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 0b2e52585485..acc95c61ae45 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1291,9 +1291,11 @@ static void samsung_dsim_atomic_pre_enable(struct
>> drm_bridge *bridge,
>>
>>           dsi->state |= DSIM_STATE_ENABLED;
>>
>> -       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>> -       if (ret)
>> -               return;
>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>> +               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>> +               if (ret)
>> +                       return;
>> +       }
> Sorry, I don't understand this. Does it mean Exynos doesn't need to
> init host in pre_enable? If I remember correctly even though the host
> is initialized it has to reinitialize during the first transfer - This
> is what the Exynos requirement is. Please correct or explain here.

This is a matter of enabling power regulator(s) in the right order and 
doing the host initialization in the right moment. It was never a matter 
of re-initialization. See the current code for the reference (it uses 
the same approach as my above change). I've already explained that here:

https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/

If you would like to see the exact proper moment of the dsi host 
initialization on the Exynos see the code here:

https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework  and patches addingmipi_dsi_host_init() to panel/bridge drivers.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--------------Ie8YMt0pJdtivekw73y66wY1
Content-Type: multipart/related;
	boundary="----3h3NlAFYdTKMNsmemZRyk6U5d2UtVjH-CMKXjoUygBh03Fgp=_619db_"

------3h3NlAFYdTKMNsmemZRyk6U5d2UtVjH-CMKXjoUygBh03Fgp=_619db_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12.12.2022 16:33, Jagan Teki wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
<a class="moz-txt-link-rfc2396E" href="mailto:m.szyprowski@samsung.com">&lt;m.szyprowski@samsung.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 12.12.2022 09:43, Marek Szyprowski wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 12.12.2022 09:32, Jagan Teki wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
<a class="moz-txt-link-rfc2396E" href="mailto:m.szyprowski@samsung.com">&lt;m.szyprowski@samsung.com&gt;</a> wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hi Jagan,

On 09.12.2022 16:23, Jagan Teki wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">The existing drm panels and bridges in Exynos required host
initialization during the first DSI command transfer even though
the initialization was done before.

This host reinitialization is handled via DSIM_STATE_REINITIALIZED
flag and triggers from host transfer.

Do this exclusively for Exynos.

Initial logic is derived from Marek Szyprowski changes.

Signed-off-by: Marek Szyprowski <a class="moz-txt-link-rfc2396E" href="mailto:m.szyprowski@samsung.com">&lt;m.szyprowski@samsung.com&gt;</a>
Signed-off-by: Jagan Teki <a class="moz-txt-link-rfc2396E" href="mailto:jagan@amarulasolutions.com">&lt;jagan@amarulasolutions.com&gt;</a>
---
Changes from v9:
- derived from v8
- added comments

   drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
   include/drm/bridge/samsung-dsim.h     |  5 +++--
   2 files changed, 17 insertions(+), 3 deletions(-)
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">The following chunk is missing compared to v8:

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
b/drivers/gpu/drm/bridge/samsung-dsim.c
index 6e9ad955ebd3..6a9403cb92ae 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
*dsi, unsigned int flag)
                  return 0;

          samsung_dsim_reset(dsi);
-       samsung_dsim_enable_irq(dsi);
+
+       if (!(dsi-&gt;state &amp; DSIM_STATE_INITIALIZED))
+               samsung_dsim_enable_irq(dsi);
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Is this really required? does it make sure that the IRQ does not
enable twice?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
That's what that check does. Without the 'if (!(dsi-&gt;state &amp;
DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
from pre_enable, then from the first transfer), what leads to a
warning from irq core.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
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

         dsi-&gt;state |= DSIM_STATE_ENABLED;

-       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
-       if (ret)
-               return;
+       if (!samsung_dsim_hw_is_exynos(dsi-&gt;plat_data-&gt;hw_type)) {
+               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
+               if (ret)
+                       return;
+       }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sorry, I don't understand this. Does it mean Exynos doesn't need to
init host in pre_enable? If I remember correctly even though the host
is initialized it has to reinitialize during the first transfer - This
is what the Exynos requirement is. Please correct or explain here.</pre>
    </blockquote>
    <p>This is a matter of enabling power regulator(s) in the right
      order and doing the host initialization in the right moment. It
      was never a matter of re-initialization. See the current code for
      the reference (it uses the same approach as my above change). I've
      already explained that here:</p>
    <p><a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/">https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/</a></p>
    <p>If you would like to see the exact proper moment of the dsi host
      initialization on the Exynos see the code here:</p>
    <pre id="b"><a href="https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework" class="moz-txt-link-freetext">https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework</a> and patches adding <span class="blob-code-inner blob-code-marker js-code-nav-pass " data-code-marker="+"><span class="pl-c1">mipi_dsi_host_init</span>() to panel/bridge drivers.

</span></pre>
    <p></p>
    <pre class="moz-signature" cols="72">Best regards
-- 
Marek Szyprowski, PhD
Samsung R&amp;D Institute Poland</pre>
  <table id=bannersignimg data-cui-lock="true" namo_lock><tr><td><p>&nbsp;</p>
</td></tr></table><table id=confidentialsignimg data-cui-lock="true" namo_lock><tr><td><p>&nbsp;<img style="border: 0px solid currentColor; border-image: none; width: 520px; height: 144px; display: inline-block;" unselectable="on" data-cui-image="true" src="cid:cafe_image_0@s-core.co.kr">&nbsp;</p>
</td></tr></table></body>
</html>
<table style='display: none;'><tbody><tr><td><img style='display: none;' border=0 src='http://ext.w1.samsung.net/mail/ext/v1/external/status/update?userid=m.szyprowski&do=bWFpbElEPTIwMjIxMjEzMDg1ODE5ZXVjYXMxcDFhYzU2NjkxNmE1NTE2OGY1NDRjYzM4OTVmZjkzMWY1ZSZyZWNpcGllbnRBZGRyZXNzPWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc_' width=0 height=0></td></tr></tbody></table>
------3h3NlAFYdTKMNsmemZRyk6U5d2UtVjH-CMKXjoUygBh03Fgp=_619db_
Content-Type: image/gif
Content-Transfer-Encoding: base64
Content-ID: <cafe_image_0@s-core.co.kr>

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
Ow==


------3h3NlAFYdTKMNsmemZRyk6U5d2UtVjH-CMKXjoUygBh03Fgp=_619db_--

--------------Ie8YMt0pJdtivekw73y66wY1--
