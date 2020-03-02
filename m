Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB618175E7E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB896E4F3;
	Mon,  2 Mar 2020 15:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2154A6E4F3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154226euoutp01e003b5f20488c7ec8ce7aa0f4a388105~4hwo1qTM-1330713307euoutp011
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200302154226euoutp01e003b5f20488c7ec8ce7aa0f4a388105~4hwo1qTM-1330713307euoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163746;
 bh=2Q4/AluqvvIf3Zl38zvbs1irbTW6yQIMu0j1JxGQqgU=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=NjFQsdf15ZNvHCfAR/mGrdLNJ4wL7hACMYpBpwtZZT9JK6ctISnCUNB19Db6cIIe9
 1yYUmWbXaO+/FE4f0+zNQKU30hfVQxvXtf/UJo/kulQ7uNyDmULpyZT1RGxJQjIQQJ
 MZ87KzU1KPeB03GoCqOOjTxBTcmelIj+DfrRu4zo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200302154226eucas1p297ade7ce07637ed82a6535a32162ac3d~4hwoq_7CH2401424014eucas1p22;
 Mon,  2 Mar 2020 15:42:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 25.C3.60698.2692D5E5; Mon,  2
 Mar 2020 15:42:26 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154226eucas1p2d5e250206de14276f2f574798505b703~4hwoYnL_51589815898eucas1p2h;
 Mon,  2 Mar 2020 15:42:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154226eusmtrp1e8195fa6bb37d243277a6d6ba903d4ef~4hwoYFOLT2870428704eusmtrp1T;
 Mon,  2 Mar 2020 15:42:26 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-6f-5e5d29625ed6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AC.FF.07950.2692D5E5; Mon,  2
 Mar 2020 15:42:26 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200302154226eusmtip11eaf0e7cc92c5b93f457679a348a4284~4hwoEsMtl2008820088eusmtip1X;
 Mon,  2 Mar 2020 15:42:26 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 3/4] video: fbdev: remove set but not used variable
 'vSyncPol'
To: yu kuai <yukuai3@huawei.com>
Message-ID: <a18c91bf-2517-00d5-3943-0e01a12346f0@samsung.com>
Date: Mon, 2 Mar 2020 16:42:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200119121730.10701-4-yukuai3@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djP87pJmrFxBmuOaVt8aGpltrjy9T2b
 xYm+D6wWl3fNYbO49u4Mm8WchWwWCx/dYHNg92g58pbVo+dNC6vH/e7jTB6fN8kFsERx2aSk
 5mSWpRbp2yVwZVzrzCo4wVNxvHsFYwPjQq4uRk4OCQETiWtPXjN2MXJxCAmsYJS4ffYRK4Tz
 hVHiT+crFgjnM6PEmXUP2WFabp5uYYNILGeUOLz4CVTLW0aJb1sns4FUsQlYSUxsX8UIYgsL
 hEjsuH6BCcQWEVCQuNX8gh2kgRlk4bLn51hBErwCdhITPhwGs1kEVCTO/HoNNkhUIELi04PD
 UDWCEidnPgG6iYODU8BC4twsL5Aws4C4xK0n85kgbHmJ5q2zmUHmSwisY5fYvGQ6O0i9hIAL
 0BFMEB8IS7w6vgXqGxmJ05N7WKDqGSX+dryAat7OKLF88j82iCpriTvnfrGBDGIW0JRYv0sf
 IuwosW9eGyPEfD6JG28FIW7gk5i0bTozRJhXoqNNCKJaTWLDsg1sMGu7dq5knsCoNAvJY7OQ
 fDMLyTezEPYuYGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZh2Tv87/nUH474/SYcY
 BTgYlXh4A5hj44RYE8uKK3MPMUpwMCuJ8PpyRscJ8aYkVlalFuXHF5XmpBYfYpTmYFES5zVe
 9DJWSCA9sSQ1OzW1ILUIJsvEwSnVwLj25aJgt7j2E1ebpUJKFsrJXdxoGTTNc8ZMroXTA577
 776i9eFVf+clA9UcUZFtj6UtuZUviVv88BV95lfdJ/As6rUrY2WyQWhcxUb3yKt7rPI99faL
 t65bMWOq5IsDvBUfQ9M2CHaf0jPcf/6vosOdIMk96/6w7ZnXomZonnEley/HrpiUdCWW4oxE
 Qy3mouJEAJY1/BE3AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xu7pJmrFxBm1TpSw+NLUyW1z5+p7N
 4kTfB1aLy7vmsFlce3eGzWLOQjaLhY9usDmwe7Qcecvq0fOmhdXjfvdxJo/Pm+QCWKL0bIry
 S0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mq51ZhWc4Kk4
 3r2CsYFxIVcXIyeHhICJxM3TLWxdjFwcQgJLGSVOH5rN1MXIAZSQkTi+vgyiRljiz7UuqJrX
 jBKbX8xlBUmwCVhJTGxfxQhiCwuESOy4foEJxBYRUJC41fyCHaSBWWAFo8SLFZfZIbp3Mkps
 79oC1sErYCcx4cNhsEksAioSZ369ZgOxRQUiJA7vmAVVIyhxcuYTFpCLOAUsJM7N8gIJMwuo
 S/yZd4kZwhaXuPVkPhOELS/RvHU28wRGoVlIumchaZmFpGUWkpYFjCyrGEVSS4tz03OLjfSK
 E3OLS/PS9ZLzczcxAuNs27GfW3Ywdr0LPsQowMGoxMP7gyE2Tog1say4MvcQowQHs5IIry9n
 dJwQb0piZVVqUX58UWlOavEhRlOg3yYyS4km5wNTQF5JvKGpobmFpaG5sbmxmYWSOG+HwMEY
 IYH0xJLU7NTUgtQimD4mDk6pBsb6xTbfetctmTr5szW3xZmLBixfcxkeufPnXP21/mhfLrv1
 00L2zP2qs6/Oi1mgPmF6o2nXpHOvHNfPd2WoX+R1pqFGXzHI5UKFxMwcj606b0XmO7AcZU4P
 Y0lpfOkVa2Gn6hhz/Mxd077w5A3m5Zb+h5NPZamd+S/NOyFS4Hk9V/nbozqrpyqxFGckGmox
 FxUnAgDeutgHyQIAAA==
X-CMS-MailID: 20200302154226eucas1p2d5e250206de14276f2f574798505b703
X-Msg-Generator: CA
X-RootMTR: 20200119121832eucas1p29efb035b8b8258bf8f78d37e39c64030
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200119121832eucas1p29efb035b8b8258bf8f78d37e39c64030
References: <20200119121730.10701-1-yukuai3@huawei.com>
 <CGME20200119121832eucas1p29efb035b8b8258bf8f78d37e39c64030@eucas1p2.samsung.com>
 <20200119121730.10701-4-yukuai3@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvMTkvMjAgMToxNyBQTSwgeXUga3VhaSB3cm90ZToKPiBGaXhlcyBnY2MgJy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy92aWRlby9mYmRldi9hdHkv
cmFkZW9uX2Jhc2UuYzogSW4gZnVuY3Rpb24KPiDigJhyYWRlb25mYl9zZXRfcGFy4oCZOgo+IGRy
aXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmM6MTY1Mzo0ODogd2FybmluZzogdmFy
aWFibGUKPiDigJhjU3luY+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQo+IAo+IEl0IGlzIG5ldmVyIHVzZWQsIGFuZCBzbyBjYW4gYmUgcmVtb3ZlZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+CgpQYXRjaCBxdWV1
ZWQgZm9yIHY1LjcsIHRoYW5rcy4KIApCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNz
Cgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jIHwgNCArLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMKPiBpbmRleCAwNjY2Zjg0OGJmNzAuLjdk
MmVlODg5ZmZjZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25f
YmFzZS5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYwo+IEBA
IC0xNjUwLDcgKzE2NTAsNyBAQCBzdGF0aWMgaW50IHJhZGVvbmZiX3NldF9wYXIoc3RydWN0IGZi
X2luZm8gKmluZm8pCj4gIAlzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKm1vZGUgPSAmaW5mby0+
dmFyOwo+ICAJc3RydWN0IHJhZGVvbl9yZWdzICpuZXdtb2RlOwo+ICAJaW50IGhUb3RhbCwgdlRv
dGFsLCBoU3luY1N0YXJ0LCBoU3luY0VuZCwKPiAtCSAgICB2U3luY1N0YXJ0LCB2U3luY0VuZCwg
Y1N5bmM7Cj4gKwkgICAgdlN5bmNTdGFydCwgdlN5bmNFbmQ7Cj4gIAl1OCBoc3luY19hZGpfdGFi
W10gPSB7MCwgMHgxMiwgOSwgOSwgNiwgNX07Cj4gIAl1OCBoc3luY19mdWRnZV9mcFtdID0gezIs
IDIsIDAsIDAsIDUsIDV9Owo+ICAJdTMyIHN5bmMsIGhfc3luY19wb2wsIHZfc3luY19wb2wsIGRv
dENsb2NrLCBwaXhDbG9jazsKPiBAQCAtMTczMCw4ICsxNzMwLDYgQEAgc3RhdGljIGludCByYWRl
b25mYl9zZXRfcGFyKHN0cnVjdCBmYl9pbmZvICppbmZvKQo+ICAJZWxzZSBpZiAodnN5bmNfd2lk
ID4gMHgxZikJLyogbWF4ICovCj4gIAkJdnN5bmNfd2lkID0gMHgxZjsKPiAgCj4gLQljU3luYyA9
IG1vZGUtPnN5bmMgJiBGQl9TWU5DX0NPTVBfSElHSF9BQ1QgPyAoMSA8PCA0KSA6IDA7Cj4gLQo+
ICAJZm9ybWF0ID0gcmFkZW9uX2dldF9kc3RicHAoZGVwdGgpOwo+ICAJYnl0cHAgPSBtb2RlLT5i
aXRzX3Blcl9waXhlbCA+PiAzOwo+ICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
