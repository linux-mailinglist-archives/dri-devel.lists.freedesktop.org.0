Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5805B7FC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 11:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB50F89BA9;
	Mon,  1 Jul 2019 09:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EAA89BA9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 09:26:30 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190701092629euoutp017bb30398bc3d0efde8817420777dc526~tPlb5Qwlh1672816728euoutp01A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 09:26:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190701092629euoutp017bb30398bc3d0efde8817420777dc526~tPlb5Qwlh1672816728euoutp01A
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190701092628eucas1p2fd3557cf8ab6c7d057c68e6fcf26c464~tPlberIQb2678126781eucas1p2u;
 Mon,  1 Jul 2019 09:26:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 79.D8.04298.4C1D91D5; Mon,  1
 Jul 2019 10:26:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190701092627eucas1p147af4474d3a5350784ed8477a42f4f5c~tPlaoaxaQ0549005490eucas1p1X;
 Mon,  1 Jul 2019 09:26:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190701092627eusmtrp10690658903edfcd83d1b8b0dc636b66c~tPlaXrdWy0184801848eusmtrp1q;
 Mon,  1 Jul 2019 09:26:27 +0000 (GMT)
X-AuditID: cbfec7f2-3615e9c0000010ca-26-5d19d1c41078
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CC.3B.04140.3C1D91D5; Mon,  1
 Jul 2019 10:26:27 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190701092626eusmtip22959c3b011eb595c710ae3aec7cfead6~tPlZ_rKTN1441414414eusmtip29;
 Mon,  1 Jul 2019 09:26:26 +0000 (GMT)
Subject: Re: [PATCH] drm: bridge: DRM_SIL_SII8620 should depend on, not
 select INPUT
From: Andrzej Hajda <a.hajda@samsung.com>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>
Message-ID: <d01a9ad5-edcd-81ec-6528-9b6a4e9a8754@samsung.com>
Date: Mon, 1 Jul 2019 11:26:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a7edece4-fec4-5811-27a9-ca6c275a4c40@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djPc7pHLkrGGnx4z2px5et7NotJ9yew
 WHROXMJucfPTN1aLy7vmsFm8vTOdxeLFvbdMDuwesztmsnpsXqHlMaVTwuN+93Emj74tqxg9
 Pm+SC2CL4rJJSc3JLEst0rdL4MpYcPYmS8FJvoonr18yNTCe5u5i5OSQEDCReNrzjKWLkYtD
 SGAFo8SPQ1uZIZwvjBKNF29BZT4zSjx89ZMVpuXu01VMILaQwHJGiXvvyiHst4wSv/tNQWxh
 gTCJcw1HwWrYBDQl/m6+yQYySERgO6PEjkUf2UEcZoFZjBLL+kCWc3LwCthJ3Diykg3EZhFQ
 kWhYfRxsm6hAhMTlLbsYIWoEJU7OfAJWzylgL7Fi636wemYBeYntb+cwQ9jiEreezGcCWSAh
 sItdYueZO4wQZ7tILG1aCfWCsMSr41vYIWwZidOTe1gg7HqJ+ytamCGaOxgltm7YyQyRsJY4
 fPwiUDMH0AZNifW79CHCjhI/T/1jBwlLCPBJ3HgrCHEDn8SkbdOZIcK8Eh1tQhDVihL3z26F
 GigusfTCV7YJjEqzkHw2C8k3s5B8Mwth7wJGllWM4qmlxbnpqcWGeanlesWJucWleel6yfm5
 mxiBqej0v+OfdjB+vZR0iFGAg1GJh7fhjkSsEGtiWXFl7iFGCQ5mJRHe/SskY4V4UxIrq1KL
 8uOLSnNSiw8xSnOwKInzVjM8iBYSSE8sSc1OTS1ILYLJMnFwSjUwNj5Ss20vvmR2JMt5ctWZ
 Iv83AYc5j7bM+tkmkqAwdd68q3p9rfJLA3Jyk/e0potJWLTr3Dhq47xnUvD/JBPVA9Y2KxNf
 Sx8/V8f/Vnm5/GPZ9FsnWFgcXD4FBhoYlTQF7+abectl/gYvdRHuHnnLastIxnXv/9ue6U3o
 21qne66VSfmhW5oSS3FGoqEWc1FxIgC5yQEMQQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsVy+t/xe7qHL0rGGuz8ImRx5et7NotJ9yew
 WHROXMJucfPTN1aLy7vmsFm8vTOdxeLFvbdMDuwesztmsnpsXqHlMaVTwuN+93Emj74tqxg9
 Pm+SC2CL0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL
 0MtYcPYmS8FJvoonr18yNTCe5u5i5OSQEDCRuPt0FVMXIxeHkMBSRom+5Y9ZIRLiErvnv2WG
 sIUl/lzrYoMoes0osWD7Z/YuRg4OYYEwidYnRSA1bAKaEn833wSrERHYySjxvW8l2FRmgVmM
 Epdaj7GCNAgJnGSU2KEG0sArYCdx48hKNhCbRUBFomH1cbDFogIREn1ts9kgagQlTs58wgJi
 cwrYS6zYuh8sziygLvFn3iVmCFteYvvbOVC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnF
 KJJaWpybnltspFecmFtcmpeul5yfu4kRGHvbjv3csoOx613wIUYBDkYlHl6NWxKxQqyJZcWV
 uYcYJTiYlUR496+QjBXiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGBayCuJNzQ1NLewNDQ3
 Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwBidWtOYIWo0Y6Hel6LetbK6RdOaTc+K
 rXvuvNGOM2SVx+bG1257v75iPH9n6SKFpJO+SeafuO8ZNHLOZdz8aebjI/73FbzFBXvtbYLs
 z9Zkcch07pY69s4wPeeLzt6sV+paa53e6O6+vF7lpzLHde7vwttTuHmM+1d6vYt/s2XS6jPF
 8XkNUkosxRmJhlrMRcWJANmi8rXTAgAA
X-CMS-MailID: 20190701092627eucas1p147af4474d3a5350784ed8477a42f4f5c
X-Msg-Generator: CA
X-RootMTR: 20190701033927epcas2p2d7d0b611a0d32b7b208acc787069a83a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190701033927epcas2p2d7d0b611a0d32b7b208acc787069a83a
References: <CGME20190701033927epcas2p2d7d0b611a0d32b7b208acc787069a83a@epcas2p2.samsung.com>
 <8baa25c0-498b-d321-4e6a-fe987a4989ba@infradead.org>
 <a7edece4-fec4-5811-27a9-ca6c275a4c40@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561973189;
 bh=bbuHUVPOwiuUpoBROT6LArd3Pa2i2I3orwf6k/+JiqU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=U73ox6N5luo+qrayfNz0hn1fnxVLDucxbXczGxLMYfOUmnPcCnCiG14X+eJg5/AUN
 Vpj8R3vEaRiRYE9OYiDnThx4yHYy2Q3WC1k7EMJnUZbTbk6caXSFK+D8hJjSzFHHgD
 UNVZvZUNsV0goe9LywT6pMj5etSjsvVMQxQFLZOc=
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEuMDcuMjAxOSAxMToyMywgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBPbiAwMS4wNy4yMDE5
IDA1OjM5LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+IEZyb206IFJhbmR5IER1bmxhcCA8cmR1bmxh
cEBpbmZyYWRlYWQub3JnPgo+Pgo+PiBBIHNpbmdsZSBkcml2ZXIgc2hvdWxkIG5vdCBlbmFibGUg
KHNlbGVjdCkgYW4gZW50aXJlIHN1YnN5c3RlbSwKPj4gc3VjaCBhcyBJTlBVVCwgc28gY2hhbmdl
IHRoZSAnc2VsZWN0JyB0byAiZGVwZW5kcyBvbiIuCj4+Cj4+IEZpeGVzOiBkNmFiZTZkZjcwNmMg
KCJkcm0vYnJpZGdlOiBzaWxfc2lpODYyMDogZG8gbm90IGhhdmUgYSBkZXBlbmRlbmN5IG9mIFJD
X0NPUkUiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFk
ZWFkLm9yZz4KPj4gQ2M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPj4gQ2M6IEFu
ZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4+IENjOiBMYXVyZW50IFBpbmNoYXJ0
IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4+IC0tLQo+PiBMaW51cyBoYXMgd3JpdHRlbiB0aGlzIGEgY291
cGxlIG9mIHRpbWVzIGluIHRoZSBsYXN0IDE1IHllYXJzIG9yIHNvLAo+PiBidXQgbXkgc2VhcmNo
IGZ1IGNhbm5vdCBmaW5kIGl0LiAgQW5kIHRoZXJlIGFyZSBhIGZldyBkcml2ZXJzIGluIHRoZQo+
PiBrZXJuZWwgdHJlZSB0aGF0IGRvIHRoaXMsIGJ1dCB3ZSBzaG91bGRuJ3QgYmUgYWRkaW5nIG1v
cmUgdGhhdCBkbyBzby4KPgo+IFRoZSBwcm9wZXIgc29sdXRpb24gaGFzIGJlZW4gYWxyZWFkeSBw
b3N0ZWQgWzFdLCBidXQgaXQgaGFzIG5vdCBiZWVuCj4gYXBwbGllZCB5ZXQgdG8gaW5wdXQgdHJl
ZT8KPgo+IFJhbmR5IGFyZSB0aGVyZSBjaGFuY2VzIHlvdXIgcGF0Y2hzZXQgd2lsbCBhcHBlYXIg
aW4gTUwgaW4gbmVhciBmdXR1cmUsCj4gb3Igc2hvdWxkIEkgbWVyZ2UgeW91ciBzaWk4NjIwIHBh
dGNoIGFsb25lPwoKClVwcywgSSB1c2VkIHdyb25nIHN1cm5hbWUsIEkgbWVhbnQgUm9uYWxkLCBh
ZGRlZCBoaW0gaW5wdXQgTUwgdG8gY2MuCgoKUmVnYXJkcwoKQW5kcnplagoKCgo+Cj4KPiBbMV06
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDQxOTA4MTkyNi4xMzU2Ny0yLXJv
bmFsZEBpbm5vdmF0aW9uLmNoLwo+Cj4KPiBSZWdhcmRzCj4KPiBBbmRyemVqCj4KPgo+Cj4+ICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCAgICAzICstLQo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiAtLS0gbG54LTUyLXJjNy5v
cmlnL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+PiArKysgbG54LTUyLXJjNy9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPj4gQEAgLTgzLDEwICs4Myw5IEBAIGNvbmZpZyBE
Uk1fUEFSQURFX1BTODYyMgo+PiAgCj4+ICBjb25maWcgRFJNX1NJTF9TSUk4NjIwCj4+ICAJdHJp
c3RhdGUgIlNpbGljb24gSW1hZ2UgU0lJODYyMCBIRE1JL01ITCBicmlkZ2UiCj4+IC0JZGVwZW5k
cyBvbiBPRgo+PiArCWRlcGVuZHMgb24gT0YgJiYgSU5QVVQKPj4gIAlzZWxlY3QgRFJNX0tNU19I
RUxQRVIKPj4gIAlpbXBseSBFWFRDT04KPj4gLQlzZWxlY3QgSU5QVVQKPj4gIAlzZWxlY3QgUkNf
Q09SRQo+PiAgCWhlbHAKPj4gIAkgIFNpbGljb24gSW1hZ2UgU0lJODYyMCBIRE1JL01ITCBicmlk
Z2UgY2hpcCBkcml2ZXIuCj4+Cj4+Cj4+Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
