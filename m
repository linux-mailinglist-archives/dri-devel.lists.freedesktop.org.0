Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58B475850
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD37C10E8C2;
	Wed, 15 Dec 2021 12:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D7010E8C2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:01:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211215120122euoutp02fc36a18471e6712d69f91c4024f3dc6b~A6-CVloSS0749807498euoutp02Q
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:01:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211215120122euoutp02fc36a18471e6712d69f91c4024f3dc6b~A6-CVloSS0749807498euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1639569682;
 bh=fSZi4PhN1JaRJvewgX6y1hkPsgS+QPS0Et/bHDoJFVA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=LDl09+KkGWFhTObOmrfeOTvq2JEw1NvLogBqAdFA7vbD/9PZZZGlFYfJNZu6O6L7l
 /yMa1A899+KYKnC2VKTeiUrv6Vd/c9GE+NCufnAgK9phcIOR2Hs8N5iSxjfQGseofP
 KNvq0ga67FlMjhrIn1ckqcusOvSktOffAGUvA3J8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211215120122eucas1p24694db815375f5f16b04d1a4452d3384~A6-B2u_tu1594515945eucas1p2I;
 Wed, 15 Dec 2021 12:01:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C3.7E.09887.219D9B16; Wed, 15
 Dec 2021 12:01:22 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211215120121eucas1p296d3a792bafc5ea423e364beb7bac963~A6-BWCNZT1215212152eucas1p23;
 Wed, 15 Dec 2021 12:01:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211215120121eusmtrp28d8fc0767e59af83d4aea0cafe96730b~A6-BVAhXZ2310623106eusmtrp2f;
 Wed, 15 Dec 2021 12:01:21 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-42-61b9d912c4dd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A7.CD.09404.119D9B16; Wed, 15
 Dec 2021 12:01:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211215120120eusmtip2bf17433382c34b69edb261d4648fc27d~A6-AXAK0U1275212752eusmtip2A;
 Wed, 15 Dec 2021 12:01:20 +0000 (GMT)
Message-ID: <39f646d7-9d49-045a-2cf5-3cdc12486cb3@samsung.com>
Date: Wed, 15 Dec 2021 13:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v4 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20211215101534.45003-1-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsWy7djP87pCN3cmGqx6qWFxf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJUYyuLxaG+aItPsx4yW6z4uZXRgctj7cf7rB7vb7Sy
 e8zumMnqsXjPSyaPO9f2sHnc7z7O5LFk2lU2j74tqxgDOKK4bFJSczLLUov07RK4Mq7M6WQp
 +MtRsfrAHuYGxlb2LkZODgkBE4mzG7aydTFycQgJrGCUOPlkJytIQkjgC6PEojXZEInPjBLb
 rm1jgulY//g0E0RiOaPEhEMnoNo/AlV9eQ82l1fATmLn1bssXYwcHCwCqhLTe1UgwoISJ2c+
 YQGxRQWSJFo7/oANFRZwkGjo+Ay2mVlAXOLWk/lgC0QEHjFJPP3zHyrhLvH0zTZmEJtNwFCi
 620XG4jNCdR8c/MRFogaeYntb+cwgzRLCHRzSvx/s4YV4mwXiR87LkHZwhKvjm+BBoCMxP+d
 ENskBJoZJR6eW8sO4fQwSlxumsEIUWUtcefcLzaQd5gFNCXW79KHCDtKvD91mhEkLCHAJ3Hj
 rSDEEXwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuXmCcwKs1CCpdZSP6fheSdWQh7FzCyrGIU
 Ty0tzk1PLTbKSy3XK07MLS7NS9dLzs/dxAhMYKf/Hf+yg3H5q496hxiZOBgPMUpwMCuJ8C41
 2JkoxJuSWFmVWpQfX1Sak1p8iFGag0VJnDc5c0OikEB6YklqdmpqQWoRTJaJg1OqgWm2qfHV
 VLfWdI0JhZv3XKr+GrHfoTvpXc3Lp/8d2a/Upxk/7m7ZF/xj3eP/PevbJ+/k2e5SeehXfd7m
 kCVaByoPrqmZ8cav55Grx1fTHUdVtiuuOC3PMKEr4VzKMaVU829Gp2PXHD2z+7sx42zr2ddL
 co8HVUz2TexcFeqh8rwuffvk8/4ik/VMUld57Tp4LqnE5djOi1+Tc+8tWb/k4TrW88mHOIpS
 uju3POU1Ml7mpHHyydSNjiovHaYvkeq6dudDWHKq3hwz64pQXZejHiozbbgifx/3uJGTfZr5
 r1+s1rmg/u96Ldd2Tg2fd8N74//mUyw62r/qT1y5HF9QrcjQpbV3gk5w7osMj++zksqUWIoz
 Eg21mIuKEwFTLizrzwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xe7qCN3cmGny4YWFxf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJUYyuLxaG+aItPsx4yW6z4uZXRgctj7cf7rB7vb7Sy
 e8zumMnqsXjPSyaPO9f2sHnc7z7O5LFk2lU2j74tqxgDOKL0bIryS0tSFTLyi0tslaINLYz0
 DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mq7M6WQp+MtRsfrAHuYGxlb2LkZODgkB
 E4n1j08zdTFycQgJLGWU2HvsHzNEQkbi5LQGVghbWOLPtS42iKL3jBJ3TjwF6+YVsJPYefUu
 SxcjBweLgKrE9F4ViLCgxMmZT1hAbFGBJInd67aygdjCAg4SDR2fwWYyC4hL3HoyH2yxiMAz
 Jomjm9ZCJdwlnr7ZxgyxbDKjxP1bnYwgCTYBQ4mut11gkziBJt3cfIQFosFMomtrFyOELS+x
 /e0c5gmMQrOQHDILycJZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzBmtx37
 uWUH48pXH/UOMTJxMB5ilOBgVhLhXWqwM1GINyWxsiq1KD++qDQntfgQoykwMCYyS4km5wOT
 Rl5JvKGZgamhiZmlgamlmbGSOK9nQUeikEB6YklqdmpqQWoRTB8TB6dUA9PMS7Fei5I3yeep
 W3GW2T3S+FPCn81Z5+5zbtLbjUrubKzHTF7P3X7cy2nbi3WJwhnbPglWS99+UrlZNfWd5KSF
 bQ4fl8/kXbt9bXX/nPADIlVXb/AIrGXSUny2nFXe+XfdA8HfrMZrXt8PSl386MDzc2dqX1a7
 7Pr79p3hm92fIrrvzjKUldl+uuzQvu5/m9l2LG957967aG/ihqq1Zj82Mt68KX1kNoNFz+WP
 Rzb8ODPljt3GRczenLNmzNMTv7vmw4EJU1bkbyk2fZz46cCNX6suc62d4zZvbk577xdhrWn9
 7Kmzy4Qm7GXt3pzQZP3ffZ61x603Wn48R15GeWloPwi4yTb7otIxdQ+RisQn95VYijMSDbWY
 i4oTARI9ck1iAwAA
X-CMS-MailID: 20211215120121eucas1p296d3a792bafc5ea423e364beb7bac963
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7
References: <CGME20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7@eucas1p2.samsung.com>
 <20211215101534.45003-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 15.12.2021 11:15, Jagan Teki wrote:
> Updated series about drm bridge conversion of exynos dsi.
> Previous version can be accessible, here [1].
>
> Patch 1: connector reset
>
> Patch 2: panel_bridge API
>
> Patch 3: Bridge conversion
>
> Patch 4: Atomic functions
>
> Patch 5: atomic_set
>
> Patch 6: DSI init in enable

There is a little progress! :)

Devices with a simple display pipeline (only a DSI panel, like 
Trats/Trats2) works till the last patch. Then, after applying ("[PATCH 
v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no 
display at all.

A TM2e board with in-bridge (Exynos MIC) stops displaying anything after 
applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm panel_bridge API".

In case of the Arndale board with tc358764 bridge, no much progress. The 
display is broken just after applying the "[PATCH v2] drm: bridge: 
tc358764: Use drm panel_bridge API" patch on top of linux-next.

In all cases the I had "drm: of: Lookup if child node has panel or 
bridge" patch applied.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

