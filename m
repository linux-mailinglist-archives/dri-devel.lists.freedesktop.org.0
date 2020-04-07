Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFB61A0FE8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 17:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BF26E092;
	Tue,  7 Apr 2020 15:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3166E0AC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 15:09:23 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200407150921euoutp02de53146f420189052b165449d7868f4a~DkiBbJlJA0080600806euoutp02k
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 15:09:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200407150921euoutp02de53146f420189052b165449d7868f4a~DkiBbJlJA0080600806euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1586272161;
 bh=idauTFWK3EpGoGdyTuPSIRfG1qiQ4QuCWlsIf0lCvis=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=MyRqMeCmRZgtvN/qXVsScBSpE/PX6ZLkI/A+UaVKf3VL2VAqviKfrJjgxYegcukLS
 snMrnK3MM0LzeAZqzyCe71VL1HGY3cjnlYeFg9MJYkkwv9zr+R34esAj/OiXtnt3l7
 JdGfyQcDhclZEvyC+TCPdEqKJpbg6jfDKXX4LhWs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200407150921eucas1p1d6e08cb14ebc93275b56ef404cc3e9bc~DkiBL3Ieq1502615026eucas1p1z;
 Tue,  7 Apr 2020 15:09:21 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C3.D8.60698.1A79C8E5; Tue,  7
 Apr 2020 16:09:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200407150920eucas1p2cb21da18247e3a715521cced7445e593~DkiA2imxC3080030800eucas1p2C;
 Tue,  7 Apr 2020 15:09:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200407150920eusmtrp1ed47ecce65e10c1249762595dba836db~DkiA10Ics2164321643eusmtrp16;
 Tue,  7 Apr 2020 15:09:20 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-ec-5e8c97a13edf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FA.59.07950.0A79C8E5; Tue,  7
 Apr 2020 16:09:20 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200407150920eusmtip1cf6a74c9b9d6b9dd2d26ab4440874a57~DkiAXVC2E2577125771eusmtip1X;
 Tue,  7 Apr 2020 15:09:20 +0000 (GMT)
Subject: Re: [RESEND 2/2] drm: bridge: adv7511: Extend list of audio sample
 rates
To: Bogdan Togorean <bogdan.togorean@analog.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <6ecea2a4-ba7a-929e-3536-22bbb1a39f40@samsung.com>
Date: Tue, 7 Apr 2020 17:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224120155.15510-2-bogdan.togorean@analog.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUgUcRTH/e3M7o5bK+Oq+LIoWoIwPBL9YyIThYghIoIgSsscdTzKix3X
 K0o7rFV3Q10P1NIuSyTIPNYrRdbIezVT8GwrpFjRtGxNMyXXUfK/z3vv+973PXgEJhsUOhGR
 MfGsIoaJkoskuO7dssH1caE68HBlmpjSGLoEVOtkq5i6lZ6HUUPmORE1/NuEUV0zwziVkfNM
 TH1oeiCi9PcDqJrqfMxXQk8P+9FzI+liukRVJKSfvjEJ6M7sQQH93WAQ0/WLn4S0MatDQLdp
 tDi9UL33jMRf4h3KRkUmsAp3nyBJxGpLA4ozSpKWNRMoDemITGRNAOkFbWV5wkwkIWRkBYI0
 sw7jg18IVLWlm8ECgq7Rb4KtFnPB2mbhBYLKr4uID2YRtPe/3VDZkWdBM6kSWdh+nc0/tLhF
 hJG9CIytlrnWhIh0htWa0Q2RlPSBrAI9sjBOHoBaQ+eGxoE8DwX1a4jX2EJX0RRuYWvSF/KK
 OjYYI/fB7boSjGdHGJsqE1jMgJwVw3xtKeL3Pg5Z5f2bbAfTHbVinvdAj1aN85wKxoo7GN+s
 QlBX1YjxhaMwYfizvimx7uAMr5rc+bQfVH1pE1jSQNrAyKwtv4MN5OoKMT4tBdVdGa/eD8a+
 us2BjlA+YBZlI3nxtsuKt11TvO2a4v++jxBeiRxZJRcdznKeMWyiG8dEc8qYcLeQ2OhqtP5p
 PWsd5gbU+jdYj0gCyXdKPzHqQJmQSeCSo/UICExuL3XSZATKpKFMcgqriL2sUEaxnB7tJnC5
 o9TziemSjAxn4tmrLBvHKraqAsLaKQ2Nty0N+LHpZVkJO5KQ97HsqOBQL8pV34sP4FKD1YWV
 19e6T42dSF85Ms5l5qq1zS8jGhpvzGqbl/sYj9NB5/JbcuqsSnd5liqVBytmQn76P6xaGrIP
 SIhMVHemOM/nd3/se+5iCiv5bIy9/t5FedOrxqr9ioMu7CSMZaRelN9bkONcBONxCFNwzD/R
 xwZPZQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xu7oLpvfEGWydpm3Re+4kk8W+u/vY
 LZpapzBbXPn6ns3i6veXzBYn31xlseicuITd4vKuOWwWh/qiLTZvmsrswOXx6qqjx/sbrewe
 sztmsnos3vOSyePEhEtMHu/OnWP32P7tAavH/e7jTB4HeiezeHzeJBfAFaVnU5RfWpKqkJFf
 XGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8XfvDsaC+1wVP3vvMDYw
 buPoYuTkkBAwkfg67R9zFyMXh5DAUkaJtc1LGSES4hK7579lhrCFJf5c62KDKHrNKPH/1lwm
 kISwQLBE790ONhBbBMj++PcGO0gRs8AZRondqxcyQXScZJS4P3UxWBWbgKbE3803wWxeATuJ
 7mmHwNaxCKhIbDl3AmydqECExOOJ7YwQNYISJ2c+YQGxOQUcJKbMPA5mMwuoS/yZd4kZwpaX
 aN46G8oWl7j1ZD7TBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNz
 NzECo3jbsZ9bdjB2vQs+xCjAwajEw/sgsSdOiDWxrLgy9xCjBAezkgivVG9nnBBvSmJlVWpR
 fnxRaU5q8SFGU6DnJjJLiSbnAxNMXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC
 1CKYPiYOTqkGRsVX7VrMTN891j5mEnL61LIzfteBPaxLrmbtehxQf/C1gFWQHet9a7513I+F
 69P/d0oe2M/1SOnUgcaWuQ8PuGZW/3Y5F73VqNJpiuuhBIvyvPvSznP0Q257Ot07/+bbpI7b
 Tx9dZzjxynr/5BrJgJXXVbXqHx4qfX4sdK+dhqj5v5drBKKuOCqxFGckGmoxFxUnAgAUZZlv
 +AIAAA==
X-CMS-MailID: 20200407150920eucas1p2cb21da18247e3a715521cced7445e593
X-Msg-Generator: CA
X-RootMTR: 20200224165503eucas1p2a8aea2390c4b0421e99641e0d4183167
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200224165503eucas1p2a8aea2390c4b0421e99641e0d4183167
References: <20200224120155.15510-1-bogdan.togorean@analog.com>
 <CGME20200224165503eucas1p2a8aea2390c4b0421e99641e0d4183167@eucas1p2.samsung.com>
 <20200224120155.15510-2-bogdan.togorean@analog.com>
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, alexios.zavras@intel.com,
 Laurent.pinchart@ideasonboard.com, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQuMDIuMjAyMCAxMzowMSwgQm9nZGFuIFRvZ29yZWFuIHdyb3RlOgo+IEFEVjc1MTEgc3Vw
cG9ydCBzYW1wbGUgcmF0ZXMgdXAgdG8gMTkya0h6LiBDVFMgYW5kIE4gcGFyYW1ldGVycyBzaG91
bGQKPiBiZSBjb21wdXRlZCBhY2NvcmRpbmdseSBzbyB0aGlzIGNvbW1pdCBleHRlbmQgdGhlIGxp
c3QgdXAgdG8gbWF4aW11bQo+IHN1cHBvcnRlZCBzYW1wbGUgcmF0ZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEJvZ2RhbiBUb2dvcmVhbiA8Ym9nZGFuLnRvZ29yZWFuQGFuYWxvZy5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMgfCAxMiArKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8uYwo+IGluZGV4IDFlOWIx
MjhkMjI5Yi4uMTNlOGNlZTZlODI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jCj4gQEAgLTI3LDYgKzI3LDE4IEBAIHN0YXRpYyB2b2lk
IGFkdjc1MTFfY2FsY19jdHNfbih1bnNpZ25lZCBpbnQgZl90bWRzLCB1bnNpZ25lZCBpbnQgZnMs
Cj4gIAljYXNlIDQ4MDAwOgo+ICAJCSpuID0gNjE0NDsKPiAgCQlicmVhazsKPiArCWNhc2UgODgy
MDA6Cj4gKwkJKm4gPSAxMjU0NDsKPiArCQlicmVhazsKPiArCWNhc2UgOTYwMDA6Cj4gKwkJKm4g
PSAxMjI4ODsKPiArCQlicmVhazsKPiArCWNhc2UgMTc2NDAwOgo+ICsJCSpuID0gMjUwODg7Cj4g
KwkJYnJlYWs7Cj4gKwljYXNlIDE5MjAwMDoKPiArCQkqbiA9IDI0NTc2Owo+ICsJCWJyZWFrOwoK
Ckkgd291bGQgcHV0OgoKY2FzZSAzMjAwMDoKY2FzZSA0ODAwMDoKY2FzZSA5NjAwMDoKY2FzZSAx
OTIwMDA6CsKgwqDCoCAqbiA9IGZzICogMTI4IC8gMTAwMDsKwqDCoMKgIGJyZWFrOwpjYXNlIDQ0
MTAwOgpjYXNlIDg4MjAwOgpjYXNlIDE3NjQwMDoKwqDCoMKgICpuID0gZnMgKiAxMjggLyA5MDA7
CsKgwqDCoCBicmVhazsKClRvIHVuY292ZXIgdGhlIG1hZ2ljLiBVcCB0byB5b3UuCgpSZXZpZXdl
ZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCgpSZWdhcmRzCkFuZHJ6
ZWoKPiAgCX0KPiAgCj4gIAkqY3RzID0gKChmX3RtZHMgKiAqbikgLyAoMTI4ICogZnMpKSAqIDEw
MDA7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
