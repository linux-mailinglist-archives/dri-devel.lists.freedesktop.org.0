Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D63E34FC81
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EFC6EA20;
	Wed, 31 Mar 2021 09:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699436EA20
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:19:46 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210331091012euoutp02bc765726edc0a2286e58af506379d67b~xYkpmqN_S0468604686euoutp02e
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:10:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210331091012euoutp02bc765726edc0a2286e58af506379d67b~xYkpmqN_S0468604686euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617181812;
 bh=9F91v4LHq3FNCHMgYCQUFeMnM2AHdQLFXBZs/4OlEq4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=QvAMcZVeEGGlP4ll3UIRlCXH7GTNS466N67AxUY2sNWa0MrwaPz6B66YungCensib
 AVg+RbpDnBuJFMglHtMf0lytudDezOqKOUk1jpTqe/5kYdlLzbuIyiRNRubNTt3B8u
 j8I8DMqEN6kQDTZTw8HalKlmcn83zgAKUIu1jows=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210331091012eucas1p2bf06d386f4e91da4cc8a1ff3c2ebbffd~xYkpLt_Li2466024660eucas1p2G;
 Wed, 31 Mar 2021 09:10:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 11.76.09452.47C34606; Wed, 31
 Mar 2021 10:10:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210331091011eucas1p15e546a72032005342db04c4852eb5112~xYkoqxdCL2066920669eucas1p1z;
 Wed, 31 Mar 2021 09:10:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210331091011eusmtrp164c13ac2ef6a16ff475960da9871459b~xYkop5ob82596825968eusmtrp1A;
 Wed, 31 Mar 2021 09:10:11 +0000 (GMT)
X-AuditID: cbfec7f2-a9fff700000024ec-3b-60643c744f14
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A9.0E.08705.37C34606; Wed, 31
 Mar 2021 10:10:11 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210331091009eusmtip24286b2fc6cd9f92361734719125bd843~xYkmpJ8I71892618926eusmtip2z;
 Wed, 31 Mar 2021 09:10:09 +0000 (GMT)
Message-ID: <64de26a5-1831-33fe-9f31-0433ca7fb939@samsung.com>
Date: Wed, 31 Mar 2021 11:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
 Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 03/14] drm/bridge: ti-sn65dsi86: Remove incorrectly
 tagged kerneldoc comment
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210329195255.v2.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0xTZxTd997r66Nb3bNVeyNuhBozXTIcCcJLZM0kTl8WNftjTkOjtoFn
 xUHBlup0ThlTqCCEDn/E0ulSwGKHDIq12pHAOmzHEDbAYjUkVevMJFSkiEtxskFfzfjvnnO/
 c889Nx+FS54IllJ52mJOp1Xny0kRcdUb7X+vODNX9f6EV8ZU9fdgTG/nE4Lpu/gzydyaGicZ
 /9+PcaZnzE8wJ0wNQsbU2SdkhtwWkvFUK5nhaAhnIub7ONMUdSKmvCKTid4uwxnfyJ/YhzQ7
 HjguZOtKBgi2znhOwNZ3PMZYizWAs7/WDGLsyHAHybqe3xOwwUofxjac8ZNsV1UtwU463v7k
 jWxRZi6Xn7ef061WqER7qicvkEVt1BfuRhdRgsbICpRAAZ0GPucpvAKJKAndhMD1wBwHzxDY
 /W0kDyYRfG2Zxl5Jnl4vE/ANG4JwqR/x4C8EY80XY4PFtAKipa3EXE3QK+AfR6WQ5xdCz7mH
 MX4xrQJ7wBabKqU5eBSeimlxWgalzy7FHBbRMwh+MIWwOYDTkxhETnliCpJeBS/b78QUCfRW
 aHsaxHh1EnzjrIulAHowAbzXWhC/+HqomWmOh5DCqO+KkK+XQW/tSYKvj0Kw6VhcbETgbL2O
 8421MNI/PetGzTqsgh/dq3l6HZx2WfE5GugFEAgv5HdYAN9ePRunxWAsk/CvkyHY54wPlEHj
 H1NkDZKb593FPC+/eV4a8/++3yPCjmScQV+g4fSpWu5Ail5doDdoNSk5hQUONPsle2d8kWvo
 u9GJFA/CKORBQOHyRWJpl1olEeeqDx7idIW7dIZ8Tu9BiRQhl4ntdc27JLRGXcx9znFFnO5V
 F6MSlpZgKyUvV9aKL7ff6DvudmussgHiS8Vh7LSJ2KuEK1vTsqGzY3lRtzbRPXp3WOl1FCqL
 X4soDYm4NZy6pFq4Bl2qSA29s/+DtCSj69iG+kP1wcC2E61HQ/c2SM472n0vtnvEyT9Nb3z+
 KG+HdxlqdG7yrN1MOQT/KqTbh5Z7sqvG+8FsShLmDCpahqxvXmb1KZqDRzLcReknf8s4bIj0
 VG4qz0rqjQzdfHFnKtmbO5AVoTM+JbprtmBf5WTTD7OaRhvWrd/SYH/9d9XezLdUM7e7VdLS
 By2f1XbdDJssEx0bbenOI47dtuD9fb+EbN7ynazJJ9v3cUhkSW/O2X3jI6Oc0O9Rp76L6/Tq
 /wAnSVouAQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42I5/e/4Pd1im5QEg01vdS16z51ksji9/x2L
 xdllB9ksrnx9z2Zx9ftLZouTb66yWHROXMJuMXH/WXaLy7vmsFkc6ou2uPbzMbPFp1kPmS1W
 /NzKaNHeZWPx83obs8XxO0+ZHAQ83t9oZfeY3XCRxWN2x0xWj8V7XjJ5zFl0g9njxIRLTB53
 ru1h89j+7QGrx/3u40weS6ZdZfM40DuZxePzJrkAnig9m6L80pJUhYz84hJbpWhDCyM9Q0sL
 PSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jL7P89kKNnJU7Fq6naWB8Q1bFyMnh4SAicSH
 nW2sXYxcHEICSxklDrb9YoJIiEvsnv+WGcIWlvhzrYsNougZo8TO/afYQRK8AnYSP5s2sIDY
 LAKqEn82dUPFBSVOznwCFhcVSJA4+2Ee2FBhgVSJZ2+/gm1mBlrQ9GUl2GYRgQYmiUt3FzOB
 OMwCX5kkWl4tZYdYd5tR4vjWLawgLWwCmhJ/N98Ea+cUCJXY+OE+E8QoM4murV2MELa8RPPW
 2cwTGIVmIblkFpKNs5C0zELSsoCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgWth27Ofm
 HYzzXn3UO8TIxMF4iFGCg1lJhFf4QGKCEG9KYmVValF+fFFpTmrxIUZTYHBMZJYSTc4HJqa8
 knhDMwNTQxMzSwNTSzNjJXHerXPXxAsJpCeWpGanphakFsH0MXFwSjUwuUx1eWDhdlT70avP
 l894zY+bGvmE8/6r7E37TN6peentZ2fY8/nl7KuGSSwnLsmL++sy1uX4F60qc3AXDOG9GrTv
 nYhpwQJx1a4J97TYTmdYSP3pm/db/Odyk6onwmwHPH51T7/1YotNznbWRMaYqC3NeRduXG1j
 YN3qXLbBZk1R/V2DzJ1x6hZznV887U5ren3qq0vcbZUXRx967SldqpmwjbP+qv/GzB9XeVTj
 rgdsqWIonrheLtHRd1Jkc+q9iv1zb0jGRu+5Mj/DsZffp/5p5ZQQ04d5Jr2Pji42STpunbFR
 +Iuh6fI7fK7XIrk0VjibPPcuW2rItq3wakCd/6cS7uPxjz/1ztl5aeJEJZbijERDLeai4kQA
 EucsnJQDAAA=
X-CMS-MailID: 20210331091011eucas1p15e546a72032005342db04c4852eb5112
X-Msg-Generator: CA
X-RootMTR: 20210330025422eucas1p2d8e2f35eb9f36ded52d722425c349f62
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025422eucas1p2d8e2f35eb9f36ded52d722425c349f62
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025422eucas1p2d8e2f35eb9f36ded52d722425c349f62@eucas1p2.samsung.com>
 <20210329195255.v2.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClcgZG5pdSAzMC4wMy4yMDIxIG/CoDA0OjUzLCBEb3VnbGFzIEFuZGVyc29uIHBpc3plOgo+IEEg
cmFuZG9tIGNvbW1lbnQgaW5zaWRlIGEgZnVuY3Rpb24gaGFkICIvKioiIGluIGZyb250IG9mIGl0
LiBUaGF0Cj4gZG9lc24ndCBtYWtlIHNlbnNlLiBSZW1vdmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBE
b3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+ClJldmlld2VkLWJ5OiBBbmRy
emVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKUmVnYXJkcwpBbmRyemVqCj4gLS0tCj4K
PiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPgo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1z
bjY1ZHNpODYuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242
NWRzaTg2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gaW5kZXgg
OTZmZThmMmMwZWE5Li43NmY0M2FmNjczNWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
c242NWRzaTg2LmMKPiBAQCAtNzg4LDcgKzc4OCw3IEBAIHN0YXRpYyB2b2lkIHRpX3NuX2JyaWRn
ZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgIAkvKiBzZXQgZHNpIGNsayBm
cmVxdWVuY3kgdmFsdWUgKi8KPiAgIAl0aV9zbl9icmlkZ2Vfc2V0X2RzaV9yYXRlKHBkYXRhKTsK
PiAgIAo+IC0JLyoqCj4gKwkvKgo+ICAgCSAqIFRoZSBTTjY1RFNJODYgb25seSBzdXBwb3J0cyBB
U1NSIERpc3BsYXkgQXV0aGVudGljYXRpb24gbWV0aG9kIGFuZAo+ICAgCSAqIHRoaXMgbWV0aG9k
IGlzIGVuYWJsZWQgYnkgZGVmYXVsdC4gQW4gZURQIHBhbmVsIG11c3Qgc3VwcG9ydCB0aGlzCj4g
ICAJICogYXV0aGVudGljYXRpb24gbWV0aG9kLiBXZSBuZWVkIHRvIGVuYWJsZSB0aGlzIG1ldGhv
ZCBpbiB0aGUgZURQIHBhbmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
