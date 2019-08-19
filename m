Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DFC925DB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4486E130;
	Mon, 19 Aug 2019 14:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A70B6E130
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:04:10 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190819140409euoutp024f9e9cfa2c5524535e8934f5fa45bef0~8V_3BlRN70250402504euoutp02X
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:04:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190819140409euoutp024f9e9cfa2c5524535e8934f5fa45bef0~8V_3BlRN70250402504euoutp02X
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190819140408eucas1p14658360375590d19b1408d95715d7d88~8V_2e72dd0604506045eucas1p18;
 Mon, 19 Aug 2019 14:04:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 17.24.04374.85CAA5D5; Mon, 19
 Aug 2019 15:04:08 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190819140407eucas1p2b07b9917af8a5610b99568e2ae17b362~8V_1yy3Dd0246202462eucas1p2E;
 Mon, 19 Aug 2019 14:04:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190819140407eusmtrp2c784d48eeed6011d8b8af17bbb042294~8V_1kDeJC3145831458eusmtrp2i;
 Mon, 19 Aug 2019 14:04:07 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-e2-5d5aac58de80
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 64.15.04117.75CAA5D5; Mon, 19
 Aug 2019 15:04:07 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190819140407eusmtip1b1360e1158bdbf1d2b1ab5376a56e06f~8V_1NvHfZ0843608436eusmtip1E;
 Mon, 19 Aug 2019 14:04:07 +0000 (GMT)
Subject: Re: [PATCH v2] video: fbdev: Mark expected switch fall-through
To: Anders Roxell <anders.roxell@linaro.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <270684a4-ce22-ebb8-73a8-c004674c8f5d@samsung.com>
Date: Mon, 19 Aug 2019 16:04:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190730152530.3055-1-anders.roxell@linaro.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djP87oRa6JiDRo/cVvcmvKbyeLK1/ds
 Flv3qFqc6PvAanF51xw2B1aPdQdVPe5c28Pmcb/7OJPH501yASxRXDYpqTmZZalF+nYJXBnz
 V21gLFjDWfH0/ne2BsYf7F2MnBwSAiYSx660M3UxcnEICaxglNjQNYMZwvnCKNH36QwLhPOZ
 UWLz3o0sMC1/75yHalnOKDH32klmkISQwFtGiZPHeUBsYQF3ibOrJoLtEBHQkZj7+jxYDbNA
 hcTso5sYQWw2ASuJie2rwGxeATuJWZdms4HYLAKqEsf2HwWLiwpESNw/toEVokZQ4uTMJ2BH
 cArYSrz68ZwNYqa4xK0n85kgbHmJ5q2zwV6QEJjHLnHy4SdmiKtdJC7samSDsIUlXh3fAg0A
 GYn/O+czQTSsY5T42/ECqns7o8Tyyf+gOqwlDh+/CHQGB9AKTYn1u/Qhwo4SP/c9YwQJSwjw
 Sdx4KwhxBJ/EpG3TmSHCvBIdbUIQ1WoSG5ZtYINZ27VzJfMERqVZSF6bheSdWUjemYWwdwEj
 yypG8dTS4tz01GLjvNRyveLE3OLSvHS95PzcTYzAFHP63/GvOxj3/Uk6xCjAwajEw+sxLSpW
 iDWxrLgy9xCjBAezkghvxRygEG9KYmVValF+fFFpTmrxIUZpDhYlcd5qhgfRQgLpiSWp2amp
 BalFMFkmDk6pBsbSqd6vZlq+StNmdDj2y2uul/H1r2c+pP767RniVltkPuGR1FqZy48Lt/2c
 csNLYab/14B5x/rnHpu35Ejckpr7E20O1+78m+UnaRBrd32G3Qmu3Pdb+7JcM917mBYv1rn9
 jXdO5XrNHbPe7n/HclvwrWGQydEPpUnJalfZp9l8nXBji9mWylOFSizFGYmGWsxFxYkA6cZO
 Wy0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xu7rha6JiDdpPSlrcmvKbyeLK1/ds
 Flv3qFqc6PvAanF51xw2B1aPdQdVPe5c28Pmcb/7OJPH501yASxRejZF+aUlqQoZ+cUltkrR
 hhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnzV21gLFjDWfH0/ne2BsYf7F2M
 nBwSAiYSf++cZ+pi5OIQEljKKPFk+jS2LkYOoISMxPH1ZRA1whJ/rnWxQdS8ZpQ4+3cnE0hC
 WMBd4uyqiWCDRAR0JOa+Ps8MYjMLVEgcf9/NCmILCUxglFh1ygTEZhOwkpjYvooRxOYVsJOY
 dWk2G4jNIqAqcWz/UbC4qECExJn3K1ggagQlTs58AmZzCthKvPrxnA1ivrrEn3mXoHaJS9x6
 Mp8JwpaXaN46m3kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmb
 GIERte3Yzy07GLveBR9iFOBgVOLh9ZgWFSvEmlhWXJl7iFGCg1lJhLdiDlCINyWxsiq1KD++
 qDQntfgQoynQcxOZpUST84HRnlcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUI
 po+Jg1OqgfHIJNbpr1T/hC9vnVGYUPDi8YtVf5e43QpLXXk3fOc63/OKt/K3zZpwJfri7B9+
 P5jsNtzkZpmwN6cgW/7Di4vazpNt77Pfs8yuV4neZ60TVJHQJpxTI2TW+kpp7sKTdrPy/Ji5
 sjUmLlaZeOfyw58hh3ifRQq//O+yne3GJc41ue8lNH7sePNDiaU4I9FQi7moOBEAN5yYSr4C
 AAA=
X-CMS-MailID: 20190819140407eucas1p2b07b9917af8a5610b99568e2ae17b362
X-Msg-Generator: CA
X-RootMTR: 20190730152542epcas2p46c9b1c2e97c0b33df072e4fa1328f8d0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190730152542epcas2p46c9b1c2e97c0b33df072e4fa1328f8d0
References: <CGME20190730152542epcas2p46c9b1c2e97c0b33df072e4fa1328f8d0@epcas2p4.samsung.com>
 <20190730152530.3055-1-anders.roxell@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566223449;
 bh=IVGVScXvON25oAq1ZXeeLkXi4ylwf9qGe3dfQULgQ2I=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=RtQjCBceG9CWPNsiEsdUGcOhjMQ4u5ZkoLudtB0y+z92gBWgaIopdhhUCs+vXzMM7
 QYXNTbN/FrNsW0vTQbhCGTDAYfTfihA4PapxbRv12D909BVblh5AmIxk9YCUp+vFCn
 QbAoz3aTdvkuoFckA3CVDoBzlRw4hYZiF6Zx9JQ0=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gustavo@embeddedor.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMzAvMTkgNToyNSBQTSwgQW5kZXJzIFJveGVsbCB3cm90ZToKPiBOb3cgdGhhdCAtV2lt
cGxpY2l0LWZhbGx0aHJvdWdoIGlzIHBhc3NlZCB0byBHQ0MgYnkgZGVmYXVsdCwgdGhlCj4gZm9s
bG93aW5nIHdhcm5pbmdzIHNob3dzIHVwOgo+IAo+IC4uL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hf
bW9iaWxlX2xjZGNmYi5jOiBJbiBmdW5jdGlvbiDigJhzaF9tb2JpbGVfbGNkY19jaGFubmVsX2Zi
X2luaXTigJk6Cj4gLi4vZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmM6MjA4
NjoyMjogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwKPiAgdGhyb3VnaCBbLVdpbXBs
aWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgaW5mby0+Zml4LnlwYW5zdGVwID0gMjsKPiAgICB+fn5+
fn5+fn5+fn5+fn5+fn5+Xn5+Cj4gLi4vZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNk
Y2ZiLmM6MjA4NzoyOiBub3RlOiBoZXJlCj4gICBjYXNlIFY0TDJfUElYX0ZNVF9OVjE2Ogo+ICAg
Xn5+fgo+IC4uL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jOiBJbiBmdW5j
dGlvbiDigJhzaF9tb2JpbGVfbGNkY19vdmVybGF5X2ZiX2luaXTigJk6Cj4gLi4vZHJpdmVycy92
aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmM6MTU5NjoyMjogd2FybmluZzogdGhpcyBzdGF0
ZW1lbnQgbWF5IGZhbGwKPiAgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAg
aW5mby0+Zml4LnlwYW5zdGVwID0gMjsKPiAgICB+fn5+fn5+fn5+fn5+fn5+fn5+Xn5+Cj4gLi4v
ZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmM6MTU5NzoyOiBub3RlOiBoZXJl
Cj4gICBjYXNlIFY0TDJfUElYX0ZNVF9OVjE2Ogo+ICAgXn5+fgo+IAo+IFJld29yayB0byBhZGRy
ZXNzIGEgd2FybmluZ3MgZHVlIHRvIHRoZSBlbmFibGVtZW50IG9mCj4gLVdpbXBsaWNpdC1mYWxs
dGhyb3VnaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxs
QGxpbmFyby5vcmc+CgpQYXRjaCBxdWV1ZWQgZm9yIHY1LjQsIHRoYW5rcy4KCkJlc3QgcmVnYXJk
cywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9s
YW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
