Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A4550F62
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 16:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D2C89C14;
	Mon, 24 Jun 2019 14:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D276989C14
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:59:49 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190624145948euoutp02c58246ad02b453497f20dc4ff864af9a~rKndrG81R1914019140euoutp02a
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:59:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190624145948euoutp02c58246ad02b453497f20dc4ff864af9a~rKndrG81R1914019140euoutp02a
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190624145947eucas1p2d6350d93fc3b9c664abb10971f81ba12~rKndD6_rZ1017510175eucas1p26;
 Mon, 24 Jun 2019 14:59:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0A.E9.04377.365E01D5; Mon, 24
 Jun 2019 15:59:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190624145946eucas1p28bbd4bbfe65ae48ae48576c29b573800~rKncZ2JmT1017510175eucas1p25;
 Mon, 24 Jun 2019 14:59:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190624145946eusmtrp1d36d8a9448bfc31efc875b44eebfd5f8~rKncLL3Cm1696416964eusmtrp1U;
 Mon, 24 Jun 2019 14:59:46 +0000 (GMT)
X-AuditID: cbfec7f4-5632c9c000001119-8d-5d10e5632f6b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 88.D6.04146.265E01D5; Mon, 24
 Jun 2019 15:59:46 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190624145946eusmtip2e5865bd41ee117eb9ca5ce9ad548b224~rKnbq2M1j2130521305eusmtip2R;
 Mon, 24 Jun 2019 14:59:46 +0000 (GMT)
Subject: Re: [PATCH 3/4] drm/meson: Enable DRM InfoFrame support on GXL, GXM
 and G12A
To: Jonas Karlman <jonas@kwiboo.se>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <bdc1746a-5829-9991-6f1c-d66f03c95d77@samsung.com>
Date: Mon, 24 Jun 2019 16:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <VI1PR03MB4206A326130A81DCBAA62CE8AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHfXbvtuty8jirnSw0FwkmaW8fbhRiEXUDiwzKSJfd7KKSLtlV
 y6Tyg5ZaytRMXDr9kKSr0Mx3KG2Kr4RZGZaSskyauiR8a6DZ5jXy2+/8/+c55/zhoQjFoNiD
 itEkcFoNG6uSyMj6DlvfzsjvWL1rYd6N/jg3LaGXzZNiuiTvJj2wYCHo7qkBkrbdrRXRmbmP
 pfSH5mIJPWppQbQpJ4y2mfpEdFVaQJALMz2YLmUMz1KYavNTMfMoo0jMdOnei5iRe50iZknf
 QjKt2fkk0/DJQDAzNZ6nZOdlBy9zsTFJnDYg8KIs+ofRiOKH110v69GJU9GMcxZypgDvg5re
 JWkWklEKXIHgQValSChm7cXbvFVnBsHEqxny35PCzH5CMJ4gmKpNX31iRVD9SbfS5Y5DwZKd
 LnXweqyB0iXDChNYR0LlfLCDJdgXll5+ljhYjgNh3FZGOJjE28G6+EHs4A34HMw21SChxw26
 i8ZW5jtjNSxbrBJhphc0WIsJgZXwZaxUJFw6J4WHQ4zAR6DUVo8EdoeJzlqpwFugN//+arLb
 MFKRtpIMcAaCuuomQjAOQFtnv/0gyr7AF6qaAwT5EBQMTUkdMmBXGLS6CSe4Ql59ISHIcsi4
 oxC6vWHkbd3qQCWUv5uT6JBKvyaYfk0Y/Zow+v97yxBpREoukY+L4vg9Gu6aP8/G8YmaKP/I
 q3E1yP7fev90zjai5sVLJoQppHKR/+7AaoWYTeKT40wIKEK1Xl7O2iX5ZTb5Bqe9GqFNjOV4
 E9pMkSqlPMVpNEyBo9gE7grHxXPaf66IcvZIRfqtwzjo+e8Op7apngNevNkvNLj9235bSM4m
 P4/2F0XZ1V0nma/qnwMFFSVsRnHEL7IgWU1ubD3h0m/2G23Un94bfcjbp69qUnT4zXCAJdyz
 wOdsSL3xzPhRp3Sl8sLuvlupX3KLMm8+MyfVLW/zDjyeaIx5/trdL6b5WIvREP6rVkXy0ezu
 HYSWZ/8Cj1feuWsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRmVeSWpSXmKPExsVy+t/xe7pJTwViDf63Kllc+fqezeL/o9es
 FnMn1Vpc/f6S2eLkm6ssFj/btzBZdE5cwm5xedccNosHL/czWhzqi7b4eeg8k8X6Fn0HHo/3
 N1rZPeatqfbY8Gg1q8fsjpmsHicmXGLyuN99nMnj76z9LB4HeiezeGy/No/Z4/MmuQCuKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MF6tWMRbc
 4a5YcGoCawPjZ84uRk4OCQETiemdF5m7GLk4hASWMkrs3f+YDSIhLrF7/ltmCFtY4s+1LjaI
 oteMEpdOLGAFSQgLhEu87G1lB7FFBPIkZt2eA1bELDCBRWLf3idQHc1MEndvX2QBqWIT0JT4
 u/km2ApeATuJZz8XgK1gEVCVePvnMthUUYEIidm7GlggagQlTs58AmZzCsRK/H/5FqyXWUBd
 4s+8S8wQtrzE9rdzoGxxiVtP5jNNYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hQrzgx
 t7g0L10vOT93EyMwqrcd+7l5B+OljcGHGAU4GJV4eBccEYgVYk0sK67MPcQowcGsJMK7NBEo
 xJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnAhJNXEm9oamhuYWlobmxubGahJM7bIXAwRkgg
 PbEkNTs1tSC1CKaPiYNTqoFxVlXc3XWvL1czzPGfrXKK9f5sYfms/h9VSZs2bvVzd1g06V1L
 t9aTT4zyPGcvpoe1fH64/3bCbO45eq/OKxsU1BiGTroht4pzAafY38nzdnxKs/156d7XRZwN
 KYYRmuEyy6Z5q7zwrjglf99yinqG47bmSZMkMx6L/UuvWsMremL3lTDlwC+sSizFGYmGWsxF
 xYkAEVYLOgADAAA=
X-CMS-MailID: 20190624145946eucas1p28bbd4bbfe65ae48ae48576c29b573800
X-Msg-Generator: CA
X-RootMTR: 20190526212026epcas3p3ef1bafa97e5da9dac02b26fa0a375c80
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190526212026epcas3p3ef1bafa97e5da9dac02b26fa0a375c80
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <CGME20190526212026epcas3p3ef1bafa97e5da9dac02b26fa0a375c80@epcas3p3.samsung.com>
 <VI1PR03MB4206A326130A81DCBAA62CE8AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561388388;
 bh=P2nkvwikLfmIXL8cK+4QfrKbDbmqAb86J0Ekh6clZ7o=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=BeaLFB2K+TPqXGk/H7rfK/n7urmr6kbvQ8CD8NrzcPz1W2O+rxTGURWRryC9tLQSy
 Gis/x28iD1IVT2q9Xp1ABYrnuQXoYGtpnj7POjppw9pOp/KagRSKsARnJkiyRijTt1
 MUx0qTrhHnufPJxBRjO9yWXYCv4bwsubFCbNRTeU=
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYuMDUuMjAxOSAyMzoyMCwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiBUaGlzIHBhdGNoIGVu
YWJsZXMgRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZSBvbiBHWEwsIEdYTSBh
bmQgRzEyQS4KPgo+IENjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIHwgNSArKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
d19oZG1pLmMKPiBpbmRleCBkZjNmOWRkZDIyMzQuLmY3NzYxZTY5OGMwMyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+IEBAIC05NjYsNiArOTY2LDExIEBAIHN0YXRp
YyBpbnQgbWVzb25fZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLAo+ICAJZHdfcGxhdF9kYXRhLT5pbnB1dF9idXNfZm9ybWF0ID0gTUVESUFfQlVT
X0ZNVF9ZVVY4XzFYMjQ7Cj4gIAlkd19wbGF0X2RhdGEtPmlucHV0X2J1c19lbmNvZGluZyA9IFY0
TDJfWUNCQ1JfRU5DXzcwOTsKPiAgCj4gKwlpZiAoZHdfaGRtaV9pc19jb21wYXRpYmxlKG1lc29u
X2R3X2hkbWksICJhbWxvZ2ljLG1lc29uLWd4bC1kdy1oZG1pIikgfHwKPiArCSAgICBkd19oZG1p
X2lzX2NvbXBhdGlibGUobWVzb25fZHdfaGRtaSwgImFtbG9naWMsbWVzb24tZ3htLWR3LWhkbWki
KSB8fAo+ICsJICAgIGR3X2hkbWlfaXNfY29tcGF0aWJsZShtZXNvbl9kd19oZG1pLCAiYW1sb2dp
YyxtZXNvbi1nMTJhLWR3LWhkbWkiKSkKPiArCQlkd19wbGF0X2RhdGEtPmRybV9pbmZvZnJhbWUg
PSB0cnVlOwo+ICsKCgpJIHNlZSBpdCBmb2xsb3dzIG1lc29uX2R3X2hkbWkuYyBwcmFjdGljZXMs
IGJ1dCBtYXliZSBpdCBpcyB0aW1lIHRvIGRyb3AKaXQgYW5kIGp1c3QgYWRkIGZsYWcgdG8gbWVz
b25fZHdfaGRtaV9kYXRhLCBJTU8gdGhlIHdob2xlCmR3X2hkbWlfaXNfY29tcGF0aWJsZSBmdW5j
dGlvbiBzaG91bGQgYmUgcmVtb3ZlZAoKYW5kIHJlcGxhY2VkIHdpdGggZmllbGRzL2ZsYWdzIGlu
IG1lc29uX2R3X2hkbWlfZGF0YSAtIHRoaXMgaXMgd2hhdApvZl9kZXZpY2VfaWQuZGF0YSBmaWVs
ZCB3YXMgY3JlYXRlZCBmb3IuCgoKUmVnYXJkcwoKQW5kcnplagoKCj4gIAlwbGF0Zm9ybV9zZXRf
ZHJ2ZGF0YShwZGV2LCBtZXNvbl9kd19oZG1pKTsKPiAgCj4gIAltZXNvbl9kd19oZG1pLT5oZG1p
ID0gZHdfaGRtaV9iaW5kKHBkZXYsIGVuY29kZXIsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
