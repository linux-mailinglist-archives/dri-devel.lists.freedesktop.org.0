Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845EE6F1A25
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 16:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA63F10E13C;
	Fri, 28 Apr 2023 14:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D103210E13C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 14:04:55 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230428140452euoutp021c4aee36dd41b0084175657c62c7a88e~aHkTxwB_S0328203282euoutp02-
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 14:04:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230428140452euoutp021c4aee36dd41b0084175657c62c7a88e~aHkTxwB_S0328203282euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682690692;
 bh=EEtGe+wC47aB14p+DivmoE+r5CH+S8ucH6jCvDwAe4U=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=k6RP6w9kDJ2nKQT/HsYHToW0EkvBh74tYVrsmTXu61J/u8mkRVXg6HZHjYHzGT6bc
 Atle8maLFIpyYHpI8WHBayt3VI3DwkA2xAwxfTl/kQ3beBtNIMBQxaXvhalzvUbr3u
 hTfmERjfu6ej/cb/Ff9uAZpsmTDgFFY22wJiYm6E=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230428140451eucas1p15749d752a76bc63e9a7664cabfef9caa~aHkTeEraG0945809458eucas1p1j;
 Fri, 28 Apr 2023 14:04:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 57.DF.35386.382DB446; Fri, 28
 Apr 2023 15:04:51 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230428140451eucas1p14a5f254adb9477e517327cb1572b1710~aHkTAJxWW0947109471eucas1p1n;
 Fri, 28 Apr 2023 14:04:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230428140451eusmtrp22215fcddd4d373bae7de42d3bb2b01fa~aHkS-UIy62734327343eusmtrp2P;
 Fri, 28 Apr 2023 14:04:51 +0000 (GMT)
X-AuditID: cbfec7f4-cc9ff70000028a3a-2a-644bd283992b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9F.E4.14344.382DB446; Fri, 28
 Apr 2023 15:04:51 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230428140450eusmtip1f98789af73ddbb43bf193cdb93a7c58f~aHkSHJYBy2624626246eusmtip1R;
 Fri, 28 Apr 2023 14:04:50 +0000 (GMT)
Message-ID: <46429c9b-cf14-a67e-81a8-b56be0350ea3@samsung.com>
Date: Fri, 28 Apr 2023 16:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH V2 5/6] drm: bridge: samsung-dsim: Support non-burst mode
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAHCN7x+QU29Wv9TQEANhbxLcL4jCZUKbk+uGu2sOwhCcTt798A@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTZxjNe796S6xcS03fsA9dRRcwK+pIdtmmcZGxa2bizBIykIi13CEO
 sGtlU4ZJxQ1pUSh1GaPlFiIwWDeKQSyfRiQbpcjA1VWlw1SdwUlKGBRacYBbuXXj33nOc07O
 ed68JCouJqLJ7LxjrDpPkSMjIjB7//zIa6dd72duKda+To/9fh2lu92lAnrg9gWE9tb5MfqZ
 vQKlKzrMBP3b3BRBn2sYxmmj14DRs60Ggn5UYwO00+fG6HvcKELrKuoF9M2uaoL2FZ8C9FSn
 B9BGyyi+U8w0T3tx5nGjFmUspgGMuRKoxZhO010BYy6pwpm6nscI02rVEcxP7jqcGTC4EGbs
 Vg/BeEsdCFO+uIUpa7MCxt/68geRaRFvZ7I52Z+x6vgdByMON9+rRlSO6OO2GwuEFvSu1QMh
 CakE2GQLInoQQYqpJgDHuXqcH2YBtD85Gx78ALa3LIDnloo+m4BfNALodVSGVdMAmq+Z8ZBK
 RO2AT3qdWAhj1EbYa/oK8Pwa6Kx6uMyvpVhYZPYJQjiK2gtvuazLGKWk0POwBglhCSWDd4cW
 Ac/PY7D0jjSECWor1E/qCT0gSSG1D3aOfchL1sHTl81oqA+kAkL4fZsH51snwYnhM+ELouCE
 o03A4xfhs84ahDecAbD2b294MACofeQJO96CY8NPl9NQKha2dMXz9DtwqOE8GqIhtRremVzD
 l1gNjfbKMC2CJcViXr0Jmhy2/2Kv3XChBiAzrXgV04rrTSvOMf2fWwswK5Cy+ZrcLFazLY/9
 XK5R5Gry87LkyqO5reDfr3p9yTHbARonpuV9ACFBH4AkKpOIRCfeyxSLMhUnClj10Qx1fg6r
 6QMvkJhMKtq83akUU1mKY+wnLKti1c+3CCmM1iLp24mi0qptvqeeYP167lN36kGigLvquxqz
 b+IX6+3CjcH15QmcdFdzHPHxjw1pyhT03Ywj6f3G+6k9qp2bI/1xuxWqI9KC8aFT7d0tWdS8
 ZW9KVfBX3cj85RFrkeHV8j2DB2It/qYEIZfUXqKUBy92pK6qFhgT/7x/qWFhJvDFnpQYl7Ic
 t/lnmp12VdmGjLnCSkmXZFXhrrT+xj8cFt3UptH4yGQ0cW5JfjNw/I3Bb2J3c2/Gn3V/HbV/
 XM5deKBvT4055/9hPxG5TrOY2K17wPyVVDScPHMy6tuRaq5wSPdR7eB3ZcaXAgqJ+uQr2cm9
 IH1q8stDS84N1BVnf8HPMkxzWLE1DlVrFP8ADwxgyBkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsVy+t/xu7rNl7xTDK4dFrK4c/s0s8Xuq93s
 FieuL2KyuL/4M4vF/20TmS0m7pjNZnHl63s2i96l51gtJt2fwGLxZdMENovn89cxWpx8c5XF
 4sHcm0wWnROXsFtc3jWHzeJNWyOjxfudtxgtJs27yeog5LH2431Wj5fLG5g95s06weKx99sC
 Fo+ds+6ye8zumMnqsXjPSyaPTas62TyOXF3M6nFiwiUmjzvX9rB53O8+zuTR/9fAo2/LKkaP
 z5vkAvij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S
 9DLWPpjDVHBcqmLdhT9sDYwHRLsYOTkkBEwkJh5ax97FyMUhJLCUUWLO/4VsEAkZiZPTGlgh
 bGGJP9e6wOJCAu8ZJaZ0RYHYvAJ2Ej8OnGQBsVkEVCUOzGplhIgLSpyc+QQsLiqQKnFjzx+w
 XmEBX4lzcxrAapgFxCVuPZnPBGKLCChJ3D3zlxHkCGaB3ywSv48fY4G4aCuzxMxH38Gq2AQM
 JbreglzBwcEpECix804wxCAzia6tXVBD5SWat85mnsAoNAvJHbOQ7JuFpGUWkpYFjCyrGEVS
 S4tz03OLjfSKE3OLS/PS9ZLzczcxApPItmM/t+xgXPnqo94hRiYOxkOMEhzMSiK8vJXuKUK8
 KYmVValF+fFFpTmpxYcYTYGBMZFZSjQ5H5jG8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNIT
 S1KzU1MLUotg+pg4OKUamOoKFgl7ls5gnh67MKp1xaOpsj4a1kfynh3L5DpuP98o7exziTfH
 Hh9XOr3JT7VHXLbnwpS/MgJWeWpsxvoSs0R26remBU5oSON6/WGvpbPl1tIn28UCNX0V1r9a
 NMXm4s0lWk93f9pj/iJ+jlab5dOpJk+/TjqXyT8z9lbd2uA2D+Xpv9dvn9hXszFvmZxNw+WA
 DWEytfLZ5SGqKnlOem8OyRxzjFjw4Hq5YVO9+4PK1k/cu4wnHW07d2fnjBl3HZ+9XJYUqbe+
 YZnymuPrFq2xZi8xy764dWumZNXppiUPzz9wneUlJZFl6rL8SHiBJA9fvJ30q6bzAid4OH0Z
 Nz1wWhMYmiSROGuWdSGzlBJLcUaioRZzUXEiACOK0X6rAwAA
X-CMS-MailID: 20230428140451eucas1p14a5f254adb9477e517327cb1572b1710
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230423121305eucas1p287a952d41b1884b117fa15a748b9e1a2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230423121305eucas1p287a952d41b1884b117fa15a748b9e1a2
References: <20230423121232.1345909-1-aford173@gmail.com>
 <CGME20230423121305eucas1p287a952d41b1884b117fa15a748b9e1a2@eucas1p2.samsung.com>
 <20230423121232.1345909-6-aford173@gmail.com>
 <b6b53da5-6986-a958-ef84-650b3a57ad9c@samsung.com>
 <CAHCN7x+vd-bP8NgS-cRrnm8ojq0kwUg6aXokJv6xSU7BrT04Vw@mail.gmail.com>
 <343f8d25-566f-9d14-64db-4e796cc9e406@samsung.com>
 <CAHCN7x+QU29Wv9TQEANhbxLcL4jCZUKbk+uGu2sOwhCcTt798A@mail.gmail.com>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.04.2023 15:35, Adam Ford wrote:
> On Fri, Apr 28, 2023 at 7:31 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 24.04.2023 12:00, Adam Ford wrote:
>>> On Mon, Apr 24, 2023 at 3:25 AM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 23.04.2023 14:12, Adam Ford wrote:
>>>>> The high-speed clock is hard-coded to the burst-clock
>>>>> frequency specified in the device tree.  However, when
>>>>> using devices like certain bridge chips without burst mode
>>>>> and varying resolutions and refresh rates, it may be
>>>>> necessary to set the high-speed clock dynamically based
>>>>> on the desired pixel clock for the connected device.
>>>>>
>>>>> This also removes the need to set a clock speed from
>>>>> the device tree for non-burst mode operation, since the
>>>>> pixel clock rate is the rate requested from the attached
>>>>> device like an HDMI bridge chip.  This should have no
>>>>> impact for people using burst-mode and setting the burst
>>>>> clock rate is still required for those users.
>>>>>
>>>>> Signed-off-by: Adam Ford <aford173@gmail.com>
>>>> This one breaks Exynos-5433 based TM2e board with a DSI panel.
>>> Marek S,
>>>
>>> Thank you for testing!  I knoiw there are several of us who appreciate
>>> your testing this since it's hard to know if something broke without
>>> hardware.  Is there any way you can tell me if the flag is set to
>>> enable MIPI_DSI_MODE_VIDEO_BURST?
>> TM2e board uses the DSI panel operated in command mode and handled by
>> panel-samsung-s6e3ha2.c driver. The MIPI_DSI_MODE_VIDEO_BURST flag is
>> not set by the driver. However, the MIPI_DSI_CLOCK_NON_CONTINUOUS flags
>> is set there. I really have no idea if setting VIDEO_BURST would make
>> sense together with CLOCK_NON_CONTINUOUS or not. Maybe the driver lacks
>> setting it?
>>
>>
>>> I was trying to be diligent about not breaking your boards, but
>>> without your boards, it's difficult.  The theory was that if
>>> MIPI_DSI_MODE_VIDEO_BURST is set and there is a burst clock set in the
>>> device tree, it would use the burst clock.
>>>
>>> As a fall-back I could just simply check for the presence of the
>>> burst_clock_rate instead of both MIPI_DSI_MODE_VIDEO_BURST and
>>> burst_clock_rate.
>> Maybe you should extend your check also for the
>> MIPI_DSI_CLOCK_NON_CONTINUOUS flag? Does it make sense?
> Looking at some of the devices that might attach in the future, It
> appears that ti-sn65dsi86.c sets this flag.  It's a display port
> bridge, so I would expect it to need a variable clock rate similar to
> how the HDMI bridge that I need works.  I am concerned that I make the
> burst clock dependent on MIPI_DSI_CLOCK_NON_CONTINUOUS, it might break
> the Display Port bridge.
>
> I think it's better to just check if the samsung,burst-clock-frequency
> is present in the device tree and use it when present.  If it's not
> present, then fall back to the pixel clock of the connected device.

Right, this sounds rational.

> I looked at a bunch of Exynos parts, and it looks like they all use
> the samsung,burst-clock-frequency device tree setting.  Is that true,
> or did I miss one?

That true. All Exynos based boards with DSI panels use constant DSI 
burst frequency defined in the device tree.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

