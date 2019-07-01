Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5515B921
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 12:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF90089B8E;
	Mon,  1 Jul 2019 10:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B6C89B8E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 10:36:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190701103630euoutp01e11605efd7643282dd96e5f38f2d2cfb~tQikcbiQf0634606346euoutp01B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 10:36:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190701103630euoutp01e11605efd7643282dd96e5f38f2d2cfb~tQikcbiQf0634606346euoutp01B
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190701103629eucas1p233cfeb0a627d79109784e1a7cf8011d7~tQij4JkZU2825028250eucas1p2u;
 Mon,  1 Jul 2019 10:36:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 2E.58.04377.D22E91D5; Mon,  1
 Jul 2019 11:36:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190701103628eucas1p10cea599f8a54f4a9f74b28d61076c9dd~tQijHPNNP0799507995eucas1p1l;
 Mon,  1 Jul 2019 10:36:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190701103628eusmtrp1e529a8e7e2da4d51cedbc2712b326e44~tQii4pAP81747117471eusmtrp1N;
 Mon,  1 Jul 2019 10:36:28 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-52-5d19e22dc9be
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9C.55.04140.C22E91D5; Mon,  1
 Jul 2019 11:36:28 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190701103628eusmtip18fe8cd03b6b79fbcece196753a0a2f16~tQiimIhU42960229602eusmtip1k;
 Mon,  1 Jul 2019 10:36:28 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: tc358767: do a software reset if reset pin
 isn't connected
To: Lucas Stach <l.stach@pengutronix.de>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <f974517c-031b-a2b2-ea5c-f98efc87c178@samsung.com>
Date: Mon, 1 Jul 2019 12:36:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190627085958.28331-1-l.stach@pengutronix.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djPc7q6jyRjDeb84LVo7rC1uPL1PZvF
 g7k3mSw6Jy5ht1g//xabA6vHzll32T1md8xk9bjffZzJo/+vgcfxG9uZAlijuGxSUnMyy1KL
 9O0SuDKu7zjKUjBFsOL1rt1MDYyreLsYOTkkBEwkVl44zNbFyMUhJLCCUeLel89MIAkhgS+M
 EhtXuUIkPjNKvFh2iAmm4/LUBawQieWMEksvtEK1v2WUWPC3jw2kSlggVmLfzMvMXYwcHCIC
 CRK9U5hATGaBConJe8pAKtgENCX+br4JVs0rYCexrHk62HwWARWJN/8Xg9miAhESl7fsYoSo
 EZQ4OfMJC4jNKWAjcfnVDbAaZgF5ie1v5zBD2OISt57MZwI5R0JgHrvEqqPrWCGOdpG4fPMh
 M4QtLPHq+BZ2CFtG4vTkHhYIu17i/ooWZojmDkaJrRt2QjVYSxw+fpEV4gFNifW79CHCjhJn
 NjxiBwlLCPBJ3HgrCHEDn8SkbdOZIcK8Eh1tQhDVihL3z26FGigODLWvbBMYlWYh+WwWkm9m
 IflmFsLeBYwsqxjFU0uLc9NTi43yUsv1ihNzi0vz0vWS83M3MQITzel/x7/sYNz1J+kQowAH
 oxIPb8MdiVgh1sSy4srcQ4wSHMxKIrz7V0jGCvGmJFZWpRblxxeV5qQWH2KU5mBREuetZngQ
 LSSQnliSmp2aWpBaBJNl4uCUamDMTU3Y1vboUXKMkrLHv4qu56p7vcufLnKuO/XX9u7v0tO/
 DBd4PDxayHzc76jejk85xwOv/q9SzmAt2f7M02mOh78Se7/EbUfJ13VnhTd1Trv84OTRFcp1
 CbqbjTteXmZ7coo/+uSH72nB7N7/+g3TJ+v//bsy0Is9+dGO+oeZL9Yb3TywYcoLJZbijERD
 Leai4kQAlQaBRDADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xu7o6jyRjDV51i1s0d9haXPn6ns3i
 wdybTBadE5ewW6yff4vNgdVj56y77B6zO2ayetzvPs7k0f/XwOP4je1MAaxRejZF+aUlqQoZ
 +cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnXdxxlKZgiWPF6126m
 BsZVvF2MnBwSAiYSl6cuYO1i5OIQEljKKPHsaCcLREJcYvf8t8wQtrDEn2tdbBBFrxklrj+8
 zgaSEBaIldg38zJYkYhAgsTSs0vZQWxmgQqJV7OuQE3tZ5TY/Pky2FQ2AU2Jv5tvgjXzCthJ
 LGuezgRiswioSLz5vxjMFhWIkOhrmw1VIyhxcuYTsF5OARuJy69uMEEsUJf4M+8SM4QtL7H9
 7RwoW1zi1pP5TBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93E
 CIywbcd+btnB2PUu+BCjAAejEg+vxi2JWCHWxLLiytxDjBIczEoivPtXSMYK8aYkVlalFuXH
 F5XmpBYfYjQFem4is5Rocj4w+vNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQW
 wfQxcXBKNTBeX55ZEuNxJPFMz3pvcaETAkxuyntm3XioFH+tT3fl19+8UjKXk2tk6id46ylO
 4k1bd2z1CtOnnZUT9fdNZ3XNYtqx3ZY3RGf19seNYSFn7r9beNhj88yYXcl+vyJ0Gt7+YtO0
 tHkf7XHnv+eXhHd7180zf8E/2XbNt8nvDsy9MdFsQ45t3NVkJZbijERDLeai4kQAm0nfzcYC
 AAA=
X-CMS-MailID: 20190701103628eucas1p10cea599f8a54f4a9f74b28d61076c9dd
X-Msg-Generator: CA
X-RootMTR: 20190627090004epcas2p4a8a3e8272463c5e540b6924fc81b2a9a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627090004epcas2p4a8a3e8272463c5e540b6924fc81b2a9a
References: <CGME20190627090004epcas2p4a8a3e8272463c5e540b6924fc81b2a9a@epcas2p4.samsung.com>
 <20190627085958.28331-1-l.stach@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561977390;
 bh=YQE1FpDKAJldENXXacaJ2bSwBSqgo+K7318JYXaoEzE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Sy60vOUM4S2D1wLUShO0ryZLw0z7UHjNl2es+mDgb+dLXMJEYxHPi5ZrRON7J9RoR
 Rwoy+TC2LKAzDRTUb1dRM2jQr56PY55L1L0JBHUVvaJrMpTxzxHtAZwx08+G3D5lT/
 UPs9ZAIg9j9NhHpU1ICJwdjOOlxtphx07DD70kPI=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMDYuMjAxOSAxMDo1OSwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4gVG8gZ2V0IHRoZSBjaGlw
IGludG8gdGhlIGV4cGVjdGVkIHN0YXRlLCBldmVuIHdoZW4gdGhlIGhhcmR3YXJlIHJlc2V0IHBp
bgo+IGlzbid0IGNvbm5lY3RlZCwgZG8gYSBzb2Z0d2FyZSByZXNldCBpbiB0aGlzIGNhc2UuIEl0
IGlzbid0IGFzIHRob3JvdWdoIGFzCj4gdGhlIGhhcmR3YXJlIHJlc2V0LCBhcyB0aGUgSTJDIGNv
bW11bmljYXRpb24gYmxvY2sgY2FuIG5vdCBiZSByZXNldCBmb3IKPiBvYnZpb3VzIHJlYXNvbnMs
IGJ1dCBpdCdzIGdldHRpbmcgdGhlIGNoaXAgaW50byBhIGRlZmluZWQgc3RhdGUuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KClF1ZXVlZCB0
byBkcm0tbWlzYy1uZXh0LgoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3
NjcuYwo+IGluZGV4IDEzYWRlMjhhMzZhOC4uMWQ1YmE0NTFlMjY4IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwo+IEBAIC03MCw2ICs3MCwxMyBAQAo+ICAjZGVmaW5lIERQMF9WSURT
UkNfRFNJX1JYCQkoMSA8PCAwKQo+ICAjZGVmaW5lIERQMF9WSURTUkNfRFBJX1JYCQkoMiA8PCAw
KQo+ICAjZGVmaW5lIERQMF9WSURTUkNfQ09MT1JfQkFSCQkoMyA8PCAwKQo+ICsjZGVmaW5lIFNZ
U1JTVEVOQgkJMHgwNTBjCj4gKyNkZWZpbmUgRU5CSTJDCQkJCSgxIDw8IDApCj4gKyNkZWZpbmUg
RU5CTENEMAkJCQkoMSA8PCAyKQo+ICsjZGVmaW5lIEVOQkJNCQkJCSgxIDw8IDMpCj4gKyNkZWZp
bmUgRU5CRFNJUlgJCQkoMSA8PCA0KQo+ICsjZGVmaW5lIEVOQlJFRwkJCQkoMSA8PCA1KQo+ICsj
ZGVmaW5lIEVOQkhEQ1AJCQkJKDEgPDwgOCkKPiAgI2RlZmluZSBHUElPTQkJCTB4MDU0MAo+ICAj
ZGVmaW5lIEdQSU9DCQkJMHgwNTQ0Cj4gICNkZWZpbmUgR1BJT08JCQkweDA1NDgKPiBAQCAtMTQ5
Nyw2ICsxNTA0LDIyIEBAIHN0YXRpYyBpbnQgdGNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCwgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQo+ICAKPiAgCXRjLT5hc3NyID0g
KHRjLT5yZXYgPT0gMHg2NjAxKTsgLyogRW5hYmxlIEFTU1IgZm9yIGVEUCBwYW5lbHMgKi8KPiAg
Cj4gKwlpZiAoIXRjLT5yZXNldF9ncGlvKSB7Cj4gKwkJLyoKPiArCQkgKiBJZiB0aGUgcmVzZXQg
cGluIGlzbid0IHByZXNlbnQsIGRvIGEgc29mdHdhcmUgcmVzZXQuIEl0IGlzbid0Cj4gKwkJICog
YXMgdGhvcm91Z2ggYXMgdGhlIGhhcmR3YXJlIHJlc2V0LCBhcyB3ZSBjYW4ndCByZXNldCB0aGUg
STJDCj4gKwkJICogY29tbXVuaWNhdGlvbiBibG9jayBmb3Igb2J2aW91cyByZWFzb25zLCBidXQg
aXQncyBnZXR0aW5nIHRoZQo+ICsJCSAqIGNoaXAgaW50byBhIGRlZmluZWQgc3RhdGUuCj4gKwkJ
ICovCj4gKwkJcmVnbWFwX3VwZGF0ZV9iaXRzKHRjLT5yZWdtYXAsIFNZU1JTVEVOQiwKPiArCQkJ
CUVOQkxDRDAgfCBFTkJCTSB8IEVOQkRTSVJYIHwgRU5CUkVHIHwgRU5CSERDUCwKPiArCQkJCTAp
Owo+ICsJCXJlZ21hcF91cGRhdGVfYml0cyh0Yy0+cmVnbWFwLCBTWVNSU1RFTkIsCj4gKwkJCQlF
TkJMQ0QwIHwgRU5CQk0gfCBFTkJEU0lSWCB8IEVOQlJFRyB8IEVOQkhEQ1AsCj4gKwkJCQlFTkJM
Q0QwIHwgRU5CQk0gfCBFTkJEU0lSWCB8IEVOQlJFRyB8IEVOQkhEQ1ApOwo+ICsJCXVzbGVlcF9y
YW5nZSg1MDAwLCAxMDAwMCk7Cj4gKwl9Cj4gKwo+ICAJaWYgKHRjLT5ocGRfcGluID49IDApIHsK
PiAgCQl1MzIgbGNudF9yZWcgPSB0Yy0+aHBkX3BpbiA9PSAwID8gSU5UX0dQMF9MQ05UIDogSU5U
X0dQMV9MQ05UOwo+ICAJCXUzMiBoX2xjID0gSU5UX0dQSU9fSCh0Yy0+aHBkX3BpbikgfCBJTlRf
R1BJT19MQyh0Yy0+aHBkX3Bpbik7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
