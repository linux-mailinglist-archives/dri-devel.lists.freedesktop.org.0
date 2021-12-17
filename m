Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C382479772
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 00:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B8510E35D;
	Fri, 17 Dec 2021 23:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD1210E35D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 23:16:21 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211217231619euoutp01a8f5a5ad50379582456fe612c3fb3ae6~Bre6ho1xe2596725967euoutp01V
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 23:16:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211217231619euoutp01a8f5a5ad50379582456fe612c3fb3ae6~Bre6ho1xe2596725967euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1639782979;
 bh=xLETcSXIwjmb267JszLd2ApG6lEHsrq6hCepH3ImgqY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=HDY8Gr4ZIgD7tAIk90j8Fyh0TMYjTNTmSOwE1uSVX2fWqzDQfGZZrwvi1t47qoXLR
 sZag0/L+oxO6HR5kSyPOjAbvS5lLFdAADXvCidPGNl08m9kURsLbmfzw9u7cfrMRFK
 1i+L/6QvS9yyPQWU1dEP489xjy0KtAyvjxFy3t9U=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211217231618eucas1p287394dd78c01def67d44ed0299c61f8a~Bre5ndNZ70264802648eucas1p2q;
 Fri, 17 Dec 2021 23:16:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CF.2B.10260.24A1DB16; Fri, 17
 Dec 2021 23:16:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211217231617eucas1p14b783ced9cd7132e939fa2e42279b3bf~Bre4YVtQ70404604046eucas1p1j;
 Fri, 17 Dec 2021 23:16:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211217231617eusmtrp17331e3d267daedabb1fe39ab5b6df2fa~Bre4XlmN72447124471eusmtrp1V;
 Fri, 17 Dec 2021 23:16:17 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-36-61bd1a424faa
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 30.10.09522.14A1DB16; Fri, 17
 Dec 2021 23:16:17 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211217231616eusmtip1a780baa6204c154a6bbee168a53487bd~Bre3ydfZa2193321933eusmtip1K;
 Fri, 17 Dec 2021 23:16:16 +0000 (GMT)
Message-ID: <fc773566-760d-19ec-0879-3ee88c06b425@samsung.com>
Date: Sat, 18 Dec 2021 00:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v4 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZCSrqcnO1i5ADJhQx_Dt5GbT+-eyhauJhqg=wJXOTWK-A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djPc7pOUnsTDT63aljcX/yZxeLK1/ds
 FpPuT2Cx+LJpAptF58Ql7BbLJ+xjszjV2Mpicagv2uLTrIfMFit+bmV04PJY+/E+q8f7G63s
 HrM7ZrJ6LN7zksnjzrU9bB73u48zeSyZdpXNo2/LKsYAjigum5TUnMyy1CJ9uwSujPcHX7AU
 PFeqeDZrB1MD4zmZLkYODgkBE4lpT/i6GLk4hARWMErcPN/CAuF8YZRYfWApYxcjJ5DzmVHi
 e5c+TMPKF6oQNcsZJd4v/sEG4XxklOjdd48JpIFXwE6iafUiZhCbRUBVounzU1aIuKDEyZlP
 WEBsUYEkidaOP2D1wgIOEg0dn8FqmAXEJW49mQ8WFxHQlvg28zXYAmaBf0wSp7a8BitiEzCU
 6HrbxQZicwoESvyZvoURolleYvvbOcwgDRIC/ZwSL/auB5skIeAicWDSDBYIW1ji1fEt7BC2
 jMTpyT0sEA3NjBIPz61lh3B6GCUuN81ghKiylrhz7hcbKACYBTQl1u/Shwg7Srw/dZoREi58
 EjfeCkIcwScxadt0Zogwr0RHmxBEtZrErOPr4NYevHCJeQKj0iykcJmF5P9ZSN6ZhbB3ASPL
 Kkbx1NLi3PTUYuO81HK94sTc4tK8dL3k/NxNjMD0dfrf8a87GFe8+qh3iJGJg/EQowQHs5II
 r+Ly3YlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeZMzNyQKCaQnlqRmp6YWpBbBZJk4OKUamLau
 NtN8qy/n2iIffEd4bva/SmfPPSrnJH/L5W4zvvFpQ6xs3K30LxE/Zry2jS2Udpq0ZmPzZR3X
 1d0y658b7b3NFR9z5Tzz/Nb15jNmxG6d8sREebOB/V+dM1N3BO9aHNmv7yzrsHrzI4Erp3Xv
 By78xh2R/OfhU/6Fb1atZVyocEt+2bWphhOin+qyCC7YdvMdy2Wdg1ELnTYmhynzirnM+DD5
 Z+HHD1dr9z04XejoFp2Ux8znvFBMZr22xplc25vbZB+78h5NDuJ1PGSYcNU2xedXcaJ2q4SH
 dtCh+hUVc81szb/ofLef0n33Ho/SnKaXKy8d9pP5UbApvSw8cpPv6kvpSy5utPvmx/rmPrcS
 S3FGoqEWc1FxIgAzuOYizgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xu7qOUnsTDXrPilvcX/yZxeLK1/ds
 FpPuT2Cx+LJpAptF58Ql7BbLJ+xjszjV2Mpicagv2uLTrIfMFit+bmV04PJY+/E+q8f7G63s
 HrM7ZrJ6LN7zksnjzrU9bB73u48zeSyZdpXNo2/LKsYAjig9m6L80pJUhYz84hJbpWhDCyM9
 Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jPcHX7AUPFeqeDZrB1MD4zmZLkYODgkB
 E4mVL1S7GLk4hASWMkq8eHiLvYuREyguI3FyWgMrhC0s8edaFxtE0XtGiUONc9hAErwCdhJN
 qxcxg9gsAqoSTZ+fskLEBSVOznzCAmKLCiRJ7F63FaxeWMBBoqHjM1gNs4C4xK0n85lAbBEB
 bYlvM1+DLWAWaGKWaDuxnBViWzezROunpWBVbAKGEl1vu8AmcQoESvyZvoURYpKZRNfWLihb
 XmL72znMExiFZiE5ZBaShbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYMxu
 O/Zz8w7Gea8+6h1iZOJgPMQowcGsJMKruHx3ohBvSmJlVWpRfnxRaU5q8SFGU2BoTGSWEk3O
 ByaNvJJ4QzMDU0MTM0sDU0szYyVxXs+CjkQhgfTEktTs1NSC1CKYPiYOTqkGJsOl07yVZxmn
 HHx7/euncIEra8z11YXiZLa+ZN4guajz2MT2zFD+unXL15zbO6Wqy9ZnldOejJ6Sdzyv15yV
 kbKYJfdxwcUJm495uh42f3L/y529ex7PmHBMv+kxz/2rYncCC71FXGz8rdlPV2x+yShisKAi
 Lv2UmuGdbyZ8Vomh4beXHf/fsfvE2T6vmIcfws+/+PHFo1F4p5rb/y/L1ix9uLzjfsx8HTbu
 hepv2EPZyv9c3D8h+6Ra8dSfs02zJ59Tt1paf32VwfWv/S9F6qL1dr48OqcnW+/E+keWm57q
 3xNk5lyWZbqg9UDr5fPZy6vsT96bJ2l3/WbTxsQ6iSdHDh5m/c73yCCk/OfUSI2PSizFGYmG
 WsxFxYkAFFp3ZWIDAAA=
X-CMS-MailID: 20211217231617eucas1p14b783ced9cd7132e939fa2e42279b3bf
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
 <fe49e59a-1df7-fcdc-8258-581509bb8fe2@samsung.com>
 <CAMty3ZCSrqcnO1i5ADJhQx_Dt5GbT+-eyhauJhqg=wJXOTWK-A@mail.gmail.com>
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

On 15.12.2021 15:56, Jagan Teki wrote:
> On Wed, Dec 15, 2021 at 7:49 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 15.12.2021 13:57, Jagan Teki wrote:
>>> On Wed, Dec 15, 2021 at 5:31 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 15.12.2021 11:15, Jagan Teki wrote:
>>>>> Updated series about drm bridge conversion of exynos dsi.
>>>>> Previous version can be accessible, here [1].
>>>>>
>>>>> Patch 1: connector reset
>>>>>
>>>>> Patch 2: panel_bridge API
>>>>>
>>>>> Patch 3: Bridge conversion
>>>>>
>>>>> Patch 4: Atomic functions
>>>>>
>>>>> Patch 5: atomic_set
>>>>>
>>>>> Patch 6: DSI init in enable
>>>> There is a little progress! :)
>>>>
>>>> Devices with a simple display pipeline (only a DSI panel, like
>>>> Trats/Trats2) works till the last patch. Then, after applying ("[PATCH
>>>> v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no
>>>> display at all.
>>>>
>>>> A TM2e board with in-bridge (Exynos MIC) stops displaying anything after
>>>> applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm panel_bridge API".
>>>>
>>>> In case of the Arndale board with tc358764 bridge, no much progress. The
>>>> display is broken just after applying the "[PATCH v2] drm: bridge:
>>>> tc358764: Use drm panel_bridge API" patch on top of linux-next.
>>>>
>>>> In all cases the I had "drm: of: Lookup if child node has panel or
>>>> bridge" patch applied.
>>> Just skip the 6/6 for now.
>>>
>>> Apply
>>> - https://protect2.fireeye.com/v1/url?k=a24f3f76-fdd40659-a24eb439-0cc47a31cdf8-97ea12b4c5258d11&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
>>> - https://protect2.fireeye.com/v1/url?k=a226360f-fdbd0f20-a227bd40-0cc47a31cdf8-ebd66aebee1058d7&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1823%2F
>>>
>>> Then apply 1/6 to 5/6.  and update the status?
>> Okay, my fault, I didn't check that case on Arndale.
>>
>> I've checked and indeed, Trats/Trats2 and Arndale works after the above
>> 2 patches AND patches 1-5.
>>
>> The only problem is now on TM2e, which uses Exynos MIC as in-bridge for
>> Exynos DSI:
>>
>> [    4.068866] [drm] Exynos DRM: using 13800000.decon device for DMA
>> mapping operations
>> [    4.069183] exynos-drm exynos-drm: bound 13800000.decon (ops
>> decon_component_ops)
>> [    4.128983] exynos-drm exynos-drm: bound 13880000.decon (ops
>> decon_component_ops)
>> [    4.129261] exynos-drm exynos-drm: bound 13930000.mic (ops
>> exynos_mic_component_ops)
>> [    4.133508] exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach]
>> *ERROR* failed to find the bridge: -19
>> [    4.136392] exynos-drm exynos-drm: bound 13900000.dsi (ops
>> exynos_dsi_component_ops)
>> [    4.145499] rc_core: Couldn't load IR keymap rc-cec
>> [    4.145666] Registered IR keymap rc-empty
>> [    4.148402] rc rc0: sii8620 as /devices/virtual/rc/rc0
>> [    4.156051] input: sii8620 as /devices/virtual/rc/rc0/input1
>> [    4.160647] exynos-drm exynos-drm: bound 13970000.hdmi (ops
>> hdmi_component_ops)
>> [    4.169923] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
>> [    4.173958] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
>> [    4.182304] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on
>> minor 0
>>
>> The display pipeline for TM2e is:
>>
>> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
> If Trats/Trats2 is working then it has to work. I don't see any
> difference in output pipeline. Can you please share the full log, I
> cannot see host_attach print saying "Attached.."

Well, there is a failure message about the panel:

exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] *ERROR* failed to 
find the bridge: -19

however it looks that something might be broken in dts. The in-bridge 
(Exynos MIC) is on port 0 and the panel is @0, what imho might cause the 
issue.

I've tried to change in in-bridge ('mic_to_dsi') port to 1 in 
exynos5433.dtsi. Then the panel has been attached:

exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] Attached s6e3hf2 
device

but the display is still not working, probably due to lack of proper 
Exynos MIC handling. I will investigate it later and let You know.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

