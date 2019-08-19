Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C355E9261A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAF76E137;
	Mon, 19 Aug 2019 14:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28956E137
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:06:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190819140638euoutp01101c2a76efdbdf4b0fbb38e7844c0e40~8WBCDw_Ki1937419374euoutp01M
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:06:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190819140638euoutp01101c2a76efdbdf4b0fbb38e7844c0e40~8WBCDw_Ki1937419374euoutp01M
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190819140637eucas1p2aea14cd497ed1440958ec4453fd72a56~8WBBlIvWv0548605486eucas1p29;
 Mon, 19 Aug 2019 14:06:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 18.86.04469.DECAA5D5; Mon, 19
 Aug 2019 15:06:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190819140636eucas1p2747dde6c7b367715bec60701c73f95aa~8WBApKTZ70935809358eucas1p24;
 Mon, 19 Aug 2019 14:06:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190819140636eusmtrp15c76d6a68adde018a92f30b1c281af50~8WBAZ5p6n0065400654eusmtrp1U;
 Mon, 19 Aug 2019 14:06:36 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-8d-5d5aacedb20b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 53.83.04166.CECAA5D5; Mon, 19
 Aug 2019 15:06:36 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190819140635eusmtip2ccec1f71a6888ae5406c86bf01082ba2~8WA-tqE3X0852508525eusmtip2Q;
 Mon, 19 Aug 2019 14:06:35 +0000 (GMT)
Subject: Re: [PATCH] video/fbdev/aty128fb: Remove dead code
To: Souptick Joarder <jrdr.linux@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <8902838a-5e71-3d1f-0372-e9b400f9b033@samsung.com>
Date: Mon, 19 Aug 2019 16:06:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFqt6zaQEX60_KL-m+K7VYQU=z144u=yfeVjPtGVaiAj5NbBaQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2znbzmaT49R8sUhYFFipCf44pElFwfkTJf1IFl6WHtRyKpt3
 IZTUlopogtqYl9R0TlExnTcUmeVSMbW8NRAVFVIaSrrA8NK2M8k/H8/7vM/D+z4vH4GJp7ie
 RFxCMqNIkMVLeEJcP7r/1cfcKg27UbR5iXq/uoRRmqlcnJq1bPOo+blsjPpSvMOlvvdreFSp
 ao5DtX6q51Pa/W5ENbzZ5twW0l3NPzj04J9anO5TL/Hp5UIjh24on+PR20PWp6q/GNFGrQan
 dzsvPhJIhUHRTHxcKqPwC44Uxs6MVOJJJjx9YmsOy0YrWAEiCCADYHLNCoWEmNQiOK4z89hi
 D0HvGxXOFrsILE0Ga0dgd9RvzjgsTQjGxy0OlRnBbIeJY1O5koGwYmrDbNiNvAZVI3/tDows
 5cBCtR63NXjkTSh9rUM2LCKD4fPhgJ3HyctQZ9LzbdidDIXl0Q4uq3GBsXfrdo2ADIFm7aSd
 x0gPMK3XcFjsBT1mjX0YkJt8GFgdQOze92DpQOfI4Apbxi4+iy/ARFkRzhraEByqfjrcPQia
 yo4cjkAYMc5wbTfDSG9o7/dj6TugHWtA7CmdYdHswi7hDG/1FY4Li0CVL2bVV6CjsYN3Mrag
 rxkrQRL1qWjqU3HUp+Ko/8+tRbgOeTApSnkMo/RPYNJ8lTK5MiUhxjcqUd6JrN9s4sj4uxdZ
 vj0zIJJAkrMiulwaJubKUpUZcgMCApO4idI1VkoULcvIZBSJEYqUeEZpQOcJXOIhyjqz8lRM
 xsiSmRcMk8QoTrocQuCZjeT5ERs+91tyFp3WZzdCchLvZuieOz/xHtILPyxlhi98DJ1vr1l8
 jKmmdyaL/Ee5rQ+bH1ga1w6uR2e1SDPD+vPco4q5r5xeVoxOtezv/SprkLoZQnK9BEHTVbfS
 hvfBz3BuOH0Qdit7uktqDdGbATPhobzjrt2N9ULfvKrI6WoJroyV+V/FFErZP+bO9mxiAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsVy+t/xe7pv1kTFGtzrUrRY+PAus8Wc8y0s
 Fle+vmezuHa1gdniRN8HVovLu+awWUzsuMpksebIYnaLFT+3Mlos6XzP5MDlsWXlTSaPvd8W
 sHjsnHWX3eN+93EmjyXTrrJ5vN8HJObu6mP0OL5iDovH501yAZxRejZF+aUlqQoZ+cUltkrR
 hhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkXD89gKbjFUnH61VXmBsYHzF2M
 nBwSAiYSi19eBLK5OIQEljJKXGm9ytrFyAGUkJE4vr4MokZY4s+1LjaImteMEo1rT7KBJIQF
 rCUe3FoHNkhEQFti7uFfYIOYBSYySRyYewCqYymTxNfFs1lAqtgErCQmtq9iBLF5Bewkjv7d
 DRZnEVCVWHRrGzuILSoQIXHm/QoWiBpBiZMzn4DZnAKBEitXnGUFsZkF1CX+zLvEDGGLS9x6
 Mp8JwpaX2P52DvMERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3
 MQKjd9uxn5t3MF7aGHyIUYCDUYmH12NaVKwQa2JZcWXuIUYJDmYlEd6KOUAh3pTEyqrUovz4
 otKc1OJDjKZAz01klhJNzgcmlrySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalF
 MH1MHJxSDYwsi3aw/jnYZ6vN1a/6NeNsgJniRVtvi4Nr7H7F7GKNY9YrszmflJ72OqPOLVmk
 aNKvk07V0QdktL5P3NLGfPTeU96l9449FCt8rvE0r+fX/8X+LcyPeL1ezZpkczHCevO2tWH3
 Hh69vMNvwZPmO+VrM97t/vnu/ZaPfV8nBMjn/OiRvlew4/wnJZbijERDLeai4kQAQu+Ar/QC
 AAA=
X-CMS-MailID: 20190819140636eucas1p2747dde6c7b367715bec60701c73f95aa
X-Msg-Generator: CA
X-RootMTR: 20190814122400epcas1p2c2d538ff700b5ac71008973d5ba743f4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190814122400epcas1p2c2d538ff700b5ac71008973d5ba743f4
References: <1564514053-4571-1-git-send-email-jrdr.linux@gmail.com>
 <CAFqt6zZMgowAd-UvdEjydF=9HPY7bvXpWuzCqBLS7+3j_Dkgig@mail.gmail.com>
 <CGME20190814122400epcas1p2c2d538ff700b5ac71008973d5ba743f4@epcas1p2.samsung.com>
 <CAFqt6zaQEX60_KL-m+K7VYQU=z144u=yfeVjPtGVaiAj5NbBaQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566223598;
 bh=q58WtZgA2eEGtNWy+AqBhaRc1uS08DwXKgjQu3WF7Lo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=M4LMJkMmgxRlyM7Q5pW3CVyCixm78p2+kZsJMUGLEuPY9R3VwqDqH4eGw4KeQ72OE
 RTotVIdqDsCTvVkWVoEBqhZNrv848fnnhr3ymTbrbcXOey3b1sFsWhfAFinuWTaTeU
 TkAvjTNkX4qZc4nr2007P24VGKf3ScRf3YfGwUE8=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 syrjala@sci.fi, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mpatocka@redhat.com, Paul Mackerras <paulus@samba.org>, sam@ravnborg.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTQvMTkgMjoyMyBQTSwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPiBPbiBXZWQsIEF1
ZyA3LCAyMDE5IGF0IDI6MTIgUE0gU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5j
b20+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxMjozOCBBTSBTb3VwdGlj
ayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gVGhpcyBpcyBk
ZWFkIGNvZGUgc2luY2UgMy4xNS4gSWYgdGhlcmUgaXMgbm8gcGxhbiB0byB1c2UgaXQKPj4+IGZ1
cnRoZXIsIHRoaXMgY2FuIGJlIHJlbW92ZWQgZm9yZXZlci4KPj4KPj4gQW55IGNvbW1lbnQgb24g
dGhpcyBwYXRjaCA/Cj4gCj4gQW55IGNvbW1lbnQgb24gdGhpcyBwYXRjaCA/Cj4gCj4+Cj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+
ClBhdGNoIHF1ZXVlZCBmb3IgdjUuNCwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBF
bGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
