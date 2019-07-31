Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4E7EF0A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E944D6ED53;
	Fri,  2 Aug 2019 08:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB3889B22
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:01:49 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190731130148euoutp010b2a89827a22b9f68837a3f396657753~2f3-1tDAq1133711337euoutp01J
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:01:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190731130148euoutp010b2a89827a22b9f68837a3f396657753~2f3-1tDAq1133711337euoutp01J
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190731130147eucas1p2622981052b71f0c9b305a38c448eab62~2f3-WA7jT2160421604eucas1p2P;
 Wed, 31 Jul 2019 13:01:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 9C.F1.04298.B31914D5; Wed, 31
 Jul 2019 14:01:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190731130146eucas1p13647e6bd5004b9b858f82a95d9bf2928~2f3_kUhyz3209332093eucas1p1Y;
 Wed, 31 Jul 2019 13:01:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190731130146eusmtrp193ab339d7f7c267bd73035f03355d67a~2f3_WEMb62537425374eusmtrp1f;
 Wed, 31 Jul 2019 13:01:46 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-2a-5d41913bfd1e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 01.D3.04140.A31914D5; Wed, 31
 Jul 2019 14:01:46 +0100 (BST)
Received: from AMDC3555 (unknown [106.120.51.67]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20190731130145eusmtip2d16e9993c297dd63cdd5a647debb0c70~2f39r4f1i2937029370eusmtip2_;
 Wed, 31 Jul 2019 13:01:45 +0000 (GMT)
Message-ID: <a1fc0e2b5ef2d131f4e896c9c0aa7621bf4b79e2.camel@partner.samsung.com>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 31 Jul 2019 15:01:44 +0200
In-Reply-To: <20190724183639.GA14346@kozik-lap>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUgUYRju2zl23Br7XK19u3UjpEi3oB8DZiVELvWjC/qRme7moLVe7KSd
 lKWEeWXZklnhklqiqDlmma2Vx7ap1KaZBZorHmmFFHmEhFrTGPXveZ/jPeBlCHUjtZg5HHuU
 N8caorW0inzwfNLpF3A5KHTd1TFPrjK3guLejQ1RXH7TK4rrGP9Kc9fqRJq74somOafznpIT
 +zsp7k3tTZobzWxCXK7ziYIra/qg5LrOFdNcbs4neou7Xiy5SOu7O2203pXuUOirCs/qs+6X
 IP2ouHwXvV+1MYKPPpzIm3WbwlVR6cN2Kr7b63il6zaVhGw4DbkxgDfA1IsBRRpSMWpcjGCs
 OB3JxRiCh809s8oogi/Dk+TfiL06lZSFuwhKxWZaLj4iqPpYhCQXi3dBakY5IWFPbARrXxsl
 YRoHw/RQxx/shVfDu6kflBQm8DMC6ussyjTEMCReBR1PgiWPG9aBWGRD8uS1MNKSRUoWFnvA
 VI2nRBN4BSRX3yCkNoB7lOAasdCyfyu8LbhLydgTPjvuK2W8FFpzMmavEWDwkYuSw0kIxDtN
 hCwEQKNDWpr5PWE1VNTqZDoIRrLshEQDdof3Ix7yDu5w5cG1WZqF1AtqGa4B688QOQhwvrRz
 trceUvqGlNnIJ+/fLXn/3ZL3b6oVESVIwycIMZG8sD6WP+YvGGKEhNhI/0NxMSL6/Vqt047v
 NWi83diAMIO089gXF4NC1ZQhUTgR04CAIbRebIFmc6iajTCcOMmb48LMCdG80ICWMKRWw56a
 0xuixpGGo7yJ5+N5819VwbgtTkLXtx14XlZ63Oa9aMm37hl2AW35Frax91LAy/p229Jc35K+
 icQ9voUZD99PO4N4FLhjrylT05U8MT99ABUcHN7/+Gnh9rie8IVzy8+0rXwd1jY4zEWk7M58
 1r8z0I5MG1oa9+XDU2PNsWX3dKV+lhar9y2j7vRMRGVOlUlxJF/0+awlhSjD+jWEWTD8AnSD
 goRWAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xe7pWEx1jDdaukrDYOGM9q8X1L89Z
 LeYfOcdqceXrezaL6Xs3sVlMuj+BxeL8+Q3sFpseX2O1uLxrDpvF594jjBYzzu9jslh75C67
 xe3GFWwWMya/ZHPg89i0qpPN4861PWwe97uPM3lsXlLv0bdlFaPH501yAWxRejZF+aUlqQoZ
 +cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehndL46yFtwRqdh4fxFr
 A+MegS5GTg4JAROJo1s7WLoYuTiEBJYySnx88ZINIiEh8XH9DVYIW1jiz7UuNoiiJ4wSV+5/
 AkvwCgRIdPSsYwaxhQWSJBY8uggWZxNwl/j3/AqYLSKgKXH973dWkGZmgUPMEusOdAM5HBws
 AqoSV/a5g9RwCuhLbFq6hxFiwTdGid+dJxlBEsxAza3bf7NDXKEj8fZUHwtIL6+AoMTfHcIQ
 JfISzVtnM09gFJyFpGMWQtUsJFULGJlXMYqklhbnpucWG+kVJ+YWl+al6yXn525iBEbktmM/
 t+xg7HoXfIhRgINRiYf3RKdjrBBrYllxZe4hRgkOZiUR3sXi9rFCvCmJlVWpRfnxRaU5qcWH
 GE2B3pnILCWanA9MFnkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODil
 GhgZ+s6e2hzFfYP7duW0NRvsttXPfGYa/H2fRWzHkyDeCVtNzlRLyguoJjpscFupqJb38zpf
 ZMnyDR8XihuvLt5xab/EX9VNvab63bs5mLbfSvNKdvGbzVc3XULbl1Xy3u59fl+Zns7hnMHb
 GHSk4OWXw/UFKcsPBtkH18ilpursPRnq/Psjv78SS3FGoqEWc1FxIgB2NBHi3gIAAA==
X-CMS-MailID: 20190731130146eucas1p13647e6bd5004b9b858f82a95d9bf2928
X-Msg-Generator: CA
X-RootMTR: 20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
 <20190723122016.30279-10-a.swigon@partner.samsung.com>
 <20190724183639.GA14346@kozik-lap>
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1564578108;
 bh=uIZjK2mDYGGIQoh1L8WzyXdHyo8GssTHvhq/RxYs6Uk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=uBXqMhXsZ5RMPNSzD+hvziPd3ueErlFr57XLeoL3zG8MSppyQ8zSXwgVodf+TBTRG
 Qfrk7r6gX7cCPBpcCE+edtRgvETM0XSKCH2sU7uluSybyR+JjXU9Ws+n8BQTbKkJU6
 4Ql2dATHWlcMHhGMnSsaXnQhIWcViBEPDT1iVhrM=
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org,
 =?UTF-8?Q?Bart=C5=82omiej_?= =?UTF-8?Q?=C5=BBo=C5=82nierkiewicz?=
 <b.zolnierkie@samsung.com>, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA3LTI0IGF0IDIwOjM2ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDAyOjIwOjE0UE0gKzAyMDAsIEFydHVyIMWa
d2lnb8WEIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGRzIGludGVyY29ubmVjdCBmdW5jdGlvbmFs
aXR5IHRvIHRoZSBleHlub3MtYnVzIGRldmZyZXEKPiA+IGRyaXZlci4KPiA+IAo+ID4gVGhlIFNv
QyB0b3BvbG9neSBpcyBhIGdyYXBoIChvciwgbW9yZSBzcGVjaWZpY2FsbHksIGEgdHJlZSkgYW5k
IG1vc3Qgb2YgaXRzCj4gPiBlZGdlcyBhcmUgdGFrZW4gZnJvbSB0aGUgZGV2ZnJlcSBwYXJlbnQt
Y2hpbGQgaGllcmFyY2h5IChjZi4KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kZXZmcmVxL2V4eW5vcy1idXMudHh0KS4gVGhlIHByZXZpb3VzCj4gPiBwYXRjaCBhZGRzIG1p
c3NpbmcgZWRnZXMgdG8gdGhlIERUICh1bmRlciB0aGUgbmFtZSAncGFyZW50JykuIER1ZSB0bwo+
IAo+IERvIG5vdCByZWZlciB0byBEVCBwYXRjaGVzLiBUaGV5IHdpbGwgY29tZSB0aHJvdWdoIGRp
ZmZlcmVudCB0cmVlIHNvCj4gInByZXZpb3VzIiB3aWxsIG5vdCBiZSBjb3JyZWN0IGFueW1vcmUu
IFlvdSBtZW50aW9uZWQgZGVwZW5kZW5jaWVzIGluCj4gY292ZXIgbGV0dGVyIHNvIGl0IGlzIHN1
ZmZpY2llbnQuCgpPSy4KIAo+ID4gIC8qCj4gPiBAQCAtNjEsNiArNjksMTMgQEAgZXh5bm9zX2J1
c19vcHNfZWRldihlbmFibGVfZWRldik7Cj4gPiAgZXh5bm9zX2J1c19vcHNfZWRldihkaXNhYmxl
X2VkZXYpOwo+ID4gIGV4eW5vc19idXNfb3BzX2VkZXYoc2V0X2V2ZW50KTsKPiA+ICAKPiA+ICtz
dGF0aWMgaW50IGV4eW5vc19idXNfbmV4dF9pZCh2b2lkKQo+ID4gK3sKPiA+ICsJc3RhdGljIGlu
dCBleHlub3NfYnVzX25vZGVfaWQ7Cj4gPiArCj4gPiArCXJldHVybiBleHlub3NfYnVzX25vZGVf
aWQrKzsKPiAKPiBUaGlzIGRvZXMgbm90IGxvb2sgcm9idXN0LiBVc2UgSURSIGZvciBJRHMuIAoK
T0suCgo+ID4gK3N0YXRpYyBpbnQgZXh5bm9zX2J1c19pY2NfY29ubmVjdChzdHJ1Y3QgZXh5bm9z
X2J1cyAqYnVzKQo+ID4gK3sKPiA+ICsJc3RydWN0IGRldmljZV9ub2RlICpucCA9IGJ1cy0+ZGV2
LT5vZl9ub2RlOwo+ID4gKwlzdHJ1Y3QgZGV2ZnJlcSAqcGFyZW50X2RldmZyZXE7Cj4gPiArCXN0
cnVjdCBpY2Nfbm9kZSAqcGFyZW50X25vZGUgPSBOVUxMOwo+ID4gKwlzdHJ1Y3Qgb2ZfcGhhbmRs
ZV9hcmdzIGFyZ3M7Cj4gPiArCWludCByZXQgPSAwOwo+ID4gKwo+ID4gKwlwYXJlbnRfZGV2ZnJl
cSA9IGRldmZyZXFfZ2V0X2RldmZyZXFfYnlfcGhhbmRsZShidXMtPmRldiwgMCk7Cj4gPiArCWlm
ICghSVNfRVJSKHBhcmVudF9kZXZmcmVxKSkgewo+ID4gKwkJc3RydWN0IGV4eW5vc19idXMgKnBh
cmVudF9idXM7Cj4gCj4gV2hhdCBpZiBzb21lb25lIHVuYmluZHMgdGhpcyBwYXJlbnQgZGV2ZnJl
cT8gSSBndWVzcyBldmVyeXRoaW5nIGluCj4gZGV2ZnJlcSBzdGFydHMgZXhwbG9kaW5nLi4uIGhv
d2V2ZXIgaXQncyBub3QgdGhlIHByb2JsZW0gb2YgdGhpcyBwYXRjaC4KPiAKPiBEbyB5b3UgYWxz
byBuZWVkIHN1c3BlbmQvcmVzdW1lIG9yZGVyIChkZXZpY2UgbGlua3MpPyBJIGd1ZXNzIHRoZSBv
dGhlcgo+IHNpZGUsIGUuZy4gIG1peGVyLCBzaG91bGQgcmVzdW1lIGJlZm9yZSB0aGUgYnVzPwoK
QWN0dWFsbHksIEkgdGhpbmsgdGhhdCB0aGUgYnVzIChkZXZmcmVxKSBzaG91bGQgcmVzdW1lIGJl
Zm9yZSBtaXhlci4gSG93ZXZlciwKc3VzcGVuZC9yZXN1bWUgb3JkZXIgaXMgYW5vdGhlciBpc3N1
ZSB0aGF0IGFwcGxpZXMgdG8gdGhpcyBkcml2ZXIgcmVnYXJkbGVzcyBvZgp1c2luZyB0aGUgaW50
ZXJjb25uZWN0IGZyYW1ld29yaywgYWx0aG91Z2ggZGV2aWNlIGxpbmtzIGNvdWxkIHByb2JhYmx5
IGFsc28gYmUKaW1wbGVtZW50ZWQgaW4gdGhlIGludGVyY29ubmVjdCBmcmFtZXdvcmsgaXRzZWxm
LgoKPiA+ICsJCXBhcmVudF9idXMgPSBkZXZfZ2V0X2RydmRhdGEocGFyZW50X2RldmZyZXEtPmRl
di5wYXJlbnQpOwo+ID4gKwkJcGFyZW50X25vZGUgPSBwYXJlbnRfYnVzLT5ub2RlOwo+ID4gKwl9
IGVsc2Ugewo+ID4gKwkJLyogTG9vayBmb3IgcGFyZW50IGluIERUICovCj4gPiArCQlpbnQgbnVt
ID0gb2ZfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MobnAsICJwYXJlbnQiLAo+ID4gKwkJCQkJCSAg
ICAgIiNpbnRlcmNvbm5lY3QtY2VsbHMiKTsKPiA+ICsJCWlmIChudW0gIT0gMSkKPiAKPiBZb3Ug
d2lsbCByZXR1cm4gaGVyZSAwIGJ1dCBpc24ndCBpdCBhbiBlcnJvcj8KCkl0IGlzIGRlZmluaXRl
bHkgbm90IGFuIGVycm9yIHdoZW4gJ3BhcmVudCcgZG9lcyBub3QgZXhpc3QgaW4gRFQgKGZvciBi
dXNlcyB0aGF0CmFyZSBwYXJlbnRzIHRoZW1zZWx2ZXMpLiBJIGNhbiBleHRlbmQgdGhlIGNvbW1l
bnQgaW4gdGhlIGNvZGUgdG8gZXhwbGljaXRseQpzdGF0ZSB0aGF0LgoKQmVzdCByZWdhcmRzLAot
LSAKQXJ0dXIgxZp3aWdvxYQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVs
ZWN0cm9uaWNzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
