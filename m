Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86AF701008
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 23:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB76110E2B7;
	Fri, 12 May 2023 21:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37A810E2B7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 21:02:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230512210227euoutp019d6a509c293c8cb5c0ead881b7eb9bbf~egS6EN88G1380913809euoutp010
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 21:02:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230512210227euoutp019d6a509c293c8cb5c0ead881b7eb9bbf~egS6EN88G1380913809euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683925347;
 bh=snYc3AaUnMxozrOKWE2koPU90RtCRf+1sDe5897xL1I=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=lWGPKarD3uqVcSItshPBXVFEKINSdjcrzSzY0viuAWXBEcjkI6Ao2e6pKxgLWAWve
 ILUWNlIrruRln5DnkcPfKixsv2++NiLt5veQnw4znHrwdP7g/e/GNhr5OA42n5l0ua
 1Tb3HjIl9S2mqqdDKEQ0dULZLOaGbmeqBgDPx2zg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230512210226eucas1p197f78c33383550b74ca3e04056887013~egS5Zo6Pi1153111531eucas1p1D;
 Fri, 12 May 2023 21:02:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E7.9A.35386.269AE546; Fri, 12
 May 2023 22:02:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230512210225eucas1p1709c154945bfbcaf221eef18dec31672~egS4qR6Sx0341103411eucas1p1I;
 Fri, 12 May 2023 21:02:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230512210225eusmtrp2667401bccef92188a70c106e5d8480b8~egS4pnHqY0884508845eusmtrp2N;
 Fri, 12 May 2023 21:02:25 +0000 (GMT)
X-AuditID: cbfec7f4-cc9ff70000028a3a-29-645ea96269d0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8C.5E.14344.169AE546; Fri, 12
 May 2023 22:02:25 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230512210225eusmtip28124dbb9b691ef97b4f38d8e161ca1a8~egS33gBNB0166201662eusmtip2C;
 Fri, 12 May 2023 21:02:25 +0000 (GMT)
Message-ID: <7a83b8c1-88ff-0ae6-9c3b-d49fc08c7ac0@samsung.com>
Date: Fri, 12 May 2023 23:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH V5 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAHCN7xKq_hZXWZVMG0xFK_zGfm18ag48a83BtL5OyE6VJ3FMTA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFKsWRmVeSWpSXmKPExsWy7djP87pJK+NSDPY/UbO4c/s0s8Xuq93s
 FvcXf2axuPL1PZtF79JzrBZfNk1gs3g+fx2jxck3V1ksHsy9yWTROXEJu8XlXXPYLN60NTJa
 vD29gd3i/c5bjBaT5t1ktZjRdpnVQcBj7cf7rB4vlzcwe8xuuMjiMW/WCRaPnbPusnvM7pjJ
 6rF4z0smj02rOtk8jlxdzOpxYsIlJo871/awedzvPs7k0f/XwOPzJjmPA3tb2AL4o7hsUlJz
 MstSi/TtErgyNl8/yVbwWKBi+uOwBsbFvF2MnBwSAiYSu57uY+1i5OIQEljBKHFs/2MmCOcL
 o8STs7fYQaqEBD4zSixapAXTcXDyHzaI+HJGifYmfYiGj4wSa3+8YAZJ8ArYSbx+d4cJxGYR
 UJV49m42O0RcUOLkzCcsILaoQKrEqs0XweqFBaIkDn5cCTaUWUBc4taT+WC9IgIeEgeOXGQB
 WcAsMJtF4sHZZWCD2AQMJbredgE1cHBwCgRK7LjKDdErL9G8dTYzSL2EwCtOiZlbP7FDXO0i
 seXDekYIW1ji1fEtUHEZif875zNBNLQzSiz4fR/KmcAo0fD8FlSHtcSdc7/AtjELaEqs36UP
 EXaU2H2rCSwsIcAnceOtIMQRfBKTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzUIKlllI
 3p+F5J1ZCHsXMLKsYhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECEyep/8d/7KDcfmrj3qH
 GJk4GA8xSnAwK4nwvl0SnSLEm5JYWZValB9fVJqTWnyIUZqDRUmcV9v2ZLKQQHpiSWp2ampB
 ahFMlomDU6qBKUuoRttYXVGqL9C2/CLLr0ezmY97dXqUNTocqjIM+jvROF92+5q7KU13eZY2
 p/FsMDZoYrdyXHvGyiHjnOxd6Ye7D+sJ74865Z98tu2QabYW+9m5jJO0kldclnmlv95qWa7T
 3pvG7lGLO1RUdy6WO86gtytYd7USg+zKZya9zeyb3jyRdfjY/0hge0t/238l9WqNiu0N99U/
 uD5lnsJxeP3fK60VP0584Tv64evVnvDqeds5t3kap603/F9Zfiny0Yd6t9tf4ot0/Wb869vj
 c69a0Xal4m7dO0+D/r1o6ru33Cdu09lOG+OD502fnlx28Uzha/f5ojNq8m75J+zJevekZtqm
 8FndN0982OC0UImlOCPRUIu5qDgRABSc87MNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42I5/e/4Pd3ElXEpBtfuGlrcuX2a2WL31W52
 i/uLP7NYXPn6ns2id+k5VosvmyawWTyfv47R4uSbqywWD+beZLLonLiE3eLyrjlsFm/aGhkt
 3p7ewG7xfuctRotJ826yWsxou8zqIOCx9uN9Vo+XyxuYPWY3XGTxmDfrBIvHzll32T1md8xk
 9Vi85yWTx6ZVnWweR64uZvU4MeESk8eda3vYPO53H2fy6P9r4PF5k5zHgb0tbAH8UXo2Rfml
 JakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZm6+fZCt4LFAx
 /XFYA+Ni3i5GTg4JAROJg5P/sHUxcnEICSxllDjY0c4OkZCRODmtgRXCFpb4c60Lqug9o8Tq
 x+tZQBK8AnYSr9/dYQKxWQRUJZ69m80OEReUODnzCViNqECqxMmlN8BsYYEoiYMfV7KB2MwC
 4hK3nswH6xUR8JA4cOQiC8gCZoG5LBIN67cxgySEBI4wSWyZnghiswkYSnS9BbmCg4NTIFBi
 x1VuiDlmEl1buxghbHmJ5q2zmScwCs1CcsYsJOtmIWmZhaRlASPLKkaR1NLi3PTcYiO94sTc
 4tK8dL3k/NxNjMB0se3Yzy07GFe++qh3iJGJg/EQowQHs5II79sl0SlCvCmJlVWpRfnxRaU5
 qcWHGE2BYTGRWUo0OR+YsPJK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqY
 ODilGpjyLQ5zd558PEOtRSIi6MDdrVnqxQ/+hf2bF3zkhdTsfOuIepddH5vdn6g/X27ps4GL
 V3m76T5+5v1PHdx6+D/P/TVv4ccip9nbXvFKXDS8ZePsUhMccit6C7Pp0i/xm3df7DKaVvPI
 UJExZ1+DxOXPfVb+UbUzrr510ttTt2FN+d98JZYucavo5r+bxLMvG398euKzaMW/33qfN2pP
 OPlCtCn4rk+7dGzTRNHeq8lzPL6FP2FjPvhgM6OT1L9WvzUFmZmWCZnKwbfqdXe8Pd/b/yJS
 qNr3zXIOyyNPfv0QTj/+amqJvSa735SSZTFZc4WlKrTPfpnz1b8vVnhRb9ycH+GmPy23mj2b
 E6T7Z4YSS3FGoqEWc1FxIgDzNsHCoAMAAA==
X-CMS-MailID: 20230512210225eucas1p1709c154945bfbcaf221eef18dec31672
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230512200115eucas1p180198d430c17b044e34d66b7246d4a7b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230512200115eucas1p180198d430c17b044e34d66b7246d4a7b
References: <20230506192453.725621-1-aford173@gmail.com>
 <20230506192453.725621-6-aford173@gmail.com>
 <275064c0e6c814d8e8fda6bcf70d6e8c3bdc3011.camel@pengutronix.de>
 <CGME20230512200115eucas1p180198d430c17b044e34d66b7246d4a7b@eucas1p1.samsung.com>
 <CAHCN7xKq_hZXWZVMG0xFK_zGfm18ag48a83BtL5OyE6VJ3FMTA@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Michael Walle <michael@walle.cc>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.05.2023 22:00, Adam Ford wrote:
> On Fri, May 12, 2023 at 2:37 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>> Am Samstag, dem 06.05.2023 um 14:24 -0500 schrieb Adam Ford:
>>> The DPHY timings are currently hard coded. Since the input
>>> clock can be variable, the phy timings need to be variable
>>> too.  Add an additional variable to the driver data to enable
>>> this feature to prevent breaking boards that don't support it.
>>>
>>> The phy_mipi_dphy_get_default_config function configures the
>>> DPHY timings in pico-seconds, and a small macro converts those
>>> timings into clock cycles based on the pixel clock rate.
>>>
>> This week I finally had some time to take a deeper look at this series
>> and test it on some of my systems.
> Thanks for testing this!
>> This patch causes issues when the burst clock rate is fixed by
>> supplying the DT entry. Instead of describing the issue below, I'm
>> attaching the patch that makes things work on my system.
> Oops, sorry about that.
>
>> I would appreciate if you could test this one on your side. Feel free
>> to squash it into yours if you find it working properly.
> I reviewed your patch, and it looks like it makes a lot of sense.
> If it works, I'll squash them together and add your name to the sign-off.
>
>> Also I would almost bet that dynamic_dphy is working on the Exynos
>> boards with that fix added. So if anyone with access to those boards
>> would like to give it a shot, we may be able to get rid of the
>> hardcoded PHY parameters altogether, which would be a nice cleanup.
> I wondered the same thing, but I didn't want to create more work for
> Marek S and since there was so much churn getting the original driver
> ported, I thought it would be the safest thing to try to give the
> imx8m m/n/p the features without breaking the Exynos.
>
> Marek S - Do you want me to post this file without the extra checks to
> see if it still works with Exynos?

Feel free to send me patches to test or just point to your 
work-in-progress git repo.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

