Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469B26E150
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930876E58E;
	Fri, 19 Jul 2019 07:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADE36E58E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 07:01:30 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190719070128euoutp0200a245efaca1e19987a9610e26c4c39e~yvN93BC8d1450714507euoutp02n
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 07:01:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190719070128euoutp0200a245efaca1e19987a9610e26c4c39e~yvN93BC8d1450714507euoutp02n
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190719070127eucas1p25e71f261915ee58408c593f11dd32e73~yvN9P-tld0600706007eucas1p2g;
 Fri, 19 Jul 2019 07:01:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 04.BA.04325.7CA613D5; Fri, 19
 Jul 2019 08:01:27 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190719070126eucas1p19c19ef5d7ae3c150a7cdfb10d61a52fa~yvN8Sv3tL2823728237eucas1p1s;
 Fri, 19 Jul 2019 07:01:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190719070126eusmtrp24d941d8f70f2159b726e6a1a718c7a1c~yvN8I1Pp42079520795eusmtrp2e;
 Fri, 19 Jul 2019 07:01:26 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-ff-5d316ac7d2ae
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 65.6E.04140.6CA613D5; Fri, 19
 Jul 2019 08:01:26 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190719070126eusmtip244381f93620acd3ecb19e93c4d50f9e4~yvN7pLyYZ1961419614eusmtip2L;
 Fri, 19 Jul 2019 07:01:26 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: fix RC_CORE dependency
To: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <763005f0-fc66-51bc-fcfe-3ae4942a9c07@samsung.com>
Date: Fri, 19 Jul 2019 09:01:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190718134240.2265724-1-arnd@arndb.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKKsWRmVeSWpSXmKPExsWy7djPc7rHswxjDc7/V7HoPXeSyeLvpGPs
 Fv+3TWS2OLzoBaPFla/v2Sw6Jy5ht7i8aw6bxYt7b5ks7k4+wujA6fH71yRGj73fFrB47Jx1
 l91jdsdMVo8pnRIe2789YPW4332cyeP4rlvsHp83yQVwRnHZpKTmZJalFunbJXBlLHniXLCZ
 t+LF/hVMDYzN3F2MnBwSAiYSF+euZ+ti5OIQEljBKNF95yAjhPOFUeLDqs1MEM5nRol1P1cB
 ORxgLe9b7CDiyxkljlzqgyp6yygx+XwzE8hcYQFziV2zH7GCNIgIpEq0fQsAqWEWaGCSWLj+
 ACtIDZuApsTfzTfZQGxeATuJX/+Ps4DYLAKqEi1XbzCC2KICYRI/F3RC1QhKnJz5BKyGU8BU
 4u3lJWC7mAXkJba/ncMMYYtL3Hoynwnit0fsEh/6oGwXia6zt6BsYYlXx7ewQ9gyEv93wtTX
 S9xf0cIMcqiEQAejxNYNO5khEtYSh49fBHuGGejo9bv0IcKOEmfvrmGBBAqfxI23ghAn8ElM
 2jadGSLMK9HRJgRRrShx/+xWqIHiEksvfGWbwKg0C8ljs5A8MwvJM7MQ9i5gZFnFKJ5aWpyb
 nlpsnJdarlecmFtcmpeul5yfu4kRmLhO/zv+dQfjvj9JhxgFOBiVeHgDcg1ihVgTy4orcw8x
 SnAwK4nw3n6pHyvEm5JYWZValB9fVJqTWnyIUZqDRUmct5rhQbSQQHpiSWp2ampBahFMlomD
 U6qB8cjayywv7BfYxGV5H7mw4r+f1lvhbDGvBd/7G6fsVvLe+Hfp2/iyx+ocOzWnp1a3vOxd
 UmrfeqjL+fy7A2Hro+N/JKaYMVx1Smd+PFPOp12h1vnr9W8mBld2ml9KCA6avHpDi4S1WdmW
 U4HqP93vR59yMDnKrcYovMu4OPhUoXHE+5WNC9fwKbEUZyQaajEXFScCAEeClW5YAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsVy+t/xe7rHsgxjDeZ90rToPXeSyeLvpGPs
 Fv+3TWS2OLzoBaPFla/v2Sw6Jy5ht7i8aw6bxYt7b5ks7k4+wujA6fH71yRGj73fFrB47Jx1
 l91jdsdMVo8pnRIe2789YPW4332cyeP4rlvsHp83yQVwRunZFOWXlqQqZOQXl9gqRRtaGOkZ
 WlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlLHniXLCZt+LF/hVMDYzN3F2MHBwSAiYS
 71vsuhi5OIQEljJK7PzdyNbFyAkUF5fYPf8tM4QtLPHnWhdYXEjgNaPEj1WmILawgLnErtmP
 WEFsEYFUia0X3zKCDGIWaGKSeP3hMQvE1A5Giftrt4FVsQloSvzdfBNsEq+AncSv/8dZQGwW
 AVWJlqs3GEEuEhUIkzh6Ig+iRFDi5MwnYCWcAqYSby8vYQKxmQXUJf7Mu8QMYctLbH87B8oW
 l7j1ZD7TBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECY3Xb
 sZ9bdjB2vQs+xCjAwajEwxuQaxArxJpYVlyZe4hRgoNZSYT39kv9WCHelMTKqtSi/Pii0pzU
 4kOMpkC/TWSWEk3OB6aRvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwc
 nFINjBM0j6lrNwdumGDqzxBcI+LGFNIfFzD925NGaRdhgyXec/7GRl66v7vg2JMVWux3jybf
 njJx4gJ1reSdBq6Pf3BNrDK9M8Hst/bDF79mpdns2P/U78JjhnwOyXuNb3+f2ew9s+Jvmscm
 /w+XdGMiBLSTVrEn35txL/C2hnZpVE/+P/ump2em3ldiKc5INNRiLipOBAA3M2+m6wIAAA==
X-CMS-MailID: 20190719070126eucas1p19c19ef5d7ae3c150a7cdfb10d61a52fa
X-Msg-Generator: CA
X-RootMTR: 20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022
References: <CGME20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022@epcas3p3.samsung.com>
 <20190718134240.2265724-1-arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563519688;
 bh=RuexnrsbXl/Hd9rIxzNwnxH6Jz4Zi31yO73QxVhe+aM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=DlQ8pR/TGnU/R3O3yHo8H/Vj8Wp4r2bzbntSd2ztZzfcJZlx2E0b/ay9YYVCdiQgV
 QRXmOrV941ewmdut6Zvfpvqsv5RodSHFY5AvWCj4DRcoKIcSj7oncHxMB2IX7aTRJ4
 51g/NEu4Df8k8pGirNedAnrSmme+yVs7EjgTnK70=
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
Cc: =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTguMDcuMjAxOSAxNTo0MiwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBVc2luZyAnaW1wbHkn
IGNhdXNlcyBhIG5ldyBwcm9ibGVtLCBhcyBpdCBhbGxvd3MgdGhlIGNhc2Ugb2YKPiBDT05GSUdf
SU5QVVQ9bSB3aXRoIFJDX0NPUkU9eSwgd2hpY2ggZmFpbHMgdG8gbGluazoKCgpJIGhhdmUgcmV2
aWV3ZWQgZGVwZW5kZW5jaWVzIGFuZCBJIHdvbmRlciBob3cgc3VjaCBjb25maWd1cmF0aW9uIGlz
CnBvc3NpYmxlIGF0IGFsbC4KClJDX0NPUkUgZGVwZW5kcyBvbiBJTlBVVCAoYXQgbGVhc3Qgb24g
dG9kYXkncyBuZXh0IGJyYW5jaCkgc28gaWYgSU5QVVQ9bQp0aGVuIFJDX0NPUkUgc2hvdWxkIGJl
IGVpdGhlciBuIGVpdGhlciBtLCBhbSBJIHJpZ2h0PwoKQXJuZCwgYXJlIHRoZXJlIHVua25vd24g
dG8gbWUgY2hhbmdlcyBpbiBSQy9JTlBVVCBkZXBlbmRlbmNpZXM/CgoKUmVnYXJkcwoKQW5kcnpl
agoKCj4KPiBkcml2ZXJzL21lZGlhL3JjL3JjLW1haW4ubzogSW4gZnVuY3Rpb24gYGlyX2RvX2tl
eXVwJzoKPiByYy1tYWluLmM6KC50ZXh0KzB4MmI0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBg
aW5wdXRfZXZlbnQnCj4gZHJpdmVycy9tZWRpYS9yYy9yYy1tYWluLm86IEluIGZ1bmN0aW9uIGBy
Y19yZXBlYXQnOgo+IHJjLW1haW4uYzooLnRleHQrMHgzNTApOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBpbnB1dF9ldmVudCcKPiBkcml2ZXJzL21lZGlhL3JjL3JjLW1haW4ubzogSW4gZnVuY3Rp
b24gYHJjX2FsbG9jYXRlX2RldmljZSc6Cj4gcmMtbWFpbi5jOigudGV4dCsweDkwYyk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYGlucHV0X2FsbG9jYXRlX2RldmljZScKPgo+IEFkZCBhICdkZXBl
bmRzIG9uJyB0aGF0IGFsbG93cyBidWlsZGluZyBib3RoIHdpdGggYW5kIHdpdGhvdXQKPiBDT05G
SUdfUkNfQ09SRSwgYnV0IGRpc2FsbG93cyBjb21iaW5hdGlvbnMgdGhhdCBkb24ndCBsaW5rLgo+
Cj4gRml4ZXM6IDUwMjNjZjMyMjEwZCAoImRybS9icmlkZ2U6IG1ha2UgcmVtb3RlIGNvbnRyb2wg
b3B0aW9uYWwiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9L
Y29uZmlnCj4gaW5kZXggZjY0YzkxZGVmZGMzLi43MGE4ZWQyNTA1YWEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9LY29uZmlnCj4gQEAgLTg1LDggKzg1LDggQEAgY29uZmlnIERSTV9TSUxfU0lJODYyMAo+
ICAJdHJpc3RhdGUgIlNpbGljb24gSW1hZ2UgU0lJODYyMCBIRE1JL01ITCBicmlkZ2UiCj4gIAlk
ZXBlbmRzIG9uIE9GCj4gIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiArCWRlcGVuZHMgb24gUkNf
Q09SRSB8fCAhUkNfQ09SRQo+ICAJaW1wbHkgRVhUQ09OCj4gLQlpbXBseSBSQ19DT1JFCj4gIAlo
ZWxwCj4gIAkgIFNpbGljb24gSW1hZ2UgU0lJODYyMCBIRE1JL01ITCBicmlkZ2UgY2hpcCBkcml2
ZXIuCj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
