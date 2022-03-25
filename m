Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D4D4E758E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC3010E593;
	Fri, 25 Mar 2022 15:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344AE10E593
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:00:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220325150038euoutp0228f4386f12b40157f0fe6bab3a908f51~fp8F5M5Fw2278622786euoutp02V
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:00:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220325150038euoutp0228f4386f12b40157f0fe6bab3a908f51~fp8F5M5Fw2278622786euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648220438;
 bh=71aXi6zk9zhaLXtS1GtlAKixunR3FJ3lvxVqaGi7IIE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ssRujSqlqxqxVSSpe7512iuXz0TvSaYnymo4NSXJEG8xkuD1cjOVzDNPzMulUV7Py
 uAi0p7s1miglcHlBfta6q6T1Tw9cWUIv5LnvvICBu9wPVWnByzeohwcV6OA48CMgvz
 ObevtIgeJZFNKDN+dGQIlbeAZHvWlJ3x+TatXdrA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220325150037eucas1p2879b95bd7c22624a18e2e1527d3ae82b~fp8Frn7A-2842328423eucas1p2i;
 Fri, 25 Mar 2022 15:00:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 6F.52.10260.519DD326; Fri, 25
 Mar 2022 15:00:37 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220325150037eucas1p25a7d8b7508eaa385248f5ad1262e84b4~fp8FLFfUi2520525205eucas1p2v;
 Fri, 25 Mar 2022 15:00:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220325150037eusmtrp1b3f1703e5c2aee770c31e511075eb970~fp8FKW-UA1475514755eusmtrp1O;
 Fri, 25 Mar 2022 15:00:37 +0000 (GMT)
X-AuditID: cbfec7f5-3eaf8a8000002814-4f-623dd915a48e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 3E.EC.09522.519DD326; Fri, 25
 Mar 2022 15:00:37 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220325150036eusmtip2c1edeb71574c060328744b5dc60a9176~fp8EizYZY1686716867eusmtip2D;
 Fri, 25 Mar 2022 15:00:36 +0000 (GMT)
Message-ID: <e104d9cf-73da-330a-db5a-d914839b273c@samsung.com>
Date: Fri, 25 Mar 2022 16:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220303163654.3381470-1-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djP87qiN22TDHrvalncX/yZxeLK1/ds
 FpPuT2Cx+LJpAptF58Ql7BbLJ+xjszjV2Mpicagv2uLTrIfMFit+bmV04PJY+/E+q8f7G63s
 HrM7ZrJ6LN7zksnjzrU9bB73u48zeSyZdpXNo2/LKsYAjigum5TUnMyy1CJ9uwSujBsr1zEW
 LOatODBjBWMD41yuLkZODgkBE4lN5ycxdzFycQgJrGCU2LxuMQuE84VR4sWVXewgVUICnxkl
 Xm+ohenYd+MiVNFyRok9C6ZCtX9klJjx4QxYB6+AncSBli0sIDaLgKrEs1+TGCHighInZz4B
 i4sKJEms3r6aDcQWFnCQeDO5jwnEZhYQl7j1ZD4TyFARgUdMEk///GeFSLhLPH2zjRnEZhMw
 lOh62wXWzCngJPG26ykjRI28xPa3c8AukhBo55R4uXoz0DYOIMdF4uLCQogXhCVeHd/CDmHL
 SJye3ANVki/xd4YxRLhC4trrNcwQtrXEnXO/2EBKmAU0Jdbv0ocIO0o0PZrBDNHJJ3HjrSDE
 AXwSk7ZNhwrzSnS0CUFUq0nMOr4ObufBC5eYJzAqzUIKk1lIfp+F5JVZCHsXMLKsYhRPLS3O
 TU8tNs5LLdcrTswtLs1L10vOz93ECExdp/8d/7qDccWrj3qHGJk4GA8xSnAwK4nw3r9snSTE
 m5JYWZValB9fVJqTWnyIUZqDRUmcNzlzQ6KQQHpiSWp2ampBahFMlomDU6qBKWK5l+TjUzl2
 T7/tKHKWzK4Jiat/wPVIfPvnIwvPvU8009qat0HUWrj+urXkRmn5lkjr1U7uv9UL395Q1Tzj
 buLRd/qDZOT8y9PqODkPvdyXKLfE886N/ykPZF+4njhiMbWn+k14aop71sKFq7OKL/hZtvf9
 Pm4uu6x00d3nU4Unm5w9nLf5v8yB94/F85nDXOQSMxZ5ZXxm4luQI/F0yqq/AbmBWkziRpv9
 2WqaCj/wMEq7mWj+vVmiuprj2AfxjIKt/6pk80MdFzEd2WQz+59fg6DAM6m8Mw18z7JPuCve
 VRZ2mKZ90XyZ9SKN3fVB94Vvfb4llMka8NDE1ZU1pXDntWPfbZ45Gf5OORetxFKckWioxVxU
 nAgAQU9j3cwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xe7qiN22TDJpuclncX/yZxeLK1/ds
 FpPuT2Cx+LJpAptF58Ql7BbLJ+xjszjV2Mpicagv2uLTrIfMFit+bmV04PJY+/E+q8f7G63s
 HrM7ZrJ6LN7zksnjzrU9bB73u48zeSyZdpXNo2/LKsYAjig9m6L80pJUhYz84hJbpWhDCyM9
 Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jBsr1zEWLOatODBjBWMD41yuLkZODgkB
 E4l9Ny6ydDFycQgJLGWUONd5gAkiISNxcloDK4QtLPHnWhcbRNF7Rokj/y+BJXgF7CQOtGxh
 AbFZBFQlnv2axAgRF5Q4OfMJWFxUIEniUlc7WFxYwEHizeQ+sAXMAuISt57MZwIZKiLwjEni
 6Ka1rBAJd4mnb7YxQ2ybyihxo/UyM0iCTcBQoustyBmcHJwCThJvu54yQjSYSXRt7YKy5SW2
 v53DPIFRaBaSQ2YhWTgLScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBEbttmM/
 N+9gnPfqo94hRiYOxkOMEhzMSiK89y9bJwnxpiRWVqUW5ccXleakFh9iNAWGxkRmKdHkfGDa
 yCuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYEq/EyJ4M6Oh6Um/
 x5RK+7qw1ScbKzKDf3hP76m/MNfYlUVrq8ulWdzfjgpnLzuvwzRpdlrMhLKsWcfL8i8phRmv
 KS3SsTISP/Aq0WyL6/TzOvrLy2febdH4d+Bbv4XKjITHkgfydDmPnTnkqa8iurxMeMXUwiUM
 8UIytj3f7LRmZXd0TvsfL/plUrXh8f2vpu6qFN+/y1ph7peqoAbGPRpp2Sv+rEtdZnwsokcm
 5Fu9+lslRt7wF4fmZp5s3Ty9xZ7phwfbsx+xa+Vu585S/yjZofS98Q+/k+VR9XYhRxelqC0L
 8kv1PPnOit9dGnTbpINx2Zfkz7IyTabpDkxP9qT9Z//0IFLG7QHTzicnlViKMxINtZiLihMB
 e7i0G2MDAAA=
X-CMS-MailID: 20220325150037eucas1p25a7d8b7508eaa385248f5ad1262e84b4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220303163725eucas1p26c4a165b20dd629f2129926b1b662154
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220303163725eucas1p26c4a165b20dd629f2129926b1b662154
References: <CGME20220303163725eucas1p26c4a165b20dd629f2129926b1b662154@eucas1p2.samsung.com>
 <20220303163654.3381470-1-jagan@amarulasolutions.com>
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

On 03.03.2022 17:36, Jagan Teki wrote:
> Updated series about drm bridge conversion of exynos dsi.
>
> Previous version can be accessible, here [1].
>
> Patch 1: tc358764 panel_bridge API
>
> Patch 2: connector reset
>
> Patch 3: bridge attach in MIC
>
> Patch 4: panel_bridge API
>
> Patch 5: bridge conversion
>
> Patch 6: atomic functions
>
>
>
> Any inputs?


I'm really sorry for the delay on my side. I was really busy with other 
things and I was not able to check the display of the boards with remote 
access.


Finally, this patchset works properly on all my Exynos-based test systems:

1. Exynos4210 Trats with Samsung s6e8aa0 DSI panel

2. Exynos4412 Trats2 with Samsung s6e8aa0 DSI panel

3. Exynos5250 Arndale with TC358764 DSI-LVDS bridge and LVDS panel

4. Exynos5433 TM2e with Samsung s6e3hf2 DSI panel and internal Exynos 
MIC bridge


I will post my acked-by and tested-by tags for each patch.


> Jagan.
>
> Jagan Teki (6):
>    drm: bridge: tc358764: Use drm panel_bridge API
>    drm: bridge: panel: Reset the connector state pointer
>    exynos: drm: dsi: Attach in_bridge in MIC driver
>    drm: exynos: dsi: Use drm panel_bridge API
>    drm: exynos: dsi: Convert to bridge driver
>    drm: exynos: dsi: Switch to atomic funcs
>
>   drivers/gpu/drm/bridge/panel.c          |   3 +
>   drivers/gpu/drm/bridge/tc358764.c       | 104 +---------
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 241 ++++++------------------
>   drivers/gpu/drm/exynos/exynos_drm_mic.c |  22 +++
>   4 files changed, 93 insertions(+), 277 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

