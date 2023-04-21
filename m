Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165BD6EA91B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7871310E130;
	Fri, 21 Apr 2023 11:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D733610EE06
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 11:28:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230421112842euoutp0186147c4c471fef04e9525315b1b1c479~X769xjp4N2923729237euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 11:28:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230421112842euoutp0186147c4c471fef04e9525315b1b1c479~X769xjp4N2923729237euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682076522;
 bh=dGU/WK8Le8mmtFesutmQKIo9RcAx4ZOdI9l12AmUGN8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=bneS3JfYGzuZJV4c1uInsmN7lofnBuN0d7D59uxZFvsO0rYtwT/VP40FCwyJaRewi
 JC1QZNjq8PfzB6R126NjNdAnOPxVI2QK4K5q/ZzefLTjfUOBNt5hdiV1tq+7limI2u
 G4oDPZoZwzfwg0RlOTWeCxbbm3aWSvqv8AbUbAQQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230421112841eucas1p2bdc8808aa6cbc85b9d9bc3d53862181f~X769Ik_rQ0627706277eucas1p2D;
 Fri, 21 Apr 2023 11:28:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 91.58.09966.96372446; Fri, 21
 Apr 2023 12:28:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230421112841eucas1p2ac3d94beca24f038b983681afd6275c2~X768eJ_fb0842208422eucas1p2A;
 Fri, 21 Apr 2023 11:28:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230421112841eusmtrp15a113d10394ed3160f66eac93b3dd266~X768dORF03228632286eusmtrp1J;
 Fri, 21 Apr 2023 11:28:41 +0000 (GMT)
X-AuditID: cbfec7f4-d4fff700000026ee-01-644273697627
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E6.7F.22108.96372446; Fri, 21
 Apr 2023 12:28:41 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230421112839eusmtip29b702227ba348551cba4027b22e731df~X767QwsZM2676726767eusmtip2J;
 Fri, 21 Apr 2023 11:28:39 +0000 (GMT)
Message-ID: <8cdb2f0d-f6a2-a04c-2cf4-c0762a47c050@samsung.com>
Date: Fri, 21 Apr 2023 13:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 1/6] drm: bridge: samsung-dsim: Support multi-lane
 calculations
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Adam Ford <aford173@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <56a805b4a74f620f7948f57d416b135effb6e52d.camel@pengutronix.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTdRzu+77v3r1bjl7nOr4QR7EEm1w4zOxrkYrXj7fDOz27uEvvxAVv
 SPGrDVTSs1XO2MQ5KC4YP0s8cKLGxvg5OJnYRgQRAcLCG5x4/HBECzJFwRivFv893+fzPPc8
 n899KVxsIgOppNQMVpmqSJaSQqLux3u/vJik2pEgX7j7Ehr+vRNHzf2n+Mh5/XsMuc/OEuhh
 XS6Oytq7eajv7xkSjfbvQnluA4HmzAYSjZddAqjD008gU34jgfQTozgaKRnCkDa3go/MNwd4
 SDd/Hke/NRWTyHPyc4BmGl0A5ZUO8ZCmpZ2PFurNBJqo9d8ewFz0unnMZKUaZ0qNToJpuVNO
 MI3GG3ymKLuQx5y1TWKM2aQlGaehF2OGB2wk4z7lwBhLxWdMzR8NGHNmQc7oa02AmTUH76b3
 CqMS2OSkQ6xyw9YDwoMT18aw9IlNR25e8QI18Mh0QEBBehNcLF/g+bCYrgJQXbFRB4RLeA7A
 hl87ce4xC6BW8yf22GE5MY1xg0oA20esj1ReAN19DUAHKEpEb4UFd2J8BoIOhc1aC+HDIno1
 7CgcW8ZP0yz8osjD98nX0O9Biwv5aJz2h66xsuUsCc3Ayuy85SycHiPhYkXx8oCkI6FuWkf6
 sIDeCS8PnCY487PwS2vRch9IW4WwQ1P0qPUb0P4gh8fhNXDKUcvncBDs/DqH4AxfAVh+341x
 D8PSMcZdgFO9Boe750lfVZyWwctNGzg6GnbrS3g+GtJ+cHB6NVfCD+bVfYtztAhmnxRz6jBo
 dFz6L7atpxc3AKlxxVmMK/Y3rljH+H9uOSBMwJ/NVKUksqqNqezhCJUiRZWZmhgRn5ZiBkvf
 uXPRMdcAKqe8EXaAUcAOIIVLJaIZ+Y4EsShBkfUpq0yLU2Ymsyo7eIYipP6i8Nc74sV0oiKD
 /Zhl01nl4ylGCQLVWGFTkvz2qsAQ7MKhmEz1seDW87EXYt5Xv6A3t64S7A9PbJLELYa9feKu
 MmDQZC4QTr05rfmh+FzPRfnm+d1dkdEf7VoHu8fJtr9kElRDyL3bpT9vu7V2S4kE1Zcezd/c
 u/6n9A8yUkqigu3WEIsHRMU+mdVMBeyzvTxje6JqNjT/u1HN6U9ybh84t7N6X2juFkfDP+98
 eCz2ufIqEHRN4PeWteuoyhpni9SeEXS/K7xafO/GUw9k6/a0pl3vUt8qeghGqqrbnPgereHw
 lePV8y1Z39SbFduin3d5a+wDqUdeOa68H0b37O0rEHStHXLqJxPCpgquevcHvVobLwvxhg8a
 56VSQnVQEbkeV6oU/wL1z4xjPQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsVy+t/xe7qZxU4pBh+nsVncuX2a2WL31W52
 ixPXFzFZ3F/8mcXi/7aJzBbzj5xjtbjy9T2bxcOr/haT7k9gsfiyaQKbxfP56xgtTr65ymKx
 aupOFou+Fw+ZLR7Mvclk0TlxCbvFpsfXWC26fq1ktri8aw6bxZu2RkaL9ztvMVpMmneT1aJ1
 7xF2i7/bN7FYvNgi7iDpsfbjfVaPl8sbmD3mzTrB4rH32wIWj52z7rJ7zO6YyeqxeM9LJo9N
 qzrZPE5MuMTkcefaHjaP+93HmTw2L6n32PhuB5NH/18Dj74tqxg9Pm+SCxCI0rMpyi8tSVXI
 yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mt4cfQJU8ELk4rHBz4y
 NjC+0exi5OSQEDCR2NzylqmLkYtDSGApo8SUs19ZIBIyEienNbBC2MISf651sUEUvWeUmLbo
 CnMXIwcHr4CdxIxv3iA1LAKqErs7N4P18goISpyc+QTMFhVIlbix5w8bSLmwQKjE5lsWIGFm
 AXGJW0/mM4HYIgIeEss7JoHdwCzwgk1i98dGZpCEkMA6Vom+u6UgNpuAoUTXW5AbODk4BXwk
 1l/rZYEYZCbRtbWLEcKWl2jeOpt5AqPQLCRnzEKybxaSlllIWhYwsqxiFEktLc5Nzy021CtO
 zC0uzUvXS87P3cQITEbbjv3cvINx3quPeocYmTgYDzFKcDArifC+N3BKEeJNSaysSi3Kjy8q
 zUktPsRoCgyLicxSosn5wHSYVxJvaGZgamhiZmlgamlmrCTO61nQkSgkkJ5YkpqdmlqQWgTT
 x8TBKdXAZL8oRqr9gPRpq62uu1e1ysQ1OH4QkN5mdng294Npxy669fqnttuJ20tzZ1s8UQxq
 OHZol0WxRXZBWK6Kvb+wtls8R2P/nVZpl12edTe+fbunrvVUMC23rL7wXs/ber+ysM73Pz/b
 n7+zy0S0XI57ctVh5YhP0e+Zr8g73+ep/H+01SW899sik4pLUpnOiWr8Cmbv3zBeOvzrS0gP
 q5dywbS/vydkz798XWvdpQUqf2Y6R9x6u3VK19sk2RCGZetuWdsvD3Rw6f/2XzBszdOqj112
 v/jfplq/ylALCpgsWjAvt3/3dj+xw++Op7FxWxnKp4RnL+ktu1Dt4iF0ImbznHZdj54PfMfS
 xZ6mBiuxFGckGmoxFxUnAgDoPnh9zwMAAA==
X-CMS-MailID: 20230421112841eucas1p2ac3d94beca24f038b983681afd6275c2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230421084034eucas1p14b1bcf83a86f7a2a828eac2d42eb1449
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230421084034eucas1p14b1bcf83a86f7a2a828eac2d42eb1449
References: <20230415104104.5537-1-aford173@gmail.com>
 <3e47f0d1017fe4c9f71a5de65f32c6ba1662efe2.camel@pengutronix.de>
 <CAHCN7xL4+9NogrnXA1PEWorwY7JpSGBozDtHT83JvzjfinmS+A@mail.gmail.com>
 <CAHCN7xK8K+DsNAFTVAezwJQzZ7RCDb2CjCBZ8dNb=S8d1BmtMA@mail.gmail.com>
 <f42a2a11c1a2df4d773b61a449e8f4d5a9a010d1.camel@pengutronix.de>
 <CAHCN7x+bZHZHxYk=qC3QFS07kLO85w_rj1tOuX1Y3fJXekmvMQ@mail.gmail.com>
 <19d2c40180d0b9176e17aa6e91c1e7f36f77f626.camel@pengutronix.de>
 <CAHCN7x+HYmGoxZ107OdY1aJYtjNWB4p3fqJ1tGjOAK2eO356yA@mail.gmail.com>
 <CGME20230421084034eucas1p14b1bcf83a86f7a2a828eac2d42eb1449@eucas1p1.samsung.com>
 <56a805b4a74f620f7948f57d416b135effb6e52d.camel@pengutronix.de>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, marex@denx.de,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.04.2023 10:40, Lucas Stach wrote:
> Am Donnerstag, dem 20.04.2023 um 16:51 -0500 schrieb Adam Ford:
>> On Thu, Apr 20, 2023 at 8:43 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>>> Am Donnerstag, dem 20.04.2023 um 08:24 -0500 schrieb Adam Ford:
>>>> On Thu, Apr 20, 2023 at 8:06 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>>>>> Hi Adam,
>>>>>
>>>>> Am Mittwoch, dem 19.04.2023 um 05:47 -0500 schrieb Adam Ford:
>>>>>> On Mon, Apr 17, 2023 at 6:55 AM Adam Ford <aford173@gmail.com> wrote:
>>>>>>> On Mon, Apr 17, 2023 at 3:43 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>>>>>>>> Hi Adam,
>>>>>>>>
>>>>>>>> Am Samstag, dem 15.04.2023 um 05:40 -0500 schrieb Adam Ford:
>>>>>>>>> If there is more than one lane, the HFP, HBP, and HSA is calculated in
>>>>>>>>> bytes/pixel, then they are divided amongst the different lanes with some
>>>>>>>>> additional overhead. This is necessary to achieve higher resolutions while
>>>>>>>>> keeping the pixel clocks lower as the number of lanes increase.
>>>>>>>>>
>>>>>>>> In the testing I did to come up with my patch "drm: bridge: samsung-
>>>>>>>> dsim: fix blanking packet size calculation" the number of lanes didn't
>>>>>>>> make any difference. My testing might be flawed, as I could only
>>>>>>>> measure the blanking after translation from MIPI DSI to DPI, so I'm
>>>>>>>> interested to know what others did here. How did you validate the
>>>>>>>> blanking with your patch? Would you have a chance to test my patch and
>>>>>>>> see if it works or breaks in your setup?
>>>>>> Lucas,
>>>>>>
>>>>>> I tried your patch instead of mine.  Yours is dependent on the
>>>>>> hs_clock being always set to the burst clock which is configured by
>>>>>> the device tree.  I unrolled a bit of my stuff and replaced it with
>>>>>> yours.  It worked at 1080p, but when I tried a few other resolutions,
>>>>>> they did not work.  I assume it's because the DSI clock is fixed and
>>>>>> not changing based on the pixel clock.  In the version I did, I only
>>>>>> did that math when the lanes were > 1. In your patch, you divide by 8,
>>>>>> and in mine, I fetch the bits-per-pixel (which is 8) and I divide by
>>>>>> that just in case the bpp ever changes from 8.  Overall,  I think our
>>>>>> patches basically do the same thing.
>>>>> The calculations in your and my patch are quite different. I'm not
>>>>> taking into account the number of lanes or the MIPI format. I'm basing
>> I was taking the number of lanes into account in order to calculate
>> the clock rate, since 4-lanes can run slower.
>>
> Ah that makes sense if you aren't running at full clock burst clock
> rate.
>
>>>> I was looking more at the division by 8 and the overhead correction of 6.
>>>> This number 6 also appears in the NXP downstream kernel [1].  I know
>>>> Marek V had some concerns about that.
>>>>
>>> Yea, I don't fully remember the details about the overhead. Need to
>>> page that back in. The division by 8 in my patch is just to get from
>>> the bit to a byte clock, nothing to do with the MIPI format bits per
>>> channel or something like that.
>>>
>>>>> the blanking size purely on the ratio between MIPI DSI byte clock and
>>>>> the DPI interface clock. It's quite counter-intuitive that the host
>>>>> would scale the blanking to the number of lanes automatically, but
>>>>> still require the MIPI packet offset removed, but that's what my
>>>>> measurements showed to produce the correct blanking after translation
>>>>> to DPI by the TC358767 bridge chip.
>>>> How many lanes is your DSI interface using?
>>>>
>>> When I did the measurements to come up with the patch, I varied the
>>> number of lanes between 1 and 4. Different number of lanes didn't make
>>> a difference. In fact trying to compensate for the number of lanes when
>>> calculating the blanking size to program into the controller lead to
>>> wildly wrong blanking on the DPI side of the external bridge.
>>>
>>>>> If you dynamically scale the HS clock, then you would need to input the
>>>>> real used HS clock to the calculation in my patch, instead of the fixed
>>>>> burst mode rate.
>>>> I think what you're saying makes sense.
>>>>
>>>> The code I originally modeled this from was from the NXP downstream
>>>> kernel where they define the calculation as being in words [2]. I am
>>>> not saying the NXP code is perfect, but the NXP code works.  With this
>>>> series, my monitors are able to sync a bunch of different resolutions
>>>> from 1080p down to 640x480 and a bunch in between with various refresh
>>>> rates too. That was the goal of this series.
>>>>
>>>> Instead of just using your patch as-is, I will adapt yours to use the
>>>> scaled clock to see how it behaves and get back to you.
>>>>
>>> Thanks, that would be very much appreciated.
>> Lucas,
>>
>> I took your patch and added a dsi state variable named "hs_clock"  to
>> keep track of the output of samsung_dsim_set_pll which should be the
>> active high-speed clock.
>>
>> I then replaced one line in your code to reference the hs_clock
>> instead of the burst clock:
>>
>> @@ -960,7 +962,7 @@ static void samsung_dsim_set_display_mode(struct
>> samsung_dsim *dsi)
>>          u32 reg;
>>
>>          if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
>> -               int byte_clk_khz = dsi->burst_clk_rate / 1000 / 8;
>> +               int byte_clk_khz = dsi->hs_clock / 1000 / 8;
>>                  int hfp = (m->hsync_start - m->hdisplay) *
>> byte_clk_khz / m->clock;
>>
>> With that change, your patch works with the rest of my code, and I
>> think it's easier to read, and it doesn't involve recalculating the
>> clock speed each time since it's cached.  If you're OK with that, I'll
>> incorporate your code into V2 of my series, and I'll apply my changes
>> as a subsequent patch.  I hope to be able to send out V2 this weekend.
>>
> That's good to hear! Seems we are converging here. Feel free to pick up
> the patch, that's also easier for me as I don't have to resend with CC
> fixed.
>
>> I would be curious to know frm Marek Szyprowski what the impact is on
>> the Samsung devices, if any.
>>
> Since I messed up the list CC you also couldn't see his reply to my
> patch:
>
> | Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> |
> | Works fine on the Exynos based boards I have in my test farm.

I didn't follow this discussion, I'm a bit busy with other stuff. I've 
just tested this series and patch #3 break Exynos based board. If you 
want me to test anything else (might be a work-in-progress code), just 
let me know by the separate mail.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

