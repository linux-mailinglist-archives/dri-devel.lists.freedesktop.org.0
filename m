Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B602610DA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11046E7F1;
	Tue,  8 Sep 2020 11:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66E46E7E6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113747euoutp0182d4a0d931df7b1a1b17f31fb4233deb~yy-Q68JsJ0798807988euoutp01b
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200908113747euoutp0182d4a0d931df7b1a1b17f31fb4233deb~yy-Q68JsJ0798807988euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565067;
 bh=IksfWJS9W+nx/s+HKKC3IC9FURMGnu/x8VGbOOkCFFA=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=O76ukPbtuOy3JkQ+g0/81Vfnr96z+pvVPeyqKnLxsvMuBSiTTmhlhEEOplfjHKCW+
 6p5pYwkRaQ2hZ4Pf0AzJNMgWJeI5jj6tv7q6m/78txuf0ZpoQCP+GsByE68f+0kFsM
 a2RFw1U+SvQ7RI5XQzql7dhbbq+pNZlyijiqU2kI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200908113747eucas1p1d9f7fd6fbf9e0a1ca52324db61ad30ec~yy-Qmh3XJ0741007410eucas1p1l;
 Tue,  8 Sep 2020 11:37:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 21.6E.06456.B0D675F5; Tue,  8
 Sep 2020 12:37:47 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113746eucas1p2192fcec3ad95ed43c74461c0ccdf527d~yy-QJpdrM2602726027eucas1p29;
 Tue,  8 Sep 2020 11:37:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200908113746eusmtrp2d1245f1c835f043e9794572bfb889081~yy-QJGOGn3046530465eusmtrp26;
 Tue,  8 Sep 2020 11:37:46 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-27-5f576d0b8704
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 09.C4.06017.A0D675F5; Tue,  8
 Sep 2020 12:37:46 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113746eusmtip28a5016e082bbc918ca632d2c497f9d9b~yy-P0M8wF1482014820eusmtip2O;
 Tue,  8 Sep 2020 11:37:46 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: remove set but not used 'ulBestVCO'
To: Jason Yan <yanaijie@huawei.com>
Message-ID: <8b15618f-eaf5-e646-2655-939d8b456b27@samsung.com>
Date: Tue, 8 Sep 2020 13:37:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200827130008.428706-1-yanaijie@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djPc7rcueHxBo1NLBZXvr5ns/i//Aqj
 xYm+D6wWl3fNYbNYtKeT2YHVo+XIW1aP+93HmTw+b5ILYI7isklJzcksSy3St0vgyjj48ixT
 wRSBiiO/TzM2MC7l6WLk5JAQMJF4eP0LexcjF4eQwApGiVnd06CcL4wSa9ruMEM4nxklptxv
 Z4RpmXJ7CguILSSwnFFi20sLiKK3jBLnPjwGS7AJWElMbF8F1iAs4Cbxr/cDM4gtIqAs0Xh/
 OitIA7NAA6PEvcOHgfZxcPAK2Ek0rPIGqWERUJGYOWUqG4gtKhAh8enBYVYQm1dAUOLkzCdg
 8zmB5i+63gBmMwuIS9x6Mp8JwpaXaN46G+xqCYHp7BJbbx9gg7jaRWJ/ywpWCFtY4tXxLewQ
 tozE/50gzSAN6xgl/na8gOreziixfPI/qG5riTvnfrGBXMosoCmxfpc+RNhRYvb7lUwgYQkB
 PokbbwUhjuCTmLRtOjNEmFeio00IolpNYsOyDWwwa7t2rmSewKg0C8lrs5C8MwvJO7MQ9i5g
 ZFnFKJ5aWpybnlpsmJdarlecmFtcmpeul5yfu4kRmFxO/zv+aQfj10tJhxgFOBiVeHg/eIXF
 C7EmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FCAumJJanZ
 qakFqUUwWSYOTqkGxkCutCkTlU7smn/SJ0r8188IHsdGmQbzkrqPD6s897Fxhq1hXGRRGJr+
 a/FUH7uOz1Pk2BP/fSvsUXqv0yrw7tnS3nXLoi6VW7r8V3MTqi74eUyqcFu52JwEif2M1Zdn
 lrJmqZXuWLvmoH29utIm2ei1mrNaeGVtH7TteKVfciRpy6IKczkHJZbijERDLeai4kQAae9N
 2SoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xe7pcueHxBr8uKlpc+fqezeL/8iuM
 Fif6PrBaXN41h81i0Z5OZgdWj5Yjb1k97ncfZ/L4vEkugDlKz6Yov7QkVSEjv7jEVina0MJI
 z9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+Pgy7NMBVMEKo78Ps3YwLiUp4uRk0NC
 wERiyu0pLF2MXBxCAksZJXY/3cfYxcgBlJCROL6+DKJGWOLPtS42iJrXjBLzXx1iAUmwCVhJ
 TGxfxQhiCwu4Sfzr/cAMYosIKEs03p/OCtLALNDAKHHyaxsjRHcvo0TD9BdgG3gF7CQaVnmD
 NLAIqEjMnDKVDcQWFYiQOLxjFthQXgFBiZMzn4At4wRatuh6A5jNLKAu8WfeJWYIW1zi1pP5
 TBC2vETz1tnMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQI
 jKZtx35u2cHY9S74EKMAB6MSD+8Hr7B4IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccX
 leakFh9iNAV6biKzlGhyPjDS80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB
 9DFxcEo1MJ7q+9MfeUTmTOqBn2uuCl7snS+QdDvbWKT/5gd5hpqja8KbrxtzrXlv+N94irfe
 gYjCuoqwrXUbbaU6Wi3rnhnWOfuZMfybq7+1TemmeFXc76UzlVLiMq6tDju88OxGyYlaDUtP
 iHrGMvGECEqw3AnjlHP6tuprySfzmbVfIv7oic/XTZJ2VGIpzkg01GIuKk4EAGCK1xW8AgAA
X-CMS-MailID: 20200908113746eucas1p2192fcec3ad95ed43c74461c0ccdf527d
X-Msg-Generator: CA
X-RootMTR: 20200827130039eucas1p124a0c2d9912f55281386c9318013a17a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200827130039eucas1p124a0c2d9912f55281386c9318013a17a
References: <CGME20200827130039eucas1p124a0c2d9912f55281386c9318013a17a@eucas1p1.samsung.com>
 <20200827130008.428706-1-yanaijie@huawei.com>
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
Cc: Hulk Robot <hulkci@huawei.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMjcvMjAgMzowMCBQTSwgSmFzb24gWWFuIHdyb3RlOgo+IFRoaXMgYWRkcmVzc2VzIHRo
ZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmcgd2l0aCAibWFrZSBXPTEiOgo+IAo+IGRyaXZlcnMvdmlk
ZW8vZmJkZXYva3lyby9TVEc0MDAwSW5pdERldmljZS5jOiBJbiBmdW5jdGlvbgo+IOKAmFByb2dy
YW1DbG9ja+KAmToKPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAwMEluaXREZXZpY2Uu
YzoxMjM6Njogd2FybmluZzogdmFyaWFibGUKPiDigJh1bEJlc3RWQ0/igJkgc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgIDEyMyB8ICB1MzIgdWxCZXN0VkNP
ID0gMCwgdWxCZXN0Q2xrID0gMCwgdWxCZXN0U2NvcmUgPSAwOwo+ICAgICAgIHwgICAgICBefn5+
fn5+fn4KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgoKQXBwbGllZCB0
byBkcm0tbWlzYy1uZXh0IHRyZWUsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWll
aiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxl
Y3Ryb25pY3MKCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYva3lyby9TVEc0MDAwSW5pdERl
dmljZS5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9reXJvL1NURzQw
MDBJbml0RGV2aWNlLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAwMEluaXREZXZp
Y2UuYwo+IGluZGV4IGVkYWVlYzJkOTU5MC4uMjE4NzVkM2MyZGMyIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYva3lyby9TVEc0MDAwSW5pdERldmljZS5jCj4gKysrIGIvZHJpdmVy
cy92aWRlby9mYmRldi9reXJvL1NURzQwMDBJbml0RGV2aWNlLmMKPiBAQCAtMTIwLDcgKzEyMCw3
IEBAIHUzMiBQcm9ncmFtQ2xvY2sodTMyIHJlZkNsb2NrLAo+ICB7Cj4gIAl1MzIgUiA9IDAsIEYg
PSAwLCBPRCA9IDAsIE9ESW5kZXggPSAwOwo+ICAJdTMyIHVsQmVzdFIgPSAwLCB1bEJlc3RGID0g
MCwgdWxCZXN0T0QgPSAwOwo+IC0JdTMyIHVsQmVzdFZDTyA9IDAsIHVsQmVzdENsayA9IDAsIHVs
QmVzdFNjb3JlID0gMDsKPiArCXUzMiB1bEJlc3RDbGsgPSAwLCB1bEJlc3RTY29yZSA9IDA7Cj4g
IAl1MzIgdWxTY29yZSwgdWxQaGFzZVNjb3JlLCB1bFZjb1Njb3JlOwo+ICAJdTMyIHVsVG1wID0g
MCwgdWxWQ087Cj4gIAl1MzIgdWxTY2FsZUNsb2NrUmVxLCB1bE1pbkNsb2NrLCB1bE1heENsb2Nr
Owo+IEBAIC0xODksNyArMTg5LDYgQEAgdTMyIFByb2dyYW1DbG9jayh1MzIgcmVmQ2xvY2ssCj4g
IAkJCQkJCXVsU2NvcmUgPSB1bFBoYXNlU2NvcmUgKyB1bFZjb1Njb3JlOwo+ICAKPiAgCQkJCQkJ
aWYgKCF1bEJlc3RTY29yZSkgewo+IC0JCQkJCQkJdWxCZXN0VkNPID0gdWxWQ087Cj4gIAkJCQkJ
CQl1bEJlc3RPRCA9IE9EOwo+ICAJCQkJCQkJdWxCZXN0RiA9IEY7Cj4gIAkJCQkJCQl1bEJlc3RS
ID0gUjsKPiBAQCAtMjA2LDcgKzIwNSw2IEBAIHUzMiBQcm9ncmFtQ2xvY2sodTMyIHJlZkNsb2Nr
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJ1dCB3ZSBzaGFsbCBrZWVwIHRoaXMgY29k
ZSBpbiBjYXNlIG5ldyByZXN0cmljdGlvbnMgY29tZSBpbnRvIHBsYXkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovCj4gIAkJCQkJCWlmICgodWxTY29yZSA+
PSB1bEJlc3RTY29yZSkgJiYgKE9EID4gMCkpIHsKPiAtCQkJCQkJCXVsQmVzdFZDTyA9IHVsVkNP
Owo+ICAJCQkJCQkJdWxCZXN0T0QgPSBPRDsKPiAgCQkJCQkJCXVsQmVzdEYgPSBGOwo+ICAJCQkJ
CQkJdWxCZXN0UiA9IFI7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
