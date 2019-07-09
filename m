Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F6636CD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 15:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653E589C1B;
	Tue,  9 Jul 2019 13:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FEB89C1B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 13:21:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190709132103euoutp02286b4d8304b2aeb4e73852d0993f9dab~vv8iRWis91420614206euoutp02n
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 13:21:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190709132103euoutp02286b4d8304b2aeb4e73852d0993f9dab~vv8iRWis91420614206euoutp02n
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190709132103eucas1p27737759549c9c7365afec361dd16a5ca~vv8hp6ozP0305603056eucas1p2L;
 Tue,  9 Jul 2019 13:21:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 79.00.04298.EB4942D5; Tue,  9
 Jul 2019 14:21:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190709132102eucas1p2c0055fbc73281a9600005272c1390aed~vv8g3QEGl0303103031eucas1p2K;
 Tue,  9 Jul 2019 13:21:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190709132102eusmtrp12a04e117747b6e0d631d35bebce61b5d~vv8gpGvjg2973429734eusmtrp1I;
 Tue,  9 Jul 2019 13:21:02 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-b9-5d2494bead47
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 74.A7.04140.EB4942D5; Tue,  9
 Jul 2019 14:21:02 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190709132101eusmtip17f4596b278985bc74d98a6a7712678f6~vv8gQdzxW2559225592eusmtip1N;
 Tue,  9 Jul 2019 13:21:01 +0000 (GMT)
Subject: Re: [PATCH 01/60] drm/edid: Add flag to drm_display_info to
 identify HDMI sinks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <1b609054-cf4f-fafc-8b76-6cb50a03f4ff@samsung.com>
Date: Tue, 9 Jul 2019 15:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190707180852.5512-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djPc7r7pqjEGvy8aGnxf9tEZosrX9+z
 WXROXMJusfDjVhaLBy/3M1rcnXwESLz2s1g//xabA4fHvDXVHjvuLmH02PttAYvH7I6ZrB7z
 TgZ63O8+zuRxfNctdo/jN7YzBXBEcdmkpOZklqUW6dslcGVsO3mSpeAtf8XEadMZGxhf8HQx
 cnJICJhIbNzyiqWLkYtDSGAFo8SEU79YIZwvjBKLFv9mBakSEvjMKLHhSjxMx5cdS9khipYz
 Snx59RWq/S2jxL49O1hAqoQFoiSWrTrCDGKLCERL7NqwF2wss0Ark8TEWS/BxrIJaEr83XyT
 rYuRg4NXwE7i03dVkDCLgIrEkr/3wUpEBcIkfi7oZAOxeQUEJU7OfMICUs4p4Cbx5aUSSJhZ
 QF6ieetsZghbXOLWk/lMIKskBE6xS2z4spYd4moXibe/epggbGGJV8e3QMVlJE5P7mGBsOsl
 7q9oYYZo7mCU2LphJzNEwlri8PGLrCCLmYFuXr9LHyLsKPHj+T9mkLCEAJ/EjbeCEDfwSUza
 Nh0qzCvR0SYEUa0ocf/sVqiB4hJLL3xlm8CoNAvJY7OQfDMLyTezEPYuYGRZxSieWlqcm55a
 bJiXWq5XnJhbXJqXrpecn7uJEZikTv87/mkH49dLSYcYBTgYlXh4JVpUYoVYE8uKK3MPMUpw
 MCuJ8O5zV44V4k1JrKxKLcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnV
 wGi5jtn9ve2OeY+dO/0/nwlfVrpwVlNMTXjr17PrX34xS7f6yLLp3GXFNK/SZOaW+TITPP4k
 XT/XcfD2zRWHOh2vhRdferL62ssjik7WHBr+8b97I9cxzbxy4sfZCOvF6+YmG0zMaYrSmDGn
 yFDmxBd5yWjDE+rHLueKzlNT3RqQt8ZwwkSXI5lKLMUZiYZazEXFiQCLRi8dTgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xu7r7pqjEGizrYrP4v20is8WVr+/Z
 LDonLmG3WPhxK4vFg5f7GS3uTj4CJF77Wayff4vNgcNj3ppqjx13lzB67P22gMVjdsdMVo95
 JwM97ncfZ/I4vusWu8fxG9uZAjii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62M
 TJX07WxSUnMyy1KL9O0S9DK2nTzJUvCWv2LitOmMDYwveLoYOTkkBEwkvuxYyt7FyMUhJLCU
 UaLj/nNGiIS4xO75b5khbGGJP9e62CCKXjNKvPzSzQaSEBaIkth5ahYriC0iEC1x5tBhsAZm
 gXYmica1BhANVxklft97xASSYBPQlPi7+SZQMwcHr4CdxKfvqiBhFgEViSV/77OChEUFwiSO
 nsgDCfMKCEqcnPmEBSTMKeAm8eWlEsR0dYk/8y5BbZKXaN46G8oWl7j1ZD7TBEahWUi6ZyFp
 mYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECo3LbsZ9bdjB2vQs+xCjAwajE
 wyvRohIrxJpYVlyZe4hRgoNZSYR3n7tyrBBvSmJlVWpRfnxRaU5q8SFGU6DXJjJLiSbnAxNG
 Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxgu7d+0+P+HCwcDy
 jytm8pVNFJGM0HHZrZjJbn35fmHAoj4Zdo2NPjsy1RrcBXWkl7xfuaXCfU5OjXeJjZH/kXan
 9omnTryOWce1VvKRYOThpeJv/k5cuzVOrWSZVbznhLoH5v89vJjmcsu2/FUW/StiWlr0fsXL
 N48YJY7tadA6sll+xdwzkUosxRmJhlrMRcWJAOgg6rngAgAA
X-CMS-MailID: 20190709132102eucas1p2c0055fbc73281a9600005272c1390aed
X-Msg-Generator: CA
X-RootMTR: 20190707181031epcas2p4275031dfdb38afff6f357e3c227efec9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190707181031epcas2p4275031dfdb38afff6f357e3c227efec9
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <CGME20190707181031epcas2p4275031dfdb38afff6f357e3c227efec9@epcas2p4.samsung.com>
 <20190707180852.5512-2-laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562678463;
 bh=Y6bh1mgA9l3aeYdq8rvBCpvlKHlaSph503J9D59WjvE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Sz/R7FMPqW8IcMaceSyjt1vLVp2eJfGuxXaEyExRM3NP2HBKYmRevy2m5kE6LyeDY
 oYaDQtOgmX2RWftcdo25W7mFlL/UkE/2a2Dke/roQa/BC63Bi4Bn7cV7g+yMNmUqU3
 wqFFEFozQF+cKmBBrp54RFP4BnBiivH/Hwfb7Of0=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDcuMjAxOSAyMDowNywgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBUaGUgZHJtX2Rp
c3BsYXlfaW5mbyBzdHJ1Y3R1cmUgY29udGFpbnMgbWFueSBmaWVsZHMgcmVsYXRlZCB0byBIRE1J
Cj4gc2lua3MsIGJ1dCBub25lIHRoYXQgaWRlbnRpZmllcyBpZiBhIHNpbmsgY29tcGxpYW50IHdp
dGggQ0VBLTg2MSAoRURJRCkKPiBzaGFsbCBiZSB0cmVhdGVkIGFzIGFuIEhETUkgc2luayBvciBh
IERWSSBzaW5rLiBBZGQgc3VjaCBhIGZsYWcsIGFuZAo+IHBvcHVsYXRlIGl0IGFjY29yZGluZyB0
byBzZWN0aW9uIDguMy4zICgiRFZJL0hETUkgRGV2aWNlCj4gRGlzY3JpbWluYXRpb24iKSBvZiB0
aGUgSERNSSB2MS4zIHNwZWNpZmljYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgoKSXQgbG9va3MgbGlr
ZSBpdCBjYW4gcmVwbGFjZSBkcm1fZGV0ZWN0X2hkbWlfbW9uaXRvciB1c2FnZSBpbiBtb3N0IGNh
c2VzLgoKUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrC
oC0tClJlZ2FyZHMKQW5kcnplagoKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
YyAgfCAzICsrKwo+ICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCA1ICsrKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IGluZGV4IDgy
YTRjZWVkM2ZjZi4uZDJlN2E1MzM0YzNmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBAQCAtNDU1OSw2
ICs0NTU5LDggQEAgZHJtX3BhcnNlX2hkbWlfdnNkYl92aWRlbyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLCBjb25zdCB1OCAqZGIpCj4gIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5mbyAq
aW5mbyA9ICZjb25uZWN0b3ItPmRpc3BsYXlfaW5mbzsKPiAgCXU4IGxlbiA9IGNlYV9kYl9wYXls
b2FkX2xlbihkYik7Cj4gIAo+ICsJaW5mby0+aXNfaGRtaSA9IHRydWU7Cj4gKwo+ICAJaWYgKGxl
biA+PSA2KQo+ICAJCWluZm8tPmR2aV9kdWFsID0gZGJbNl0gJiAxOwo+ICAJaWYgKGxlbiA+PSA3
KQo+IEBAIC00NjI3LDYgKzQ2MjksNyBAQCBkcm1fcmVzZXRfZGlzcGxheV9pbmZvKHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAlpbmZvLT5jZWFfcmV2ID0gMDsKPiAgCWluZm8t
Pm1heF90bWRzX2Nsb2NrID0gMDsKPiAgCWluZm8tPmR2aV9kdWFsID0gZmFsc2U7Cj4gKwlpbmZv
LT5pc19oZG1pID0gZmFsc2U7Cj4gIAlpbmZvLT5oYXNfaGRtaV9pbmZvZnJhbWUgPSBmYWxzZTsK
PiAgCWluZm8tPnJnYl9xdWFudF9yYW5nZV9zZWxlY3RhYmxlID0gZmFsc2U7Cj4gIAltZW1zZXQo
JmluZm8tPmhkbWksIDAsIHNpemVvZihpbmZvLT5oZG1pKSk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IGlu
ZGV4IGNhNzQ1ZDlmZWFmNS4uZTgwY2EwZDE0OWU1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJt
L2RybV9jb25uZWN0b3IuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IEBA
IC00MjYsNiArNDI2LDExIEBAIHN0cnVjdCBkcm1fZGlzcGxheV9pbmZvIHsKPiAgCSAqLwo+ICAJ
Ym9vbCBkdmlfZHVhbDsKPiAgCj4gKwkvKioKPiArCSAqIEBpc19oZG1pOiBUcnVlIGlmIHRoZSBz
aW5rIGlzIGFuIEhETUkgZGV2aWNlLgo+ICsJICovCj4gKwlib29sIGlzX2hkbWk7Cj4gKwo+ICAJ
LyoqCj4gIAkgKiBAaGFzX2hkbWlfaW5mb2ZyYW1lOiBEb2VzIHRoZSBzaW5rIHN1cHBvcnQgdGhl
IEhETUkgaW5mb2ZyYW1lPwo+ICAJICovCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
