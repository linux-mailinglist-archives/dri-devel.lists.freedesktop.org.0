Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B3B475A92
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 15:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A8810E33D;
	Wed, 15 Dec 2021 14:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC3310E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 14:19:55 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211215141954euoutp027fd8059d98a2b8f80938c506a123f50b~A83_qDeN13034830348euoutp02Z
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 14:19:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211215141954euoutp027fd8059d98a2b8f80938c506a123f50b~A83_qDeN13034830348euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1639577994;
 bh=2RKJLSy/a+qR1vwH20eW08mcA3FmJbQj6pDdWjbaIjQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=DKu/rwKvgSNHlqPNLTHSsjyom9B8TUkocAbLws/giJm/OUWAltRf6Omw4vBU/8SYt
 HSCIQ5y5sRWt7mHWNk+9y+Ym2w3ZkRe5SBh3zbI4RA+vPjvi3/GxfTJsujkt2LKKPS
 +TBy2oGUaomSRK+ShbCf49X/l3LCc8bC6VQcsV3M=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211215141953eucas1p24e881d68ce517623d617cc10bb3c61ee~A83_I5LMP2555625556eucas1p2a;
 Wed, 15 Dec 2021 14:19:53 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AE.65.10260.989F9B16; Wed, 15
 Dec 2021 14:19:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211215141952eucas1p128395097ea763092f87ab33ffd1289ef~A839l1K_k2258822588eucas1p1P;
 Wed, 15 Dec 2021 14:19:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211215141952eusmtrp186968aa73e30f179a1fa24d2c6ac6ce2~A839kTji42298222982eusmtrp1w;
 Wed, 15 Dec 2021 14:19:52 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-f4-61b9f9892117
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D1.55.09404.889F9B16; Wed, 15
 Dec 2021 14:19:52 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211215141952eusmtip28b7d70cd5998e5341583a39585870478~A8387hXOa0111701117eusmtip2Z;
 Wed, 15 Dec 2021 14:19:52 +0000 (GMT)
Message-ID: <fe49e59a-1df7-fcdc-8258-581509bb8fe2@samsung.com>
Date: Wed, 15 Dec 2021 15:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v4 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZBmZo3wqzj2Si4Ydm1RtzGs7f89aCktgVvD==appfSCPQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0wTdxz317ter13aHCemX4vRpeqML9Ro9Paw0Wm2U7fEZckyH0NPvCAC
 hfRAx+OPiqnWDl0pEeg5AxkQKwwVhDqsL6qh0CZIFPCFaVCiEyUItEvqg0h7uPHf5/d55PP5
 /fIjMdoj15GpxmzeZOTS9YQKd7dFOpcei7Rwy8PlGBOsGsOZ7vAwwTiCdpwJNdoJ5lhxtYI5
 Y79GMP5DFpzxntjBjIr9GOOKNKN1KrZ+JChnh+9bFOwpq1POVl15IWP7eq8QbPA3n4ytLu0h
 2BNNtWgruV311V4+PfUAb1pm2K3aF7T7ZVnVul/bqhLNaHyGDSlJoFaBo6yYsCEVSVMuBL5K
 JxEVaCqEoOPVJkkYQ+C9dlP+MfHMLcol0xkEwUtpkmkEgbv4DzwqqCkDPLC8xqIYp+aD09om
 l/g46HAOxDwzqD1gsb6TRfF0ah2YrWMxD0Zp4eFARYyPpxbDv86XsXkYNS4Df9PLmImgVoBt
 yBabqqR+gFbXg8nwHDjcfAqLBoA6qoTivx4hafZGeHO9WyHh6TDoa5rEsyBQUoRLgcMI+jvr
 FdKhCMHdwvLJ9JfQ1/lmoo6cqFgI5y8vk+j1MOwPoCgNlAbuD8VJIzTgcJdhEq0G6xFacn8G
 ou/cf7WtXXcwO9KLU95FnHJ/ccp1xP97KxFei7R8jpCRwgsrjfzBRIHLEHKMKYnJmRmNaOJ/
 BcZ94b+Ra3Ak0YtkJPIiIDF9vLpmeQtHq/dyuXm8KXOXKSedF7wogcT1WnVy6gWOplK4bD6N
 57N400dVRip1Ztk0d0Lj3ezc6w/D/WZTjXB7bJfbs6BhY3NvQSBYc5ZiPpmXedvTnvTkWaU9
 /Mv7p2cNhQFvweyLvg2Dcx2c69tHutn1VTSzqFS15rmwVlm2/7jnQtn5fHtp7QHNW9vitPZR
 S0Qcmb/eFeru/SL+p4Il2nJj3s6Q5vd/vhG/82dlkidJS9eWgtMLxL5kY8KRrQ2XX1RMqwsZ
 etDwLU+jsLuzJ271fhrhmpbP2x0K33jwOJ12unThQPfKisd55c5C47tPe+7F3bKaTXUd1kgR
 ++ecujWFm0Zn/ixs26xNmpv/uuRi/g2266p4Uvcjt2Hm0Q5x51CuoSFcYm299HVS8/dePS7s
 41YswkwC9wGUZIBjzgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xe7odP3cmGmw4bWlxf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJUYyuLxaG+aItPsx4yW6z4uZXRgctj7cf7rB7vb7Sy
 e8zumMnqsXjPSyaPO9f2sHnc7z7O5LFk2lU2j74tqxgDOKL0bIryS0tSFTLyi0tslaINLYz0
 DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mu5POMVUsESq4thivQbGf6JdjJwcEgIm
 Es+2zWLtYuTiEBJYyijx/u5UZoiEjMTJaQ2sELawxJ9rXWwQRe8ZJVas3QuW4BWwk7jZ+gGs
 gUVAVWJmxzGouKDEyZlPWEBsUYEkid3rtrKB2MICDhINHZ/BapgFxCVuPZnPBGKLCGhLfJv5
 GmwBs0ATs0TbieVQJ/UzScyccpoRpIpNwFCi620X2CROgUCJgytuQk0yk+ja2sUIYctLNG+d
 zTyBUWgWkkNmIVk4C0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgTG7LZjP7fs
 YFz56qPeIUYmDsZDjBIczEoivEsNdiYK8aYkVlalFuXHF5XmpBYfYjQFhsZEZinR5Hxg0sgr
 iTc0MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamDS1l04ddKengXzEtvM
 uhxYe4KNS5j+32EXZREL2b7j8gOft2aPJB++mSmQr1d3sCv/1c7WD3PuX495vGB63sdUQdMF
 Sh6VHvpB0+PNeA/Y3XtuvWPJx4T9VSlt1w8bN0ROS9QverDypVjpZDXn81tUFLdJyHi0dy+P
 y9Xt5pk0Sani+fInm6ckyeclfSlkWKri/O78VL1ti4Nlb/B2P2HdMOvAuaCYKxcOnzhX/bsn
 ov/ekf6bjTa3Tm17PXvjQXbGld4iJ7j6/KPOvFW55V17z8pnAyO/h1v5/rq1W4ouM03n/c4d
 fsxr3hvepZsPbVZW2b7QY56CovYh5+NczgknJn7//eCrnu6iBy2rSrT+KrEUZyQaajEXFScC
 ACI+X+tiAwAA
X-CMS-MailID: 20211215141952eucas1p128395097ea763092f87ab33ffd1289ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7
References: <CGME20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7@eucas1p2.samsung.com>
 <20211215101534.45003-1-jagan@amarulasolutions.com>
 <39f646d7-9d49-045a-2cf5-3cdc12486cb3@samsung.com>
 <CAMty3ZBmZo3wqzj2Si4Ydm1RtzGs7f89aCktgVvD==appfSCPQ@mail.gmail.com>
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

On 15.12.2021 13:57, Jagan Teki wrote:
> On Wed, Dec 15, 2021 at 5:31 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 15.12.2021 11:15, Jagan Teki wrote:
>>> Updated series about drm bridge conversion of exynos dsi.
>>> Previous version can be accessible, here [1].
>>>
>>> Patch 1: connector reset
>>>
>>> Patch 2: panel_bridge API
>>>
>>> Patch 3: Bridge conversion
>>>
>>> Patch 4: Atomic functions
>>>
>>> Patch 5: atomic_set
>>>
>>> Patch 6: DSI init in enable
>> There is a little progress! :)
>>
>> Devices with a simple display pipeline (only a DSI panel, like
>> Trats/Trats2) works till the last patch. Then, after applying ("[PATCH
>> v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no
>> display at all.
>>
>> A TM2e board with in-bridge (Exynos MIC) stops displaying anything after
>> applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm panel_bridge API".
>>
>> In case of the Arndale board with tc358764 bridge, no much progress. The
>> display is broken just after applying the "[PATCH v2] drm: bridge:
>> tc358764: Use drm panel_bridge API" patch on top of linux-next.
>>
>> In all cases the I had "drm: of: Lookup if child node has panel or
>> bridge" patch applied.
> Just skip the 6/6 for now.
>
> Apply
> - https://protect2.fireeye.com/v1/url?k=a24f3f76-fdd40659-a24eb439-0cc47a31cdf8-97ea12b4c5258d11&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
> - https://protect2.fireeye.com/v1/url?k=a226360f-fdbd0f20-a227bd40-0cc47a31cdf8-ebd66aebee1058d7&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1823%2F
>
> Then apply 1/6 to 5/6.  and update the status?

Okay, my fault, I didn't check that case on Arndale.

I've checked and indeed, Trats/Trats2 and Arndale works after the above 
2 patches AND patches 1-5.

The only problem is now on TM2e, which uses Exynos MIC as in-bridge for 
Exynos DSI:

[    4.068866] [drm] Exynos DRM: using 13800000.decon device for DMA 
mapping operations
[    4.069183] exynos-drm exynos-drm: bound 13800000.decon (ops 
decon_component_ops)
[    4.128983] exynos-drm exynos-drm: bound 13880000.decon (ops 
decon_component_ops)
[    4.129261] exynos-drm exynos-drm: bound 13930000.mic (ops 
exynos_mic_component_ops)
[    4.133508] exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] 
*ERROR* failed to find the bridge: -19
[    4.136392] exynos-drm exynos-drm: bound 13900000.dsi (ops 
exynos_dsi_component_ops)
[    4.145499] rc_core: Couldn't load IR keymap rc-cec
[    4.145666] Registered IR keymap rc-empty
[    4.148402] rc rc0: sii8620 as /devices/virtual/rc/rc0
[    4.156051] input: sii8620 as /devices/virtual/rc/rc0/input1
[    4.160647] exynos-drm exynos-drm: bound 13970000.hdmi (ops 
hdmi_component_ops)
[    4.169923] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
[    4.173958] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
[    4.182304] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on 
minor 0

The display pipeline for TM2e is:

Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel


Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

