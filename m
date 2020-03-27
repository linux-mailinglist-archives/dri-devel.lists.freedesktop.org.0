Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C32619539D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 10:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896FC6E9DF;
	Fri, 27 Mar 2020 09:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072756E9DF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 09:11:01 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200327091059euoutp01469f6ac1e94d15c55cee32ed41870a4f~AHi-JsE4o3256132561euoutp017
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 09:10:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200327091059euoutp01469f6ac1e94d15c55cee32ed41870a4f~AHi-JsE4o3256132561euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585300259;
 bh=P8b49fKTqxvHEVfznbeY2BS6Zozf9WEO68ZcgbVoi10=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=CewQVAlLbkT8UxdB6KbTdRWM1I4wNdmqFPQ/X2f4BK97phHpjHO7+kZDMHY2y2Hpl
 kMhodcsJtxAe23lsSJLlwaUaFaMsrKayseaw1PyDpJJPsOatgLomrun4R6gWPE5UBK
 SCfrQ8Y5eMpvPBT6WGiHFrAmrycrAlpEKUGUsIx4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200327091059eucas1p1d251c3c32a815723613ca8aa4b5e161e~AHi_2u-Vz0441404414eucas1p1l;
 Fri, 27 Mar 2020 09:10:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D6.02.60698.223CD7E5; Fri, 27
 Mar 2020 09:10:59 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200327091058eucas1p27ae8a0068a01367fc95cdb1d73658d99~AHi_brVBY3148631486eucas1p2-;
 Fri, 27 Mar 2020 09:10:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200327091058eusmtrp18a994ac65d31853e3d42cbde6fa17287~AHi_bDujz2611026110eusmtrp1f;
 Fri, 27 Mar 2020 09:10:58 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-98-5e7dc322356a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C8.C1.07950.223CD7E5; Fri, 27
 Mar 2020 09:10:58 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200327091058eusmtip221cf32f8dee496a56d948f968a445d78~AHi98kbp-1115711157eusmtip2L;
 Fri, 27 Mar 2020 09:10:58 +0000 (GMT)
Subject: Re: [v4,1/3] drm/prime: use dma length macro when mapping sg
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Shane
 Francis <bigbeeshane@gmail.com>, dri-devel@lists.freedesktop.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <cd773011-969b-28df-7488-9fddae420d81@samsung.com>
Date: Fri, 27 Mar 2020 10:10:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <82df6735-1cf0-e31f-29cc-f7d07bdaf346@amd.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7djP87rKh2vjDI7fYbLoPXeSyWLand2s
 Fuv+3WSxaNzZx2Tx9j6Qe+XrezaLy7vmsDmwe7Re+svmsXPWXXaP7d8esHrc7z7O5PF5k1wA
 axSXTUpqTmZZapG+XQJXxsfvB1kLlotUTD+8hrmBcb1AFyMnh4SAicSE5//Zuhi5OIQEVjBK
 XFqyixHC+cIocffIN1YI5zOjxMepG5hhWjY8nQSVWM4o8fjJXSjnPaPEkrvLGUGqhAVcJXY2
 tYLNEhHoZJToW7+ZBSTBLFAmcen5HDYQm03AUKLrbReYzStgJ/Gr8zJYDYuAqsTtf81gg0QF
 YiQuHu5nhagRlDg58wlYDaeAtcS3jWvYIGbKSzRvnc0MYYtL3HoynwlksYTAOnaJnvmPWSHu
 dpGYcesL1A/CEq+Ob2GHsGUkTk/uYYFoaGaUeHhuLTuE08MocblpBiNElbXEnXO/gNZxAK3Q
 lFi/Sx8i7Cjx7MpJZpCwhACfxI23ghBH8ElM2jYdKswr0dEmBFGtJjHr+Dq4tQcvXGKewKg0
 C8lrs5C8MwvJO7MQ9i5gZFnFKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmIhO/zv+dQfj
 vj9JhxgFOBiVeHgb2mrihFgTy4orcw8xSnAwK4nwPo0ECvGmJFZWpRblxxeV5qQWH2KU5mBR
 Euc1XvQyVkggPbEkNTs1tSC1CCbLxMEp1cDo4nXukXCn45+E5UW/db+f3/6U5dDigLLQIwuq
 U3N2eE+6+3MN58kkhoIn5t56sr2a8wQT3mSGuNr/eXLd/e3WymPf1hfcn7W2J/1Dod+po8/7
 LzlO6f93yeFxwk/VNo8LnpZXuBPPvb8kwLDgpXyI7EXHv0ybTlR90m6c4jFXO4UzcPHXc9z3
 lViKMxINtZiLihMBYpN1DEADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xe7pKh2vjDC6dUbXoPXeSyWLand2s
 Fuv+3WSxaNzZx2Tx9j6Qe+XrezaLy7vmsDmwe7Re+svmsXPWXXaP7d8esHrc7z7O5PF5k1wA
 a5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexsfv
 B1kLlotUTD+8hrmBcb1AFyMnh4SAicSGp5NYQWwhgaWMEjum5kLEZSROTmtghbCFJf5c62Lr
 YuQCqnnLKHFj60sWkISwgKvEzqZWRpCEiEAno8SenxeZQBLMAmUSuy40M0J0fGGU+Hz8ISNI
 gk3AUKLrLcgoTg5eATuJX52XwSaxCKhK3P7XDFYjKhAj8XNPFwtEjaDEyZlPwGxOAWuJbxvX
 sEEsMJOYt/khM4QtL9G8dTaULS5x68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucW
 G+kVJ+YWl+al6yXn525iBMbdtmM/t+xg7HoXfIhRgINRiYdXo6UmTog1say4MvcQowQHs5II
 79NIoBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnA1NCXkm8oamhuYWlobmxubGZhZI4b4fA
 wRghgfTEktTs1NSC1CKYPiYOTqkGxolLGue9uW0rnRubqqheH3vq8v7vX0Ij1/W48K8tqdql
 Z1IaETcl9UG8phj3xPuaUofXy91hCuETXai0YZHXusTn3I9zP9q67XK6uLS4yL7E7c9HIeNd
 t61vXFk8ITZuD+ux5x3f9fy22JhcdW50DvGsF44PEJKZsWQp1yvpGV7Jsy42ud72VGIpzkg0
 1GIuKk4EAOOqLn/RAgAA
X-CMS-MailID: 20200327091058eucas1p27ae8a0068a01367fc95cdb1d73658d99
X-Msg-Generator: CA
X-RootMTR: 20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb
References: <20200325090741.21957-2-bigbeeshane@gmail.com>
 <CGME20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb@eucas1p2.samsung.com>
 <4aef60ff-d9e4-d3d0-1a28-8c2dc3b94271@samsung.com>
 <82df6735-1cf0-e31f-29cc-f7d07bdaf346@amd.com>
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
Cc: airlied@linux.ie, alexander.deucher@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx-request@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKT24gMjAyMC0wMy0yNyAwOToxMSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToKPiBBbSAyNy4wMy4yMCB1bSAwODo1NCBzY2hyaWViIE1hcmVrIFN6eXByb3dza2k6Cj4+IE9u
IDIwMjAtMDMtMjUgMTA6MDcsIFNoYW5lIEZyYW5jaXMgd3JvdGU6Cj4+PiBBcyBkbWFfbWFwX3Nn
IGNhbiByZW9yZ2FuaXplIHNjYXR0ZXItZ2F0aGVyIGxpc3RzIGluIGEKPj4+IHdheSB0aGF0IGNh
biBjYXVzZSBzb21lIGxhdGVyIHNlZ21lbnRzIHRvIGJlIGVtcHR5IHdlIHNob3VsZAo+Pj4gYWx3
YXlzIHVzZSB0aGUgc2dfZG1hX2xlbiBtYWNybyB0byBmZXRjaCB0aGUgYWN0dWFsIGxlbmd0aC4K
Pj4+Cj4+PiBUaGlzIGNvdWxkIG5vdyBiZSAwIGFuZCBub3QgbmVlZCB0byBiZSBtYXBwZWQgdG8g
YSBwYWdlIG9yCj4+PiBhZGRyZXNzIGFycmF5Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU2hhbmUg
RnJhbmNpcyA8YmlnYmVlc2hhbmVAZ21haWwuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwg
Si4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPgo+PiBUaGlzIHBhdGNoIGxhbmRlZCBp
biBsaW51eC1uZXh0IDIwMjAwMzI2IGFuZCBpdCBjYXVzZXMgYSBrZXJuZWwgcGFuaWMgb24KPj4g
dmFyaW91cyBFeHlub3MgU29DIGJhc2VkIGJvYXJkcy4KPj4+IC0tLQo+Pj4gwqDCoCBkcml2ZXJz
L2dwdS9kcm0vZHJtX3ByaW1lLmMgfCAyICstCj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+IGluZGV4
IDg2ZDliMGU0NWM4Yy4uMWRlMmNkZTIyNzdjIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmltZS5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+
IEBAIC05NjcsNyArOTY3LDcgQEAgaW50IGRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlz
KHN0cnVjdCAKPj4+IHNnX3RhYmxlICpzZ3QsIHN0cnVjdCBwYWdlICoqcGFnZXMsCj4+PiDCoMKg
IMKgwqDCoMKgwqDCoCBpbmRleCA9IDA7Cj4+PiDCoMKgwqDCoMKgwqAgZm9yX2VhY2hfc2coc2d0
LT5zZ2wsIHNnLCBzZ3QtPm5lbnRzLCBjb3VudCkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgIGxlbiA9
IHNnLT5sZW5ndGg7Cj4+PiArwqDCoMKgwqDCoMKgwqAgbGVuID0gc2dfZG1hX2xlbihzZyk7Cj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdlID0gc2dfcGFnZShzZyk7Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBhZGRyID0gc2dfZG1hX2FkZHJlc3Moc2cpOwo+PiBTb3JyeSwgYnV0IHRoaXMg
Y29kZSBpcyB3cm9uZyA6KAo+Cj4gV2VsbCBpdCBpcyBhdCBsZWFzdCBiZXR0ZXIgdGhhbiBiZWZv
cmUgYmVjYXVzZSBpdCBtYWtlcyBtb3N0IGRyaXZlcnMgCj4gd29yayBjb3JyZWN0bHkgYWdhaW4u
CgpXZWxsLCBJJ20gbm90IHN1cmUgdGhhdCBhIGhhbGYtYnJva2VuIGZpeCBzaG91bGQgYmUgY29u
c2lkZXJlZCBhcyBhIGZpeCA7KQoKQW55d2F5LCBJIGp1c3QgZ290IHRoZSBjb21tZW50IGZyb20g
U2hhbmUsIHRoYXQgbXkgcGF0Y2ggaXMgZml4aW5nIHRoZSAKaXNzdWVzIHdpdGggYW1kZ3B1IGFu
ZCByYWRlb24sIHdoaWxlIHN0aWxsIHdvcmtpbmcgZmluZSBmb3IgZXh5bm9zLCBzbyAKaXQgaXMg
aW5kZWVkIGEgcHJvcGVyIGZpeC4KCj4gU2VlIHdlIG9ubHkgZmlsbCB0aGUgcGFnZXMgYXJyYXkg
YmVjYXVzZSBzb21lIGRyaXZlcnMgKGxpa2UgRXh5bm9zKSAKPiBhcmUgc3RpbGwgYnVnZ3kgYW5k
IHJlcXVpcmUgdGhpcy4KCkV4eW5vcyBkcml2ZXIgdXNlIHRoaXMgcGFnZXMgYXJyYXkgaW50ZXJu
YWxseS4KCj4KPiBBY2Nlc3NpbmcgdGhlIHBhZ2VzIG9mIGFuIERNQS1idWYgaW1wb3J0ZWQgc2df
dGFibGUgaXMgaWxsZWdhbCBhbmQgCj4gc2hvdWxkIGJlIGZpeGVkIGluIHRoZSBkcml2ZXJzLgoK
VHJ1ZSwgYnV0IGluIG1lYW50aW1lIHdlIHNob3VsZCBhdm9pZCBicmVha2luZyBzdHVmZiB3aGlj
aCB3b3JrZWQgZmluZSAKZm9yIGFnZXMuCgo+Cj4+IFtTTklQXQo+Pgo+PiBJIHdpbGwgc2VuZCBh
IHBhdGNoIGluIGEgZmV3IG1pbnV0ZXMgd2l0aCB0aGUgYWJvdmUgZml4ZWQgY29kZS4KPgo+IFRo
YXQgaXMgY2VydGFpbmx5IGEgZ29vZCBpZGVhIGZvciBub3csIGJ1dCBjb3VsZCB3ZSBhbHNvIHB1
dCBvbiAKPiBzb21lYm9kaWVzIHRvZG8gbGlzdCBhbiBpdGVtIHRvIGZpeCBFeHlub3M/CgpZZXMs
IEkgY2FuIHRha2UgYSBsb29rIGludG8gcmVtb3ZpbmcgdGhlIHVzZSBvZiB0aGUgaW50ZXJuYWwg
cGFnZXMgCmFycmF5LiBJdCBpcyB1c2VkIG1haW5seSBmb3IgaW1wbGVtZW50aW5nIHZtYXAgZm9y
IGZiZGV2IGVtdWxhdGlvbiwgYnV0IAp0aGlzIGNhbiBiZSBoYW5kbGVkIGluIGEgZGlmZmVyZW50
IHdheS4KCkJlc3QgcmVnYXJkcwotLSAKTWFyZWsgU3p5cHJvd3NraSwgUGhEClNhbXN1bmcgUiZE
IEluc3RpdHV0ZSBQb2xhbmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
