Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDED70262C
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 09:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E10210E165;
	Mon, 15 May 2023 07:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5867410E165
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 07:37:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230515073709euoutp018d82062218a40cf511657d71d0d8579e~fQPpQ7Af91179411794euoutp01D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 07:37:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230515073709euoutp018d82062218a40cf511657d71d0d8579e~fQPpQ7Af91179411794euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1684136229;
 bh=4KVBCJXgjWN0Hfg1ujzfNt5lNWZZNCCIrttFNFjwUpU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=sDhIqKcHoZLpgEqpjd/FuVq2fPTvW+2NrGAwVd4NfP3A2zGq8tu5dCIZJTdeGMWHs
 J2LIRqootv8pROkXMsz7T4MFYFIMe3ngu27NcWF3RcJskL/lKEf10iarnsqeYXO5f8
 3D9cTkLH/tukKRGdHpbiFi+RYElKhe660Pq1rrmo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230515073709eucas1p29c564ba328648042a733701fdad05b27~fQPo_u1c21745717457eucas1p2d;
 Mon, 15 May 2023 07:37:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A5.D1.35386.521E1646; Mon, 15
 May 2023 08:37:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230515073708eucas1p2b1fc755549303023853b9ff334d733ce~fQPomwoTU2607326073eucas1p2z;
 Mon, 15 May 2023 07:37:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230515073708eusmtrp17f21f8b7f5c7f6d5563b9dc8baa9ba0a~fQPomBB6o0468804688eusmtrp1A;
 Mon, 15 May 2023 07:37:08 +0000 (GMT)
X-AuditID: cbfec7f4-cc9ff70000028a3a-f2-6461e1255a4b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 37.FD.14344.421E1646; Mon, 15
 May 2023 08:37:08 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230515073707eusmtip2d024c237d4978bedb932fa0ffdd1bc55~fQPnpS9Cu3245332453eusmtip2C;
 Mon, 15 May 2023 07:37:07 +0000 (GMT)
Message-ID: <96150852-84ce-f750-2e2e-8cb53cde5719@samsung.com>
Date: Mon, 15 May 2023 09:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH V5 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAHCN7xLZNvMx=U9=Fp=qrG9xaMhU1PS_nQO5FfC2S+XLO8YLXQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDKsWRmVeSWpSXmKPExsWy7djPc7qqDxNTDO70s1rcuX2a2WL31W52
 i/uLP7NYXPn6ns2id+k5VosvmyawWTyfv47R4uSbqywWD+beZLLonLiE3eLyrjlsFm/aGhkt
 3p7ewG7xfuctRotJ826yWsxou8zqIOCx9uN9Vo+XyxuYPWY3XGTxmDfrBIvHzll32T1md8xk
 9Vi85yWTx6ZVnWweR64uZvU4MeESk8eda3vYPO53H2fy6P9r4PF5k5zHgb0tbAH8UVw2Kak5
 mWWpRfp2CVwZz59PZy/olqzoaOlmb2BcL9LFyMkhIWAiseLrYdYuRi4OIYEVjBK7lvxjA0kI
 CXxhlLiwtwQi8ZlR4sTDTSwwHd83fWCESCxnlGg5sZkJouMjo8S2g4UgNq+AnUTz/QmsIDaL
 gKrElKdTmCHighInZz4BGyQqkCqxavNFsLiwQJTEwY8rwTYzC4hL3HoyH2ymiICSxN0zf8GW
 MQscZJHonXcOrIhNwFCi620XmM0pEChxc+d5RohmeYnmrbOZQRokBF5xSly+3gl1tovEsdUv
 2CBsYYlXx7ewQ9gyEqcn97BANLQzSiz4fZ8JwpnAKNHw/BYjRJW1xJ1zv4C6OYBWaEqs36UP
 EXaU2H2rCSwsIcAnceOtIMQRfBKTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzUIKl1lI
 /p+F5J1ZCHsXMLKsYhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECEygp/8d/7KDcfmrj3qH
 GJk4GA8xSnAwK4nwts+MTxHiTUmsrEotyo8vKs1JLT7EKM3BoiTOq217MllIID2xJDU7NbUg
 tQgmy8TBKdXAtHS+YV3fp0/z3aMdGVV6A+V+yKTYvd5yXPEGR9a/QFZHo0s6Wi7T1JatS289
 Oi/5QEbKI8FL6g++iXzp8XTS8HzBsK67ZPeS9O8+bf+LbrkLZxU0xImuPfxu5sfpM5JKovf7
 vVxlwxjbsNEwTv+zudjiNB63T+sPzzw9s8xj0j0VJbvl+x64BVfJ/D+mdjFf4E/2J7d38/cE
 G9g95P35R/F1sNK98p5U1nk2Dpula7apb7D8pG+itsiV/cHdI36C2QZfVUV+Vnu+WBDz9vvW
 959jTdykp8/Lmf7Wdvbnx/HlP57OWHXYL/9Fqv/rPRYcLdfcGkLZndlD35gqX+th3lUQduqt
 2E73qXPn2F+LUWIpzkg01GIuKk4EAJu9Pq8PBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42I5/e/4PV2Vh4kpBqc/aVjcuX2a2WL31W52
 i/uLP7NYXPn6ns2id+k5VosvmyawWTyfv47R4uSbqywWD+beZLLonLiE3eLyrjlsFm/aGhkt
 3p7ewG7xfuctRotJ826yWsxou8zqIOCx9uN9Vo+XyxuYPWY3XGTxmDfrBIvHzll32T1md8xk
 9Vi85yWTx6ZVnWweR64uZvU4MeESk8eda3vYPO53H2fy6P9r4PF5k5zHgb0tbAH8UXo2Rfml
 JakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZz59PZy/olqzo
 aOlmb2BcL9LFyMkhIWAi8X3TB8YuRi4OIYGljBLzO9+xQSRkJE5Oa2CFsIUl/lzrYoMoes8o
 MeXJDrAEr4CdRPP9CWA2i4CqxJSnU5gh4oISJ2c+YQGxRQVSJU4uvQFmCwtESRz8uBJsAbOA
 uMStJ/OZQGwRASWJu2f+gl3BLHCYRWL99eVgQ4UEDjBLzPinCmKzCRhKdL3tAmvmFAiUuLnz
 PCPEIDOJrq1dULa8RPPW2cwTGIVmIbljFpJ9s5C0zELSsoCRZRWjSGppcW56brGRXnFibnFp
 Xrpecn7uJkZgyth27OeWHYwrX33UO8TIxMF4iFGCg1lJhLd9ZnyKEG9KYmVValF+fFFpTmrx
 IUZTYGBMZJYSTc4HJq28knhDMwNTQxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5O
 qQamnWsmZCefLrn4aq3c7+9sdW5nFsUv97pxSackk32N5elNz6JezFM9HlhYvenPxWtb8n+v
 X7V9Wef75XfYIi167yQGn5h7cPaupCCLeO9zJiarTsw7+FTkwFxDU6GWvW9c1ime33Dn8LmA
 n0faN8lPrpgfVP3jYN5Z+yauD2bq67c37uU8Fs3C+bsprKlgtvyX01ftS28svDVb5svS2RPk
 rjKGOr2b/t+eT22SasB85sz832WdT1ZqLzx33vSAEfNDC4WIw9z/lQq2XCn9tnLLj7zS199y
 Llw0bfMuvO4rnLxMYJX33Zxt3xna+7g2Wj7L/KnMKl1nI/HM3yB24oWwSe8qtzPtWrZIyPPc
 lg+S3J+UWIozEg21mIuKEwHxgbUWogMAAA==
X-CMS-MailID: 20230515073708eucas1p2b1fc755549303023853b9ff334d733ce
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
 <7a83b8c1-88ff-0ae6-9c3b-d49fc08c7ac0@samsung.com>
 <CAHCN7xLZNvMx=U9=Fp=qrG9xaMhU1PS_nQO5FfC2S+XLO8YLXQ@mail.gmail.com>
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
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Michael Walle <michael@walle.cc>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.05.2023 06:25, Adam Ford wrote:
> On Fri, May 12, 2023 at 4:02 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 12.05.2023 22:00, Adam Ford wrote:
>>> On Fri, May 12, 2023 at 2:37 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>>>> Am Samstag, dem 06.05.2023 um 14:24 -0500 schrieb Adam Ford:
>>>>> The DPHY timings are currently hard coded. Since the input
>>>>> clock can be variable, the phy timings need to be variable
>>>>> too.  Add an additional variable to the driver data to enable
>>>>> this feature to prevent breaking boards that don't support it.
>>>>>
>>>>> The phy_mipi_dphy_get_default_config function configures the
>>>>> DPHY timings in pico-seconds, and a small macro converts those
>>>>> timings into clock cycles based on the pixel clock rate.
>>>>>
>>>> This week I finally had some time to take a deeper look at this series
>>>> and test it on some of my systems.
>>> Thanks for testing this!
>>>> This patch causes issues when the burst clock rate is fixed by
>>>> supplying the DT entry. Instead of describing the issue below, I'm
>>>> attaching the patch that makes things work on my system.
>>> Oops, sorry about that.
>>>
>>>> I would appreciate if you could test this one on your side. Feel free
>>>> to squash it into yours if you find it working properly.
>>> I reviewed your patch, and it looks like it makes a lot of sense.
>>> If it works, I'll squash them together and add your name to the sign-off.
> That worked really well, I'll add it to my WIP directory since Marek S
> said he'd test the other proposal of dropping the dynamic phy flag and
> corresponding check in favor of pushing everyone to the same code.
>
>>>> Also I would almost bet that dynamic_dphy is working on the Exynos
>>>> boards with that fix added. So if anyone with access to those boards
>>>> would like to give it a shot, we may be able to get rid of the
>>>> hardcoded PHY parameters altogether, which would be a nice cleanup.
>>> I wondered the same thing, but I didn't want to create more work for
>>> Marek S and since there was so much churn getting the original driver
>>> ported, I thought it would be the safest thing to try to give the
>>> imx8m m/n/p the features without breaking the Exynos.
>>>
>>> Marek S - Do you want me to post this file without the extra checks to
>>> see if it still works with Exynos?
>> Feel free to send me patches to test or just point to your
>> work-in-progress git repo.
> Thanks for testing this, Marek S.  My work-in-progress branch is:
>
> https://protect2.fireeye.com/v1/url?k=2eeb1ed9-4e098384-2eea9596-000babd9f1ba-9ad5c339e5ea6e4d&q=1&e=652be603-d622-4d0e-95d3-639656ab1af1&u=https%3A%2F%2Fgithub.com%2Faford173%2Flinux%2Ftree%2Fdsim-updates-wip
>
> Depending on what you find will determine how I modify the next
> revision of the code I push, so I very much appreciate your feedback.
> Hopefully the suggestion from Lucas will work for your applications
> and we can reduce some of the code complexity.

The above mentioned 'dsim-updates-wip' branch works fine on all my 
Exynos based boards.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

