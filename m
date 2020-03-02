Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3544175E80
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE3A6E4FB;
	Mon,  2 Mar 2020 15:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40D96E4FB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154231euoutp01dca72ca2a6edc73edcd423d34596234d~4hwtFpw2h1322613226euoutp01-
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200302154231euoutp01dca72ca2a6edc73edcd423d34596234d~4hwtFpw2h1322613226euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163751;
 bh=hI3u1pukdnZavMLwcOWKBxl7dWUW2WAxnFQT8JclRYw=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=GRCGFpdIYGXsUNQaTWt1F08dM6DZ9Zoveyy00sSonayUzLD9xGJnGfQo4wZHamjx7
 hnXryCd7yD8bmnYrnySia88BDr9liWT/+IBM7eZE8VHbeaBTV5ya2qgF/KigHWN+J7
 f//5uLSMTl+DHnM98ZO/Pc9o27KOt+kPlFRj7cFI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200302154231eucas1p29af42f5ae062539f7fbf7505c47b77a7~4hws3RjPh2401424014eucas1p25;
 Mon,  2 Mar 2020 15:42:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 17.C3.60698.7692D5E5; Mon,  2
 Mar 2020 15:42:31 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200302154230eucas1p1a47d2ce0c4538702d0a1c6a5e4c4d0f2~4hwsZrClU0815708157eucas1p1V;
 Mon,  2 Mar 2020 15:42:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154230eusmtrp18bf3e2889b1b599f7b05c00fd8da835d~4hwsZBM4L2922329223eusmtrp1B;
 Mon,  2 Mar 2020 15:42:30 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-79-5e5d2967e48b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B1.20.08375.6692D5E5; Mon,  2
 Mar 2020 15:42:30 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154230eusmtip2c6f616257f36cade6a4e8985c7a30187~4hwr-CGR_2188921889eusmtip2F;
 Mon,  2 Mar 2020 15:42:30 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 4/4] video: fbdev: remove set but not used variable 'bytpp'
To: yu kuai <yukuai3@huawei.com>
Message-ID: <e060e0a0-1861-20f0-d1ef-6a8137949659@samsung.com>
Date: Mon, 2 Mar 2020 16:42:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200119121730.10701-5-yukuai3@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djP87rpmrFxBl2rOC0+NLUyW1z5+p7N
 4kTfB1aLy7vmsFlce3eGzWLOQjaLhY9usDmwe7Qcecvq0fOmhdXjfvdxJo/Pm+QCWKK4bFJS
 czLLUov07RK4MtZ8Syxo46n403+ZqYHxG2cXIyeHhICJxIHr65m6GLk4hARWMEocu/ycHcL5
 wiixt3EHM4TzmVHi4bE9zDAtE5acZIVILGeU6PrxFsp5yyjxa9lxFpAqNgEriYntqxhBbGGB
 QInnO5tZQWwRAQWJW80vwHYwgyxc9vwcWIJXwE7iwpP9YA0sAioSb6/eBIuLCkRIfHpwGKpG
 UOLkzCdgCzgFLCSO9vaBncQsIC5x68l8JghbXqJ562ywuyUE1rFLNB3dxAhxt4vE9QmHoWxh
 iVfHt7BD2DISpyf3sEA1MEr87XgB1b2dUWL55H9sEFXWEnfO/QKyOYBWaEqs36UPEXaUOHni
 I1hYQoBP4sZbQYgj+CQmbZvODBHmlehoE4KoVpPYsGwDG8zarp0rmScwKs1C8tosJO/MQvLO
 LIS9CxhZVjGKp5YW56anFhvnpZbrFSfmFpfmpesl5+duYgSmntP/jn/dwbjvT9IhRgEORiUe
 3gDm2Dgh1sSy4srcQ4wSHMxKIry+nNFxQrwpiZVVqUX58UWlOanFhxilOViUxHmNF72MFRJI
 TyxJzU5NLUgtgskycXBKNTDKaImzr5vseLhuKouy/rr0iekfNzd3cxi/nhmzaf7T2DlnOg0O
 znzzJKY0QTJEWGiNf2hkqLDI2lncRXatrTaXszyC120O2r6o/ca0GS78X//EXtF//mrdH/vN
 zY4vHOY/yZyvufta24oHbSIbdP/9efRGI+fRm6gp/Qfnute37Evwmeap3xmuxFKckWioxVxU
 nAgAqwksBzkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xe7ppmrFxBo+6tCw+NLUyW1z5+p7N
 4kTfB1aLy7vmsFlce3eGzWLOQjaLhY9usDmwe7Qcecvq0fOmhdXjfvdxJo/Pm+QCWKL0bIry
 S0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MtZ8Syxo46n4
 03+ZqYHxG2cXIyeHhICJxIQlJ1m7GLk4hASWMkqsONvA2MXIAZSQkTi+vgyiRljiz7UuNoia
 14wS7ZP3s4Ak2ASsJCa2r2IEsYUFAiWe72xmBbFFBBQkbjW/YAdpYBZYwSjxYsVldojunYwS
 xw5sAaviFbCTuPBkP1g3i4CKxNurN8HiogIREod3zGKEqBGUODnzCdg2TgELiaO9fcwgNrOA
 usSfeZegbHGJW0/mM0HY8hLNW2czT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYUK84
 Mbe4NC9dLzk/dxMjMNK2Hfu5eQfjpY3BhxgFOBiVeHgDmGPjhFgTy4orcw8xSnAwK4nw+nJG
 xwnxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjAJ5JXEG5oamltYGpobmxubWSiJ83YIHIwR
 EkhPLEnNTk0tSC2C6WPi4JRqYPS+XbvMQHrVtmbRraw/t95n/S44ffPSEtdDnaZNvz5Xvr8Z
 P0OhRHbmrAl/DecWdgoIt4g//x2y8cAXRybxpZM0w1KkTbdofVpk1XhINcQ4cM+lB8tPeOYd
 3n7Y3+3dHHHD81umzGMRnSnJc7KKyUbr/V6//I06vYJGvI/CPBwz3vyb2Tf//VklluKMREMt
 5qLiRABpQkznygIAAA==
X-CMS-MailID: 20200302154230eucas1p1a47d2ce0c4538702d0a1c6a5e4c4d0f2
X-Msg-Generator: CA
X-RootMTR: 20200119121831eucas1p19d7d048f980db055edf2eb15d5e82253
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200119121831eucas1p19d7d048f980db055edf2eb15d5e82253
References: <20200119121730.10701-1-yukuai3@huawei.com>
 <CGME20200119121831eucas1p19d7d048f980db055edf2eb15d5e82253@eucas1p1.samsung.com>
 <20200119121730.10701-5-yukuai3@huawei.com>
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
aXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmM6MTY2MDozMjogd2FybmluZzoKPiB2
YXJpYWJsZSDigJhieXRwcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQo+IAo+IEl0IGlzIG5ldmVyIHVzZWQsIGFuZCBzbyBjYW4gYmUgcmVtb3ZlZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+CgpQYXRjaCBxdWV1
ZWQgZm9yIHY1LjcsIHRoYW5rcy4KIApCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNz
Cgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jIHwgMyArLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jIGIvZHJpdmVy
cy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYwo+IGluZGV4IDdkMmVlODg5ZmZjZC4uMjJi
M2VlNGYyZmZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9i
YXNlLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jCj4gQEAg
LTE2NTcsNyArMTY1Nyw3IEBAIHN0YXRpYyBpbnQgcmFkZW9uZmJfc2V0X3BhcihzdHJ1Y3QgZmJf
aW5mbyAqaW5mbykKPiAgCWludCBpLCBmcmVxOwo+ICAJaW50IGZvcm1hdCA9IDA7Cj4gIAlpbnQg
bm9wbGxjYWxjID0gMDsKPiAtCWludCBoc3luY19zdGFydCwgaHN5bmNfZnVkZ2UsIGJ5dHBwLCBo
c3luY193aWQsIHZzeW5jX3dpZDsKPiArCWludCBoc3luY19zdGFydCwgaHN5bmNfZnVkZ2UsIGhz
eW5jX3dpZCwgdnN5bmNfd2lkOwo+ICAJaW50IHByaW1hcnlfbW9uID0gUFJJTUFSWV9NT05JVE9S
KHJpbmZvKTsKPiAgCWludCBkZXB0aCA9IHZhcl90b19kZXB0aChtb2RlKTsKPiAgCWludCB1c2Vf
cm14ID0gMDsKPiBAQCAtMTczMSw3ICsxNzMxLDYgQEAgc3RhdGljIGludCByYWRlb25mYl9zZXRf
cGFyKHN0cnVjdCBmYl9pbmZvICppbmZvKQo+ICAJCXZzeW5jX3dpZCA9IDB4MWY7Cj4gIAo+ICAJ
Zm9ybWF0ID0gcmFkZW9uX2dldF9kc3RicHAoZGVwdGgpOwo+IC0JYnl0cHAgPSBtb2RlLT5iaXRz
X3Blcl9waXhlbCA+PiAzOwo+ICAKPiAgCWlmICgocHJpbWFyeV9tb24gPT0gTVRfREZQKSB8fCAo
cHJpbWFyeV9tb24gPT0gTVRfTENEKSkKPiAgCQloc3luY19mdWRnZSA9IGhzeW5jX2Z1ZGdlX2Zw
W2Zvcm1hdC0xXTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
