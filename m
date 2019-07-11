Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587F0657B7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 15:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658EC6E231;
	Thu, 11 Jul 2019 13:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A491C6E231
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 13:11:56 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190711131155euoutp01b2b71464c2024fd692ee917f3e3146a8~wXHH1_y5V2656526565euoutp01_
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 13:11:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190711131155euoutp01b2b71464c2024fd692ee917f3e3146a8~wXHH1_y5V2656526565euoutp01_
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190711131154eucas1p1de5161ddfd5eec47f8c1ae424fd27364~wXHHPz5M22081420814eucas1p1z;
 Thu, 11 Jul 2019 13:11:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 4C.D2.04325.A95372D5; Thu, 11
 Jul 2019 14:11:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190711131153eucas1p17e1221ea0392ba004fd531a3350ebdf9~wXHGjdp6I2079720797eucas1p1f;
 Thu, 11 Jul 2019 13:11:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190711131153eusmtrp130912cf28dbd4314cb6fb6f5a0d7ef2e~wXHGVMr5c0407904079eusmtrp17;
 Thu, 11 Jul 2019 13:11:53 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-87-5d27359a9ac2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id BE.BE.04146.995372D5; Thu, 11
 Jul 2019 14:11:53 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190711131153eusmtip29d95ddab3c7a0ff71d021ba29ffaee5f~wXHF0--tu0112201122eusmtip2O;
 Thu, 11 Jul 2019 13:11:53 +0000 (GMT)
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To: Mark Brown <broonie@kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
Date: Thu, 11 Jul 2019 15:11:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190706010604.GG20625@sirena.org.uk>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFKsWRmVeSWpSXmKPExsWy7djP87qzTNVjDdZfEbHoPXeSyeL0/ncs
 FlMfPmGz+L9tIrPFla/v2Szaln9jtuicuITdYuL+s+wWl3fNYbN4vvAHswOXx95vC1g8ds66
 y+4xu2Mmq8emVZ1sHneu7WHz2P7tAavH/e7jTB6fN8kFcERx2aSk5mSWpRbp2yVwZWx+sImx
 4LBgxacb7xkbGD/wdjFyckgImEjM3T6RsYuRi0NIYAWjxJxLR1ggnC+MEpumr2CHcD4zShx8
 cw8owwHW8nSdN0R8OaPEs2OvWSGct4wSj5ZOYAKZKwxUtG7pAWYQW0TAR6Jh+n42EJtZ4C6j
 xO5N/CA2m4CmxN/NN8HivAJ2EktvLWQFsVkEVCWuL5sFZosKhEn8XNAJVSMocXLmExYQm1PA
 WKL73Vl2iJkGEkcWzWGFsOUltr+dwwxhi0vcejKfCeQ4CYF77BIn989hhHjaRaJn1WcWCFtY
 4tXxLewQtozE6ck9UPF6ifsrWpghmjsYJbZu2MkMkbCWOHz8IiuE7Six6PtiaLDwSdx4Kwix
 mE9i0rbpzBBhXomONiGIakWJ+2e3Qk0Rl1h64SvbBEalWUhem4XknVlI3pmF5J0FjCyrGMVT
 S4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAlPY6X/Hv+5g3Pcn6RCjAAejEg8vx1vVWCHWxLLi
 ytxDjBIczEoivPvclWOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ81YzPIgWEkhPLEnNTk0tSC2C
 yTJxcEo1MOp8PWf4KOaCZFL47KPXL5xsqp78n4FBNawn5NrRHe1fJybP8NntdTbn8l1Rm79i
 B0TjVl380GhY/fOflb/ofYlfBRX7tPifO6/8ynKhRK6gSNp3ipjy7oW8Um/2iG/yL/Pff/7j
 YudnVqeqJ73v2DI5hfuNpM5apaWKpV2R8/bsP+4seSR31UolluKMREMt5qLiRAAExmsjXQMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xe7ozTdVjDd78l7foPXeSyeL0/ncs
 FlMfPmGz+L9tIrPFla/v2Szaln9jtuicuITdYuL+s+wWl3fNYbN4vvAHswOXx95vC1g8ds66
 y+4xu2Mmq8emVZ1sHneu7WHz2P7tAavH/e7jTB6fN8kFcETp2RTll5akKmTkF5fYKkUbWhjp
 GVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZWx+sImx4LBgxacb7xkbGD/wdjFycEgI
 mEg8XefdxcjFISSwlFHiwPSXrF2MnEBxcYnd898yQ9jCEn+udbFBFL1mlHhy/A1YQhioed3S
 A2C2iICPRMP0/WBFzAJ3GSW2HnvHDtHxjlHi3Zx/YFVsApoSfzffZAOxeQXsJJbeWgi2jkVA
 VeL6slmsICeJCoRJHD2RB1EiKHFy5hMWEJtTwFii+91ZdhCbWUBPYsf1X6wQtrzE9rdzmCFs
 cYlbT+YzTWAUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMGK3
 Hfu5eQfjpY3BhxgFOBiVeHh/3FONFWJNLCuuzD3EKMHBrCTCu89dOVaINyWxsiq1KD++qDQn
 tfgQoynQbxOZpUST84HJJK8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8T
 B6dUA6PH9tb+B2dFJhpsypITefplxvWLm5VEThcy8FUmcLp2Jga8erTwetThFOOYTnO9RVu4
 FTxT/j4oaN24Vumq6dplpw8d7XvBbXFdxz2Jrd++55P2h+W+FY/eZE22flsqx1YSzNbDI7lW
 o+PGracCusIckg+1dY4HnLc6vnJ/go7/4hJLMZX9n5RYijMSDbWYi4oTAUQO67zuAgAA
X-CMS-MailID: 20190711131153eucas1p17e1221ea0392ba004fd531a3350ebdf9
X-Msg-Generator: CA
X-RootMTR: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
 <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
 <20190706010604.GG20625@sirena.org.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562850715;
 bh=A+nnjQatvmXOarwKNwWj8FEyKdvOWMGUijR8qmV+HFI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=LwqsOLoORbuJ84tBJs2VYFuNVS2a5pvGvqPo3CNN9l1h184spaJVDblTy3uXlzZUG
 whAekOqRXyOkIqW6GgVHnbDYoA3lV2c37jdglNYKePEpPAOIoL0OWbpMtLK2GLqKfc
 mxpLQnhIx8ZmXx6i/6uDJZcROyovPgcqVq2/Zv3Y=
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYuMDcuMjAxOSAwMzowNiwgTWFyayBCcm93biB3cm90ZToKPiBPbiBXZWQsIEp1bCAwMywg
MjAxOSBhdCAwMjo0NToxMlBNIC0wNzAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4+IEFkZCBiYXNp
YyBzdXBwb3J0IHdpdGggYSBzaW1wbGUgaW1wbGVtZW50YXRpb24gdGhhdCB1dGlsaXplcyB0aGUg
Z2VuZXJpYwo+PiByZWFkL3dyaXRlIGNvbW1hbmRzIHRvIGFsbG93IGRldmljZSByZWdpc3RlcnMg
dG8gYmUgY29uZmlndXJlZC4KPiBUaGlzIGxvb2tzIGdvb2QgdG8gbWUgYnV0IEkgcmVhbGx5IGRv
bid0IGtub3cgYW55dGhpbmcgYWJvdXQgRFNJLAo+IEknZCBhcHByZWNpYXRlIHNvbWUgcmV2aWV3
IGZyb20gb3RoZXIgcGVvcGxlIHdobyBkby4gIEkgdGFrZSBpdAo+IHRoZXJlJ3Mgc29tZSBzcGVj
IHRoaW5nIGluIERTSSB0aGF0IHNheXMgcmVnaXN0ZXJzIGFuZCBieXRlcyBtdXN0Cj4gYm90aCBi
ZSA4IGJpdD8KCgpJIGFtIGxpdHRsZSBiaXQgY29uZnVzZWQgYWJvdXQgcmVnbWFwIHVzYWdlIGhl
cmUuIE9uIHRoZSBvbmUgaGFuZCBpdApuaWNlbHkgZml0cyB0byB0aGlzIHNwZWNpZmljIGRyaXZl
ciwgcHJvYmFibHkgYmVjYXVzZSBpdCBhbHJlYWR5IHVzZXMKcmVnbWFwX2kyYy4KCk9uIHRoZSBv
dGhlciBpdCB3aWxsIGJlIHVudXNhYmxlIGZvciBhbG1vc3QgYWxsIGN1cnJlbnQgRFNJIGRyaXZl
cnMgYW5kCnByb2JhYmx5IGZvciBtb3N0IG5ldyBkcml2ZXJzLiBXaHk/CgoxLiBEU0kgcHJvdG9j
b2wgZGVmaW5lcyBhY3R1YWxseSBtb3JlIHRoYW4gMzAgdHlwZXMgb2YgdHJhbnNhY3Rpb25zWzFd
LApidXQgdGhpcyBwYXRjaHNldCBpbXBsZW1lbnRzIG9ubHkgZmV3IG9mIHRoZW0gKGRzaSBnZW5l
cmljIHdyaXRlL3JlYWQKZmFtaWx5KS4gSXMgaXQgcG9zc2libGUgdG8gaW1wbGVtZW50IG11bHRp
cGxlIHR5cGVzIG9mIHRyYW5zYWN0aW9ucyBpbgpyZWdtYXA/CgoyLiBUaGVyZSBpcyBhbHJlYWR5
IHNvbWUgc2V0IG9mIGhlbHBlcnMgd2hpY2ggdXNlcyBkc2kgYnVzLCByZXdyaXRpbmcgaXQKb24g
cmVnbWFwIGlzIHBvc3NpYmxlIG9yIGRyaXZlciBjb3VsZCB1c2Ugb2YgcmVnbWFwIGFuZCBkaXJl
Y3QgYWNjZXNzCnRvZ2V0aGVyLCB0aGUgcXVlc3Rpb24gaXMgaWYgaXQgaXMgcmVhbGx5IG5lY2Vz
c2FyeS4KCjMuIERTSSBkZXZpY2VzIGFyZSBubyBNRkRzIHNvIHJlZ21hcCBhYnN0cmFjdGlvbiBo
YXMgbm8gYmlnIHZhbHVlIGFkZGVkCihjb3JyZWN0IG1lLCBpZiB0aGVyZSBhcmUgb3RoZXIgc2ln
bmlmaWNhbnQgYmVuZWZpdHMpLgoKClsxXToKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvbGF0ZXN0L3NvdXJjZS9pbmNsdWRlL3ZpZGVvL21pcGlfZGlzcGxheS5oI0wxNQoKClJlZ2Fy
ZHMKCkFuZHJ6ZWoKCgo+Cj4gQSBjb3VwbGUgb2YgbWlub3IgY29tbWVudHMsIG5vIG5lZWQgdG8g
cmVzZW5kIGp1c3QgZm9yIHRoZXNlOgo+Cj4+ICsgICAgICAgcGF5bG9hZFswXSA9IChjaGFyKXJl
ZzsKPj4gKyAgICAgICBwYXlsb2FkWzFdID0gKGNoYXIpdmFsOwo+IERvIHlvdSBuZWVkIHRoZSBj
YXN0cz8KPgo+PiArCXJldCA9IG1pcGlfZHNpX2dlbmVyaWNfd3JpdGUoZHNpLCBwYXlsb2FkLCAy
KTsKPj4gKwlyZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7Cj4gUGxlYXNlIGp1c3Qgd3JpdGUgYW4g
aWYgc3RhdGVtZW50LCBpdCBoZWxwcyB3aXRoIGxlZ2liaWxpdHkuCj4KPj4gK3N0cnVjdCByZWdt
YXAgKl9fcmVnbWFwX2luaXRfZHNpKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSwKPj4gKwkJ
CQkgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgKmNvbmZpZywKPj4gKwkJCQkgc3RydWN0IGxv
Y2tfY2xhc3Nfa2V5ICpsb2NrX2tleSwKPj4gKwkJCQkgY29uc3QgY2hhciAqbG9ja19uYW1lKQo+
PiArewo+PiArCXJldHVybiBfX3JlZ21hcF9pbml0KCZkc2ktPmRldiwgJmRzaV9idXMsICZkc2kt
PmRldiwgY29uZmlnLAo+PiArCQkJICAgICBsb2NrX2tleSwgbG9ja19uYW1lKTsKPj4gK30KPj4g
K0VYUE9SVF9TWU1CT0xfR1BMKF9fcmVnbWFwX2luaXRfZHNpKTsKPiBQZXJoYXBzIHZhbGlkYXRl
IHRoYXQgdGhlIGNvbmZpZyBpcyBPSyAobWFpbmx5IHRoZSByZWdpc3Rlci92YWx1ZQo+IHNpemVz
KT8gIFRob3VnaCBJJ20gbm90IHN1cmUgaXQncyB3b3J0aCBpdCBzbyBwZXJoYXBzIG5vdCAtIHVw
IHRvCj4geW91LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
