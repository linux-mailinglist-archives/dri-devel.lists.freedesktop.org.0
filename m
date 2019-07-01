Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC815B7F1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 11:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB2E89B5F;
	Mon,  1 Jul 2019 09:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C0989B5F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 09:23:30 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190701092329euoutp01cdc64eb37097f506e2a90ab922f2c89f~tPi0ZHuD91478914789euoutp01b
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 09:23:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190701092329euoutp01cdc64eb37097f506e2a90ab922f2c89f~tPi0ZHuD91478914789euoutp01b
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190701092328eucas1p15b5a7d8f33a636230bcb2485bc83fa05~tPi0D0p-q1758117581eucas1p1d;
 Mon,  1 Jul 2019 09:23:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3C.D4.04325.011D91D5; Mon,  1
 Jul 2019 10:23:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190701092327eucas1p1cb466d226fa17a1462d0bdf5625ed721~tPizQ_t-D2711027110eucas1p14;
 Mon,  1 Jul 2019 09:23:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190701092327eusmtrp1a3677c1ea24aed39c35430b5b2aabbe3~tPizC-lOJ3244632446eusmtrp1d;
 Mon,  1 Jul 2019 09:23:27 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-17-5d19d110eca1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 40.AA.04140.F01D91D5; Mon,  1
 Jul 2019 10:23:27 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190701092327eusmtip1784f1a91ab6166c69ae98d80537e0daf~tPiyxpu3V1704817048eusmtip1V;
 Mon,  1 Jul 2019 09:23:27 +0000 (GMT)
Subject: Re: [PATCH] drm: bridge: DRM_SIL_SII8620 should depend on, not
 select INPUT
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <a7edece4-fec4-5811-27a9-ca6c275a4c40@samsung.com>
Date: Mon, 1 Jul 2019 11:23:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <8baa25c0-498b-d321-4e6a-fe987a4989ba@infradead.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djP87oCFyVjDZpvKlpc+fqezWLS/Qks
 Fp0Tl7BbXN41h83i7Z3pLA6sHrM7ZrJ6bF6h5XG/+ziTR9+WVYwenzfJBbBGcdmkpOZklqUW
 6dslcGVcmPSJqeAXT8XzmYfZGxhXc3UxcnJICJhI9Px4zwZiCwmsYJS41ZTbxcgFZH9hlDhw
 aTo7hPOZUWLzsqvsMB1PTq5ng0gsZ5ToXb6HGcJ5yyixsW0i2CxhgTCJcw1HmUBsEYEaiem3
 zjGD2MwC0RI9y9ewgNhsApoSfzffBKvnFbCT+Lz3BCOIzSKgIvFzw2uwelGBCInLW3YxQtQI
 Spyc+QSsl1PAUWLO0gdMEDPlJba/nQM1X1zi1pP5TCAHSQgsYpc4sPMNG8TZLhKNd2ezQtjC
 Eq+Ob4F6R0bi9OQeFgi7XuL+ihZmiOYORomtG3YyQySsJQ4fvwjUzAG0QVNi/S59iLCjxM9T
 /9hBwhICfBI33gpC3MAnMWnbdGaIMK9ER5sQRLWixP2zW6EGikssvfCVbQKj0iwkn81C8s0s
 JN/MQti7gJFlFaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmCyOf3v+NcdjPv+JB1iFOBg
 VOLhbbgjESvEmlhWXJl7iFGCg1lJhHf/CslYId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzVDA+i
 hQTSE0tSs1NTC1KLYLJMHJxSDYwCM60ONS6Z9E53fcxR7fpvASq7ZRls463rLnCqfLzvfGah
 kv6Nm0VH6tJOLq2fvn7x3QrBB77WgW/bJxvHLOaoSnh7eHJmpJvtCrfsOVZPbIWrZP8aX9xc
 tPiHwo87F66833eNN+NqJKvMKb6t8v3ZL5ZcPNy5+f7y1dcNklz3LL8dcYPD74i/EktxRqKh
 FnNRcSIAA/IMhjIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xu7r8FyVjDW7c1rK48vU9m8Wk+xNY
 LDonLmG3uLxrDpvF2zvTWRxYPWZ3zGT12LxCy+N+93Emj74tqxg9Pm+SC2CN0rMpyi8tSVXI
 yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mu4MOkTU8EvnornMw+z
 NzCu5upi5OSQEDCReHJyPVsXIxeHkMBSRonpq64xQSTEJXbPf8sMYQtL/LnWBVX0mlHiVPdp
 xi5GDg5hgTCJ1idFIDUiAnUSPdMWMILYzALREr/OHGKGqJ8CNHTnQXaQBJuApsTfzTfZQGxe
 ATuJz3tPgDWwCKhI/NzwGmyZqECERF/bbKgaQYmTM5+wgNicAo4Sc5Y+YIJYoC7xZ94lZghb
 XmL72zlQtrjErSfzmSYwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpec
 n7uJERhf24793LKDsetd8CFGAQ5GJR5ejVsSsUKsiWXFlbmHGCU4mJVEePevkIwV4k1JrKxK
 LcqPLyrNSS0+xGgK9NxEZinR5Hxg7OeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5N
 LUgtgulj4uCUamA8cOz1wg0Kj49LnruwfKJRY8PnycVflY9bPA41Z5/Crn/x0+rE3z1ui20a
 j3OK3t6XcI0xSvyeS87D30+iZ4T2z4l6uOebpZpjd+/kBTGvphnprorO27V/rlrPzt9305gn
 mBocjuoVPTu9puUVv32A4MMd5dF7j7Ut+Ob3Z0LlHKMfJ19ryb7JVmIpzkg01GIuKk4EAD83
 l7nFAgAA
X-CMS-MailID: 20190701092327eucas1p1cb466d226fa17a1462d0bdf5625ed721
X-Msg-Generator: CA
X-RootMTR: 20190701033927epcas2p2d7d0b611a0d32b7b208acc787069a83a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190701033927epcas2p2d7d0b611a0d32b7b208acc787069a83a
References: <CGME20190701033927epcas2p2d7d0b611a0d32b7b208acc787069a83a@epcas2p2.samsung.com>
 <8baa25c0-498b-d321-4e6a-fe987a4989ba@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561973009;
 bh=QI5iVQFT+2D2h+UGA17833cZARFQzx3lh8FOwrsfy/I=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=MW5JQu2HM7QnlbhSPCyjQunsb+dN4o7e8Req67zaKFFPT6JVJQBqN6SAdiYI26gwV
 uJG4abj7beRfCOeXtyn2VPjG2cEpfdX0wTTCveCga94PV0K1ihQgHceLonQI7481yv
 yggVvBlcoyuDee5Z9GYRMYoPpkNgC+DjHJCgtuqs=
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEuMDcuMjAxOSAwNTozOSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IEZyb206IFJhbmR5IER1
bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+Cj4gQSBzaW5nbGUgZHJpdmVyIHNob3VsZCBu
b3QgZW5hYmxlIChzZWxlY3QpIGFuIGVudGlyZSBzdWJzeXN0ZW0sCj4gc3VjaCBhcyBJTlBVVCwg
c28gY2hhbmdlIHRoZSAnc2VsZWN0JyB0byAiZGVwZW5kcyBvbiIuCj4KPiBGaXhlczogZDZhYmU2
ZGY3MDZjICgiZHJtL2JyaWRnZTogc2lsX3NpaTg2MjA6IGRvIG5vdCBoYXZlIGEgZGVwZW5kZW5j
eSBvZiBSQ19DT1JFIikKPgo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPgo+IENjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+Cj4gQ2M6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gQ2M6IExhdXJlbnQgUGluY2hh
cnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IC0tLQo+IExpbnVzIGhhcyB3cml0dGVuIHRoaXMgYSBjb3Vw
bGUgb2YgdGltZXMgaW4gdGhlIGxhc3QgMTUgeWVhcnMgb3Igc28sCj4gYnV0IG15IHNlYXJjaCBm
dSBjYW5ub3QgZmluZCBpdC4gIEFuZCB0aGVyZSBhcmUgYSBmZXcgZHJpdmVycyBpbiB0aGUKPiBr
ZXJuZWwgdHJlZSB0aGF0IGRvIHRoaXMsIGJ1dCB3ZSBzaG91bGRuJ3QgYmUgYWRkaW5nIG1vcmUg
dGhhdCBkbyBzby4KCgpUaGUgcHJvcGVyIHNvbHV0aW9uIGhhcyBiZWVuIGFscmVhZHkgcG9zdGVk
IFsxXSwgYnV0IGl0IGhhcyBub3QgYmVlbgphcHBsaWVkIHlldCB0byBpbnB1dCB0cmVlPwoKUmFu
ZHkgYXJlIHRoZXJlIGNoYW5jZXMgeW91ciBwYXRjaHNldCB3aWxsIGFwcGVhciBpbiBNTCBpbiBu
ZWFyIGZ1dHVyZSwKb3Igc2hvdWxkIEkgbWVyZ2UgeW91ciBzaWk4NjIwIHBhdGNoIGFsb25lPwoK
ClsxXToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDQxOTA4MTkyNi4xMzU2Ny0y
LXJvbmFsZEBpbm5vdmF0aW9uLmNoLwoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgoKPgo+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCAgICAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiAtLS0gbG54LTUyLXJjNy5vcmlnL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+ICsrKyBsbngtNTItcmM3L2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvS2NvbmZpZwo+IEBAIC04MywxMCArODMsOSBAQCBjb25maWcgRFJNX1BBUkFERV9Q
Uzg2MjIKPiAgCj4gIGNvbmZpZyBEUk1fU0lMX1NJSTg2MjAKPiAgCXRyaXN0YXRlICJTaWxpY29u
IEltYWdlIFNJSTg2MjAgSERNSS9NSEwgYnJpZGdlIgo+IC0JZGVwZW5kcyBvbiBPRgo+ICsJZGVw
ZW5kcyBvbiBPRiAmJiBJTlBVVAo+ICAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gIAlpbXBseSBF
WFRDT04KPiAtCXNlbGVjdCBJTlBVVAo+ICAJc2VsZWN0IFJDX0NPUkUKPiAgCWhlbHAKPiAgCSAg
U2lsaWNvbiBJbWFnZSBTSUk4NjIwIEhETUkvTUhMIGJyaWRnZSBjaGlwIGRyaXZlci4KPgo+Cj4K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
