Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B454311FFCF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8306E456;
	Mon, 16 Dec 2019 08:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2306E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:48:39 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20191216004837epoutp026d23363109ef4a0e5cc95ed4954a2fca~gs5PxwhJ61572215722epoutp022
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:48:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20191216004837epoutp026d23363109ef4a0e5cc95ed4954a2fca~gs5PxwhJ61572215722epoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576457317;
 bh=U46RYH5Ir7QePRkd4DNR6PbEF9ch+pNSpdpoJ6yOfuE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=o6hbFN8P404aMsrvvqJ21NQYP1saniqafyu0Vn8Q48N8XOiFVNpwTOE2XHQK8XTQA
 WeRtQnlanhkNL9BQRwgEyzThnG3sA9cPzVtg2zu1RRd9666OcgAhcxxCqon562mAut
 1gEXOYnlHn/k6/BSXuqqqqXPxboBGuayW5AXBriQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20191216004837epcas1p3a5b08c2345a9838ff368c8bad1a59d72~gs5Pg2yDF0412704127epcas1p39;
 Mon, 16 Dec 2019 00:48:37 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.154]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 47bjLn4yGbzMqYkd; Mon, 16 Dec
 2019 00:48:33 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 6E.1A.51241.164D6FD5; Mon, 16 Dec 2019 09:48:33 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191216004833epcas1p1b594c5fdd00b683c18babd188fb563c3~gs5LxveXl0983709837epcas1p1p;
 Mon, 16 Dec 2019 00:48:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191216004833epsmtrp16d3a93010cb15881b0164c12e4bcf7f5~gs5Lw39_o2216622166epsmtrp13;
 Mon, 16 Dec 2019 00:48:33 +0000 (GMT)
X-AuditID: b6c32a39-5bab39c00001c829-40-5df6d46123e3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 05.F8.10238.164D6FD5; Mon, 16 Dec 2019 09:48:33 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191216004832epsmtip20cbc07c0bc599c8bbc98b5d37a351388~gs5Lay3th2795527955epsmtip2z;
 Mon, 16 Dec 2019 00:48:32 +0000 (GMT)
Subject: Re: [RFC PATCH v2 08/11] arm: dts: exynos: Add parents and
 #interconnect-cells to Exynos4412
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <f0453b39-fd05-9824-ee24-39b6bd587876@samsung.com>
Date: Mon, 16 Dec 2019 09:55:08 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20190919142236.4071-9-a.swigon@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOJsWRmVeSWpSXmKPExsWy7bCmvm7ilW+xBjtOaljcn9fKaLFxxnpW
 i/lHzrFaXPn6ns1i+t5NbBaT7k9gsTh/fgO7xYq7H1ktNj2+xmpxedccNovPvUcYLWac38dk
 sfbIXXaL240r2CxmTH7J5sDvsWlVJ5vHnWt72Dzudx9n8ti8pN5j47sdTB59W1YxenzeJBfA
 HpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0t5JC
 WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLJArzgxt7g0L10vOT/XytDAwMgUqDAh
 O+Pem/NsBVPkKu4t287ewLhYvIuRk0NCwERixYZHLF2MXBxCAjsYJb6dmcsI4XxilFjVdZoR
 pEpI4BujRMfhSpiOP4v/MkMU7WWUWHfnAiuE855Ron36E2aQKmGBdInrnZ+YQBIiAv8ZJU4v
 WwlWxSxwjFFi752fLCBVbAJaEvtf3GADsfkFFCWu/ngMto9XwE5i28tf7CA2i4CqxMmPJ8Cm
 igqESZzc1gJVIyhxcuYToDkcHJwClhKds/VBwswC4hK3nsxngrDlJZq3zgY7VUJgH7vErf/H
 2CB+cJFYPnkfE4QtLPHq+BZ2CFtK4mV/G5RdLbHy5BE2iOYORokt+0H+BEkYS+xfOpkJZDGz
 gKbE+l36EGFFiZ2/5zJCLOaTePe1hxWkREKAV6KjTQiiRFni8oO7UGslJRa3d7JNYFSaheSb
 WUhemIXkhVkIyxYwsqxiFEstKM5NTy02LDBFju5NjOBErWW5g/HYOZ9DjAIcjEo8vA7Z32KF
 WBPLiitzDzFKcDArifCman+OFeJNSaysSi3Kjy8qzUktPsRoCgzsicxSosn5wCySVxJvaGpk
 bGxsYWJoZmpoqCTOy/HjYqyQQHpiSWp2ampBahFMHxMHp1QDY7oVW/ESuamLD1W8s1Wz+9mb
 WOn1wvDhzbN26vFuv83UhXuirzdvdnWvvLGtaoHqxIW+VS82FJ3L+LNQvdpNhMXPLmJuWCbj
 xXVrZPuqbsa8N090z9Q3ub3yxtK4m4c+79JY4r5zeXlqydHKJTc+rk1hrb+4TJQj0bX1+P6W
 HS36JtN+nj56RomlOCPRUIu5qDgRAMnSFTfqAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsWy7bCSvG7ilW+xBv0X2C3uz2tltNg4Yz2r
 xfwj51gtrnx9z2Yxfe8mNotJ9yewWJw/v4HdYsXdj6wWmx5fY7W4vGsOm8Xn3iOMFjPO72Oy
 WHvkLrvF7cYVbBYzJr9kc+D32LSqk83jzrU9bB73u48zeWxeUu+x8d0OJo++LasYPT5vkgtg
 j+KySUnNySxLLdK3S+DKuPfmPFvBFLmKe8u2szcwLhbvYuTkkBAwkfiz+C9zFyMXh5DAbkaJ
 Z2+/skEkJCWmXTwKlOAAsoUlDh8uhqh5yyhxZmoLM0iNsEC6xPXOT0wgCRGB/4wSD9uOMYI4
 zALHGCU+rljPCjd2wdGHTCAtbAJaEvtf3ABbwS+gKHH1x2NGEJtXwE5i28tf7CA2i4CqxMmP
 J8BWiAqESexc8pgJokZQ4uTMJywgJ3EKWEp0ztYHCTMLqEv8mXeJGcIWl7j1ZD4ThC0v0bx1
 NvMERuFZSLpnIWmZhaRlFpKWBYwsqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgmNW
 S3MH4+Ul8YcYBTgYlXh4HbK/xQqxJpYVV+YeYpTgYFYS4U3V/hwrxJuSWFmVWpQfX1Sak1p8
 iFGag0VJnPdp3rFIIYH0xJLU7NTUgtQimCwTB6dUA6PTy5WLC+Pad8o6vjxarV8dEdJ2Y8fC
 WuOpE9gZb664ZHDC71f5hs9rb9TNKo+YbKuy6XWm9I4/3h3n+AvPdXh8KuXQ/aoxmzn2j4T4
 62eii6+6q/ttf/x8VUjozbcXzk0/lah/hqPjnI9hiPkjxon58SURysm7Fl/SFZrDYrRXloll
 783lCiZKLMUZiYZazEXFiQDggDtC1QIAAA==
X-CMS-MailID: 20191216004833epcas1p1b594c5fdd00b683c18babd188fb563c3
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190919142329eucas1p299762f99dd55a5d625633ceec84219f9
References: <20190919142236.4071-1-a.swigon@samsung.com>
 <CGME20190919142329eucas1p299762f99dd55a5d625633ceec84219f9@eucas1p2.samsung.com>
 <20190919142236.4071-9-a.swigon@samsung.com>
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
 myungjoo.ham@samsung.com, leonard.crestez@nxp.com, georgi.djakov@linaro.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA5LzE5LzE5IDExOjIyIFBNLCBBcnR1ciDFmndpZ2/FhCB3cm90ZToKPiBGcm9tOiBB
cnR1ciDFmndpZ2/FhCA8YS5zd2lnb25AcGFydG5lci5zYW1zdW5nLmNvbT4KPiAKPiBUaGlzIHBh
dGNoIGFkZHMgdHdvIGZpZWxkcyB0byB0aGUgRXh5bm9zNDQxMiBEVFM6Cj4gICAtIHBhcmVudDog
dG8gZGVjbGFyZSBjb25uZWN0aW9ucyBiZXR3ZWVuIG5vZGVzIHRoYXQgYXJlIG5vdCBpbiBhCj4g
ICAgIHBhcmVudC1jaGlsZCByZWxhdGlvbiBpbiBkZXZmcmVxOwo+ICAgLSAjaW50ZXJjb25uZWN0
LWNlbGxzOiByZXF1aXJlZCBieSB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29yay4KPiAKPiBQbGVh
c2Ugbm90ZSB0aGF0ICNpbnRlcmNvbm5lY3QtY2VsbHMgaXMgYWx3YXlzIHplcm8gYW5kIG5vZGUg
SURzIGFyZSBub3QKPiBoYXJkY29kZWQgYW55d2hlcmUuIFRoZSBhYm92ZS1tZW50aW9uZWQgcGFy
ZW50LWNoaWxkIHJlbGF0aW9uIGluIGRldmZyZXEKPiBtZWFucyB0aGF0IHRoZXJlIGlzIGEgc2hh
cmVkIHBvd2VyIGxpbmUgKCdkZXZmcmVxJyBwcm9wZXJ0eSkuIFRoZSAncGFyZW50Jwo+IHByb3Bl
cnR5IG9ubHkgc2lnbmlmaWVzIGFuIGludGVyY29ubmVjdCBjb25uZWN0aW9uLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBwYXJ0bmVyLnNhbXN1bmcuY29tPgo+
IC0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaSB8
IDEgKwo+ICBhcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kgICAgICAgICAgICAgICB8
IDkgKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTItb2Ryb2lkLWNvbW1vbi5kdHNpCj4gaW5k
ZXggZWE1NWYzNzdkMTdjLi5iZGQ2MWFlODYxMDMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290
L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaQo+IEBAIC0xMDYsNiArMTA2LDcgQEAK
PiAgJmJ1c19sZWZ0YnVzIHsKPiAgCWRldmZyZXEtZXZlbnRzID0gPCZwcG11X2xlZnRidXNfMz4s
IDwmcHBtdV9yaWdodGJ1c18zPjsKPiAgCXZkZC1zdXBwbHkgPSA8JmJ1Y2szX3JlZz47Cj4gKwlw
YXJlbnQgPSA8JmJ1c19kbWM+OwoKQXMgSSBtZW50aW9uZWQgb24gb3RoZXIgcGF0Y2gsCkknbSBu
b3Qgc3VyZSB0byB1c2UgJ3BhcmVudCcgcHJvcGVydHkgZm9yIHRoaXMgZHJpdmVyLgpJZiBwb3Nz
aWJsZSwgd2UgYmV0dGVyIHRvIHVzZSB0aGUgc3RhbmRhcmQgd2F5IGxpa2UgT0YgZ3JhcGgKaW4g
b3JkZXIgdG8gbWFrZSB0aGUgdHJlZSBiZXR3ZWVuIGJ1c2VzLiBFeGNlcHQgZm9yIG1ha2luZwp0
aGUgY29ubmVjdGlvbiBiZXR3ZWVuIHRoZSBidXNlcyB3aXRoICdwYXJlbnQnLCBsb29rcyBnb29k
IHRvIG1lLgoKPiAgCXN0YXR1cyA9ICJva2F5IjsKPiAgfTsKPiAgCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5v
czQ0MTIuZHRzaQo+IGluZGV4IGQyMGRiMmRmZThlMi4uYTcwYTY3MWFjYWNkIDEwMDY0NAo+IC0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2V4eW5vczQ0MTIuZHRzaQo+IEBAIC0zOTAsNiArMzkwLDcgQEAKPiAgCQkJY2xvY2tz
ID0gPCZjbG9jayBDTEtfRElWX0RNQz47Cj4gIAkJCWNsb2NrLW5hbWVzID0gImJ1cyI7Cj4gIAkJ
CW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19kbWNfb3BwX3RhYmxlPjsKPiArCQkJI2ludGVy
Y29ubmVjdC1jZWxscyA9IDwwPjsKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCQl9Owo+
ICAKPiBAQCAtMzk4LDYgKzM5OSw3IEBACj4gIAkJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX0RJVl9B
Q1A+Owo+ICAJCQljbG9jay1uYW1lcyA9ICJidXMiOwo+ICAJCQlvcGVyYXRpbmctcG9pbnRzLXYy
ID0gPCZidXNfYWNwX29wcF90YWJsZT47Cj4gKwkJCSNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47
Cj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gIAkJfTsKPiAgCj4gQEAgLTQwNiw2ICs0MDgs
NyBAQAo+ICAJCQljbG9ja3MgPSA8JmNsb2NrIENMS19ESVZfQzJDPjsKPiAgCQkJY2xvY2stbmFt
ZXMgPSAiYnVzIjsKPiAgCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX2RtY19vcHBfdGFi
bGU+Owo+ICsJCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+ICAJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwo+ICAJCX07Cj4gIAo+IEBAIC00NTksNiArNDYyLDcgQEAKPiAgCQkJY2xvY2tzID0g
PCZjbG9jayBDTEtfRElWX0dETD47Cj4gIAkJCWNsb2NrLW5hbWVzID0gImJ1cyI7Cj4gIAkJCW9w
ZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19sZWZ0YnVzX29wcF90YWJsZT47Cj4gKwkJCSNpbnRl
cmNvbm5lY3QtY2VsbHMgPSA8MD47Cj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gIAkJfTsK
PiAgCj4gQEAgLTQ2Nyw2ICs0NzEsNyBAQAo+ICAJCQljbG9ja3MgPSA8JmNsb2NrIENMS19ESVZf
R0RSPjsKPiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKPiAgCQkJb3BlcmF0aW5nLXBvaW50cy12
MiA9IDwmYnVzX2xlZnRidXNfb3BwX3RhYmxlPjsKPiArCQkJI2ludGVyY29ubmVjdC1jZWxscyA9
IDwwPjsKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCQl9Owo+ICAKPiBAQCAtNDc1LDYg
KzQ4MCw3IEBACj4gIAkJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX0FDTEsxNjA+Owo+ICAJCQljbG9j
ay1uYW1lcyA9ICJidXMiOwo+ICAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZidXNfZGlzcGxh
eV9vcHBfdGFibGU+Owo+ICsJCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+ICAJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOwo+ICAJCX07Cj4gIAo+IEBAIC00ODMsNiArNDg5LDcgQEAKPiAgCQkJ
Y2xvY2tzID0gPCZjbG9jayBDTEtfQUNMSzEzMz47Cj4gIAkJCWNsb2NrLW5hbWVzID0gImJ1cyI7
Cj4gIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19mc3lzX29wcF90YWJsZT47Cj4gKwkJ
CSNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47Cj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4g
IAkJfTsKPiAgCj4gQEAgLTQ5MSw2ICs0OTgsNyBAQAo+ICAJCQljbG9ja3MgPSA8JmNsb2NrIENM
S19BQ0xLMTAwPjsKPiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKPiAgCQkJb3BlcmF0aW5nLXBv
aW50cy12MiA9IDwmYnVzX3Blcmlfb3BwX3RhYmxlPjsKPiArCQkJI2ludGVyY29ubmVjdC1jZWxs
cyA9IDwwPjsKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCQl9Owo+ICAKPiBAQCAtNDk5
LDYgKzUwNyw3IEBACj4gIAkJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX1NDTEtfTUZDPjsKPiAgCQkJ
Y2xvY2stbmFtZXMgPSAiYnVzIjsKPiAgCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX2xl
ZnRidXNfb3BwX3RhYmxlPjsKPiArCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKPiAgCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKPiAgCQl9Owo+ICAKPiAKCgotLSAKQmVzdCBSZWdhcmRzLApD
aGFud29vIENob2kKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
