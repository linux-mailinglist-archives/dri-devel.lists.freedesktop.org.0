Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A664211CE8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51316EA65;
	Thu,  2 Jul 2020 07:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428596EA40
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:23:49 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200702012347epoutp01593b11f6871808f45425b24575486e19~dyvwXHiZ51984619846epoutp01I
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:23:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200702012347epoutp01593b11f6871808f45425b24575486e19~dyvwXHiZ51984619846epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593653027;
 bh=BIJ8exSrtpBrvnlfhORDNhW3IdqqFicMwvVZdnwAlgA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=LfPsp3YKR8kXsQSyds2krh39VDoL1EP+twUykAj+nF2idGNOEvdoICZg3Ibt+HI37
 QRdpFjvP1J5uO2Y1R7RNME03igxDbCUEU3oNp3krXLEC0A6OYyGkEj1mnF0zsoipcx
 84AFSbAdkmdtgJHQzMnZL4aWaNNvmnXZqLDSThg8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200702012346epcas1p1c09d5dbb8bbeb1971d6ad253475d9431~dyvv5rLx41303413034epcas1p19;
 Thu,  2 Jul 2020 01:23:46 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.158]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 49y0jX3GSFzMqYlp; Thu,  2 Jul
 2020 01:23:44 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 1D.C2.28578.0273DFE5; Thu,  2 Jul 2020 10:23:44 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200702012343epcas1p1da44b969ce1f7e8bd846e8ad189f4a9f~dyvtKsN-g1302913029epcas1p16;
 Thu,  2 Jul 2020 01:23:43 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702012343epsmtrp1866b875c83d13cc0e2f99f86f2d9dd09~dyvtJF35c1496914969epsmtrp1Q;
 Thu,  2 Jul 2020 01:23:43 +0000 (GMT)
X-AuditID: b6c32a39-8c9ff70000006fa2-2d-5efd37207f79
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E5.D6.08382.F173DFE5; Thu,  2 Jul 2020 10:23:43 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702012343epsmtip230d85c2293146ac2c4cb517e993ff3ca~dyvs2ipBj2710327103epsmtip2z;
 Thu,  2 Jul 2020 01:23:43 +0000 (GMT)
Subject: Re: [PATCH v4 11/37] PM / devfreq: tegra30: Silence deferred probe
 error
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <8e941321-5da6-e9e7-6a4e-8c0477911ebd@samsung.com>
Date: Thu, 2 Jul 2020 10:34:59 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <fda8aa80-04f1-af00-7a0d-f9b589cdb37e@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPJsWRmVeSWpSXmKPExsWy7bCmrq6C+d84g5/fJCzuz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW
 5koKeYm5qbZKLj4Bum6ZOUC/KCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKLAv0
 ihNzi0vz0vWS83OtDA0MjEyBChOyM843drIW7BCs2P9kOmMDYy9fFyMnh4SAicSt/vVsXYxc
 HEICOxgllm9rYIZwPjFKnP58HyrzjVHiwOPrLDAtG4+0gtlCAnsZJV6uEoIoes8o8e7nezaQ
 hLBAsMSx15fYQRIiAkeYJVZ3HmcEcZgFLjNKnG37AlbFJqAlsf/FDTCbX0BR4uqPx4wgNq+A
 ncS8hk1gK1gEVCQWX5rDDGKLCoRJnNzWAlUjKHFy5hOwGk4BW4mJFzrB4swC4hK3nsxngrDl
 JZq3zgZ7SEKgmVPiwPMDbBA/uEisWL+YEcIWlnh1fAs7hC0l8bK/Dcqullh58ggbRHMHo8SW
 /RdYIRLGEvuXTgbawAG0QVNi/S59iLCixM7fc6GO4JN497WHFaREQoBXoqNNCKJEWeLyg7tM
 ELakxOL2TrYJjEqzkLwzC8kLs5C8MAth2QJGllWMYqkFxbnpqcWGBabI8b2JEZzStSx3ME5/
 +0HvECMTB+MhRgkOZiUR3tMGv+KEeFMSK6tSi/Lji0pzUosPMZoCA3gis5Rocj4wq+SVxBua
 GhkbG1uYGJqZGhoqifM6WV+IExJITyxJzU5NLUgtgulj4uCUamBaerl4Z9jvpq//be+/qojt
 4Pv/v2zb61szBX6t5ugRXpz3UNKa6z53V9C+6sLg7nAvwSsJJyume7yLeyvhKZaisbmv0vzC
 sf/t57vNvk0/Wmpk+yOwYFFsgLoX91+TvxvDHNf79i44bnPJb9ltD/H8/OcP/7WXVX/drmnP
 Ep2o8Uv9rHRjMcfp5NkX5qxeIvO24shOxwyfijnHnr18n7bW168r+vSXLzFshT7Vgu+3bngy
 Yaa5xGP/i62N//xnX73mFtzG6N35L3azi9Kt1MZDdQdezA8NVhGc8eDbhtP3md8wPGpaJL1A
 tXiCGmvTNZ45yhqBvQ/eHVB89/adUdzEV+KS0w5aJT6aWG7DreGrxFKckWioxVxUnAgAy4Yu
 U3IEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Re0hTURyAOfde77YLs7ut8mShNIqalClEHntIqcEtg4qyUGp50cuU3NJt
 ZkaBZTO3WqX0XDJzipVR4FLT8oXOma1Ml9rwkaAWQaWplT3MahuB/33n/L7v8IPDx8XthD8/
 RaXl1Co2VUpSRHWLNHB1YNhveci0UYaGzDqAxibf+qAiW4cPujcxAlD313ESXau3kuiMyUKg
 F6c/8tCrx4UkmjLaANJ/MZGo69lW1H/qDokK7l8BSFdv46HZ3goC/XhsJjaLmHGXjsfUmgZ5
 jLNjBmes5XqSGeitI5mhc20YY8wZI5kLleWAmbIG7BLEUxuTuNSUo5x6TUQClfzylN4nrUZ0
 rHH0GsgGRl8DEPAhvRZW2HSEm8X0EwD7XfHe+0XwalcrbgD8fyyBLS0aA6D+KZ8AbHozAtyO
 hN4D7R+cPPdgPm3HodXhwNwHnH4FYI3+K+lNzBhsLCzC3QlJB8HG9y7SzfPopbDnu/cpIR0B
 zdlWzxoEvQyWOAs9/gJ6H6wtHcG8jgi23xj1OAJ6E8zv1HtanF4BZ8xO3Mt+sG+0CPNyIMyp
 uolfAhLTnNw0JzHNSUxzkluAKAeLuDSNUqHUhKaFqrjMYA2r1GSoFMGJR5RW4PntIFkNeFT+
 ObgZYHzQDCAfl84XOkJ+ysXCJDbrOKc+ckidkcppmsFiPiH1E7rSi+ViWsFqucMcl8ap/08x
 vsA/G9tWkZRU1aabWJtZZFRgZ89iWylLZ3QnahJdyhSFlQzEhftKfjVlZFkMCU9T7NIfQiUW
 dCjKrxjJIt7Z1h/oC0iRVGGxk3Dovqw6NXo4hHGEbfiJop4/KCjVb/qV6/tNJ195Oy+bjZye
 96dsv6wDVW9v6KECr2BE3NVSe7diduZTQ1RDgUQozlXFh1gbtmjzqcTu/HBqLOD8jg7LZecs
 1TRgEA2vm647LNsb0R6J0d9fH2AjE+X49tiXMYPXKx07hx/uPrlKfyKDe6A4eVB7UcAtX1Jo
 rU3Y5p8ec6fVqN2SY7kbW58XXrswLNFl74qZ8JvIjVsqU7BlPFApJTTJbGgQrtawfwFIpLrp
 XAMAAA==
X-CMS-MailID: 20200702012343epcas1p1da44b969ce1f7e8bd846e8ad189f4a9f
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200609131843epcas1p3a5b06308559ff03ef1b27521f412b656
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131843epcas1p3a5b06308559ff03ef1b27521f412b656@epcas1p3.samsung.com>
 <20200609131404.17523-12-digetx@gmail.com>
 <136b430d-2097-7b2b-d7dd-b438deee8f5d@samsung.com>
 <fda8aa80-04f1-af00-7a0d-f9b589cdb37e@gmail.com>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yLzIwIDEwOjIwIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDIuMDcuMjAyMCAw
Mzo1OSwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4+IEhpLAo+Pgo+PiBPbiA2LzkvMjAgMTA6
MTMgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IFRlZ3JhIEVNQyBkcml2ZXIgd2FzIHR1
cm5lZCBpbnRvIGEgcmVndWxhciBrZXJuZWwgZHJpdmVyLCBpdCBhbHNvIGNvdWxkCj4+PiBiZSBj
b21waWxlZCBhcyBhIGxvYWRhYmxlIGtlcm5lbCBtb2R1bGUgbm93LiBIZW5jZSBFTUMgY2xvY2sg
aXNuJ3QKPj4+IGd1YXJhbnRlZWQgdG8gYmUgYXZhaWxhYmxlIGFuZCBjbGtfZ2V0KCJlbWMiKSBt
YXkgcmV0dXJuIC1FUFJPQkVfREVGRVIgYW5kCj4+PiB0aGVyZSBpcyBubyBnb29kIHJlYXNvbiB0
byBzcGFtIEtNU0cgd2l0aCBhIGVycm9yIGFib3V0IG1pc3NpbmcgRU1DIGNsb2NrCj4+PiBpbiB0
aGlzIGNhc2UsIHNvIGxldCdzIHNpbGVuY2UgdGhlIGRlZmVycmVkIHByb2JlIGVycm9yLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4+
IC0tLQo+Pj4gIGRyaXZlcnMvZGV2ZnJlcS90ZWdyYTMwLWRldmZyZXEuYyB8IDkgKysrKysrLS0t
Cj4+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jIGIvZHJp
dmVycy9kZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jCj4+PiBpbmRleCBlOTRhMjc4MDRjMjAuLjQy
M2RkMzVjOTViMyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTMwLWRldmZy
ZXEuYwo+Pj4gKysrIGIvZHJpdmVycy9kZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jCj4+PiBAQCAt
ODAxLDkgKzgwMSwxMiBAQCBzdGF0aWMgaW50IHRlZ3JhX2RldmZyZXFfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPj4+ICAJfQo+Pj4gIAo+Pj4gIAl0ZWdyYS0+ZW1jX2Nsb2Nr
ID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJlbWMiKTsKPj4+IC0JaWYgKElTX0VSUih0ZWdy
YS0+ZW1jX2Nsb2NrKSkgewo+Pj4gLQkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGdl
dCBlbWMgY2xvY2tcbiIpOwo+Pj4gLQkJcmV0dXJuIFBUUl9FUlIodGVncmEtPmVtY19jbG9jayk7
Cj4+PiArCWVyciA9IFBUUl9FUlJfT1JfWkVSTyh0ZWdyYS0+ZW1jX2Nsb2NrKTsKPj4+ICsJaWYg
KGVycikgewo+Pj4gKwkJaWYgKGVyciAhPSAtRVBST0JFX0RFRkVSKQo+Pj4gKwkJCWRldl9lcnIo
JnBkZXYtPmRldiwgIkZhaWxlZCB0byBnZXQgZW1jIGNsb2NrOiAlZFxuIiwKPj4+ICsJCQkJZXJy
KTsKPj4+ICsJCXJldHVybiBlcnI7Cj4+PiAgCX0KPj4+ICAKPj4+ICAJZXJyID0gcGxhdGZvcm1f
Z2V0X2lycShwZGV2LCAwKTsKPj4+Cj4+Cj4+IEFzIEkgY29tbWVudGVkIG9uIHBhdGNoMTAsIEkg
cmVjb21tZW5kIHRoYXQgeW91IGFkZCB0aGUgVGVncmEgRU1DIGRyaXZlcgo+PiBjb21taXQgaW5m
b3JtYXRpb24gaW50byBwYXRjaCBkZXNjcmlwdGlvbiBhbmQgTG9va3MgZ29vZCB0byBtZS4KPj4K
PiAKPiBIZWxsbywgQ2hhbndvbyEKPiAKPiBUaGlzIHBhdGNoMTEgYW5kIHBhdGNoMTAgYXJlIGRl
cGVuZGluZyBvbiB0aGUgcGF0Y2hlcyA0LzUgKHRoZSBUZWdyYSBFTUMKPiBkcml2ZXIgcGF0Y2hl
cykgb2YgKnRoaXMqIHNlcmllcywgaGVuY2UgdGhlcmUgaXMgbm8gY29tbWl0IGluZm9ybWF0aW9u
Lgo+IEknbSBleHBlY3RpbmcgdGhhdCB0aGlzIHdob2xlIHNlcmllcyB3aWxsIGdvIHZpYSB0ZWdy
YSB0cmVlIG9uY2UgYWxsIHRoZQo+IHBhdGNoZXMgd2lsbCBiZSByZXZpZXdlZCBhbmQgY29sbGVj
dCBhbGwgdGhlIG5lY2Vzc2FyeSBhY2tzIGZyb20geW91LAo+IElDQyBhbmQgQ0xLIHN1YnN5c3Rl
bSBtYWludGFpbmVycy4KPiAKPiBQbGVhc2UgZmVlbCBmcmVlIHRvIGdpdmUgeW91cnMgYWNrIHRv
IHRoZSBwYXRjaGVzIDEwLzExIGlmIHRoZXkgYXJlIGdvb2QKPiB0byB5b3UgOikKPiAKPiAKCk9L
LiBMb29rcyBnb29kIHRvIG1lCkFja2VkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1z
dW5nLmNvbT4KCi0tIApCZXN0IFJlZ2FyZHMsCkNoYW53b28gQ2hvaQpTYW1zdW5nIEVsZWN0cm9u
aWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
