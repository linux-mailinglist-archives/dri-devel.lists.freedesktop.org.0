Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BCA49F35A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 07:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DE110F548;
	Fri, 28 Jan 2022 06:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA66610F547
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 06:12:34 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220128061232epoutp025e53f9761f7f022af519cee028dfb5d7~OWnBdmSTQ1591215912epoutp02v
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 06:12:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220128061232epoutp025e53f9761f7f022af519cee028dfb5d7~OWnBdmSTQ1591215912epoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1643350352;
 bh=MbLJF+5xtGen4XZ3RVT24EqEA0afz/T4l55VWWf62fQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=MtWJ1dFwvPzs+vPo36OvTwL34v/N1IFbZbPML3cdhc6Q0uqAV2/WhqTEx9YFJu0+Q
 bN5mOHurtvMQoXbNefrrrA4P+YMaJDsQ9iGenjaz0bYZLCUet66de16aud2MmbOlQ+
 /1qya0IRcUH9TUX2fcQu7GR2WcUPSKDBgYwoJeOc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220128061232epcas1p1162e53f505fd0305b691469539ca58f2~OWnBHSzU32599625996epcas1p1c;
 Fri, 28 Jan 2022 06:12:32 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.233]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4JlRvG5jhVz4x9Pp; Fri, 28 Jan
 2022 06:12:26 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 FA.28.64085.44983F16; Fri, 28 Jan 2022 15:12:20 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20220128061219epcas1p454b4d788f3722f2fa9fb810f34329e1d~OWm1hGpfp0727307273epcas1p4s;
 Fri, 28 Jan 2022 06:12:19 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220128061219epsmtrp2291f8ddf7fb2d3ca5fe3b809da879edb~OWm1gYR_s1543815438epsmtrp22;
 Fri, 28 Jan 2022 06:12:19 +0000 (GMT)
X-AuditID: b6c32a35-1d2f0a800000fa55-2f-61f38944a9ef
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C2.D9.08738.34983F16; Fri, 28 Jan 2022 15:12:19 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220128061219epsmtip2f1e9296506f22d0e8784353e3da04edc~OWm1A8hNZ2641026410epsmtip2W;
 Fri, 28 Jan 2022 06:12:19 +0000 (GMT)
Message-ID: <66453144-dae3-4389-4150-36dfa7dbeaa1@samsung.com>
Date: Fri, 28 Jan 2022 15:24:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/exynos: Search for TE-gpio in DSI panel's node
Content-Language: en-US
To: Henrik Grimler <henrik@grimler.se>, Marek Szyprowski
 <m.szyprowski@samsung.com>
From: Inki Dae <inki.dae@samsung.com>
In-Reply-To: <Ye7EQRefzECSqVOe@grimlerstat>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRmVeSWpSXmKPExsWy7bCmnq5L5+dEg/aD7BZXvr5ns3i7ZBej
 xca3P5gsZpzfx2Sx9shddou2luvsFjMmv2RzYPeY1dDL5nH0yj1Wj/vdx5k8+rasYvR48LHU
 4/MmuQC2qGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfM
 HKBTlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFpgV6xYm5xaV56Xp5qSVWhgYG
 RqZAhQnZGX/29DMXnGGtuH1lPnMDYwtLFyMnh4SAicTdaduZuxi5OIQEdjBKTFh/kRHC+cQo
 MWNJCxOE85lR4unhGewwLf8/32eBSOxilDi3djWU855R4njvREaQKl4BO4l7v/vZuhg5OFgE
 VCUubBKDCAtKnJz5BGy3qECExMsjf5lAbGEBd4mf26cxg9jMAuISt57MB4uLCIRKLOnfDnYS
 s8ADRok173+BFbEBzZy44j4biM0poC3xY+ksVohmeYnmrbPBHpIQmMgh0bjzDxvE2S4SG1e+
 hnpBWOLV8S1QtpTE53d72SAaJjNK3Lm+ggXCmcEocfjndUaIKmOJ/UsnM4G8wyygKbF+lz5E
 WFFi5++5jBCb+STefe1hBSmREOCV6GgTgihRkjh28QbUFAmJC0smQt3jIfH5VxPjBEbFWUgB
 MwspAGYh+WcWwuIFjCyrGMVSC4pz01OLDQsM4fGdnJ+7iRGcULVMdzBOfPtB7xAjEwfjIUYJ
 DmYlEd4Zmz4lCvGmJFZWpRblxxeV5qQWH2I0BcbORGYp0eR8YErPK4k3NLE0MDEzMjaxMDQz
 VBLnXTXtdKKQQHpiSWp2ampBahFMHxMHp1QDU8S//edLNubZPd2SZMK/lDG9z5dRY5FIYqtf
 ztH+aVObNZTvpfH6y0+Z0Ta7JOLOlzvnq91yv+arfktZWGT3btoZhfgFd9YWbU+c7uw9kXF2
 heNaA3u7eVYa0yLnqBx5c8Qvl0dXOmpZqytjpF1ysPXhf/cfrrVn9JHLSlIsul56wnXq9Vm/
 lLZFPE4Om8jkWMXsUppc82KuxFND4w7RK2UrVp42FHojtXXqquo9i6cd4LywhtutNy27+nXv
 wna1iAkCHbJ1l1oK9zfv+Hn2gTWDxWz2G+57zc/oe2pHyj+/qrzYbs1aff7HmgUx6+y39B5d
 17ROlHmd90av/rvNuzM3Pjrom7TJfM7fKS/OKbEUZyQaajEXFScCAFs9Sl0xBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSvK5z5+dEg3UL9SyufH3PZvF2yS5G
 i41vfzBZzDi/j8li7ZG77BZtLdfZLWZMfsnmwO4xq6GXzePolXusHve7jzN59G1Zxejx4GOp
 x+dNcgFsUVw2Kak5mWWpRfp2CVwZf/b0MxecYa24fWU+cwNjC0sXIyeHhICJxP/P94FsLg4h
 gR2MErdur2DsYuQASkhIbNnKAWEKSxw+XAxR8pZR4tPJx0wgvbwCdhL3fvezgdSwCKhKXNgk
 BhEWlDg58wnYeFGBCIm2ZVOYQWxhAXeJn9ungdnMAuISt57MBxsjIhAqMfvKF1aQ+cwC9xgl
 diybAHXPRkaJH4v/gFWxAS2YuOI+G4jNKaAt8WPpLFaQxcwC6hLr5wlBDJWXaN46m3kCo9As
 JHfMQrJvFkLHLCQdCxhZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBEeOltYOxj2r
 PugdYmTiYDzEKMHBrCTCO2PTp0Qh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRm
 p6YWpBbBZJk4OKUamNb8ncUusPJ8Uv3ltfFZwscesusqrG2Vc7i61kB0icuVmXWPXWU1a1gO
 fj6r9tw9VGKvo1DIFhvGloyDjGozpPhqb4lsTBWIO3cnn3398b/H1FYq3w+0Y2z7K7fh5IYE
 fWldhos8WVYPNhkISt/PiZ/JMEXCrOP60gm/78e7MFQtzjgyr0a8Vi7w3gVjxmKjm2p/3+V0
 yRVdP27CKaF43iLeump+z4+KqVs7REvWM02uClslNb/h42Tx1uuy1lOebFwiJRcqHu0wYY2i
 wm3hh9cPsK+vOh3zWeCQn4XVNK78XmEJR26Ho8eTrCX/TBRP4nuxzrtx/Q8uK/b78j+YJ1YV
 7DJPVLqW2SgX7hmgxFKckWioxVxUnAgArs6LcgsDAAA=
X-CMS-MailID: 20220128061219epcas1p454b4d788f3722f2fa9fb810f34329e1d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220124135259eucas1p1ed3c76ef23d30afe620e06a419540c9e
References: <CGME20220124135259eucas1p1ed3c76ef23d30afe620e06a419540c9e@eucas1p1.samsung.com>
 <20220124135246.6998-1-m.szyprowski@samsung.com>
 <Ye7EQRefzECSqVOe@grimlerstat>
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
Cc: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

22. 1. 25. 00:22에 Henrik Grimler 이(가) 쓴 글:
> Hi Marek,
> 
> On Mon, Jan 24, 2022 at 02:52:46PM +0100, Marek Szyprowski wrote:
>> TE-gpio, if defined, is placed in the panel's node, not the parent DSI
>> node. Change the devm_gpiod_get_optional() to gpiod_get_optional() and
>> pass proper device node to it. The code already has a proper cleanup
>> path, so it looks that the devm_* variant has been applied assidentally
>                                                              ~~~~~~~~~~~~
> Small observation: the spelling above should probably be    "accidentally".
> 

I can fix it. Thanks.

>> during the conversion to gpiod API.
> 
> Best regards,
> Henrik Grimler
> 
