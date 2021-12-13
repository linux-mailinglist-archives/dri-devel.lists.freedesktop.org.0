Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BAF472C0B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 13:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AC810E78F;
	Mon, 13 Dec 2021 12:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBBE10E78F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 12:12:35 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211213121233euoutp020628e00e0139eaaf2c6ae06a56b17de2~AT2OympxX3012730127euoutp02b
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 12:12:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211213121233euoutp020628e00e0139eaaf2c6ae06a56b17de2~AT2OympxX3012730127euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1639397554;
 bh=N5Vtnq2Dai2off7NG2qwZ0ZcWKrWIQ2MhF+518aNHNY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=NT+omhBsryncZ5DXPXHaBVMhJcdNDpZ0rPDRFqsKjP5oYf/h3oFUVZsV1gC5voQVd
 v4JA1dL3tCO5+9fuf6rQnxXJku8ygx8ojIKt8qmY/ymsmQnBKwfYdHF97qx3sY/7tV
 WBT0gc2bK676b3LTRlTPHUNd+aVe7qN4KMR7eYIA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211213121233eucas1p11d54421ab470f917eba742b0a11d41e2~AT2OaD2s02970729707eucas1p1f;
 Mon, 13 Dec 2021 12:12:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 1D.FF.09887.1B837B16; Mon, 13
 Dec 2021 12:12:33 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211213121233eucas1p1d72f1524524ea76bef51a1b0ad4e879d~AT2N4qDGp0807308073eucas1p1L;
 Mon, 13 Dec 2021 12:12:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211213121232eusmtrp2b9a6536dda0ea08186482541c83b3966~AT2N3nN9J2036220362eusmtrp2n;
 Mon, 13 Dec 2021 12:12:32 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-66-61b738b19960
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8B.7D.09404.0B837B16; Mon, 13
 Dec 2021 12:12:32 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211213121232eusmtip154491ba0227b534640e937a228275791~AT2NNI1sN0595605956eusmtip1Z;
 Mon, 13 Dec 2021 12:12:32 +0000 (GMT)
Message-ID: <2b5810d5-8af7-f960-94fb-bd08188a9ae8@samsung.com>
Date: Mon, 13 Dec 2021 13:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3 0/7] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZAX2thXTBcpwtUwP16wteKE_1OwWqPBivWTuRKb=B8ghQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRmVeSWpSXmKPExsWy7djP87obLbYnGszdrWRxf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJUYyuLxaG+aItPsx4yW6z4uZXRgctj7cf7rB7vb7Sy
 e8zumMnqsXjPSyaPO9f2sHnc7z7O5LFk2lU2j74tqxgDOKK4bFJSczLLUov07RK4MlatfMNa
 sJ6/YkHzJ8YGxk08XYycHBICJhK7fm9jBLGFBFYwSry5LNDFyAVkf2GUONZzjAXC+cwocevu
 HjaYjl+rlrJDJJYzSnR0PGSDcD4ySux6tpEZpIpXwE5i/7zdLCA2i4CqxO6Nsxkh4oISJ2c+
 AYuLCiRJtHb8YQKxhQUcJP6//MQKYjMLiEvcejIfLC4ioC3xbeZrsAXMAv+YJE5teQ1WxCZg
 KNH1tgvsJE6BQImJW3cxQjTLS2x/O4cZpEFCoJ1T4lHvS2aIu10kFrR8ZYGwhSVeHd/CDmHL
 SPzfCbINpKGZUeLhubXsEE4Po8TlphmMEFXWEnfO/QJaxwG0QlNi/S59iLCjxM4lb8DCEgJ8
 EjfeCkIcwScxadt0Zogwr0RHmxBEtZrErOPr4NYevHCJeQKj0iykcJmF5P9ZSN6ZhbB3ASPL
 Kkbx1NLi3PTUYqO81HK94sTc4tK8dL3k/NxNjMAUdvrf8S87GJe/+qh3iJGJg/EQowQHs5II
 70vrrYlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeZMzNyQKCaQnlqRmp6YWpBbBZJk4OKUamHz4
 tWy3LT3UnvQk7fIUv5Us931e/dtanHRwn2HmR/WMlypfnsvYiEZ9fZSz8O3R1MBn8+aH7/HO
 EjFQ1/Fery3q7eVwuLqtbpFIo8G0A5uPtLy3+qTIWa64ex6D95+dP3Nfxnx933u0I0R7d7nc
 2YOv9QKn2d1+v3iZ4YdIUecdx13dnl7/9vJumcfrvwVfrF1ihQ6JTOV8/JSrwkHdR2qGp7Wg
 3uzKsB0ey2QSix7M53A9qrEg6tyu5U9kpM5/TAn1ld58fdumiTLVtzOmOd5ZsYGjw7P18ESz
 JSdvRCuaNSrw7ez71yJ68KHY2uuFwrcOcVTvWJ2/ivfHZsmqoI1+MWX5c91rahz+LVmvuU2J
 pTgj0VCLuag4EQDTkNay0AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xu7obLLYnGlycZGVxf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJUYyuLxaG+aItPsx4yW6z4uZXRgctj7cf7rB7vb7Sy
 e8zumMnqsXjPSyaPO9f2sHnc7z7O5LFk2lU2j74tqxgDOKL0bIryS0tSFTLyi0tslaINLYz0
 DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MlatfMNasJ6/YkHzJ8YGxk08XYycHBIC
 JhK/Vi1l72Lk4hASWMoo8eLrPlaIhIzEyWkNULawxJ9rXWwQRe8ZJXbsXsoMkuAVsJPYP283
 C4jNIqAqsXvjbEaIuKDEyZlPwOKiAkkSu9dtZQOxhQUcJP6//AQ2lFlAXOLWk/lMILaIgLbE
 t5mvwRYwCzQxS7SdWM4KsW0ik8TLDy/ButkEDCW63naB2ZwCgRITt+5ihJhkJtG1tQvKlpfY
 /nYO8wRGoVlIDpmFZOEsJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERi12479
 3LKDceWrj3qHGJk4GA8xSnAwK4nwvrTemijEm5JYWZValB9fVJqTWnyI0RQYGhOZpUST84Fp
 I68k3tDMwNTQxMzSwNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgWlWWqzufj8zG+d9
 uafePXUKiVRP+Bhw3+mNr1PV9o+SetdPm5h/C/sszPDF0uaQeIhGvzuLcdEtl/1TL/ZfLz0y
 g9fmgIm4+xqOqcdmr23qzX8l/eJxEs8d80WrH0b8t3KZfVL+wQ+FesbSUzUnGdT/bJl5KODP
 FeFdy5ZHx9nPnKooatTAMbPl8MsZMyfuETwYpFPx9rC685dyxTd6B3kyJhzL17BVjwtZkPH0
 Fufhda7rBcuP3dCRsm3NrH/zRdPb8fWv7J7tsoo/PAWjklkmM1wwKuW1P3tza6f4ken/JB2U
 jr1ZpDg9w/AaH8/WS+fbIk4/1rpUd7p8Sk4US6U1o7uNRbVJAqdIvntsiBJLcUaioRZzUXEi
 AP9rZzdjAwAA
X-CMS-MailID: 20211213121233eucas1p1d72f1524524ea76bef51a1b0ad4e879d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0
References: <CGME20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0@eucas1p2.samsung.com>
 <20211212181416.3312656-1-jagan@amarulasolutions.com>
 <9c1f6bed-2a62-4d85-1bd0-95c0bd5f6c89@samsung.com>
 <CAMty3ZAX2thXTBcpwtUwP16wteKE_1OwWqPBivWTuRKb=B8ghQ@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 13.12.2021 13:08, Jagan Teki wrote:
> On Mon, Dec 13, 2021 at 5:34 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 12.12.2021 19:14, Jagan Teki wrote:
>>> Updated series about drm bridge conversion of exynos dsi.
>>>
>>> Patch 1: panel checker
>>>
>>> Patch 2: panel_bridge API
>>>
>>> Patch 3: Bridge conversion
>>>
>>> Patch 4: pree_enable, post_disable
>>>
>>> Patch 5: Atomic functions
>>>
>>> Patch 6: atomic_set
>>>
>>> Patch 7: DSI init in enable
>>>
>>> [1] https://patchwork.kernel.org/project/dri-devel/cover/20211210191922.2367979-1-jagan@amarulasolutions.com/
>>>
>>> Any inputs?
>> I've checked this patchset on Exynos based Trats2 board (the one with
>> simplest display pipeline: Exynos FIMD -> Exynos DSI -> s6e8aa0 DSI
>> panel). DRM stops working after the 2nd patch ("[PATCH v3 2/7] drm:
>> exynos: dsi: Use drm panel_bridge API"):
>>
>> # dmesg | grep drm
>> [    2.511893] [drm] Exynos DRM: using 11c00000.fimd device for DMA
>> mapping operations
>> [    2.518653] exynos-drm exynos-drm: bound 11c00000.fimd (ops
>> fimd_component_ops)
>> [    2.535699] exynos-drm exynos-drm: bound 11c80000.dsi (ops
>> exynos_dsi_component_ops)
>> [    2.543912] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
>> [    2.556107] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on
>> minor 0
>> [    2.573212] exynos-dsi 11c80000.dsi: [drm:exynos_dsi_host_attach]
>> *ERROR* failed to find the bridge: -19
> Look like you have missed to apply the Child lookup patch. is it so?
>
> Let me send it, I will CC you as well. And I will also send tc358764
> panel_bridge conversion.

The above log is from Trats2 board, which uses only the s6e8aa0 DSI 
panel. I've also checked the Arndale board, which has tc358764 bridge 
and it also doesn't work. Which patches I have to apply for the tests?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

