Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11C36090A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 17:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36526E4EC;
	Fri,  5 Jul 2019 15:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38436E4EC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:16:27 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190705151626euoutp020b2114ca9edce8a8b1d5b370a3df0b6a~ui8IMaQc70625506255euoutp02E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:16:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190705151626euoutp020b2114ca9edce8a8b1d5b370a3df0b6a~ui8IMaQc70625506255euoutp02E
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190705151625eucas1p2229fd74627829fcc1d0b400988efa3e3~ui8HtvFVC0423204232eucas1p2x;
 Fri,  5 Jul 2019 15:16:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 67.5B.04298.9C96F1D5; Fri,  5
 Jul 2019 16:16:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190705151624eucas1p1cc3747c06ef51edab7a7e83a7f3ef057~ui8Gx4xEL0380803808eucas1p1b;
 Fri,  5 Jul 2019 15:16:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190705151624eusmtrp2e980ee27e8f6641c9c722f0919b648b8~ui8Gj4cbc3106131061eusmtrp2y;
 Fri,  5 Jul 2019 15:16:24 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-43-5d1f69c9fe07
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 37.77.04146.8C96F1D5; Fri,  5
 Jul 2019 16:16:24 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190705151624eusmtip1e8a679db120447f67385f93fb2bb9a39~ui8GP1GrP2671826718eusmtip17;
 Fri,  5 Jul 2019 15:16:24 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <4771baff-b157-2416-d43b-bf6d8980fbb3@samsung.com>
Date: Fri, 5 Jul 2019 17:16:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625160103.GA13133@embeddedor>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djP87onM+VjDZa/lrS48vU9m8XWPaoW
 K77MZLc4051rcaLvA6vF5V1z2BzYPGY3XGTxWHdQ1WPnrLvsHve7jzN5fN4kF8AaxWWTkpqT
 WZZapG+XwJXRtewWU8EU3orjs6azNDB+4+pi5OCQEDCROHJaoYuRi0NIYAWjxKHjd1ggnC+M
 Emu2vmXvYuQEcj4zSszpNwKxQRpuHvvMBFG0nFFixv5jzBDOW0aJxa0vWEGqhAX8JVqa7jGB
 2CICRhKzZ3SzghQxg+w4fPM1G0iCTcBKYmL7KkYQm1fATuLU406wZhYBFYmZ84+DrRYViJC4
 f2wDK0SNoMTJmU9YQGxOAQOJbdc2gC1gFhCXuPVkPpQtL9G8dTYzxKmr2CXubIE620Xi7aOF
 LBC2sMSr41vYIWwZif8754O9IyGwjlHib8cLZghnO6PE8sn/2CCqrCUOH7/ICgoxZgFNifW7
 9CHCjhIHNzQyQwKST+LGW0GIG/gkJm2bDhXmlehoE4KoVpPYsGwDG8zarp0rmScwKs1C8tks
 JN/MQvLNLIS9CxhZVjGKp5YW56anFhvmpZbrFSfmFpfmpesl5+duYgSmnNP/jn/awfj1UtIh
 RgEORiUe3hNO8rFCrIllxZW5hxglOJiVRHgTg4BCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeasZ
 HkQLCaQnlqRmp6YWpBbBZJk4OKUaGGO3qJ/ZESqlIyW97ePfuGCLO3PU9ogeCtL1+n73TfIz
 i80Zy+qlpASip7S2fQ7cYmv4T+v9bIlPR+orrO5sbLRkzprU9+qMXqpOo673d8/ahdP4neXW
 TMlher65s9jk4IxKXz1+Df0Gk93nwk7eX7Oa/67tjDu7K0qW6/CJ9vTM3BddVXd5lhJLcUai
 oRZzUXEiALxjRfM1AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xu7onMuVjDT5+lrW48vU9m8XWPaoW
 K77MZLc4051rcaLvA6vF5V1z2BzYPGY3XGTxWHdQ1WPnrLvsHve7jzN5fN4kF8AapWdTlF9a
 kqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfRtewWU8EU3orj
 s6azNDB+4+pi5OSQEDCRuHnsM1MXIxeHkMBSRokru/ewdTFyACVkJI6vL4OoEZb4c62LDaLm
 NaNE15cb7CAJYQFfiZkN35hBbBEBI4nZM7pZQYqYBVYwSixb95kVoqOZUeLRi4NgVWwCVhIT
 21cxgti8AnYSpx53soLYLAIqEjPnHwebKioQIXHm/QoWiBpBiZMzn4DZnAIGEtuubWACsZkF
 1CX+zLvEDGGLS9x6Mh8qLi/RvHU28wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLDfWK
 E3OLS/PS9ZLzczcxAuNs27Gfm3cwXtoYfIhRgINRiYf3hJN8rBBrYllxZe4hRgkOZiUR3sQg
 oBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnA1NAXkm8oamhuYWlobmxubGZhZI4b4fAwRgh
 gfTEktTs1NSC1CKYPiYOTqkGxqoYNt8zzB0/lopu5l0u/cXXfjfXw5fmzaqRxh9+TS+eKCO8
 XNTMdbNh+Qfhe5IPJv89krnN6KhSyytu1t039s9r/vXMOqzh9yLLgNOxRzd//tfcNeW0XsDW
 RnVBIQ4Nv80OJ1QEBMMNnzG5JAXuW2k47e2SJZ3W3SEfFO06zzJolzE+PzFltxJLcUaioRZz
 UXEiAEIxPL/JAgAA
X-CMS-MailID: 20190705151624eucas1p1cc3747c06ef51edab7a7e83a7f3ef057
X-Msg-Generator: CA
X-RootMTR: 20190625160111epcas3p162f3d789c6219e679d9fd30c6a6b3d51
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190625160111epcas3p162f3d789c6219e679d9fd30c6a6b3d51
References: <CGME20190625160111epcas3p162f3d789c6219e679d9fd30c6a6b3d51@epcas3p1.samsung.com>
 <20190625160103.GA13133@embeddedor>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562339786;
 bh=MtNtGRdGYlJXyRRrGWSLm9dBjD9CzU/0eY5SDO5caDI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=P5AKdrd3BOx1Hvh/1nkZcY8lx5IH28H3j888RCrTffAr2ZH9xiFnBg79yz/03sXqt
 jSkorBtH6V4mm/aSjHpK8Xzq4DME+vv/l8qRMcVnGMmRTZnqe3mb5e70K1x1H8+Rg0
 PrdoqqgHeZBYwMtJZjKwcjZ9Oj2xKZ+h7eUUazrw=
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
Cc: Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjUvMTkgNjowMSBQTSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiBJbiBwcmVw
YXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3aXRjaAo+
IGNhc2VzIHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLgo+IAo+IFRoaXMg
cGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKPiAKPiBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3MzYy1mYi5jOiBJbiBmdW5jdGlvbiDigJhzM2NfZmJfYmxhbmvigJk6Cj4gZHJpdmVycy92
aWRlby9mYmRldi9zM2MtZmIuYzo4MTE6MTY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBm
YWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgIHNmYi0+ZW5hYmxlZCAm
PSB+KDEgPDwgaW5kZXgpOwo+ICAgIH5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+Cj4gZHJp
dmVycy92aWRlby9mYmRldi9zM2MtZmIuYzo4MTQ6Mjogbm90ZTogaGVyZQo+ICAgY2FzZSBGQl9C
TEFOS19OT1JNQUw6Cj4gICBefn5+Cj4gICBMRCBbTV0gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2diLWxpZ2h0Lm8KPiAgIENDIFtNXSAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvc2VjYm9vdC9ncDEwYi5vCj4gZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYzogSW4gZnVu
Y3Rpb24g4oCYczNjX2ZiX2NoZWNrX3ZhcuKAmToKPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1m
Yi5jOjI4NjoyMjogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgdmFyLT50cmFuc3AubGVuZ3RoID0gMTsKPiAgICB+
fn5+fn5+fn5+fn5+fn5+fn5+Xn5+Cj4gZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYzoyODg6
Mjogbm90ZTogaGVyZQo+ICAgY2FzZSAxODoKPiAgIF5+fn4KPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L3MzYy1mYi5jOjMxNDoyMjogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3Vn
aCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgdmFyLT50cmFuc3Aub2Zmc2V0ID0gMjQ7
Cj4gICAgfn5+fn5+fn5+fn5+fn5+fn5+fl5+fn4KPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1m
Yi5jOjMxNjoyOiBub3RlOiBoZXJlCj4gICBjYXNlIDI0Ogo+ICAgXn5+fgo+IAo+IFdhcm5pbmcg
bGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCj4gCj4gTm90aWNlIHRo
YXQsIGluIHRoaXMgcGFydGljdWxhciBjYXNlLCB0aGUgY29kZSBjb21tZW50cyBhcmUgbW9kaWZp
ZWQKPiBpbiBhY2NvcmRhbmNlIHdpdGggd2hhdCBHQ0MgaXMgZXhwZWN0aW5nIHRvIGZpbmQuCj4g
Cj4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCj4g
LVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIu
IFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgoKUGF0Y2ggcXVldWVkIGZvciB2NS4zLCB0
aGFua3MuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3Vu
ZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
