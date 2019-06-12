Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A742858
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 16:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7CB89580;
	Wed, 12 Jun 2019 14:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F5289580
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 14:04:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190612140415euoutp01b7f4f2aad49294c7733ac9a188fe24d3~neHiJLhQB2516325163euoutp01i
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 14:04:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190612140415euoutp01b7f4f2aad49294c7733ac9a188fe24d3~neHiJLhQB2516325163euoutp01i
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190612140414eucas1p1038570cb76911800945c01500eee9d4e~neHhiY01d3019030190eucas1p1H;
 Wed, 12 Jun 2019 14:04:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CE.8A.04298.D56010D5; Wed, 12
 Jun 2019 15:04:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190612140413eucas1p1b72f9da419ac23b227fd7316b1bf3de6~neHgj5MGh3020330203eucas1p1G;
 Wed, 12 Jun 2019 14:04:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190612140413eusmtrp10452264c3bc4df51d72019284fa2cc4b~neHgVF4JW2651626516eusmtrp1b;
 Wed, 12 Jun 2019 14:04:13 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-08-5d01065d1a86
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id EC.61.04146.C56010D5; Wed, 12
 Jun 2019 15:04:13 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190612140412eusmtip1ab3d5e919d1d18ce372ca3125f4a0e3b~neHf-G_0v2528925289eusmtip1K;
 Wed, 12 Jun 2019 14:04:12 +0000 (GMT)
Subject: Re: [PATCH 02/34] gpu: drm: bridge: sii9234: simplify getting the
 adapter of a client
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <87d7a499-22b8-5e9f-8da2-54c83d1c4b2d@samsung.com>
Date: Wed, 12 Jun 2019 16:04:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608114036.GA4786@pendragon.ideasonboard.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djP87pxbIyxBvP7WS16z51ksvi/bSKz
 xZWv79ksOicuYbfo+PuF0eLyrjlsFn3n3B3YPfZ+W8DiMbtjJqvH9m8PWD3udx9n8ni2cD2L
 x+dNcgFsUVw2Kak5mWWpRfp2CVwZs7/cZy74zVvxfQp/A+MW7i5GDg4JAROJ73f9uxi5OIQE
 VjBK7L97mAXC+cIoMWnBFtYuRk4g5zOjxKd37iA2SMOXuy1MEEXLGSW6532G6njLKLHv1yN2
 kLHCAgkSN7+IgTSICGRL3FgxjxmkhllgEaPEh9ZmsKlsApoSfzffZAOxeQXsJObd2sAOYrMI
 qEq8P3uCGcQWFYiQ+LJzEyNEjaDEyZlPWEBsTgF7iev3/zGB2MwC8hLNW2czQ9jiEreezAe7
 TkJgF7vEwfZ2JoizXST29u5jhbCFJV4d38IOYctInJ7cwwJh10vcX9HCDNHcwSixdcNOZoiE
 tcTh4xdZQT5jBrp6/S59SNg5Sky5HQZh8knceCsIcQKfxKRt05khwrwSHW1CEDMUJe6f3Qo1
 T1xi6YWvbBMYlWYheWwWkmdmIXlmFsLaBYwsqxjFU0uLc9NTiw3zUsv1ihNzi0vz0vWS83M3
 MQKT0Ol/xz/tYPx6KekQowAHoxIP74Hp/2OEWBPLiitzDzFKcDArifAaZTPECvGmJFZWpRbl
 xxeV5qQWH2KU5mBREuetZngQLSSQnliSmp2aWpBaBJNl4uCUamDkq45LyPmix+H7O+nedrWd
 8/71fDi3X0ayt6Xo+YvYIqu44Pf7f+/a8lfga8Ta03lz7luKf5Czn6ERbe/AwMDYI6+//LXl
 q1uzVos9fc75yTLyrkSqzNvnXSxtW4xC+jSXBT4T8cq2UPRc3TCZtaVX6MZb0Wc5kz/69Bs/
 vv5799JPrmfire4rsRRnJBpqMRcVJwIAYJ6ghj4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xu7qxbIyxBtfULHrPnWSy+L9tIrPF
 la/v2Sw6Jy5ht+j4+4XR4vKuOWwWfefcHdg99n5bwOIxu2Mmq8f2bw9YPe53H2fyeLZwPYvH
 501yAWxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJ
 ehmzv9xnLvjNW/F9Cn8D4xbuLkZODgkBE4kvd1uYuhi5OIQEljJKTJt2iRUiIS6xe/5bZghb
 WOLPtS42iKLXjBI7WlexdDFycAgLJEjc/CIGUiMikC3xt3Uh2CBmgUWMEj9W3ANrFhJoY5L4
 vDUTxGYT0JT4u/kmG4jNK2AnMe/WBnYQm0VAVeL92RNg9aICERKzdzWwQNQISpyc+QTM5hSw
 l7h+/x8TiM0soC7xZ94lZghbXqJ562woW1zi1pP5TBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJ
 LS3OTc8tNtQrTswtLs1L10vOz93ECIy8bcd+bt7BeGlj8CFGAQ5GJR7eA9P/xwixJpYVV+Ye
 YpTgYFYS4TXKZogV4k1JrKxKLcqPLyrNSS0+xGgK9NxEZinR5HxgUsgriTc0NTS3sDQ0NzY3
 NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cDIMnVn0+/fwW9ZrM7vvKJ8wMljU3a68Y75
 vAe7myZNKWkRuhf1o2/ZswczOTh9LC6siG5m6rj9S0CzXCH3mXnI0j+JtvfdTK3i4n8lHWk/
 81db6haf6JGwmL8nW7W3nm3nvTvTf4O7CbeZxpl/rEndF5JfKSsnRFnc4+N8Lqa477dM3u+/
 kfFKLMUZiYZazEXFiQBfsOB60gIAAA==
X-CMS-MailID: 20190612140413eucas1p1b72f9da419ac23b227fd7316b1bf3de6
X-Msg-Generator: CA
X-RootMTR: 20190608114101epcas3p4127647ce1c8224b4d777585bfa8e31d1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190608114101epcas3p4127647ce1c8224b4d777585bfa8e31d1
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-3-wsa+renesas@sang-engineering.com>
 <CGME20190608114101epcas3p4127647ce1c8224b4d777585bfa8e31d1@epcas3p4.samsung.com>
 <20190608114036.GA4786@pendragon.ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560348255;
 bh=sPdSdE4qsvSbaMak0sr8YcOjHPVPjBPKJgIQWVV5LTI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ByooAjIRm3rFFDei4YHPfD5wqM5phX9lu433HkJZ2iWchvC0FAMpFlTzoUjo6rqsw
 Z7xDIEHLd7B7gMqR5Fo9gj5r99HF6Db7PC7VTscsF78heCSVng3Xx1MlCJbhXqLmEI
 TdmENNzgTSuCPCW68YOhwQmce+UIofuJ+uKr9gMM=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDguMDYuMjAxOSAxMzo0MCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBXb2xmcmFt
LAo+Cj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4KPiBPbiBTYXQsIEp1biAwOCwgMjAxOSBh
dCAxMjo1NTo0MVBNICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6Cj4+IFdlIGhhdmUgYSBkZWRp
Y2F0ZWQgcG9pbnRlciBmb3IgdGhhdCwgc28gdXNlIGl0LiBNdWNoIGVhc2llciB0byByZWFkIGFu
ZAo+PiBsZXNzIGNvbXB1dGF0aW9uIGludm9sdmVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXb2xm
cmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPgo+IFJldmlld2VkLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgoK
UXVldWVkIHRvIGRybS1taXNjLW5leHQuCgoKTGF1cmVudCwgZm9yIHVua25vd24gcmVhc29uIHBh
dGNod29yayBkb2VzIG5vdCBjb2xsZWN0IHlvdXJzIHRhZ3MsIGFuZAppdCBpcyBub3QgdGhlIDFz
dCB0aW1lLCBhZGRlZCBtYW51YWxseS4KCgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5o
YWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCgoKPgo+PiAtLS0KPj4KPj4g
UGxlYXNlIGFwcGx5IHRvIHlvdXIgc3Vic3lzdGVtIHRyZWUuCj4+Cj4+ICBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3NpaTkyMzQuYyB8IDQgKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2lpOTIzNC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMKPj4g
aW5kZXggYjM2YmJhZmIwZTQzLi4yNWQ0YWQ4YzdhZDYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2lpOTIzNC5jCj4+IEBAIC04MTUsNyArODE1LDcgQEAgc3RhdGljIGlycXJldHVybl90IHNpaTky
MzRfaXJxX3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQo+PiAgc3RhdGljIGludCBzaWk5MjM0
X2luaXRfcmVzb3VyY2VzKHN0cnVjdCBzaWk5MjM0ICpjdHgsCj4+ICAJCQkJICBzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50KQo+PiAgewo+PiAtCXN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcHRlciA9
IHRvX2kyY19hZGFwdGVyKGNsaWVudC0+ZGV2LnBhcmVudCk7Cj4+ICsJc3RydWN0IGkyY19hZGFw
dGVyICphZGFwdGVyID0gY2xpZW50LT5hZGFwdGVyOwo+PiAgCWludCByZXQ7Cj4+ICAKPj4gIAlp
ZiAoIWN0eC0+ZGV2LT5vZl9ub2RlKSB7Cj4+IEBAIC04OTcsNyArODk3LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIHNpaTkyMzRfYnJpZGdlX2Z1bmNzID0gewo+PiAg
c3RhdGljIGludCBzaWk5MjM0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4+ICAJ
CQkgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQo+PiAgewo+PiAtCXN0cnVjdCBpMmNf
YWRhcHRlciAqYWRhcHRlciA9IHRvX2kyY19hZGFwdGVyKGNsaWVudC0+ZGV2LnBhcmVudCk7Cj4+
ICsJc3RydWN0IGkyY19hZGFwdGVyICphZGFwdGVyID0gY2xpZW50LT5hZGFwdGVyOwo+PiAgCXN0
cnVjdCBzaWk5MjM0ICpjdHg7Cj4+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2
Owo+PiAgCWludCByZXQ7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
