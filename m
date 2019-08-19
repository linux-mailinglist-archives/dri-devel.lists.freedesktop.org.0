Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE09262C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C776E138;
	Mon, 19 Aug 2019 14:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A49E6E136
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:10:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190819141004euoutp02ab8b678474c24a67ce4614fb60728da2~8WECMmDN50419504195euoutp02j
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:10:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190819141004euoutp02ab8b678474c24a67ce4614fb60728da2~8WECMmDN50419504195euoutp02j
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190819141004eucas1p2dcc2143c30cc81316c2fb8b8fcfe5848~8WEBswXLW2973429734eucas1p22;
 Mon, 19 Aug 2019 14:10:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 24.D9.04309.BBDAA5D5; Mon, 19
 Aug 2019 15:10:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190819141003eucas1p270a7faa948afa3434b7ee9cab924cd85~8WEA5bieK3113031130eucas1p2K;
 Mon, 19 Aug 2019 14:10:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190819141003eusmtrp237fa8ed0433bc960718f0de4de43ef22~8WEA47JTs0194801948eusmtrp2b;
 Mon, 19 Aug 2019 14:10:03 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-3e-5d5aadbbaab3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 01.E5.04117.BBDAA5D5; Mon, 19
 Aug 2019 15:10:03 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190819141002eusmtip1543c5d7a7def16c95b911c333cbb6b08~8WEAjZN8l1055510555eusmtip1W;
 Mon, 19 Aug 2019 14:10:02 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev/mmp/core: Use struct_size() in kzalloc()
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <d2b32f0f-307d-b286-22b5-2316c9de1d93@samsung.com>
Date: Mon, 19 Aug 2019 16:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807161312.GA26835@embeddedor>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduznOd3da6NiDX4sN7C48vU9m8XWPaoW
 J/o+sFpc3jWHzYHFY91BVY/73ceZPD5vkgtgjuKySUnNySxLLdK3S+DKaLh5n7ngI3vFgU3L
 2RoYF7J1MXJySAiYSJyZs5Cxi5GLQ0hgBaPE8UV32CCcL4wSB2b+gcp8ZpS42zmLEaZlZcdT
 qMRyRomZT1+xgySEBN4ySkzbxwFiCwt4Sfw7f4kVxBYRMJKYPaMbzGYWSJA4vegeC4jNJmAl
 MbF9FdhQXgE7iTULbgLFOThYBFQlFu+vAgmLCkRI3D+2gRWiRFDi5MwnYK2cAgYST8/8YYQY
 KS5x68l8JghbXmL72znMEHe2s0ucmCEPYbtIvLx0kgXCFpZ4dXwLO4QtI/F/J0gvF5C9jlHi
 b8cLZghnO6PE8sn/oIFkLXH4+EVWkOOYBTQl1u/Shwg7Skze08UMEpYQ4JO48VYQ4gY+iUnb
 pkOFeSU62oQgqtUkNizbwAaztmvnSuYJjEqzkHw2C8k3s5B8Mwth7wJGllWM4qmlxbnpqcVG
 eanlesWJucWleel6yfm5mxiBqeT0v+NfdjDu+pN0iFGAg1GJh9djWlSsEGtiWXFl7iFGCQ5m
 JRHeijlAId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzVDA+ihQTSE0tSs1NTC1KLYLJMHJxSDYzt
 C3mXFx1jqE3cEsE8ic/0b46ypO1Ojtn9vF6vLhnci9369QJrmfS7Xe5GW7ZoCJj+urHOLixG
 hDnmZNcx59+h9ffPXT+4blHutjqT276O03mVXzqd4LN2tS9cnawutYnnmNw+paUZ1TNWHCtt
 NTYODdS7tIW7vuhN/hZzwaQDS22b+ZmDVZRYijMSDbWYi4oTAY3XKkAhAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7q710bFGnw4wGVx5et7Noute1Qt
 TvR9YLW4vGsOmwOLx7qDqh73u48zeXzeJBfAHKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2Ri
 qWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX0XDzPnPBR/aKA5uWszUwLmTrYuTkkBAwkVjZ8ZQR
 xBYSWMooseySWhcjB1BcRuL4+jKIEmGJP9e6gMq5gEpeM0r82n6AHSQhLOAl8e/8JVYQW0TA
 SGL2jG5WkF5mgQSJZ/NSIOqbGSWmnXgGNp9NwEpiYvsqMJtXwE5izYKbLCD1LAKqEov3V4GE
 RQUiJM68X8ECUSIocXLmEzCbU8BA4umZP2CtzALqEn/mXWKGsMUlbj2ZzwRhy0tsfzuHeQKj
 0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgZGz7djPLTsYu94F
 H2IU4GBU4uH1mBYVK8SaWFZcmXuIUYKDWUmEt2IOUIg3JbGyKrUoP76oNCe1+BCjKdBvE5ml
 RJPzgVGdVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBUTrVvdLp
 18bVnAoxsxpKUvynV/2+84dZujC92mBCfq78189K93X3Xg7ievbF7FPS84PbRCL23bd7e4XB
 qX6VSH1syL4FWhbRf8P3MbN94v4Tz7Hx0j/9jUcX6Tmbr9k6T81G/O7sp8ujnrc9nZamseeo
 hNq5vMy4opVPfpyb7sIW5nB/mYa1hhJLcUaioRZzUXEiAMNwK9iyAgAA
X-CMS-MailID: 20190819141003eucas1p270a7faa948afa3434b7ee9cab924cd85
X-Msg-Generator: CA
X-RootMTR: 20190807161320epcas2p1457bd16d94c3f746543130153a472696
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190807161320epcas2p1457bd16d94c3f746543130153a472696
References: <CGME20190807161320epcas2p1457bd16d94c3f746543130153a472696@epcas2p1.samsung.com>
 <20190807161312.GA26835@embeddedor>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566223804;
 bh=eusqD32C53reMcLpq4AspXVI02zzuSAGpVBrYE+jreg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=svGCRGfQ1466A0x/4rdHfYOG5oKZH4aSvSrL95BLr4bLwQQ+dtYwN3KR/d5glhSAX
 4Duti7Wn3AbmyE11nEW9MXACf9vkdycbLNp58Lz6y0y1V0ASToCJPY/veO18Zw9xsT
 Oa2/OqeBLaJnEVTGVW/TWfcrfpRFiKBTm7k/CvZo=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvNy8xOSA2OjEzIFBNLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IE9uZSBvZiB0
aGUgbW9yZSBjb21tb24gY2FzZXMgb2YgYWxsb2NhdGlvbiBzaXplIGNhbGN1bGF0aW9ucyBpcyBm
aW5kaW5nCj4gdGhlIHNpemUgb2YgYSBzdHJ1Y3R1cmUgdGhhdCBoYXMgYSB6ZXJvLXNpemVkIGFy
cmF5IGF0IHRoZSBlbmQsIGFsb25nCj4gd2l0aCBtZW1vcnkgZm9yIHNvbWUgbnVtYmVyIG9mIGVs
ZW1lbnRzIGZvciB0aGF0IGFycmF5LiBGb3IgZXhhbXBsZToKPiAKPiBzdHJ1Y3QgbW1wX3BhdGgg
ewo+IAkuLi4KPiAgICAgICAgIHN0cnVjdCBtbXBfb3ZlcmxheSBvdmVybGF5c1swXTsKPiB9Owo+
IAo+IHNpemUgPSBzaXplb2Yoc3RydWN0IG1tcF9wYXRoKSArIGNvdW50ICogc2l6ZW9mKHN0cnVj
dCBtbXBfb3ZlcmxheSk7Cj4gaW5zdGFuY2UgPSBremFsbG9jKHNpemUsIEdGUF9LRVJORUwpCj4g
Cj4gSW5zdGVhZCBvZiBsZWF2aW5nIHRoZXNlIG9wZW4tY29kZWQgYW5kIHByb25lIHRvIHR5cGUg
bWlzdGFrZXMsIHdlIGNhbgo+IG5vdyB1c2UgdGhlIG5ldyBzdHJ1Y3Rfc2l6ZSgpIGhlbHBlcjoK
PiAKPiBpbnN0YW5jZSA9IGt6YWxsb2Moc3RydWN0X3NpemUoaW5zdGFuY2UsIG92ZXJsYXlzLCBj
b3VudCksIEdGUF9LRVJORUwpCj4gCj4gTm90aWNlIHRoYXQsIGluIHRoaXMgY2FzZSwgdmFyaWFi
bGUgc2l6ZSBpcyBub3QgbmVjZXNzYXJ5LCBoZW5jZSBpdAo+IGlzIHJlbW92ZWQuCj4gCj4gVGhp
cyBjb2RlIHdhcyBkZXRlY3RlZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4K
UGF0Y2ggcXVldWVkIGZvciB2NS40LCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21p
ZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVs
ZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
