Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 618411ECD1C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 12:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7942489CDD;
	Wed,  3 Jun 2020 10:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AA489CDD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 10:04:37 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200603100435euoutp016f0e3ecbcb1725fa399bbc888f9e863d~VAJMzjENP1104211042euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 10:04:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200603100435euoutp016f0e3ecbcb1725fa399bbc888f9e863d~VAJMzjENP1104211042euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591178675;
 bh=bTtM3f6fJX0XJc/AZMw05HmVFiL4CAKhheZtdCnnwh8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=H9LoR8cELPQFLsaQxOF1BohOqHriYmVxte5mZyAkPqUFTsZQ/LVHKdpHy7NsADtvf
 NYUdv6hTzabKDdVExzSut749iXbIDKi6gLtEcCKUtzceyQwZnTjCRH10fp5sIFuUkf
 dlvXe2UNSFGrhlkSmBM86fkIrfsIrf9lSBa73VXA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200603100435eucas1p1678fb1d5d07ee79cde2a655b455467d8~VAJMd8_Ld2261522615eucas1p12;
 Wed,  3 Jun 2020 10:04:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5D.BA.61286.3B577DE5; Wed,  3
 Jun 2020 11:04:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200603100434eucas1p1adcbd0786f417dbe86e3f5296eedecf3~VAJMF5ZGo2257822578eucas1p1Q;
 Wed,  3 Jun 2020 10:04:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200603100434eusmtrp112543989f7bbf9339d7e28d73749744c~VAJMFBNEg1896818968eusmtrp1R;
 Wed,  3 Jun 2020 10:04:34 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-e1-5ed775b36a28
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id EF.F3.08375.2B577DE5; Wed,  3
 Jun 2020 11:04:34 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200603100433eusmtip1e3bc175fe1d9024663c6fe0adc6454b9~VAJLMA65s1744617446eusmtip1w;
 Wed,  3 Jun 2020 10:04:33 +0000 (GMT)
Subject: Re: [RFC PATCH v5 6/6] drm: exynos: mixer: Add interconnect support
To: Chanwoo Choi <cw00.choi@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <bc921707-2623-b868-023c-1a0b759bc7c6@samsung.com>
Date: Wed, 3 Jun 2020 12:04:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <7e42706f-2e69-79a6-d138-f2aa5e800270@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0iTYRTGeb/bPqXZ67Q8aBkNowvkpRl8UJlFySSpQX90Aa2VH85yGpvO
 lChFylxqoshy3YZpykK0aVZaBmItUZulTilroEJ5KfNWZJRt+5T873fOeR7Oc15elpR00f5s
 YnIqr0lWJkkZT6rx1a83W+vT+uNCm9ppznHnMuIe3qiluf7ZzzTXOzfJcIbnFoYrdhRRnM1W
 J+Isw3aa62m6xXA3bC0EV9P2UcR9yK52liWjTKRYbjHnMfJB+zNG7rhmJeT1FZfkhQ1mJJ+x
 BCqY45474/mkRB2vCYk46aka/7bxXCWcz7M9JbJQu48eebCAw6FZ/wK5WIKrEVypidQjTyfP
 Iuivm2WEYgbBhKOXXnK0lXfTwqAKwcz9Z6RQTCH4aR4SuVQ+OAaGO+2ki33xJij704tcIhLb
 CJjI1hOuAYPDoOBloXu5GEdAd2m220DhIBgYz3PzKhwL+Y4xUtB4Q3vZCOViD7wbTA8c7kgk
 9oP3I3cJgddBzqOb7kSAh0RgmTcSQu598Li5GQnsA2PWBpHAa6CjJJ8SDDkI8ps/iISiCIHD
 alp07IDBN/PO52CdKzZDbVOI0N4DPdcLaFcbsBcMfPUWQnhBcaOBFNpiuHpFIqiD4LfZsBjH
 H66NLFBFSGpcdppx2TnGZecY/+81IcqM/Pg0rTqB14Yl8+nBWqVam5acEHw6RW1Bzk/W8dc6
 /QTNvTvVijCLpCvEoWH2OAmt1Gkz1K0IWFLqK97b1REnEccrMzJ5TcoJTVoSr21FASwl9RPL
 ykdjJThBmcqf5flzvGZpSrAe/lnIlBsef+aQY6S6St+3Jnd/YJ7lYkxL39FCPCH7nllq0BVE
 k8wfBbUr5gI5R4xFh0xGFb82SRXret9W163foZI91UV0fuEP3yYVAfGrV05VFatGDwxGHVOl
 r/0U9EOWWJOqk8b6V35jc+x75u8tnKnYFot/H9zeuSHziDfVPTldKaW0KmXYFlKjVf4DwDNq
 IGADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsVy+t/xu7qbSq/HGczerWdxf14ro8XGGetZ
 La5/ec5qceXrezaL6Xs3sVlMuj+BxeL8+Q3sFpseX2O1uLxrDpvFjPP7mCzWHrnLbnG7cQWQ
 O/klmwOvx6ZVnWwed67tYfO4332cyWPzknqPvi2rGD0+b5ILYIvSsynKLy1JVcjILy6xVYo2
 tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy3j9Tr1gqURF5/mdTA2MJ4W7GDk5
 JARMJI4susDaxcjFISSwlFFi+umvzF2MHEAJKYn5LUoQNcISf651sUHUvGeUWH63mwUkISzg
 I/H4zDVmEFtEQENi5t8rjCA2s8B5Jok3TTwQDd8YJWa9WwJWxCZgKNF7tA+siFfATuLC1Eaw
 OIuAisSN151gtqhArET34h/sEDWCEidnPgFbxilgL7Fg9X1WiAXqEn/mXWKGsMUlbj2ZzwRh
 y0s0b53NPIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwLjd
 duzn5h2MlzYGH2IU4GBU4uE1MLwWJ8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc
 1OJDjKZAz01klhJNzgemlLySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1M
 HJxSDYzsXgl/jM5bs/AVnnhnbMT/6FETl/aqlRyL1otOu7+llecGY+vv4rVspqcmRZ9zTIsK
 2KYx/XD8hXKZ3O9XWC33d55j5k6clPrp2fQOiZbw8Gf7r4d3i4odfceVc6k7ry5BYMKXAwu7
 tbkD550wlffakR3zS/IGk0nKAnsNMQHTUKEiodV3fimxFGckGmoxFxUnAgAvxdln8QIAAA==
X-CMS-MailID: 20200603100434eucas1p1adcbd0786f417dbe86e3f5296eedecf3
X-Msg-Generator: CA
X-RootMTR: 20200529163229eucas1p2ee6394f184e5eba12599559f8a621fde
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200529163229eucas1p2ee6394f184e5eba12599559f8a621fde
References: <20200529163200.18031-1-s.nawrocki@samsung.com>
 <CGME20200529163229eucas1p2ee6394f184e5eba12599559f8a621fde@eucas1p2.samsung.com>
 <20200529163200.18031-7-s.nawrocki@samsung.com>
 <7e42706f-2e69-79a6-d138-f2aa5e800270@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
 sw0312.kim@samsung.com, a.swigon@samsung.com, krzk@kernel.org,
 linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hhbndvbywKCk9uIDAxLjA2LjIwMjAgMDk6NTgsIENoYW53b28gQ2hvaSB3cm90ZToKPiBP
biA1LzMwLzIwIDE6MzIgQU0sIFN5bHdlc3RlciBOYXdyb2NraSB3cm90ZToKPj4gRnJvbTogTWFy
ZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+Pgo+PiBUaGlzIHBhdGNo
IGFkZHMgaW50ZXJjb25uZWN0IHN1cHBvcnQgdG8gZXh5bm9zLW1peGVyLiBUaGUgbWl4ZXIgd29y
a3MKPj4gdGhlIHNhbWUgYXMgYmVmb3JlIHdoZW4gQ09ORklHX0lOVEVSQ09OTkVDVCBpcyAnbicu
Cj4+Cj4+IEZvciBwcm9wZXIgb3BlcmF0aW9uIG9mIHRoZSB2aWRlbyBtaXhlciBibG9jayB3ZSBu
ZWVkIHRvIGVuc3VyZSB0aGUKPj4gaW50ZXJjb25uZWN0IGJ1c3NlcyBsaWtlIERNQyBvciBMRUZU
QlVTIHByb3ZpZGUgZW5vdWdoIGJhbmR3aWR0aCBzbwo+PiBhcyB0byBhdm9pZCBETUEgYnVmZmVy
IHVuZGVycnVucyBpbiB0aGUgbWl4ZXIgYmxvY2suIGkuZSB3ZSBuZWVkIHRvCj4+IHByZXZlbnQg
dGhvc2UgYnVzc2VzIGZyb20gb3BlcmF0aW5nIGluIGxvdyBwZXJmb21hbmNlIE9QUHMgd2hlbgo+
PiB0aGUgbWl4ZXIgaXMgcnVubmluZy4KPj4gSW4gdGhpcyBwYXRjaCB0aGUgYnVzIGJhbmR3aWR0
aCByZXF1ZXN0IGlzIGRvbmUgdGhyb3VnaCB0aGUgaW50ZXJjb25uZWN0Cj4+IEFQSSwgdGhlIGJh
bmRpd2lkdGggdmFsdWUgaXMgY2FsY3VsYXRlZCBmcm9tIHNlbGVjdGVkIERSTSBtb2RlLCBpLmUu
Cj4+IHZpZGVvIHBsYW5lIHdpZHRoLCBoZWlnaHQsIHJlZnJlc2ggcmF0ZSBhbmQgcGl4ZWwgZm9y
bWF0Lgo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1z
dW5nLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tp
QHNhbXN1bmcuY29tPgo+PiBbcy5uYXdyb2NraTogcmVuYW1lZCBzb2NfcGF0aCB2YXJpYWJsZSB0
byBpY2NfcGF0aCwgZWRpdGVkIGNvbW1pdCBkZXNjLl0KPj4gU2lnbmVkLW9mZi1ieTogU3lsd2Vz
dGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgoKPj4gIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX21peGVyLmMgfCA3MyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCiAgCj4+ICtzdGF0aWMgdm9pZCBtaXhlcl9zZXRfbWVtb3J5X2JhbmR3aWR0aChzdHJ1Y3Qg
ZXh5bm9zX2RybV9jcnRjICpjcnRjKQo+PiArewo+PiArCXN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICptb2RlID0gJmNydGMtPmJhc2Uuc3RhdGUtPmFkanVzdGVkX21vZGU7Cj4+ICsJc3RydWN0IG1p
eGVyX2NvbnRleHQgKmN0eCA9IGNydGMtPmN0eDsKPj4gKwl1bnNpZ25lZCBsb25nIGJ3LCBiYW5k
d2lkdGggPSAwOwo+PiArCXUzMiBhdmdfYncsIHBlYWtfYnc7Cj4+ICsJaW50IGksIGosIHN1YjsK
Pj4gKwo+PiArCWlmICghY3R4LT5pY2NfcGF0aCkKPj4gKwkJcmV0dXJuOwo+PiArCj4+ICsJZm9y
IChpID0gMDsgaSA8IE1JWEVSX1dJTl9OUjsgaSsrKSB7Cj4+ICsJCXN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lID0gJmN0eC0+cGxhbmVzW2ldLmJhc2U7Cj4+ICsJCWNvbnN0IHN0cnVjdCBkcm1fZm9y
bWF0X2luZm8gKmZvcm1hdDsKPj4gKwo+PiArCQlpZiAocGxhbmUtPnN0YXRlICYmIHBsYW5lLT5z
dGF0ZS0+Y3J0YyAmJiBwbGFuZS0+c3RhdGUtPmZiKSB7Cj4+ICsJCQlmb3JtYXQgPSBwbGFuZS0+
c3RhdGUtPmZiLT5mb3JtYXQ7Cj4+ICsJCQlidyA9IG1vZGUtPmhkaXNwbGF5ICogbW9kZS0+dmRp
c3BsYXkgKgo+PiArCQkJCQkJCWRybV9tb2RlX3ZyZWZyZXNoKG1vZGUpOwo+PiArCQkJaWYgKG1v
ZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19JTlRFUkxBQ0UpCj4+ICsJCQkJYncgLz0gMjsKPj4g
KwkJCWZvciAoaiA9IDA7IGogPCBmb3JtYXQtPm51bV9wbGFuZXM7IGorKykgewo+PiArCQkJCXN1
YiA9IGogPyAoZm9ybWF0LT52c3ViICogZm9ybWF0LT5oc3ViKSA6IDE7Cj4+ICsJCQkJYmFuZHdp
ZHRoICs9IGZvcm1hdC0+Y3BwW2pdICogYncgLyBzdWI7Cj4gCj4gRmlyc3Qgb2YgYWxsLCBJIGFn
cmVlIHRoaXMgYXBwcm9hY2guCj4gCj4gQ291bGQgeW91IHBsZWFzZSBhZGQgbW9yZSBkZXRhaWxl
ZCBjb21tZW50cyBmb3IgdW5kZXJzdGFkbmluZwo+IGFib3V0IHRoaXMgY2FsY3VsYXRpb24/IEFz
IHlvdSBjb21tZW50ZWQsIGl0IHNlZW1zIHRoYXQKPiB0aGUgZmluYWwgYmFuZHdpZHRoIGNvbnRh
aW5zIHRoZSB3aWR0aC9oZWlnaHQvcmVmcmVzaCByYXRlCj4gYW5kIHBpeGVsIGZvcm1hdC4gSWYg
eW91IGFkZCBvbmUgcmVhbCBleGFtcGxlLCBpdCB3aWxsIGJlIHZlcnkgaGVscGZ1bC4KCk9LLCBJ
IHdpbGwgaW1wcm92ZSB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIGFkZCBhIGNvbW1lbnQgdG8gdGhl
IGZ1bmN0aW9uLgpBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoaXMgc2ltcGx5IGNhbGN1bGF0ZXMg
YW1vdW50IG9mIGRhdGEgaW4gYnl0ZXMgdGhhdApuZWVkcyB0byBiZSByZWFkIGZyb20gdGhlIHN5
c3RlbSBtZW1vcnkgcGVyIHNlY29uZCBmb3IgZ2l2ZW4gdmlkZW8gc3RyZWFtLApieSBzdW1taW5n
IHZhbHVlcyBmb3IgZWFjaCBtaXhlciB3aW5kb3cgYW5kIGZvciBlYWNoIGNvbG9yIHBsYW5lIHdp
dGhpbiAKYSB3aW5kb3cuCgpBbnl3YXksIHRoZSBwYXRjaCB3aWxsIHRvIGJlIGNoYW5nZWQgYXMg
YWZ0ZXIgc29tZSBtb3JlIHRlc3RzIGl0IHNlZW1zCnRoZSBjYWxjdWxhdGlvbiB3b3JrcyBmb3Ig
TEVGVEJVUyBidXQgRE1DIGNsb2NrIG9uIE9kcm9pZCBVMyBuZWVkcyB0bwpiZSBzZXQgdG8gNDAw
IE1IeiwgcmF0aGVyIHRoYW4gdG8gYXQgbGVhc3QgMTYwIE1Iei4gV2l0aCBhbnkgbG93ZXIgdmFs
dWUgCnRoZSBtaXhlciB1bmRlcmZsb3cgZXJyb3IgaW50ZXJydXB0cyBhcmUgYmVpbmcgdHJpZ2dl
cmVkIGFuZCBldmVudHVhbGx5IAp0aGUgSU9NTVUgcGFnZSBmYXVsdCBvY2N1cnMuCgotLQpSZWdh
cmRzLApTeWx3ZXN0ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
