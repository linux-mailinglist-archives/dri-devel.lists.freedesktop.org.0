Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7BC7EECC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6DE6ED09;
	Fri,  2 Aug 2019 08:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CB4898F1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:01:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190731130059euoutp017375525d22968a3f11dea016922756eb~2f3SbAFP70881108811euoutp01H
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:00:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190731130059euoutp017375525d22968a3f11dea016922756eb~2f3SbAFP70881108811euoutp01H
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190731130058eucas1p2d6d3566af0adf524aa00aef148404b80~2f3SAJLWI3272032720eucas1p2Y;
 Wed, 31 Jul 2019 13:00:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 38.3B.04325.A01914D5; Wed, 31
 Jul 2019 14:00:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190731130057eucas1p1dbc0f96212e96ceac96daede85f71e9e~2f3RIjytP1120011200eucas1p13;
 Wed, 31 Jul 2019 13:00:57 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190731130057eusmtrp1ffe2e1501174ab8d64867c381f28eaf3~2f3Q6Q9RD2484424844eusmtrp1J;
 Wed, 31 Jul 2019 13:00:57 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-96-5d41910a6337
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 3A.1A.04146.901914D5; Wed, 31
 Jul 2019 14:00:57 +0100 (BST)
Received: from AMDC3555 (unknown [106.120.51.67]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20190731130057eusmtip194ae2facf90fd2df4e18896b0f9f9975~2f3QVouLZ2612526125eusmtip1m;
 Wed, 31 Jul 2019 13:00:57 +0000 (GMT)
Message-ID: <73b8c7078b2378921e841b5bd02bd617cc2143be.camel@partner.samsung.com>
Subject: Re: [RFC PATCH 08/11] arm: dts: exynos: Add parents and
 #interconnect-cells to Exynos4412
From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 31 Jul 2019 15:00:56 +0200
In-Reply-To: <20190724192426.GJ14346@kozik-lap>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjtt/vYdTa9zsAPs6KhQlY+SuGCUmmvkRBmgZFarbxo5VR2fWRJ
 aommlk/KJ6SoNSwfTQ2VfIvLNFdZWmlMMh8ZVjKlwpScd1L/ne+c3/nO+eBHYZIuwpq6EBbJ
 KsPkoVJShD/p+T2wU5TtGehcUWDLPM6vIZjh+SmCudc9QDBvFr6TTF6LmmRydFk4o9XWChn1
 +BDBDDYXk4z+djdi8rWtAqaq+6OQGUlUkUx+7hdyn5lMXZlKykaHnpIyXbpGIKsrj5dl1Fci
 mV692Yc8JfIIYkMvRLNKpz1nRSELLemCiCXx5YLBUiwBlZumIRMKaFdo071FaUhESWgVguSi
 TOMwj6A9NRvjBz0C/cuvgjVLj36O5IUHCMr6Mwl+mETQOpOxYqEoMe0D3/JWDZZ0EEy3vkAG
 TNKHYXnqDWHAG+htMLz0c9WL0e0YdLTcERoEnLaDoskSzIBNaCdQJfVifPIOmH2egfP7LWCp
 0dJAY/QWuNFQtNoU6A9CqB1rF/LvD4CmdhDnsSXMaOqNvA305d4y8hxMNOkI3pyAQH2/2xjm
 Dl2aV4QhDFtpWtPsxNOeMN+XstoBaDN4N2vBdzCDnCd5GE+L4WayhIcOULLozxsBrj8cMu6W
 Qd3EIzILbS38d0vhf7cU/kstQVglsmKjOEUwy+0OY2McObmCiwoLdjwfrlCjla/Vt6xZaESt
 f851IppC0vXiZ6megRJCHs3FKjoRUJh0g7jMam+gRBwkj73CKsPPKKNCWa4TbaRwqZX46rox
 fwkdLI9kL7FsBKtcUwWUiXUCanpg+fqHrdivr3/EpHrhUJ2o2O1uQ0D/8q7Pzrr320d7UUvp
 4o4qd++jiQGqisFNx9ncgmr7+WsDChmy9/jc1XFMi/uWvboY5+vqEeo75zzm4hWTcBD396mI
 O+JtU+nX45aynz6ZbTZ52iXefMbctLM8rkp74te4tt8r6ZOdedu0FOdC5C4OmJKT/wVKrNeP
 VgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xu7qcEx1jDfYu1rbYOGM9q8X1L89Z
 LeYfOcdqceXrezaL6Xs3sVlMuj+BxeL8+Q3sFpseX2O1uLxrDpvF594jjBYzzu9jslh75C67
 xe3GFWwWMya/ZHPg89i0qpPN4861PWwe97uPM3lsXlLv0bdlFaPH501yAWxRejZF+aUlqQoZ
 +cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlf93YzFfzlrZh5eSFz
 A+MS7i5GTg4JAROJY58/snUxcnEICSxllDi+ei8LREJC4uP6G6wQtrDEn2tdUEVPGCXe7HzF
 1MXIwcErECDxbjoTSI2wQIrEi31nGUFsNgF3iX/Pr4D1ighoSlz/+50VpJdZ4BCzxLoD3WAJ
 FgFVidnPFjCD2JwC+hIrWk4yQyz4CrRg0x2wK5iBulu3/2aHuEJH4u2pPhaIxYISf3cIQ5TI
 SzRvnc08gVFwFpKOWQhVs5BULWBkXsUoklpanJueW2yoV5yYW1yal66XnJ+7iREYkduO/dy8
 g/HSxuBDjAIcjEo8vCc6HWOFWBPLiitzDzFKcDArifAuFrePFeJNSaysSi3Kjy8qzUktPsRo
 CvTPRGYp0eR8YLLIK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXA
 2J9m+/Xsc6Fvq9dMvSPKycY8s5PvYMexZaH8SkX95jU9W9RLuBIslSbdvn+94FtJyQOFDvZM
 kznzJqTHrk9d+vLkxopT/1rPWZamhTkuVPuxy6DSs7GjUlRm0pnJM0qfLLxW88tQ23OJ+Trt
 Oetby1nuTXp15ZG7MNc7eZmQ0mPsZh5q+x51KrEUZyQaajEXFScCAC2JLOveAgAA
X-CMS-MailID: 20190731130057eucas1p1dbc0f96212e96ceac96daede85f71e9e
X-Msg-Generator: CA
X-RootMTR: 20190723122027eucas1p24b1d76e3139f7cc52614d7613ff9ba98
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190723122027eucas1p24b1d76e3139f7cc52614d7613ff9ba98
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122027eucas1p24b1d76e3139f7cc52614d7613ff9ba98@eucas1p2.samsung.com>
 <20190723122016.30279-9-a.swigon@partner.samsung.com>
 <20190724192426.GJ14346@kozik-lap>
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1564578059;
 bh=sYKGsWtGJ4TQpv6om4+mpD+czgFv0SgtP4v8p2BxWRc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=PPknhESAOOlCRF6Ro5Lt3dK5cCDfT4cs95UE68TgmIM7EsHxKd5MKl4YrzEqeaxnk
 pLn2Xf0MLzsbYvowlQOL52vOMEu3CCXH+R2hjXqQuGKaeBBksOjBiWSFnRoQJ9eaaw
 XVJ34F0IsMUVUIee++06eWLvsgkRMOjiDkuFfa+Y=
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

T24gV2VkLCAyMDE5LTA3LTI0IGF0IDIxOjI0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDAyOjIwOjEzUE0gKzAyMDAsIEFydHVyIMWa
d2lnb8WEIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGRzIHR3byBmaWVsZHMgdHAgdGhlIEV4eW5v
czQ0MTIgRFRTOgo+IAo+IHRwLT50bwoKRml4ZWQuIFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhlIHR5
cG8gOikKCj4gPiAgIC0gcGFyZW50OiB0byBkZWNsYXJlIGNvbm5lY3Rpb25zIGJldHdlZW4gbm9k
ZXMgdGhhdCBhcmUgbm90IGluIGEKPiA+ICAgICBwYXJlbnQtY2hpbGQgcmVsYXRpb24gaW4gZGV2
ZnJlcTsKPiAKPiBJcyBpdCBhIHN0YW5kYXJkIHByb3BlcnR5Pwo+IFRoZSBleHBsYW5hdGlvbiBu
ZWVkcyBzb21lIGltcHJvdmVtZW50Li4uIHdoeSBhcmUgeW91IGFkZGluZyBwYXJlbnQgdG8gYQo+
IGRldmljZXMgd2hpY2ggYXJlIG5vdCBjaGlsZC1wYXJlbnQ/CgpUaGlzIGlzIG5vdCBhIHN0YW5k
YXJkIHByb3BlcnR5LiBJIGFjdHVhbGx5IHdhbnRlZCB0byBjYWxsIGl0ICduZWlnaGJvcicgYXQg
Zmlyc3QuIElmIHlvdSB0YWtlIGEgbG9vayBhdCBbMV0gYW5kIHNlYXJjaCBmb3IgJ0V4eW5vczR4
MTInLCB5b3Ugd2lsbCBzZWUgdGhhdCB0aGVyZSBhcmUgdHdvIHBvd2VyIGxpbmVzLCBhbmQgZWFj
aCBoYXMgZXhhY3RseSBvbmUgcGFyZW50IGJsb2NrICh0aGUgcmVzdCBhcmUgbW9kZWxsZWQgaW4g
ZGV2ZnJlcSBhcyBpdHMgY2hpbGRyZW4pLiBJbiBbMl0sIHRoZSBwYXJlbnQgb2YgZWFjaCBjaGls
ZCBpcyBpbmRpY2F0ZWQgdXNpbmcgdGhlICdkZXZmcmVxJyBwcm9wZXJ0eSwgZS5nLiwKCiZidXNf
ZGlzcGxheSB7CglkZXZmcmVxID0gPCZidXNfbGVmdGJ1cz47CglzdGF0dXMgPSAib2theSI7Cn07
CgpUaGUgc2luZ2xlIHBpZWNlIG1pc3NpbmcgdG8gbWFrZSB0aGlzIHRvcG9sb2d5IGEgY29ubmVj
dGVkIGdyYXBoIChmb3IKaW50ZXJjb25uZWN0IFFvUyBwdXJwb3NlcykgaXMgdGhlICdwYXJlbnQn
IHByb3BlcnR5IEkgcHJvcG9zZWQgaW4gdGhpcyBwYXRjaC4KYnVzX2xlZnRidXMgaXMgZGVwZW5k
ZW50IG9uIGJ1c19kbWMsIHRoZXJlZm9yZSB1c2luZyB0aGUgdGVybSAncGFyZW50JyBpcwpqdXN0
aWZpZWQgSU1ITy4KClRoZSBleHBsYW5hdGlvbiBjb3VsZCBiZSBpbXByb3ZlZCBieSBhZGRpbmcg
d2hhdCBDaGFud29vIENob2kgPApjdzAwLmNob2lAc2Ftc3VuZy5jb20+IGV4cHJlc3NlZCBpbiBh
IHBhcmFsbGVsIHJlcGx5IHRvIHRoaXMgcGF0Y2g6Cj4gLSBJZiAnZGV2ZnJlcScgcHJvcGVydHkg
aXMgdXNlZCBiZXR3ZWVuIGJ1c2VzLAo+ICAgaXQgaW5kaWNhdGVzIHRoYXQgdGhlcmUgYXJlIHJl
cXVpcmVtZW50IG9mIHNoYXJpbmcgb2YgcG93ZXIgbGluZS4KPiAtIElmICdwYXJlbnQnIHByb3Bl
cnR5IGlzIHVzZWQgYmV0d2VlbiBidXNlcywKPiAgIGl0IGluZGljYXRlcyB0aGF0IHRoZXJlIGFy
ZSByZXF1aXJlbWVudCBvZiBpbnRlcmNvbm5lY3QgY29ubmVjdGlvbi4KClsxXSBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9leHlub3MtYnVzLnR4dApbMl0gYXJjaC9h
cm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kgKHN1YmplY3Qgb2YgdGhp
cyBwYXRjaCkKCkJlc3QgcmVnYXJkcywKLS0gCkFydHVyIMWad2lnb8WEClNhbXN1bmcgUiZEIElu
c3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
