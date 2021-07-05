Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C433BBCBD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB5389AE6;
	Mon,  5 Jul 2021 12:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AC189AE6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:13:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210705121312euoutp02609edee33b4cda74087ad358122dbd2d~O4-1DSD491634216342euoutp02s
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:13:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210705121312euoutp02609edee33b4cda74087ad358122dbd2d~O4-1DSD491634216342euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1625487192;
 bh=jhQoyOq4j5ztuXa06+ODE3urKcHV8fvtEws4Dx3cOvU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=cc+EbcsK6pcA+n6cyC2+018VOKpcSWS3IKY2+DLu3sKtXezbds9i6yxo18lhshiZC
 o5wKTySWyj0/4xN9nrPF0z9fP7impRrGisdVRUDthw7/GOS7MnPtyZ2Acly/E9peT2
 F/ecSyHngC7KugSJ8M935pf0d/A8h91mCVGiIB6A=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210705121311eucas1p1a49464e10c0e259a57f629e4ac238975~O4-0h50Lf0122001220eucas1p1q;
 Mon,  5 Jul 2021 12:13:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 72.D4.42068.757F2E06; Mon,  5
 Jul 2021 13:13:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210705121311eucas1p19f4bdb0ebe891cb864e6d1b331b809f2~O4-zztNlo0081600816eucas1p1g;
 Mon,  5 Jul 2021 12:13:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210705121311eusmtrp1c3b93afc65ae283b9f513cb6f9fc3c7c~O4-zycZXM1026010260eusmtrp1R;
 Mon,  5 Jul 2021 12:13:11 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-d4-60e2f757267d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 80.11.31287.657F2E06; Mon,  5
 Jul 2021 13:13:10 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210705121309eusmtip123260c7c7ff4e317d54adbecc9632e15~O4-yqbzyC2630626306eusmtip1Z;
 Mon,  5 Jul 2021 12:13:09 +0000 (GMT)
Subject: Re: [RFC PATCH 03/17] drm/exynos: dsi: Use the drm_panel_bridge API
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <03653aa2-ed43-88b3-213a-9ccc99587844@samsung.com>
Date: Mon, 5 Jul 2021 14:13:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZB6Y91iOBPujNWZh9h5kO4p04NioiL2zJY_j_c_LqOxBw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0wTZxjHfe+u16OxzdHieCcEks4RmRFlm+aGm2FsI4e4KfEPo5hAgRuy
 QS1XC+qyiLg5LYV1UJTeEFRgHURZBBQUg7ES60IpSKkiKTCY66zQMRC2ThJZz8ON/z7P9/n5
 ffMSqPwUvprIUR9kWLUqV4lLsKt3/ulbv/vvifSNptsbqeFmh4iy2JtRqrY7QIPz0zg17tpB
 lTYEovIxI0bNtRhx6vHoPYy67PMjVG/xlJg69V29mLIYu3Cq5df7Ikr/rBGlqvq6EGrqxDFA
 WctSqVluPCBVePH4EPrSzJiInh76WkxzRaU4XcPdxehr3IiY/v6kWUTX3fAidLerTkS779/A
 6bESG0K31h+lL//RgdBlbU2AftoSsVO2V/JuFpObU8CwG7amS/YbLpoQjWvlocXmx2gRMEn0
 IIiA5Nvwt45qoAcSQk7+COBiayvgE3JyDsAe/Voh8RTAOWcteNlRV9a41GEB8JfKTpEQzADI
 2RxivkpBbodWh0fEcwi5Dv5lnsR5RskuHJb5V/KMk7FQ79O/0KXkVthptKE8Y+QaaJs6+0Jf
 RWbC6ZoqkVATDH82P8J4DiJTYLWdA8LMSNjuq0YFDoXDj2oR/iBIzgbB5/1juHD2h9CwaBYL
 rIBPbG1LHA57KgyY0HAcwHHHJbEQGAB0Flctmd4C3Y5ngUlEYEU0/On6BkF+H9pHRzFehqQM
 DvmChSNksPzqGVSQpfDkCblQHRV4n+b/1t7qH0CNQMkts8Yts8Mts8P9v/ccwJpAKKPT5mUz
 2jfVTGGMVpWn1amzYzIP5LWAwG/teW6b6wCWJzMxVoAQwAoggSpDpCGmiXS5NEt1+AjDHkhj
 dbmM1grCCEwZKs1ou5gmJ7NVB5nPGUbDsC+zCBG0ughZU5K4a9bpyXGJ1r4a3dufFbVvffyI
 YbL3022vV+45+oErVBN3lo1Ilib6h7y7Gz7bPKj/RJdfoZs0amoH7F9armRMVZs2J7EFJYUj
 0fMfZe1EI2+e9xS+Rs331XzrZx/ambDkh+ODss4L5KB1j6lbVnw3KqzjzA9vOWMxvS5bWnDH
 M7HLcUjx1Rd/poRvah+oLA23xLmLyb1wwd3dlrHdm09sc+fbEphW47BTt+nYtYyPM5PtKfK4
 VE/S76+k5icmLNQfeWddgiEC6VUMb1Er1Cvi76WflqQd7rz1QOxd1fjNe6NNvsjyhqTj5vYE
 Z3BUheb8g4LKhQXdinPMTYW/X4lp96ti30BZrepfccpinBwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsVy+t/xu7ph3x8lGFw7ZW5xa905VovlZ9Yx
 W8w/AmRd+fqezeLhVX+L3qVA3qT7E1gsvmyawGbx4t5FFouNb38wWZxtesNu0TlxCbvF8gn7
 2Cw2Pb7GatH1ayWzxYzz+5gs3rQ1Mloc6ou2+DTrIVBo8ks2BxGPtR/vs3q8v9HK7jGroZfN
 Y96sEyweO2fdZfeY3TGT1WPxnpdMHkeuLmb1uHNtD5vH/e7jTB6bl9R7bHy3g8mjb8sqRo/P
 m+QC+KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0
 MnrWTGEquMpT8X/dC+YGxilcXYycHBICJhKL+1YydjFycQgJLGWU2HOglRkiISNxcloDK4Qt
 LPHnWhcbRNF7RonF2yexgSSEBXwkDp17BlYkIqAt8W3ma7A4s8ARNomVk0MhGo4ySUy48ASs
 iE3AUKLrbRdYEa+AncTuCcfBtrEIqEgcfzMXLC4qkCzxc307VI2gxMmZT1hAbE6BQIk5Z2Yx
 Qiwwk5i3+SEzhC0vsf3tHChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy02
 1CtOzC0uzUvXS87P3cQITCbbjv3cvINx3quPeocYmTgYDzFKcDArifCKTHmUIMSbklhZlVqU
 H19UmpNafIjRFOificxSosn5wHSWVxJvaGZgamhiZmlgamlmrCTOu3XumnghgfTEktTs1NSC
 1CKYPiYOTqkGptCVd2zO+8/WnxV0odNT+WGWzTajOf9WGDAp2Z55vO6y0Vz9y0ZBaurzqnot
 Jj+0+Jgae3KuoFfs2sVrnd/syKg5GZJ09d1O0Z4Q/r9tj9NXB/BkechWvgpKfehQv+Xpc/ac
 v9U2bfp5zB9U32kdufJZbm1Kni7fwXavovQtjJ8+N+efyNm+97unudptti+XJu6a+urZse57
 c3RvHWx1v2IRdkhn26FlTaHOCVvLY0tVrs16qfpMwb10VtAL2QrTnDsLdT9q7pYSMd9as8D/
 sWbdI/EPbwpZP3zjuP155qOe9zGcbyaKJjxeL77nbvK5K07TU59s7L86Z4vOzFTX1ylr49V/
 zwntsrkaInH3JocSS3FGoqEWc1FxIgDZB5bbrwMAAA==
X-CMS-MailID: 20210705121311eucas1p19f4bdb0ebe891cb864e6d1b331b809f2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210704090432eucas1p2fa4225336e35f3f5fd2fbf5da99001ff
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210704090432eucas1p2fa4225336e35f3f5fd2fbf5da99001ff
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <CGME20210704090432eucas1p2fa4225336e35f3f5fd2fbf5da99001ff@eucas1p2.samsung.com>
 <20210704090230.26489-4-jagan@amarulasolutions.com>
 <7af964c7-0e92-f190-2a86-d7a061a05129@samsung.com>
 <CAMty3ZB6Y91iOBPujNWZh9h5kO4p04NioiL2zJY_j_c_LqOxBw@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.07.2021 14:00, Jagan Teki wrote:
> On Mon, Jul 5, 2021 at 5:18 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 04.07.2021 11:02, Jagan Teki wrote:
>>> Use drm_panel_bridge to replace manual panel and
>>> bridge_chain handling code.
>>>
>>> This makes the driver simpler to allow all components
>>> in the display pipeline to be treated as bridges by
>>> cleaning the way to generic connector handling.
>>>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> This breaks Exysos DSI driver operation (Trats board worked fine with
>> only patches 1-2):
>>
>> [    2.540066] exynos4-fb 11c00000.fimd: Adding to iommu group 0
>> [    2.554733] OF: graph: no port node found in /soc/fimd@11c00000
>> [    2.602819] [drm] Exynos DRM: using 11c00000.fimd device for DMA
>> mapping operations
>> [    2.609649] exynos-drm exynos-drm: bound 11c00000.fimd (ops
>> fimd_component_ops)
>> [    2.632558] exynos-drm exynos-drm: failed to bind 11c80000.dsi (ops
>> exynos_dsi_component_ops): -22
>> [    2.642263] exynos-drm exynos-drm: master bind failed: -22
>> [    2.651017] exynos-drm: probe of exynos-drm failed with error -22
> Thanks for testing it.
>
> Can you check Squash of 3,4 or 3,4,5 will work or not?

I've check both sets: 1-4 and 1-5 and none of them works. The result is 
same as above. If I remember correctly, last time when I played with 
that code, there was a problem with DRM core calling bridge ops in 
different order than when they are used by the Exynos DSI driver.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

